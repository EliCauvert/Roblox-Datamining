;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ebee9039-5ac4-2d2a-34c6-1c896a55496c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, {
    otherChunks: ["static/chunks/3ccw0qy_wn35s.js", "static/chunks/0t9uovzspckzf.js", "static/chunks/3ii1ecuklnqlg.js", "static/chunks/3hiqcxmrj--9y.js", "static/chunks/0pjfd26t4yoyv.js", "static/chunks/1-mg273i5jx20.js", "static/chunks/1echozi_u-slr.js", "static/chunks/3mue3wkk1pdfc.js", "static/chunks/3ne420zdh5q01.js", "static/chunks/1l8yrw17y7vbq.js", "static/chunks/1go7lz4_lzkf-.js", "static/chunks/385sd88rk7lmv.js", "static/chunks/1t38xna7lqg2w.js", "static/chunks/0wkdy6057m81e.js", "static/chunks/1lgeer4xjg0ya.js", "static/chunks/2ypaspekckre5.js", "static/chunks/3iy9zk7oxpa6n.js", "static/chunks/1rzypgxog1y8p.js", "static/chunks/0d2lciuu-tajz.js", "static/chunks/0ggdtb1l999km.js", "static/chunks/01v-g1to9itbz.js", "static/chunks/1ebba1jjbnk9r.js", "static/chunks/0fy9mc6oztg4n.js", "static/chunks/3f_lhbw6kkj-9.js", "static/chunks/2voxoifk1g1_v.js", "static/chunks/33_id_l0h3pvz.js", "static/chunks/0xb-m5xvz2esm.js", "static/chunks/1gu92tqe4kpff.js", "static/chunks/0f8-xkdrq599_.js", "static/chunks/1-7ppf-h1gg5f.js", "static/chunks/0uj4ss2bom_4j.js", "static/chunks/0jj22kc54d2ab.js", "static/chunks/0z8j8ways6vvh.js", "static/chunks/1yx8fjaqv8v8-.js", "static/chunks/1tr1kraml024c.js", "static/chunks/1al96ztqw3e9a.js", "static/chunks/384-xnco5yatq.js", "static/chunks/3z4ef3yir9pox.js", "static/chunks/2sgzzvt5xxh7q.js", "static/chunks/26zwbbjr93yzq.js", "static/chunks/44ii9wspk_9g1.js", "static/chunks/3od59e46n3nun.js", "static/chunks/2aodgfrdsua_x.js", "static/chunks/13915roty9jjj.js", "static/chunks/13kk3byoi26gf.js", "static/chunks/3ssdwotd-jv7g.js", "static/chunks/11e5kshmjr500.js", "static/chunks/018szjn5wou_0.js", "static/chunks/1nt35jg9yqvli.css", "static/chunks/0vfc6h0dhcry8.css"],
    runtimeModuleIds: [12480, 681109]
}]), (() => {
    let t;
    var e, n = globalThis.TURBOPACK;
    if (void 0 === n) n = [];
    else if (!Array.isArray(n)) return;
    var r = function() {
            var t, e, n, r;
            if (null != self.TURBOPACK_ASSET_SUFFIX) return self.TURBOPACK_ASSET_SUFFIX;
            let o = null != (t = null == (r = document) || null == (n = r.currentScript) || null == (e = n.getAttribute) ? void 0 : e.call(n, "src")) ? t : "",
                c = o.indexOf("?");
            return c >= 0 ? o.slice(c) : ""
        }(),
        o = ((e = o || {})[e.Runtime = 0] = "Runtime", e[e.Parent = 1] = "Parent", e[e.Update = 2] = "Update", e);
    let c = new WeakMap;

    function s(t, e) {
        this.m = t, this.e = e
    }
    let i = s.prototype,
        u = Object.prototype.hasOwnProperty,
        l = "u" > typeof Symbol && Symbol.toStringTag;

    function a(t, e, n) {
        u.call(t, e) || Object.defineProperty(t, e, n)
    }

    function f(t, e) {
        let n = t.get(e);
        return void 0 === n && (n = h(e), t.set(e, n)), n
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
        a(t, "__esModule", {
            value: !0
        }), l && a(t, l, {
            value: "Module"
        });
        let r = 0;
        for (; r < e.length;) {
            let n = e[r++],
                o = e[r++];
            if ("number" == typeof o)
                if (0 === o) a(t, n, {
                    value: e[r++],
                    enumerable: !0,
                    writable: !1
                });
                else throw Error("unexpected tag: ".concat(o));
            else "function" == typeof e[r] ? a(t, n, {
                get: o,
                set: e[r++],
                enumerable: !0
            }) : a(t, n, {
                get: o,
                enumerable: !0
            })
        }
        n || Object.seal(t)
    }

    function d(t, e, n) {
        let r, o;
        null != e ? o = (r = f(this.c, e)).exports : (r = this.m, o = this.e), r.namespaceObject = o, p(o, t, n)
    }

    function m(t, e, n, r) {
        let o = Reflect.getOwnPropertyDescriptor(n, r);
        if (o) {
            if ("value" in o) return void t.push(e, 0, o.value);
            if (o.get) return void t.push(e, o.get)
        }
        t.push(e, () => n[r])
    }

    function k(t, e) {
        (null != e ? f(this.c, e) : this.m).exports = t
    }
    i.s = d, i.S = function(t, e) {
        let n = [],
            r = 0;
        for (; r < t.length;) {
            let e = t[r++],
                o = r;
            for (; r < t.length && 0 !== t[r];) r++;
            let c = r;
            r++;
            let s = "string" == typeof e || "number" == typeof e ? b.call(this, e) : e;
            if (c - o == 1) {
                let e = t[o].split(",");
                for (let t = 0; t < e.length; t += 2) m(n, e[t], s, e[t + 1])
            } else
                for (let e = o; e < c; e += 2) m(n, t[e], s, t[e + 1])
        }
        d.call(this, n, e)
    }, i.j = function(t, e) {
        let n, r;
        null != e ? r = (n = f(this.c, e)).exports : (n = this.m, r = this.e);
        let o = function(t, e) {
            let n = c.get(t);
            if (!n) {
                c.set(t, n = []);
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
    }, i.v = k, i.n = function(t, e) {
        let n;
        (n = null != e ? f(this.c, e) : this.m).exports = n.namespaceObject = t
    };
    let j = Object.getPrototypeOf ? t => Object.getPrototypeOf(t) : t => t.__proto__,
        y = [null, j({}), j([]), j(j)];

    function g(t, e, n) {
        let r = [],
            o = -1;
        for (let e = t;
            ("object" == typeof e || "function" == typeof e) && !y.includes(e); e = j(e))
            for (let n of Object.getOwnPropertyNames(e)) r.push(n, function(t, e) {
                return () => t[e]
            }(t, n)), -1 === o && "default" === n && (o = r.length - 1);
        return n && o >= 0 || (o >= 0 ? r.splice(o, 1, 0, t) : r.push("default", 0, t)), p(e, r), e
    }

    function b(t) {
        let e = F(t, this.m);
        if (e.namespaceObject) return e.namespaceObject;
        let n = e.exports;
        return e.namespaceObject = g(n, "function" == typeof n ? function() {
            for (var t = arguments.length, e = Array(t), r = 0; r < t; r++) e[r] = arguments[r];
            return n.apply(this, e)
        } : Object.create(null), n && n.__esModule)
    }

    function v(t) {
        let e = t.indexOf("#"); - 1 !== e && (t = t.substring(0, e));
        let n = t.indexOf("?");
        return -1 !== n && (t = t.substring(0, n)), t
    }
    i.i = b, i.A = function(t) {
        return this.r(t)(b.bind(this))
    }, i.t = "function" == typeof require ? require : function() {
        throw Error("Unexpected use of runtime require")
    }, i.r = function(t) {
        return F(t, this.m).exports
    }, i.f = function(t) {
        function e(e) {
            if (e = v(e), u.call(t, e)) return t[e].module();
            let n = Error("Cannot find module '".concat(e, "'"));
            throw n.code = "MODULE_NOT_FOUND", n
        }
        return e.keys = () => Object.keys(t), e.resolve = e => {
            if (e = v(e), u.call(t, e)) return t[e].id();
            let n = Error("Cannot find module '".concat(e, "'"));
            throw n.code = "MODULE_NOT_FOUND", n
        }, e.import = async t => await e(t), e
    };
    let w = function(t) {
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

    function O(t, e) {
        throw Error("Invariant: ".concat(e(t)))
    }
    w.prototype = URL.prototype, i.U = w, i.z = function(t) {
        throw Error("dynamic usage of require is not supported")
    }, i.g = globalThis;
    let _ = Symbol("turbopack queues"),
        x = Symbol("turbopack exports"),
        C = Symbol("turbopack error");

    function R() {
        let t, e;
        return {
            promise: new Promise((n, r) => {
                e = r, t = n
            }),
            resolve: t,
            reject: e
        }
    }

    function U(t) {
        t && 1 !== t.status && (t.status = 1, t.forEach(t => t.queueCount--), t.forEach(t => t.queueCount-- ? t.queueCount++ : t()))
    }
    i.a = function(t, e) {
        let n = this.m,
            r = e ? Object.assign([], {
                status: -1
            }) : void 0,
            o = new Set,
            {
                resolve: c,
                reject: s,
                promise: i
            } = R(),
            u = Object.assign(i, {
                [x]: n.exports,
                [_]: t => {
                    r && t(r), o.forEach(t), u.catch(() => {})
                }
            }),
            l = {
                get: () => u,
                set(t) {
                    t !== u && (u[x] = t)
                }
            };
        Object.defineProperty(n, "exports", l), Object.defineProperty(n, "namespaceObject", l), t(function(t) {
            let e = t.map(t => {
                    if (null !== t && "object" == typeof t) {
                        if (_ in t) return t;
                        if (null != t && "object" == typeof t && "then" in t && "function" == typeof t.then) {
                            let e = Object.assign([], {
                                    status: 0
                                }),
                                n = {
                                    [x]: {},
                                    [_]: t => t(e)
                                };
                            return t.then(t => {
                                n[x] = t, U(e)
                            }, t => {
                                n[C] = t, U(e)
                            }), n
                        }
                    }
                    return {
                        [x]: t,
                        [_]: () => {}
                    }
                }),
                n = () => e.map(t => {
                    if (t[C]) throw t[C];
                    return t[x]
                }),
                {
                    promise: c,
                    resolve: s
                } = R(),
                i = Object.assign(() => s(n), {
                    queueCount: 0
                });

            function u(t) {
                t !== r && !o.has(t) && (o.add(t), t && 0 === t.status && (i.queueCount++, t.push(i)))
            }
            return e.map(t => t[_](u)), i.queueCount ? c : n()
        }, function(t) {
            t ? s(u[C] = t) : c(u[x]), U(r)
        }), r && -1 === r.status && (r.status = 0)
    };
    let P = s.prototype,
        A = "string" == typeof TURBOPACK_CHUNK_BASE_PATH ? TURBOPACK_CHUNK_BASE_PATH : "https://assets.create.roblox.com/838cfd9ebc22d2c70a944f6710de0f61eddfffa0/_next/",
        S = new Map;
    i.M = S;
    let E = new Map,
        q = new Map,
        T = new Map;
    async function M(t, e, n) {
        let r;
        if ("string" == typeof n) return function(t, e, n) {
            return N(t, e, n)
        }(t, e, L(n));
        let o = n.included || [],
            c = o.map(t => !!S.has(t) || E.get(t));
        if (c.length > 0 && c.every(t => t)) return void await Promise.all(c);
        for (let c of (r = N(t, e, L(n.path)), o)) E.has(c) || E.set(c, r);
        await r
    }
    P.l = function(t) {
        return M(o.Parent, this.m.id, t)
    };
    let z = Promise.resolve(void 0),
        K = new WeakMap;

    function N(e, n, r) {
        let c = t.loadChunkCached(e, r),
            s = K.get(c);
        if (void 0 === s) {
            let t = K.set.bind(K, c, z);
            s = c.then(t).catch(t => {
                let c;
                switch (e) {
                    case o.Runtime:
                        c = "as a runtime dependency of chunk ".concat(n);
                        break;
                    case o.Parent:
                        c = "from module ".concat(n);
                        break;
                    case o.Update:
                        c = "from an HMR update";
                        break;
                    default:
                        O(e, t => "Unknown source type: ".concat(t))
                }
                let s = Error("Failed to load chunk ".concat(r, " ").concat(c).concat(t ? ": ".concat(t) : ""), t ? {
                    cause: t
                } : void 0);
                throw s.name = "ChunkLoadError", s
            }), K.set(c, s)
        }
        return s
    }
    P.L = function(t) {
        var e, n;
        return e = o.Parent, n = this.m.id, N(e, n, t)
    };
    P.R = function(t) {
        var e;
        let n = this.r(t);
        return null != (e = null == n ? void 0 : n.default) ? e : n
    }, P.P = function(t) {
        return "/ROOT/".concat(null != t ? t : "")
    }, P.F = function(t, e) {
        return "file:///".concat(encodeURIComponent(null != e ? e : "ROOT"), "/").concat(t.split("/").map(encodeURIComponent).join("/"))
    }, P.q = function(t, e) {
        k.call(this, "".concat(t).concat(r), e)
    };
    let B = /[^A-Za-z0-9\-_.!~*'()/]/;

    function L(t) {
        let e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : A,
            n = B.test(t) ? t.split("/").map(encodeURIComponent).join("/") : t;
        return "".concat(e).concat(n).concat(r)
    }

    function I(t, e) {
        let n, r = t.indexOf("?");
        if (-1 !== r) n = r;
        else {
            let e = t.indexOf("#");
            n = -1 !== e ? e : t.length
        }
        return n >= e.length && t.startsWith(e, n - e.length)
    }
    P.b = A, P.X = r, P.h = L;

    function H(t) {
        return I(t, ".css")
    }
    let D = new Map;
    i.c = D;
    let F = (t, e) => {
        let n = D.get(t);
        if (n) {
            if (n.error) throw n.error;
            return n
        }
        return W(t, o.Parent, e.id)
    };

    function W(t, e, n) {
        let r = S.get(t);
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
                    O(e, t => "Unknown source type: ".concat(t))
            }
            return "Module ".concat(t, " was instantiated ").concat(r, ", but the module factory is not available.")
        }(t, e, n));
        let o = h(t),
            c = o.exports;
        D.set(t, o);
        let i = new s(o, c);
        try {
            r(i, o, c)
        } catch (t) {
            throw o.error = t, t
        }
        return o.namespaceObject && o.exports !== o.namespaceObject && g(o.exports, o.namespaceObject), o
    }

    function X(e) {
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
                let c = t[o];
                for (let c = n; c < o; c++) {
                    let n = t[c],
                        o = e.get(n);
                    if (o) {
                        r = o;
                        break
                    }
                }
                let s = null != r ? r : c,
                    i = !1;
                for (let r = n; r < o; r++) {
                    let n = t[r];
                    e.has(n) || (i || (s === c && Object.defineProperty(c, "name", {
                        value: "module evaluation"
                    }), i = !0), e.set(n, s))
                }
                n = o + 1
            }
        }(e, S)), t.registerChunk(r, n)
    }
    let J = new Map;

    function Z(t) {
        let e = J.get(t);
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
            }, J.set(t, e)
        }
        return e
    }

    function $(t, e, n, r, o) {
        !(null == r || r instanceof DOMException && "NetworkError" === r.name) || n.retryAttempts >= 1 || J.get(e) !== n ? (J.get(e) === n && J.delete(e), n.reject(r)) : (n.retryAttempts++, setTimeout(() => {
            n.resolved || J.get(e) !== n || (o ? o() : (n.loadingStarted = !1, G(t, e)))
        }, 200 + Math.floor(401 * Math.random())))
    }

    function G(t, e) {
        let n = Z(e);
        if (n.loadingStarted) return n.promise;
        if (t === o.Runtime) return n.loadingStarted = !0, H(e) && n.resolve(), n.promise;
        if ("function" == typeof importScripts)
            if (H(e));
            else if (I(e, ".js")) {
            self.TURBOPACK_NEXT_CHUNK_URLS.push(e);
            try {
                importScripts(e)
            } catch (r) {
                $(t, e, n, r)
            }
        } else throw Error("can't infer type of chunk from URL ".concat(e, " in worker"));
        else {
            let r = decodeURI(e);
            if (H(e))
                if (document.querySelectorAll('link[rel=stylesheet][href="'.concat(e, '"],link[rel=stylesheet][href^="').concat(e, '?"],link[rel=stylesheet][href="').concat(r, '"],link[rel=stylesheet][href^="').concat(r, '?"]')).length > 0) n.resolve();
                else {
                    let r = () => {
                        let o = document.createElement("link");
                        return o.rel = "stylesheet", o.crossOrigin = null, o.href = e, o.onerror = () => {
                            let c = document.createComment("");
                            o.replaceWith(c), $(t, e, n, void 0, () => c.replaceWith(r()))
                        }, o.onload = () => {
                            n.resolve()
                        }, o
                    };
                    document.head.appendChild(r())
                }
            else if (I(e, ".js")) {
                let o = document.querySelectorAll('script[src="'.concat(e, '"],script[src^="').concat(e, '?"],script[src="').concat(r, '"],script[src^="').concat(r, '?"]'));
                if (o.length > 0)
                    for (let r of Array.from(o)) r.addEventListener("error", () => {
                        r.remove(), $(t, e, n)
                    }, {
                        once: !0
                    });
                else {
                    let r = document.createElement("script");
                    r.crossOrigin = null, r.src = e, r.onerror = () => {
                        r.remove(), $(t, e, n)
                    }, document.head.appendChild(r)
                }
            } else throw Error("can't infer type of chunk from URL ".concat(e))
        }
        return n.loadingStarted = !0, n.promise
    }
    t = {
        async registerChunk(t, e) {
            let n;
            if (null != t && (n = function(t) {
                    if ("string" == typeof t) return t;
                    let e = decodeURIComponent(t.src.replace(/[?#].*$/, ""));
                    return e.startsWith(A) ? e.slice(A.length) : e
                }(t), Z("string" == typeof t ? L(t) : t.src).resolve()), null != e) {
                for (let t of e.otherChunks) Z(L("string" == typeof t ? t : t.path));
                if (await Promise.all(e.otherChunks.map(t => {
                        var e;
                        return e = n, M(o.Runtime, e, t)
                    })), e.runtimeModuleIds.length > 0)
                    for (let t of e.runtimeModuleIds) ! function(t, e) {
                        let n = D.get(e);
                        if (n) {
                            if (n.error) throw n.error;
                            return
                        }
                        W(e, o.Runtime, t)
                    }(n, t)
            }
        },
        loadChunkCached: (t, e) => G(t, e)
    }, globalThis.TURBOPACK = {
        push: X
    }, n.forEach(X)
})();

//# debugId=ebee9039-5ac4-2d2a-34c6-1c896a55496c
//# sourceMappingURL=3c67sgatwfjl0.js.map