;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "90ca8755-ddae-94c1-a7fe-bddcd492ecb6")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, {
    otherChunks: ["static/chunks/2ssup6bjf05g_.js", "static/chunks/3jy1ga5xnxqwa.js", "static/chunks/0eloul7uz7c_1.js", "static/chunks/29dg-4cvwpt_z.js", "static/chunks/0tfkbo9y9c057.js", "static/chunks/2tjuenzbsgk6h.js", "static/chunks/2143wchehj3dm.js", "static/chunks/33kb-6o7r3aeu.js", "static/chunks/1ic4mc6dkoavr.js", "static/chunks/12_35_mmekz41.js", "static/chunks/130chsvoiok_5.js", "static/chunks/42nnwi5i0ohfg.js", "static/chunks/2mk_oxt0emrvn.js", "static/chunks/1hh-eh2rus5df.js", "static/chunks/022fo6_sq9-2h.js", "static/chunks/0wux6v4ob9zmh.js", "static/chunks/3jltax9tr2_bq.js", "static/chunks/2oxeqa2pqfr-g.js", "static/chunks/390v3ae7bd0jv.js", "static/chunks/3xale78np4tr7.js", "static/chunks/3lxc5aidmubgg.js", "static/chunks/2g6r2gnzylspk.js", "static/chunks/3h10ks3i9dqwo.js", "static/chunks/1cxycldf46417.js", "static/chunks/1htaf5owrq_8t.js", "static/chunks/2j672g7vjd2lj.js", "static/chunks/0fkr010eo3dt4.js", "static/chunks/3pihlo7emyr_1.js", "static/chunks/0dik7l2yjjr3v.js", "static/chunks/3g4qkcs2op7zj.js", "static/chunks/2k3ohg0p2hgaa.js", "static/chunks/1hhmn7zx1rcl7.js", "static/chunks/3rcnsbhhklw4g.js", "static/chunks/143p8fc17a6dz.js", "static/chunks/3fm1zvb30l7a5.js", "static/chunks/2uk4z_znbe3tc.js", "static/chunks/273b_9-bc0tmg.js", "static/chunks/1i1013nmebhqy.js", "static/chunks/31a--cs0jylx1.js", "static/chunks/1_w-39evio2ag.js", "static/chunks/1u3ad5uzxx8f8.js", "static/chunks/0l4c_nf3h5xcn.js", "static/chunks/3rswuq1vlnxfu.js", "static/chunks/10a7rwrhhgj2o.js", "static/chunks/1hl86gr_gm0o5.js", "static/chunks/12hzl2b0troac.js", "static/chunks/2h51vp88a6wu9.js", "static/chunks/3bwvi6l96ryv2.js", "static/chunks/0g7qyv8ybhn2e.js", "static/chunks/0aafc9-2m9wua.js", "static/chunks/1h-iadzdu7m53.js", "static/chunks/154p_4ttwcg70.css", "static/chunks/31bcshl-ko1au.css"],
    runtimeModuleIds: [9607, 681109]
}]), (() => {
    let t;
    if (!Array.isArray(globalThis.TURBOPACK)) return;
    var e, n = "https://assets.create.roblox.com/02194f053a1b59cbe6ecee111b72f1c8fa7ba3cc/_next/",
        r = function() {
            var t, e, n, r;
            if (null != self.TURBOPACK_ASSET_SUFFIX) return self.TURBOPACK_ASSET_SUFFIX;
            let c = null != (t = null == (r = document) || null == (n = r.currentScript) || null == (e = n.getAttribute) ? void 0 : e.call(n, "src")) ? t : "",
                o = c.indexOf("?");
            return o >= 0 ? c.slice(o) : ""
        }(),
        c = ((e = c || {})[e.Runtime = 0] = "Runtime", e[e.Parent = 1] = "Parent", e[e.Update = 2] = "Update", e);
    let o = new WeakMap;

    function s(t, e) {
        this.m = t, this.e = e
    }
    let i = s.prototype,
        u = Object.prototype.hasOwnProperty,
        a = "u" > typeof Symbol && Symbol.toStringTag;

    function l(t, e, n) {
        u.call(t, e) || Object.defineProperty(t, e, n)
    }

    function f(t, e) {
        let n = t[e];
        return n || (n = h(e), t[e] = n), n
    }

    function h(t) {
        return {
            exports: {},
            error: void 0,
            id: t,
            namespaceObject: void 0
        }
    }

    function p(t, e, n) {
        l(t, "__esModule", {
            value: !0
        }), a && l(t, a, {
            value: "Module"
        });
        let r = 0;
        for (; r < e.length;) {
            let n = e[r++],
                c = e[r++];
            if ("number" == typeof c)
                if (0 === c) l(t, n, {
                    value: e[r++],
                    enumerable: !0,
                    writable: !1
                });
                else throw Error("unexpected tag: ".concat(c));
            else "function" == typeof e[r] ? l(t, n, {
                get: c,
                set: e[r++],
                enumerable: !0
            }) : l(t, n, {
                get: c,
                enumerable: !0
            })
        }
        n || Object.seal(t)
    }

    function d(t, e) {
        (null != e ? f(this.c, e) : this.m).exports = t
    }
    i.s = function(t, e, n) {
        let r, c;
        null != e ? c = (r = f(this.c, e)).exports : (r = this.m, c = this.e), r.namespaceObject = c, p(c, t, n)
    }, i.j = function(t, e) {
        let n, r;
        null != e ? r = (n = f(this.c, e)).exports : (n = this.m, r = this.e);
        let c = function(t, e) {
            let n = o.get(t);
            if (!n) {
                o.set(t, n = []);
                let r = t => {
                    if ("default" !== t) {
                        for (let e of n)
                            if (u.call(e, t)) return e
                    }
                };
                t.exports = t.namespaceObject = new Proxy(e, {
                    get(t, e) {
                        if (u.call(t, e) || "default" === e || "__esModule" === e) return Reflect.get(t, e);
                        let n = r(e);
                        return n && Reflect.get(n, e)
                    },
                    set: () => !1,
                    defineProperty: () => !1,
                    deleteProperty: () => !1,
                    has: (t, e) => !!Reflect.has(t, e) || "default" !== e && "__esModule" !== e && void 0 !== r(e),
                    ownKeys(t) {
                        let e = Reflect.ownKeys(t);
                        for (let t of n)
                            for (let n of Reflect.ownKeys(t)) "default" === n || e.includes(n) || e.push(n);
                        return e
                    },
                    getOwnPropertyDescriptor(t, e) {
                        let n = Reflect.getOwnPropertyDescriptor(t, e);
                        if (n || "default" === e || "__esModule" === e) return n;
                        let c = r(e);
                        if (c) return {
                            enumerable: !0,
                            configurable: !0,
                            get: () => Reflect.get(c, e)
                        }
                    }
                })
            }
            return n
        }(n, r);
        "object" == typeof t && null !== t && c.push(t)
    }, i.v = d, i.n = function(t, e) {
        let n;
        (n = null != e ? f(this.c, e) : this.m).exports = n.namespaceObject = t
    };
    let m = Object.getPrototypeOf ? t => Object.getPrototypeOf(t) : t => t.__proto__,
        k = [null, m({}), m([]), m(m)];

    function j(t, e, n) {
        let r = [],
            c = -1;
        for (let e = t;
            ("object" == typeof e || "function" == typeof e) && !k.includes(e); e = m(e))
            for (let n of Object.getOwnPropertyNames(e)) r.push(n, function(t, e) {
                return () => t[e]
            }(t, n)), -1 === c && "default" === n && (c = r.length - 1);
        return n && c >= 0 || (c >= 0 ? r.splice(c, 1, 0, t) : r.push("default", 0, t)), p(e, r), e
    }

    function g(t) {
        let e = I(t, this.m);
        if (e.namespaceObject) return e.namespaceObject;
        let n = e.exports;
        return e.namespaceObject = j(n, "function" == typeof n ? function() {
            for (var t = arguments.length, e = Array(t), r = 0; r < t; r++) e[r] = arguments[r];
            return n.apply(this, e)
        } : Object.create(null), n && n.__esModule)
    }

    function b(t) {
        let e = t.indexOf("#"); - 1 !== e && (t = t.substring(0, e));
        let n = t.indexOf("?");
        return -1 !== n && (t = t.substring(0, n)), t
    }
    i.i = g, i.A = function(t) {
        return this.r(t)(g.bind(this))
    }, i.t = "function" == typeof require ? require : function() {
        throw Error("Unexpected use of runtime require")
    }, i.r = function(t) {
        return I(t, this.m).exports
    }, i.f = function(t) {
        function e(e) {
            if (e = b(e), u.call(t, e)) return t[e].module();
            let n = Error("Cannot find module '".concat(e, "'"));
            throw n.code = "MODULE_NOT_FOUND", n
        }
        return e.keys = () => Object.keys(t), e.resolve = e => {
            if (e = b(e), u.call(t, e)) return t[e].id();
            let n = Error("Cannot find module '".concat(e, "'"));
            throw n.code = "MODULE_NOT_FOUND", n
        }, e.import = async t => await e(t), e
    };
    let y = function(t) {
        let e = new URL(t, "x:/"),
            n = {};
        for (let t in e) n[t] = e[t];
        for (let e in n.href = t, n.pathname = t.replace(/[?#].*/, ""), n.origin = n.protocol = "", n.toString = n.toJSON = function() {
                for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                return t
            }, n) Object.defineProperty(this, e, {
            enumerable: !0,
            configurable: !0,
            value: n[e]
        })
    };

    function w(t, e) {
        throw Error("Invariant: ".concat(e(t)))
    }
    y.prototype = URL.prototype, i.U = y, i.z = function(t) {
        throw Error("dynamic usage of require is not supported")
    }, i.g = globalThis;
    let O = Symbol("turbopack queues"),
        v = Symbol("turbopack exports"),
        _ = Symbol("turbopack error");

    function x() {
        let t, e;
        return {
            promise: new Promise((n, r) => {
                e = r, t = n
            }),
            resolve: t,
            reject: e
        }
    }

    function R(t) {
        t && 1 !== t.status && (t.status = 1, t.forEach(t => t.queueCount--), t.forEach(t => t.queueCount-- ? t.queueCount++ : t()))
    }
    i.a = function(t, e) {
        let n = this.m,
            r = e ? Object.assign([], {
                status: -1
            }) : void 0,
            c = new Set,
            {
                resolve: o,
                reject: s,
                promise: i
            } = x(),
            u = Object.assign(i, {
                [v]: n.exports,
                [O]: t => {
                    r && t(r), c.forEach(t), u.catch(() => {})
                }
            }),
            a = {
                get: () => u,
                set(t) {
                    t !== u && (u[v] = t)
                }
            };
        Object.defineProperty(n, "exports", a), Object.defineProperty(n, "namespaceObject", a), t(function(t) {
            let e = t.map(t => {
                    if (null !== t && "object" == typeof t) {
                        if (O in t) return t;
                        if (null != t && "object" == typeof t && "then" in t && "function" == typeof t.then) {
                            let e = Object.assign([], {
                                    status: 0
                                }),
                                n = {
                                    [v]: {},
                                    [O]: t => t(e)
                                };
                            return t.then(t => {
                                n[v] = t, R(e)
                            }, t => {
                                n[_] = t, R(e)
                            }), n
                        }
                    }
                    return {
                        [v]: t,
                        [O]: () => {}
                    }
                }),
                n = () => e.map(t => {
                    if (t[_]) throw t[_];
                    return t[v]
                }),
                {
                    promise: o,
                    resolve: s
                } = x(),
                i = Object.assign(() => s(n), {
                    queueCount: 0
                });

            function u(t) {
                t !== r && !c.has(t) && (c.add(t), t && 0 === t.status && (i.queueCount++, t.push(i)))
            }
            return e.map(t => t[O](u)), i.queueCount ? o : n()
        }, function(t) {
            t ? s(u[_] = t) : o(u[v]), R(r)
        }), r && -1 === r.status && (r.status = 0)
    };
    let C = s.prototype,
        U = new Map;
    i.M = U;
    let P = new Map,
        E = new Map,
        S = new Map;
    async function A(t, e, n) {
        let r;
        if ("string" == typeof n) return function(t, e, n) {
            return M(t, e, n)
        }(t, e, K(n));
        let c = n.included || [],
            o = c.map(t => !!U.has(t) || P.get(t));
        if (o.length > 0 && o.every(t => t)) return void await Promise.all(o);
        for (let o of (r = M(t, e, K(n.path)), c)) P.has(o) || P.set(o, r);
        await r
    }
    C.l = function(t) {
        return A(c.Parent, this.m.id, t)
    };
    let T = Promise.resolve(void 0),
        q = new WeakMap;

    function M(e, n, r) {
        let o = t.loadChunkCached(e, r),
            s = q.get(o);
        if (void 0 === s) {
            let t = q.set.bind(q, o, T);
            s = o.then(t).catch(t => {
                let o;
                switch (e) {
                    case c.Runtime:
                        o = "as a runtime dependency of chunk ".concat(n);
                        break;
                    case c.Parent:
                        o = "from module ".concat(n);
                        break;
                    case c.Update:
                        o = "from an HMR update";
                        break;
                    default:
                        w(e, t => "Unknown source type: ".concat(t))
                }
                let s = Error("Failed to load chunk ".concat(r, " ").concat(o).concat(t ? ": ".concat(t) : ""), t ? {
                    cause: t
                } : void 0);
                throw s.name = "ChunkLoadError", s
            }), q.set(o, s)
        }
        return s
    }
    C.L = function(t) {
        var e, n;
        return e = c.Parent, n = this.m.id, M(e, n, t)
    };
    C.R = function(t) {
        var e;
        let n = this.r(t);
        return null != (e = null == n ? void 0 : n.default) ? e : n
    }, C.P = function(t) {
        return "/ROOT/".concat(null != t ? t : "")
    }, C.F = function(t) {
        return t ? "file:///ROOT/".concat(t.split("/").map(encodeURIComponent).join("/")) : "file:///ROOT/"
    }, C.q = function(t, e) {
        d.call(this, "".concat(t).concat(r), e)
    };
    let z = /[^A-Za-z0-9\-_.!~*'()/]/;

    function K(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : n,
            c = z.test(t) ? t.split("/").map(encodeURIComponent).join("/") : t;
        return "".concat(e).concat(c).concat(r)
    }

    function N(t, e) {
        let n, r = t.indexOf("?");
        if (-1 !== r) n = r;
        else {
            let e = t.indexOf("#");
            n = -1 !== e ? e : t.length
        }
        return n >= e.length && t.startsWith(e, n - e.length)
    }
    C.b = n, C.X = r, C.h = K;

    function L(t) {
        return N(t, ".css")
    }
    let B = {};
    i.c = B;
    let I = (t, e) => {
        let n = B[t];
        if (n) {
            if (n.error) throw n.error;
            return n
        }
        return F(t, c.Parent, e.id)
    };

    function F(t, e, n) {
        let r = U.get(t);
        if ("function" != typeof r) throw Error(function(t, e, n) {
            let r;
            switch (e) {
                case 0:
                    r = "as a runtime entry of chunk ".concat(n);
                    break;
                case 1:
                    r = "because it was required from module ".concat(n);
                    break;
                case 2:
                    r = "because of an HMR update";
                    break;
                default:
                    w(e, t => "Unknown source type: ".concat(t))
            }
            return "Module ".concat(t, " was instantiated ").concat(r, ", but the module factory is not available.")
        }(t, e, n));
        let c = h(t),
            o = c.exports;
        B[t] = c;
        let i = new s(c, o);
        try {
            r(i, c, o)
        } catch (t) {
            throw c.error = t, t
        }
        return c.namespaceObject && c.exports !== c.namespaceObject && j(c.exports, c.namespaceObject), c
    }

    function D(e) {
        let n;
        if (!Array.isArray(e)) return t.registerChunk(void 0, e);
        let r = function(t) {
            if ("string" == typeof t) return t;
            if (t) return {
                src: t.getAttribute("src")
            };
            if ("u" > typeof TURBOPACK_NEXT_CHUNK_URLS) return {
                src: TURBOPACK_NEXT_CHUNK_URLS.pop()
            };
            throw Error("chunk path empty but not in a worker")
        }(e[0]);
        return 2 === e.length ? n = e[1] : (n = void 0, ! function(t, e) {
            let n = 1;
            for (; n < t.length;) {
                let r, c = n + 1;
                for (; c < t.length && "function" != typeof t[c];) c++;
                if (c === t.length) throw Error("malformed chunk format, expected a factory function");
                let o = t[c];
                for (let o = n; o < c; o++) {
                    let n = t[o],
                        c = e.get(n);
                    if (c) {
                        r = c;
                        break
                    }
                }
                let s = null != r ? r : o,
                    i = !1;
                for (let r = n; r < c; r++) {
                    let n = t[r];
                    e.has(n) || (i || (s === o && Object.defineProperty(o, "name", {
                        value: "module evaluation"
                    }), i = !0), e.set(n, s))
                }
                n = c + 1
            }
        }(e, U)), t.registerChunk(r, n)
    }
    let W = new Map;

    function X(t) {
        let e = W.get(t);
        if (!e) {
            let n, r;
            e = {
                resolved: !1,
                loadingStarted: !1,
                retryAttempts: 0,
                promise: new Promise((t, e) => {
                    n = t, r = e
                }),
                resolve: () => {
                    e.resolved = !0, n()
                },
                reject: r
            }, W.set(t, e)
        }
        return e
    }

    function H(t, e, n, r, c) {
        !(null == r || r instanceof DOMException && "NetworkError" === r.name) || n.retryAttempts >= 1 || W.get(e) !== n ? (W.get(e) === n && W.delete(e), n.reject(r)) : (n.retryAttempts++, setTimeout(() => {
            n.resolved || W.get(e) !== n || (c ? c() : (n.loadingStarted = !1, J(t, e)))
        }, 200 + Math.floor(401 * Math.random())))
    }

    function J(t, e) {
        let n = X(e);
        if (n.loadingStarted) return n.promise;
        if (t === c.Runtime) return n.loadingStarted = !0, L(e) && n.resolve(), n.promise;
        if ("function" == typeof importScripts)
            if (L(e));
            else if (N(e, ".js")) {
            self.TURBOPACK_NEXT_CHUNK_URLS.push(e);
            try {
                importScripts(e)
            } catch (r) {
                H(t, e, n, r)
            }
        } else throw Error("can't infer type of chunk from URL ".concat(e, " in worker"));
        else {
            let r = decodeURI(e);
            if (L(e))
                if (document.querySelectorAll('link[rel=stylesheet][href="'.concat(e, '"],link[rel=stylesheet][href^="').concat(e, '?"],link[rel=stylesheet][href="').concat(r, '"],link[rel=stylesheet][href^="').concat(r, '?"]')).length > 0) n.resolve();
                else {
                    let r = () => {
                        let c = document.createElement("link");
                        return c.rel = "stylesheet", c.crossOrigin = null, c.href = e, c.onerror = () => {
                            let o = document.createComment("");
                            c.replaceWith(o), H(t, e, n, void 0, () => o.replaceWith(r()))
                        }, c.onload = () => {
                            n.resolve()
                        }, c
                    };
                    document.head.appendChild(r())
                }
            else if (N(e, ".js")) {
                let c = document.querySelectorAll('script[src="'.concat(e, '"],script[src^="').concat(e, '?"],script[src="').concat(r, '"],script[src^="').concat(r, '?"]'));
                if (c.length > 0)
                    for (let r of Array.from(c)) r.addEventListener("error", () => {
                        r.remove(), H(t, e, n)
                    }, {
                        once: !0
                    });
                else {
                    let r = document.createElement("script");
                    r.crossOrigin = null, r.src = e, r.onerror = () => {
                        r.remove(), H(t, e, n)
                    }, document.head.appendChild(r)
                }
            } else throw Error("can't infer type of chunk from URL ".concat(e))
        }
        return n.loadingStarted = !0, n.promise
    }
    t = {
        async registerChunk(t, e) {
            let r;
            if (null != t && (r = function(t) {
                    if ("string" == typeof t) return t;
                    let e = decodeURIComponent(t.src.replace(/[?#].*$/, ""));
                    return e.startsWith(n) ? e.slice(n.length) : e
                }(t), X("string" == typeof t ? K(t) : t.src).resolve()), null != e) {
                for (let t of e.otherChunks) X(K("string" == typeof t ? t : t.path));
                if (await Promise.all(e.otherChunks.map(t => {
                        var e;
                        return e = r, A(c.Runtime, e, t)
                    })), e.runtimeModuleIds.length > 0)
                    for (let t of e.runtimeModuleIds) ! function(t, e) {
                        let n = B[e];
                        if (n) {
                            if (n.error) throw n.error;
                            return
                        }
                        F(e, c.Runtime, t)
                    }(r, t)
            }
        },
        loadChunkCached: (t, e) => J(t, e)
    };
    var Z = globalThis.TURBOPACK;
    globalThis.TURBOPACK = {
        push: D
    }, Z.forEach(D)
})();

//# debugId=90ca8755-ddae-94c1-a7fe-bddcd492ecb6
//# sourceMappingURL=3p-4pl5w_ikjp.js.map