;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c89dd20f-e460-7ca4-ac58-2f255a052502")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, {
    otherChunks: ["static/chunks/0q8_2vrbponhn.js", "static/chunks/1putgccpbf2qz.js", "static/chunks/0c9mp1nyovua4.js", "static/chunks/1k1h4t7ab8ej4.js", "static/chunks/23n7zb4l6jtdj.js", "static/chunks/0l99otw9ul_m4.js", "static/chunks/2h1r1u1wmgqz2.js", "static/chunks/154dmifymwy1a.js", "static/chunks/25fss_j0lllnk.js", "static/chunks/44gw-3tlro1gv.js", "static/chunks/23k5r9pyy9q12.js", "static/chunks/1qbwjh5bsphda.js", "static/chunks/0tq7xk2yh477_.js", "static/chunks/0d_25s_qgf-5r.js", "static/chunks/271xmff9evtvk.js", "static/chunks/1jd3hf169s7y4.js", "static/chunks/0dd81h1gx_gmv.js", "static/chunks/1ic4mc6dkoavr.js", "static/chunks/09y10dhp07qeo.js", "static/chunks/0agpu-qi1nwpg.js", "static/chunks/1n7vnzlerkrrb.js", "static/chunks/3jidr7so5p-2o.js", "static/chunks/2etv29sw08sk4.js", "static/chunks/1vu9wrvtrb2jq.js", "static/chunks/22ur8g82obnvg.js", "static/chunks/0v9mkv9oateua.js", "static/chunks/2bzbkike7_49p.js", "static/chunks/0tbqnkbcrm802.js", "static/chunks/432mv4ynhhqzt.js", "static/chunks/088n4ncx9r23z.js", "static/chunks/380tqkmvwahoq.js", "static/chunks/0q4lfmsyuzw6w.js", "static/chunks/0p_6579duzd53.js", "static/chunks/1ubtkt_whi9xk.js", "static/chunks/0_ts72zcipx3f.js", "static/chunks/2-cpg1-2dj9if.js", "static/chunks/1q6p_nrgq-za6.js", "static/chunks/3t0xoqcwtcwg7.js", "static/chunks/3lkjy83w11t48.js", "static/chunks/0zsz6w_aair4q.js", "static/chunks/1i1013nmebhqy.js", "static/chunks/3kfuk-96edj_x.js", "static/chunks/36hdbbpx4bjm7.js", "static/chunks/0aluqil2pzsps.js", "static/chunks/1g3w1wjkwp73p.js", "static/chunks/35wofps8zol07.js", "static/chunks/2ou2qre4dzu66.js", "static/chunks/0dlpndo_gpg3y.js", "static/chunks/0oc4x_mx4rd_2.js", "static/chunks/42-xm7ky5go3q.js", "static/chunks/1fty-89qz3i4z.js", "static/chunks/3o4rv65wu1nen.js", "static/chunks/003vtzm8pgqpr.js", "static/chunks/2dr4cy0j5-3dg.css"],
    runtimeModuleIds: [619405, 748348]
}]), (() => {
    let t;
    if (!Array.isArray(globalThis.TURBOPACK)) return;
    var e, n = "https://assets.create.roblox.com/42336d33e3b5695aa502151706d619e534732947/_next/",
        r = function() {
            var t, e, n, r;
            if (null != self.TURBOPACK_ASSET_SUFFIX) return self.TURBOPACK_ASSET_SUFFIX;
            let o = null != (t = null == (r = document) || null == (n = r.currentScript) || null == (e = n.getAttribute) ? void 0 : e.call(n, "src")) ? t : "",
                s = o.indexOf("?");
            return s >= 0 ? o.slice(s) : ""
        }(),
        o = ((e = o || {})[e.Runtime = 0] = "Runtime", e[e.Parent = 1] = "Parent", e[e.Update = 2] = "Update", e);
    let s = new WeakMap;

    function c(t, e) {
        this.m = t, this.e = e
    }
    let i = c.prototype,
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
                o = e[r++];
            if ("number" == typeof o)
                if (0 === o) l(t, n, {
                    value: e[r++],
                    enumerable: !0,
                    writable: !1
                });
                else throw Error("unexpected tag: ".concat(o));
            else "function" == typeof e[r] ? l(t, n, {
                get: o,
                set: e[r++],
                enumerable: !0
            }) : l(t, n, {
                get: o,
                enumerable: !0
            })
        }
        n || Object.seal(t)
    }

    function d(t, e) {
        (null != e ? f(this.c, e) : this.m).exports = t
    }
    i.s = function(t, e, n) {
        let r, o;
        null != e ? o = (r = f(this.c, e)).exports : (r = this.m, o = this.e), r.namespaceObject = o, p(o, t, n)
    }, i.j = function(t, e) {
        let n, r;
        null != e ? r = (n = f(this.c, e)).exports : (n = this.m, r = this.e);
        let o = function(t, e) {
            let n = s.get(t);
            if (!n) {
                s.set(t, n = []);
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
                        let o = r(e);
                        if (o) return {
                            enumerable: !0,
                            configurable: !0,
                            get: () => Reflect.get(o, e)
                        }
                    }
                })
            }
            return n
        }(n, r);
        "object" == typeof t && null !== t && o.push(t)
    }, i.v = d, i.n = function(t, e) {
        let n;
        (n = null != e ? f(this.c, e) : this.m).exports = n.namespaceObject = t
    };
    let m = Object.getPrototypeOf ? t => Object.getPrototypeOf(t) : t => t.__proto__,
        k = [null, m({}), m([]), m(m)];

    function j(t, e, n) {
        let r = [],
            o = -1;
        for (let e = t;
            ("object" == typeof e || "function" == typeof e) && !k.includes(e); e = m(e))
            for (let n of Object.getOwnPropertyNames(e)) r.push(n, function(t, e) {
                return () => t[e]
            }(t, n)), -1 === o && "default" === n && (o = r.length - 1);
        return n && o >= 0 || (o >= 0 ? r.splice(o, 1, 0, t) : r.push("default", 0, t)), p(e, r), e
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
    i.i = y, i.A = function(t) {
        return this.r(t)(y.bind(this))
    }, i.t = "function" == typeof require ? require : function() {
        throw Error("Unexpected use of runtime require")
    }, i.r = function(t) {
        return I(t, this.m).exports
    }, i.f = function(t) {
        function e(e) {
            if (e = g(e), u.call(t, e)) return t[e].module();
            let n = Error("Cannot find module '".concat(e, "'"));
            throw n.code = "MODULE_NOT_FOUND", n
        }
        return e.keys = () => Object.keys(t), e.resolve = e => {
            if (e = g(e), u.call(t, e)) return t[e].id();
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

    function w(t, e) {
        throw Error("Invariant: ".concat(e(t)))
    }
    b.prototype = URL.prototype, i.U = b, i.z = function(t) {
        throw Error("dynamic usage of require is not supported")
    }, i.g = globalThis;
    let v = Symbol("turbopack queues"),
        O = Symbol("turbopack exports"),
        _ = Symbol("turbopack error");

    function q() {
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
            o = new Set,
            {
                resolve: s,
                reject: c,
                promise: i
            } = q(),
            u = Object.assign(i, {
                [O]: n.exports,
                [v]: t => {
                    r && t(r), o.forEach(t), u.catch(() => {})
                }
            }),
            a = {
                get: () => u,
                set(t) {
                    t !== u && (u[O] = t)
                }
            };
        Object.defineProperty(n, "exports", a), Object.defineProperty(n, "namespaceObject", a), t(function(t) {
            let e = t.map(t => {
                    if (null !== t && "object" == typeof t) {
                        if (v in t) return t;
                        if (null != t && "object" == typeof t && "then" in t && "function" == typeof t.then) {
                            let e = Object.assign([], {
                                    status: 0
                                }),
                                n = {
                                    [O]: {},
                                    [v]: t => t(e)
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
                        [v]: () => {}
                    }
                }),
                n = () => e.map(t => {
                    if (t[_]) throw t[_];
                    return t[O]
                }),
                {
                    promise: s,
                    resolve: c
                } = q(),
                i = Object.assign(() => c(n), {
                    queueCount: 0
                });

            function u(t) {
                t !== r && !o.has(t) && (o.add(t), t && 0 === t.status && (i.queueCount++, t.push(i)))
            }
            return e.map(t => t[v](u)), i.queueCount ? s : n()
        }, function(t) {
            t ? c(u[_] = t) : s(u[O]), R(r)
        }), r && -1 === r.status && (r.status = 0)
    };
    let x = c.prototype,
        C = new Map;
    i.M = C;
    let U = new Map,
        P = new Map,
        E = new Map;
    async function S(t, e, n) {
        let r;
        if ("string" == typeof n) return function(t, e, n) {
            return M(t, e, n)
        }(t, e, K(n));
        let o = n.included || [],
            s = o.map(t => !!C.has(t) || U.get(t));
        if (s.length > 0 && s.every(t => t)) return void await Promise.all(s);
        for (let s of (r = M(t, e, K(n.path)), o)) U.has(s) || U.set(s, r);
        await r
    }
    x.l = function(t) {
        return S(o.Parent, this.m.id, t)
    };
    let A = Promise.resolve(void 0),
        T = new WeakMap;

    function M(e, n, r) {
        let s = t.loadChunkCached(e, r),
            c = T.get(s);
        if (void 0 === c) {
            let t = T.set.bind(T, s, A);
            c = s.then(t).catch(t => {
                let s;
                switch (e) {
                    case o.Runtime:
                        s = "as a runtime dependency of chunk ".concat(n);
                        break;
                    case o.Parent:
                        s = "from module ".concat(n);
                        break;
                    case o.Update:
                        s = "from an HMR update";
                        break;
                    default:
                        w(e, t => "Unknown source type: ".concat(t))
                }
                let c = Error("Failed to load chunk ".concat(r, " ").concat(s).concat(t ? ": ".concat(t) : ""), t ? {
                    cause: t
                } : void 0);
                throw c.name = "ChunkLoadError", c
            }), T.set(s, c)
        }
        return c
    }
    x.L = function(t) {
        var e, n;
        return e = o.Parent, n = this.m.id, M(e, n, t)
    };
    x.R = function(t) {
        var e;
        let n = this.r(t);
        return null != (e = null == n ? void 0 : n.default) ? e : n
    }, x.P = function(t) {
        return "/ROOT/".concat(null != t ? t : "")
    }, x.F = function(t) {
        return t ? "file:///ROOT/".concat(t.split("/").map(encodeURIComponent).join("/")) : "file:///ROOT/"
    }, x.q = function(t, e) {
        d.call(this, "".concat(t).concat(r), e)
    };
    let z = /[^A-Za-z0-9\-_.!~*'()/]/;

    function K(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : n,
            o = z.test(t) ? t.split("/").map(encodeURIComponent).join("/") : t;
        return "".concat(e).concat(o).concat(r)
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
    x.b = n, x.X = r, x.h = K;

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
        return F(t, o.Parent, e.id)
    };

    function F(t, e, n) {
        let r = C.get(t);
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
        let o = h(t),
            s = o.exports;
        B[t] = o;
        let i = new c(o, s);
        try {
            r(i, o, s)
        } catch (t) {
            throw o.error = t, t
        }
        return o.namespaceObject && o.exports !== o.namespaceObject && j(o.exports, o.namespaceObject), o
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
                let r, o = n + 1;
                for (; o < t.length && "function" != typeof t[o];) o++;
                if (o === t.length) throw Error("malformed chunk format, expected a factory function");
                let s = t[o];
                for (let s = n; s < o; s++) {
                    let n = t[s],
                        o = e.get(n);
                    if (o) {
                        r = o;
                        break
                    }
                }
                let c = null != r ? r : s,
                    i = !1;
                for (let r = n; r < o; r++) {
                    let n = t[r];
                    e.has(n) || (i || (c === s && Object.defineProperty(s, "name", {
                        value: "module evaluation"
                    }), i = !0), e.set(n, c))
                }
                n = o + 1
            }
        }(e, C)), t.registerChunk(r, n)
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

    function H(t, e, n, r, o) {
        !(null == r || r instanceof DOMException && "NetworkError" === r.name) || n.retryAttempts >= 1 || W.get(e) !== n ? (W.get(e) === n && W.delete(e), n.reject(r)) : (n.retryAttempts++, setTimeout(() => {
            n.resolved || W.get(e) !== n || (o ? o() : (n.loadingStarted = !1, J(t, e)))
        }, 200 + Math.floor(401 * Math.random())))
    }

    function J(t, e) {
        let n = X(e);
        if (n.loadingStarted) return n.promise;
        if (t === o.Runtime) return n.loadingStarted = !0, L(e) && n.resolve(), n.promise;
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
                        let o = document.createElement("link");
                        return o.rel = "stylesheet", o.crossOrigin = null, o.href = e, o.onerror = () => {
                            let s = document.createComment("");
                            o.replaceWith(s), H(t, e, n, void 0, () => s.replaceWith(r()))
                        }, o.onload = () => {
                            n.resolve()
                        }, o
                    };
                    document.head.appendChild(r())
                }
            else if (N(e, ".js")) {
                let o = document.querySelectorAll('script[src="'.concat(e, '"],script[src^="').concat(e, '?"],script[src="').concat(r, '"],script[src^="').concat(r, '?"]'));
                if (o.length > 0)
                    for (let r of Array.from(o)) r.addEventListener("error", () => {
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
                        return e = r, S(o.Runtime, e, t)
                    })), e.runtimeModuleIds.length > 0)
                    for (let t of e.runtimeModuleIds) ! function(t, e) {
                        let n = B[e];
                        if (n) {
                            if (n.error) throw n.error;
                            return
                        }
                        F(e, o.Runtime, t)
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

//# debugId=c89dd20f-e460-7ca4-ac58-2f255a052502
//# sourceMappingURL=3_v_gmxg5-ecd.js.map