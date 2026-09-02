;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "dda153a1-6948-f292-cda4-71b8400652dd")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, {
    otherChunks: ["static/chunks/2rr6fddus76yk.js", "static/chunks/1k1h4t7ab8ej4.js", "static/chunks/0tfkbo9y9c057.js", "static/chunks/33kb-6o7r3aeu.js", "static/chunks/3cxlgu9s78l7m.js", "static/chunks/02nvkhuklyoj4.js", "static/chunks/2143wchehj3dm.js", "static/chunks/08qc0r-_yht9q.js", "static/chunks/390v3ae7bd0jv.js", "static/chunks/3-sg9gm1z37_7.js", "static/chunks/12_35_mmekz41.js", "static/chunks/0gvsth8soeuwm.js", "static/chunks/2tjuenzbsgk6h.js", "static/chunks/0g7qyv8ybhn2e.js", "static/chunks/0d_25s_qgf-5r.js", "static/chunks/0fkr010eo3dt4.js", "static/chunks/1jbzejmu4w-n6.js", "static/chunks/0wux6v4ob9zmh.js", "static/chunks/1ughzno7e23tg.js", "static/chunks/1ic4mc6dkoavr.js", "static/chunks/0ifbrx5s8q_bq.js", "static/chunks/3lxc5aidmubgg.js", "static/chunks/0xs5zm37ebv9o.js", "static/chunks/1hh-eh2rus5df.js", "static/chunks/1cxycldf46417.js", "static/chunks/2mk_oxt0emrvn.js", "static/chunks/0aafc9-2m9wua.js", "static/chunks/2tifb8kqn26-w.js", "static/chunks/2k2rvy0puasag.js", "static/chunks/3g4qkcs2op7zj.js", "static/chunks/2m8hjhyvdwk00.js", "static/chunks/2p1wfugiifobt.js", "static/chunks/1zrrdp7sq70z1.js", "static/chunks/2j672g7vjd2lj.js", "static/chunks/2e-k0jcxc0s_3.js", "static/chunks/23w8rq6-kgzk_.js", "static/chunks/2v_-d8smi9w3b.js", "static/chunks/2oxeqa2pqfr-g.js", "static/chunks/31a--cs0jylx1.js", "static/chunks/2p_em-l5g5lwb.js", "static/chunks/1i1013nmebhqy.js", "static/chunks/1ck3aa_y_28y3.js", "static/chunks/043q5_kkr2m84.js", "static/chunks/3pihlo7emyr_1.js", "static/chunks/1u3ad5uzxx8f8.js", "static/chunks/221fulyfic19d.js", "static/chunks/047tyffcq9f0j.js", "static/chunks/1_w-39evio2ag.js", "static/chunks/2h51vp88a6wu9.js", "static/chunks/3rcnsbhhklw4g.js", "static/chunks/3sujfoc76vnwi.js", "static/chunks/1bruvssoa45x0.js", "static/chunks/1detpjqk8-4v4.css", "static/chunks/171csjbcxmap3.css"],
    runtimeModuleIds: [9607, 681109]
}]), (() => {
    let t;
    if (!Array.isArray(globalThis.TURBOPACK)) return;
    var e, n = "https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/_next/",
        r = function() {
            var t, e, n, r;
            if (null != self.TURBOPACK_ASSET_SUFFIX) return self.TURBOPACK_ASSET_SUFFIX;
            let c = null != (t = null == (r = document) || null == (n = r.currentScript) || null == (e = n.getAttribute) ? void 0 : e.call(n, "src")) ? t : "",
                s = c.indexOf("?");
            return s >= 0 ? c.slice(s) : ""
        }(),
        c = ((e = c || {})[e.Runtime = 0] = "Runtime", e[e.Parent = 1] = "Parent", e[e.Update = 2] = "Update", e);
    let s = new WeakMap;

    function o(t, e) {
        this.m = t, this.e = e
    }
    let u = o.prototype,
        i = Object.prototype.hasOwnProperty,
        a = "u" > typeof Symbol && Symbol.toStringTag;

    function l(t, e, n) {
        i.call(t, e) || Object.defineProperty(t, e, n)
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
    u.s = function(t, e, n) {
        let r, c;
        null != e ? c = (r = f(this.c, e)).exports : (r = this.m, c = this.e), r.namespaceObject = c, p(c, t, n)
    }, u.j = function(t, e) {
        let n, r;
        null != e ? r = (n = f(this.c, e)).exports : (n = this.m, r = this.e);
        let c = function(t, e) {
            let n = s.get(t);
            if (!n) {
                s.set(t, n = []);
                let r = t => {
                    if ("default" !== t) {
                        for (let e of n)
                            if (i.call(e, t)) return e
                    }
                };
                t.exports = t.namespaceObject = new Proxy(e, {
                    get(t, e) {
                        if (i.call(t, e) || "default" === e || "__esModule" === e) return Reflect.get(t, e);
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
    }, u.v = d, u.n = function(t, e) {
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

    function y(t) {
        let e = I(t, this.m);
        if (e.namespaceObject) return e.namespaceObject;
        let n = e.exports;
        return e.namespaceObject = j(n, "function" == typeof n ? function() {
            for (var t = arguments.length, e = Array(t), r = 0; r < t; r++) e[r] = arguments[r];
            return n.apply(this, e)
        } : Object.create(null), n && n.__esModule)
    }

    function g(t) {
        let e = t.indexOf("#"); - 1 !== e && (t = t.substring(0, e));
        let n = t.indexOf("?");
        return -1 !== n && (t = t.substring(0, n)), t
    }
    u.i = y, u.A = function(t) {
        return this.r(t)(y.bind(this))
    }, u.t = "function" == typeof require ? require : function() {
        throw Error("Unexpected use of runtime require")
    }, u.r = function(t) {
        return I(t, this.m).exports
    }, u.f = function(t) {
        function e(e) {
            if (e = g(e), i.call(t, e)) return t[e].module();
            let n = Error("Cannot find module '".concat(e, "'"));
            throw n.code = "MODULE_NOT_FOUND", n
        }
        return e.keys = () => Object.keys(t), e.resolve = e => {
            if (e = g(e), i.call(t, e)) return t[e].id();
            let n = Error("Cannot find module '".concat(e, "'"));
            throw n.code = "MODULE_NOT_FOUND", n
        }, e.import = async t => await e(t), e
    };
    let b = function(t) {
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

    function v(t, e) {
        throw Error("Invariant: ".concat(e(t)))
    }
    b.prototype = URL.prototype, u.U = b, u.z = function(t) {
        throw Error("dynamic usage of require is not supported")
    }, u.g = globalThis;
    let w = Symbol("turbopack queues"),
        O = Symbol("turbopack exports"),
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
    u.a = function(t, e) {
        let n = this.m,
            r = e ? Object.assign([], {
                status: -1
            }) : void 0,
            c = new Set,
            {
                resolve: s,
                reject: o,
                promise: u
            } = x(),
            i = Object.assign(u, {
                [O]: n.exports,
                [w]: t => {
                    r && t(r), c.forEach(t), i.catch(() => {})
                }
            }),
            a = {
                get: () => i,
                set(t) {
                    t !== i && (i[O] = t)
                }
            };
        Object.defineProperty(n, "exports", a), Object.defineProperty(n, "namespaceObject", a), t(function(t) {
            let e = t.map(t => {
                    if (null !== t && "object" == typeof t) {
                        if (w in t) return t;
                        if (null != t && "object" == typeof t && "then" in t && "function" == typeof t.then) {
                            let e = Object.assign([], {
                                    status: 0
                                }),
                                n = {
                                    [O]: {},
                                    [w]: t => t(e)
                                };
                            return t.then(t => {
                                n[O] = t, R(e)
                            }, t => {
                                n[_] = t, R(e)
                            }), n
                        }
                    }
                    return {
                        [O]: t,
                        [w]: () => {}
                    }
                }),
                n = () => e.map(t => {
                    if (t[_]) throw t[_];
                    return t[O]
                }),
                {
                    promise: s,
                    resolve: o
                } = x(),
                u = Object.assign(() => o(n), {
                    queueCount: 0
                });

            function i(t) {
                t !== r && !c.has(t) && (c.add(t), t && 0 === t.status && (u.queueCount++, t.push(u)))
            }
            return e.map(t => t[w](i)), u.queueCount ? s : n()
        }, function(t) {
            t ? o(i[_] = t) : s(i[O]), R(r)
        }), r && -1 === r.status && (r.status = 0)
    };
    let C = o.prototype,
        U = new Map;
    u.M = U;
    let P = new Map,
        q = new Map,
        E = new Map;
    async function S(t, e, n) {
        let r;
        if ("string" == typeof n) return function(t, e, n) {
            return M(t, e, n)
        }(t, e, z(n));
        let c = n.included || [],
            s = c.map(t => !!U.has(t) || P.get(t));
        if (s.length > 0 && s.every(t => t)) return void await Promise.all(s);
        for (let s of (r = M(t, e, z(n.path)), c)) P.has(s) || P.set(s, r);
        await r
    }
    C.l = function(t) {
        return S(c.Parent, this.m.id, t)
    };
    let A = Promise.resolve(void 0),
        T = new WeakMap;

    function M(e, n, r) {
        let s = t.loadChunkCached(e, r),
            o = T.get(s);
        if (void 0 === o) {
            let t = T.set.bind(T, s, A);
            o = s.then(t).catch(t => {
                let s;
                switch (e) {
                    case c.Runtime:
                        s = "as a runtime dependency of chunk ".concat(n);
                        break;
                    case c.Parent:
                        s = "from module ".concat(n);
                        break;
                    case c.Update:
                        s = "from an HMR update";
                        break;
                    default:
                        v(e, t => "Unknown source type: ".concat(t))
                }
                let o = Error("Failed to load chunk ".concat(r, " ").concat(s).concat(t ? ": ".concat(t) : ""), t ? {
                    cause: t
                } : void 0);
                throw o.name = "ChunkLoadError", o
            }), T.set(s, o)
        }
        return o
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
    let K = /[^A-Za-z0-9\-_.!~*'()/]/;

    function z(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : n,
            c = K.test(t) ? t.split("/").map(encodeURIComponent).join("/") : t;
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
    C.b = n, C.X = r, C.h = z;

    function L(t) {
        return N(t, ".css")
    }
    let B = {};
    u.c = B;
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
                    v(e, t => "Unknown source type: ".concat(t))
            }
            return "Module ".concat(t, " was instantiated ").concat(r, ", but the module factory is not available.")
        }(t, e, n));
        let c = h(t),
            s = c.exports;
        B[t] = c;
        let u = new o(c, s);
        try {
            r(u, c, s)
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
                let s = t[c];
                for (let s = n; s < c; s++) {
                    let n = t[s],
                        c = e.get(n);
                    if (c) {
                        r = c;
                        break
                    }
                }
                let o = null != r ? r : s,
                    u = !1;
                for (let r = n; r < c; r++) {
                    let n = t[r];
                    e.has(n) || (u || (o === s && Object.defineProperty(s, "name", {
                        value: "module evaluation"
                    }), u = !0), e.set(n, o))
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
                            let s = document.createComment("");
                            c.replaceWith(s), H(t, e, n, void 0, () => s.replaceWith(r()))
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
                }(t), X("string" == typeof t ? z(t) : t.src).resolve()), null != e) {
                for (let t of e.otherChunks) X(z("string" == typeof t ? t : t.path));
                if (await Promise.all(e.otherChunks.map(t => {
                        var e;
                        return e = r, S(c.Runtime, e, t)
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

//# debugId=dda153a1-6948-f292-cda4-71b8400652dd
//# sourceMappingURL=0vx4_qto5_udl.js.map