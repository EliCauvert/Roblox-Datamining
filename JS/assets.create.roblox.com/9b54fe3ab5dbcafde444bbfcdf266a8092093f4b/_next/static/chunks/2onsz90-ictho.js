;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "053e55c3-170d-3b56-5b95-96c298abf0a3")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 677753, 761724, e => {
    "use strict";
    var t, r = e.i(2226),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function o(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }
    var a = function() {
        return (a = Object.assign || function(e) {
            for (var t, r = 1, n = arguments.length; r < n; r++)
                for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };

    function i(e, t, r, n) {
        return new(r || (r = Promise))(function(o, a) {
            function i(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function s(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(i, s)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var r, n, o, a = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function s(s) {
            return function(u) {
                var c = [s, u];
                if (r) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                        case 0:
                        case 1:
                            o = c;
                            break;
                        case 4:
                            return a.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                a.label = c[1];
                                break
                            }
                            if (6 === c[0] && a.label < o[1]) {
                                a.label = o[1], o = c;
                                break
                            }
                            if (o && a.label < o[2]) {
                                a.label = o[2], a.ops.push(c);
                                break
                            }
                            o[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    c = t.call(e, a)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    r = o = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function u(e, t, r) {
        if (r || 2 == arguments.length)
            for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
        return e.concat(n || Array.prototype.slice.call(t))
    }
    "function" == typeof SuppressedError && SuppressedError;
    var c = "Roblox.MrRouterConfig",
        l = {
            envName: ""
        },
        d = !1,
        h = function() {
            try {
                if ("u" < typeof window) return a({}, l);
                var e = localStorage.getItem(c);
                if (null == e) return a({}, l);
                var t = JSON.parse(e);
                if ("object" != typeof t || null === t) return a({}, l);
                var r = a(a({}, l), "envName" in t && "string" == typeof t.envName && {
                    envName: t.envName
                });
                return r.envName && !d && (d = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
            } catch (e) {
                return a({}, l)
            }
        },
        p = function() {
            return h().envName
        },
        f = function(e) {
            var t = h();
            t.envName = null != e ? e : l.envName, localStorage.setItem(c, JSON.stringify(t))
        },
        m = "mrrouter-env",
        g = "tracestate",
        T = "traceparent",
        y = function(e) {
            var t = e.indexOf("=");
            return (-1 === t ? e : e.slice(0, t)).trim()
        },
        E = function(e, t) {
            var r = "".concat(m, "=").concat(encodeURIComponent(t)),
                n = null == e ? void 0 : e.trim(),
                o = n ? n.split(",") : [],
                a = o.findIndex(function(e) {
                    return y(e) === m
                });
            if (-1 === a) return u(u([], o.map(function(e) {
                return e.trim()
            }), !0), [r], !1).join(",");
            var i = o.filter(function(e) {
                return y(e) !== m
            }).map(function(e) {
                return e.trim()
            });
            return i.splice(a, 0, r), i.join(",")
        },
        v = function(e) {
            var t = new Uint8Array(e);
            return crypto.getRandomValues(t), Array.from(t, function(e) {
                return e.toString(16).padStart(2, "0")
            }).join("")
        },
        b = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
        R = function() {
            return b ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : v(16)
        },
        w = function() {
            return b ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : v(8)
        },
        S = function(e) {
            var t = h().envName;
            if (t.length > 0 && (e[g] = E(e[g], t), !e[T])) {
                var r = R(),
                    n = w();
                e[T] = "00-".concat(r, "-").concat(n, "-01")
            }
        },
        A = function(e) {
            var t, r = h().envName;
            if (!r) return e;
            var n = null != (t = e.headers.get(g)) ? t : void 0;
            if (e.headers.set(g, E(n, r)), !e.headers.has(T)) {
                var o = R(),
                    a = w();
                e.headers.set(T, "00-".concat(o, "-").concat(a, "-01"))
            }
            return e
        };
    e.s(["_", 0, i, "a", 0, s, "b", () => a, "c", 0, o, "g", 0, h, "h", 0, A, "r", 0, function() {
        "u" > typeof window && Object.assign(window, {
            MrRouter: {
                getEnvName: p,
                setEnvName: f
            }
        })
    }, "s", 0, S], 761724);
    var P, I = function(e) {
            return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
        },
        N = function(e, t) {
            return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                tags: {
                    apiUrl: I(t.url),
                    apiStatus: null == t ? void 0 : t.status,
                    cors: !1
                }
            }), t
        },
        O = function(e, t) {
            e(Error("Network error"), {
                tags: {
                    apiUrl: I(t),
                    cors: !0
                }
            })
        },
        C = function() {
            function e(e) {
                this.captureException = e
            }
            return e.prototype.post = function(e) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        return [2, N(this.captureException, e.response)]
                    })
                })
            }, e.prototype.onError = function(e) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        return O(this.captureException, e.url), [2]
                    })
                })
            }, e
        }(),
        D = function(e) {
            if (document) {
                var t, r, n = document.getElementById("hba-frame");
                return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
            }
            return null
        },
        _ = function() {
            var e = window.location.hostname.split(".").slice(0, -2).join(".");
            return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
        },
        L = function(e, t) {
            try {
                fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                    method: "POST",
                    body: JSON.stringify({
                        name: "load_time_hba_frame",
                        value: t,
                        labelValues: {
                            origin_site: _()
                        }
                    })
                })
            } catch (e) {}
        },
        F = function(e, t) {
            try {
                fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                    method: "POST",
                    body: JSON.stringify({
                        name: "response_time_hba_frame",
                        value: t,
                        labelValues: {
                            origin_site: _()
                        }
                    })
                })
            } catch (e) {}
        },
        M = function(e, t, r) {
            return void 0 === r && (r = 1500), new Promise(function(n, o) {
                var a, i, s = performance.now(),
                    u = window.setTimeout(function() {
                        L(e, performance.now() - s),
                            function(e) {
                                try {
                                    fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                        method: "POST",
                                        body: JSON.stringify({
                                            name: "event_hba_frame",
                                            value: 1,
                                            labelValues: {
                                                event_type: "FrameLoadTimedOut",
                                                origin_site: _()
                                            }
                                        })
                                    })
                                } catch (e) {}
                            }(e), o(Error("Promise timed out after ".concat(r, " ms")))
                    }, r),
                    c = a = function(t) {
                        var r = t.data;
                        t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", a, !1), window.clearTimeout(u), L(e, performance.now() - s), n())
                    };
                window.addEventListener("message", c, !1), null == (i = t.contentWindow) || i.postMessage({
                    msg: "checkLoadedRequest"
                }, "https://www.".concat(e))
            })
        },
        U = function(e, t, r, n, o, i, s) {
            var u;
            if (void 0 === s && (s = 100), window) {
                var c, l = performance.now(),
                    d = window.setTimeout(function() {
                        F(r, performance.now() - l),
                            function(e) {
                                try {
                                    fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                        method: "POST",
                                        body: JSON.stringify({
                                            name: "event_hba_frame",
                                            value: 1,
                                            labelValues: {
                                                event_type: "FrameResponseTimedOut",
                                                origin_site: _()
                                            }
                                        })
                                    })
                                } catch (e) {}
                            }(r), e({
                                url: o.url,
                                init: o.init
                            })
                    }, s),
                    h = c = function(t) {
                        var n = t.data,
                            s = o.url,
                            u = o.init;
                        if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === i))
                            if (!n.data.isError && n.data.batHeader) {
                                window.clearTimeout(d), window.removeEventListener("message", c, !1), F(r, performance.now() - l);
                                var h = n.data.batHeader;
                                e({
                                    url: s,
                                    init: a(a({}, u), {
                                        headers: a(a({}, u.headers), {
                                            "x-bound-auth-token": h["x-bound-auth-token"]
                                        })
                                    })
                                })
                            } else window.clearTimeout(d), window.removeEventListener("message", c, !1), F(r, performance.now() - l), e({
                                url: s,
                                init: u
                            })
                    };
                window.addEventListener("message", h, !1), null == (u = n.contentWindow) || u.postMessage({
                    msg: "signSubdomainRequest",
                    identifier: i,
                    serializedSubdomainRequestData: JSON.stringify({
                        url: o.url,
                        requestInit: o.init
                    })
                }, "https://www.".concat(r))
            }
        },
        x = function() {
            return crypto.randomUUID()
        },
        k = function() {
            function e(e, t, r) {
                void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
            }
            return e.prototype.getOrCreateHbaFrame = function() {
                return D(this.robloxSiteDomain)
            }, e.prototype.pre = function(e) {
                var t = this;
                return new Promise(function(r, n) {
                    var o = e.url,
                        a = e.init;
                    if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                        var i = x();
                        t.hbaFrameAlreadyLoaded ? U(r, 0, t.robloxSiteDomain, t.hbaFrame, e, i, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                            url: o,
                            init: a
                        }) : M(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                            t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, U(r, 0, t.robloxSiteDomain, t.hbaFrame, e, i, t.dataTimeOut)) : r({
                                url: o,
                                init: a
                            })
                        }).catch(function() {
                            t.hbaFrameLoadFailed = !0, r({
                                url: o,
                                init: a
                            })
                        })
                    } else r({
                        url: o,
                        init: a
                    })
                })
            }, e
        }();
    (t = P || (P = {})).UNKNOWN = "unknown", t.INVALIDATED = "invalidated", t.ABANDONED = "abandoned", t.LOADFAILED = "loadfailed";
    var V = function(e) {
            function t(t) {
                var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                return r.parameters = t, r
            }
            return o(t, e), t.prototype.match = function(e) {
                return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
            }, t.prototype.matchAbandoned = function(e) {
                return this.match(e) && e.parameters.kind === P.ABANDONED
            }, t
        }(Error),
        B = "rblx-challenge-id",
        j = "rblx-challenge-type",
        q = "rblx-challenge-metadata",
        H = function(e, t) {
            return 403 === e.status && e.headers.has(B) && e.headers.has(j) && e.headers.has(q) && "iframe" === t
        },
        G = function(e) {
            var t, r, n, o, i, s, u, c, l, d = e.url,
                h = e.request,
                p = e.response,
                f = e.robloxSiteDomain,
                m = (i = new URLSearchParams([
                    ["challenge-type", "generic"],
                    ["dark-mode", "true"],
                    ["barista-mode", "true"],
                    ["generic-challenge-type", null != (t = p.headers.get(j)) ? t : ""],
                    ["generic-challenge-id", null != (r = p.headers.get(B)) ? r : ""],
                    ["challenge-metadata-json", null != (n = p.headers.get(q)) ? n : ""],
                    ["origin", null != (o = window.location.hostname.split(".").slice(0, -2).join(".")) ? o : ""]
                ]), s = new URL("https://www.".concat(f, "/challenge/cdn/hybrid?").concat(i.toString())), (u = document.createElement("iframe")).id = "challenge-frame", u.allowFullscreen = !0, u.setAttribute("allowtransparency", "true"), u.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), u.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", u.src = s.toString(), u.onload = function() {
                    u.style.visibility = "visible"
                }, c = u, document && document.body ? document.body.appendChild(c) : null);
            return new Promise(function(e, t) {
                window && m && (l = function(r) {
                    var n, o, i, s, u, c, l, f, m, g, T;
                    if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                        case "challengeAbandoned":
                            t(new V({
                                kind: P.ABANDONED,
                                data: {
                                    challengeType: null != (n = p.headers.get(j)) ? n : ""
                                }
                            }));
                            break;
                        case "challengeDisplayed":
                            break;
                        case "challengeCompleted":
                            (l = r.data.genericChallengeResponse.data).challengeType && l.metadata ? e((f = l.metadata, fetch(d, a(a({}, h), {
                                headers: a(a({}, h.headers), ((m = {})[B] = null != (g = p.headers.get(B)) ? g : "", m[q] = btoa(JSON.stringify(f)), m[j] = null != (T = p.headers.get(j)) ? T : "", m))
                            })))) : t(new V({
                                kind: P.UNKNOWN,
                                data: {
                                    challengeType: null != (o = p.headers.get(j)) ? o : ""
                                }
                            }));
                            break;
                        case "challengeInvalidated":
                            t((l = r.data.genericChallengeResponse.data) && l.challengeType && l.metadata ? new V({
                                kind: P.INVALIDATED,
                                data: l
                            }) : new V({
                                kind: P.INVALIDATED,
                                data: {
                                    challengeType: null != (i = p.headers.get(j)) ? i : ""
                                }
                            }));
                            break;
                        case "challengeParsed":
                            !1 === (l = r.data.genericChallengeResponse.data).parsed && t(new V({
                                kind: P.UNKNOWN,
                                data: {
                                    challengeType: null != (s = p.headers.get(j)) ? s : ""
                                }
                            }));
                            break;
                        case "challengeInitialized":
                            !1 === (l = r.data.genericChallengeResponse.data).initialized && t(new V({
                                kind: P.UNKNOWN,
                                data: {
                                    challengeType: null != (u = p.headers.get(j)) ? u : ""
                                }
                            }));
                            break;
                        case "challengePageLoaded":
                            !1 === (l = r.data.genericChallengeResponse.data).pageLoaded && t(new V({
                                kind: P.LOADFAILED,
                                data: {
                                    challengeType: null != (c = p.headers.get(j)) ? c : ""
                                }
                            }))
                    }
                }, window.addEventListener("message", l, !1))
            }).finally(function() {
                null == m || m.remove(), l && window.removeEventListener("message", l, !1)
            })
        },
        z = function() {
            function e(e, t) {
                void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
            }
            return e.prototype.post = function(e) {
                var t = e.url,
                    r = e.init,
                    n = e.response;
                return H(n, this.genericChallengeMiddlewareType) ? G({
                    url: t,
                    request: r,
                    response: n,
                    robloxSiteDomain: this.robloxSiteDomain
                }) : Promise.resolve(n)
            }, e
        }(),
        Q = "x-csrf-token",
        W = ["POST", "PATCH", "DELETE", "PUT"],
        Y = function(e) {
            return 403 === e.status && null !== e.headers.get(Q)
        },
        K = function() {
            var e, t = "";
            try {
                "u" > typeof window && (t = null != (e = localStorage.getItem(Q)) ? e : "")
            } catch (e) {
                console.warn("Error reading localStorage key “".concat(Q, "”:"), e)
            }
            return t
        },
        J = K(),
        Z = function(e) {
            try {
                J = e, "u" > typeof window && localStorage.setItem(Q, e)
            } catch (e) {
                console.warn("Error setting localStorage key “".concat(Q, "”:"), e)
            }
        },
        $ = function(e) {
            var t = e.elapsedTime,
                r = e.url,
                n = e.status,
                o = e.schemaPath,
                i = e.baseUrl;
            return {
                eventName: "apiVitals",
                parameters: a({
                    elapsedTime: String(t),
                    apiUrl: r,
                    statusCode: String(n)
                }, void 0 === o ? {} : {
                    schemaPath: i ? "".concat(i.replace(/\/+$/, ""), "/").concat(o.replace(/^\/+/, "")) : o
                })
            }
        },
        X = function() {
            function e(e, t) {
                this.unifiedLogger = e, this.baseUrl = t
            }
            return e.prototype.post = function(e) {
                return Y(e.response) || this.unifiedLogger.logApiVitalsEvent($({
                    elapsedTime: e.elapsedTime,
                    url: e.url,
                    status: e.response.status,
                    schemaPath: e.schemaPath,
                    baseUrl: this.baseUrl
                })), Promise.resolve(e.response)
            }, e
        }(),
        ee = function() {
            function e() {
                this.currentToken = K()
            }
            return e.prototype.pre = function(e) {
                var t = e.url,
                    r = e.init,
                    n = this.currentToken;
                return r.headers && "object" == typeof r.headers && Q in r.headers && (n = r.headers[Q]) && (this.currentToken = n, Z(n)), r.method && W.includes(r.method) ? Promise.resolve({
                    url: t,
                    init: this.prepareRequestInit(r)
                }) : Promise.resolve({
                    url: t,
                    init: r
                })
            }, e.prototype.post = function(e) {
                var t = e.fetch,
                    r = e.url,
                    n = e.init,
                    o = e.response;
                if (Y(o)) {
                    var a = o.headers.get(Q);
                    return this.currentToken = a, Z(a), t(r, this.prepareRequestInit(n))
                }
                return Promise.resolve(o)
            }, e.prototype.prepareRequestInit = function(e) {
                var t;
                return a(a({}, e), {
                    headers: a(a({}, e.headers), ((t = {})[Q] = this.currentToken, t))
                })
            }, e
        }(),
        et = [],
        er = function(e) {
            et = et.filter(function(t) {
                return t !== e
            })
        },
        en = function(e) {
            var t = e.url;
            503 === e.status && et.forEach(function(e) {
                return e(t)
            })
        },
        eo = function() {
            function e() {}
            return e.prototype.subscribe = function(e) {
                return et.push(e),
                    function() {
                        return er(e)
                    }
            }, e.prototype.unsubscribe = function(e) {
                return er(e)
            }, e.prototype.post = function(e) {
                var t = e.response;
                return en(t), Promise.resolve(t)
            }, e
        }(),
        ea = function() {
            function e() {}
            return e.prototype.pre = function(e) {
                var t = e.url,
                    r = e.init;
                if (!h().envName) return Promise.resolve({
                    url: t,
                    init: r
                });
                var n = a({}, r.headers);
                return S(n), Promise.resolve({
                    url: t,
                    init: a(a({}, r), {
                        headers: n
                    })
                })
            }, e
        }(),
        ei = function() {
            var e = {};
            return {
                onRequest: function(t) {
                    var r, n = t.request;
                    return e[t.id] = n.clone(), (r = n.headers.get(Q)) && Z(r), W.includes(n.method) && n.headers.set(Q, J), n
                },
                onResponse: function(t) {
                    var r = t.response,
                        n = t.id;
                    if (Y(r)) {
                        var o = r.headers.get(Q);
                        Z(o);
                        var a = e[n];
                        return delete e[n], a.headers.set(Q, o), fetch(a)
                    }
                    return delete e[n], r
                }
            }
        },
        es = {
            onResponse: function(e) {
                en(e.response)
            }
        },
        eu = new ee,
        ec = new eo,
        el = {
            generator: [function(e) {
                return e.captureException ? new C(e.captureException) : void 0
            }, function(e) {
                return e.robloxSiteDomain && e.enableBoundAuthToken ? new k(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
            }, function(e) {
                return e.robloxSiteDomain ? new z(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
            }, function(e) {
                return e.unifiedLogger ? new X(e.unifiedLogger, e.basePath) : void 0
            }, function() {
                return eu
            }, function() {
                return ec
            }, function(e) {
                return e.enableMrRouter ? new ea : void 0
            }],
            ts: [function(e) {
                var t;
                return e.captureException ? (t = e.captureException, {
                    onResponse: function(e) {
                        return N(t, e.response)
                    },
                    onError: function(e) {
                        O(t, e.request.url)
                    }
                }) : void 0
            }, function(e) {
                var t, r, n, o, a, u, c, l, d;
                return e.robloxSiteDomain && e.enableBoundAuthToken ? (r = (t = {
                    robloxSiteDomain: e.robloxSiteDomain,
                    loadTimeOut: e.boundAuthTokenLoadTimeout,
                    dataTimeOut: e.boundAuthTokenDataTimeout
                }).robloxSiteDomain, o = void 0 === (n = t.loadTimeOut) ? 1500 : n, u = void 0 === (a = t.dataTimeOut) ? 100 : a, c = !1, l = !1, d = null, {
                    onRequest: function(e) {
                        return i(void 0, [e], void 0, function(e) {
                            var t, n, a = e.request,
                                i = e.options.fetch;
                            return s(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return t = {
                                            url: a.url,
                                            init: a,
                                            fetch: i
                                        }, [4, new Promise(function(e, n) {
                                            var a = t.url,
                                                i = t.init;
                                            if (null !== (d = D(r))) {
                                                var s = x();
                                                c ? U(e, 0, r, d, t, s, u) : l ? e({
                                                    url: a,
                                                    init: i
                                                }) : M(r, d, o).then(function() {
                                                    d ? (c = !0, U(e, 0, r, d, t, s, u)) : e({
                                                        url: a,
                                                        init: i
                                                    })
                                                }).catch(function() {
                                                    l = !0, e({
                                                        url: a,
                                                        init: i
                                                    })
                                                })
                                            } else e({
                                                url: a,
                                                init: i
                                            })
                                        })];
                                    case 1:
                                        return [2, new Response((n = e.sent()).url, n.init)]
                                }
                            })
                        })
                    }
                }) : void 0
            }, function(e) {
                var t, r, n, o, a;
                return e.robloxSiteDomain ? (r = (t = {
                    robloxSiteDomain: e.robloxSiteDomain,
                    genericChallengeMiddlewareType: e.genericChallengeMiddlewareType
                }).robloxSiteDomain, o = void 0 === (n = t.genericChallengeMiddlewareType) ? "iframe" : n, a = {}, {
                    onRequest: function(e) {
                        var t = e.id,
                            r = e.request;
                        a[t] = r.clone()
                    },
                    onResponse: function(e) {
                        var t = e.response,
                            n = e.id;
                        if (H(t, o)) {
                            var i = a[n];
                            return G({
                                url: i.url,
                                request: i,
                                response: t,
                                robloxSiteDomain: r
                            })
                        }
                        return delete a[n], t
                    },
                    onError: function(e) {
                        var t = e.id;
                        delete a[t]
                    }
                }) : void 0
            }, function(e) {
                var t, r, n;
                return e.unifiedLogger ? (t = e.unifiedLogger, r = e.baseUrl, n = {}, {
                    onRequest: function(e) {
                        n[e.id] = performance.now()
                    },
                    onResponse: function(e) {
                        var o = e.id,
                            a = e.response,
                            i = e.schemaPath,
                            s = n[o];
                        if (delete n[o], !Y(a)) {
                            var u = performance.now() - s;
                            t.logApiVitalsEvent($({
                                elapsedTime: u,
                                url: a.url,
                                status: a.status,
                                schemaPath: i,
                                baseUrl: r
                            }))
                        }
                    }
                }) : void 0
            }, function() {
                return ei()
            }, function() {
                return es
            }, function(e) {
                return e.enableMrRouter ? {
                    onRequest: function(e) {
                        return A(e.request)
                    }
                } : void 0
            }]
        };

    function ed(e, t) {
        return el[t].map(function(t) {
            return t(e)
        }).filter(function(e) {
            return e
        })
    }
    var eh = function() {
            function e(e) {
                void 0 === e && (e = {}), this.configuration = e
            }
            return Object.defineProperty(e.prototype, "config", {
                set: function(e) {
                    this.configuration = e
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "basePath", {
                get: function() {
                    return this.configuration.basePath
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "fetchApi", {
                get: function() {
                    return this.configuration.fetchApi || window.fetch.bind(window)
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "middleware", {
                get: function() {
                    return this.configuration.middleware || []
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "queryParamsStringify", {
                get: function() {
                    return this.configuration.queryParamsStringify || function e(t, r) {
                        return void 0 === r && (r = ""), Object.keys(t).map(function(n) {
                            return function t(r, n, o) {
                                void 0 === o && (o = "");
                                var a = o + (o.length ? "[".concat(r, "]") : r);
                                if (n instanceof Array) {
                                    var i = n.map(function(e) {
                                        return encodeURIComponent(String(e))
                                    }).join("&".concat(encodeURIComponent(a), "="));
                                    return "".concat(encodeURIComponent(a), "=").concat(i)
                                }
                                return n instanceof Set ? t(r, Array.from(n), o) : n instanceof Date ? "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(n.toISOString())) : n instanceof Object ? e(n, a) : "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(String(n)))
                            }(n, t[n], r)
                        }).filter(function(e) {
                            return e.length > 0
                        }).join("&")
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "username", {
                get: function() {
                    return this.configuration.username
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "password", {
                get: function() {
                    return this.configuration.password
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "apiKey", {
                get: function() {
                    var e = this.configuration.apiKey;
                    if (e) return "function" == typeof e ? e : function() {
                        return e
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "accessToken", {
                get: function() {
                    var e = this,
                        t = this.configuration.accessToken;
                    if (t) return "function" == typeof t ? t : function() {
                        return i(e, void 0, void 0, function() {
                            return s(this, function(e) {
                                return [2, t]
                            })
                        })
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "headers", {
                get: function() {
                    return this.configuration.headers
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "credentials", {
                get: function() {
                    return this.configuration.credentials
                },
                enumerable: !1,
                configurable: !0
            }), e
        }(),
        ep = new eh,
        ef = function() {
            function e(e) {
                void 0 === e && (e = ep);
                var t = this;
                this.configuration = e, this.fetchApi = function(e, r, n) {
                    return i(t, void 0, void 0, function() {
                        var t, o, i, u, c, l, d, h, p, f, m, g, T, y = this;
                        return s(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    t = function(e, t) {
                                        return y.fetchApi(e, t, n)
                                    }, o = {
                                        url: e,
                                        init: r
                                    }, i = 0, u = this.middleware, s.label = 1;
                                case 1:
                                    return i < u.length ? (T = u[i]).pre ? [4, T.pre(a({
                                        fetch: t
                                    }, o))] : [3, 3] : [3, 4];
                                case 2:
                                    o = s.sent() || o, s.label = 3;
                                case 3:
                                    return i++, [3, 1];
                                case 4:
                                    c = void 0, l = performance.now(), s.label = 5;
                                case 5:
                                    return s.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(o.url, o.init)];
                                case 6:
                                    return c = s.sent(), d = performance.now(), [3, 12];
                                case 7:
                                    h = s.sent(), d = performance.now(), p = 0, f = this.middleware, s.label = 8;
                                case 8:
                                    return p < f.length ? (T = f[p]).onError ? [4, T.onError({
                                        fetch: t,
                                        url: o.url,
                                        init: o.init,
                                        error: h,
                                        response: c ? c.clone() : void 0
                                    })] : [3, 10] : [3, 11];
                                case 9:
                                    c = s.sent() || c, s.label = 10;
                                case 10:
                                    return p++, [3, 8];
                                case 11:
                                    if (void 0 === c) throw h instanceof Error ? new eg(h, "The request failed and the interceptors did not return an alternative response") : h;
                                    return [3, 12];
                                case 12:
                                    m = 0, g = this.middleware, s.label = 13;
                                case 13:
                                    return m < g.length ? (T = g[m]).post ? [4, T.post({
                                        fetch: t,
                                        url: o.url,
                                        init: o.init,
                                        response: c.clone(),
                                        elapsedTime: d - l,
                                        schemaPath: n
                                    })] : [3, 15] : [3, 16];
                                case 14:
                                    c = s.sent() || c, s.label = 15;
                                case 15:
                                    return m++, [3, 13];
                                case 16:
                                    return [2, c]
                            }
                        })
                    })
                }, this.middleware = e.middleware
            }
            return e.prototype.withMiddleware = function() {
                for (var e, t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
                var n = this.clone();
                return n.middleware = (e = n.middleware).concat.apply(e, t), n
            }, e.prototype.withPreMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var r = e.map(function(e) {
                    return {
                        pre: e
                    }
                });
                return this.withMiddleware.apply(this, r)
            }, e.prototype.withPostMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var r = e.map(function(e) {
                    return {
                        post: e
                    }
                });
                return this.withMiddleware.apply(this, r)
            }, e.prototype.isJsonMime = function(t) {
                return !!t && e.jsonRegex.test(t)
            }, e.prototype.request = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, n, o, a;
                    return s(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return [4, this.createFetchParams(e, t)];
                            case 1:
                                return n = (r = i.sent()).url, o = r.init, [4, this.fetchApi(n, o, e.schemaPath)];
                            case 2:
                                if ((a = i.sent()) && a.status >= 200 && a.status < 300) return [2, a];
                                throw new em(a, "Response from ".concat(a.url, " returned an error code ").concat(a.status))
                        }
                    })
                })
            }, e.prototype.createFetchParams = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var r, n, o, u, c, l, d, h = this;
                    return s(this, function(p) {
                        var f, m;
                        switch (p.label) {
                            case 0:
                                return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                    return void 0 === n[e] ? delete n[e] : {}
                                }), o = "function" == typeof t ? t : function() {
                                    return i(h, void 0, void 0, function() {
                                        return s(this, function(e) {
                                            return [2, t]
                                        })
                                    })
                                }, u = {
                                    method: e.method,
                                    headers: n,
                                    body: e.body,
                                    credentials: this.configuration.credentials
                                }, l = [a({}, u)], [4, o({
                                    init: u,
                                    context: e
                                })];
                            case 1:
                                return c = a.apply(void 0, l.concat([p.sent()])), d = a(a({}, c), {
                                    body: (f = c.body, "u" > typeof FormData && f instanceof FormData || c.body instanceof URLSearchParams || (m = c.body, "u" > typeof Blob && m instanceof Blob) ? c.body : JSON.stringify(c.body))
                                }), [2, {
                                    url: r,
                                    init: d
                                }]
                        }
                    })
                })
            }, e.prototype.clone = function() {
                var e = new(0, this.constructor)(this.configuration);
                return e.middleware = this.middleware.slice(), e
            }, e.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), e
        }(),
        em = function(e) {
            function t(t, r) {
                var n = e.call(this, r) || this;
                return n.response = t, n.name = "ResponseError", n
            }
            return o(t, e), t
        }(Error),
        eg = function(e) {
            function t(t, r) {
                var n = e.call(this, r) || this;
                return n.cause = t, n.name = "FetchError", n
            }
            return o(t, e), t
        }(Error),
        eT = function(e) {
            function t(t, r) {
                var n = e.call(this, r) || this;
                return n.field = t, n.name = "RequiredError", n
            }
            return o(t, e), t
        }(Error),
        ey = function() {
            function e(e, t) {
                void 0 === t && (t = function(e) {
                    return e
                }), this.raw = e, this.transformer = t
            }
            return e.prototype.value = function() {
                return i(this, void 0, void 0, function() {
                    var e;
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return e = this.transformer, [4, this.raw.json()];
                            case 1:
                                return [2, e.apply(this, [t.sent()])]
                        }
                    })
                })
            }, e
        }(),
        eE = function() {
            function e(e) {
                this.raw = e
            }
            return e.prototype.value = function() {
                return i(this, void 0, void 0, function() {
                    return s(this, function(e) {
                        return [2, void 0]
                    })
                })
            }, e
        }(),
        ev = function() {
            function e(e) {
                this.raw = e
            }
            return e.prototype.value = function() {
                return i(this, void 0, void 0, function() {
                    return s(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return [4, this.raw.blob()];
                            case 1:
                                return [2, e.sent()]
                        }
                    })
                })
            }, e
        }(),
        eb = function() {
            function e(e) {
                this.raw = e
            }
            return e.prototype.value = function() {
                return i(this, void 0, void 0, function() {
                    return s(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return [4, this.raw.text()];
                            case 1:
                                return [2, e.sent()]
                        }
                    })
                })
            }, e
        }(),
        eR = function(e) {
            function t(t) {
                void 0 === t && (t = {});
                var r = a({}, t),
                    n = r.middleware || [];
                return n.unshift.apply(n, ed(t, "generator")), r.middleware = n, e.call(this, r) || this
            }
            return o(t, e), t
        }(eh);
    let ew = /\{[^{}]+\}/g;

    function eS(e, t, r) {
        if (null == t) return "";
        if ("object" == typeof t) throw Error("Deeply-nested arrays/objects aren’t supported. Provide your own `querySerializer()` to handle these.");
        return "".concat(e, "=").concat(!0 === (null == r ? void 0 : r.allowReserved) ? t : encodeURIComponent(t))
    }

    function eA(e, t, r) {
        if (!t || "object" != typeof t) return "";
        let n = [],
            o = {
                simple: ",",
                label: ".",
                matrix: ";"
            } [r.style] || "&";
        if ("deepObject" !== r.style && !1 === r.explode) {
            for (let e in t) n.push(e, !0 === r.allowReserved ? t[e] : encodeURIComponent(t[e]));
            let o = n.join(",");
            switch (r.style) {
                case "form":
                    return "".concat(e, "=").concat(o);
                case "label":
                    return ".".concat(o);
                case "matrix":
                    return ";".concat(e, "=").concat(o);
                default:
                    return o
            }
        }
        for (let o in t) {
            let a = "deepObject" === r.style ? "".concat(e, "[").concat(o, "]") : o;
            n.push(eS(a, t[o], r))
        }
        let a = n.join(o);
        return "label" === r.style || "matrix" === r.style ? "".concat(o).concat(a) : a
    }

    function eP(e, t, r) {
        if (!Array.isArray(t)) return "";
        if (!1 === r.explode) {
            let n = {
                    form: ",",
                    spaceDelimited: "%20",
                    pipeDelimited: "|"
                } [r.style] || ",",
                o = (!0 === r.allowReserved ? t : t.map(e => encodeURIComponent(e))).join(n);
            switch (r.style) {
                case "simple":
                    return o;
                case "label":
                    return ".".concat(o);
                case "matrix":
                    return ";".concat(e, "=").concat(o);
                default:
                    return "".concat(e, "=").concat(o)
            }
        }
        let n = {
                simple: ",",
                label: ".",
                matrix: ";"
            } [r.style] || "&",
            o = [];
        for (let n of t) "simple" === r.style || "label" === r.style ? o.push(!0 === r.allowReserved ? n : encodeURIComponent(n)) : o.push(eS(e, n, r));
        return "label" === r.style || "matrix" === r.style ? "".concat(n).concat(o.join(n)) : o.join(n)
    }

    function eI(e) {
        return function(t) {
            let r = [];
            if (t && "object" == typeof t)
                for (let n in t) {
                    let o = t[n];
                    if (null != o)
                        if (Array.isArray(o)) {
                            if (0 === o.length) continue;
                            r.push(eP(n, o, {
                                style: "form",
                                explode: !0,
                                ...null == e ? void 0 : e.array,
                                allowReserved: (null == e ? void 0 : e.allowReserved) || !1
                            }))
                        } else "object" != typeof o ? r.push(eS(n, o, e)) : r.push(eA(n, o, {
                            style: "deepObject",
                            explode: !0,
                            ...null == e ? void 0 : e.object,
                            allowReserved: (null == e ? void 0 : e.allowReserved) || !1
                        }))
                }
            return r.join("&")
        }
    }

    function eN(e, t) {
        if (e instanceof FormData) return e;
        if (t) {
            var r, n;
            if ("application/x-www-form-urlencoded" === (t.get instanceof Function ? null != (r = t.get("Content-Type")) ? r : t.get("content-type") : null != (n = t["Content-Type"]) ? n : t["content-type"])) return new URLSearchParams(e).toString()
        }
        return JSON.stringify(e)
    }

    function eO() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        let n = new Headers;
        for (let e of t)
            if (e && "object" == typeof e)
                for (let [t, r] of e instanceof Headers ? e.entries() : Object.entries(e))
                    if (null === r) n.delete(t);
                    else if (Array.isArray(r))
            for (let e of r) n.append(t, e);
        else void 0 !== r && n.set(t, r);
        return n
    }

    function eC(e) {
        return e.endsWith("/") ? e.substring(0, e.length - 1) : e
    }
    e.s(["BaseAPI", 0, ef, "BlobApiResponse", 0, ev, "COLLECTION_FORMATS", 0, {
        csv: ",",
        ssv: " ",
        tsv: "	",
        pipes: "|"
    }, "Configuration", 0, eR, "FetchError", 0, eg, "JSONApiResponse", 0, ey, "RequiredError", 0, eT, "ResponseError", 0, em, "TextApiResponse", 0, eb, "VoidApiResponse", 0, eE, "canConsumeForm", 0, function(e) {
        for (var t = 0; t < e.length; t++)
            if ("multipart/form-data" === e[t].contentType) return !0;
        return !1
    }, "createFetchClient", 0, function(e) {
        var t = function(e) {
                var t, n, o;
                let {
                    baseUrl: a = "",
                    Request: i = globalThis.Request,
                    fetch: s = globalThis.fetch,
                    querySerializer: u,
                    bodySerializer: c,
                    headers: l,
                    requestInitExt: d,
                    ...h
                } = {
                    ...e
                };
                d = "object" == typeof r.default && Number.parseInt(null == (o = r.default) || null == (n = o.versions) || null == (t = n.node) ? void 0 : t.substring(0, 2)) >= 18 && r.default.versions.undici ? d : void 0, a = eC(a);
                let p = [];
                async function f(e, t) {
                    var r, n, o, f;
                    let m, g, {
                            baseUrl: T,
                            fetch: y = s,
                            Request: E = i,
                            headers: v,
                            params: b = {},
                            parseAs: R = "json",
                            querySerializer: w,
                            bodySerializer: S = null != c ? c : eN,
                            body: A,
                            middleware: P = [],
                            ...I
                        } = t || {},
                        N = a;
                    T && (N = null != (r = eC(T)) ? r : a);
                    let O = "function" == typeof u ? u : eI(u);
                    w && (O = "function" == typeof w ? w : eI({
                        ..."object" == typeof u ? u : {},
                        ...w
                    }));
                    let C = void 0 === A ? void 0 : S(A, eO(l, v, b.header)),
                        D = eO(void 0 === C || C instanceof FormData ? {} : {
                            "Content-Type": "application/json"
                        }, l, v, b.header),
                        _ = [...p, ...P],
                        L = {
                            redirect: "follow",
                            ...h,
                            ...I,
                            body: C,
                            headers: D
                        },
                        F, M, U, x = new E((n = {
                            baseUrl: N,
                            params: b,
                            querySerializer: O
                        }, m = "".concat(n.baseUrl).concat(e), (null == (f = n.params) ? void 0 : f.path) && (m = function(e, t) {
                            var r;
                            let n = e;
                            for (let o of null != (r = e.match(ew)) ? r : []) {
                                let e = o.substring(1, o.length - 1),
                                    r = !1,
                                    a = "simple";
                                if (e.endsWith("*") && (r = !0, e = e.substring(0, e.length - 1)), e.startsWith(".") ? (a = "label", e = e.substring(1)) : e.startsWith(";") && (a = "matrix", e = e.substring(1)), !t || void 0 === t[e] || null === t[e]) continue;
                                let i = t[e];
                                n = Array.isArray(i) ? n.replace(o, eP(e, i, {
                                    style: a,
                                    explode: r
                                })) : "object" != typeof i ? "matrix" !== a ? n.replace(o, "label" === a ? ".".concat(encodeURIComponent(i)) : encodeURIComponent(i)) : n.replace(o, ";".concat(eS(e, i))) : n.replace(o, eA(e, i, {
                                    style: a,
                                    explode: r
                                }))
                            }
                            return n
                        }(m, n.params.path)), (g = n.querySerializer(null != (o = n.params.query) ? o : {})).startsWith("?") && (g = g.substring(1)), g && (m += "?".concat(g)), m), L);
                    for (let e in I) e in x || (x[e] = I[e]);
                    if (_.length) {
                        for (let t of (F = Math.random().toString(36).slice(2, 11), M = Object.freeze({
                                baseUrl: N,
                                fetch: y,
                                parseAs: R,
                                querySerializer: O,
                                bodySerializer: S
                            }), _))
                            if (t && "object" == typeof t && "function" == typeof t.onRequest) {
                                let r = await t.onRequest({
                                    request: x,
                                    schemaPath: e,
                                    params: b,
                                    options: M,
                                    id: F
                                });
                                if (r) {
                                    if (!(r instanceof E)) {
                                        if (r instanceof Response) {
                                            U = r;
                                            break
                                        }
                                        throw Error("onRequest: must return new Request() or Response() when modifying the request")
                                    }
                                    x = r
                                }
                            }
                    }
                    if (!U) {
                        try {
                            U = await y(x, d)
                        } catch (r) {
                            let t = r;
                            if (_.length)
                                for (let r = _.length - 1; r >= 0; r--) {
                                    let n = _[r];
                                    if (n && "object" == typeof n && "function" == typeof n.onError) {
                                        let r = await n.onError({
                                            request: x,
                                            error: t,
                                            schemaPath: e,
                                            params: b,
                                            options: M,
                                            id: F
                                        });
                                        if (r) {
                                            if (r instanceof Response) {
                                                t = void 0, U = r;
                                                break
                                            }
                                            if (r instanceof Error) {
                                                t = r;
                                                continue
                                            }
                                            throw Error("onError: must return new Response() or instance of Error")
                                        }
                                    }
                                }
                            if (t) throw t
                        }
                        if (_.length)
                            for (let t = _.length - 1; t >= 0; t--) {
                                let r = _[t];
                                if (r && "object" == typeof r && "function" == typeof r.onResponse) {
                                    let t = await r.onResponse({
                                        request: x,
                                        response: U,
                                        schemaPath: e,
                                        params: b,
                                        options: M,
                                        id: F
                                    });
                                    if (t) {
                                        if (!(t instanceof Response)) throw Error("onResponse: must return new Response() when modifying the response");
                                        U = t
                                    }
                                }
                            }
                    }
                    if (204 === U.status || "HEAD" === x.method || "0" === U.headers.get("Content-Length")) return U.ok ? {
                        data: void 0,
                        response: U
                    } : {
                        error: void 0,
                        response: U
                    };
                    if (U.ok) return "stream" === R ? {
                        data: U.body,
                        response: U
                    } : {
                        data: await U[R](),
                        response: U
                    };
                    let k = await U.text();
                    try {
                        k = JSON.parse(k)
                    } catch (e) {}
                    return {
                        error: k,
                        response: U
                    }
                }
                return {
                    request: (e, t, r) => f(t, {
                        ...r,
                        method: e.toUpperCase()
                    }),
                    GET: (e, t) => f(e, {
                        ...t,
                        method: "GET"
                    }),
                    PUT: (e, t) => f(e, {
                        ...t,
                        method: "PUT"
                    }),
                    POST: (e, t) => f(e, {
                        ...t,
                        method: "POST"
                    }),
                    DELETE: (e, t) => f(e, {
                        ...t,
                        method: "DELETE"
                    }),
                    OPTIONS: (e, t) => f(e, {
                        ...t,
                        method: "OPTIONS"
                    }),
                    HEAD: (e, t) => f(e, {
                        ...t,
                        method: "HEAD"
                    }),
                    PATCH: (e, t) => f(e, {
                        ...t,
                        method: "PATCH"
                    }),
                    TRACE: (e, t) => f(e, {
                        ...t,
                        method: "TRACE"
                    }),
                    use() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        for (let e of t)
                            if (e) {
                                if ("object" != typeof e || !("onRequest" in e || "onResponse" in e || "onError" in e)) throw Error("Middleware must be an object with one of `onRequest()`, `onResponse() or `onError()`");
                                p.push(e)
                            }
                    },
                    eject() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        for (let e of t) {
                            let t = p.indexOf(e); - 1 !== t && p.splice(t, 1)
                        }
                    }
                }
            }(e),
            n = ed(e, "ts");
        return t.use.apply(t, n), t
    }, "exists", 0, function(e, t) {
        return null != e[t]
    }, "maintenanceMiddleware", 0, ec, "mapValues", 0, function(e, t) {
        return Object.keys(e).reduce(function(r, n) {
            var o;
            return a(a({}, r), ((o = {})[n] = t(e[n]), o))
        }, {})
    }], 677753)
}, 252842, e => {
    "use strict";
    let t;
    var r, n, o, a, i, s, u, c, l, d, h, p, f, m, g, T = e.i(721281),
        y = ((r = y || {}).Strict = "strict", r.Lax = "lax", r.None = "none", r),
        E = ((n = E || {}).PagingParametersChanged = "Paging parameters were changed", n.GetItemsFailure = "Unable to get items", n.InvalidPageNumber = "Invalid page number", n),
        v = ((o = v || {})[o.Initialized = 0] = "Initialized", o[o.Idle = 1] = "Idle", o[o.Loading = 2] = "Loading", o);
    class b {
        getPage(e, t) {
            let r = this.cache[e];
            return r ? r.slice((t - 1) * this.pageSize, t * this.pageSize) : []
        }
        getLength(e) {
            let t = this.cache[e];
            return t ? t.length : 0
        }
        append(e, t) {
            this.cache[e] || (this.cache[e] = []), this.cache[e] = this.cache[e].concat(t)
        }
        removeAfterIndex(e, t) {
            this.cache[e] && (this.cache[e] = this.cache[e].slice(0, t))
        }
        removeAtIndex(e, t, r) {
            this.cache[e] && this.cache[e].splice((t - 1) * this.pageSize + r, 1)
        }
        updateAtIndex(e, t, r, n) {
            this.cache[e] && (this.cache[e][(t - 1) * this.pageSize + r] = n)
        }
        clear(e) {
            delete this.cache[e]
        }
        setPageSize(e) {
            this.pageSize = e
        }
        constructor(e) {
            (0, T._)(this, "pageSize", void 0), (0, T._)(this, "cache", void 0), this.pageSize = e, this.cache = {}
        }
    }
    var R = ((a = R || {}).Asc = "Asc", a.Desc = "Desc", a);

    function w(e, t) {
        let r = new Date(e.toISOString());
        return r.setDate(e.getDate() + t), r
    }
    async function S() {
        await Promise.resolve().then(function() {
            return ef
        }), await Promise.resolve().then(function() {
            return em
        })
    }
    "RelativeTimeFormat" in Intl || S(), new Intl.DateTimeFormat(void 0, {
        year: "numeric",
        weekday: "long",
        month: "long",
        day: "numeric",
        hour: "numeric",
        minute: "numeric"
    });
    let A = new Intl.DateTimeFormat(void 0, {
            year: "numeric",
            month: "short",
            day: "numeric",
            hour: "numeric",
            minute: "numeric",
            hour12: !0
        }),
        P = [{
            year: "numeric",
            month: "short",
            day: "numeric"
        }, {
            hour: "numeric",
            minute: "numeric",
            hour12: !0
        }];
    class I {
        getShortDate(e) {
            return this.getCustomDateTime(e)
        }
        getFullDate(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : " | ";
            return this.getCustomDateTime(e, P[0]) + t + this.getCustomDateTime(e, P[1])
        }
        getOrderedDateParts(e) {
            let t, r = new Intl.DateTimeFormat(this.locale, e);
            try {
                t = r.formatToParts(new Date)
            } catch (e) {
                t = [{
                    type: "month"
                }, {
                    type: "day"
                }, {
                    type: "year"
                }]
            }
            return t.filter(e => "literal" !== e.type)
        }
        getCustomDateTime(e, t) {
            let r = e || new Date;
            ("string" == typeof e || "number" == typeof e) && (r = new Date(e));
            try {
                return new Intl.DateTimeFormat(this.locale, t).format(r)
            } catch (e) {
                return ""
            }
        }
        constructor(e) {
            (0, T._)(this, "locale", void 0), this.locale = e
        }
    }
    var N = ((i = {}).Edge = "edge", i.IE = "ie", i.Chrome = "chrome", i.Opera = "opera", i.Safari = "safari", i.Firefox = "firefox", i.Unknown = "", i),
        O = ((s = {})[s.Windows = 0] = "Windows", s[s.macOS = 1] = "macOS", s[s.Linux = 2] = "Linux", s[s.Unix = 3] = "Unix", s[s.iOS = 4] = "iOS", s[s.Android = 5] = "Android", s[s.Unknown = 6] = "Unknown", s);

    function C() {
        if ("u" > typeof navigator) {
            let {
                platform: e
            } = navigator;
            return e.includes("Win") ? 0 : e.includes("Mac") ? 1 : e.includes("Linux") ? 2 : e.includes("X11") ? 3 : e.includes("iPhone") ? 4 : e.includes("Android") ? 5 : 6
        }
        return null
    }
    var D = ((u = {}).Unidentified = "Unidentified", u.Alt = "Alt", u.AltGraph = "AltGraph", u.CapsLock = "CapsLock", u.Control = "Control", u.Fn = "Fn", u.FnLock = "FnLock", u.Hyper = "Hyper", u.Meta = "Meta", u.NumLock = "NumLock", u.ScrollLock = "ScrollLock", u.Shift = "Shift", u.Super = "Super", u.Symbol = "Symbol", u.SymbolLock = "SymbolLock", u.Enter = "Enter", u.Tab = "Tab", u.ArrowDown = "ArrowDown", u.ArrowLeft = "ArrowLeft", u.ArrowRight = "ArrowRight", u.ArrowUp = "ArrowUp", u.End = "End", u.Home = "Home", u.PageDown = "PageDown", u.PageUp = "PageUp", u.Backspace = "Backspace", u.Clear = "Clear", u.Copy = "Copy", u.CrSel = "CrSel", u.Cut = "Cut", u.Delete = "Delete", u.EraseEof = "EraseEof", u.ExSel = "ExSel", u.Insert = "Insert", u.Paste = "Paste", u.Redo = "Redo", u.Undo = "Undo", u.Accept = "Accept", u.Again = "Again", u.Attn = "Attn", u.Cancel = "Cancel", u.ContextMenu = "ContextMenu", u.Escape = "Escape", u.Execute = "Execute", u.Find = "Find", u.Finish = "Finish", u.Help = "Help", u.Pause = "Pause", u.Play = "Play", u.Props = "Props", u.Select = "Select", u.ZoomIn = "ZoomIn", u.ZoomOut = "ZoomOut", u.BrightnessDown = "BrightnessDown", u.BrightnessUp = "BrightnessUp", u.Eject = "Eject", u.LogOff = "LogOff", u.Power = "Power", u.PowerOff = "PowerOff", u.PrintScreen = "PrintScreen", u.Hibernate = "Hibernate", u.Standby = "Standby", u.WakeUp = "WakeUp", u.AllCandidates = "AllCandidates", u.Alphanumeric = "Alphanumeric", u.CodeInput = "CodeInput", u.Compose = "Compose", u.Convert = "Convert", u.Dead = "Dead", u.FinalMode = "FinalMode", u.GroupFirst = "GroupFirst", u.GroupLast = "GroupLast", u.GroupNext = "GroupNext", u.GroupPrevious = "GroupPrevious", u.ModeChange = "ModeChange", u.NextCandidate = "NextCandidate", u.NonConvert = "NonConvert", u.PreviousCandidate = "PreviousCandidate", u.Process = "Process", u.SingleCandidate = "SingleCandidate", u.HangulMode = "HangulMode", u.HanjaMode = "HanjaMode", u.JunjaMode = "JunjaMode", u.Eisu = "Eisu", u.Hankaku = "Hankaku", u.Hiragana = "Hiragana", u.HiraganaKatakana = "HiraganaKatakana", u.KanaMode = "KanaMode", u.KanjiMode = "KanjiMode", u.Katakana = "Katakana", u.Romaji = "Romaji", u.Zenkaku = "Zenkaku", u.ZenkakuHanaku = "ZenkakuHanaku", u.F1 = "F1", u.F2 = "F2", u.F3 = "F3", u.F4 = "F4", u.F5 = "F5", u.F6 = "F6", u.F7 = "F7", u.F8 = "F8", u.F9 = "F9", u.F10 = "F10", u.F11 = "F11", u.F12 = "F12", u.F13 = "F13", u.F14 = "F14", u.F15 = "F15", u.F16 = "F16", u.F17 = "F17", u.F18 = "F18", u.F19 = "F19", u.F20 = "F20", u.Soft1 = "Soft1", u.Soft2 = "Soft2", u.Soft3 = "Soft3", u.Soft4 = "Soft4", u.AppSwitch = "AppSwitch", u.Call = "Call", u.Camera = "Camera", u.CameraFocus = "CameraFocus", u.EndCall = "EndCall", u.GoBack = "GoBack", u.GoHome = "GoHome", u.HeadsetHook = "HeadsetHook", u.LastNumberRedial = "LastNumberRedial", u.Notification = "Notification", u.MannerMode = "MannerMode", u.VoiceDial = "VoiceDial", u.ChannelDown = "ChannelDown", u.ChannelUp = "ChannelUp", u.MediaFastForward = "MediaFastForward", u.MediaPause = "MediaPause", u.MediaPlay = "MediaPlay", u.MediaPlayPause = "MediaPlayPause", u.MediaRecord = "MediaRecord", u.MediaRewind = "MediaRewind", u.MediaStop = "MediaStop", u.MediaTrackNext = "MediaTrackNext", u.MediaTrackPrevious = "MediaTrackPrevious", u.AudioBalanceLeft = "AudioBalanceLeft", u.AudioBalanceRight = "AudioBalanceRight", u.AudioBassDown = "AudioBassDown", u.AudioBassBoostDown = "AudioBassBoostDown", u.AudioBassBoostToggle = "AudioBassBoostToggle", u.AudioBassBoostUp = "AudioBassBoostUp", u.AudioBassUp = "AudioBassUp", u.AudioFaderFront = "AudioFaderFront", u.AudioFaderRear = "AudioFaderRear", u.AudioSurroundModeNext = "AudioSurroundModeNext", u.AudioTrebleDown = "AudioTrebleDown", u.AudioTrebleUp = "AudioTrebleUp", u.AudioVolumeDown = "AudioVolumeDown", u.AudioVolumeMute = "AudioVolumeMute", u.AudioVolumeUp = "AudioVolumeUp", u.MicrophoneToggle = "MicrophoneToggle", u.MicrophoneVolumeDown = "MicrophoneVolumeDown", u.MicrophoneVolumeMute = "MicrophoneVolumeMute", u.MicrophoneVolumeUp = "MicrophoneVolumeUp", u.TV = "TV", u.TV3DMode = "TV3DMode", u.TVAntennaCable = "TVAntennaCable", u.TVAudioDescription = "TVAudioDescription", u.TVAudioDescriptionMixDown = "TVAudioDescriptionMixDown", u.TVAudioDescriptionMixUp = "TVAudioDescriptionMixUp", u.TVContentsMenu = "TVContentsMenu", u.TVDataService = "TVDataService", u.TVInput = "TVInput", u.TVInputComponent1 = "TVInputComponent1", u.TVInputComponent2 = "TVInputComponent2", u.TVInputComposite1 = "TVInputComposite1", u.TVInputComposite2 = "TVInputComposite2", u.TVInputHDMI1 = "TVInputHDMI1", u.TVInputHDMI2 = "TVInputHDMI2", u.TVInputHDMI3 = "TVInputHDMI3", u.TVInputHDMI4 = "TVInputHDMI4", u.TVInputVGA1 = "TVInputVGA1", u.TVMediaContext = "TVMediaContext", u.TVNetwork = "TVNetwork", u.TVNumberEntry = "TVNumberEntry", u.TVPower = "TVPower", u.TVRadioService = "TVRadioService", u.TVSatellite = "TVSatellite", u.TVSatelliteBS = "TVSatelliteBS", u.TVSatelliteCS = "TVSatelliteCS", u.TVSatelliteToggle = "TVSatelliteToggle", u.TVTerrestrialAnalog = "TVTerrestrialAnalog", u.TVTerrestrialDigital = "TVTerrestrialDigital", u.TVTimer = "TVTimer", u.AVRInput = "AVRInput", u.AVRPower = "AVRPower", u.ColorF0Red = "ColorF0Red", u.ColorF1Green = "ColorF1Green", u.ColorF2Yellow = "ColorF2Yellow", u.ColorF3Blue = "ColorF3Blue", u.ColorF4Grey = "ColorF4Grey", u.ColorF5Brown = "ColorF5Brown", u.ClosedCaptionToggle = "ClosedCaptionToggle", u.Dimmer = "Dimmer", u.DisplaySwap = "DisplaySwap", u.DVR = "DVR", u.Exit = "Exit", u.FavoriteClear0 = "FavoriteClear0", u.FavoriteClear1 = "FavoriteClear1", u.FavoriteClear2 = "FavoriteClear2", u.FavoriteClear3 = "FavoriteClear3", u.FavoriteRecall0 = "FavoriteRecall0", u.FavoriteRecall1 = "FavoriteRecall1", u.FavoriteRecall2 = "FavoriteRecall2", u.FavoriteRecall3 = "FavoriteRecall3", u.FavoriteStore0 = "FavoriteStore0", u.FavoriteStore1 = "FavoriteStore1", u.FavoriteStore2 = "FavoriteStore2", u.FavoriteStore3 = "FavoriteStore3", u.Guide = "Guide", u.GuideNextDay = "GuideNextDay", u.GuidePreviousDay = "GuidePreviousDay", u.Info = "Info", u.InstantReplay = "InstantReplay", u.Link = "Link", u.ListProgram = "ListProgram", u.LiveContent = "LiveContent", u.Lock = "Lock", u.MediaApps = "MediaApps", u.MediaAudioTrack = "MediaAudioTrack", u.MediaLast = "MediaLast", u.MediaSkipBackward = "MediaSkipBackward", u.MediaSkipForward = "MediaSkipForward", u.MediaStepBackward = "MediaStepBackward", u.MediaStepForward = "MediaStepForward", u.MediaTopMenu = "MediaTopMenu", u.NavigateIn = "NavigateIn", u.NavigateNext = "NavigateNext", u.NavigateOut = "NavigateOut", u.NavigatePrevious = "NavigatePrevious", u.NextFavoriteChannel = "NextFavoriteChannel", u.NextUserProfile = "NextUserProfile", u.OnDemand = "OnDemand", u.Pairing = "Pairing", u.PinPDown = "PinPDown", u.PinPMove = "PinPMove", u.PinPToggle = "PinPToggle", u.PinPUp = "PinPUp", u.PlaySpeedDown = "PlaySpeedDown", u.PlaySpeedReset = "PlaySpeedReset", u.PlaySpeedUp = "PlaySpeedUp", u.RandomToggle = "RandomToggle", u.RcLowBattery = "RcLowBattery", u.RecordSpeedNext = "RecordSpeedNext", u.RfBypass = "RfBypass", u.ScanChannelsToggle = "ScanChannelsToggle", u.ScreenModeNext = "ScreenModeNext", u.Settings = "Settings", u.SplitScreenToggle = "SplitScreenToggle", u.STBInput = "STBInput", u.STBPower = "STBPower", u.Subtitle = "Subtitle", u.Teletext = "Teletext", u.VideoModeNext = "VideoModeNext", u.Wink = "Wink", u.ZoomToggle = "ZoomToggle", u.SpeechCorrectionList = "SpeechCorrectionList", u.SpeechInputToggle = "SpeechInputToggle", u.Close = "Close", u.New = "New", u.Open = "Open", u.Print = "Print", u.Save = "Save", u.SpellCheck = "SpellCheck", u.MailForward = "MailForward", u.MailReply = "MailReply", u.MailSend = "MailSend", u.LaunchCalculator = "LaunchCalculator", u.LaunchCalendar = "LaunchCalendar", u.LaunchContacts = "LaunchContacts", u.LaunchMail = "LaunchMail", u.LaunchMediaPlayer = "LaunchMediaPlayer", u.LaunchMusicPlayer = "LaunchMusicPlayer", u.LaunchMyComputer = "LaunchMyComputer", u.LaunchPhone = "LaunchPhone", u.LaunchScreenSaver = "LaunchScreenSaver", u.LaunchSpreadsheet = "LaunchSpreadsheet", u.LaunchWebBrowser = "LaunchWebBrowser", u.LaunchWebCam = "LaunchWebCam", u.LaunchWordProcessor = "LaunchWordProcessor", u.LaunchApplication1 = "LaunchApplication1", u.LaunchApplication2 = "LaunchApplication2", u.LaunchApplication3 = "LaunchApplication3", u.LaunchApplication4 = "LaunchApplication4", u.LaunchApplication5 = "LaunchApplication5", u.LaunchApplication6 = "LaunchApplication6", u.LaunchApplication7 = "LaunchApplication7", u.LaunchApplication8 = "LaunchApplication8", u.LaunchApplication9 = "LaunchApplication9", u.LaunchApplication10 = "LaunchApplication10", u.LaunchApplication11 = "LaunchApplication11", u.LaunchApplication12 = "LaunchApplication12", u.LaunchApplication13 = "LaunchApplication13", u.LaunchApplication14 = "LaunchApplication14", u.LaunchApplication15 = "LaunchApplication15", u.LaunchApplication16 = "LaunchApplication16", u.BrowserBack = "BrowserBack", u.BrowserFavorites = "BrowserFavorites", u.BrowserForward = "BrowserForward", u.BrowserHome = "BrowserHome", u.BrowserRefresh = "BrowserRefresh", u.BrowserSearch = "BrowserSearch", u.BrowserStop = "BrowserStop", u.Decimal = "Decimal", u.Key11 = "Key11", u.Key12 = "Key12", u.Multiply = "Multiply", u.Add = "Add", u.Divide = "Divide", u.Subtract = "Subtract", u.Separator = "Separator", u);
    (c = f || (f = {}))[c.CONTINUE = 100] = "CONTINUE", c[c.SWITCHING_PROTOCOLS = 101] = "SWITCHING_PROTOCOLS", c[c.PROCESSING = 102] = "PROCESSING", c[c.EARLY_HINTS = 103] = "EARLY_HINTS", c[c.OK = 200] = "OK", c[c.CREATED = 201] = "CREATED", c[c.ACCEPTED = 202] = "ACCEPTED", c[c.NON_AUTHORITATIVE_INFORMATION = 203] = "NON_AUTHORITATIVE_INFORMATION", c[c.NO_CONTENT = 204] = "NO_CONTENT", c[c.RESET_CONTENT = 205] = "RESET_CONTENT", c[c.PARTIAL_CONTENT = 206] = "PARTIAL_CONTENT", c[c.MULTI_STATUS = 207] = "MULTI_STATUS", c[c.MULTIPLE_CHOICES = 300] = "MULTIPLE_CHOICES", c[c.MOVED_PERMANENTLY = 301] = "MOVED_PERMANENTLY", c[c.MOVED_TEMPORARILY = 302] = "MOVED_TEMPORARILY", c[c.SEE_OTHER = 303] = "SEE_OTHER", c[c.NOT_MODIFIED = 304] = "NOT_MODIFIED", c[c.USE_PROXY = 305] = "USE_PROXY", c[c.TEMPORARY_REDIRECT = 307] = "TEMPORARY_REDIRECT", c[c.PERMANENT_REDIRECT = 308] = "PERMANENT_REDIRECT", c[c.BAD_REQUEST = 400] = "BAD_REQUEST", c[c.UNAUTHORIZED = 401] = "UNAUTHORIZED", c[c.PAYMENT_REQUIRED = 402] = "PAYMENT_REQUIRED", c[c.FORBIDDEN = 403] = "FORBIDDEN", c[c.NOT_FOUND = 404] = "NOT_FOUND", c[c.METHOD_NOT_ALLOWED = 405] = "METHOD_NOT_ALLOWED", c[c.NOT_ACCEPTABLE = 406] = "NOT_ACCEPTABLE", c[c.PROXY_AUTHENTICATION_REQUIRED = 407] = "PROXY_AUTHENTICATION_REQUIRED", c[c.REQUEST_TIMEOUT = 408] = "REQUEST_TIMEOUT", c[c.CONFLICT = 409] = "CONFLICT", c[c.GONE = 410] = "GONE", c[c.LENGTH_REQUIRED = 411] = "LENGTH_REQUIRED", c[c.PRECONDITION_FAILED = 412] = "PRECONDITION_FAILED", c[c.REQUEST_TOO_LONG = 413] = "REQUEST_TOO_LONG", c[c.REQUEST_URI_TOO_LONG = 414] = "REQUEST_URI_TOO_LONG", c[c.UNSUPPORTED_MEDIA_TYPE = 415] = "UNSUPPORTED_MEDIA_TYPE", c[c.REQUESTED_RANGE_NOT_SATISFIABLE = 416] = "REQUESTED_RANGE_NOT_SATISFIABLE", c[c.EXPECTATION_FAILED = 417] = "EXPECTATION_FAILED", c[c.IM_A_TEAPOT = 418] = "IM_A_TEAPOT", c[c.INSUFFICIENT_SPACE_ON_RESOURCE = 419] = "INSUFFICIENT_SPACE_ON_RESOURCE", c[c.METHOD_FAILURE = 420] = "METHOD_FAILURE", c[c.MISDIRECTED_REQUEST = 421] = "MISDIRECTED_REQUEST", c[c.UNPROCESSABLE_ENTITY = 422] = "UNPROCESSABLE_ENTITY", c[c.LOCKED = 423] = "LOCKED", c[c.FAILED_DEPENDENCY = 424] = "FAILED_DEPENDENCY", c[c.UPGRADE_REQUIRED = 426] = "UPGRADE_REQUIRED", c[c.PRECONDITION_REQUIRED = 428] = "PRECONDITION_REQUIRED", c[c.TOO_MANY_REQUESTS = 429] = "TOO_MANY_REQUESTS", c[c.REQUEST_HEADER_FIELDS_TOO_LARGE = 431] = "REQUEST_HEADER_FIELDS_TOO_LARGE", c[c.UNAVAILABLE_FOR_LEGAL_REASONS = 451] = "UNAVAILABLE_FOR_LEGAL_REASONS", c[c.INTERNAL_SERVER_ERROR = 500] = "INTERNAL_SERVER_ERROR", c[c.NOT_IMPLEMENTED = 501] = "NOT_IMPLEMENTED", c[c.BAD_GATEWAY = 502] = "BAD_GATEWAY", c[c.SERVICE_UNAVAILABLE = 503] = "SERVICE_UNAVAILABLE", c[c.GATEWAY_TIMEOUT = 504] = "GATEWAY_TIMEOUT", c[c.HTTP_VERSION_NOT_SUPPORTED = 505] = "HTTP_VERSION_NOT_SUPPORTED", c[c.INSUFFICIENT_STORAGE = 507] = "INSUFFICIENT_STORAGE", c[c.NETWORK_AUTHENTICATION_REQUIRED = 511] = "NETWORK_AUTHENTICATION_REQUIRED", (l = m || (m = {})).ACCEPTED = "Accepted", l.BAD_GATEWAY = "Bad Gateway", l.BAD_REQUEST = "Bad Request", l.CONFLICT = "Conflict", l.CONTINUE = "Continue", l.CREATED = "Created", l.EXPECTATION_FAILED = "Expectation Failed", l.FAILED_DEPENDENCY = "Failed Dependency", l.FORBIDDEN = "Forbidden", l.GATEWAY_TIMEOUT = "Gateway Timeout", l.GONE = "Gone", l.HTTP_VERSION_NOT_SUPPORTED = "HTTP Version Not Supported", l.IM_A_TEAPOT = "I'm a teapot", l.INSUFFICIENT_SPACE_ON_RESOURCE = "Insufficient Space on Resource", l.INSUFFICIENT_STORAGE = "Insufficient Storage", l.INTERNAL_SERVER_ERROR = "Internal Server Error", l.LENGTH_REQUIRED = "Length Required", l.LOCKED = "Locked", l.METHOD_FAILURE = "Method Failure", l.METHOD_NOT_ALLOWED = "Method Not Allowed", l.MOVED_PERMANENTLY = "Moved Permanently", l.MOVED_TEMPORARILY = "Moved Temporarily", l.MULTI_STATUS = "Multi-Status", l.MULTIPLE_CHOICES = "Multiple Choices", l.NETWORK_AUTHENTICATION_REQUIRED = "Network Authentication Required", l.NO_CONTENT = "No Content", l.NON_AUTHORITATIVE_INFORMATION = "Non Authoritative Information", l.NOT_ACCEPTABLE = "Not Acceptable", l.NOT_FOUND = "Not Found", l.NOT_IMPLEMENTED = "Not Implemented", l.NOT_MODIFIED = "Not Modified", l.OK = "OK", l.PARTIAL_CONTENT = "Partial Content", l.PAYMENT_REQUIRED = "Payment Required", l.PERMANENT_REDIRECT = "Permanent Redirect", l.PRECONDITION_FAILED = "Precondition Failed", l.PRECONDITION_REQUIRED = "Precondition Required", l.PROCESSING = "Processing", l.EARLY_HINTS = "Early Hints", l.UPGRADE_REQUIRED = "Upgrade Required", l.PROXY_AUTHENTICATION_REQUIRED = "Proxy Authentication Required", l.REQUEST_HEADER_FIELDS_TOO_LARGE = "Request Header Fields Too Large", l.REQUEST_TIMEOUT = "Request Timeout", l.REQUEST_TOO_LONG = "Request Entity Too Large", l.REQUEST_URI_TOO_LONG = "Request-URI Too Long", l.REQUESTED_RANGE_NOT_SATISFIABLE = "Requested Range Not Satisfiable", l.RESET_CONTENT = "Reset Content", l.SEE_OTHER = "See Other", l.SERVICE_UNAVAILABLE = "Service Unavailable", l.SWITCHING_PROTOCOLS = "Switching Protocols", l.TEMPORARY_REDIRECT = "Temporary Redirect", l.TOO_MANY_REQUESTS = "Too Many Requests", l.UNAUTHORIZED = "Unauthorized", l.UNAVAILABLE_FOR_LEGAL_REASONS = "Unavailable For Legal Reasons", l.UNPROCESSABLE_ENTITY = "Unprocessable Entity", l.UNSUPPORTED_MEDIA_TYPE = "Unsupported Media Type", l.USE_PROXY = "Use Proxy", l.MISDIRECTED_REQUEST = "Misdirected Request";
    var _ = ((d = _ || {}).CONNECT = "CONNECT", d.DELETE = "DELETE", d.GET = "GET", d.HEAD = "HEAD", d.OPTIONS = "OPTIONS", d.PATCH = "PATCH", d.POST = "POST", d.PUT = "PUT", d.TRACE = "TRACE", d);
    class L {
        getCustomNumber(e, t) {
            try {
                return new Intl.NumberFormat(this.locale, t).format(e)
            } catch (t) {
                return e
            }
        }
        constructor(e, t) {
            (0, T._)(this, "locale", void 0), (0, T._)(this, "currency", void 0), this.locale = e, this.currency = t
        }
    }

    function F(e, t) {
        let r;
        if (Number.isNaN(e)) throw TypeError("The argument 'number' must be of type number");
        let n = {
            currency: {
                style: "currency",
                currency: "USD"
            },
            percent: {
                style: "percent",
                maximumFractionDigits: 2
            },
            decimal: {
                style: "decimal",
                maximumFractionDigits: 2
            }
        };
        if ("string" == typeof t) r = n[t];
        else if ("object" == typeof t) r = t;
        else if (void 0 === t) r = n.decimal;
        else throw TypeError("'options' must be of type string or object based on Intl.NumberFormat");
        return new L("en-US", "USD").getCustomNumber(e, r)
    }
    var M = ((h = M || {}).withPlus = "withPlus", h.withoutPlus = "withoutPlus", h);
    let U = {
        withPlus: ["", "K+", "M+", "B+", "T+"],
        withoutPlus: ["", "K", "M", "B", "T"]
    };

    function x(e) {
        return String(e)
    }

    function k(e, t, r, n) {
        let o = "".concat(Math.round(e));
        if (r && e < r) return n ? F(e) : o;
        let a = t ? U[t] : U[M.withoutPlus],
            i = Math.ceil(o.length / 3),
            s = Math.round(e / 1e3 ** i * 10) / 10,
            u = i - 1,
            c = Math.round(e / 1e3 ** u * 10) / 10;
        return c >= 1e3 ? s + a[i] : c + a[u]
    }
    var V = ((p = {}).processFailure = "processFailure", p.unretriableFailure = "unretriableFailure", p.maxAttemptsReached = "maxAttemptsReached", p);
    let B = (e, t) => r => Math.min(t, 2 ** (r - 1) * e);
    class j {
        handleBatchResult(e, t, r, n) {
            let o = 0,
                a = Date.now();
            t.forEach(e => {
                if (this.completeItems.has(e.key)) e.resolve(this.completeItems.get(e.key));
                else if (n.maxRetryAttempts && n.maxRetryAttempts > 0 && r !== V.unretriableFailure) {
                    var t;
                    let r = (t = e.retryAttempts, n.getFailureCooldown ? n.getFailureCooldown(t) : 1e3);
                    o = o > 0 ? Math.min(o, r) : r, e.retryAttempts + 1 <= n.maxRetryAttempts ? (e.retryAttempts += 1, e.queueAfter = a + r, this.requestQueue.unshift(e)) : e.reject(V.maxAttemptsReached)
                } else e.reject(r)
            }), this.runningBatchCount -= 1, o > 0 ? setTimeout(() => this.processQueue(e, n), o + n.processBatchWaitTime) : this.processQueue(e, n)
        }
        processQueue(e, t) {
            if (this.runningBatchCount >= t.maxConcurrentBatches) return;
            let r = [],
                n = new Map,
                o = [],
                a = Date.now();
            for (; r.length < t.batchSize && this.requestQueue.length > 0;) {
                let e = this.requestQueue.shift();
                e && (e.queueAfter > a ? (n.set(e.key, e), o.push(e)) : this.completeItems.has(e.key) ? e.resolve(this.completeItems.get(e.key)) : n.has(e.key) ? o.push(e) : (n.set(e.key, e), r.push(e)))
            }
            this.requestQueue.push(...o), r.length <= 0 || (this.runningBatchCount += 1, e(r).then(n => {
                Object.keys(n).forEach(e => {
                    this.saveCompleteItem(e, n[e], t)
                }), this.handleBatchResult(e, r, V.processFailure, t)
            }, n => {
                this.handleBatchResult(e, r, n, t)
            }))
        }
        saveCompleteItem(e, t, r) {
            this.completeItems.set(e, t), r.getItemExpiration && setTimeout(() => {
                this.completeItems.delete(e)
            }, r.getItemExpiration(e))
        }
        queueItem(e, t, r, n) {
            return new Promise((o, a) => {
                this.requestQueue.push({
                    key: r(e),
                    itemId: e,
                    retryAttempts: 0,
                    queueAfter: 0,
                    startTime: new Date,
                    resolve: o,
                    reject: a
                }), setTimeout(() => this.processQueue(t, n), n.processBatchWaitTime)
            })
        }
        invalidateItem(e, t) {
            this.completeItems.delete(t(e))
        }
        constructor() {
            (0, T._)(this, "completeItems", new Map), (0, T._)(this, "requestQueue", []), (0, T._)(this, "runningBatchCount", 0)
        }
    }
    for (var q = new Uint8Array(16), H = /^(?:[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}|00000000-0000-0000-0000-000000000000)$/i, G = [], z = 0; z < 256; ++z) G.push((z + 256).toString(16).substr(1));
    var Q = Object.freeze({
        __proto__: null,
        generateRandomUuid: function(e, t, r) {
            var n = (e = e || {}).random || (e.rng || function() {
                if (!g && !(g = "u" > typeof crypto && crypto.getRandomValues && crypto.getRandomValues.bind(crypto) || "u" > typeof msCrypto && "function" == typeof msCrypto.getRandomValues && msCrypto.getRandomValues.bind(msCrypto))) throw Error("crypto.getRandomValues() not supported. See https://github.com/uuidjs/uuid#getrandomvalues-not-supported");
                return g(q)
            })();
            if (n[6] = 15 & n[6] | 64, n[8] = 63 & n[8] | 128, t) {
                r = r || 0;
                for (var o = 0; o < 16; ++o) t[r + o] = n[o];
                return t
            }
            return function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                    r = (G[e[t + 0]] + G[e[t + 1]] + G[e[t + 2]] + G[e[t + 3]] + "-" + G[e[t + 4]] + G[e[t + 5]] + "-" + G[e[t + 6]] + G[e[t + 7]] + "-" + G[e[t + 8]] + G[e[t + 9]] + "-" + G[e[t + 10]] + G[e[t + 11]] + G[e[t + 12]] + G[e[t + 13]] + G[e[t + 14]] + G[e[t + 15]]).toLowerCase();
                if (!("string" == typeof r && H.test(r))) throw TypeError("Stringified UUID is invalid");
                return r
            }(n)
        }
    });

    function W(e) {
        if (!e.includes(",")) return e;
        let t = e.replaceAll('"', '""');
        return '"'.concat(t, '"')
    }
    let Y = "RelativeTimeFormat" in Intl,
        K = ["lookup", "best fit"],
        J = ["long", "short", "narrow"],
        Z = ["always", "auto"],
        $ = ["second", "minute", "hour", "day", "week", "month", "quarter", "year"];

    function X(e) {
        if (null == e) throw TypeError("Argument ".concat(e, " cannot be converted to an Object"));
        return "boolean" == typeof e ? new Boolean(e) : "number" == typeof e ? new Number(e) : "string" == typeof e ? new String(e) : "symbol" == typeof e ? Object(e) : e
    }
    let ee = /-u(?:-[0-9a-z]{2,8})+/gi;

    function et(e) {
        return e.replace(ee, "")
    }

    function er(e, t) {
        let r = t;
        for (;;) {
            if (e.includes(r)) return r;
            let t = r.lastIndexOf("-");
            if (-1 === t) return;
            t >= 2 && "-" === r.charAt(t - 2) && (t -= 2), r = r.slice(0, t)
        }
    }

    function en(e) {
        return "[object Object]" === Object.prototype.toString.call(e)
    }

    function eo(e, t, r, n, o) {
        let a = function(e, t) {
            if ("object" != typeof e) throw TypeError("Given argument ".concat(e, " must be of type Object"));
            if ("string" != typeof t && "symbol" != typeof t) throw TypeError("Given argument ".concat(t, " must be a PropertyKey"));
            return e[t]
        }(e, t);
        if (void 0 === a) return o;
        if (a += "", void 0 !== n && !n.includes(a)) throw RangeError("Value ".concat(a, " out of range for options property ").concat(t));
        return a
    }
    let ea = new WeakMap,
        ei = ["nu"],
        es = {},
        eu = [];

    function ec(e, t, r) {
        let n = ea.get(e);
        null == n && (n = Object.create(null), ea.set(e, n)), n[t] = r
    }

    function el(e, t) {
        let r = ea.get(e);
        if (null == r) throw ReferenceError("No internal slots has been allocated for the given instance of RelativeTimeFormat");
        return r[t]
    }

    function ed(e, t) {
        let r = ea.get(e);
        return null != r && t in r
    }

    function eh(e, t, r) {
        if (!ed(e, "initializedRelativeTimeFormat")) throw TypeError("Internal function called on incompatible receiver ".concat(e.toString()));
        if ("number" != typeof t) throw TypeError("Argument: 'value' must be a number");
        if ("string" != typeof r) throw TypeError("Argument: 'unit' must be a string");
        if (isNaN(t) || 1 / 0 === t || -1 / 0 === t) throw RangeError("Value need to be finite number");
        r = function(e) {
            if ("string" != typeof e) throw TypeError("unit: '".concat(e, "' must be a string"));
            if ("seconds" === e) return "second";
            if ("minutes" === e) return "minute";
            if ("hours" === e) return "hour";
            if ("days" === e) return "day";
            if ("weeks" === e) return "week";
            if ("months" === e) return "month";
            if ("quarters" === e) return "quarter";
            if ("years" === e) return "year";
            if (!$.some(t => t === e)) throw RangeError("Unit: '".concat(e, "' must be one of: ").concat($.map(e => '"'.concat(e, '"')).join(", ")));
            return e
        }(r);
        let n = el(e, "fields"),
            o = el(e, "style"),
            a = "short" === o ? "".concat(r, "-short") : "narrow" === o ? "".concat(r, "-narrow") : r,
            i = a in n;
        i || (a = r);
        let s = n[a];
        if (null == s) throw TypeError("Could not match entry: '".concat(a, "' inside fields for locale: '").concat(el(e, "locale"), "'"));
        if ("auto" === el(e, "numeric") && (i = t + "" in s)) return [{
            type: "literal",
            value: s[t + ""]
        }];
        let u = s[Object.is(t, -0) || t < 0 ? "past" : "future"],
            c = el(e, "numberFormat").formatToParts(Math.abs(t));
        return function(e, t, r) {
            let n = [],
                o = String.prototype.indexOf.call(e, "{", 0),
                a = 0,
                i = 0,
                s = e.length;
            for (; void 0 !== e[o];) {
                if (-1 === (a = String.prototype.indexOf.call(e, "}", o))) throw RangeError("The pattern: '".concat(e, "' is malformed"));
                if (o > i) {
                    let t = e.slice(i, o);
                    n.push({
                        type: "literal",
                        value: t
                    })
                }
                let s = e.slice(o + 1, a);
                if ("0" !== s) throw TypeError("Expected ".concat(s, ' to be "0"'));
                for (let e of r) "literal" === e.type ? n.push({
                    ...e,
                    type: e.type
                }) : n.push({
                    ...e,
                    unit: t
                });
                i = a + 1, o = String.prototype.indexOf.call(e, "{", i)
            }
            if (i < s) {
                let t = e.slice(i, s);
                n.push({
                    type: "literal",
                    value: t
                })
            }
            return n
        }(u[function(e, t) {
            if (!ed(e, "pluralRules")) throw TypeError("Given instance of of Intl.RelativeTimeFormat must have an [[InitializedPluralRules]] internal slot");
            if ("number" != typeof t) throw TypeError("Argument 'n' must be a number");
            return isFinite(t) ? el(e, "pluralRules").select(t) : "other"
        }(e, t)], r, c)
    }
    class ep {
        static supportedLocalesOf(e) {
            let t = arguments[1],
                r = Intl.getCanonicalLocales(e);
            var n = t;
            return void 0 !== n && eo(n = X(n), "localeMatcher", "string", K, "best fit"),
                function(e, t) {
                    let r = [];
                    for (let n of t) void 0 !== er(e, et(n)) && r.push(n);
                    return r
                }(eu, r)
        }
        static __addLocaleData(e) {
            let {
                data: r,
                locale: n
            } = e;
            null == t && (t = n), es[n] = r, eu.includes(n) || eu.push(n)
        }
        format(e, t) {
            if (!(this instanceof Object) || !ed(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.format called on incompatible receiver ".concat(this.toString()));
            let r = eh(this, e = Number(e), t += ""),
                n = "";
            for (let e of r) n += e.value;
            return n
        }
        formatToParts(e, t) {
            if (!(this instanceof Object) || !ed(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.formatToParts called on incompatible receiver ".concat(this.toString()));
            return e = Number(e), t += "", eh(this, e, t)
        }
        resolvedOptions() {
            if (!(this instanceof Object) || !ed(this, "initializedRelativeTimeFormat")) throw TypeError("Method Intl.RelativeTimeFormat.prototype.resolvedOptions called on incompatible receiver ".concat(this.toString()));
            return {
                locale: el(this, "locale"),
                style: el(this, "style"),
                numeric: el(this, "numeric"),
                numberingSystem: el(this, "numberingSystem")
            }
        }
        constructor() {
            let e = arguments[0],
                r = arguments[1];
            if (new.target === void 0) throw TypeError("Constructor Intl.RelativeTimeFormat requires 'new'");
            let n = Intl.getCanonicalLocales(e);
            r = void 0 === r ? Object.create(null) : X(r);
            let o = Object.create(null);
            o.localeMatcher = eo(r, "localeMatcher", "string", K, "best fit");
            let a = function(e, r, n, o, a) {
                    let i = (n.localeMatcher, function(e) {
                            let {
                                availableLocales: r,
                                requestedLocales: n
                            } = e, o = {};
                            for (let e of n) {
                                let t = et(e),
                                    n = er(r, t);
                                if (void 0 !== n) {
                                    if (o.locale = n, e !== t) {
                                        let t = e.match(ee);
                                        o.extension = null == t ? "" : t[0]
                                    }
                                    return o
                                }
                            }
                            return o.locale = function() {
                                if (null == t) throw ReferenceError("Could not determine locale: No default locale has been configured");
                                return t
                            }(), o
                        }({
                            availableLocales: e,
                            requestedLocales: r
                        })),
                        s = i.locale,
                        u = {};
                    u.dataLocale = s;
                    let c = "-u";
                    for (let e of o) {
                        let t = a[s];
                        if (!en(t)) throw TypeError("LocaleData for locale: '".concat(s, "' must be an object"));
                        let r = t[e];
                        if (!(Array.isArray(r) || en(r))) throw TypeError("key: '".concat(e, "' in LocaleData for locale: '").concat(s, "' must be indexable"));
                        let o = r[0];
                        if ("string" != typeof o && null !== o) throw TypeError("value: '".concat(o, "' for key: '").concat(e, "' in LocaleData for locale: '").concat(s, "' must be a string or null"));
                        let l = "";
                        if ("extension" in i) {
                            let t = function(e, t) {
                                if (2 !== t.length) throw TypeError("Could not get UnicodeExtensionValue: The given key: '".concat(t, "' must have a length of 2"));
                                let r = t.length,
                                    n = "-".concat(t, "-"),
                                    o = String.prototype.indexOf.call(e, n);
                                if (-1 !== o) {
                                    let t = o + 4,
                                        n = t,
                                        a = t,
                                        i = !1;
                                    for (; !i;) {
                                        let t = String.prototype.indexOf.call(e, "-", a);
                                        2 == (-1 === t ? r - a : t - a) ? i = !0 : -1 === t ? (n = r, i = !0) : (n = t, a = t + 1)
                                    }
                                    return e.slice(t, n)
                                }
                                if (n = "-".concat(t), -1 !== (o = String.prototype.indexOf.call(e, n)) && o + 3 === r) return ""
                            }(i.extension, e);
                            void 0 !== t && ("" !== t ? r.includes(t) && (o = t, l = "-".concat(e, "-").concat(o)) : r.includes("true") && (o = "true"))
                        }
                        if ("key" in n) {
                            let e = n.key;
                            if ("string" != typeof e && null != e) throw TypeError("options value: '".concat(e, "' must be a string, undefined, or null"));
                            void 0 !== e && r.includes(e) && ! function(e, t) {
                                if (typeof e != typeof t) return !1;
                                if ("number" == typeof e) return !!(isNaN(e) && isNaN(t)) || !(Object.is(e, 0) && Object.is(t, -0)) && e === t;
                                if ("number" == typeof e) throw TypeError("First argument 'x' must not be a number");
                                if (typeof e != typeof t) throw TypeError("The given arguments must have the same type");
                                return null == e || ("string" == typeof e || "boolean" == typeof e ? e === t : "symbol" == typeof e ? e.valueOf() === t.valueOf() : e === t)
                            }(e, o) && (o = e, l = "")
                        }
                        u[e] = o, c += l
                    }
                    if (c.length > 2) {
                        let e = String.prototype.indexOf.call(s, "-x-");
                        if (-1 === e) s = "".concat(s).concat(c);
                        else {
                            let t = s.slice(0, e),
                                r = s.slice(e);
                            s = "".concat(t).concat(c).concat(r)
                        }
                        s = Intl.getCanonicalLocales(s)[0]
                    }
                    return u.locale = s, u
                }(eu, n, o, ei, es),
                i = a.locale;
            ec(this, "locale", i), ec(this, "numberingSystem", a.nu);
            let s = a.dataLocale;
            ec(this, "style", eo(r, "style", "string", J, "long")), ec(this, "numeric", eo(r, "numeric", "string", Z, "always"));
            let u = es[s];
            if (!(u instanceof Object)) throw TypeError("Expected the LocaleDataEntry for locale: '".concat(s, "' to be an Object"));
            ec(this, "fields", u), ec(this, "numberFormat", new Intl.NumberFormat(i)), ec(this, "pluralRules", new Intl.PluralRules(i)), ec(this, "initializedRelativeTimeFormat", this)
        }
    }
    Object.defineProperty(ep.prototype, Symbol.toStringTag, {
        writable: !1,
        enumerable: !1,
        value: "Intl.RelativeTimeFormat",
        configurable: !0
    }), Y || function() {
        if ("u" < typeof Intl) throw TypeError("Could not define Intl.RelativeTimeFormat: Expected 'Intl' to exist. Remember to include polyfills for Intl.NumberFormat, Intl.getCanonicalLocales, and Intl.PluralRules before applying this polyfill");
        Intl.RelativeTimeFormat = ep
    }();
    var ef = Object.freeze({
        __proto__: null
    });
    "__addLocaleData" in Intl.RelativeTimeFormat && Intl.RelativeTimeFormat.__addLocaleData({
        locale: "en",
        data: {
            year: {
                0: "this year",
                1: "next year",
                "-1": "last year",
                future: {
                    one: "in {0} year",
                    other: "in {0} years"
                },
                past: {
                    one: "{0} year ago",
                    other: "{0} years ago"
                }
            },
            "year-short": {
                0: "this yr.",
                1: "next yr.",
                "-1": "last yr.",
                future: {
                    one: "in {0} yr.",
                    other: "in {0} yr."
                },
                past: {
                    one: "{0} yr. ago",
                    other: "{0} yr. ago"
                }
            },
            quarter: {
                0: "this quarter",
                1: "next quarter",
                "-1": "last quarter",
                future: {
                    one: "in {0} quarter",
                    other: "in {0} quarters"
                },
                past: {
                    one: "{0} quarter ago",
                    other: "{0} quarters ago"
                }
            },
            "quarter-short": {
                0: "this qtr.",
                1: "next qtr.",
                "-1": "last qtr.",
                future: {
                    one: "in {0} qtr.",
                    other: "in {0} qtrs."
                },
                past: {
                    one: "{0} qtr. ago",
                    other: "{0} qtrs. ago"
                }
            },
            month: {
                0: "this month",
                1: "next month",
                "-1": "last month",
                future: {
                    one: "in {0} month",
                    other: "in {0} months"
                },
                past: {
                    one: "{0} month ago",
                    other: "{0} months ago"
                }
            },
            "month-short": {
                0: "this mo.",
                1: "next mo.",
                "-1": "last mo.",
                future: {
                    one: "in {0} mo.",
                    other: "in {0} mo."
                },
                past: {
                    one: "{0} mo. ago",
                    other: "{0} mo. ago"
                }
            },
            week: {
                0: "this week",
                1: "next week",
                "-1": "last week",
                future: {
                    one: "in {0} week",
                    other: "in {0} weeks"
                },
                past: {
                    one: "{0} week ago",
                    other: "{0} weeks ago"
                }
            },
            "week-short": {
                0: "this wk.",
                1: "next wk.",
                "-1": "last wk.",
                future: {
                    one: "in {0} wk.",
                    other: "in {0} wk."
                },
                past: {
                    one: "{0} wk. ago",
                    other: "{0} wk. ago"
                }
            },
            day: {
                0: "today",
                1: "tomorrow",
                "-1": "yesterday",
                future: {
                    one: "in {0} day",
                    other: "in {0} days"
                },
                past: {
                    one: "{0} day ago",
                    other: "{0} days ago"
                }
            },
            "day-short": {
                future: {
                    one: "in {0} day",
                    other: "in {0} days"
                },
                past: {
                    one: "{0} day ago",
                    other: "{0} days ago"
                }
            },
            hour: {
                0: "this hour",
                future: {
                    one: "in {0} hour",
                    other: "in {0} hours"
                },
                past: {
                    one: "{0} hour ago",
                    other: "{0} hours ago"
                }
            },
            "hour-short": {
                future: {
                    one: "in {0} hr.",
                    other: "in {0} hr."
                },
                past: {
                    one: "{0} hr. ago",
                    other: "{0} hr. ago"
                }
            },
            minute: {
                0: "this minute",
                future: {
                    one: "in {0} minute",
                    other: "in {0} minutes"
                },
                past: {
                    one: "{0} minute ago",
                    other: "{0} minutes ago"
                }
            },
            "minute-short": {
                future: {
                    one: "in {0} min.",
                    other: "in {0} min."
                },
                past: {
                    one: "{0} min. ago",
                    other: "{0} min. ago"
                }
            },
            second: {
                0: "now",
                future: {
                    one: "in {0} second",
                    other: "in {0} seconds"
                },
                past: {
                    one: "{0} second ago",
                    other: "{0} seconds ago"
                }
            },
            "second-short": {
                0: "now",
                future: {
                    one: "in {0} sec.",
                    other: "in {0} sec."
                },
                past: {
                    one: "{0} sec. ago",
                    other: "{0} sec. ago"
                }
            },
            nu: ["latn"]
        }
    });
    var em = Object.freeze({
        __proto__: null
    });
    e.s(["BatchRequestError", 0, V, "BatchRequestFactory", 0, class {
        createRequestProcessor(e, t, r) {
            let n = {
                processBatchWaitTime: 250,
                maxConcurrentBatches: 5,
                ...r
            };
            return this.createQueueProcessor(e, t, n)
        }
        constructor() {
            (0, T._)(this, "createExponentialBackoffCooldown", B), (0, T._)(this, "createQueueProcessor", (e, t, r) => {
                let n = new j;
                return {
                    queueItem: o => n.queueItem(o, e, t, r),
                    invalidateItem: e => n.invalidateItem(e, t)
                }
            })
        }
    }, "CSVStringToArray", 0, function(e) {
        let t = RegExp('(\\,|\\r?\\n|\\r|^)(?:"([^"]*(?:""[^"]*)*)"|([^"\\,\\r\\n]*))', "gi"),
            r = [
                []
            ],
            n = t.exec(e);
        for (; n;) {
            let [, o, a, i] = n;
            o.length > 0 && "," !== o && r.push([]);
            let s = "";
            s = a ? a.replaceAll(RegExp('""', "g"), '"') : i, r[r.length - 1].push(s), n = t.exec(e)
        }
        let o = r.slice(-1)[0];
        return o && (1 !== o.length || 0 !== o[0].trim().length) || (r = r.slice(0, -1)), r
    }, "CursorPager", 0, class {
        getStatus() {
            return this.status
        }
        isBusy() {
            return this.status !== v.Idle
        }
        getCurrentPageNumber() {
            return this.currentPageNumber
        }
        getPagingParameters() {
            return {
                ...this.firstPagePagingParameters
            }
        }
        hasNextPage() {
            var e;
            let t = this.getCacheKey();
            return this.cache.getLength(t) > this.currentPageNumber * this.pageSize || "string" == typeof(null == (e = this.pagingParameters) ? void 0 : e.cursor)
        }
        canLoadNextPage() {
            return this.hasNextPage() && !this.isBusy()
        }
        canLoadPreviousPage() {
            return !this.isBusy() && this.currentPageNumber > 1
        }
        canLoadFirstPage() {
            return !this.isBusy()
        }
        canReloadCurrentPage() {
            return !this.isBusy()
        }
        setPagingParametersAndLoadFirstPage(e) {
            this.status = v.Loading;
            let t = this.getCacheKey();
            return this.cache.clear(t), void 0 !== e.pageSize && (this.cache.setPageSize(e.pageSize), this.pageSize = e.pageSize), void 0 !== e.loadPageSize && (this.loadPageSize = e.loadPageSize), this.currentPageNumber = 1, this.indexCursors = {}, this.firstPagePagingParameters = {
                ...e
            }, this.pagingParameters = {
                ...e
            }, this.setNextPageCursor(""), this.loadPage(1)
        }
        reloadCurrentPage() {
            if (1 === this.currentPageNumber) return this.loadFirstPage();
            let e = this.getCacheKey(),
                t = 0,
                {
                    indexCursors: r
                } = this,
                n = (this.currentPageNumber - 1) * this.pageSize;
            Object.keys(r).forEach(e => {
                let o = Number(e);
                o > n ? delete r[o] : t = Math.max(o, t)
            });
            let o = Math.floor(n / this.loadPageSize) * this.loadPageSize;
            return this.cache.removeAfterIndex(e, o), this.setNextPageCursor(r[t] || ""), this.loadPage(this.currentPageNumber)
        }
        getCurrentPage() {
            return this.loadPage(this.currentPageNumber)
        }
        loadNextPage() {
            return this.loadPage(this.currentPageNumber + 1)
        }
        loadPreviousPage() {
            return this.loadPage(this.currentPageNumber - 1)
        }
        loadFirstPage() {
            return this.setPagingParametersAndLoadFirstPage(this.firstPagePagingParameters)
        }
        loadPage(e, t) {
            void 0 === t && (this.initId += 1);
            let r = null != t ? t : this.initId;
            return new Promise((t, n) => {
                let o = e => {
                        this.initId === r ? (this.status = v.Idle, n(e)) : n(E.PagingParametersChanged)
                    },
                    a = o => {
                        this.initId === r ? (this.status = v.Idle, this.currentPageNumber = e, t(o)) : n(E.PagingParametersChanged)
                    };
                if (e < 1) return void o(E.InvalidPageNumber);
                let i = this.getCacheKey(),
                    s = this.cache.getPage(i, e);
                s.length === this.pageSize ? a(s) : "string" != typeof this.pagingParameters.cursor ? s.length <= 0 && e > 1 ? o(E.InvalidPageNumber) : a(s) : (this.status = v.Loading, this.loadNextPageIntoCache(i, r).then(() => {
                    this.loadPage(e, r).then(a).catch(o)
                }).catch(o))
            })
        }
        canRemoveItem() {
            return !this.isBusy()
        }
        removeItemAtIndex(e) {
            let t = this.getCacheKey();
            return (this.cache.removeAtIndex(t, this.currentPageNumber, e), this.canReloadCurrentPage()) ? this.getCurrentPage() : this.loadPage(this.currentPageNumber - 1)
        }
        updateItemAtIndex(e, t) {
            let r = this.getCacheKey();
            return this.cache.updateAtIndex(r, this.currentPageNumber, e, t), this.getCurrentPage()
        }
        getCacheKey() {
            return JSON.stringify(this.firstPagePagingParameters)
        }
        setNextPageCursor(e) {
            this.pagingParameters = {
                ...this.pagingParameters,
                cursor: e
            }
        }
        loadNextPageIntoCache(e, t) {
            return new Promise((r, n) => {
                this.indexCursors[this.cache.getLength(e)] = this.pagingParameters.cursor;
                let o = Object.keys(this.indexCursors).length;
                this.getItems({
                    ...this.pagingParameters,
                    count: this.loadPageSize,
                    pageNumber: o
                }).then(o => {
                    t === this.initId ? (this.setNextPageCursor(o.nextPageCursor), this.cache.append(e, o.items), r()) : n(E.PagingParametersChanged)
                }).catch(() => {
                    t === this.initId ? n(E.GetItemsFailure) : n(E.PagingParametersChanged)
                })
            })
        }
        constructor(e, t, r, n) {
            (0, T._)(this, "pageSize", void 0), (0, T._)(this, "loadPageSize", void 0), (0, T._)(this, "getItems", void 0), (0, T._)(this, "cache", void 0), (0, T._)(this, "firstPagePagingParameters", void 0), (0, T._)(this, "pagingParameters", void 0), (0, T._)(this, "indexCursors", void 0), (0, T._)(this, "initId", void 0), (0, T._)(this, "status", void 0), (0, T._)(this, "currentPageNumber", void 0), this.pageSize = e, this.loadPageSize = t, this.getItems = r, this.cache = new b(e), this.firstPagePagingParameters = n, this.pagingParameters = n, this.indexCursors = {}, this.initId = 0, this.status = v.Initialized, this.currentPageNumber = 1, this.setNextPageCursor("")
        }
    }, "DateTimeFormatter", 0, I, "Key", 0, D, "NumberFormatter", 0, L, "PagerError", 0, E, "Platform", 0, O, "SortOrder", 0, R, "StatusCodes", 0, f, "addDays", 0, w, "compileCSV", 0, function(e) {
        return e.map(e => e.map(W).join(",")).join("\n")
    }, "dateTimeFormatter", 0, e => new I(e), "debounce", 0, function(e) {
        let t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 300;
        return [function() {
            for (var n = arguments.length, o = Array(n), a = 0; a < n; a++) o[a] = arguments[a];
            clearTimeout(t), t = setTimeout(() => e(...o), r)
        }, () => {
            clearTimeout(t)
        }]
    }, "deleteCookie", 0, function(e) {
        if (document.cookie.split("; ").map(e => e.split("=")[0]).includes(e)) {
            let t;
            document.cookie = "".concat(e, "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        }
    }, "device", 0, {
        Browser: N,
        getCurrentBrowser: () => {
            var e;
            if ((null == (e = navigator) ? void 0 : e.userAgent) !== void 0) {
                let {
                    userAgent: e
                } = navigator;
                if (null !== /Edge\/([0-9._]+)/.exec(e) || null !== /EdgA?\/([0-9.]+)/.exec(e)) return "edge";
                if (null !== /(?!Chrom.*OPR)Chrome\/([0-9.]+)(:?\s|$)/.exec(e) && (() => {
                        var e, t;
                        if ((null == (t = navigator) || null == (e = t.plugins) ? void 0 : e.namedItem) !== void 0) {
                            let {
                                plugins: e
                            } = navigator;
                            return null !== e.namedItem("Chrome PDF Viewer")
                        }
                        return !1
                    })()) return "chrome";
                if (null !== /Firefox\/([0-9.]+)(?:\s|$)/.exec(e)) return "firefox";
                if (null !== /Opera\/([0-9.]+)(?:\s|$)/.exec(e) || null !== /OPR\/([0-9.]+)(:?\s|$)/.exec(e)) return "opera";
                if (null !== /Trident\/7\.0.*rv:([0-9.]+).*\).*Gecko$/.exec(e) || null !== /MSIE\s([0-9.]+);.*Trident\/[4-7].0/.exec(e) || null !== /MSIE\s(7\.0)/.exec(e)) return "ie";
                if (null !== /Version\/([0-9._]+).*Safari/.exec(e)) return "safari"
            }
            return ""
        },
        getCurrentPlatform: C
    }, "downloadBlob", 0, function(e, t) {
        let r = URL.createObjectURL(e),
            n = document.createElement("a");
        n.setAttribute("href", r), n.setAttribute("download", t), n.style.visibility = "hidden", document.body.appendChild(n), n.click(), document.body.removeChild(n)
    }, "getCookieValueByKey", 0, function(e) {
        var t, r, n, o, a;
        let i = null != (n = null == (a = document) || null == (o = a.cookie) ? void 0 : o.split("; ")) ? n : [],
            s = e.length;
        return null != (t = null == i || null == (r = i.find(t => t.startsWith(e))) ? void 0 : r.substring(s + 1)) ? t : null
    }, "getCurrentPlatform", 0, C, "getCurrentYear", 0, function() {
        return (new Date).getFullYear()
    }, "getFormattedDate", 0, function(e) {
        return e.toLocaleDateString()
    }, "getFormattedDateTime", 0, function(e) {
        return A.format(e)
    }, "getFormattedNumber", 0, x, "getPrettifiedNumber", 0, k, "number", 0, {
        getFormattedNumber: x,
        getAbbreviatedNumber: function(e) {
            return e > 1e6 ? "".concat(Math.trunc(e / 1e6), "M") : String(e)
        },
        getPrettifiedNumber: k,
        suffixNames: M
    }, "numberFormatter", 0, F, "regex", 0, {
        url: /(https?:\/\/(?:[-\w.]+)+(?::\d+)?(?:[-\w_.#!/]*)+(?:\?\S+)?)/g,
        email: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
        escape: function(e) {
            return e.replaceAll(/[-/\\^$*+?.()|[\]{}]/g, "\\$&")
        }
    }, "setCookie", 0, function(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
            n = "".concat(encodeURIComponent(e), "=").concat(encodeURIComponent(t)),
            o = Object.entries(r).map(e => {
                let [t, r] = e;
                if ("undefined" !== r) {
                    if ("boolean" != typeof r) return "".concat(t, "=").concat(r);
                    if (!0 === r) return "".concat(t)
                }
                return ""
            }).join("; ");
        document.cookie = o ? "".concat(n, "; ").concat(o) : n
    }, "startOfToday", 0, function() {
        let e = new Date;
        return e.setHours(0, 0, 0, 0), e
    }, "subDays", 0, function(e, t) {
        return w(e, -t)
    }, "subMonths", 0, function(e, t) {
        var r;
        let n;
        return r = -t, (n = new Date(e.toISOString())).setMonth(e.getMonth() + r), n
    }, "uuidService", 0, Q])
}]);

//# debugId=053e55c3-170d-3b56-5b95-96c298abf0a3
//# sourceMappingURL=1-1e2gknt2ma0.js.map