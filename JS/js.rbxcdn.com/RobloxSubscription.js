! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "c3031c481b0db2e23aa1df8a9de4af34f411522e"
        };
        var n = (new t.Error).stack;
        n && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[n] = "8e78cc80-c797-4d46-90f6-7d46d025875e", t._sentryDebugIdIdentifier = "sentry-dbid-8e78cc80-c797-4d46-90f6-7d46d025875e")
    } catch (t) {}
}(),
function() {
    "use strict";
    var t = {
            964: function(t, n) {
                Object.defineProperty(n, "__esModule", {
                    value: !0
                });
                var r, i, a, o = {
                        exports: {}
                    },
                    s = o.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (t) {
                    r = l
                }
                try {
                    i = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (t) {
                    i = c
                }

                function u(t) {
                    if (r === setTimeout) return setTimeout(t, 0);
                    if ((r === l || !r) && setTimeout) return r = setTimeout, setTimeout(t, 0);
                    try {
                        return r(t, 0)
                    } catch (n) {
                        try {
                            return r.call(null, t, 0)
                        } catch (n) {
                            return r.call(this, t, 0)
                        }
                    }
                }
                var d = [],
                    f = !1,
                    p = -1;

                function m() {
                    f && a && (f = !1, a.length ? d = a.concat(d) : p = -1, d.length && h())
                }

                function h() {
                    if (!f) {
                        var t = u(m);
                        f = !0;
                        for (var n = d.length; n;) {
                            for (a = d, d = []; ++p < n;) a && a[p].run();
                            p = -1, n = d.length
                        }
                        a = null, f = !1,
                            function(t) {
                                if (i === clearTimeout) return clearTimeout(t);
                                if ((i === c || !i) && clearTimeout) return i = clearTimeout, clearTimeout(t);
                                try {
                                    i(t)
                                } catch (n) {
                                    try {
                                        return i.call(null, t)
                                    } catch (n) {
                                        return i.call(this, t)
                                    }
                                }
                            }(t)
                    }
                }

                function v(t, n) {
                    this.fun = t, this.array = n
                }

                function y() {}

                function b() {}
                s.nextTick = function(t) {
                    var n = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) n[r - 1] = arguments[r];
                    d.push(new v(t, n)), 1 !== d.length || f || u(h)
                }, v.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, s.title = "browser", s.browser = !0, s.env = {}, s.argv = [], s.version = "", s.versions = {}, s.on = y, s.addListener = y, s.once = y, s.off = y, s.removeListener = y, s.removeAllListeners = y, s.emit = y, s.prependListener = y, s.prependOnceListener = y, s.listeners = function(t) {
                    return []
                }, s.binding = function(t) {
                    throw Error("process.binding is not supported")
                }, s.cwd = function() {
                    return "/"
                }, s.chdir = function(t) {
                    throw Error("process.chdir is not supported")
                }, s.umask = function() {
                    return 0
                };
                var g = o.exports.browser,
                    x = o.exports.binding,
                    w = {},
                    S = "browser",
                    E = "browser",
                    P = "browser",
                    T = [],
                    O = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: g,
                        env: o.exports.env,
                        argv: o.exports.argv,
                        version: o.exports.version,
                        versions: o.exports.versions,
                        on: o.exports.on,
                        addListener: o.exports.addListener,
                        once: o.exports.once,
                        off: o.exports.off,
                        removeListener: o.exports.removeListener,
                        removeAllListeners: o.exports.removeAllListeners,
                        emit: o.exports.emit,
                        emitWarning: b,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: x,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: b,
                        pid: 1,
                        features: w,
                        kill: b,
                        dlopen: b,
                        uptime: b,
                        memoryUsage: b,
                        uvCounters: b,
                        platform: S,
                        arch: E,
                        execPath: P,
                        execArgv: T
                    };
                n.addListener = o.exports.addListener, n.arch = E, n.argv = o.exports.argv, n.binding = x, n.browser = g, n.chdir = o.exports.chdir, n.cwd = o.exports.cwd, n.default = O, n.dlopen = b, n.emit = o.exports.emit, n.emitWarning = b, n.env = o.exports.env, n.execArgv = T, n.execPath = P, n.exit = b, n.features = w, n.kill = b, n.listeners = o.exports.listeners, n.memoryUsage = b, n.nextTick = o.exports.nextTick, n.off = o.exports.off, n.on = o.exports.on, n.once = o.exports.once, n.pid = 1, n.platform = S, n.prependListener = o.exports.prependListener, n.prependOnceListener = o.exports.prependOnceListener, n.removeAllListeners = o.exports.removeAllListeners, n.removeListener = o.exports.removeListener, n.title = o.exports.title, n.umask = o.exports.umask, n.uptime = b, n.uvCounters = b, n.version = o.exports.version, n.versions = o.exports.versions, n = t.exports = O
            },
            160: function(t, n, r) {
                t.exports = {}
            }
        },
        n = {};

    function r(i) {
        var a = n[i];
        if (void 0 !== a) return a.exports;
        var o = n[i] = {
            exports: {}
        };
        return t[i](o, o.exports, r), o.exports
    }
    r.m = t, r.n = function(t) {
        var n = t && t.__esModule ? function() {
            return t.default
        } : function() {
            return t
        };
        return r.d(n, {
            a: n
        }), n
    }, r.d = function(t, n) {
        for (var i in n) r.o(n, i) && !r.o(t, i) && Object.defineProperty(t, i, {
            enumerable: !0,
            get: n[i]
        })
    }, r.k = function(t) {
        return "" + t + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (t) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(t, n) {
        return Object.prototype.hasOwnProperty.call(t, n)
    }, r.r = function(t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, r.nc = void 0, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (i = r.g.location + "");
    var i, a = r.g.document;
    if (!i && a && (a.currentScript && "SCRIPT" === a.currentScript.tagName.toUpperCase() && (i = a.currentScript.src), !i)) {
        var o = a.getElementsByTagName("script");
        if (o.length)
            for (var s = o.length - 1; s > -1 && (!i || !/^http(s?):/.test(i));) i = o[s--].src
    }
    if (!i) throw Error("Automatic publicPath is not supported in this browser");
    r.p = i.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            var t, n, i, a, o, s = window.ReactJSX,
                l = window.Roblox["core-scripts"].react,
                c = window.Roblox["core-scripts"].util.ready,
                u = r.n(c),
                d = JSON.parse('{"P":["Feature.RobloxSubscription"]}'),
                f = window.TanstackQuery;

            function p(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }
            var m = function(t, n) {
                return (m = Object.setPrototypeOf || p({
                    __proto__: []
                }, Array) && function(t, n) {
                    t.__proto__ = n
                } || function(t, n) {
                    for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
                })(t, n)
            };

            function h(t, n) {
                if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

                function r() {
                    this.constructor = t
                }
                m(t, n), t.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
            }
            var v = function() {
                return (v = Object.assign || function(t) {
                    for (var n, r = 1, i = arguments.length; r < i; r++)
                        for (var a in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, a) && (t[a] = n[a]);
                    return t
                }).apply(this, arguments)
            };

            function y(t, n, r, i) {
                return new(r || (r = Promise))(function(a, o) {
                    function s(t) {
                        try {
                            c(i.next(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function l(t) {
                        try {
                            c(i.throw(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function c(t) {
                        var n;
                        t.done ? a(t.value) : (p(n = t.value, r) ? n : new r(function(t) {
                            t(n)
                        })).then(s, l)
                    }
                    c((i = i.apply(t, n || [])).next())
                })
            }

            function b(t, n) {
                var r, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (r = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = n.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function g(t, n, r) {
                if (r || 2 == arguments.length)
                    for (var i, a = 0, o = n.length; a < o; a++) !i && a in n || (i || (i = Array.prototype.slice.call(n, 0, a)), i[a] = n[a]);
                return t.concat(i || Array.prototype.slice.call(n))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var x = {
                    envName: ""
                },
                w = !1,
                S = function() {
                    try {
                        if ("undefined" == typeof window) return v({}, x);
                        var t = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == t) return v({}, x);
                        var n = JSON.parse(t);
                        if ("object" != (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) || null === n) return v({}, x);
                        var r = v(v({}, x), "envName" in n && "string" == typeof n.envName && {
                            envName: n.envName
                        });
                        return r.envName && !w && (w = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (t) {
                        return v({}, x)
                    }
                },
                E = "mrrouter-env",
                P = "tracestate",
                T = "traceparent",
                O = function(t) {
                    var n = t.indexOf("=");
                    return (-1 === n ? t : t.slice(0, n)).trim()
                },
                N = function(t, n) {
                    var r = "".concat(E, "=").concat(encodeURIComponent(n)),
                        i = null == t ? void 0 : t.trim(),
                        a = i ? i.split(",") : [],
                        o = a.findIndex(function(t) {
                            return O(t) === E
                        });
                    if (-1 === o) return g(g([], a.map(function(t) {
                        return t.trim()
                    }), !0), [r], !1).join(",");
                    var s = a.filter(function(t) {
                        return O(t) !== E
                    }).map(function(t) {
                        return t.trim()
                    });
                    return s.splice(o, 0, r), s.join(",")
                },
                j = function(t) {
                    var n = new Uint8Array(t);
                    return crypto.getRandomValues(n), Array.from(n, function(t) {
                        return t.toString(16).padStart(2, "0")
                    }).join("")
                },
                I = "undefined" != typeof crypto && "function" == typeof crypto.randomUUID,
                C = function() {
                    return I ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : j(16)
                },
                D = function() {
                    return I ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : j(8)
                },
                A = function(t) {
                    var n = S().envName;
                    if (n.length > 0 && (t[P] = N(t[P], n), !t[T])) {
                        var r = C(),
                            i = D();
                        t[T] = "00-".concat(r, "-").concat(i, "-01")
                    }
                };

            function k(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }
            r(964);
            var R, M = function(t) {
                    return t.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                _ = function(t, n) {
                    return !1 === n.ok && !1 === [401, 403, 404].includes(n.status) && t(Error("Network error"), {
                        tags: {
                            apiUrl: M(n.url),
                            apiStatus: null == n ? void 0 : n.status,
                            cors: !1
                        }
                    }), n
                },
                L = function(t, n) {
                    t(Error("Network error"), {
                        tags: {
                            apiUrl: M(n),
                            cors: !0
                        }
                    })
                },
                U = function() {
                    function t(t) {
                        this.captureException = t
                    }
                    return t.prototype.post = function(t) {
                        return y(this, void 0, void 0, function() {
                            return b(this, function(n) {
                                return [2, _(this.captureException, t.response)]
                            })
                        })
                    }, t.prototype.onError = function(t) {
                        return y(this, void 0, void 0, function() {
                            return b(this, function(n) {
                                return L(this.captureException, t.url), [2]
                            })
                        })
                    }, t
                }(),
                B = function(t) {
                    if (document) {
                        var n, r, i = document.getElementById("hba-frame");
                        return null === i && ((n = document.createElement("iframe")).id = "hba-frame", n.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", n.src = "https://www.".concat(t, "/hba/iframe"), r = n, i = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), i
                    }
                    return null
                },
                F = function() {
                    var t = window.location.hostname.split(".").slice(0, -2).join(".");
                    return t.includes("create") ? "creator_hub" : t.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                z = function(t, n) {
                    try {
                        fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: n,
                                labelValues: {
                                    origin_site: F()
                                }
                            })
                        })
                    } catch (t) {}
                },
                G = function(t, n) {
                    try {
                        fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: n,
                                labelValues: {
                                    origin_site: F()
                                }
                            })
                        })
                    } catch (t) {}
                },
                W = function(t, n, r) {
                    return void 0 === r && (r = 1500), new Promise(function(i, a) {
                        var o, s, l = performance.now(),
                            c = window.setTimeout(function() {
                                z(t, performance.now() - l),
                                    function(t) {
                                        try {
                                            fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: F()
                                                    }
                                                })
                                            })
                                        } catch (t) {}
                                    }(t), a(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            u = o = function(n) {
                                var r = n.data;
                                n.origin === "https://www.".concat(t) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(c), z(t, performance.now() - l), i())
                            };
                        window.addEventListener("message", u, !1), null == (s = n.contentWindow) || s.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(t))
                    })
                },
                V = function(t, n, r, i, a, o, s) {
                    var l;
                    if (void 0 === s && (s = 100), window) {
                        var c, u = performance.now(),
                            d = window.setTimeout(function() {
                                G(r, performance.now() - u),
                                    function(t) {
                                        try {
                                            fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: F()
                                                    }
                                                })
                                            })
                                        } catch (t) {}
                                    }(r), t({
                                        url: a.url,
                                        init: a.init
                                    })
                            }, s),
                            f = c = function(n) {
                                var i = n.data,
                                    s = a.url,
                                    l = a.init;
                                if (n.origin === "https://www.".concat(r) && "dataFromHbaFrame" === i.msg && "batHeader" === i.data.type && (!i.data.identifier || i.data.identifier === o))
                                    if (!i.data.isError && i.data.batHeader) {
                                        window.clearTimeout(d), window.removeEventListener("message", c, !1), G(r, performance.now() - u);
                                        var f = i.data.batHeader;
                                        t({
                                            url: s,
                                            init: v(v({}, l), {
                                                headers: v(v({}, l.headers), {
                                                    "x-bound-auth-token": f["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(d), window.removeEventListener("message", c, !1), G(r, performance.now() - u), t({
                                        url: s,
                                        init: l
                                    })
                            };
                        window.addEventListener("message", f, !1), null == (l = i.contentWindow) || l.postMessage({
                            msg: "signSubdomainRequest",
                            identifier: o,
                            serializedSubdomainRequestData: JSON.stringify({
                                url: a.url,
                                requestInit: a.init
                            })
                        }, "https://www.".concat(r))
                    }
                },
                q = function() {
                    return crypto.randomUUID()
                },
                K = function() {
                    function t(t, n, r) {
                        void 0 === n && (n = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = t, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = n, this.dataTimeOut = r
                    }
                    return t.prototype.getOrCreateHbaFrame = function() {
                        return B(this.robloxSiteDomain)
                    }, t.prototype.pre = function(t) {
                        var n = this;
                        return new Promise(function(r, i) {
                            var a = t.url,
                                o = t.init;
                            if (n.hbaFrame = n.getOrCreateHbaFrame(), null !== n.hbaFrame) {
                                var s = q();
                                n.hbaFrameAlreadyLoaded ? V(r, 0, n.robloxSiteDomain, n.hbaFrame, t, s, n.dataTimeOut) : n.hbaFrameLoadFailed ? r({
                                    url: a,
                                    init: o
                                }) : W(n.robloxSiteDomain, n.hbaFrame, n.loadTimeOut).then(function() {
                                    n.hbaFrame ? (n.hbaFrameAlreadyLoaded = !0, V(r, 0, n.robloxSiteDomain, n.hbaFrame, t, s, n.dataTimeOut)) : r({
                                        url: a,
                                        init: o
                                    })
                                }).catch(function() {
                                    n.hbaFrameLoadFailed = !0, r({
                                        url: a,
                                        init: o
                                    })
                                })
                            } else r({
                                url: a,
                                init: o
                            })
                        })
                    }, t
                }();
            (nP = R || (R = {})).UNKNOWN = "unknown", nP.INVALIDATED = "invalidated", nP.ABANDONED = "abandoned", nP.LOADFAILED = "loadfailed";
            var X = function(t) {
                    function n(n) {
                        var r = t.call(this, "challenge error for challenge kind ".concat(n.kind)) || this;
                        return r.parameters = n, r
                    }
                    return h(n, t), n.prototype.match = function(t) {
                        return this.parameters.kind === t.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(t.parameters.data)
                    }, n.prototype.matchAbandoned = function(t) {
                        return this.match(t) && t.parameters.kind === R.ABANDONED
                    }, n
                }(Error),
                H = "rblx-challenge-id",
                Y = "rblx-challenge-type",
                $ = "rblx-challenge-metadata",
                J = function(t, n) {
                    return 403 === t.status && t.headers.has(H) && t.headers.has(Y) && t.headers.has($) && "iframe" === n
                },
                Z = function(t) {
                    var n, r, i, a, o, s, l, c, u, d = t.url,
                        f = t.request,
                        p = t.response,
                        m = t.robloxSiteDomain,
                        h = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (n = p.headers.get(Y)) ? n : ""],
                            ["generic-challenge-id", null != (r = p.headers.get(H)) ? r : ""],
                            ["challenge-metadata-json", null != (i = p.headers.get($)) ? i : ""],
                            ["origin", null != (a = window.location.hostname.split(".").slice(0, -2).join(".")) ? a : ""]
                        ]), s = new URL("https://www.".concat(m, "/challenge/cdn/hybrid?").concat(o.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = s.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, c = l, document && document.body ? document.body.appendChild(c) : null);
                    return new Promise(function(t, n) {
                        window && h && (u = function(r) {
                            var i, a, o, s, l, c, u, m, h, y, b;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    n(new X({
                                        kind: R.ABANDONED,
                                        data: {
                                            challengeType: null != (i = p.headers.get(Y)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (u = r.data.genericChallengeResponse.data).challengeType && u.metadata ? t((m = u.metadata, fetch(d, v(v({}, f), {
                                        headers: v(v({}, f.headers), ((h = {})[H] = null != (y = p.headers.get(H)) ? y : "", h[$] = btoa(JSON.stringify(m)), h[Y] = null != (b = p.headers.get(Y)) ? b : "", h))
                                    })))) : n(new X({
                                        kind: R.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = p.headers.get(Y)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    n((u = r.data.genericChallengeResponse.data) && u.challengeType && u.metadata ? new X({
                                        kind: R.INVALIDATED,
                                        data: u
                                    }) : new X({
                                        kind: R.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = p.headers.get(Y)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (u = r.data.genericChallengeResponse.data).parsed && n(new X({
                                        kind: R.UNKNOWN,
                                        data: {
                                            challengeType: null != (s = p.headers.get(Y)) ? s : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (u = r.data.genericChallengeResponse.data).initialized && n(new X({
                                        kind: R.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = p.headers.get(Y)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (u = r.data.genericChallengeResponse.data).pageLoaded && n(new X({
                                        kind: R.LOADFAILED,
                                        data: {
                                            challengeType: null != (c = p.headers.get(Y)) ? c : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", u, !1))
                    }).finally(function() {
                        null == h || h.remove(), u && window.removeEventListener("message", u, !1)
                    })
                },
                Q = function() {
                    function t(t, n) {
                        void 0 === n && (n = "iframe"), this.robloxSiteDomain = t, this.genericChallengeMiddlewareType = n
                    }
                    return t.prototype.post = function(t) {
                        var n = t.url,
                            r = t.init,
                            i = t.response;
                        return J(i, this.genericChallengeMiddlewareType) ? Z({
                            url: n,
                            request: r,
                            response: i,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(i)
                    }, t
                }(),
                ee = function(t) {
                    var n = t.elapsedTime,
                        r = t.url,
                        i = t.status,
                        a = t.schemaPath;
                    return {
                        eventName: "apiVitals",
                        parameters: {
                            elapsedTime: String(n),
                            apiUrl: r,
                            statusCode: String(i),
                            schemaPath: a
                        }
                    }
                },
                et = function() {
                    function t(t) {
                        this.unifiedLogger = t
                    }
                    return t.prototype.post = function(t) {
                        return this.unifiedLogger.logApiVitalsEvent(ee({
                            elapsedTime: t.elapsedTime,
                            url: t.url,
                            status: t.response.status,
                            schemaPath: t.schemaPath
                        })), Promise.resolve(t.response)
                    }, t
                }(),
                en = "x-csrf-token",
                er = ["POST", "PATCH", "DELETE", "PUT"],
                ei = function() {
                    var t, n = "";
                    try {
                        "undefined" != typeof window && (n = null != (t = localStorage.getItem(en)) ? t : "")
                    } catch (t) {
                        console.warn("Error reading localStorage key “".concat(en, "”:"), t)
                    }
                    return n
                },
                ea = ei(),
                eo = function(t) {
                    try {
                        ea = t, "undefined" != typeof window && localStorage.setItem(en, t)
                    } catch (t) {
                        console.warn("Error setting localStorage key “".concat(en, "”:"), t)
                    }
                },
                es = function() {
                    function t() {
                        this.currentToken = ei()
                    }
                    return t.prototype.pre = function(t) {
                        var n, r = t.url,
                            i = t.init,
                            a = this.currentToken;
                        return i.headers && "object" == ((n = i.headers) && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) && en in i.headers && (a = i.headers[en]) && (this.currentToken = a, eo(a)), i.method && er.includes(i.method) ? Promise.resolve({
                            url: r,
                            init: this.prepareRequestInit(i)
                        }) : Promise.resolve({
                            url: r,
                            init: i
                        })
                    }, t.prototype.post = function(t) {
                        var n = t.fetch,
                            r = t.url,
                            i = t.init,
                            a = t.response,
                            o = a.headers.get(en);
                        return 403 === a.status && a.headers.has(en) && null !== o ? (this.currentToken = o, eo(o), n(r, this.prepareRequestInit(i))) : Promise.resolve(a)
                    }, t.prototype.prepareRequestInit = function(t) {
                        var n;
                        return v(v({}, t), {
                            headers: v(v({}, t.headers), ((n = {})[en] = this.currentToken, n))
                        })
                    }, t
                }(),
                el = [],
                ec = function(t) {
                    el = el.filter(function(n) {
                        return n !== t
                    })
                },
                eu = function(t) {
                    var n = t.url;
                    503 === t.status && el.forEach(function(t) {
                        return t(n)
                    })
                },
                ed = function() {
                    function t() {}
                    return t.prototype.subscribe = function(t) {
                        return el.push(t),
                            function() {
                                return ec(t)
                            }
                    }, t.prototype.unsubscribe = function(t) {
                        return ec(t)
                    }, t.prototype.post = function(t) {
                        var n = t.response;
                        return eu(n), Promise.resolve(n)
                    }, t
                }(),
                ef = function() {
                    function t() {}
                    return t.prototype.pre = function(t) {
                        var n = t.url,
                            r = t.init;
                        if (!S().envName) return Promise.resolve({
                            url: n,
                            init: r
                        });
                        var i = v({}, r.headers);
                        return A(i), Promise.resolve({
                            url: n,
                            init: v(v({}, r), {
                                headers: i
                            })
                        })
                    }, t
                }(),
                ep = new es,
                em = new ed,
                eh = [function(t) {
                    return t.captureException ? new U(t.captureException) : void 0
                }, function(t) {
                    return t.robloxSiteDomain && t.enableBoundAuthToken ? new K(t.robloxSiteDomain, t.boundAuthTokenLoadTimeout, t.boundAuthTokenDataTimeout) : void 0
                }, function(t) {
                    return t.robloxSiteDomain ? new Q(t.robloxSiteDomain, t.genericChallengeMiddlewareType) : void 0
                }, function(t) {
                    return t.unifiedLogger ? new et(t.unifiedLogger) : void 0
                }, function() {
                    return ep
                }, function() {
                    return em
                }, function(t) {
                    return t.enableMrRouter ? new ef : void 0
                }],
                ev = function() {
                    function t(t) {
                        void 0 === t && (t = {}), this.configuration = t
                    }
                    return Object.defineProperty(t.prototype, "config", {
                        set: function(t) {
                            this.configuration = t
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "basePath", {
                        get: function() {
                            return this.configuration.basePath
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "fetchApi", {
                        get: function() {
                            return this.configuration.fetchApi || window.fetch.bind(window)
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "middleware", {
                        get: function() {
                            return this.configuration.middleware || []
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "queryParamsStringify", {
                        get: function() {
                            return this.configuration.queryParamsStringify || function t(n, r) {
                                return void 0 === r && (r = ""), Object.keys(n).map(function(i) {
                                    return function n(r, i, a) {
                                        void 0 === a && (a = "");
                                        var o = a + (a.length ? "[".concat(r, "]") : r);
                                        if (k(i, Array)) {
                                            var s = i.map(function(t) {
                                                return encodeURIComponent(String(t))
                                            }).join("&".concat(encodeURIComponent(o), "="));
                                            return "".concat(encodeURIComponent(o), "=").concat(s)
                                        }
                                        return k(i, Set) ? n(r, Array.from(i), a) : k(i, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(i.toISOString())) : k(i, Object) ? t(i, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(i)))
                                    }(i, n[i], r)
                                }).filter(function(t) {
                                    return t.length > 0
                                }).join("&")
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "username", {
                        get: function() {
                            return this.configuration.username
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "password", {
                        get: function() {
                            return this.configuration.password
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "apiKey", {
                        get: function() {
                            var t = this.configuration.apiKey;
                            if (t) return "function" == typeof t ? t : function() {
                                return t
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "accessToken", {
                        get: function() {
                            var t = this,
                                n = this.configuration.accessToken;
                            if (n) return "function" == typeof n ? n : function() {
                                return y(t, void 0, void 0, function() {
                                    return b(this, function(t) {
                                        return [2, n]
                                    })
                                })
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "headers", {
                        get: function() {
                            return this.configuration.headers
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "credentials", {
                        get: function() {
                            return this.configuration.credentials
                        },
                        enumerable: !1,
                        configurable: !0
                    }), t
                }(),
                ey = new ev,
                eb = function() {
                    function t(t) {
                        void 0 === t && (t = ey);
                        var n = this;
                        this.configuration = t, this.fetchApi = function(t, r, i) {
                            return y(n, void 0, void 0, function() {
                                var n, a, o, s, l, c, u, d, f, p, m, h, y, g = this;
                                return b(this, function(b) {
                                    switch (b.label) {
                                        case 0:
                                            n = function(t, n) {
                                                return g.fetchApi(t, n, i)
                                            }, a = {
                                                url: t,
                                                init: r
                                            }, o = 0, s = this.middleware, b.label = 1;
                                        case 1:
                                            return o < s.length ? (y = s[o]).pre ? [4, y.pre(v({
                                                fetch: n
                                            }, a))] : [3, 3] : [3, 4];
                                        case 2:
                                            a = b.sent() || a, b.label = 3;
                                        case 3:
                                            return o++, [3, 1];
                                        case 4:
                                            l = void 0, c = performance.now(), b.label = 5;
                                        case 5:
                                            return b.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(a.url, a.init)];
                                        case 6:
                                            return l = b.sent(), u = performance.now(), [3, 12];
                                        case 7:
                                            d = b.sent(), u = performance.now(), f = 0, p = this.middleware, b.label = 8;
                                        case 8:
                                            return f < p.length ? (y = p[f]).onError ? [4, y.onError({
                                                fetch: n,
                                                url: a.url,
                                                init: a.init,
                                                error: d,
                                                response: l ? l.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            l = b.sent() || l, b.label = 10;
                                        case 10:
                                            return f++, [3, 8];
                                        case 11:
                                            if (void 0 === l) throw k(d, Error) ? new ex(d, "The request failed and the interceptors did not return an alternative response") : d;
                                            return [3, 12];
                                        case 12:
                                            m = 0, h = this.middleware, b.label = 13;
                                        case 13:
                                            return m < h.length ? (y = h[m]).post ? [4, y.post({
                                                fetch: n,
                                                url: a.url,
                                                init: a.init,
                                                response: l.clone(),
                                                elapsedTime: u - c,
                                                schemaPath: i
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            l = b.sent() || l, b.label = 15;
                                        case 15:
                                            return m++, [3, 13];
                                        case 16:
                                            return [2, l]
                                    }
                                })
                            })
                        }, this.middleware = t.middleware
                    }
                    return t.prototype.withMiddleware = function() {
                        for (var t, n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
                        var i = this.clone();
                        return i.middleware = (t = i.middleware).concat.apply(t, n), i
                    }, t.prototype.withPreMiddleware = function() {
                        for (var t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                        var r = t.map(function(t) {
                            return {
                                pre: t
                            }
                        });
                        return this.withMiddleware.apply(this, r)
                    }, t.prototype.withPostMiddleware = function() {
                        for (var t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                        var r = t.map(function(t) {
                            return {
                                post: t
                            }
                        });
                        return this.withMiddleware.apply(this, r)
                    }, t.prototype.isJsonMime = function(n) {
                        return !!n && t.jsonRegex.test(n)
                    }, t.prototype.request = function(t, n) {
                        return y(this, void 0, void 0, function() {
                            var r, i, a, o;
                            return b(this, function(s) {
                                switch (s.label) {
                                    case 0:
                                        return [4, this.createFetchParams(t, n)];
                                    case 1:
                                        return i = (r = s.sent()).url, a = r.init, [4, this.fetchApi(i, a, t.schemaPath)];
                                    case 2:
                                        if ((o = s.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                        throw new eg(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                                }
                            })
                        })
                    }, t.prototype.createFetchParams = function(t, n) {
                        return y(this, void 0, void 0, function() {
                            var r, i, a, o, s, l, c, u = this;
                            return b(this, function(d) {
                                var f, p;
                                switch (d.label) {
                                    case 0:
                                        return r = this.configuration.basePath + t.path, void 0 !== t.query && 0 !== Object.keys(t.query).length && (r += "?" + this.configuration.queryParamsStringify(t.query)), Object.keys(i = Object.assign({}, this.configuration.headers, t.headers)).forEach(function(t) {
                                            return void 0 === i[t] ? delete i[t] : {}
                                        }), a = "function" == typeof n ? n : function() {
                                            return y(u, void 0, void 0, function() {
                                                return b(this, function(t) {
                                                    return [2, n]
                                                })
                                            })
                                        }, o = {
                                            method: t.method,
                                            headers: i,
                                            body: t.body,
                                            credentials: this.configuration.credentials
                                        }, l = [v({}, o)], [4, a({
                                            init: o,
                                            context: t
                                        })];
                                    case 1:
                                        return s = v.apply(void 0, l.concat([d.sent()])), c = v(v({}, s), {
                                            body: (f = s.body, "undefined" != typeof FormData && k(f, FormData) || k(s.body, URLSearchParams) || (p = s.body, "undefined" != typeof Blob && k(p, Blob)) ? s.body : JSON.stringify(s.body))
                                        }), [2, {
                                            url: r,
                                            init: c
                                        }]
                                }
                            })
                        })
                    }, t.prototype.clone = function() {
                        var t = new(0, this.constructor)(this.configuration);
                        return t.middleware = this.middleware.slice(), t
                    }, t.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), t
                }(),
                eg = function(t) {
                    function n(n, r) {
                        var i = t.call(this, r) || this;
                        return i.response = n, i.name = "ResponseError", i
                    }
                    return h(n, t), n
                }(Error),
                ex = function(t) {
                    function n(n, r) {
                        var i = t.call(this, r) || this;
                        return i.cause = n, i.name = "FetchError", i
                    }
                    return h(n, t), n
                }(Error),
                ew = function(t) {
                    function n(n, r) {
                        var i = t.call(this, r) || this;
                        return i.field = n, i.name = "RequiredError", i
                    }
                    return h(n, t), n
                }(Error);

            function eS(t, n) {
                return null != t[n]
            }
            var eE = function() {
                    function t(t, n) {
                        void 0 === n && (n = function(t) {
                            return t
                        }), this.raw = t, this.transformer = n
                    }
                    return t.prototype.value = function() {
                        return y(this, void 0, void 0, function() {
                            var t;
                            return b(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return t = this.transformer, [4, this.raw.json()];
                                    case 1:
                                        return [2, t.apply(this, [n.sent()])]
                                }
                            })
                        })
                    }, t
                }(),
                eP = ((function(t) {
                    this.raw = t
                }).prototype.value = function() {
                    return y(this, void 0, void 0, function() {
                        return b(this, function(t) {
                            return [2, void 0]
                        })
                    })
                }, (function(t) {
                    this.raw = t
                }).prototype.value = function() {
                    return y(this, void 0, void 0, function() {
                        return b(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, this.raw.blob()];
                                case 1:
                                    return [2, t.sent()]
                            }
                        })
                    })
                }, (function(t) {
                    this.raw = t
                }).prototype.value = function() {
                    return y(this, void 0, void 0, function() {
                        return b(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, this.raw.text()];
                                case 1:
                                    return [2, t.sent()]
                            }
                        })
                    })
                }, function(t) {
                    function n(n) {
                        void 0 === n && (n = {});
                        var r, i = v({}, n),
                            a = i.middleware || [];
                        return a.unshift.apply(a, (r = n, eh.map(function(t) {
                            return t(r)
                        }).filter(function(t) {
                            return t
                        }))), i.middleware = a, t.call(this, i) || this
                    }
                    return h(n, t), n
                }(ev));

            function eT(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }
            var eO = function(t, n) {
                return (eO = Object.setPrototypeOf || eT({
                    __proto__: []
                }, Array) && function(t, n) {
                    t.__proto__ = n
                } || function(t, n) {
                    for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
                })(t, n)
            };

            function eN(t, n, r, i) {
                return new(r || (r = Promise))(function(a, o) {
                    function s(t) {
                        try {
                            c(i.next(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function l(t) {
                        try {
                            c(i.throw(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function c(t) {
                        var n;
                        t.done ? a(t.value) : (eT(n = t.value, r) ? n : new r(function(t) {
                            t(n)
                        })).then(s, l)
                    }
                    c((i = i.apply(t, n || [])).next())
                })
            }

            function ej(t, n) {
                var r, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (r = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = n.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function eI(t) {
                return t
            }
            "function" == typeof SuppressedError && SuppressedError;

            function eC(t, n) {
                return null == t ? t : {
                    currencyCode: t.currencyCode,
                    units: t.units,
                    nanos: t.nanos
                }
            }

            function eD(t) {
                return t
            }

            function eA(t) {
                var n, r;
                return null == (n = t) ? n : {
                    offerType: eS(n, "offerType") ? n.offerType : void 0,
                    freeTrialOffer: eS(n, "freeTrialOffer") ? null == (r = n.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: eS(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var ek = "Blackbird";

            function eR(t) {
                var n;
                return null == (n = t) ? n : {
                    type: n.type,
                    id: n.id
                }
            }

            function eM(t) {
                var n;
                return null == (n = t) ? n : {
                    tierId: n.tierId,
                    periodIndex: n.periodIndex,
                    discountPercent: n.discountPercent
                }
            }

            function e_(t) {
                var n, r, i, a, o, s, l;
                return null == (n = t) ? n : {
                    productKey: eR(n.productKey),
                    periodType: n.periodType,
                    periodCount: n.periodCount,
                    localizedPrice: eC(n.localizedPrice),
                    localizedPriceDisplayString: n.localizedPriceDisplayString,
                    localizedStrikethroughPrice: eC(n.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: n.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = n.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: eS(r, "currencySubscriptionProductDetails") ? null == (i = r.currencySubscriptionProductDetails) ? i : {
                            currencyType: i.currencyType,
                            entitledAmountMicros: i.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: eS(r, "developerSubscriptionProductDetails") ? null == (a = r.developerSubscriptionProductDetails) ? a : {
                            universeId: a.universeId,
                            imageAssetId: a.imageAssetId,
                            localizedName: a.localizedName,
                            localizedDescription: a.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: eS(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (s = o.featureConfig) ? s : {
                                virtualTransactionDiscounts: null === s.virtualTransactionDiscounts ? null : s.virtualTransactionDiscounts.map(eM),
                                isRobuxTransferEnabled: s.isRobuxTransferEnabled,
                                isTradingEnabled: s.isTradingEnabled,
                                isUgcPublishingEnabled: s.isUgcPublishingEnabled,
                                privateServerDiscounts: null === s.privateServerDiscounts ? null : s.privateServerDiscounts.map(eM),
                                currencySubscriptionConfig: null == (l = s.currencySubscriptionConfig) ? l : {
                                    currencyType: l.currencyType,
                                    entitledAmountMicros: l.entitledAmountMicros
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: n.eligibleOffers.map(eA)
                }
            }

            function eL(t) {
                var n, r, i, a, o, s, l;
                return null == (n = t) ? n : {
                    productKey: eR(n.productKey),
                    periodType: n.periodType,
                    displayPrice: eC(n.displayPrice),
                    activationTimestampMs: n.activationTimestampMs,
                    expirationTimestampMs: n.expirationTimestampMs,
                    nextRenewalTimestampMs: n.nextRenewalTimestampMs,
                    paymentProvider: eD(n.paymentProvider),
                    purchasePlatform: n.purchasePlatform,
                    paymentProfile: null == (r = n.paymentProfile) ? r : {
                        id: r.id,
                        cardInfo: null == (i = r.cardInfo) ? i : {
                            cardNetwork: i.cardNetwork,
                            lastFourDigits: i.lastFourDigits,
                            expirationMonth: i.expirationMonth,
                            expirationYear: i.expirationYear
                        }
                    },
                    activeOffers: n.activeOffers.map(eA),
                    productTypeMembershipDetails: null == (a = n.productTypeMembershipDetails) ? a : {
                        robloxSubscriptionMembershipDetails: eS(a, "robloxSubscriptionMembershipDetails") ? null == (o = a.robloxSubscriptionMembershipDetails) ? o : {
                            features: null == (s = o.features) ? s : {
                                productType: s.productType,
                                virtualTransactionDiscountTierId: s.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: s.isRobuxTransferEnabled,
                                isTradingEnabled: s.isTradingEnabled,
                                isUgcPublishingEnabled: s.isUgcPublishingEnabled,
                                privateServerDiscountTierId: s.privateServerDiscountTierId
                            },
                            currencySubscriptionBenefit: null == (l = o.currencySubscriptionBenefit) ? l : {
                                currencyType: l.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: l.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: l.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: e_(n.productInfo)
                }
            }
            var eU = function(t) {
                    function n() {
                        return null !== t && t.apply(this, arguments) || this
                    }
                    return function(t, n) {
                        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

                        function r() {
                            this.constructor = t
                        }
                        eO(t, n), t.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
                    }(n, t), n.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            var r, i;
                            return ej(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new ew("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new ew("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, i = {}, void 0 !== t.robloxPlaceId && null !== t.robloxPlaceId && (i["Roblox-Place-Id"] = String(t.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "GET",
                                            headers: i,
                                            query: r
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            return null == t ? t : {
                                                displayPrice: eC(t.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2GetProductDisplayPrice = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            return ej(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductDisplayPriceRaw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2GetProductPaymentMetadataRaw = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            var r, i;
                            return ej(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new ew("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new ew("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, i = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "GET",
                                            headers: i,
                                            query: r
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            return null == t ? t : {
                                                paymentMethods: t.paymentMethods.map(eI),
                                                paymentProviders: t.paymentProviders.map(eD)
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2GetProductPaymentMetadata = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            return ej(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductPaymentMetadataRaw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2GetSubscriptionProductInfoRaw = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            var r, i;
                            return ej(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new ew("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new ew("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, i = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "GET",
                                            headers: i,
                                            query: r
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            return null == t ? t : {
                                                subscriptionProductInfo: e_(t.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2GetSubscriptionProductInfo = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            return ej(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetSubscriptionProductInfoRaw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2ListAvailableSubscriptionProductsRaw = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            var r, i;
                            return ej(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return r = {}, void 0 !== t.productType && (r.ProductType = t.productType), void 0 !== t.includePurchased && (r.IncludePurchased = t.includePurchased), void 0 !== t.includeBundles && (r.IncludeBundles = t.includeBundles), void 0 !== t.purchasePlatform && (r.PurchasePlatform = t.purchasePlatform), void 0 !== t.skipEligibilityCheck && (r.SkipEligibilityCheck = t.skipEligibilityCheck), void 0 !== t.grantType && (r.GrantType = t.grantType), void 0 !== t.paymentProvider && (r.PaymentProvider = t.paymentProvider), i = {}, [4, this.request({
                                            path: "/v2/products",
                                            method: "GET",
                                            headers: i,
                                            query: r
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            return null == t ? t : {
                                                productKeys: t.productKeys.map(eR),
                                                products: t.products.map(e_)
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return eN(this, arguments, void 0, function(t, n) {
                            return void 0 === t && (t = {}), ej(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListAvailableSubscriptionProductsRaw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2ListSubscriptionsRaw = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            var r, i;
                            return ej(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return r = {}, void 0 !== t.productType && (r.ProductType = t.productType), void 0 !== t.expirationTimestampMsStart && (r.ExpirationTimestampMsStart = t.expirationTimestampMsStart), void 0 !== t.expirationTimestampMsEnd && (r.ExpirationTimestampMsEnd = t.expirationTimestampMsEnd), void 0 !== t.cursor && (r.Cursor = t.cursor), void 0 !== t.resultsPerPage && (r.ResultsPerPage = t.resultsPerPage), i = {}, [4, this.request({
                                            path: "/v2/user/subscriptions",
                                            method: "GET",
                                            headers: i,
                                            query: r
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            return null == t ? t : {
                                                subscriptions: t.subscriptions.map(eL),
                                                hasMore: t.hasMore,
                                                cursor: t.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2ListSubscriptions = function() {
                        return eN(this, arguments, void 0, function(t, n) {
                            return void 0 === t && (t = {}), ej(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListSubscriptionsRaw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2PreparePurchaseV2Raw = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            var r, i;
                            return ej(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new ew("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new ew("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== t.robloxUniverseId && null !== t.robloxUniverseId && (i["Roblox-Universe-Id"] = String(t.robloxUniverseId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "POST",
                                            headers: i,
                                            query: r,
                                            body: function(t) {
                                                if (void 0 !== t) return null === t ? null : {
                                                    paymentProvider: t.paymentProvider,
                                                    universeId: t.universeId,
                                                    paymentProviderPurchaseOptions: function(t) {
                                                        if (void 0 !== t) return null === t ? null : {
                                                            stripePurchaseOptions: function(t) {
                                                                if (void 0 !== t) return null === t ? null : {
                                                                    cancelUrlPathName: t.cancelUrlPathName,
                                                                    successUrlPathName: t.successUrlPathName
                                                                }
                                                            }(t.stripePurchaseOptions),
                                                            appleAppStorePurchaseOptions: function(t) {
                                                                if (void 0 !== t) return null === t ? null : {
                                                                    providerCountryCode: t.providerCountryCode
                                                                }
                                                            }(t.appleAppStorePurchaseOptions),
                                                            braintreePurchaseOptions: function(t) {
                                                                if (void 0 !== t) return null === t ? null : {
                                                                    paymentMethod: t.paymentMethod
                                                                }
                                                            }(t.braintreePurchaseOptions)
                                                        }
                                                    }(t.paymentProviderPurchaseOptions),
                                                    paymentSessionId: t.paymentSessionId
                                                }
                                            }(t.preparePurchaseV2Request)
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            var n, r, i, a, o, s;
                                            return null == t ? t : {
                                                paymentProvider: eD(t.paymentProvider),
                                                providerPurchasePayload: null == (n = t.providerPurchasePayload) ? n : {
                                                    stripePurchasePayload: eS(n, "stripePurchasePayload") ? null == (r = n.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: eS(n, "appleAppStorePurchasePayload") ? null == (i = n.appleAppStorePurchasePayload) ? i : {
                                                        appAccountToken: i.appAccountToken,
                                                        partnerBillingJwtToken: i.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: i.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: eS(n, "googlePlayStorePurchasePayload") ? null == (a = n.googlePlayStorePurchasePayload) ? a : {
                                                        providerProductId: a.providerProductId,
                                                        providerProductType: a.providerProductType,
                                                        chargeRequestId: a.chargeRequestId,
                                                        offerId: eS(a, "offerId") ? a.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: eS(n, "creditBalancePurchasePayload") ? null == (o = n.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl
                                                    } : void 0,
                                                    braintreePurchasePayload: eS(n, "braintreePurchasePayload") ? null == (s = n.braintreePurchasePayload) ? s : {
                                                        productToken: s.productToken,
                                                        price: s.price,
                                                        currencyCode: s.currencyCode,
                                                        clientAuthorizationToken: s.clientAuthorizationToken
                                                    } : void 0
                                                },
                                                nativeProviderPurchasePayloadString: t.nativeProviderPurchasePayloadString
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.subscriptionsV2PreparePurchaseV2 = function(t, n) {
                        return eN(this, void 0, void 0, function() {
                            return ej(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2PreparePurchaseV2Raw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n
                }(eb),
                eB = window.Roblox["core-scripts"].guac,
                eF = window.Roblox["core-scripts"].meta.device,
                ez = "roblox_subscription_redirect_url",
                eG = window.React,
                eW = r.n(eG),
                eV = function() {
                    return (eV = Object.assign || function(t) {
                        for (var n, r = 1, i = arguments.length; r < i; r++)
                            for (var a in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, a) && (t[a] = n[a]);
                        return t
                    }).apply(this, arguments)
                };

            function eq(t, n) {
                var r = {};
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && 0 > n.indexOf(i) && (r[i] = t[i]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var a = 0;
                    for (i = Object.getOwnPropertySymbols(t); a < i.length; a++) 0 > n.indexOf(i[a]) && Object.prototype.propertyIsEnumerable.call(t, i[a]) && (r[i[a]] = t[i[a]])
                }
                return r
            }
            var eK = function() {
                    for (var t, n, r = 0, i = "", a = arguments.length; r < a; r++)(t = arguments[r]) && (n = function t(n) {
                        var r, i, a = "";
                        if ("string" == typeof n || "number" == typeof n) a += n;
                        else if ("object" == (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n))
                            if (Array.isArray(n)) {
                                var o = n.length;
                                for (r = 0; r < o; r++) n[r] && (i = t(n[r])) && (a && (a += " "), a += i)
                            } else
                                for (i in n) n[i] && (a && (a += " "), a += i);
                        return a
                    }(t)) && (i && (i += " "), i += n);
                    return i
                },
                eX = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                eH = eW().forwardRef(function(t, n) {
                    var r = t.name,
                        i = t.size,
                        a = t.className,
                        o = (t.children, eq(t, ["name", "size", "className", "children"]));
                    return eW().createElement("span", Object.assign({
                        ref: n,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: eK("grow-0 shrink-0 basis-auto icon", r, eX[void 0 === i ? "Medium" : i], a)
                    }, o))
                });

            function eY(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function e$(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        i = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), i.forEach(function(n) {
                        var i;
                        i = r[n], n in t ? Object.defineProperty(t, n, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = i
                    })
                }
                return t
            }

            function eJ(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, i)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function eZ(t, n) {
                if (null == t) return {};
                var r, i, a = function(t, n) {
                    if (null == t) return {};
                    var r, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) r = o[i], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) r = o[i], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function eQ(t) {
                return function(t) {
                    if (Array.isArray(t)) return eY(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return eY(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eY(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e0(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function e1(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            eH.displayName = "Icon";
            var e2 = Symbol.for("react.lazy"),
                e3 = eG[" use ".trim().toString()];

            function e4(t) {
                var n;
                return null != t && "object" == (void 0 === t ? "undefined" : e0(t)) && "$$typeof" in t && t.$$typeof === e2 && "_payload" in t && "object" == e0(n = t._payload) && null !== n && "then" in n
            }
            var e5 = ((nE = eG.forwardRef(function(t, n) {
                    var r = t.children,
                        i = eZ(t, ["children"]);
                    if (e4(r) && "function" == typeof e3 && (r = e3(r._payload)), eG.isValidElement(r)) {
                        var a, o, s, l, c = (l = null == (o = Object.getOwnPropertyDescriptor((a = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? a.ref : (l = null == (s = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                            u = function(t, n) {
                                var r = e$({}, n);
                                for (var i in n) ! function(i) {
                                    var a = t[i],
                                        o = n[i];
                                    /^on[A-Z]/.test(i) ? a && o ? r[i] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        var i = o.apply(void 0, eQ(n));
                                        return a.apply(void 0, eQ(n)), i
                                    } : a && (r[i] = a) : "style" === i ? r[i] = e$({}, a, o) : "className" === i && (r[i] = [a, o].filter(Boolean).join(" "))
                                }(i);
                                return e$({}, t, r)
                            }(i, r.props);
                        return r.type !== eG.Fragment && (u.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return function(t) {
                                var r = !1,
                                    i = n.map(function(n) {
                                        var i = e1(n, t);
                                        return r || "function" != typeof i || (r = !0), i
                                    });
                                if (r) return function() {
                                    for (var t = 0; t < i.length; t++) {
                                        var r = i[t];
                                        "function" == typeof r ? r() : e1(n[t], null)
                                    }
                                }
                            }
                        }(n, c) : c), eG.cloneElement(r, u)
                    }
                    return eG.Children.count(r) > 1 ? eG.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), nT = nE, (nO = eG.forwardRef(function(t, n) {
                    var r = t.children,
                        i = eZ(t, ["children"]);
                    e4(r) && "function" == typeof e3 && (r = e3(r._payload));
                    var a = eG.Children.toArray(r),
                        o = a.find(e8);
                    if (o) {
                        var l = o.props.children,
                            c = a.map(function(t) {
                                return t === o ? eG.Children.count(l) > 1 ? eG.Children.only(null) : eG.isValidElement(l) ? l.props.children : null : t
                            });
                        return (0, s.jsx)(nT, eJ(e$({}, i), {
                            ref: n,
                            children: eG.isValidElement(l) ? eG.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, s.jsx)(nT, eJ(e$({}, i), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), nO),
                e6 = Symbol("radix.slottable");

            function e8(t) {
                return eG.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === e6
            }
            var e7 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                e9 = function(t) {
                    var n = t.className;
                    return eW().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: eK("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
                    })
                },
                te = "opacity-[0.5]";

            function tt(t, n) {
                void 0 === n && (n = {});
                var r = n.insertAt;
                if (t && "undefined" != typeof document) {
                    var i = document.head || document.getElementsByTagName("head")[0],
                        a = document.createElement("style");
                    a.type = "text/css", "top" === r && i.firstChild ? i.insertBefore(a, i.firstChild) : i.appendChild(a), a.styleSheet ? a.styleSheet.cssText = t : a.appendChild(document.createTextNode(t))
                }
            }
            tt("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var tn = function(t) {
                    var n = t.width,
                        r = t.height;
                    return eW().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, eW().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                tr = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ti = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                ta = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                to = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ts = (0, eG.forwardRef)(function(t, n) {
                    var r = t.children,
                        i = t.className,
                        a = t.style,
                        o = t.isDisabled,
                        s = void 0 !== o && o,
                        l = t.isLoading,
                        c = void 0 !== l && l,
                        u = t.icon,
                        d = t.size,
                        f = void 0 === d ? "Large" : d,
                        p = t.variant,
                        m = void 0 === p ? "Emphasis" : p,
                        h = t.asChild,
                        v = eq(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        y = eK("foundation-web-button", s ? te : [e7, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ti[f], s ? to[m] : ta[m], i),
                        b = Object.assign({
                            textDecoration: "none"
                        }, a),
                        g = function(t) {
                            return eW().createElement(eW().Fragment, null, eW().createElement(e9, null), c && eW().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, eW().createElement(tn, {
                                width: tr[f],
                                height: tr[f]
                            })), eW().createElement("span", {
                                className: eK("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, u && eW().createElement(eH, {
                                name: u,
                                size: f
                            }), eW().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (h) {
                        var x = eq(v, ["as"]),
                            w = eW().Children.only(r);
                        return eW().createElement(e5, Object.assign({
                            ref: n
                        }, x, {
                            className: y,
                            style: b,
                            "aria-disabled": s || void 0
                        }), eW().cloneElement(w, {}, g(w.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var S = v.href,
                            E = eq(v, ["as", "href"]);
                        return eW().createElement("a", Object.assign({
                            ref: n
                        }, E, {
                            "aria-disabled": s,
                            href: s ? void 0 : S,
                            className: y,
                            style: b
                        }), g(r))
                    }
                    var P = eq(v, ["as"]);
                    return eW().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, P, {
                        disabled: s,
                        className: y,
                        style: b
                    }), g(r))
                }),
                tl = function() {
                    var t = (0, l.useTranslation)().translate,
                        n = (0, eG.useCallback)(function() {
                            window.history.back()
                        }, []);
                    return (0, s.jsxs)("div", {
                        className: "height-[210px] gap-y-small margin-top-[240px] flex flex-col items-center",
                        children: [(0, s.jsx)(eH, {
                            className: "content-muted !size-1400",
                            name: "icon-regular-triangle-exclamation"
                        }), (0, s.jsx)("p", {
                            className: "text-heading-small",
                            children: t("Message.Error.Generic")
                        }), (0, s.jsxs)("div", {
                            className: "gap-x-medium padding-top-medium flex",
                            children: [(0, s.jsx)(ts, {
                                className: "min-width-[96px]",
                                size: "Small",
                                variant: "SoftEmphasis",
                                onClick: n,
                                children: t("Action.Back")
                            }), (0, s.jsx)(ts, {
                                as: "a",
                                className: "min-width-[96px]",
                                href: "/home",
                                size: "Small",
                                variant: "Standard",
                                children: t("Action.Home")
                            })]
                        })]
                    })
                };
            tt(".foundation-web-list-item-bottom-divider,.foundation-web-list-item-inset-divider{border-bottom:1px solid var(--color-stroke-default)}.foundation-web-list-item-inset-divider{bottom:0;height:1px;position:absolute;width:100%}.foundation-web-list-item:focus-visible{outline-offset:calc(var(--stroke-thicker)*-1)}.foundation-web-list{list-style:none;margin:0;padding:0}");
            var tc = (0, eG.createContext)(null),
                tu = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                td = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                tf = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                tp = (0, eG.forwardRef)(function(t, n) {
                    var r = t.isContained,
                        i = t.size,
                        a = t.divider,
                        o = t.alignment,
                        s = t.title,
                        l = t.isTitleBold,
                        c = t.text,
                        u = t.isMultiline,
                        d = t.metadata,
                        f = t.description,
                        p = t.leading,
                        m = t.trailing,
                        h = t.onSelect,
                        v = t.className,
                        y = void 0 === d && void 0 === f && void 0 === o && void 0 === i;
                    if ((void 0 !== c || void 0 !== u) && !y) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var b = null != i ? i : "Large",
                        g = void 0 !== h,
                        x = g ? "button" : "div",
                        w = !!y && u,
                        S = "Top" === o ? "justify-start" : "justify-center";
                    w && (S = "justify-start");
                    var E = eW().createElement(x, Object.assign({
                            className: eK("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === a && "foundation-web-list-item-bottom-divider", g && e7, g && "cursor-pointer", v)
                        }, g && {
                            onClick: function() {
                                return h()
                            }
                        }), g && eW().createElement(e9, null), p && eW().createElement("div", {
                            className: eK("flex flex-col padding-y-large", S)
                        }, p), eW().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, eW().createElement("div", {
                            className: eK("flex flex-col fill clip-x justify-center", w && "gap-xsmall")
                        }, s && eW().createElement("div", {
                            className: eK("content-emphasis text-align-x-start", void 0 === l || l ? td[b] : tf[b])
                        }, s), y && c && eW().createElement("div", {
                            className: eK("content-default text-align-x-start", tu[b], !u && "text-truncate-split text-no-wrap")
                        }, c), !y && d && eW().createElement("div", {
                            className: eK("content-default text-align-x-start text-truncate-split text-no-wrap", tu[b])
                        }, d), !y && f && eW().createElement("div", {
                            className: eK("content-default text-align-x-start padding-top-xsmall", tu[b])
                        }, f)), m && eW().createElement("div", {
                            className: eK("flex flex-col", S)
                        }, m), "Inset" === a && eW().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        P = (0, eG.useMemo)(function() {
                            return {
                                size: b
                            }
                        }, [b]);
                    return eW().createElement("li", {
                        ref: n,
                        style: {
                            listStyle: "none"
                        }
                    }, eW().createElement(tc.Provider, {
                        value: P
                    }, E))
                });
            tp.displayName = "ListItem";
            var tm = (0, eG.forwardRef)(function(t, n) {
                var r = t.children,
                    i = t.className,
                    a = t.as,
                    o = eq(t, ["children", "className", "as"]);
                return eW().createElement(void 0 === a ? "ul" : a, Object.assign({
                    ref: n,
                    className: eK("foundation-web-list", i)
                }, o), r)
            });
            tm.displayName = "List";
            var th = "height-full min-width-0 grow-1 gap-x-large radius-medium !bg-surface-100 stroke-standard stroke-default padding-medium box-border flex items-center",
                tv = function(t) {
                    var n = t.expandedPrimary,
                        r = t.expandedSecondary,
                        i = t.iconName,
                        a = t.onTileClick,
                        o = t.primary,
                        l = t.secondary,
                        c = (0, s.jsxs)(eG.Fragment, {
                            children: [(0, s.jsx)("div", {
                                className: "flex shrink-0 items-center justify-center",
                                children: (0, s.jsx)(eH, {
                                    name: i,
                                    size: "Large"
                                })
                            }), (0, s.jsxs)("div", {
                                className: "min-width-0 grow-1 gap-xsmall flex flex-col justify-center",
                                children: [(0, s.jsx)("div", {
                                    className: "text-title-medium content-emphasis text-align-x-start",
                                    children: o
                                }), (0, s.jsx)("div", {
                                    className: "text-body-medium content-default text-align-x-start",
                                    children: l
                                })]
                            })]
                        });
                    return (0, s.jsx)("li", {
                        className: "min-width-0 height-full flex list-none flex-col [list-style:none]",
                        children: null != a ? (0, s.jsx)("button", {
                            "aria-label": o,
                            className: "".concat(th, " width-full text-align-x-start cursor-pointer font-[inherit]"),
                            type: "button",
                            onClick: function() {
                                a(n, r)
                            },
                            children: c
                        }) : (0, s.jsx)("div", {
                            className: th,
                            children: c
                        })
                    })
                },
                ty = function(t) {
                    var n = t.featureConfig,
                        r = t.periodType,
                        i = t.overrideIconName,
                        a = t.onTileClick,
                        o = (0, l.useTranslation)(),
                        c = o.translate,
                        u = o.intl,
                        d = (0, eG.useMemo)(function() {
                            var t;
                            return null == (t = n.virtualTransactionDiscounts) ? void 0 : t.find(function(t) {
                                return 0 === t.periodIndex
                            })
                        }, [n]),
                        f = (0, eG.useMemo)(function() {
                            var t;
                            return null == (t = n.virtualTransactionDiscounts) ? void 0 : t.filter(function(t) {
                                return t.periodIndex > 0
                            }).reduce(function(t, n) {
                                return null === t || n.periodIndex < t.periodIndex ? n : t
                            }, null)
                        }, [n]),
                        p = (0, eG.useMemo)(function() {
                            var t;
                            return null == (t = n.privateServerDiscounts) ? void 0 : t.find(function(t) {
                                return 0 === t.periodIndex
                            })
                        }, [n]);
                    return (0, s.jsxs)(tm, {
                        className: "width-full large:[grid-template-columns:repeat(2,minmax(0,1fr))] grid gap-x-[12px] gap-y-[12px] [grid-template-columns:minmax(0,1fr)]",
                        children: [d && (0, s.jsx)(tv, {
                            expandedPrimary: c("Description.Benefit.DiscountBaseExpandedTitle"),
                            expandedSecondary: c("Description.Benefit.DiscountBaseExpandedBody"),
                            iconName: null != i ? i : "icon-regular-tag",
                            primary: c("Description.Benefit.DiscountBase", {
                                discountPercent: u.n(.01 * d.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: c("Description.Benefit.DiscountBaseSubtitle"),
                            onTileClick: a
                        }), f && (0, s.jsx)(tv, {
                            expandedPrimary: c("Description.Benefit.DiscountNextExpandedTitle"),
                            expandedSecondary: c("Description.Benefit.DiscountNextExpandedBody"),
                            iconName: null != i ? i : "icon-regular-tag-arrow-up",
                            primary: c("Description.Benefit.DiscountNext", {
                                productName: c("Label.Blackbird"),
                                discountPercent: u.n(.01 * f.discountPercent, {
                                    style: "percent"
                                }),
                                discountPeriodCount: u.n(f.periodIndex),
                                discountPeriodUnit: r
                            }),
                            secondary: c("Description.Benefit.DiscountNextSubtitle"),
                            onTileClick: a
                        }), p && (0, s.jsx)(tv, {
                            expandedPrimary: c("Description.Benefit.PrivateServersExpandedTitle"),
                            expandedSecondary: c("Description.Benefit.PrivateServersExpandedBody"),
                            iconName: null != i ? i : "icon-regular-controller",
                            primary: c("Description.Benefit.PrivateServers", {
                                discountPercent: u.n(.01 * p.discountPercent, {
                                    style: "percent"
                                })
                            }),
                            secondary: c("Description.Benefit.PrivateServersSubtitle"),
                            onTileClick: a
                        }), n.isRobuxTransferEnabled && (0, s.jsx)(tv, {
                            expandedPrimary: c("Description.Benefit.RobuxTransfersExpandedTitle"),
                            expandedSecondary: c("Description.Benefit.RobuxTransfersExpandedBody"),
                            iconName: null != i ? i : "icon-regular-robux",
                            primary: c("Description.Benefit.RobuxTransfers"),
                            secondary: c("Description.Benefit.RobuxTransfersSubtitle"),
                            onTileClick: a
                        }), n.isTradingEnabled && (0, s.jsx)(tv, {
                            expandedPrimary: c("Description.Benefit.TradeResellItemsExpandedTitle"),
                            expandedSecondary: c("Description.Benefit.TradeResellItemsExpandedBody"),
                            iconName: null != i ? i : "icon-regular-hand-two-arrows-horizontal",
                            primary: c("Description.Benefit.TradeResellItems"),
                            secondary: c("Description.Benefit.TradeResellItemsSubtitle"),
                            onTileClick: a
                        }), n.isUgcPublishingEnabled && (0, s.jsx)(tv, {
                            expandedPrimary: c("Description.Benefit.PublishItemsExpandedTitle"),
                            expandedSecondary: c("Description.Benefit.PublishItemsExpandedBody"),
                            iconName: null != i ? i : "icon-regular-arrow-up-from-landscape-rectangle",
                            primary: c("Description.Benefit.PublishItems"),
                            secondary: c("Description.Benefit.PublishItemsSubtitle"),
                            onTileClick: a
                        })]
                    })
                },
                tb = function(t) {
                    var n = t.children;
                    return (0, s.jsx)("div", {
                        children: n
                    })
                },
                tg = function() {
                    return (0, s.jsx)("div", {
                        className: "backdrop-texture width-full height-[210px] pointer-events-none absolute"
                    })
                },
                tx = function() {
                    return (0, s.jsx)("div", {
                        className: "stroke-default stroke-standard self-stretch"
                    })
                };

            function tw(t) {
                var n = t.productTypeDetails.robloxSubscriptionProductDetails;
                if (!(null == n ? void 0 : n.featureConfig)) throw Error("featureConfig is missing on robloxSubscriptionProductDetails");
                return n.featureConfig
            }

            function tS(t) {
                var n, r = t.productTypeDetails.robloxSubscriptionProductDetails,
                    i = null == r ? void 0 : r.featureConfig.currencySubscriptionConfig;
                return Math.floor((null != (n = null == i ? void 0 : i.entitledAmountMicros) ? n : 0) / 1e6)
            }

            function tE(t) {
                return t.eligibleOffers.find(function(t) {
                    return "FreeTrial" === t.offerType
                })
            }
            var tP = function(t) {
                var n = t.robloxSubscriptionProduct,
                    r = t.onDismiss,
                    i = (0, l.useTranslation)().translate,
                    a = (0, s.jsx)(ts, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: r,
                        children: i("Action.OK")
                    }),
                    o = (0, s.jsxs)("p", {
                        className: "text-body-small content-muted text-center",
                        children: [i("Description.FeatureAccessDisclaimer"), " ", (0, s.jsx)("a", {
                            className: "text-link",
                            href: "https://help.roblox.com/hc/articles/39143693116052-Understanding-Age-Checks-on-Roblox",
                            children: i("Action.ViewDetails")
                        })]
                    });
                return (0, s.jsxs)(eG.Fragment, {
                    children: [(0, s.jsx)(tg, {}), (0, s.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, s.jsxs)("div", {
                            className: "padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [(0, s.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col items-start",
                                children: [(0, s.jsxs)("div", {
                                    className: "gap-x-small flex items-center",
                                    children: [(0, s.jsx)(eH, {
                                        className: "!size-600",
                                        name: "icon-regular-roblox-plus"
                                    }), (0, s.jsx)("h1", {
                                        className: "text-heading-medium",
                                        children: i("Title.FreeTrialConfirmation")
                                    })]
                                }), (0, s.jsx)("p", {
                                    className: "text-body-large content-default",
                                    children: i("Description.FreeTrialConfirmation")
                                })]
                            }), (0, s.jsx)(ty, {
                                featureConfig: tw(n),
                                periodType: n.periodType
                            }), (0, s.jsx)(tb, {
                                children: (0, s.jsxs)("div", {
                                    className: "large:flex large:flex-col large:items-center width-full gap-y-medium hidden",
                                    "data-testid": "free-trial-action-inline",
                                    children: [a, o]
                                })
                            })]
                        })
                    }), (0, s.jsxs)("div", {
                        "aria-label": i("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:!hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "free-trial-action-dock",
                        role: "region",
                        children: [(0, s.jsx)(tx, {}), (0, s.jsxs)("div", {
                            className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: [a, o]
                        })]
                    })]
                })
            };
            tt(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}"), tt("@keyframes progress-circle-rotate{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}.foundation-web-progress-circle-indeterminate{animation:progress-circle-rotate 1.4s linear infinite;transform-origin:50% 50%}");
            var tT = {
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
                tO = eW().forwardRef(function(t, n) {
                    var r = t.className,
                        i = t.size,
                        a = void 0 === i ? "Large" : i,
                        o = t.variant,
                        s = t.value,
                        l = t.showValue,
                        c = void 0 !== l && l,
                        u = t.ariaLabel,
                        d = eq(t, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        f = tT[a],
                        p = f.dimension,
                        m = f.strokeWidth,
                        h = f.textClass,
                        v = f.valueContainerSize,
                        y = (p - m) / 2,
                        b = 2 * Math.PI * y,
                        g = p / 2,
                        x = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        w = c && void 0 !== v ? v : p,
                        S = "Determinate" === (void 0 === o ? "Determinate" : o);
                    return eW().createElement("div", Object.assign({
                        ref: n,
                        className: eK("foundation-web-progress-circle inline-flex items-center justify-center", r),
                        role: "progressbar",
                        "aria-label": u,
                        "aria-valuemin": S ? 0 : void 0,
                        "aria-valuemax": S ? 100 : void 0,
                        "aria-valuenow": S ? x : void 0,
                        style: {
                            width: w,
                            height: w
                        }
                    }, d), eW().createElement("svg", {
                        width: p,
                        height: p,
                        viewBox: "0 0 ".concat(p, " ").concat(p),
                        className: "relative"
                    }, eW().createElement("circle", {
                        cx: g,
                        cy: g,
                        r: y,
                        fill: "none",
                        strokeWidth: m,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), eW().createElement("circle", {
                        cx: g,
                        cy: g,
                        r: y,
                        fill: "none",
                        strokeWidth: m,
                        strokeDasharray: S ? b : "".concat(.75 * b, " ").concat(.25 * b),
                        strokeDashoffset: S ? b * (1 - x / 100) : 0,
                        strokeLinecap: "round",
                        className: eK(!S && "foundation-web-progress-circle-indeterminate"),
                        style: S ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), S && c && "Large" === a && eW().createElement("div", {
                        className: eK("absolute content-emphasis flex items-center justify-center", h),
                        "aria-hidden": "true"
                    }, eW().createElement("span", null, Math.round(x)), eW().createElement("span", null, "%")))
                });
            tO.displayName = "ProgressCircle";
            var tN = function() {
                    var t = (0, l.useTranslation)().translate;
                    return (0, s.jsx)("div", {
                        className: "margin-top-[240px] flex flex-col items-center",
                        children: (0, s.jsx)(tO, {
                            ariaLabel: t("Label.Loading"),
                            size: "Medium",
                            variant: "Indeterminate"
                        })
                    })
                },
                tj = window.CoreRobloxUtilities,
                tI = window.Roblox,
                tC = window.Roblox["core-scripts"].localStorage.localStorage,
                tD = r.n(tC),
                tA = window.CoreUtilities,
                tk = window.Roblox["core-scripts"].paymentsFlow,
                tR = r.n(tk),
                tM = window.EventTracker;

            function t_(t, n, r, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(i, a)
            }

            function tL(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }
            var tU = ((nN = {}).GET = "GET", nN.POST = "POST", nN),
                tB = ((nj = {}).PAYMENT = "Payment", nj.ROBUX = "Robux", nj.ROBUX_GIFTING = "RobuxGifting", nj.ROBUX_REDESIGN = "RobuxRedesign", nj),
                tF = ((nI = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", nI.LANDING_PAGE_METADATA = "GetLandingPageMetadata", nI.GET_USER_NAME = "GetUserName", nI.PREPARE_PAYMENT = "PreparePayment", nI.GET_METADATA = "GetMetadata", nI.GET_PRODUCTS = "GetProducts", nI.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", nI.GET_PURCHASE_WARNING = "GetPurchaseWarning", nI.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", nI.CREATE_PAYMENT_SESSION = "CreatePaymentSession", nI.GET_PAYMENT_SESSION = "GetPaymentSession", nI.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", nI.CREATE_BONUS_SESSION = "CreateBonusSession", nI.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", nI.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", nI.GET_THUMBNAILS = "GetThumbnails", nI.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", nI.GET_ROBUX_BALANCE = "GetRobuxBalance", nI.GET_AUTH_TICKET = "GetAuthTicket", nI.GET_CLIENT_ASSERTION = "GetClientAssertion", nI),
                tz = function(t, n, r) {
                    return new Promise(function(i) {
                        (0, tM.fireEvent)("API_COUNTER_".concat(t, "_").concat(n, "_").concat(r || "Throughput")), i()
                    })
                },
                tG = function(t, n, r) {
                    return new Promise(function(i) {
                        (0, tM.fireEvent)("ERROR_COUNTER_".concat(t, "_").concat(n, "_").concat(r || "UnknownAxiosError")), i()
                    })
                };

            function tW(t, n, r, i, a) {
                var o;
                return (o = function(t, n, r, i, a) {
                    var o, s, l, c, u, d, f;
                    return function(t, n) {
                        var r, i, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                            return this
                        }), s;

                        function l(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                    if (r = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                    switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            a = u;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, i = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                o.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && o.label < a[1]) {
                                                o.label = a[1], a = u;
                                                break
                                            }
                                            if (a && o.label < a[2]) {
                                                o.label = a[2], o.ops.push(u);
                                                break
                                            }
                                            a[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    u = n.call(t, o)
                                } catch (t) {
                                    u = [6, t], i = 0
                                } finally {
                                    r = a = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(p) {
                        switch (p.label) {
                            case 0:
                                o = r.feature, s = r.call, tz(o, s), p.label = 1;
                            case 1:
                                return p.trys.push([1, 3, , 4]), [4, "GET" === t ? tA.httpService.get(n, i) : tA.httpService.post(n, i)];
                            case 2:
                                return c = (l = p.sent()).data, u = l.headers, tz(o, s, 200), [2, (null == a ? void 0 : a(c, u)) || c];
                            case 3:
                                var m, h, v;
                                return (void 0 === (m = d = p.sent()) ? "undefined" : tL(m)) === "object" && "status" in m ? tG(o, s, d.status) : (void 0 === d ? "undefined" : tL(d)) === "object" && "config" in d ? tG(o, s, null == (f = d.response) ? void 0 : f.status) : (console.error(d), h = o, v = s, new Promise(function(t) {
                                    (0, tM.fireEvent)("ERROR_COUNTER_".concat(h, "_").concat(v, "_NonAxiosError")), t()
                                })), [2, void 0];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var a = o.apply(t, n);

                        function s(t) {
                            t_(a, r, i, s, l, "next", t)
                        }

                        function l(t) {
                            t_(a, r, i, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }).apply(this, arguments)
            }

            function tV(t, n, r, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(i, a)
            }

            function tq(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(i, a) {
                        var o = t.apply(n, r);

                        function s(t) {
                            tV(o, i, a, s, l, "next", t)
                        }

                        function l(t) {
                            tV(o, i, a, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function tK(t, n) {
                var r, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (r = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = n.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function tX(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function tH(t, n, r, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(i, a)
            }

            function tY(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), !n || o.length !== n); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return tX(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tX(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var t$ = "paymentSession-".concat((null === tI.CurrentUser || void 0 === tI.CurrentUser ? void 0 : tI.CurrentUser.userId) || "loggedout");

            function tJ(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function tZ(t) {
                return function(t) {
                    if (Array.isArray(t)) return tJ(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return tJ(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tJ(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tQ = "__FN_nvfToKPAOuiV__",
                t0 = new RegExp("".concat(tQ, "(\\d+)\\|")),
                t1 = function(t, n, r, i) {
                    var a = function(t) {
                            for (var n = 1; n < arguments.length; n++) {
                                var r = null != arguments[n] ? arguments[n] : {},
                                    i = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(r, t).enumerable
                                }))), i.forEach(function(n) {
                                    var i;
                                    i = r[n], n in t ? Object.defineProperty(t, n, {
                                        value: i,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : t[n] = i
                                })
                            }
                            return t
                        }({}, i),
                        o = {};
                    null == r || r.forEach(function(t, n) {
                        var r = n.toString(),
                            i = "".concat(tQ).concat(r, "|"),
                            s = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        a[t.opening] = i, a[t.closing] = s, o[r] = {
                            start: i,
                            end: s,
                            render: t.render,
                            used: !1
                        }
                    });
                    var l = t(n, a),
                        c = function(t) {
                            var r = [],
                                i = t0.exec(t);
                            if (!i) return [t];
                            i.index > 0 && r.push(t.slice(0, i.index));
                            var a = i[1] && o[i[1]];
                            if (!a) return console.warn("Unexpected malformed segment", n), [];
                            a.used = !0;
                            var s = t.indexOf(a.end);
                            if (-1 === s) return console.warn("Unexpected malformed segment", n), [];
                            var l = t.slice(i.index + i[0].length, s),
                                u = a.render(c(l));
                            Array.isArray(u) ? r.push.apply(r, tZ(u)) : r.push(u);
                            var d = t.slice(s + a.end.length);
                            return d.length > 0 && r.push.apply(r, tZ(c(d))), r
                        },
                        u = c(l).filter(function(t) {
                            return "" !== t
                        });
                    return Object.values(o).some(function(t) {
                        return !t.used
                    }) ? (console.warn("Unused segments found", n), []) : u.map(function(t, n) {
                        return (0, s.jsx)(eG.Fragment, {
                            children: t
                        }, n)
                    })
                };

            function t2(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }
            var t3 = function(t) {
                    var n, r = t.productType,
                        i = t.productId,
                        a = t.deviceMeta,
                        o = t.variant,
                        l = t.size,
                        c = t.className,
                        u = t.isDisabled,
                        d = void 0 !== u && u,
                        f = t.redirectUrl,
                        p = t.paymentSessionId,
                        m = t.onSubscribeClick,
                        h = t.onMobilePurchaseInitiated,
                        v = t.isLoading,
                        y = t.children,
                        b = t.trackSubscriptionButtonClick,
                        g = t.loadingStateDisabled,
                        x = (n = (0, eG.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), o.length !== n); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return t2(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t2(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        w = x[0],
                        S = x[1],
                        E = a.isAndroidApp || a.isIosApp,
                        P = r === ek ? "RobloxPlus" : r,
                        T = (0, eG.useMemo)(function() {
                            var t = new URL(E ? "/mobile-app-upgrades/buy" : "/upgrades/paymentmethods", window.location.origin);
                            return t.searchParams.append("ctx", "subscription"), t.searchParams.append("type", P), t.searchParams.append("id", i), p && t.searchParams.append("paymentSessionId", p), !E && f && t.searchParams.append("redirectUrl", f), t.toString()
                        }, [E, P, i, p, f]),
                        O = (0, eG.useCallback)(function() {
                            if (!d) {
                                if (null == b || b(), f && function(t) {
                                        try {
                                            var n = JSON.stringify({
                                                url: t,
                                                ts: Date.now()
                                            });
                                            sessionStorage.setItem(ez, n)
                                        } catch (t) {}
                                    }(f), null == m || m(), E) {
                                    null == h || h();
                                    return
                                }
                                S(!0)
                            }
                        }, [d, b, f, m, E, h]);
                    return (0, s.jsx)(ts, {
                        as: "a",
                        className: c,
                        href: T,
                        isDisabled: d,
                        isLoading: void 0 !== g && g ? void 0 : null != v ? v : w,
                        size: l,
                        variant: void 0 === o ? "Emphasis" : o,
                        onClick: O,
                        children: y
                    })
                },
                t4 = function(t) {
                    var n = t.title,
                        r = t.body,
                        i = t.equipText,
                        a = t.onEquip,
                        o = t.onItemDetailsClick,
                        l = null != o;
                    return (0, s.jsxs)("div", {
                        "aria-label": l ? n : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(l ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: l ? "button" : void 0,
                        tabIndex: l ? 0 : void 0,
                        onClick: o,
                        onKeyDown: l ? function(t) {
                            t.target === t.currentTarget && ("Enter" === t.key || " " === t.key) && (t.preventDefault(), null == o || o())
                        } : void 0,
                        children: [(0, s.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, s.jsx)("img", {
                                alt: n,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/e111b658028dba05.gif"
                            })
                        }), (0, s.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, s.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: n
                            }), (0, s.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        }), null != i && null != a && (0, s.jsx)(ts, {
                            className: "shrink-0",
                            size: "Medium",
                            variant: "Standard",
                            onClick: function(t) {
                                t.stopPropagation(), null == a || a()
                            },
                            children: i
                        })]
                    })
                },
                t5 = function(t) {
                    var n = t.size,
                        r = t.variant,
                        i = (0, (0, l.useTranslation)().translate)("Label.Blackbird");
                    return "compact" === (void 0 === r ? "default" : r) ? (0, s.jsxs)("div", {
                        className: "gap-x-xxsmall flex items-center",
                        children: [(0, s.jsx)(eH, {
                            className: "relative",
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            style: {
                                top: -1
                            }
                        }), (0, s.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: i
                        })]
                    }) : (0, s.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, s.jsx)(eH, {
                            className: "!size-1000 relative",
                            name: "icon-regular-roblox-plus",
                            style: {
                                top: -4
                            }
                        }), "large" === (void 0 === n ? "large" : n) ? (0, s.jsx)("h1", {
                            className: "font-builder-extended text-display-small text-no-wrap",
                            children: i
                        }) : (0, s.jsx)("h2", {
                            className: "text-heading-large",
                            children: i
                        })]
                    })
                },
                t6 = window.Roblox["core-scripts"].format.string,
                t8 = function(t, n) {
                    var r = (0, l.useTranslation)().intl;
                    return (0, eG.useMemo)(function() {
                        var i = t.units + 1e-9 * t.nanos;
                        return r.n(i, function(t) {
                            for (var n = 1; n < arguments.length; n++) {
                                var r = null != arguments[n] ? arguments[n] : {},
                                    i = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(r, t).enumerable
                                }))), i.forEach(function(n) {
                                    var i;
                                    i = r[n], n in t ? Object.defineProperty(t, n, {
                                        value: i,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : t[n] = i
                                })
                            }
                            return t
                        }({
                            style: "currency",
                            currency: t.currencyCode
                        }, n))
                    }, [r, t, n])
                },
                t7 = function(t) {
                    var n, r = t.eligibleOffers,
                        i = t.price,
                        a = t.periodType,
                        o = (0, l.useTranslation)().translate,
                        c = t8(i),
                        u = o("Description.BillingInfo", {
                            price: "<span class='text-heading-medium'>".concat((0, t6.escapeHtml)(c), "</span>"),
                            periodType: a
                        }),
                        d = o("Description.BillingInfoWithFreeTrialOffer", {
                            boldTagStart: "<b>",
                            boldTagEnd: "</b>",
                            trialPeriod: 1,
                            trialPeriodType: a,
                            price: (0, t6.escapeHtml)(c),
                            periodType: a
                        }),
                        f = null != (n = null == r ? void 0 : r.some(function(t) {
                            return "FreeTrial" === t.offerType
                        })) && n;
                    return (0, s.jsx)("span", {
                        dangerouslySetInnerHTML: {
                            __html: f ? d : u
                        },
                        className: "text-body-large"
                    })
                };

            function t9(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }
            var ne = (null == (nC = globalThis) ? void 0 : nC.document) ? eG.useLayoutEffect : function() {},
                nt = eG[" useId ".trim().toString()] || function() {},
                nn = 0;

            function nr(t) {
                var n, r = (n = eG.useState(nt()), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), o.length !== n); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return t9(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t9(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    i = r[0],
                    a = r[1];
                return ne(function() {
                    t || a(function(t) {
                        return null != t ? t : String(nn++)
                    })
                }, [t]), t || (i ? "radix-".concat(i) : "")
            }
            var ni = window.ReactDOM,
                na = r.n(ni);

            function no(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function ns(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function nl(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function nc(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        i = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), i.forEach(function(n) {
                        ns(t, n, r[n])
                    })
                }
                return t
            }

            function nu(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, i)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function nd(t, n) {
                if (null == t) return {};
                var r, i, a = function(t, n) {
                    if (null == t) return {};
                    var r, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) r = o[i], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) r = o[i], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function nf(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), !n || o.length !== n); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, n) || nm(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function np(t) {
                return function(t) {
                    if (Array.isArray(t)) return no(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || nm(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nm(t, n) {
                if (t) {
                    if ("string" == typeof t) return no(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return no(t, n)
                }
            }

            function nh(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    i = r.checkForDefaultPrevented,
                    a = void 0 === i || i;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function nv(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function ny() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        i = n.map(function(n) {
                            var i = nv(n, t);
                            return r || "function" != typeof i || (r = !0), i
                        });
                    if (r) return function() {
                        for (var t = 0; t < i.length; t++) {
                            var r = i[t];
                            "function" == typeof r ? r() : nv(n[t], null)
                        }
                    }
                }
            }

            function nb() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return eG.useCallback(ny.apply(void 0, np(n)), n)
            }
            var ng = Symbol("radix.slottable");

            function nx(t) {
                return eG.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === ng
            }
            var nw = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, i, a, o, l, c = (i = r = "Primitive.".concat(n), (a = eG.forwardRef(function(t, n) {
                        var r = t.children,
                            i = nd(t, ["children"]);
                        if (eG.isValidElement(r)) {
                            var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? r.ref : (s = null == (o = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = nc({}, n);
                                    for (var i in n) ! function(i) {
                                        var a = t[i],
                                            o = n[i];
                                        /^on[A-Z]/.test(i) ? a && o ? r[i] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            o.apply(void 0, np(n)), a.apply(void 0, np(n))
                                        } : a && (r[i] = a) : "style" === i ? r[i] = nc({}, a, o) : "className" === i && (r[i] = [a, o].filter(Boolean).join(" "))
                                    }(i);
                                    return nc({}, t, r)
                                }(i, r.props);
                            return r.type !== eG.Fragment && (c.ref = n ? ny(n, l) : l), eG.cloneElement(r, c)
                        }
                        return eG.Children.count(r) > 1 ? eG.Children.only(null) : null
                    })).displayName = "".concat(i, ".SlotClone"), o = a, (l = eG.forwardRef(function(t, n) {
                        var r = t.children,
                            i = nd(t, ["children"]),
                            a = eG.Children.toArray(r),
                            l = a.find(nx);
                        if (l) {
                            var c = l.props.children,
                                u = a.map(function(t) {
                                    return t === l ? eG.Children.count(c) > 1 ? eG.Children.only(null) : eG.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, s.jsx)(o, nu(nc({}, i), {
                                ref: n,
                                children: eG.isValidElement(c) ? eG.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, s.jsx)(o, nu(nc({}, i), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    u = eG.forwardRef(function(t, r) {
                        var i = t.asChild,
                            a = nd(t, ["asChild"]),
                            o = i ? c : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(o, nu(nc({}, a), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(n), nu(nc({}, t), ns({}, n, u))
            }, {});

            function nS(t) {
                var n = eG.useRef(t);
                return eG.useEffect(function() {
                    n.current = t
                }), eG.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(np(i)))
                    }
                }, [])
            }
            var nE, nP, nT, nO, nN, nj, nI, nC, nD, nA, nk = "dismissableLayer.update",
                nR = eG.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                nM = eG.forwardRef(function(t, n) {
                    var r, i, a = t.disableOutsidePointerEvents,
                        o = void 0 !== a && a,
                        l = t.onEscapeKeyDown,
                        c = t.onPointerDownOutside,
                        u = t.onFocusOutside,
                        d = t.onInteractOutside,
                        f = t.onDismiss,
                        p = nd(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        m = eG.useContext(nR),
                        h = nf(eG.useState(null), 2),
                        v = h[0],
                        y = h[1],
                        b = null != (i = null == v ? void 0 : v.ownerDocument) ? i : null == (r = globalThis) ? void 0 : r.document,
                        g = nf(eG.useState({}), 2)[1],
                        x = nb(n, function(t) {
                            return y(t)
                        }),
                        w = Array.from(m.layers),
                        S = nf(np(m.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        E = w.indexOf(S),
                        P = v ? w.indexOf(v) : -1,
                        T = m.layersWithOutsidePointerEventsDisabled.size > 0,
                        O = P >= E,
                        N = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                i = nS(t),
                                a = eG.useRef(!1),
                                o = eG.useRef(function() {});
                            return eG.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !a.current) {
                                            var n = function() {
                                                    nL("dismissableLayer.pointerDownOutside", i, s, {
                                                        discrete: !0
                                                    })
                                                },
                                                s = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", o.current), o.current = n, r.addEventListener("click", o.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", o.current);
                                        a.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", o.current)
                                }
                            }, [r, i]), {
                                onPointerDownCapture: function() {
                                    return a.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = np(m.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            O && !r && (null == c || c(t), null == d || d(t), t.defaultPrevented || null == f || f())
                        }, b),
                        j = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                i = nS(t),
                                a = eG.useRef(!1);
                            return eG.useEffect(function() {
                                var t = function(t) {
                                    t.target && !a.current && nL("dismissableLayer.focusOutside", i, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, i]), {
                                onFocusCapture: function() {
                                    return a.current = !0
                                },
                                onBlurCapture: function() {
                                    return a.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            np(m.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == u || u(t), null == d || d(t), t.defaultPrevented || null == f || f())
                        }, b);
                    return function(t) {
                        var n, r, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            a = (r = eG.useRef(t), eG.useEffect(function() {
                                r.current = t
                            }), eG.useMemo(function() {
                                return function() {
                                    for (var t, n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                                    return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(np(i)))
                                }
                            }, []));
                        eG.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && a(t)
                            };
                            return i.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return i.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [a, i])
                    }(function(t) {
                        P === m.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && f && (t.preventDefault(), f()))
                    }, b), eG.useEffect(function() {
                        if (v) return o && (0 === m.layersWithOutsidePointerEventsDisabled.size && (nA = b.body.style.pointerEvents, b.body.style.pointerEvents = "none"), m.layersWithOutsidePointerEventsDisabled.add(v)), m.layers.add(v), n_(),
                            function() {
                                o && 1 === m.layersWithOutsidePointerEventsDisabled.size && (b.body.style.pointerEvents = nA)
                            }
                    }, [v, b, o, m]), eG.useEffect(function() {
                        return function() {
                            v && (m.layers.delete(v), m.layersWithOutsidePointerEventsDisabled.delete(v), n_())
                        }
                    }, [v, m]), eG.useEffect(function() {
                        var t = function() {
                            return g({})
                        };
                        return document.addEventListener(nk, t),
                            function() {
                                return document.removeEventListener(nk, t)
                            }
                    }, []), (0, s.jsx)(nw.div, nu(nc({}, p), {
                        ref: x,
                        style: nc({
                            pointerEvents: T ? O ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: nh(t.onFocusCapture, j.onFocusCapture),
                        onBlurCapture: nh(t.onBlurCapture, j.onBlurCapture),
                        onPointerDownCapture: nh(t.onPointerDownCapture, N.onPointerDownCapture)
                    }))
                });

            function n_() {
                var t = new CustomEvent(nk);
                document.dispatchEvent(t)
            }

            function nL(t, n, r, i) {
                var a = i.discrete,
                    o = r.originalEvent.target,
                    s = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && o.addEventListener(t, n, {
                    once: !0
                }), a ? o && ni.flushSync(function() {
                    return o.dispatchEvent(s)
                }) : o.dispatchEvent(s)
            }
            nM.displayName = "DismissableLayer", eG.forwardRef(function(t, n) {
                var r = eG.useContext(nR),
                    i = eG.useRef(null),
                    a = nb(n, i);
                return eG.useEffect(function() {
                    var t = i.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, s.jsx)(nw.div, nu(nc({}, t), {
                    ref: a
                }))
            }).displayName = "DismissableLayerBranch";
            var nU = 0;

            function nB() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }

            function nF(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function nz() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        i = n.map(function(n) {
                            var i = nF(n, t);
                            return r || "function" != typeof i || (r = !0), i
                        });
                    if (r) return function() {
                        for (var t = 0; t < i.length; t++) {
                            var r = i[t];
                            "function" == typeof r ? r() : nF(n[t], null)
                        }
                    }
                }
            }
            var nG = Symbol("radix.slottable");

            function nW(t) {
                return eG.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === nG
            }
            var nV = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, i, a, o, l, c = (i = r = "Primitive.".concat(n), (a = eG.forwardRef(function(t, n) {
                        var r = t.children,
                            i = nd(t, ["children"]);
                        if (eG.isValidElement(r)) {
                            var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? r.ref : (s = null == (o = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = nc({}, n);
                                    for (var i in n) ! function(i) {
                                        var a = t[i],
                                            o = n[i];
                                        /^on[A-Z]/.test(i) ? a && o ? r[i] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            o.apply(void 0, np(n)), a.apply(void 0, np(n))
                                        } : a && (r[i] = a) : "style" === i ? r[i] = nc({}, a, o) : "className" === i && (r[i] = [a, o].filter(Boolean).join(" "))
                                    }(i);
                                    return nc({}, t, r)
                                }(i, r.props);
                            return r.type !== eG.Fragment && (c.ref = n ? nz(n, l) : l), eG.cloneElement(r, c)
                        }
                        return eG.Children.count(r) > 1 ? eG.Children.only(null) : null
                    })).displayName = "".concat(i, ".SlotClone"), o = a, (l = eG.forwardRef(function(t, n) {
                        var r = t.children,
                            i = nd(t, ["children"]),
                            a = eG.Children.toArray(r),
                            l = a.find(nW);
                        if (l) {
                            var c = l.props.children,
                                u = a.map(function(t) {
                                    return t === l ? eG.Children.count(c) > 1 ? eG.Children.only(null) : eG.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, s.jsx)(o, nu(nc({}, i), {
                                ref: n,
                                children: eG.isValidElement(c) ? eG.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, s.jsx)(o, nu(nc({}, i), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    u = eG.forwardRef(function(t, r) {
                        var i = t.asChild,
                            a = nd(t, ["asChild"]),
                            o = i ? c : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(o, nu(nc({}, a), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(n), nu(nc({}, t), ns({}, n, u))
            }, {});

            function nq(t) {
                var n = eG.useRef(t);
                return eG.useEffect(function() {
                    n.current = t
                }), eG.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(np(i)))
                    }
                }, [])
            }
            var nK = "focusScope.autoFocusOnMount",
                nX = "focusScope.autoFocusOnUnmount",
                nH = {
                    bubbles: !1,
                    cancelable: !0
                },
                nY = eG.forwardRef(function(t, n) {
                    var r = t.loop,
                        i = void 0 !== r && r,
                        a = t.trapped,
                        o = void 0 !== a && a,
                        l = t.onMountAutoFocus,
                        c = t.onUnmountAutoFocus,
                        u = nd(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        d = nf(eG.useState(null), 2),
                        f = d[0],
                        p = d[1],
                        m = nq(l),
                        h = nq(c),
                        v = eG.useRef(null),
                        y = function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return eG.useCallback(nz.apply(void 0, np(n)), n)
                        }(n, function(t) {
                            return p(t)
                        }),
                        b = eG.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    eG.useEffect(function() {
                        if (o) {
                            var t = function(t) {
                                    if (!b.paused && f) {
                                        var n = t.target;
                                        f.contains(n) ? v.current = n : nZ(v.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(t) {
                                    if (!b.paused && f) {
                                        var n = t.relatedTarget;
                                        null !== n && (f.contains(n) || nZ(v.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                            var r = new MutationObserver(function(t) {
                                var n = !0,
                                    r = !1,
                                    i = void 0;
                                if (document.activeElement === document.body) try {
                                    for (var a, o = t[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) a.value.removedNodes.length > 0 && nZ(f)
                                } catch (t) {
                                    r = !0, i = t
                                } finally {
                                    try {
                                        n || null == o.return || o.return()
                                    } finally {
                                        if (r) throw i
                                    }
                                }
                            });
                            return f && r.observe(f, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), r.disconnect()
                                }
                        }
                    }, [o, f, b.paused]), eG.useEffect(function() {
                        if (f) {
                            nQ.add(b);
                            var t = document.activeElement;
                            if (!f.contains(t)) {
                                var n = new CustomEvent(nK, nH);
                                f.addEventListener(nK, m), f.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = n.select,
                                        i = void 0 !== r && r,
                                        a = document.activeElement,
                                        o = !0,
                                        s = !1,
                                        l = void 0;
                                    try {
                                        for (var c, u = t[Symbol.iterator](); !(o = (c = u.next()).done); o = !0) {
                                            var d = c.value;
                                            if (nZ(d, {
                                                    select: i
                                                }), document.activeElement !== a) return
                                        }
                                    } catch (t) {
                                        s = !0, l = t
                                    } finally {
                                        try {
                                            o || null == u.return || u.return()
                                        } finally {
                                            if (s) throw l
                                        }
                                    }
                                }(n$(f).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && nZ(f))
                            }
                            return function() {
                                f.removeEventListener(nK, m), setTimeout(function() {
                                    var n = new CustomEvent(nX, nH);
                                    f.addEventListener(nX, h), f.dispatchEvent(n), n.defaultPrevented || nZ(null != t ? t : document.body, {
                                        select: !0
                                    }), f.removeEventListener(nX, h), nQ.remove(b)
                                }, 0)
                            }
                        }
                    }, [f, m, h, b]);
                    var g = eG.useCallback(function(t) {
                        if ((i || o) && !b.paused) {
                            var n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                r = document.activeElement;
                            if (n && r) {
                                var a, s = t.currentTarget,
                                    l = nf([nJ(a = n$(s), s), nJ(a.reverse(), s)], 2),
                                    c = l[0],
                                    u = l[1];
                                c && u ? t.shiftKey || r !== u ? t.shiftKey && r === c && (t.preventDefault(), i && nZ(u, {
                                    select: !0
                                })) : (t.preventDefault(), i && nZ(c, {
                                    select: !0
                                })) : r === s && t.preventDefault()
                            }
                        }
                    }, [i, o, b.paused]);
                    return (0, s.jsx)(nV.div, nu(nc({
                        tabIndex: -1
                    }, u), {
                        ref: y,
                        onKeyDown: g
                    }))
                });

            function n$(t) {
                for (var n = [], r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var n = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) n.push(r.currentNode);
                return n
            }

            function nJ(t, n) {
                var r = !0,
                    i = !1,
                    a = void 0;
                try {
                    for (var o, s = t[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                        var l = o.value;
                        if (! function(t, n) {
                                var r = n.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === r || t !== r);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: n
                            })) return l
                    }
                } catch (t) {
                    i = !0, a = t
                } finally {
                    try {
                        r || null == s.return || s.return()
                    } finally {
                        if (i) throw a
                    }
                }
            }

            function nZ(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.select;
                if (t && t.focus) {
                    var i, a = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== a && nl(i = t, HTMLInputElement) && "select" in i && void 0 !== r && r && t.select()
                }
            }
            nY.displayName = "FocusScope";
            var nQ = (rT = [], {
                add: function(t) {
                    var n = rT[0];
                    t !== n && (null == n || n.pause()), (rT = n0(rT, t)).unshift(t)
                },
                remove: function(t) {
                    var n;
                    null == (n = (rT = n0(rT, t))[0]) || n.resume()
                }
            });

            function n0(t, n) {
                var r = np(t),
                    i = r.indexOf(n);
                return -1 !== i && r.splice(i, 1), r
            }

            function n1(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var n2 = Symbol("radix.slottable");

            function n3(t) {
                return eG.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === n2
            }
            var n4 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, i, a, o, l, c = (i = r = "Primitive.".concat(n), (a = eG.forwardRef(function(t, n) {
                            var r = t.children,
                                i = nd(t, ["children"]);
                            if (eG.isValidElement(r)) {
                                var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? r.ref : (s = null == (o = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = nc({}, n);
                                        for (var i in n) ! function(i) {
                                            var a = t[i],
                                                o = n[i];
                                            /^on[A-Z]/.test(i) ? a && o ? r[i] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                o.apply(void 0, np(n)), a.apply(void 0, np(n))
                                            } : a && (r[i] = a) : "style" === i ? r[i] = nc({}, a, o) : "className" === i && (r[i] = [a, o].filter(Boolean).join(" "))
                                        }(i);
                                        return nc({}, t, r)
                                    }(i, r.props);
                                return r.type !== eG.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            i = n.map(function(n) {
                                                var i = n1(n, t);
                                                return r || "function" != typeof i || (r = !0), i
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < i.length; t++) {
                                                var r = i[t];
                                                "function" == typeof r ? r() : n1(n[t], null)
                                            }
                                        }
                                    }
                                }(n, l) : l), eG.cloneElement(r, c)
                            }
                            return eG.Children.count(r) > 1 ? eG.Children.only(null) : null
                        })).displayName = "".concat(i, ".SlotClone"), o = a, (l = eG.forwardRef(function(t, n) {
                            var r = t.children,
                                i = nd(t, ["children"]),
                                a = eG.Children.toArray(r),
                                l = a.find(n3);
                            if (l) {
                                var c = l.props.children,
                                    u = a.map(function(t) {
                                        return t === l ? eG.Children.count(c) > 1 ? eG.Children.only(null) : eG.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, s.jsx)(o, nu(nc({}, i), {
                                    ref: n,
                                    children: eG.isValidElement(c) ? eG.cloneElement(c, void 0, u) : null
                                }))
                            }
                            return (0, s.jsx)(o, nu(nc({}, i), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = eG.forwardRef(function(t, r) {
                            var i = t.asChild,
                                a = nd(t, ["asChild"]),
                                o = i ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(o, nu(nc({}, a), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), nu(nc({}, t), ns({}, n, u))
                }, {}),
                n5 = (null == (nD = globalThis) ? void 0 : nD.document) ? eG.useLayoutEffect : function() {},
                n6 = eG.forwardRef(function(t, n) {
                    var r, i, a = t.container,
                        o = nd(t, ["container"]),
                        l = nf(eG.useState(!1), 2),
                        c = l[0],
                        u = l[1];
                    n5(function() {
                        return u(!0)
                    }, []);
                    var d = a || c && (null == (i = globalThis) || null == (r = i.document) ? void 0 : r.body);
                    return d ? na().createPortal((0, s.jsx)(n4.div, nu(nc({}, o), {
                        ref: n
                    })), d) : null
                });
            n6.displayName = "Portal";
            var n8 = new WeakMap,
                n7 = new WeakMap,
                n9 = {},
                re = 0,
                rt = function(t) {
                    return t && (t.host || rt(t.parentNode))
                },
                rn = function(t, n, r, i) {
                    var a = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (n.contains(t)) return t;
                        var r = rt(t);
                        return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    n9[r] || (n9[r] = new WeakMap);
                    var o = n9[r],
                        s = [],
                        l = new Set,
                        c = new Set(a),
                        u = function(t) {
                            t && !l.has(t) && (l.add(t), u(t.parentNode))
                        };
                    a.forEach(u);
                    var d = function(t) {
                        t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (l.has(t)) d(t);
                            else try {
                                var n = t.getAttribute(i),
                                    a = null !== n && "false" !== n,
                                    c = (n8.get(t) || 0) + 1,
                                    u = (o.get(t) || 0) + 1;
                                n8.set(t, c), o.set(t, u), s.push(t), 1 === c && a && n7.set(t, !0), 1 === u && t.setAttribute(r, "true"), a || t.setAttribute(i, "true")
                            } catch (n) {
                                console.error("aria-hidden: cannot operate on ", t, n)
                            }
                        })
                    };
                    return d(n), l.clear(), re++,
                        function() {
                            s.forEach(function(t) {
                                var n = n8.get(t) - 1,
                                    a = o.get(t) - 1;
                                n8.set(t, n), o.set(t, a), n || (n7.has(t) || t.removeAttribute(i), n7.delete(t)), a || t.removeAttribute(r)
                            }), --re || (n8 = new WeakMap, n8 = new WeakMap, n7 = new WeakMap, n9 = {})
                        }
                },
                rr = function(t, n, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var i = Array.from(Array.isArray(t) ? t : [t]),
                        a = n || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return a ? (i.push.apply(i, Array.from(a.querySelectorAll("[aria-live]"))), rn(i, a, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                ri = "right-scroll-bar-position",
                ra = "width-before-scroll-bar";

            function ro(t, n) {
                return "function" == typeof t ? t(n) : t && (t.current = n), t
            }
            var rs = "undefined" != typeof window ? eG.useLayoutEffect : eG.useEffect,
                rl = new WeakMap,
                rc = function(t) {
                    var n = t.sideCar,
                        r = eq(t, ["sideCar"]);
                    if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var i = n.read();
                    if (!i) throw Error("Sidecar medium not found");
                    return eG.createElement(i, eV({}, r))
                };
            rc.isSideCarExport = !0;
            var ru = (void 0 === rO && (rO = {}), (void 0 === rN && (rN = function(t) {
                    return t
                }), rj = [], rI = !1, rC = {
                    read: function() {
                        if (rI) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return rj.length ? rj[rj.length - 1] : null
                    },
                    useMedium: function(t) {
                        var n = rN(t, rI);
                        return rj.push(n),
                            function() {
                                rj = rj.filter(function(t) {
                                    return t !== n
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (rI = !0; rj.length;) {
                            var n = rj;
                            rj = [], n.forEach(t)
                        }
                        rj = {
                            push: function(n) {
                                return t(n)
                            },
                            filter: function() {
                                return rj
                            }
                        }
                    },
                    assignMedium: function(t) {
                        rI = !0;
                        var n = [];
                        if (rj.length) {
                            var r = rj;
                            rj = [], r.forEach(t), n = rj
                        }
                        var i = function() {
                                var r = n;
                                n = [], r.forEach(t)
                            },
                            a = function() {
                                return Promise.resolve().then(i)
                            };
                        a(), rj = {
                            push: function(t) {
                                n.push(t), a()
                            },
                            filter: function(t) {
                                return n = n.filter(t), rj
                            }
                        }
                    }
                }).options = eV({
                    async: !0,
                    ssr: !1
                }, rO), rC),
                rd = function() {},
                rf = eG.forwardRef(function(t, n) {
                    var r, i, a, o, s = eG.useRef(null),
                        l = eG.useState({
                            onScrollCapture: rd,
                            onWheelCapture: rd,
                            onTouchMoveCapture: rd
                        }),
                        c = l[0],
                        u = l[1],
                        d = t.forwardProps,
                        f = t.children,
                        p = t.className,
                        m = t.removeScrollBar,
                        h = t.enabled,
                        v = t.shards,
                        y = t.sideCar,
                        b = t.noIsolation,
                        g = t.inert,
                        x = t.allowPinchZoom,
                        w = t.as,
                        S = t.gapMode,
                        E = eq(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        P = (r = [s, n], i = function(t) {
                            return r.forEach(function(n) {
                                return ro(n, t)
                            })
                        }, (a = (0, eG.useState)(function() {
                            return {
                                value: null,
                                callback: i,
                                facade: {
                                    get current() {
                                        return a.value
                                    },
                                    set current(e) {
                                        var t = a.value;
                                        t !== e && (a.value = e, a.callback(e, t))
                                    }
                                }
                            }
                        })[0]).callback = i, o = a.facade, rs(function() {
                            var t = rl.get(o);
                            if (t) {
                                var n = new Set(t),
                                    i = new Set(r),
                                    a = o.current;
                                n.forEach(function(t) {
                                    i.has(t) || ro(t, null)
                                }), i.forEach(function(t) {
                                    n.has(t) || ro(t, a)
                                })
                            }
                            rl.set(o, r)
                        }, [r]), o),
                        T = eV(eV({}, E), c);
                    return eG.createElement(eG.Fragment, null, h && eG.createElement(y, {
                        sideCar: ru,
                        removeScrollBar: m,
                        shards: v,
                        noIsolation: b,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!x,
                        lockRef: s,
                        gapMode: S
                    }), d ? eG.cloneElement(eG.Children.only(f), eV(eV({}, T), {
                        ref: P
                    })) : eG.createElement(void 0 === w ? "div" : w, eV({}, T, {
                        className: p,
                        ref: P
                    }), f))
                });
            rf.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, rf.classNames = {
                fullWidth: ra,
                zeroRight: ri
            };
            var rp = function() {
                    var t = 0,
                        n = null;
                    return {
                        add: function(i) {
                            var a, o;
                            0 == t && (n = function() {
                                if (!document) return null;
                                var t = document.createElement("style");
                                t.type = "text/css";
                                var n = r.nc;
                                return n && t.setAttribute("nonce", n), t
                            }()) && ((a = n).styleSheet ? a.styleSheet.cssText = i : a.appendChild(document.createTextNode(i)), o = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)), t++
                        },
                        remove: function() {
                            --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                        }
                    }
                },
                rm = function() {
                    var t, n = (t = rp(), function(n, r) {
                        eG.useEffect(function() {
                            return t.add(n),
                                function() {
                                    t.remove()
                                }
                        }, [n && r])
                    });
                    return function(t) {
                        return n(t.styles, t.dynamic), null
                    }
                },
                rh = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                rv = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                ry = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return rh;
                    var n, r, i, a, o, s = (n = t, i = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], a = r["padding" === n ? "paddingTop" : "marginTop"], o = r["padding" === n ? "paddingRight" : "marginRight"], [rv(i), rv(a), rv(o)]),
                        l = document.documentElement.clientWidth,
                        c = window.innerWidth;
                    return {
                        left: s[0],
                        top: s[1],
                        right: s[2],
                        gap: Math.max(0, c - l + s[2] - s[0])
                    }
                },
                rb = rm(),
                rg = "data-scroll-locked",
                rx = function(t, n, r, i) {
                    var a = t.left,
                        o = t.top,
                        s = t.right,
                        l = t.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(i, ";\n   padding-right: ").concat(l, "px ").concat(i, ";\n  }\n  body[").concat(rg, "] {\n    overflow: hidden ").concat(i, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(i, ";"), "margin" === r && "\n    padding-left: ".concat(a, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(s, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(i, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(i, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(ri, " {\n    right: ").concat(l, "px ").concat(i, ";\n  }\n  \n  .").concat(ra, " {\n    margin-right: ").concat(l, "px ").concat(i, ";\n  }\n  \n  .").concat(ri, " .").concat(ri, " {\n    right: 0 ").concat(i, ";\n  }\n  \n  .").concat(ra, " .").concat(ra, " {\n    margin-right: 0 ").concat(i, ";\n  }\n  \n  body[").concat(rg, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                rw = function() {
                    var t = parseInt(document.body.getAttribute(rg) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                rS = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        i = t.gapMode,
                        a = void 0 === i ? "margin" : i;
                    eG.useEffect(function() {
                        return document.body.setAttribute(rg, (rw() + 1).toString()),
                            function() {
                                var t = rw() - 1;
                                t <= 0 ? document.body.removeAttribute(rg) : document.body.setAttribute(rg, t.toString())
                            }
                    }, []);
                    var o = eG.useMemo(function() {
                        return ry(a)
                    }, [a]);
                    return eG.createElement(rb, {
                        styles: rx(o, !n, a, r ? "" : "!important")
                    })
                },
                rE = !1;
            if ("undefined" != typeof window) try {
                var rP = Object.defineProperty({}, "passive", {
                    get: function() {
                        return rE = !0, !0
                    }
                });
                window.addEventListener("test", rP, rP), window.removeEventListener("test", rP, rP)
            } catch (t) {
                rE = !1
            }
            var rT, rO, rN, rj, rI, rC, rD, rA = !!rE && {
                    passive: !1
                },
                rk = function(t, n) {
                    if (!nl(t, Element)) return !1;
                    var r = window.getComputedStyle(t);
                    return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
                },
                rR = function(t, n) {
                    var r = n.ownerDocument,
                        i = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && nl(i, ShadowRoot) && (i = i.host), rM(t, i)) {
                            var a = r_(t, i);
                            if (a[1] > a[2]) return !0
                        }
                        i = i.parentNode
                    } while (i && i !== r.body);
                    return !1
                },
                rM = function(t, n) {
                    return "v" === t ? rk(n, "overflowY") : rk(n, "overflowX")
                },
                r_ = function(t, n) {
                    return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
                },
                rL = function(t, n, r, i, a) {
                    var o, s = (o = window.getComputedStyle(n).direction, "h" === t && "rtl" === o ? -1 : 1),
                        l = s * i,
                        c = r.target,
                        u = n.contains(c),
                        d = !1,
                        f = l > 0,
                        p = 0,
                        m = 0;
                    do {
                        var h = r_(t, c),
                            v = h[0],
                            y = h[1] - h[2] - s * v;
                        (v || y) && rM(t, c) && (p += y, m += v), c = nl(c, ShadowRoot) ? c.host : c.parentNode
                    } while (!u && c !== document.body || u && (n.contains(c) || n === c));
                    return (f && (a && 1 > Math.abs(p) || !a && l > p) || !f && (a && 1 > Math.abs(m) || !a && -l > m)) && (d = !0), d
                },
                rU = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                rB = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                rF = function(t) {
                    return t && "current" in t ? t.current : t
                },
                rz = 0,
                rG = [],
                rW = (rD = function(t) {
                    var n = eG.useRef([]),
                        r = eG.useRef([0, 0]),
                        i = eG.useRef(),
                        a = eG.useState(rz++)[0],
                        o = eG.useState(rm)[0],
                        s = eG.useRef(t);
                    eG.useEffect(function() {
                        s.current = t
                    }, [t]), eG.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var n = (function(t, n, r) {
                                if (r || 2 == arguments.length)
                                    for (var i, a = 0, o = n.length; a < o; a++) !i && a in n || (i || (i = Array.prototype.slice.call(n, 0, a)), i[a] = n[a]);
                                return t.concat(i || Array.prototype.slice.call(n))
                            })([t.lockRef.current], (t.shards || []).map(rF), !0).filter(Boolean);
                            return n.forEach(function(t) {
                                    return t.classList.add("allow-interactivity-".concat(a))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(a)), n.forEach(function(t) {
                                        return t.classList.remove("allow-interactivity-".concat(a))
                                    })
                                }
                        }
                    }, [t.inert, t.lockRef.current, t.shards]);
                    var l = eG.useCallback(function(t, n) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !s.current.allowPinchZoom;
                            var a, o = rU(t),
                                l = r.current,
                                c = "deltaX" in t ? t.deltaX : l[0] - o[0],
                                u = "deltaY" in t ? t.deltaY : l[1] - o[1],
                                d = t.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in t && "h" === f && "range" === d.type) return !1;
                            var p = rR(f, d);
                            if (!p) return !0;
                            if (p ? a = f : (a = "v" === f ? "h" : "v", p = rR(f, d)), !p) return !1;
                            if (!i.current && "changedTouches" in t && (c || u) && (i.current = a), !a) return !0;
                            var m = i.current || a;
                            return rL(m, n, t, "h" === m ? c : u, !0)
                        }, []),
                        c = eG.useCallback(function(t) {
                            if (rG.length && rG[rG.length - 1] === o) {
                                var r = "deltaY" in t ? rB(t) : rU(t),
                                    i = n.current.filter(function(n) {
                                        var i;
                                        return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (i = n.delta, i[0] === r[0] && i[1] === r[1])
                                    })[0];
                                if (i && i.should) t.cancelable && t.preventDefault();
                                else if (!i) {
                                    var a = (s.current.shards || []).map(rF).filter(Boolean).filter(function(n) {
                                        return n.contains(t.target)
                                    });
                                    (a.length > 0 ? l(t, a[0]) : !s.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        u = eG.useCallback(function(t, r, i, a) {
                            var o = {
                                name: t,
                                delta: r,
                                target: i,
                                should: a,
                                shadowParent: function(t) {
                                    for (var n = null; null !== t;) nl(t, ShadowRoot) && (n = t.host, t = t.host), t = t.parentNode;
                                    return n
                                }(i)
                            };
                            n.current.push(o), setTimeout(function() {
                                n.current = n.current.filter(function(t) {
                                    return t !== o
                                })
                            }, 1)
                        }, []),
                        d = eG.useCallback(function(t) {
                            r.current = rU(t), i.current = void 0
                        }, []),
                        f = eG.useCallback(function(n) {
                            u(n.type, rB(n), n.target, l(n, t.lockRef.current))
                        }, []),
                        p = eG.useCallback(function(n) {
                            u(n.type, rU(n), n.target, l(n, t.lockRef.current))
                        }, []);
                    eG.useEffect(function() {
                        return rG.push(o), t.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, rA), document.addEventListener("touchmove", c, rA), document.addEventListener("touchstart", d, rA),
                            function() {
                                rG = rG.filter(function(t) {
                                    return t !== o
                                }), document.removeEventListener("wheel", c, rA), document.removeEventListener("touchmove", c, rA), document.removeEventListener("touchstart", d, rA)
                            }
                    }, []);
                    var m = t.removeScrollBar,
                        h = t.inert;
                    return eG.createElement(eG.Fragment, null, h ? eG.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
                    }) : null, m ? eG.createElement(rS, {
                        gapMode: t.gapMode
                    }) : null)
                }, ru.useMedium(rD), rc),
                rV = eG.forwardRef(function(t, n) {
                    return eG.createElement(rf, eV({}, t, {
                        ref: n,
                        sideCar: rW
                    }))
                });

            function rq(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function rK(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function rX(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        i = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), i.forEach(function(n) {
                        rK(t, n, r[n])
                    })
                }
                return t
            }

            function rH(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, i)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function rY(t, n) {
                if (null == t) return {};
                var r, i, a = function(t, n) {
                    if (null == t) return {};
                    var r, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) r = o[i], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) r = o[i], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function r$(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), !n || o.length !== n); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, n) || rZ(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rJ(t) {
                return function(t) {
                    if (Array.isArray(t)) return rq(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || rZ(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rZ(t, n) {
                if (t) {
                    if ("string" == typeof t) return rq(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rq(t, n)
                }
            }

            function rQ(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    i = r.checkForDefaultPrevented,
                    a = void 0 === i || i;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function r0(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function r1() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        i = n.map(function(n) {
                            var i = r0(n, t);
                            return r || "function" != typeof i || (r = !0), i
                        });
                    if (r) return function() {
                        for (var t = 0; t < i.length; t++) {
                            var r = i[t];
                            "function" == typeof r ? r() : r0(n[t], null)
                        }
                    }
                }
            }

            function r2() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return eG.useCallback(r1.apply(void 0, rJ(n)), n)
            }

            function r3() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var i = n[0];
                if (1 === n.length) return i;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var i = r.useScope,
                                a = r.scopeName;
                            return rX({}, t, i(n)["__scope".concat(a)])
                        }, {});
                        return eG.useMemo(function() {
                            return rK({}, "__scope".concat(i.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = i.scopeName, a
            }

            function r4(t) {
                var n = eG.useRef(t);
                return eG.useEffect(function() {
                    n.current = t
                }), eG.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(rJ(i)))
                    }
                }, [])
            }
            rV.classNames = rf.classNames;
            var r5 = (null == (o = globalThis) ? void 0 : o.document) ? eG.useLayoutEffect : function() {},
                r6 = function(t) {
                    var n, r, i, a, o, s, l, c, u, d, f, p, m, h, v = t.present,
                        y = t.children,
                        b = (a = (i = r$(eG.useState(), 2))[0], o = i[1], s = eG.useRef({}), l = eG.useRef(v), c = eG.useRef("none"), d = (u = r$((n = v ? "mounted" : "unmounted", r = {
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
                        }, eG.useReducer(function(t, n) {
                            var i;
                            return null != (i = r[t][n]) ? i : t
                        }, n)), 2))[0], f = u[1], eG.useEffect(function() {
                            var t = r8(s.current);
                            c.current = "mounted" === d ? t : "none"
                        }, [d]), r5(function() {
                            var t = s.current,
                                n = l.current;
                            if (n !== v) {
                                var r = c.current,
                                    i = r8(t);
                                v ? f("MOUNT") : "none" === i || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(n && r !== i ? "ANIMATION_OUT" : "UNMOUNT"), l.current = v
                            }
                        }, [v, f]), r5(function() {
                            if (a) {
                                var t, n, r = null != (n = a.ownerDocument.defaultView) ? n : window,
                                    i = function(n) {
                                        var i = r8(s.current).includes(n.animationName);
                                        if (n.target === a && i && (f("ANIMATION_END"), !l.current)) {
                                            var o = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                            })
                                        }
                                    },
                                    o = function(t) {
                                        t.target === a && (c.current = r8(s.current))
                                    };
                                return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", i), a.addEventListener("animationend", i),
                                    function() {
                                        r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", i), a.removeEventListener("animationend", i)
                                    }
                            }
                            f("ANIMATION_END")
                        }, [a, f]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(d),
                            ref: eG.useCallback(function(t) {
                                t && (s.current = getComputedStyle(t)), o(t)
                            }, [])
                        }),
                        g = "function" == typeof y ? y({
                            present: b.isPresent
                        }) : eG.Children.only(y),
                        x = r2(b.ref, (h = null == (p = Object.getOwnPropertyDescriptor(g.props, "ref")) ? void 0 : p.get) && "isReactWarning" in h && h.isReactWarning ? g.ref : (h = null == (m = Object.getOwnPropertyDescriptor(g, "ref")) ? void 0 : m.get) && "isReactWarning" in h && h.isReactWarning ? g.props.ref : g.props.ref || g.ref);
                    return "function" == typeof y || b.isPresent ? eG.cloneElement(g, {
                        ref: x
                    }) : null
                };

            function r8(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function r7(t) {
                var n, r, i = (n = t, (r = eG.forwardRef(function(t, n) {
                        var r = t.children,
                            i = rY(t, ["children"]);
                        if (eG.isValidElement(r)) {
                            var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? r.ref : (s = null == (o = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = rX({}, n);
                                    for (var i in n) ! function(i) {
                                        var a = t[i],
                                            o = n[i];
                                        /^on[A-Z]/.test(i) ? a && o ? r[i] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            o.apply(void 0, rJ(n)), a.apply(void 0, rJ(n))
                                        } : a && (r[i] = a) : "style" === i ? r[i] = rX({}, a, o) : "className" === i && (r[i] = [a, o].filter(Boolean).join(" "))
                                    }(i);
                                    return rX({}, t, r)
                                }(i, r.props);
                            return r.type !== eG.Fragment && (c.ref = n ? r1(n, l) : l), eG.cloneElement(r, c)
                        }
                        return eG.Children.count(r) > 1 ? eG.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = eG.forwardRef(function(t, n) {
                        var r = t.children,
                            a = rY(t, ["children"]),
                            o = eG.Children.toArray(r),
                            l = o.find(ie);
                        if (l) {
                            var c = l.props.children,
                                u = o.map(function(t) {
                                    return t === l ? eG.Children.count(c) > 1 ? eG.Children.only(null) : eG.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, s.jsx)(i, rH(rX({}, a), {
                                ref: n,
                                children: eG.isValidElement(c) ? eG.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, s.jsx)(i, rH(rX({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            r6.displayName = "Presence";
            var r9 = Symbol("radix.slottable");

            function ie(t) {
                return eG.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === r9
            }
            var it = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = r7("Primitive.".concat(n)),
                        i = eG.forwardRef(function(t, i) {
                            var a = t.asChild,
                                o = rY(t, ["asChild"]),
                                l = a ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(l, rH(rX({}, o), {
                                ref: i
                            }))
                        });
                    return i.displayName = "Primitive.".concat(n), rH(rX({}, t), rK({}, n, i))
                }, {}),
                ir = "Dialog",
                ii = r$(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        i = function() {
                            var n = r.map(function(t) {
                                return eG.createContext(t)
                            });
                            return function(r) {
                                var i = (null == r ? void 0 : r[t]) || n;
                                return eG.useMemo(function() {
                                    return rK({}, "__scope".concat(t), rH(rX({}, r), rK({}, t, i)))
                                }, [r, i])
                            }
                        };
                    return i.scopeName = t, [function(n, i) {
                        var a = eG.createContext(i),
                            o = r.length;
                        r = rJ(r).concat([i]);
                        var l = function(n) {
                            var r, i = n.scope,
                                l = n.children,
                                c = rY(n, ["scope", "children"]),
                                u = (null == i || null == (r = i[t]) ? void 0 : r[o]) || a,
                                d = eG.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, s.jsx)(u.Provider, {
                                value: d,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, s) {
                            var l, c = (null == s || null == (l = s[t]) ? void 0 : l[o]) || a,
                                u = eG.useContext(c);
                            if (u) return u;
                            if (void 0 !== i) return i;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, r3.apply(void 0, [i].concat(rJ(n)))]
                }(ir), 2),
                ia = ii[0],
                io = (ii[1], r$(ia(ir), 2)),
                is = io[0],
                il = io[1],
                ic = function(t) {
                    var n, r, i, a, o, l, c, u, d, f, p, m, h, v, y, b, g, x = t.__scopeDialog,
                        w = t.children,
                        S = t.open,
                        E = t.defaultOpen,
                        P = t.onOpenChange,
                        T = t.modal,
                        O = eG.useRef(null),
                        N = eG.useRef(null),
                        j = r$((r = (n = {
                            prop: S,
                            defaultProp: E,
                            onChange: P
                        }).prop, h = (m = r$((l = (o = {
                            defaultProp: n.defaultProp,
                            onChange: a = void 0 === (i = n.onChange) ? function() {} : i
                        }).defaultProp, c = o.onChange, d = r$(u = eG.useState(l), 1)[0], f = eG.useRef(d), p = r4(c), eG.useEffect(function() {
                            f.current !== d && (p(d), f.current = d)
                        }, [d, f, p]), u), 2))[0], v = m[1], b = (y = void 0 !== r) ? r : h, g = r4(a), [b, eG.useCallback(function(t) {
                            if (y) {
                                var n = "function" == typeof t ? t(r) : t;
                                n !== r && g(n)
                            } else v(t)
                        }, [y, r, v, g])]), 2),
                        I = j[0],
                        C = j[1];
                    return (0, s.jsx)(is, {
                        scope: x,
                        triggerRef: O,
                        contentRef: N,
                        contentId: nr(),
                        titleId: nr(),
                        descriptionId: nr(),
                        open: void 0 !== I && I,
                        onOpenChange: C,
                        onOpenToggle: eG.useCallback(function() {
                            return C(function(t) {
                                return !t
                            })
                        }, [C]),
                        modal: void 0 === T || T,
                        children: w
                    })
                };
            ic.displayName = ir;
            var iu = "DialogTrigger";
            eG.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    i = rY(t, ["__scopeDialog"]),
                    a = il(iu, r),
                    o = r2(n, a.triggerRef);
                return (0, s.jsx)(it.button, rH(rX({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": a.open,
                    "aria-controls": a.contentId,
                    "data-state": iD(a.open)
                }, i), {
                    ref: o,
                    onClick: rQ(t.onClick, a.onOpenToggle)
                }))
            }).displayName = iu;
            var id = "DialogPortal",
                ip = r$(ia(id, {
                    forceMount: void 0
                }), 2),
                im = ip[0],
                ih = ip[1],
                iv = function(t) {
                    var n = t.__scopeDialog,
                        r = t.forceMount,
                        i = t.children,
                        a = t.container,
                        o = il(id, n);
                    return (0, s.jsx)(im, {
                        scope: n,
                        forceMount: r,
                        children: eG.Children.map(i, function(t) {
                            return (0, s.jsx)(r6, {
                                present: r || o.open,
                                children: (0, s.jsx)(n6, {
                                    asChild: !0,
                                    container: a,
                                    children: t
                                })
                            })
                        })
                    })
                };
            iv.displayName = id;
            var iy = "DialogOverlay",
                ib = eG.forwardRef(function(t, n) {
                    var r = ih(iy, t.__scopeDialog),
                        i = t.forceMount,
                        a = void 0 === i ? r.forceMount : i,
                        o = rY(t, ["forceMount"]),
                        l = il(iy, t.__scopeDialog);
                    return l.modal ? (0, s.jsx)(r6, {
                        present: a || l.open,
                        children: (0, s.jsx)(ix, rH(rX({}, o), {
                            ref: n
                        }))
                    }) : null
                });
            ib.displayName = iy;
            var ig = r7("DialogOverlay.RemoveScroll"),
                ix = eG.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        i = rY(t, ["__scopeDialog"]),
                        a = il(iy, r);
                    return (0, s.jsx)(rV, {
                        as: ig,
                        allowPinchZoom: !0,
                        shards: [a.contentRef],
                        children: (0, s.jsx)(it.div, rH(rX({
                            "data-state": iD(a.open)
                        }, i), {
                            ref: n,
                            style: rX({
                                pointerEvents: "auto"
                            }, i.style)
                        }))
                    })
                }),
                iw = "DialogContent",
                iS = eG.forwardRef(function(t, n) {
                    var r = ih(iw, t.__scopeDialog),
                        i = t.forceMount,
                        a = void 0 === i ? r.forceMount : i,
                        o = rY(t, ["forceMount"]),
                        l = il(iw, t.__scopeDialog);
                    return (0, s.jsx)(r6, {
                        present: a || l.open,
                        children: l.modal ? (0, s.jsx)(iE, rH(rX({}, o), {
                            ref: n
                        })) : (0, s.jsx)(iP, rH(rX({}, o), {
                            ref: n
                        }))
                    })
                });
            iS.displayName = iw;
            var iE = eG.forwardRef(function(t, n) {
                    var r = il(iw, t.__scopeDialog),
                        i = eG.useRef(null),
                        a = r2(n, r.contentRef, i);
                    return eG.useEffect(function() {
                        var t = i.current;
                        if (t) return rr(t)
                    }, []), (0, s.jsx)(iT, rH(rX({}, t), {
                        ref: a,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: rQ(t.onCloseAutoFocus, function(t) {
                            var n;
                            t.preventDefault(), null == (n = r.triggerRef.current) || n.focus()
                        }),
                        onPointerDownOutside: rQ(t.onPointerDownOutside, function(t) {
                            var n = t.detail.originalEvent,
                                r = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || r) && t.preventDefault()
                        }),
                        onFocusOutside: rQ(t.onFocusOutside, function(t) {
                            return t.preventDefault()
                        })
                    }))
                }),
                iP = eG.forwardRef(function(t, n) {
                    var r = il(iw, t.__scopeDialog),
                        i = eG.useRef(!1),
                        a = eG.useRef(!1);
                    return (0, s.jsx)(iT, rH(rX({}, t), {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var o, s;
                            null == (o = t.onCloseAutoFocus) || o.call(t, n), n.defaultPrevented || (i.current || null == (s = r.triggerRef.current) || s.focus(), n.preventDefault()), i.current = !1, a.current = !1
                        },
                        onInteractOutside: function(n) {
                            null == (o = t.onInteractOutside) || o.call(t, n), n.defaultPrevented || (i.current = !0, "pointerdown" === n.detail.originalEvent.type && (a.current = !0));
                            var o, s, l = n.target;
                            (null == (s = r.triggerRef.current) ? void 0 : s.contains(l)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && a.current && n.preventDefault()
                        }
                    }))
                }),
                iT = eG.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        i = t.trapFocus,
                        a = t.onOpenAutoFocus,
                        o = t.onCloseAutoFocus,
                        l = rY(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        c = il(iw, r),
                        u = eG.useRef(null),
                        d = r2(n, u);
                    return eG.useEffect(function() {
                        var t, n, r = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : nB()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : nB()), nU++,
                            function() {
                                1 === nU && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                    return t.remove()
                                }), nU--
                            }
                    }, []), (0, s.jsxs)(s.Fragment, {
                        children: [(0, s.jsx)(nY, {
                            asChild: !0,
                            loop: !0,
                            trapped: i,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: o,
                            children: (0, s.jsx)(nM, rH(rX({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": iD(c.open)
                            }, l), {
                                ref: d,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, s.jsxs)(s.Fragment, {
                            children: [(0, s.jsx)(iM, {
                                titleId: c.titleId
                            }), (0, s.jsx)(i_, {
                                contentRef: u,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                }),
                iO = "DialogTitle",
                iN = eG.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        i = rY(t, ["__scopeDialog"]),
                        a = il(iO, r);
                    return (0, s.jsx)(it.h2, rH(rX({
                        id: a.titleId
                    }, i), {
                        ref: n
                    }))
                });
            iN.displayName = iO;
            var ij = "DialogDescription";
            eG.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    i = rY(t, ["__scopeDialog"]),
                    a = il(ij, r);
                return (0, s.jsx)(it.p, rH(rX({
                    id: a.descriptionId
                }, i), {
                    ref: n
                }))
            }).displayName = ij;
            var iI = "DialogClose",
                iC = eG.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        i = rY(t, ["__scopeDialog"]),
                        a = il(iI, r);
                    return (0, s.jsx)(it.button, rH(rX({
                        type: "button"
                    }, i), {
                        ref: n,
                        onClick: rQ(t.onClick, function() {
                            return a.onOpenChange(!1)
                        })
                    }))
                });

            function iD(t) {
                return t ? "open" : "closed"
            }
            iC.displayName = iI;
            var iA = "DialogTitleWarning",
                ik = r$((t = {
                    contentName: iw,
                    titleName: iO,
                    docsSlug: "dialog"
                }, n = eG.createContext(t), (i = function(t) {
                    var r = t.children,
                        i = rY(t, ["children"]),
                        a = eG.useMemo(function() {
                            return i
                        }, Object.values(i));
                    return (0, s.jsx)(n.Provider, {
                        value: a,
                        children: r
                    })
                }).displayName = iA + "Provider", [i, function(r) {
                    var i = eG.useContext(n);
                    if (i) return i;
                    if (void 0 !== t) return t;
                    throw Error("`".concat(r, "` must be used within `").concat(iA, "`"))
                }]), 2),
                iR = (ik[0], ik[1]),
                iM = function(t) {
                    var n = t.titleId,
                        r = iR(iA),
                        i = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return eG.useEffect(function() {
                        n && (document.getElementById(n) || console.error(i))
                    }, [i, n]), null
                },
                i_ = function(t) {
                    var n = t.contentRef,
                        r = t.descriptionId,
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(iR("DialogDescriptionWarning").contentName, "}.");
                    return eG.useEffect(function() {
                        var t, a = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                        r && a && (document.getElementById(r) || console.warn(i))
                    }, [i, n, r]), null
                };

            function iL(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function iU(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function iB(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        i = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), i.forEach(function(n) {
                        iU(t, n, r[n])
                    })
                }
                return t
            }

            function iF(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, i)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function iz(t, n) {
                if (null == t) return {};
                var r, i, a = function(t, n) {
                    if (null == t) return {};
                    var r, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) r = o[i], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) r = o[i], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function iG(t) {
                return function(t) {
                    if (Array.isArray(t)) return iL(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return iL(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iL(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iW(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var iV = Symbol("radix.slottable");

            function iq(t) {
                return eG.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === iV
            }
            var iK = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, i, a, o, l, c = (i = r = "Primitive.".concat(n), (a = eG.forwardRef(function(t, n) {
                            var r = t.children,
                                i = iz(t, ["children"]);
                            if (eG.isValidElement(r)) {
                                var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? r.ref : (s = null == (o = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = iB({}, n);
                                        for (var i in n) ! function(i) {
                                            var a = t[i],
                                                o = n[i];
                                            /^on[A-Z]/.test(i) ? a && o ? r[i] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                var i = o.apply(void 0, iG(n));
                                                return a.apply(void 0, iG(n)), i
                                            } : a && (r[i] = a) : "style" === i ? r[i] = iB({}, a, o) : "className" === i && (r[i] = [a, o].filter(Boolean).join(" "))
                                        }(i);
                                        return iB({}, t, r)
                                    }(i, r.props);
                                return r.type !== eG.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            i = n.map(function(n) {
                                                var i = iW(n, t);
                                                return r || "function" != typeof i || (r = !0), i
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < i.length; t++) {
                                                var r = i[t];
                                                "function" == typeof r ? r() : iW(n[t], null)
                                            }
                                        }
                                    }
                                }(n, l) : l), eG.cloneElement(r, c)
                            }
                            return eG.Children.count(r) > 1 ? eG.Children.only(null) : null
                        })).displayName = "".concat(i, ".SlotClone"), o = a, (l = eG.forwardRef(function(t, n) {
                            var r = t.children,
                                i = iz(t, ["children"]),
                                a = eG.Children.toArray(r),
                                l = a.find(iq);
                            if (l) {
                                var c = l.props.children,
                                    u = a.map(function(t) {
                                        return t === l ? eG.Children.count(c) > 1 ? eG.Children.only(null) : eG.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, s.jsx)(o, iF(iB({}, i), {
                                    ref: n,
                                    children: eG.isValidElement(c) ? eG.cloneElement(c, void 0, u) : null
                                }))
                            }
                            return (0, s.jsx)(o, iF(iB({}, i), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = eG.forwardRef(function(t, r) {
                            var i = t.asChild,
                                a = iz(t, ["asChild"]),
                                o = i ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(o, iF(iB({}, a), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), iF(iB({}, t), iU({}, n, u))
                }, {}),
                iX = Object.freeze({
                    position: "absolute",
                    border: 0,
                    width: 1,
                    height: 1,
                    padding: 0,
                    margin: -1,
                    overflow: "hidden",
                    clip: "rect(0, 0, 0, 0)",
                    whiteSpace: "nowrap",
                    wordWrap: "normal"
                }),
                iH = eG.forwardRef(function(t, n) {
                    return (0, s.jsx)(iK.span, iF(iB({}, t), {
                        ref: n,
                        style: iB({}, iX, t.style)
                    }))
                });
            iH.displayName = "VisuallyHidden";
            var iY = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                i$ = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                iJ = function(t) {
                    var n = t.variant,
                        r = t.size,
                        i = t.isCircular,
                        a = t.className,
                        o = eq(t, ["variant", "size", "isCircular", "className"]);
                    return eW().createElement("button", Object.assign({
                        type: "button",
                        className: eK("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", e7, i$[n], iY[r], i && "radius-circle", a)
                    }, o), eW().createElement(e9, null), eW().createElement(eH, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };
            tt(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var iZ = (0, eG.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                iQ = function() {
                    var t = (0, eG.useContext)(iZ);
                    if (!t) throw Error("Dialog components must be used within a Dialog");
                    return t
                },
                i0 = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                i1 = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                i2 = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                i3 = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        i = t.children,
                        a = t.size,
                        o = t.type,
                        s = void 0 === o ? "Default" : o,
                        l = t.isModal,
                        c = t.hasCloseAffordance,
                        u = t.closeLabel,
                        d = t.hasMarginTop,
                        f = void 0 === d || d,
                        p = t.hasMarginBottom,
                        m = void 0 === p || p,
                        h = t.hasDescription,
                        v = void 0 !== h && h,
                        y = t.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== y && y,
                        g = (0, eG.useMemo)(function() {
                            return {
                                size: a,
                                isModal: l,
                                type: s,
                                hasCloseAffordance: c,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: m,
                                hasDescription: v
                            }
                        }, [a, l, s, c, u, f, m, v]);
                    return (0, eG.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, n]), eW().createElement(iZ.Provider, {
                        value: g
                    }, eW().createElement(ic, {
                        open: n,
                        onOpenChange: r
                    }, i))
                };
            i3.displayName = "Dialog";
            var i4 = function(t) {
                var n = t.children,
                    r = t.className,
                    i = t.style,
                    a = t.overlayClassName,
                    o = t.overlayStyle,
                    s = t.onOpenAutoFocus,
                    l = eq(t, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = iQ(),
                    u = c.size,
                    d = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    m = c.hasDescription,
                    h = eK("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", d && "bg-common-backdrop", a),
                    v = eK("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return eW().createElement(iv, null, eW().createElement(ib, {
                    className: h,
                    style: o
                }, eW().createElement(iS, Object.assign({
                    className: v,
                    "data-size": u,
                    style: i,
                    onOpenAutoFocus: s
                }, !m && {
                    "aria-describedby": void 0
                }, l), f && eW().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, eW().createElement(iC, {
                    asChild: !0
                }, eW().createElement(iJ, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": p
                }))), n)))
            };
            i4.displayName = "DialogContent";
            var i5 = function(t) {
                var n = t.children,
                    r = t.className,
                    i = eq(t, ["children", "className"]),
                    a = iQ(),
                    o = a.size,
                    s = a.hasMarginTop,
                    l = a.hasMarginBottom,
                    c = eK(i0[o], s && i1[o], l && i2[o], r);
                return eW().createElement("div", Object.assign({
                    className: c
                }, i), n)
            };
            i5.displayName = "DialogBody";
            var i6 = function(t) {
                var n = t.children,
                    r = t.className,
                    i = t.hidden,
                    a = eq(t, ["children", "className", "hidden"]),
                    o = eW().createElement(iN, Object.assign({
                        className: r
                    }, a), n);
                return i ? eW().createElement(iH, null, o) : o
            };
            i6.displayName = "DialogTitle";
            var i8 = function(t) {
                var n = t.children,
                    r = t.className,
                    i = eq(t, ["children", "className"]),
                    a = iQ().size,
                    o = eK(i0[a], i2[a], r);
                return eW().createElement("div", Object.assign({
                    className: o
                }, i), n)
            };
            i8.displayName = "DialogFooter";
            var i7 = function(t) {
                var n = t.open,
                    r = t.onOpenChange,
                    i = t.title,
                    a = t.body,
                    o = (0, l.useTranslation)().translate;
                return (0, s.jsx)(i3, {
                    closeLabel: o("Action.Close"),
                    hasCloseAffordance: !0,
                    isModal: !0,
                    open: n,
                    size: "Small",
                    type: "Default",
                    onOpenChange: r,
                    children: (0, s.jsxs)(i4, {
                        className: "stroke-standard stroke-default flex flex-col items-start",
                        style: {
                            width: "100%",
                            maxWidth: 320
                        },
                        children: [(0, s.jsxs)(i5, {
                            className: "width-full gap-small padding-top-medium padding-x-xlarge padding-bottom-large flex flex-col items-start",
                            children: [(0, s.jsx)(i6, {
                                className: "margin-none text-heading-small content-emphasis text-align-x-start",
                                children: i
                            }), (0, s.jsx)("p", {
                                className: "margin-none text-body-medium content-default text-align-x-start whitespace-pre-line",
                                children: a
                            })]
                        }), (0, s.jsx)(i8, {
                            className: "width-full",
                            children: (0, s.jsx)(ts, {
                                className: "width-full",
                                size: "Medium",
                                variant: "Emphasis",
                                onClick: function() {
                                    r(!1)
                                },
                                children: o("Action.OK")
                            })
                        })]
                    })
                })
            };

            function i9(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function ae(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }
            var at = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof window ? window : void 0 !== r.g ? r.g : "undefined" != typeof self ? self : {},
                an = "object" == (void 0 === at ? "undefined" : ae(at)) && at && at.Object === Object && at,
                ar = "object" == ("undefined" == typeof self ? "undefined" : ae(self)) && self && self.Object === Object && self;
            an || ar || Function("return this")();
            var ai = "undefined" != typeof window ? eG.useLayoutEffect : eG.useEffect,
                aa = "undefined" == typeof window;

            function ao(t) {
                var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    i = r.defaultValue,
                    a = void 0 !== i && i,
                    o = r.initializeWithValue,
                    s = void 0 === o || o,
                    l = function(t) {
                        return aa ? a : window.matchMedia(t).matches
                    },
                    c = (n = (0, eG.useState)(function() {
                        return s ? l(t) : a
                    }), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), o.length !== n); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return i9(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i9(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    u = c[0],
                    d = c[1];

                function f() {
                    d(l(t))
                }
                return ai(function() {
                    var n = window.matchMedia(t);
                    return f(), n.addListener ? n.addListener(f) : n.addEventListener("change", f),
                        function() {
                            n.removeListener ? n.removeListener(f) : n.removeEventListener("change", f)
                        }
                }, [t]), u
            }
            var as = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                al = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                ac = {
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
                au = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ad = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                af = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                ap = {
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
                am = {
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
                ah = (0, eG.forwardRef)(function(t, n) {
                    var r, i = t.className,
                        a = t.icon,
                        o = t.ariaLabel,
                        s = t.isDisabled,
                        l = void 0 !== s && s,
                        c = t.isCircular,
                        u = t.isSelected,
                        d = t.size,
                        f = void 0 === d ? "Large" : d,
                        p = t.variant,
                        m = void 0 === p ? "Emphasis" : p,
                        h = t.iconColor,
                        v = void 0 === h ? "Default" : h,
                        y = t.asChild,
                        b = t.children,
                        g = eq(t, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    r = l ? ad[m] : void 0 !== u && u ? af[m] : au[m];
                    var x = eK("foundation-web-icon-button", l ? te : [e7, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", as[f], ac[f][void 0 !== c && c ? "circular" : "square"], r, i),
                        w = eW().createElement(eW().Fragment, null, eW().createElement(e9, null), eW().createElement("span", {
                            className: eK("icon", a, al[f], l ? am[v][m] : ap[v][m])
                        }));
                    if (y) {
                        var S = eq(g, ["as"]),
                            E = eW().Children.only(b);
                        return eW().createElement(e5, Object.assign({
                            ref: n
                        }, S, {
                            className: x,
                            "aria-label": o,
                            "aria-disabled": l || void 0
                        }), eW().cloneElement(E, {}, w))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var P = g.href,
                            T = eq(g, ["as", "href"]);
                        return eW().createElement("a", Object.assign({
                            ref: n
                        }, T, {
                            "aria-label": o,
                            "aria-disabled": l,
                            href: l ? void 0 : P,
                            className: x
                        }), w)
                    }
                    var O = eq(g, ["as"]);
                    return eW().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, O, {
                        "aria-label": o,
                        disabled: l,
                        className: x
                    }), w)
                }),
                av = (0, eG.forwardRef)(function(t, n) {
                    var r = t.className,
                        i = t.style,
                        a = t.orientation,
                        o = void 0 === a ? "horizontal" : a,
                        s = t.variant,
                        l = void 0 === s ? "Standard" : s,
                        c = eq(t, ["className", "style", "orientation", "variant"]),
                        u = "vertical" === o,
                        d = {};
                    return u || "Inset" !== l ? u || "InsetLeft" !== l ? u || "InsetRight" !== l || (d = {
                        marginRight: "var(--padding-xlarge)"
                    }) : d = {
                        marginLeft: "var(--padding-xlarge)"
                    } : d = {
                        marginLeft: "var(--padding-xlarge)",
                        marginRight: "var(--padding-xlarge)"
                    }, eW().createElement("div", Object.assign({
                        ref: n
                    }, c, {
                        role: "separator",
                        "data-orientation": o,
                        "aria-orientation": o,
                        style: Object.assign(Object.assign(Object.assign({
                            borderRightWidth: 0,
                            borderBottomWidth: 0,
                            boxSizing: "border-box",
                            borderStyle: "solid"
                        }, u ? {
                            height: "100%",
                            width: 0,
                            borderLeftWidth: "var(--stroke-standard)",
                            borderTopWidth: 0
                        } : "Thick" === l ? {
                            height: "var(--size-250)",
                            borderTop: "var(--stroke-standard)",
                            borderLeftWidth: 0,
                            background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                        } : {
                            height: 0,
                            borderTopWidth: "var(--stroke-standard)",
                            borderLeftWidth: 0
                        }), d), i),
                        className: eK("stroke-default self-stretch", r)
                    }))
                });
            av.displayName = "Divider", tt("@keyframes fui-base-sheet-overlay-fade-in{0%{background-color:transparent}to{background-color:var(--color-common-backdrop)}}@keyframes fui-base-sheet-overlay-fade-out{0%{background-color:var(--color-common-backdrop)}to{background-color:transparent}}@keyframes fui-base-sheet-slide-in-from-right{0%{transform:translateX(110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-right{0%{transform:translateX(0)}to{transform:translateX(110%)}}@keyframes fui-base-sheet-slide-in-from-left{0%{transform:translateX(-110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-left{0%{transform:translateX(0)}to{transform:translateX(-110%)}}@keyframes fui-base-sheet-fade-in{0%{opacity:0}to{opacity:1}}@keyframes fui-base-sheet-fade-out{0%{opacity:1}to{opacity:0}}@keyframes fui-base-sheet-slide-in-from-bottom{0%{transform:translateY(110%)}to{transform:translateY(0)}}@keyframes fui-base-sheet-slide-out-to-bottom{0%{transform:translateY(0)}to{transform:translateY(110%)}}.fui-base-sheet-overlay{background-color:var(--color-common-backdrop)}.fui-base-sheet-overlay[data-state=open]{animation:fui-base-sheet-overlay-fade-in var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-state=closed]{animation:fui-base-sheet-overlay-fade-out var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-type=bottomSheet]{align-items:flex-end;justify-content:center}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:env(safe-area-inset-left);margin-right:env(safe-area-inset-right);max-height:90vh;max-width:440px;padding-bottom:env(safe-area-inset-bottom);width:100%}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=open]{animation-duration:var(--time-300);animation-timing-function:var(--ease-standard-out)}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=closed]{animation-duration:var(--time-100);animation-timing-function:var(--ease-standard-in)}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-bottom}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-bottom}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right]{align-items:stretch;justify-content:flex-end}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left]{align-items:stretch;justify-content:flex-start}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true] .fui-base-sheet-content{max-height:100vh;padding-bottom:env(safe-area-inset-bottom);padding-top:env(safe-area-inset-top);width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=right] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-right:env(safe-area-inset-right)}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=left] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-left:env(safe-area-inset-left)}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-left}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-left}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false] .fui-base-sheet-content{border-radius:var(--radius-large);margin:var(--padding-medium);margin-bottom:max(env(safe-area-inset-bottom),var(--padding-medium));margin-top:max(env(safe-area-inset-top),var(--padding-medium));max-height:100vh;max-width:360px;width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=right] .fui-base-sheet-content{margin-right:max(env(safe-area-inset-right),var(--padding-medium))}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=left] .fui-base-sheet-content{margin-left:max(env(safe-area-inset-left),var(--padding-medium))}.fui-base-sheet-overlay[data-type=centerSheet]{align-items:center;justify-content:center;padding:var(--padding-medium)}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content{border-radius:var(--radius-large);max-height:90vh}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Medium] .fui-base-sheet-content{max-width:480px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Large] .fui-base-sheet-content{max-width:640px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-fade-in}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-fade-out}");
            var ay = function(t) {
                var n = t.type,
                    r = t.sideSheetSide,
                    i = t.isSideSheetFlush,
                    a = t.centerSheetSize,
                    o = t.children,
                    s = t.overlayClassName,
                    l = t.contentClassName,
                    c = t.onOpenAutoFocus,
                    u = t.onCloseAutoFocus,
                    d = t.onPointerDownOutside,
                    f = t.onEscapeKeyDown,
                    p = t.onInteractOutside;
                return eW().createElement(iv, null, eW().createElement(ib, {
                    "data-testid": "fui-base-sheet-overlay",
                    "data-type": n,
                    "data-side": "sideSheet" === n ? void 0 === r ? "right" : r : void 0,
                    "data-flush": "sideSheet" === n ? void 0 !== i && i : void 0,
                    "data-size": "centerSheet" === n ? void 0 === a ? "Medium" : a : void 0,
                    className: eK("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", s)
                }, eW().createElement(iS, {
                    "data-testid": "fui-base-sheet-content",
                    className: eK("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                    onOpenAutoFocus: c,
                    onCloseAutoFocus: u,
                    onPointerDownOutside: d,
                    onEscapeKeyDown: f,
                    onInteractOutside: p
                }, o)))
            };

            function ab(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }
            var ag = function(t) {
                    var n, r = t.currentTarget;
                    if (r) {
                        var i = r.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== i.length) {
                            var a = [];
                            i.forEach(function(t) {
                                var n = parseInt(t.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(n) && ab(t, HTMLElement) && a.push({
                                    element: t,
                                    priority: n
                                })
                            }), a.sort(function(t, n) {
                                return t.priority - n.priority
                            });
                            var o = a.find(function(t) {
                                var n, r;
                                return ("function" != typeof(r = n = t.element).checkVisibility || r.checkVisibility()) && !!(!("disabled" in n) || !n.disabled) && "true" !== n.getAttribute("aria-disabled")
                            });
                            if (o) {
                                t.preventDefault();
                                var s = document.activeElement === o.element;
                                o.element.focus(), s || ab(n = o.element, HTMLInputElement) && "function" == typeof n.select && n.select()
                            }
                        }
                    }
                },
                ax = (0, eG.createContext)(null),
                aw = function() {
                    var t = (0, eG.useContext)(ax);
                    if (!t) throw Error("Sheet components must be used within a Sheet");
                    return t
                },
                aS = "padding-x-xlarge",
                aE = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        i = t.defaultOpen,
                        a = t.children;
                    return eW().createElement(ic, {
                        open: n,
                        onOpenChange: r,
                        defaultOpen: i,
                        modal: !0
                    }, a)
                },
                aP = function(t) {
                    var n, r = t.children,
                        i = t.centerSheetSize,
                        a = void 0 === i ? "Medium" : i,
                        o = t.largeScreenVariant,
                        s = void 0 === o ? "center" : o,
                        l = t.closeLabel,
                        c = t.className,
                        u = t.mobilePortraitClassName,
                        d = t.mobileLandscapeClassName,
                        f = t.largeScreenClassName,
                        p = t.onOpenAutoFocus,
                        m = t.onCloseAutoFocus,
                        h = t.onPointerDownOutside,
                        v = t.onEscapeKeyDown,
                        y = t.onInteractOutside,
                        b = ao("(orientation: portrait) and (max-width: 600px)"),
                        g = ao("(orientation: landscape) and (max-height: 600px)");
                    n = b ? "bottomSheet" : g || "side" === s ? "sideSheet" : "centerSheet";
                    var x = (0, eG.useMemo)(function() {
                            return {
                                centerSheetSize: a,
                                largeScreenVariant: s,
                                closeLabel: l,
                                isPortraitMobile: b,
                                isLandscapeMobile: g,
                                type: n
                            }
                        }, [a, s, l, b, g, n]),
                        w = eK(c, b && u, g && d, !b && !g && f);
                    return eW().createElement(ax.Provider, {
                        value: x
                    }, eW().createElement(ay, {
                        type: n,
                        sideSheetSide: "right",
                        isSideSheetFlush: g,
                        centerSheetSize: a,
                        contentClassName: w,
                        onOpenAutoFocus: null != p ? p : ag,
                        onCloseAutoFocus: m,
                        onPointerDownOutside: h,
                        onEscapeKeyDown: v,
                        onInteractOutside: y
                    }, r))
                },
                aT = (0, eG.forwardRef)(function(t, n) {
                    var r = t.children,
                        i = t.className,
                        a = t.hasPaddingX,
                        o = eq(t, ["children", "className", "hasPaddingX"]),
                        s = aw().type;
                    return eW().createElement("div", Object.assign({
                        ref: n,
                        className: eK("scroll-y", (void 0 === a || a) && aS, "sideSheet" === s ? "grow-1" : "", i)
                    }, o), r)
                });
            aT.displayName = "SheetBody";
            var aO = function(t) {
                    var n = t.className,
                        r = t.children,
                        i = t.navigation,
                        a = t.utilities,
                        o = t.visuallyHideTitleText,
                        s = aw().closeLabel,
                        l = eW().createElement(iN, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return eW().createElement("div", {
                        className: eK(n, i ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, eW().createElement("div", {
                        className: eK("flex items-center", i && "gap-xsmall")
                    }, i, o ? eW().createElement(iH, null, l) : l), eW().createElement("div", {
                        className: eK("flex items-center", a && "gap-xxsmall")
                    }, a, eW().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, eW().createElement(iC, {
                        asChild: !0
                    }, eW().createElement(ah, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: s || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                aN = function(t) {
                    var n = t.children,
                        r = t.className,
                        i = eq(t, ["children", "className"]);
                    return eW().createElement(eW().Fragment, null, eW().createElement(av, null), eW().createElement("div", Object.assign({
                        className: eK(aS, "margin-y-small shrink-0", r)
                    }, i), n))
                },
                aj = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                aI = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                aC = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                aD = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                aA = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                ak = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                aR = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                aM = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                a_ = (0, eG.forwardRef)(function(t, n) {
                    var r = t.layout,
                        i = t.size,
                        a = t.type,
                        o = t.isDisabled,
                        s = t.label,
                        l = t.description,
                        c = t.media,
                        u = t.icon,
                        d = t.metadata,
                        f = t.isSelected,
                        p = t.onSelect,
                        m = t.hideSelectedIndicator,
                        h = void 0 !== m && m,
                        v = (0, eG.useMemo)(function() {
                            return s && eW().createElement("div", {
                                className: eK(aD[i], aA[i], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, s)
                        }, [s, i]),
                        y = (0, eG.useMemo)(function() {
                            return d && eW().createElement("div", {
                                className: eK("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, d)
                        }, [d]),
                        b = (0, eG.useMemo)(function() {
                            return l && eW().createElement("div", {
                                className: eK(ak[i], "content-default text-align-x-start")
                            }, l)
                        }, [l, i]),
                        g = (0, eG.useMemo)(function() {
                            return u && eW().createElement(eH, {
                                name: u,
                                size: aM[i]
                            })
                        }, [u, i]),
                        x = (0, eG.useMemo)(function() {
                            switch (a) {
                                case "Checkmark":
                                    return f && eW().createElement(eH, {
                                        name: "icon-filled-check",
                                        size: aM[i]
                                    });
                                case "Checkbox":
                                    return eW().createElement("div", {
                                        className: eK(aj[i], "flex items-center justify-center radius-small padding-none content-default", f ? "stroke-none" : "stroke-standard stroke-emphasis", f ? "bg-system-contrast" : "bg-none")
                                    }, f && eW().createElement("div", {
                                        className: eK(aj[i], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return eW().createElement("div", {
                                        className: eK(aj[i], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", f ? "bg-system-contrast" : "bg-none")
                                    }, f && eW().createElement("div", {
                                        className: eK("radius-circle bg-inverse-action-sub-emphasis", aI[i])
                                    }));
                                default:
                                    return console.error("Invalid OptionSelector type ".concat(a)), null
                            }
                        }, [a, i, f]),
                        w = (0, eG.useMemo)(function() {
                            return c && eW().createElement("div", {
                                className: eK(aC[i], "flex items-center justify-center clip shrink-0")
                            }, c)
                        }, [c, i]),
                        S = (0, eG.useMemo)(function() {
                            var t = !h && eW().createElement("div", {
                                className: aj[i]
                            }, x);
                            switch (r) {
                                case "Horizontal":
                                    return eW().createElement("div", {
                                        className: "flex gap-large"
                                    }, w, eW().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, eW().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, eW().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, eW().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, g, v), y), t), b));
                                case "Vertical":
                                    return eW().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, eW().createElement("div", {
                                        className: "flex gap-small"
                                    }, eW().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, w, eW().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, g, v, y)), t), b);
                                default:
                                    return console.error("Invalid OptionSelector layout ".concat(r)), null
                            }
                        }, [r, w, g, v, b, x, i, y, h]);
                    return eW().createElement("button", {
                        type: "button",
                        className: eK(e7, "focus:outline-focus bg-none width-full radius-medium stroke-standard", f ? "stroke-system-contrast" : "stroke-contrast-alpha", aR[i], o && te, !o && "cursor-pointer"),
                        disabled: o,
                        ref: n,
                        onClick: function() {
                            return p()
                        }
                    }, !o && eW().createElement(e9, null), S)
                });
            a_.displayName = "OptionSelector";
            var aL = ((a = {}).LIST_AVAILABLE_PRODUCTS_FAILED = "ListAvailableProductsFailed", a.LIST_AVAILABLE_PRODUCTS_EMPTY = "ListAvailableProductsEmpty", a.LIST_SUBSCRIPTIONS_FAILED = "ListSubscriptionsFailed", a.GET_USER_BENEFITS_FAILED = "GetUserBenefitsFailed", a.GUAC_APP_POLICY_FAILED = "GuacAppPolicyFailed", a.MEMBERSHIP_POLLING_TIMEOUT = "MembershipPollingTimeout", a.PURCHASE_VIEW_SHOWN = "PurchaseViewShown", a.PURCHASE_VIEW_OPEN_SHEET_CLICK = "PurchaseViewOpenSheetClick", a.BUNDLE_PICKER_SHEET_OPENED = "BundlePickerSheetOpened", a.BUNDLE_PICKER_TIER_SELECTED = "BundlePickerTierSelected", a.BUNDLE_PICKER_SUBSCRIBE_CLICK = "BundlePickerSubscribeClick", a.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE = "BundlePickerRowMissingRobuxAllowance", a.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE = "BundlePickerRowMissingStrikethroughPrice", a.MISSING_FEATURE_CONFIG = "MissingFeatureConfig", a),
                aU = (0, window.Roblox["web-telemetry"].fire.createFireTelemetryCounter)("RobloxSubscription"),
                aB = function(t) {
                    var n = t.product,
                        r = t.isBundle,
                        i = (0, l.useTranslation)(),
                        a = i.translate,
                        o = i.intl,
                        c = tS(n);
                    (0, eG.useEffect)(function() {
                        r && 0 === c && aU(aL.BUNDLE_PICKER_ROW_MISSING_ROBUX_ALLOWANCE, {
                            productId: n.productKey.id
                        }), r && !n.localizedStrikethroughPriceDisplayString && aU(aL.BUNDLE_PICKER_ROW_MISSING_STRIKETHROUGH_PRICE, {
                            productId: n.productKey.id,
                            currencyCode: n.localizedPrice.currencyCode
                        })
                    }, [r, n.localizedPrice.currencyCode, n.localizedStrikethroughPriceDisplayString, n.productKey.id, c]);
                    var u = o.n(c),
                        d = c > 0 ? "".concat(a("Label.BlackbirdShort"), " ").concat(c) : a("Label.Blackbird"),
                        f = n.localizedPriceDisplayString,
                        p = n.localizedStrikethroughPriceDisplayString;
                    return (0, s.jsxs)("div", {
                        className: "width-full min-height-700 flex flex-col items-stretch justify-center",
                        children: [(0, s.jsxs)("div", {
                            className: "width-full flex flex-row items-center justify-between",
                            children: [(0, s.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: d
                            }), (0, s.jsxs)("div", {
                                className: "gap-small flex flex-row items-center justify-end",
                                children: [p && (0, s.jsx)("span", {
                                    className: "text-body-medium strike-through",
                                    style: {
                                        color: "#6a6f81"
                                    },
                                    children: p
                                }), (0, s.jsx)("span", {
                                    className: "text-body-medium content-emphasis text-strikethrough",
                                    children: f
                                })]
                            })]
                        }), c > 0 && (0, s.jsx)("div", {
                            className: "width-full gap-xsmall flex flex-row items-center justify-start",
                            children: (0, s.jsx)("span", {
                                className: "text-body-medium content-default flex flex-row items-center",
                                children: t1(a, "Plus.LandingPage.BottomSheet.Benefit", [{
                                    opening: "amountStart",
                                    closing: "amountEnd",
                                    render: function(t) {
                                        return (0, s.jsxs)("span", {
                                            className: "padding-left-xxsmall gap-x-xxsmall flex flex-row items-center",
                                            children: [(0, s.jsx)(eH, {
                                                name: "icon-regular-robux",
                                                size: "XSmall"
                                            }), t]
                                        })
                                    }
                                }], {
                                    price: u
                                })
                            })
                        })]
                    })
                },
                aF = function(t) {
                    var n = t.product,
                        r = t.isSelected,
                        i = t.onSelect,
                        a = t.isBundle;
                    return (0, s.jsx)("div", {
                        "data-testid": "bundle-picker-tier-".concat(n.productKey.id),
                        children: (0, s.jsx)(a_, {
                            hideSelectedIndicator: !0,
                            isSelected: r,
                            label: void 0,
                            layout: "Horizontal",
                            metadata: (0, s.jsx)(aB, {
                                isBundle: a,
                                product: n
                            }),
                            size: "XSmall",
                            type: "Checkmark",
                            onSelect: i
                        })
                    })
                };

            function az(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }
            var aG = function(t) {
                    var n, r, i, a, o, c, u = t.isOpen,
                        d = t.onOpenChange,
                        f = t.products,
                        p = t.deviceMeta,
                        m = t.isEntrypointDisabled,
                        h = t.onMobilePurchaseInitiated,
                        v = t.paymentSessionId,
                        y = (0, l.useTranslation)().translate,
                        b = null == (o = f[0]) ? void 0 : o.productKey.id,
                        g = (n = (0, eG.useState)(b), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), o.length !== n); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return az(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return az(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        x = g[0],
                        w = g[1];
                    (0, eG.useEffect)(function() {
                        x && f.some(function(t) {
                            return t.productKey.id === x
                        }) || w(b)
                    }, [b, f, x]);
                    var S = (0, eG.useMemo)(function() {
                            var t;
                            return null != (t = f.find(function(t) {
                                return t.productKey.id === x
                            })) ? t : f[0]
                        }, [f, x]),
                        E = !!S && void 0 !== tE(S),
                        P = (0, eG.useRef)(!1);
                    (0, eG.useEffect)(function() {
                        if (!u) {
                            P.current = !1;
                            return
                        }!P.current && v && (P.current = !0, tR().sendUserPurchaseFlowEvent(tR().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tR().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tR().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, tR().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_SHEET_OPENED, v ? {
                            paymentSessionId: v
                        } : {}), aU(aL.BUNDLE_PICKER_SHEET_OPENED, {
                            tierCount: String(f.length),
                            defaultProductId: null != b ? b : ""
                        }))
                    }, [u, v, f.length, b]);
                    var T = (0, eG.useCallback)(function(t) {
                            w(t), tR().sendUserPurchaseFlowEvent(tR().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tR().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tR().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, tR().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_BUNDLE_TIER_SELECTED, function(t) {
                                for (var n = 1; n < arguments.length; n++) {
                                    var r = null != arguments[n] ? arguments[n] : {},
                                        i = Object.keys(r);
                                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                                    }))), i.forEach(function(n) {
                                        var i;
                                        i = r[n], n in t ? Object.defineProperty(t, n, {
                                            value: i,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : t[n] = i
                                    })
                                }
                                return t
                            }({
                                product_id: t
                            }, v ? {
                                paymentSessionId: v
                            } : {})), aU(aL.BUNDLE_PICKER_TIER_SELECTED, {
                                productId: t
                            })
                        }, [v]),
                        O = (0, eG.useCallback)(function() {
                            var t = E ? tR().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tR().ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tR().sendUserPurchaseFlowEvent(tR().ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tR().ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tR().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, t, v ? {
                                paymentSessionId: v
                            } : {}), aU(aL.BUNDLE_PICKER_SUBSCRIBE_CLICK, {
                                productId: null != x ? x : "",
                                isFreeTrial: String(E)
                            })
                        }, [E, x, v]);
                    if (!S) return null;
                    var N = [{
                            opening: "linkStart",
                            closing: "linkEnd",
                            render: function(t) {
                                return (0, s.jsx)("a", {
                                    className: "content-link underline",
                                    href: "https://www.roblox.com/info/terms",
                                    rel: "noopener noreferrer",
                                    target: "_blank",
                                    children: t
                                })
                            }
                        }],
                        j = (a = null == (i = tE(S)) || null == (r = i.freeTrialOffer) ? void 0 : r.estimatedTrialEndDate) ? new Date(a).toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }) : "",
                        I = m ? y("Description.EntrypointDisabled") : t1(y, E ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", N, E ? {
                            date: j
                        } : void 0),
                        C = p.isAndroidApp || p.isIosApp,
                        D = E ? y("Action.TryItForFree") : y("Action.PricePerMonth", {
                            price: null != (c = S.localizedPriceDisplayString) ? c : "",
                            periodType: S.periodType
                        });
                    return (0, s.jsx)(aE, {
                        open: u,
                        onOpenChange: d,
                        children: (0, s.jsxs)(aP, {
                            centerSheetSize: "Medium",
                            closeLabel: y("Action.Close"),
                            largeScreenVariant: "center",
                            children: [(0, s.jsx)(aO, {
                                children: y("Label.PickAPlan")
                            }), (0, s.jsx)(aT, {
                                className: "gap-y-medium padding-y-medium flex flex-col",
                                "data-testid": "bundle-picker-sheet-body",
                                children: f.map(function(t, n) {
                                    return (0, s.jsx)(aF, {
                                        isBundle: 0 !== n,
                                        isSelected: S.productKey.id === t.productKey.id,
                                        product: t,
                                        onSelect: function() {
                                            T(t.productKey.id)
                                        }
                                    }, t.productKey.id)
                                })
                            }), (0, s.jsx)(aN, {
                                children: (0, s.jsxs)("div", {
                                    className: "gap-y-small flex flex-col",
                                    children: [(0, s.jsx)(t3, {
                                        className: "width-full",
                                        deviceMeta: p,
                                        isDisabled: m,
                                        paymentSessionId: v,
                                        productId: null != x ? x : "",
                                        productType: S.productKey.type,
                                        size: "Medium",
                                        trackSubscriptionButtonClick: O,
                                        onSubscribeClick: C ? h : void 0,
                                        children: D
                                    }), (0, s.jsx)("p", {
                                        className: "text-caption-small content-muted text-align-x-left",
                                        "data-testid": "bundle-picker-legal-footer",
                                        children: I
                                    })]
                                })
                            })]
                        })
                    })
                },
                aW = window.Roblox["core-scripts"].deepLink,
                aV = {
                    itemId: 0x4dd938eb5e32,
                    itemType: aW.ItemType.Asset
                },
                aq = function(t) {
                    var n = t.itemId,
                        r = t.itemType;
                    return "roblox://navigation/item_details?itemId=".concat(n, "&itemType=").concat(r)
                },
                aK = function(t) {
                    var n = t.itemId,
                        r = t.itemType;
                    return "roblox://navigation/avatar?itemId=".concat(n, "&itemType=").concat(r)
                },
                aX = function(t) {
                    return (0, aW.navigateToDeepLink)(aq(t))
                },
                aH = function(t) {
                    var n, r;
                    return (0, aW.navigateToDeepLink)(null != (r = null == (n = (0, eF.getDeviceMeta)()) ? void 0 : n.isInApp) && r ? aK(t) : "roblox://navigation/avatar")
                };

            function aY(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function a$(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        i = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), i.forEach(function(n) {
                        var i;
                        i = r[n], n in t ? Object.defineProperty(t, n, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = i
                    })
                }
                return t
            }

            function aJ(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, i)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function aZ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), !n || o.length !== n); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return aY(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aY(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aQ = new Date(2026, 7, 14),
                a0 = function(t) {
                    var n, r, i, a, o = t.deviceMeta,
                        c = t.robloxSubscriptionProducts,
                        u = t.isEntrypointDisabled,
                        d = t.onMobilePurchaseInitiated,
                        f = (0, l.useTranslation)().translate,
                        p = (null != (n = function() {
                            var t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            return function() {
                                var t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                    n = tY((0, eG.useState)(t ? void 0 : tD().getLocalStorage(t$)), 2),
                                    r = n[0],
                                    i = n[1],
                                    a = tY((0, eG.useState)(!1), 2),
                                    o = a[0],
                                    s = a[1],
                                    l = (0, eG.useCallback)(function(t) {
                                        var n;
                                        return (n = function() {
                                            var n, r;
                                            return function(t, n) {
                                                var r, i, a, o = {
                                                        label: 0,
                                                        sent: function() {
                                                            if (1 & a[0]) throw a[1];
                                                            return a[1]
                                                        },
                                                        trys: [],
                                                        ops: []
                                                    },
                                                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                                                    return this
                                                }), s;

                                                function l(l) {
                                                    return function(c) {
                                                        var u = [l, c];
                                                        if (r) throw TypeError("Generator is already executing.");
                                                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                                            if (r = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                case 0:
                                                                case 1:
                                                                    a = u;
                                                                    break;
                                                                case 4:
                                                                    return o.label++, {
                                                                        value: u[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    o.label++, i = u[1], u = [0];
                                                                    continue;
                                                                case 7:
                                                                    u = o.ops.pop(), o.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                        o = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                        o.label = u[1];
                                                                        break
                                                                    }
                                                                    if (6 === u[0] && o.label < a[1]) {
                                                                        o.label = a[1], a = u;
                                                                        break
                                                                    }
                                                                    if (a && o.label < a[2]) {
                                                                        o.label = a[2], o.ops.push(u);
                                                                        break
                                                                    }
                                                                    a[2] && o.ops.pop(), o.trys.pop();
                                                                    continue
                                                            }
                                                            u = n.call(t, o)
                                                        } catch (t) {
                                                            u = [6, t], i = 0
                                                        } finally {
                                                            r = a = 0
                                                        }
                                                        if (5 & u[0]) throw u[1];
                                                        return {
                                                            value: u[0] ? u[1] : void 0,
                                                            done: !0
                                                        }
                                                    }
                                                }
                                            }(this, function(a) {
                                                switch (a.label) {
                                                    case 0:
                                                        if (!t) return [3, 2];
                                                        return [4, tq(function() {
                                                            return tK(this, function(n) {
                                                                return [2, tW(tU.GET, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(tI.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(t)
                                                                }, {
                                                                    feature: tB.PAYMENT,
                                                                    call: tF.GET_PAYMENT_SESSION
                                                                })]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = a.sent(), [3, 4];
                                                    case 2:
                                                        return [4, tq(function() {
                                                            return tK(this, function(t) {
                                                                return [2, tW(tU.POST, {
                                                                    withCredentials: !0,
                                                                    url: "".concat(tI.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                                }, {
                                                                    feature: tB.PAYMENT,
                                                                    call: tF.CREATE_PAYMENT_SESSION
                                                                }, {
                                                                    paymentFlowId: tR().getPaymentFlowUuid()
                                                                })]
                                                            })
                                                        })()];
                                                    case 3:
                                                        r = a.sent(), a.label = 4;
                                                    case 4:
                                                        if (!(n = r)) return [2];
                                                        return tD().setLocalStorage(t$, n.paymentSession), i(n.paymentSession), [2]
                                                }
                                            })
                                        }, function() {
                                            var t = this,
                                                r = arguments;
                                            return new Promise(function(i, a) {
                                                var o = n.apply(t, r);

                                                function s(t) {
                                                    tH(o, i, a, s, l, "next", t)
                                                }

                                                function l(t) {
                                                    tH(o, i, a, s, l, "throw", t)
                                                }
                                                s(void 0)
                                            })
                                        })()
                                    }, []);
                                return (0, eG.useEffect)(function() {
                                    if (r) {
                                        new Date(r.expiresAt) < new Date && (s(!0), l());
                                        return
                                    }
                                    var t, n = null == (t = tA.urlService.getQueryParam("paymentSessionId")) ? void 0 : t.toString();
                                    n || s(!0), l(n)
                                }, [l, r]), (0, eG.useMemo)(function() {
                                    return {
                                        paymentSession: r,
                                        wasCreatedByCurrentClient: o
                                    }
                                }, [r, o])
                            }(t).paymentSession
                        }()) ? n : {}).id,
                        m = c[0],
                        h = c.length > 1,
                        v = aZ((0, eG.useState)(!1), 2),
                        y = v[0],
                        b = v[1],
                        g = (0, eG.useMemo)(function() {
                            return aQ.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }, []);
                    if (!m) throw Error("PurchaseView requires at least one subscription product");
                    var x = m.productKey,
                        w = x.id,
                        S = x.type,
                        E = (0, eG.useMemo)(function() {
                            return m.eligibleOffers.find(function(t) {
                                return "FreeTrial" === t.offerType
                            })
                        }, [m.eligibleOffers]),
                        P = null != E,
                        T = (0, eG.useMemo)(function() {
                            var t, n = null == E || null == (t = E.freeTrialOffer) ? void 0 : t.estimatedTrialEndDate;
                            return n ? new Date(n).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "long",
                                day: "numeric"
                            }) : ""
                        }, [E]),
                        O = (0, eG.useMemo)(function() {
                            return [{
                                opening: "linkStart",
                                closing: "linkEnd",
                                render: function(t) {
                                    return (0, s.jsx)("a", {
                                        className: "content-link underline",
                                        href: "https://www.roblox.com/info/terms",
                                        rel: "noopener noreferrer",
                                        target: "_blank",
                                        children: t
                                    })
                                }
                            }]
                        }, []),
                        N = u ? f("Description.EntrypointDisabled") : t1(f, P ? "Description.SubscriptionFreeTrialLegal" : "Description.SubscriptionLegal", O, P ? {
                            date: T
                        } : void 0),
                        j = (0, eG.useRef)(!1);
                    (0, eG.useEffect)(function() {
                        if (!j.current && p) {
                            j.current = !0;
                            var t = P ? tj.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tj.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tj.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(tj.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tj.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tj.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, t, p ? {
                                paymentSessionId: p
                            } : {}), aU(aL.PURCHASE_VIEW_SHOWN, {
                                variant: h ? "multi" : "single",
                                tierCount: String(c.length),
                                isFreeTrial: String(P)
                            })
                        }
                    }, [p, P, h, c.length]);
                    var I = o.isAndroidApp || o.isIosApp,
                        C = aZ((0, eG.useState)(null), 2),
                        D = C[0],
                        A = C[1],
                        k = (0, eG.useCallback)(function() {
                            var t = P ? tj.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : tj.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                            tj.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(tj.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_ROBLOX_PLUS_PURCHASE, !1, tj.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_LANDING, tj.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, t, p ? {
                                paymentSessionId: p
                            } : {})
                        }, [P, p]),
                        R = f(P ? "Action.TryItForFree" : "Action.Subscribe"),
                        M = {
                            productId: w,
                            productType: S,
                            deviceMeta: o,
                            isDisabled: u,
                            paymentSessionId: p,
                            trackSubscriptionButtonClick: k,
                            onSubscribeClick: I ? d : void 0
                        },
                        _ = function() {
                            u || (aU(aL.PURCHASE_VIEW_OPEN_SHEET_CLICK), b(!0))
                        },
                        L = function(t) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Large";
                            return (0, s.jsx)(ts, {
                                className: t,
                                "data-testid": "purchase-open-sheet-button",
                                isDisabled: u,
                                size: n,
                                variant: "Emphasis",
                                onClick: _,
                                children: R
                            })
                        },
                        U = t1(f, "Label.PlusLandingPage.Subtitle.V3", [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(t) {
                                return (0, s.jsx)("span", {
                                    className: "text-heading-small",
                                    children: t
                                })
                            }
                        }], {
                            price: null != (r = m.localizedPriceDisplayString) ? r : "",
                            periodType: m.periodType
                        }),
                        B = (0, s.jsxs)("div", {
                            "aria-label": f("Action.Subscribe"),
                            className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                            "data-testid": "purchase-subscribe-dock",
                            role: "region",
                            children: [(0, s.jsx)(tx, {}), (0, s.jsxs)("div", {
                                className: "width-full gap-y-medium padding-b-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                                children: [h ? L("min-width-0 width-full") : (0, s.jsx)(t3, aJ(a$({}, M), {
                                    className: "min-width-0 width-full",
                                    size: "Medium",
                                    children: R
                                })), (0, s.jsx)("p", {
                                    className: "text-caption-small content-muted margin-bottom-[24px] large:margin-bottom-none padding-x-xsmall text-align-x-start",
                                    children: N
                                })]
                            })]
                        });
                    return (0, s.jsxs)(eG.Fragment, {
                        children: [(0, s.jsx)(tg, {}), (0, s.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, s.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[32px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[32px] self-stretch",
                                children: [(0, s.jsx)("div", {
                                    className: "width-full min-width-0 padding-x-xxlarge large:padding-x-none",
                                    children: (0, s.jsx)(t4, {
                                        body: f("Description.BannerBodyArrivedPurchase", {
                                            date: g
                                        }),
                                        imageAssetId: 0x4dd938eb5e32,
                                        title: f("Description.BannerTitleArrivedPurchase"),
                                        onItemDetailsClick: function() {
                                            aX(aV).catch(function() {})
                                        }
                                    })
                                }), (0, s.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, s.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, s.jsx)(t5, {
                                            variant: "compact"
                                        }), (0, s.jsxs)("h1", {
                                            className: "font-builder-extended text-display-small large:![font-size:var(--font-size-1000)] content-emphasis ![font-size:var(--font-size-800)]",
                                            children: [(0, s.jsx)("span", {
                                                className: "large:inline block",
                                                children: f("Title.PurchasePromoHeadlinePart1")
                                            }), (0, s.jsx)("span", {
                                                className: "large:inline hidden",
                                                children: "\xa0"
                                            }), (0, s.jsx)("span", {
                                                className: "large:inline block",
                                                children: f("Title.PurchasePromoHeadlinePart2")
                                            })]
                                        })]
                                    }), (0, s.jsxs)("div", {
                                        className: "gap-y-xsmall width-full min-width-0 large:text-align-x-center flex flex-col",
                                        children: [h ? (0, s.jsx)("span", {
                                            className: "text-body-large content-emphasis",
                                            children: U
                                        }) : (0, s.jsx)(t7, {
                                            eligibleOffers: m.eligibleOffers,
                                            periodType: m.periodType,
                                            price: m.localizedPrice
                                        }), (0, s.jsx)("div", {
                                            className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[24px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                            children: (0, s.jsx)("div", {
                                                className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                                children: h ? L("width-full large:width-[230px] shrink-0", "Medium") : (0, s.jsx)(t3, aJ(a$({}, M), {
                                                    className: "width-full large:width-[230px] shrink-0",
                                                    size: "Medium",
                                                    children: R
                                                }))
                                            })
                                        })]
                                    })]
                                }), (0, s.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, s.jsx)("span", {
                                        className: "text-heading-small",
                                        children: f("Title.Benefits", {
                                            productShort: f("Label.BlackbirdShort")
                                        })
                                    }), (0, s.jsx)("div", {
                                        className: "width-full padding-b-xlarge large:padding-b-none",
                                        children: (0, s.jsx)(ty, {
                                            featureConfig: tw(m),
                                            periodType: m.periodType,
                                            onTileClick: function(t, n) {
                                                A({
                                                    primary: t,
                                                    secondary: n
                                                })
                                            }
                                        })
                                    }), (0, s.jsx)("p", {
                                        className: "text-caption-small content-muted padding-x-xsmall text-align-x-start large:block large:padding-x-none hidden",
                                        "data-testid": "purchase-legal-footer",
                                        children: N
                                    })]
                                })]
                            })
                        }), B, (0, s.jsx)(i7, {
                            body: null != (i = null == D ? void 0 : D.secondary) ? i : "",
                            open: null != D,
                            title: null != (a = null == D ? void 0 : D.primary) ? a : "",
                            onOpenChange: function(t) {
                                t || A(null)
                            }
                        }), h && (0, s.jsx)(aG, {
                            deviceMeta: o,
                            isEntrypointDisabled: u,
                            isOpen: y,
                            paymentSessionId: p,
                            products: c,
                            onMobilePurchaseInitiated: d,
                            onOpenChange: b
                        })]
                    })
                },
                a1 = function(t) {
                    var n = t.title,
                        r = t.body;
                    return (0, s.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, s.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, s.jsx)(eH, {
                                className: "!size-900",
                                name: "icon-regular-roblox-plus"
                            })
                        }), (0, s.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, s.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: n
                            }), (0, s.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                };

            function a2(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }
            var a3 = function(t, n) {
                return (a3 = Object.setPrototypeOf || a2({
                    __proto__: []
                }, Array) && function(t, n) {
                    t.__proto__ = n
                } || function(t, n) {
                    for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
                })(t, n)
            };

            function a4(t, n) {
                if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

                function r() {
                    this.constructor = t
                }
                a3(t, n), t.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
            }

            function a5(t, n, r, i) {
                return new(r || (r = Promise))(function(a, o) {
                    function s(t) {
                        try {
                            c(i.next(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function l(t) {
                        try {
                            c(i.throw(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function c(t) {
                        var n;
                        t.done ? a(t.value) : (a2(n = t.value, r) ? n : new r(function(t) {
                            t(n)
                        })).then(s, l)
                    }
                    c((i = i.apply(t, n || [])).next())
                })
            }

            function a6(t, n) {
                var r, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (r = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = n.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            "function" == typeof SuppressedError && SuppressedError;

            function a8(t) {
                var n;
                return null == (n = t) ? n : {
                    periodIndex: n.periodIndex,
                    discountPercent: n.discountPercent
                }
            }
            var a7 = function(t) {
                    function n() {
                        return null !== t && t.apply(this, arguments) || this
                    }
                    return a4(n, t), n.prototype.robloxPlusGetRobloxPlusUserBenefitsRaw = function(t) {
                        return a5(this, void 0, void 0, function() {
                            var n, r;
                            return a6(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return n = {}, r = {}, [4, this.request({
                                            path: "/v1/roblox-plus/benefits",
                                            method: "GET",
                                            headers: r,
                                            query: n
                                        }, t)];
                                    case 1:
                                        return [2, new eE(i.sent(), function(t) {
                                            return null == t ? t : {
                                                robuxSavedWithPlus: t.robuxSavedWithPlus,
                                                itemsBoughtWithPlusDiscount: t.itemsBoughtWithPlusDiscount,
                                                robuxSentToFriends: t.robuxSentToFriends,
                                                privateServersCreatedForFree: t.privateServersCreatedForFree
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.robloxPlusGetRobloxPlusUserBenefits = function(t) {
                        return a5(this, void 0, void 0, function() {
                            return a6(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, this.robloxPlusGetRobloxPlusUserBenefitsRaw(t)];
                                    case 1:
                                        return [4, n.sent().value()];
                                    case 2:
                                        return [2, n.sent()]
                                }
                            })
                        })
                    }, n
                }(eb),
                a9 = function(t) {
                    function n() {
                        return null !== t && t.apply(this, arguments) || this
                    }
                    return a4(n, t), n.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw = function(t, n) {
                        return a5(this, void 0, void 0, function() {
                            var r, i;
                            return a6(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return r = {}, i = {}, void 0 !== t.robloxUniverseId && null !== t.robloxUniverseId && (i["Roblox-Universe-Id"] = String(t.robloxUniverseId)), [4, this.request({
                                            path: "/v1/metadata",
                                            method: "GET",
                                            headers: i,
                                            query: r
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            var n, r;
                                            return null == t ? t : {
                                                unifiedPurchaseFlowMetadata: null == (n = t.unifiedPurchaseFlowMetadata) ? n : {
                                                    isUserEligibleForUnifiedPurchaseFlow: n.isUserEligibleForUnifiedPurchaseFlow,
                                                    expiresInSeconds: n.expiresInSeconds
                                                },
                                                robloxSubscriptionExperimentMetadata: null == (r = t.robloxSubscriptionExperimentMetadata) ? r : {
                                                    subscriptionsVariant: eS(r, "subscriptionsVariant") ? r.subscriptionsVariant : void 0
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.robloxSubscriptionMetadataGetRobloxSubscriptionMetadata = function() {
                        return a5(this, arguments, void 0, function(t, n) {
                            return void 0 === t && (t = {}), a6(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.robloxSubscriptionMetadataGetRobloxSubscriptionMetadataRaw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n
                }(eb),
                oe = function(t) {
                    function n() {
                        return null !== t && t.apply(this, arguments) || this
                    }
                    return a4(n, t), n.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw = function(t, n) {
                        return a5(this, void 0, void 0, function() {
                            var r, i;
                            return a6(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.robloxSubscriptionProductId || void 0 === t.robloxSubscriptionProductId) throw new ew("robloxSubscriptionProductId", "Required parameter requestParameters.robloxSubscriptionProductId was null or undefined when calling robloxSubscriptionProductsGetRobloxSubscriptionProduct.");
                                        return r = {}, i = {}, [4, this.request({
                                            path: "/v1/products/{robloxSubscriptionProductId}".replace("{".concat("robloxSubscriptionProductId", "}"), encodeURIComponent(String(t.robloxSubscriptionProductId))),
                                            method: "GET",
                                            headers: i,
                                            query: r
                                        }, n)];
                                    case 1:
                                        return [2, new eE(a.sent(), function(t) {
                                            var n, r, i, a;
                                            return null == t ? t : {
                                                product: null == (n = t.product) ? n : {
                                                    id: n.id,
                                                    productType: n.productType,
                                                    productStatus: n.productStatus,
                                                    price: null == (r = n.price) ? r : {
                                                        currencyCode: r.currencyCode,
                                                        units: r.units,
                                                        nanos: r.nanos
                                                    },
                                                    periodType: n.periodType,
                                                    isRenewable: n.isRenewable,
                                                    featureConfig: null == (i = n.featureConfig) ? i : {
                                                        virtualTransactionDiscounts: null === i.virtualTransactionDiscounts ? null : i.virtualTransactionDiscounts.map(a8),
                                                        isRobuxTransferEnabled: i.isRobuxTransferEnabled,
                                                        isTradingEnabled: i.isTradingEnabled,
                                                        isUgcPublishingEnabled: i.isUgcPublishingEnabled,
                                                        privateServerDiscounts: null === i.privateServerDiscounts ? null : i.privateServerDiscounts.map(a8),
                                                        currencySubscriptionConfig: null == (a = i.currencySubscriptionConfig) ? a : {
                                                            currencyType: a.currencyType,
                                                            entitledAmountMicros: a.entitledAmountMicros
                                                        }
                                                    }
                                                }
                                            }
                                        })]
                                }
                            })
                        })
                    }, n.prototype.robloxSubscriptionProductsGetRobloxSubscriptionProduct = function(t, n) {
                        return a5(this, void 0, void 0, function() {
                            return a6(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.robloxSubscriptionProductsGetRobloxSubscriptionProductRaw(t, n)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, n
                }(eb),
                ot = function(t, n) {
                    return new Date(Date.UTC(t, n + 1, 0)).getUTCDate()
                },
                on = function(t, n) {
                    var r = t.getUTCFullYear(),
                        i = t.getUTCMonth(),
                        a = t.getUTCDate(),
                        o = i + n,
                        s = r + Math.floor(o / 12),
                        l = (o % 12 + 12) % 12,
                        c = Math.min(a, ot(s, l));
                    return new Date(Date.UTC(s, l, c, t.getUTCHours(), t.getUTCMinutes(), t.getUTCSeconds(), t.getUTCMilliseconds()))
                },
                or = function(t, n) {
                    var r = t.getUTCFullYear() + n,
                        i = t.getUTCMonth(),
                        a = Math.min(t.getUTCDate(), ot(r, i));
                    return new Date(Date.UTC(r, i, a, t.getUTCHours(), t.getUTCMinutes(), t.getUTCSeconds(), t.getUTCMilliseconds()))
                },
                oi = function(t, n, r) {
                    var i = new Date(t);
                    switch (r) {
                        case "Week":
                            return i.setUTCDate(i.getUTCDate() + 7 * n), i;
                        case "Month":
                            return on(i, n);
                        case "Year":
                            return or(i, n);
                        default:
                            throw Error("Unsupported period type: ".concat(r))
                    }
                },
                oa = function(t, n, r, i) {
                    for (var a = 0; a < 1e3 && !(i < oi(t, a + 1, n).getTime());) a += 1;
                    return r && r < i && a > 0 && (a -= 1), a
                },
                oo = function(t) {
                    var n = t.featureConfig,
                        r = t.activationTimestampMs,
                        i = t.currentPeriodIndex,
                        a = t.isCancelled,
                        o = t.periodType,
                        c = (0, l.useTranslation)(),
                        u = c.translate,
                        d = c.intl,
                        f = (0, eG.useMemo)(function() {
                            var t, r, a;
                            return null != (a = null == (r = n.virtualTransactionDiscounts) || null == (t = r.filter(function(t) {
                                return t.periodIndex <= i
                            }).sort(function(t, n) {
                                return n.periodIndex - t.periodIndex
                            })[0]) ? void 0 : t.discountPercent) ? a : 0
                        }, [i, n.virtualTransactionDiscounts]),
                        p = (0, eG.useMemo)(function() {
                            var t, a = null == (t = n.virtualTransactionDiscounts) ? void 0 : t.filter(function(t) {
                                return t.periodIndex > i
                            }).reduce(function(t, n) {
                                return null === t || n.periodIndex < t.periodIndex ? n : t
                            }, null);
                            if (!a) return null;
                            var s = Date.now(),
                                l = oi(r, a.periodIndex, o).getTime();
                            return {
                                discountPercent: a.discountPercent,
                                targetDateDaysUntil: Math.max(0, Math.ceil((l - s) / 864e5)),
                                targetDateProgressPercent: Math.min(Math.max(0, (s - r) / (l - r) * 100), 100)
                            }
                        }, [i, r, n.virtualTransactionDiscounts, o]);
                    if (null === p && 0 === f) return null;
                    var m = null === p,
                        h = null !== p && p.targetDateDaysUntil <= 15,
                        v = function(t) {
                            return (0, s.jsxs)("div", {
                                className: "margin-right-[-16px] relative flex size-[60px] shrink-0 items-center justify-center",
                                children: [(0, s.jsx)("div", {
                                    "aria-hidden": !0,
                                    className: "stroke-emphasis stroke-standard absolute inset-[0] rounded-[2.4px] [transform:rotate(-15deg)]"
                                }), t]
                            })
                        };
                    return (0, s.jsxs)("div", {
                        className: "radius-medium padding-large bg-shift-200 width-full gap-x-small flex items-center justify-between [overflow:clip]",
                        children: [(0, s.jsxs)("div", {
                            className: "gap-y-small min-width-0 flex flex-col items-start justify-center",
                            children: [(0, s.jsx)("span", {
                                className: "text-title-medium content-default",
                                children: a ? u(m ? "Description.Benefit.DiscountStaySubscribedToKeep" : "Description.Benefit.DiscountStaySubscribedToGet") : m ? u("Description.Benefit.DiscountMaxReached") : u("Description.Benefit.DiscountCurrent", {
                                    discountPercent: d.n(.01 * f, {
                                        style: "percent"
                                    })
                                })
                            }), (0, s.jsx)("span", {
                                className: "text-heading-large content-emphasis",
                                children: m ? u(a ? "Description.Benefit.DiscountAllPurchases" : "Description.Benefit.DiscountUnlocked", {
                                    discountPercent: d.n(.01 * f, {
                                        style: "percent"
                                    })
                                }) : u("Description.Benefit.DiscountOffInDays", {
                                    discountPercent: d.n(.01 * p.discountPercent, {
                                        style: "percent"
                                    }),
                                    dayCount: p.targetDateDaysUntil
                                })
                            })]
                        }), (0, s.jsx)("div", {
                            className: "shrink-0",
                            children: m ? v((0, s.jsx)(eH, {
                                name: "icon-regular-circle-check",
                                size: "XLarge"
                            })) : h && !a ? (0, s.jsx)(tO, {
                                ariaLabel: u("Label.Progress"),
                                className: "[--fui-future-alpha-color-system-progress:var(--color-content-emphasis)]",
                                size: "Large",
                                value: p.targetDateProgressPercent,
                                variant: "Determinate"
                            }) : v((0, s.jsx)(eH, {
                                name: "icon-regular-calendar",
                                size: "XLarge"
                            }))
                        })]
                    })
                };

            function os(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }
            var ol = function(t) {
                    var n, r = t.robloxSubscriptionProduct,
                        i = (0, l.useTranslation)().translate,
                        a = (n = (0, eG.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), o.length !== n); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return os(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return os(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        o = a[0],
                        c = a[1],
                        u = (0, eG.useCallback)(function() {
                            c(!0)
                        }, []),
                        d = (0, eG.useMemo)(function() {
                            var t = new URL("/my/account#!/subscriptions", window.location.origin);
                            return t.searchParams.append("id", r.productKey.id), t.searchParams.append("type", r.productKey.type), t.toString()
                        }, [r.productKey.id, r.productKey.type]);
                    return (0, s.jsx)(ts, {
                        as: "a",
                        href: d,
                        isLoading: o,
                        variant: "Standard",
                        onClick: u,
                        children: i("Action.Manage")
                    })
                },
                oc = function(t) {
                    var n = t.title,
                        r = t.value;
                    return (0, s.jsxs)("div", {
                        className: "radius-medium bg-shift-200 padding-large gap-y-small min-width-0 grow-1 flex basis-0 flex-col",
                        children: [(0, s.jsx)("span", {
                            className: "text-title-medium content-default",
                            children: n
                        }), (0, s.jsx)("span", {
                            className: "text-heading-large content-emphasis",
                            children: r
                        })]
                    })
                },
                ou = function(t) {
                    var n = t.featureConfig,
                        r = t.currentPeriodIndex,
                        i = t.savedRobux,
                        a = t.itemsBoughtWithDiscountCount,
                        o = t.privateServersCreatedCount,
                        c = t.robuxSentToFriendsCount,
                        u = (0, l.useTranslation)(),
                        d = u.translate,
                        f = u.intl,
                        p = (0, eG.useMemo)(function() {
                            var t, i, a;
                            return null != (a = null == (i = n.virtualTransactionDiscounts) || null == (t = i.filter(function(t) {
                                return t.periodIndex <= r
                            }).sort(function(t, n) {
                                return n.periodIndex - t.periodIndex
                            })[0]) ? void 0 : t.discountPercent) ? a : 0
                        }, [r, n.virtualTransactionDiscounts]);
                    return (0, s.jsxs)("div", {
                        className: "gap-y-large flex flex-col",
                        children: [(0, s.jsxs)("div", {
                            className: "gap-x-xsmall text-heading-small content-emphasis wrap flex items-center",
                            children: [(0, s.jsx)("span", {
                                children: d("Heading.SavingsYouveSaved")
                            }), (0, s.jsx)(eH, {
                                name: "icon-regular-robux",
                                size: "Medium"
                            }), (0, s.jsx)("span", {
                                children: void 0 === i ? "—" : f.n(i)
                            }), (0, s.jsx)("span", {
                                children: d("Heading.SavingsWithPlus")
                            })]
                        }), (0, s.jsxs)("div", {
                            className: "gap-y-small flex flex-col",
                            children: [(0, s.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, s.jsx)(oc, {
                                    title: d("Label.Savings.InGameItems"),
                                    value: d("Label.Savings.PercentOff", {
                                        discountPercent: f.n(.01 * p, {
                                            style: "percent"
                                        })
                                    })
                                }), (0, s.jsx)(oc, {
                                    title: d("Label.Savings.ItemsBought"),
                                    value: void 0 === a ? "—" : f.n(a)
                                })]
                            }), (0, s.jsxs)("div", {
                                className: "gap-x-small flex",
                                children: [(0, s.jsx)(oc, {
                                    title: d("Label.Savings.PrivateServers"),
                                    value: void 0 === o ? "—" : f.n(o)
                                }), (0, s.jsx)(oc, {
                                    title: d("Label.Savings.RobuxSent"),
                                    value: (0, s.jsxs)("span", {
                                        className: "gap-x-xsmall flex items-center",
                                        children: [(0, s.jsx)(eH, {
                                            name: "icon-regular-robux",
                                            size: "Medium"
                                        }), void 0 === c ? "—" : f.n(c)]
                                    })
                                })]
                            }), (0, s.jsx)("span", {
                                className: "text-caption-medium content-muted",
                                children: d("Description.SavingsDataDelay")
                            })]
                        })]
                    })
                },
                od = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                of = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                op = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                om = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                oh = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                ov = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                oy = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                ob = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                og = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                ox = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                ow = function(t) {
                    var n = t.iconName,
                        r = t.node,
                        i = t.size;
                    return null != n ? eW().createElement(eH, {
                        name: n,
                        size: od[i]
                    }) : null != r ? eW().createElement("span", {
                        className: eK("inline-flex items-center justify-center shrink-0", ox[i])
                    }, r) : null
                },
                oS = (0, eG.forwardRef)(function(t, n) {
                    var r = t.className,
                        i = t.style,
                        a = t.text,
                        o = t.isDisabled,
                        s = void 0 !== o && o,
                        l = t.size,
                        c = void 0 === l ? "Medium" : l,
                        u = t.variant,
                        d = void 0 === u ? "Standard" : u,
                        f = t.leadingIconName,
                        p = t.leadingIconNode,
                        m = t.trailingIconName,
                        h = t.trailingIconNode,
                        v = eq(t, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        y = null != f || null != p,
                        b = null != m || null != h,
                        g = eK(s ? te : [e7, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", y ? om[c] : op[c], b ? ov[c] : oh[c], of [c], r),
                        x = eW().createElement(eW().Fragment, null, eW().createElement(e9, null), eW().createElement(ow, {
                            iconName: f,
                            node: p,
                            size: c
                        }), eW().createElement("span", {
                            className: eK("padding-y-xsmall text-no-wrap text-truncate-end", y && oy[c], b && ob[c])
                        }, a), eW().createElement(ow, {
                            iconName: m,
                            node: h,
                            size: c
                        })),
                        w = Object.assign({
                            textDecoration: "none"
                        }, i);
                    if ("a" === v.as) {
                        v.as;
                        var S = v.href,
                            E = eq(v, ["as", "href"]);
                        return eW().createElement("a", Object.assign({
                            ref: n
                        }, E, {
                            "aria-disabled": s,
                            href: s ? void 0 : S,
                            className: eK(g, og[d], "content-action-utility"),
                            style: w
                        }), x)
                    }
                    v.as;
                    var P = v.isChecked,
                        T = v.onCheckedChange,
                        O = eq(v, ["as", "isChecked", "onCheckedChange"]);
                    return eW().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, O, {
                        className: eK(P ? "bg-inverse-surface-0" : og[d], P ? "content-inverse-emphasis" : "content-action-utility", g),
                        style: w,
                        "aria-pressed": P,
                        disabled: s,
                        onClick: null == T ? void 0 : function() {
                            return T(!P)
                        }
                    }), x)
                }),
                oE = function(t) {
                    var n = t.activationTimestampMs,
                        r = t.expirationTimestampMs,
                        i = t.nextRenewalTimestampMs,
                        a = t.hasFreeTrial,
                        o = (0, l.useTranslation)(),
                        c = o.translate,
                        u = o.intl,
                        d = (0, eG.useMemo)(function() {
                            return u.getDateTimeFormatter()
                        }, [u]),
                        f = null === i || 0 === i;
                    return (0, s.jsxs)("div", {
                        className: "gap-x-small flex items-center",
                        children: [(0, s.jsx)("span", {
                            className: "text-body-medium content-emphasis",
                            children: f ? c("Description.ActiveUntil", {
                                date: d.getCustomDateTime(r, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            }) : c("Description.SubscribedSince", {
                                date: d.getCustomDateTime(n, {
                                    month: "long",
                                    day: "numeric",
                                    year: "numeric"
                                })
                            })
                        }), f ? (0, s.jsx)(oS, {
                            className: "bg-system-warning light-mode-content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: c("Label.Status.AutoRenewOff")
                        }) : a ? (0, s.jsx)(oS, {
                            className: "bg-shift-300 content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: c("Label.Status.Freetrial")
                        }) : (0, s.jsx)(oS, {
                            className: "bg-shift-300 content-emphasis pointer-events-none",
                            isChecked: !1,
                            size: "Small",
                            text: c("Label.Status.Active")
                        })]
                    })
                },
                oP = function(t) {
                    var n = t.featureConfig,
                        r = (0, l.useTranslation)().translate;
                    return (0, s.jsxs)("div", {
                        className: "gap-y-medium flex flex-col",
                        children: [(0, s.jsx)("span", {
                            className: "text-heading-medium",
                            children: r("Label.ExploreMoreBenefits")
                        }), (0, s.jsxs)("div", {
                            className: "foundation-web-list-item-container",
                            children: [n.isTradingEnabled && (0, s.jsx)(tp, {
                                description: r("Description.Benefit.TradeResellItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, s.jsx)(eH, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.TradeResellItems"),
                                trailing: (0, s.jsx)(eH, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313310-Trading-System"
                                }
                            }), n.isUgcPublishingEnabled && (0, s.jsx)(tp, {
                                description: r("Description.Benefit.PublishItemsSubtitle"),
                                divider: "None",
                                isContained: !0,
                                leading: (0, s.jsx)(eH, {
                                    name: "icon-regular-arrow-up-from-landscape-rectangle",
                                    size: "Medium"
                                }),
                                size: "Medium",
                                title: r("Description.Benefit.PublishItems"),
                                trailing: (0, s.jsx)(eH, {
                                    name: "icon-regular-chevron-small-right"
                                }),
                                onSelect: function() {
                                    window.location.href = "https://help.roblox.com/hc/articles/203313180-Creating-and-Selling-Avatar-Items"
                                }
                            })]
                        })]
                    })
                },
                oT = function(t) {
                    var n = t.robloxSubscriptionProduct,
                        r = t.robloxSubscriptionMembership,
                        i = t.robloxPlusUserBenefits,
                        a = t.isFaeFreeTrial,
                        o = (0, l.useTranslation)().translate,
                        c = null == i ? void 0 : i.robuxSavedWithPlus,
                        u = null == i ? void 0 : i.itemsBoughtWithPlusDiscount,
                        d = null == i ? void 0 : i.privateServersCreatedForFree,
                        f = null == i ? void 0 : i.robuxSentToFriends,
                        p = (0, eG.useMemo)(function() {
                            return r.activeOffers.some(function(t) {
                                return "FreeTrial" === t.offerType
                            })
                        }, [r.activeOffers]),
                        m = (0, eG.useMemo)(function() {
                            return oa(r.activationTimestampMs, r.periodType, r.nextRenewalTimestampMs, Date.now())
                        }, [r.activationTimestampMs, r.nextRenewalTimestampMs, r.periodType]);
                    return (0, s.jsx)("div", {
                        className: "flex flex-col items-center",
                        children: (0, s.jsxs)("div", {
                            className: "margin-top-[48px] padding-x-xlarge content-emphasis gap-y-xxlarge width-full large:max-width-[730px] flex flex-col",
                            children: [(0, s.jsx)(t4, {
                                body: o("Description.BannerBodyArrivedSubscriber"),
                                equipText: o("Action.BannerEquip"),
                                imageAssetId: 0x4dd938eb5e32,
                                title: o("Description.BannerTitleArrivedSubscriber"),
                                onEquip: function() {
                                    aH(aV).catch(function() {})
                                },
                                onItemDetailsClick: function() {
                                    aX(aV).catch(function() {})
                                }
                            }), a && (0, s.jsx)(a1, {
                                body: o("Subtext.FreeTrialBanner", {
                                    date: new Date(r.expirationTimestampMs).toLocaleDateString(void 0, {
                                        day: "2-digit",
                                        month: "short",
                                        year: "numeric"
                                    })
                                }),
                                title: o("Header.FreeTrialBannerTitle")
                            }), (0, s.jsxs)("div", {
                                className: "gap-y-small large:items-center flex flex-col",
                                children: [(0, s.jsx)(t5, {}), (0, s.jsx)(oE, {
                                    activationTimestampMs: r.activationTimestampMs,
                                    expirationTimestampMs: r.expirationTimestampMs,
                                    hasFreeTrial: p,
                                    nextRenewalTimestampMs: r.nextRenewalTimestampMs
                                }), (0, s.jsx)(oo, {
                                    activationTimestampMs: r.activationTimestampMs,
                                    currentPeriodIndex: m,
                                    featureConfig: tw(n),
                                    isCancelled: null === r.nextRenewalTimestampMs || 0 === r.nextRenewalTimestampMs,
                                    periodType: r.periodType
                                })]
                            }), (0, s.jsxs)("div", {
                                className: "flex flex-col gap-y-[32px]",
                                children: [(0, s.jsx)(ou, {
                                    currentPeriodIndex: m,
                                    featureConfig: tw(n),
                                    itemsBoughtWithDiscountCount: u,
                                    privateServersCreatedCount: d,
                                    robuxSentToFriendsCount: f,
                                    savedRobux: c
                                }), (0, s.jsx)(oP, {
                                    featureConfig: tw(n)
                                }), (0, s.jsx)(tb, {
                                    children: (0, s.jsx)("div", {
                                        className: "gap-y-medium flex flex-col",
                                        children: (0, s.jsx)(ol, {
                                            robloxSubscriptionProduct: n
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                };

            function oO(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }
            var oN = function(t) {
                    var n, r, i, a = t.deviceMeta,
                        o = t.robloxSubscriptionProduct,
                        c = t.onDismiss,
                        u = (0, l.useTranslation)().translate,
                        d = (n = (0, eG.useState)(null), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), o.length !== n); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return oO(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oO(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        f = d[0],
                        p = d[1];
                    (0, eG.useEffect)(function() {
                        window.scrollTo({
                            top: 0,
                            behavior: "smooth"
                        })
                    }, []);
                    var m = !a.isInApp && (0, s.jsxs)("div", {
                        "aria-label": u("Action.OK"),
                        className: "bottom-dock padding-t-medium bg-surface-100 large:hidden width-full gap-y-medium flex flex-col",
                        "data-testid": "welcome-dismiss-dock",
                        role: "region",
                        children: [(0, s.jsx)(tx, {}), (0, s.jsx)("div", {
                            className: "width-full gap-y-medium padding-bottom-[env(safe-area-inset-bottom\\,0px)] padding-x-xxlarge flex flex-col items-stretch",
                            children: (0, s.jsx)(ts, {
                                className: "min-width-0 width-full margin-bottom-[24px] large:margin-bottom-none",
                                size: "Large",
                                variant: "Emphasis",
                                onClick: c,
                                children: u("Action.OK")
                            })
                        })]
                    });
                    return (0, s.jsxs)(eG.Fragment, {
                        children: [(0, s.jsx)(tg, {}), (0, s.jsx)("div", {
                            className: "width-full min-width-0 large:items-center flex flex-col items-start",
                            children: (0, s.jsxs)("div", {
                                className: "margin-top-[48px] width-full min-width-0 content-emphasis large:max-width-[730px] large:gap-y-[60px] large:self-auto large:padding-x-xlarge flex flex-col gap-y-[var(--size-1200)] self-stretch",
                                children: [(0, s.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge text-align-x-start large:gap-y-[24px] large:items-center large:padding-x-none large:text-align-x-center flex flex-col items-start",
                                    children: [(0, s.jsxs)("div", {
                                        className: "gap-y-xsmall large:items-center flex flex-col items-start",
                                        children: [(0, s.jsx)(eH, {
                                            className: "!size-1800 margin-bottom-medium",
                                            name: "icon-regular-roblox-plus"
                                        }), (0, s.jsx)("h1", {
                                            className: "text-heading-large",
                                            children: u("Title.Welcome", {
                                                productShort: u("Label.BlackbirdShort")
                                            })
                                        }), (0, s.jsx)("p", {
                                            className: "text-body-large content-default",
                                            children: u("Description.Welcome", {
                                                product: u("Label.Blackbird")
                                            })
                                        })]
                                    }), !a.isInApp && (0, s.jsx)("div", {
                                        className: "width-full gap-y-medium padding-t-none large:margin-x-auto large:margin-top-[12px] large:flex large:max-width-[min(440px,100%)] large:width-full large:flex-col large:items-center hidden items-start",
                                        "data-testid": "welcome-dismiss-inline",
                                        children: (0, s.jsx)("div", {
                                            className: "width-full gap-x-small flex shrink-0 flex-row items-start justify-center",
                                            children: (0, s.jsx)(ts, {
                                                className: "width-full large:width-[230px] shrink-0",
                                                size: "Medium",
                                                variant: "Emphasis",
                                                onClick: c,
                                                children: u("Action.OK")
                                            })
                                        })
                                    })]
                                }), (0, s.jsxs)("div", {
                                    className: "width-full min-width-0 gap-y-xxlarge padding-x-xxlarge large:padding-x-none flex flex-col",
                                    children: [(0, s.jsx)("span", {
                                        className: "text-heading-small",
                                        children: u("Title.BenefitsUnlocked")
                                    }), (0, s.jsx)(ty, {
                                        featureConfig: tw(o),
                                        overrideIconName: "icon-filled-check",
                                        periodType: o.periodType,
                                        onTileClick: function(t, n) {
                                            p({
                                                primary: t,
                                                secondary: n
                                            })
                                        }
                                    })]
                                })]
                            })
                        }), m, (0, s.jsx)(i7, {
                            body: null != (r = null == f ? void 0 : f.secondary) ? r : "",
                            open: null != f,
                            title: null != (i = null == f ? void 0 : f.primary) ? i : "",
                            onOpenChange: function(t) {
                                t || p(null)
                            }
                        })]
                    })
                },
                oj = function(t, n) {
                    return "https://apis.".concat(t, "/").concat(n)
                };

            function oI(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }
            var oC = function(t) {
                    var n, r = document.querySelector('meta[name="environment-meta"]');
                    if (null == r ? void 0 : r.dataset.domain) return {
                        production: "false" === r.dataset.isTestingSite,
                        domainName: r.dataset.domain.split(".")[0],
                        rootDomain: r.dataset.domain
                    };
                    if ("localhost" === t) return {
                        production: !1,
                        domainName: "sitetest3",
                        rootDomain: "sitetest3.robloxlabs.com"
                    };
                    var i = (n = t.split(".").reverse(), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), o.length !== n); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(n, 3) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return oI(t, 3);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oI(t, n)
                            }
                        }(n, 3) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        a = i[0],
                        o = i[1],
                        s = i[2];
                    if (null != a && null != o) {
                        var l = "".concat(o, ".").concat(a);
                        if ("roblox.com" === l || "simulprod.com" === l || "rblx.org" === l) return {
                            production: !0,
                            domainName: "roblox",
                            rootDomain: "roblox.com"
                        };
                        if (null == s ? void 0 : s.startsWith("sitetest")) return {
                            production: !1,
                            domainName: s,
                            rootDomain: "".concat(s, ".robloxlabs.com")
                        }
                    }
                    throw Error("Unknown environment for ".concat(t))
                },
                oD = oC(window.location.hostname),
                oA = new ev({
                    robloxSiteDomain: oD.rootDomain,
                    basePath: oj(oD.rootDomain, "roblox-subscriptions"),
                    credentials: "include"
                });
            new a9(oA);
            var ok = new a7(oA);
            new oe(oA);
            var oR = oC(window.location.hostname),
                oM = new eU(new eP({
                    robloxSiteDomain: oR.rootDomain,
                    basePath: oj(oR.rootDomain, "subscriptions"),
                    credentials: "include"
                })),
                o_ = function(t, n) {
                    var r = (0, eG.useRef)();
                    return n(t) && (r.current = t), r.current
                };

            function oL(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, i = Array(n); r < n; r++) i[r] = t[r];
                return i
            }

            function oU(t, n, r, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(i, a)
            }

            function oB(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(i, a) {
                        var o = t.apply(n, r);

                        function s(t) {
                            oU(o, i, a, s, l, "next", t)
                        }

                        function l(t) {
                            oU(o, i, a, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function oF(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (r = a.next()).done) && (o.push(r.value), !n || o.length !== n); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return oL(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oL(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oz(t, n) {
                var r, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (r = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = n.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var oG = function() {
                    var t, n, r = (0, eG.useMemo)(function() {
                            return (0, eF.getDeviceMeta)()
                        }, []),
                        i = oF((0, eG.useState)(function() {
                            return new URLSearchParams(window.location.search).has("welcome")
                        }), 2),
                        a = i[0],
                        o = i[1],
                        l = oF((0, eG.useState)(function() {
                            return new URLSearchParams(window.location.search).has("faeFreeTrialConfirmation")
                        }), 2),
                        c = l[0],
                        u = l[1],
                        d = oF((0, eG.useState)(a || c), 2),
                        p = d[0],
                        m = d[1],
                        h = (0, f.useQuery)({
                            queryKey: ["get-roblox-subscription-membership"],
                            queryFn: function() {
                                return oB(function() {
                                    var t;
                                    return oz(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return [4, oM.subscriptionsV2ListSubscriptions({
                                                    productType: ek,
                                                    expirationTimestampMsStart: Date.now(),
                                                    resultsPerPage: 1
                                                })];
                                            case 1:
                                                if (!(t = n.sent().subscriptions[0])) return [2, null];
                                                return [2, t]
                                        }
                                    })
                                })()
                            },
                            retry: 3,
                            retryDelay: 100,
                            refetchInterval: !!p && 3e3
                        }),
                        v = o_(h.data, function() {
                            return void 0 !== h.data
                        }),
                        y = null == v ? void 0 : v.productKey.id,
                        b = (0, f.useQuery)({
                            queryKey: ["check-fae-free-trial", y],
                            queryFn: function() {
                                return oB(function() {
                                    var t, n;
                                    return oz(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!y) return [2, !1];
                                                return [4, oM.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: ek,
                                                    includePurchased: !0,
                                                    grantType: "FaeFreeTrial"
                                                })];
                                            case 1:
                                                if (void 0 === (n = null == (t = r.sent().products.find(function(t) {
                                                        return "Week" === t.periodType
                                                    })) ? void 0 : t.productKey.id) || n !== y) throw Error("FAE trial product not found yet");
                                                return [2, !0]
                                        }
                                    })
                                })()
                            },
                            enabled: !!v,
                            retry: function(t) {
                                return t < 3
                            },
                            retryDelay: 100
                        }),
                        g = (0, f.useQuery)({
                            queryKey: ["list-roblox-subscription-available-products"],
                            queryFn: function() {
                                return oB(function() {
                                    var t;
                                    return oz(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return [4, oM.subscriptionsV2ListAvailableSubscriptionProducts({
                                                    productType: ek,
                                                    includePurchased: !0,
                                                    includeBundles: !0,
                                                    skipEligibilityCheck: !0
                                                })];
                                            case 1:
                                                if (0 === (t = n.sent().products).length) return [2, null];
                                                return [2, t.toSorted(function(t, n) {
                                                    return tS(t) - tS(n)
                                                })]
                                        }
                                    })
                                })()
                            },
                            enabled: null === h.data,
                            retry: 3,
                            retryDelay: 100
                        }),
                        x = o_(g.data, function() {
                            return void 0 !== g.data
                        }),
                        w = o_(null != (n = null == (t = h.data) ? void 0 : t.productInfo) ? n : null == x ? void 0 : x[0], function() {
                            var t;
                            return (null == (t = h.data) ? void 0 : t.productInfo) !== void 0 || void 0 !== x
                        }),
                        S = (0, f.useQuery)({
                            queryKey: ["get-roblox-plus-user-benefits"],
                            queryFn: function() {
                                return ok.robloxPlusGetRobloxPlusUserBenefits()
                            },
                            enabled: !!v,
                            retry: 3
                        }),
                        E = (0, f.useQuery)({
                            queryKey: ["guac/app-policy/disable-blackbird-entrypoints"],
                            queryFn: function() {
                                return oB(function() {
                                    return oz(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return t.trys.push([0, 2, , 3]), [4, (0, eB.callBehaviour)("app-policy")];
                                            case 1:
                                                return [2, !0 === t.sent().DisableBlackbirdEntrypoints];
                                            case 2:
                                                return t.sent(), [2, !1];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            retry: 3,
                            retryDelay: 100,
                            staleTime: 1 / 0
                        }),
                        P = o_(E.data, function() {
                            return void 0 !== E.data
                        }),
                        T = (0, eG.useCallback)(function() {
                            var t = new URL(window.location.href);
                            t.searchParams.set("welcome", ""), window.history.replaceState(null, "", t.toString()), o(!0)
                        }, []),
                        O = (0, eG.useCallback)(function() {
                            var t = function() {
                                try {
                                    var t = sessionStorage.getItem(ez);
                                    if (!t) return null;
                                    sessionStorage.removeItem(ez);
                                    var n = JSON.parse(t);
                                    if ((void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) != "object" || null === n || !("url" in n) || !("ts" in n)) return null;
                                    var r = n.url,
                                        i = n.ts;
                                    if ("string" != typeof r || "number" != typeof i || Date.now() - i > 18e5) return null;
                                    return r
                                } catch (t) {
                                    return null
                                }
                            }();
                            if (t) {
                                window.location.href = t;
                                return
                            }
                            var n = new URL(window.location.href);
                            n.searchParams.delete("welcome"), window.history.replaceState(null, "", n.toString()), o(!1)
                        }, []),
                        N = (0, eG.useCallback)(function() {
                            var t = new URL(window.location.href);
                            t.searchParams.delete("faeFreeTrialConfirmation"), window.history.replaceState(null, "", t.toString()), u(!1)
                        }, []);
                    (0, eG.useEffect)(function() {
                        if (p) {
                            var t = setTimeout(function() {
                                m(!1)
                            }, 6e4);
                            return function() {
                                clearTimeout(t)
                            }
                        }
                    }, [p]), (0, eG.useEffect)(function() {
                        p && h.data && (m(!1), c || T())
                    }, [T, c, p, h.data]);
                    var j = (0, eG.useCallback)(function() {
                        m(!0)
                    }, []);
                    if (g.error || null === g.data || h.error && !p || E.error || !r) return (0, s.jsx)(tl, {});
                    if (void 0 === w || void 0 === v || void 0 === P) return (0, s.jsx)(tN, {});
                    var I = null !== v;
                    if (c) return I ? b.isLoading ? (0, s.jsx)(tN, {}) : b.data ? (0, s.jsx)(tP, {
                        robloxSubscriptionProduct: w,
                        onDismiss: N
                    }) : (0, s.jsx)(tl, {}) : p ? (0, s.jsx)(tN, {}) : (0, s.jsx)(tl, {});
                    if (a)
                        if (I) return (0, s.jsx)(oN, {
                            deviceMeta: r,
                            robloxSubscriptionMembership: v,
                            robloxSubscriptionProduct: w,
                            onDismiss: O
                        });
                        else if (p) return (0, s.jsx)(tN, {});
                    else return (0, s.jsx)(tl, {});
                    return I ? (0, s.jsx)(oT, {
                        isFaeFreeTrial: !0 === b.data,
                        robloxPlusUserBenefits: S.data,
                        robloxSubscriptionMembership: v,
                        robloxSubscriptionProduct: w
                    }) : x ? (0, s.jsx)(a0, {
                        deviceMeta: r,
                        isEntrypointDisabled: P,
                        robloxSubscriptionProducts: x,
                        onMobilePurchaseInitiated: j
                    }) : (0, s.jsx)(tN, {})
                },
                oW = function(t) {
                    var n = t.children;
                    return (0, s.jsx)("div", {
                        className: "clip-x margin-bottom-[160px] min-height-[400px] padding-top-[16px] large:margin-bottom-[120px] relative",
                        children: n
                    })
                },
                oV = function() {
                    return (0, s.jsx)(f.QueryClientProvider, {
                        client: l.queryClient,
                        children: (0, s.jsx)(oW, {
                            children: (0, s.jsx)(oG, {})
                        })
                    })
                };
            r(160), u()(function() {
                (0, l.renderWithErrorBoundary)((0, s.jsx)(l.TranslationProvider, {
                    config: d.P,
                    children: (0, s.jsx)(oV, {})
                }), document.getElementById("roblox-subscription-container"), void 0, (0, s.jsx)(oW, {
                    children: (0, s.jsx)(tl, {})
                }))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxSubscription");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/robloxSubscription-eb948d2ae6091a65.js.map