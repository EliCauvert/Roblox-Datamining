var gm = Object.defineProperty;
var vm = (re, oe, f) => oe in re ? gm(re, oe, {
    enumerable: !0,
    configurable: !0,
    writable: !0,
    value: f
}) : re[oe] = f;
var gr = (re, oe, f) => vm(re, typeof oe != "symbol" ? oe + "" : oe, f);
var createWebClient = (() => {
    var re = globalThis.document?.currentScript?.src;
    return async function(oe = {}) {
        var f = oe,
            je = !!globalThis.window,
            fe = !!globalThis.WorkerGlobalScope,
            vr = globalThis.process?.versions?.node && globalThis.process?.type != "renderer",
            br = !je && !vr && !fe,
            E = fe && globalThis.name == "em-pthread",
            Ue = [],
            Ge = "./this.program",
            Ve = (e, r) => {
                throw r
            };
        fe && (re = self.location.href);
        var Pe = "";

        function Xe(e) {
            return f.locateFile ? f.locateFile(e, Pe) : Pe + e
        }
        var fn, hr;
        if (je || fe) {
            try {
                Pe = new URL(".", re).href
            } catch {}
            fe && (hr = e => {
                var r = new XMLHttpRequest;
                return r.open("GET", e, !1), r.responseType = "arraybuffer", r.send(null), new Uint8Array(r.response)
            }), fn = async e => {
                var r = await fetch(e, {
                    credentials: "same-origin"
                });
                if (r.ok) return r.arrayBuffer();
                throw new Error(r.status + " : " + r.url)
            }
        }
        var Ke = console.log.bind(console),
            X = console.error.bind(console),
            dn, xe, Ee = !1,
            Fe;

        function Xi(e, r) {
            e || Ie(r)
        }
        var bm = e => e.startsWith("file://"),
            _n;
        if (E) {
            var wr = !1;
            self.onunhandledrejection = r => {
                throw r.reason || r
            };
            async function e(r) {
                try {
                    var n = r.data,
                        t = n.cmd;
                    if (t == 1) {
                        let a = [];
                        self.onmessage = i => a.push(i), _n = () => {
                            postMessage({
                                cmd: 3
                            });
                            for (let i of a) e(i);
                            self.onmessage = e
                        };
                        for (const i of n.handlers)(!f[i] || f[i].proxy) && (f[i] = (...o) => {
                            postMessage({
                                cmd: 9,
                                handler: i,
                                args: o
                            })
                        }, i == "print" && (Ke = f[i]), i == "printErr" && (X = f[i]));
                        De = n.wasmMemory, mn(), xe = n.wasmModule, bn(), $i(), _n()
                    } else if (t == 2) {
                        io(n.pthread_ptr), on(n.pthread_ptr, 0, 0, 1, 0, 0), U.threadInitTLS(), Er(n.pthread_ptr), wr || (Ci(), wr = !0);
                        try {
                            await oo(n.start_routine, n.arg)
                        } catch (a) {
                            if (a != "unwind") throw a
                        }
                    } else t == 4 ? wr && nr() : t && (X(`worker: received unknown command ${t}`), X(n))
                } catch (a) {
                    throw xr && Li(), a
                }
            }
            self.onmessage = e
        }
        var xr = !1;

        function mn() {
            var e = De.buffer;
            L = new Int8Array(e), ne = new Int16Array(e), f.HEAPU8 = W = new Uint8Array(e), ke = new Uint16Array(e), f.HEAP32 = _ = new Int32Array(e), f.HEAPU32 = m = new Uint32Array(e), ee = new Float32Array(e), N = new Float64Array(e), Z = new BigInt64Array(e), Mn = new BigUint64Array(e)
        }

        function Ki() {
            if (!E) {
                if (f.wasmMemory) De = f.wasmMemory;
                else {
                    var e = f.INITIAL_MEMORY || 4294967296;
                    De = new WebAssembly.Memory({
                        initial: e / 65536,
                        maximum: e / 65536,
                        shared: !0
                    })
                }
                mn()
            }
        }

        function Yi() {
            var e = f.preRun;
            e && (typeof e == "function" && (e = [e]), yr.push(...e)), to(yr)
        }
        async function pn() {
            xr = !0, !E && await pe.__wasm_call_ctors()
        }

        function hm() {}

        function Ie(e) {
            e = `Aborted(${e})`, X(e), Ee = !0, e += ". Build with -sASSERTIONS for more info.", xr && Pi();
            var r = new WebAssembly.RuntimeError(e);
            throw r
        }
        var gn;

        function Qi() {
            return Xe("WebClient.wasm")
        }

        function Zi(e) {
            if (hr) return hr(e);
            throw "both async and sync fetching of the wasm failed"
        }
        async function eo(e) {
            if (!dn) try {
                var r = await fn(e);
                return new Uint8Array(r)
            } catch {}
            return Zi(e)
        }
        async function ro(e, r) {
            try {
                var n = await eo(e),
                    t = await WebAssembly.instantiate(n, r);
                return t
            } catch (a) {
                X(`failed to asynchronously prepare wasm: ${a}`), Ie(a)
            }
        }
        async function no(e, r, n) {
            if (!e) try {
                var t = fetch(r, {
                        credentials: "same-origin"
                    }),
                    a = await WebAssembly.instantiateStreaming(t, n);
                return a
            } catch (i) {
                X(`wasm streaming compile failed: ${i}`), X("falling back to ArrayBuffer instantiation")
            }
            return ro(r, n)
        }

        function vn() {
            dm(), We.__instrumented || (We.__instrumented = !0, J.instrumentWasmImports(We));
            var e = {
                env: We,
                wasi_snapshot_preview1: We
            };
            return e
        }
        async function bn() {
            function e(s, c) {
                return pe = s.exports, pe = J.instrumentWasmExports(pe), pe = _m(pe), so(pe._emscripten_tls_init), fm(pe), xe = c, pe
            }

            function r(s) {
                return e(s.instance, s.module)
            }
            var n = vn(),
                t = f.instantiateWasm;
            if (t) return new Promise(s => {
                t(n, (c, u) => s(e(c, u)))
            });
            if (E) {
                var a = new WebAssembly.Instance(xe, vn());
                return e(a, xe)
            }
            gn ?? (gn = Qi());
            var i = await no(dn, gn, n),
                o = r(i);
            return o
        }
        class hn {
            constructor(r) {
                gr(this, "name", "ExitStatus");
                this.message = `Program terminated with exit(${r})`, this.status = r
            }
        }
        var wn = e => {
                e.terminate(), e.onmessage = r => {}
            },
            xn = e => {
                var r = U.pthreads[e];
                U.returnWorkerToPool(r)
            },
            to = e => {
                for (; e.length > 0;) e.shift()(f)
            },
            yr = [],
            ao = e => yr.push(e),
            yn = e => {
                var r = U.getNewWorker();
                if (!r) return 6;
                U.pthreads[e.pthread_ptr] = r, r.pthread_ptr = e.pthread_ptr;
                var n = {
                    cmd: 2,
                    start_routine: e.startRoutine,
                    arg: e.arg,
                    pthread_ptr: e.pthread_ptr
                };
                return r.postMessage(n, e.transferList), 0
            },
            Ne = 0,
            Cr = () => Ne > 0,
            Ye = () => Hi(),
            Qe = e => Ni(e),
            Ze = e => Ji(e),
            N, Z, R = (e, r, n, ...t) => {
                var a = 8 * t.length * 2,
                    i = Ye(),
                    o = Ze(a),
                    s = o >>> 3;
                for (var c of t) typeof c == "bigint" ? (Z[s++ >>> 0] = 1n, Z[s++ >>> 0] = c) : (Z[s++ >>> 0] = 0n, N[s++ >>> 0] = c);
                var u = ji(e, r, a, o, n);
                return Qe(i), u
            };

        function Sr(e) {
            if (E) return R(0, 0, 1, e);
            Fe = e, Cr() || (U.terminateAllThreads(), Ee = !0), Ve(e, new hn(e))
        }

        function Cn(e) {
            if (E) return R(1, 0, 0, e);
            kr(e)
        }
        var Sn = (e, r) => {
                if (Fe = e, E) throw Cn(e), "unwind";
                Sr(e)
            },
            kr = Sn,
            kn = !Atomics.waitAsync || globalThis.navigator?.userAgent && Number((navigator.userAgent.match(/Chrom(e|ium)\/([0-9]+)\./) || [])[2]) < 91,
            _, U = {
                unusedWorkers: [],
                tlsInitFunctions: [],
                pthreads: {},
                init() {
                    E || U.initMainThread()
                },
                initMainThread() {
                    for (var e = 8; e--;) U.allocateUnusedWorker();
                    ao(async () => {
                        var r = U.loadWasmModuleToAllWorkers()
                    })
                },
                terminateAllThreads: () => {
                    for (var e of Object.values(U.pthreads)) wn(e);
                    for (var e of U.unusedWorkers) wn(e);
                    U.unusedWorkers = [], U.pthreads = {}
                },
                clearMailboxAwait: e => {
                    kn || Atomics.notify(_, e >>> 2)
                },
                terminateRuntime: () => {
                    U.terminateAllThreads();
                    var e = he();
                    Ri(0, 0, 0, 1), U.clearMailboxAwait(e)
                },
                returnWorkerToPool: e => {
                    var r = e.pthread_ptr;
                    delete U.pthreads[r], e.pthread_ptr = 0, U.clearMailboxAwait(r), Promise.resolve(Ui(r)).then(() => {
                        U.unusedWorkers.push(e)
                    }).catch(rr)
                },
                threadInitTLS() {
                    U.tlsInitFunctions.forEach(e => e())
                },
                loadWasmModuleToWorker: e => new Promise(r => {
                    e.onmessage = i => {
                        var o = i.data,
                            s = o.cmd;
                        if (o.targetThread && o.targetThread != he()) {
                            var c = U.pthreads[o.targetThread];
                            c?.postMessage(o);
                            return
                        }
                        if (o === "setimmediate" || o === "_si") {
                            e.postMessage(o);
                            return
                        }
                        switch (s) {
                            case 4:
                                nr();
                                break;
                            case 5:
                                yn(o);
                                break;
                            case 6:
                                ge(() => xn(o.thread));
                                break;
                            case 3:
                                r(e);
                                break;
                            case 9:
                                f[o.handler](...o.args);
                                break;
                            default:
                                s && X(`worker sent an unknown command ${s}`)
                        }
                    }, e.onerror = i => {
                        var o = "worker sent an error!";
                        throw X(`${o} ${i.filename}:${i.lineno}: ${i.message}`), i
                    };
                    var n = [],
                        t = ["print"];
                    for (var a of t) f.propertyIsEnumerable(a) && n.push(a);
                    e.postMessage({
                        cmd: 1,
                        handlers: n,
                        wasmMemory: De,
                        wasmModule: xe
                    })
                }),
                async loadWasmModuleToAllWorkers() {
                    if (E) return;
                    let e = Promise.all(U.unusedWorkers.map(U.loadWasmModuleToWorker));
                    f.pthreadPoolReady = e
                },
                allocateUnusedWorker() {
                    var e, r = re;
                    return f.mainScriptUrlOrBlob && (r = f.mainScriptUrlOrBlob, typeof r != "string" && (r = URL.createObjectURL(r))), e = new Worker(r, {
                        name: "em-pthread"
                    }), U.unusedWorkers.push(e), e
                },
                getNewWorker() {
                    if (U.unusedWorkers.length == 0) {
                        var e = U.allocateUnusedWorker();
                        U.loadWasmModuleToWorker(e)
                    }
                    return U.unusedWorkers.pop()
                }
            },
            m;

        function io(e) {
            var r = m[e + 48 >>> 2 >>> 0],
                n = m[e + 52 >>> 2 >>> 0],
                t = r - n;
            ki(r, t), Qe(r)
        }
        var Tr = [],
            $ = e => {
                var r = Tr[e];
                return r || (Tr[e] = r = zi.get(e), J.isAsyncExport(r) && (Tr[e] = r = J.makeAsyncFunction(r))), r
            },
            oo = async (e, r) => {
                Ne = 0;
                var n = WebAssembly.promising($(e))(r);

                function t(a) {
                    if (Cr()) {
                        Fe = a;
                        return
                    }
                    sn(a)
                }
                n = await n, t(n)
            }, so = e => U.tlsInitFunctions.push(e), De, co = 9007199254740992, lo = -9007199254740992, Q = e => e < lo || e > co ? NaN : Number(e), Tn = globalThis.TextDecoder && new TextDecoder, Bn = (e, r, n, t) => {
                var a = r + n;
                if (t) return a;
                for (; e[r] && !(r >= a);) ++r;
                return r
            }, uo = (e, r = 0, n, t) => {
                r >>>= 0;
                var a = Bn(e, r, n, t);
                if (a - r > 16 && e.buffer && Tn) return Tn.decode(e.buffer instanceof ArrayBuffer ? e.subarray(r, a) : e.slice(r, a));
                for (var i = ""; r < a;) {
                    var o = e[r++];
                    if (!(o & 128)) {
                        i += String.fromCharCode(o);
                        continue
                    }
                    var s = e[r++] & 63;
                    if ((o & 224) == 192) {
                        i += String.fromCharCode((o & 31) << 6 | s);
                        continue
                    }
                    var c = e[r++] & 63;
                    if ((o & 240) == 224 ? o = (o & 15) << 12 | s << 6 | c : o = (o & 7) << 18 | s << 12 | c << 6 | e[r++] & 63, o < 65536) i += String.fromCharCode(o);
                    else {
                        var u = o - 65536;
                        i += String.fromCharCode(55296 | u >> 10, 56320 | u & 1023)
                    }
                }
                return i
            }, W, T = (e, r, n) => (e >>>= 0, e ? uo(W, e, r, n) : "");

        function fo(e, r, n, t) {
            return e >>>= 0, r >>>= 0, t >>>= 0, Ie(`Assertion failed: ${T(e)}, at: ` + [r ? T(r) : "unknown filename", n, t ? T(t) : "unknown function"])
        }

        function _o(e, r) {
            return e >>>= 0, $(e)(r)
        }

        function An(e, r, n, t) {
            return E ? R(2, 0, 1, e, r, n, t) : En(e, r, n, t)
        }
        var mo = () => !!globalThis.SharedArrayBuffer;

        function En(e, r, n, t) {
            if (e >>>= 0, r >>>= 0, n >>>= 0, t >>>= 0, !mo()) return 6;
            var a = [],
                i = 0;
            if (E && (!a.length || i)) return An(e, r, n, t);
            if (i) return i;
            var o = {
                startRoutine: n,
                pthread_ptr: e,
                arg: t,
                transferList: a
            };
            return E ? (o.cmd = 5, postMessage(o, a), 0) : yn(o)
        }

        function Fn() {
            return E ? R(3, 0, 1) : 0
        }

        function In() {
            return E ? R(4, 0, 1) : 0
        }

        function Dn() {
            return E ? R(5, 0, 1) : 0
        }

        function On() {
            return E ? R(6, 0, 1) : 0
        }
        var po = () => Ie(""),
            se = e => {
                e >>>= 0;
                for (var r = "";;) {
                    var n = W[e++ >>> 0];
                    if (!n) return r;
                    r += String.fromCharCode(n)
                }
            },
            Oe = {},
            Me = {},
            er = {};
        class go extends Error {
            constructor(r) {
                super(r), this.name = "BindingError"
            }
        }
        var ce = e => {
            throw new go(e)
        };

        function vo(e, r, n = {}) {
            var t = r.name;
            if (e || ce(`type "${t}" must have a positive integer typeid pointer`), Me.hasOwnProperty(e)) {
                if (n.ignoreDuplicateRegistrations) return;
                ce(`Cannot register type '${t}' twice`)
            }
            if (Me[e] = r, delete er[e], Oe.hasOwnProperty(e)) {
                var a = Oe[e];
                delete Oe[e], a.forEach(i => i())
            }
        }

        function de(e, r, n = {}) {
            return vo(e, r, n)
        }
        var L, ne, ke, Mn, Rn = (e, r, n) => {
                switch (r) {
                    case 1:
                        return n ? t => L[t >>> 0] : t => W[t >>> 0];
                    case 2:
                        return n ? t => ne[t >>> 1 >>> 0] : t => ke[t >>> 1 >>> 0];
                    case 4:
                        return n ? t => _[t >>> 2 >>> 0] : t => m[t >>> 2 >>> 0];
                    case 8:
                        return n ? t => Z[t >>> 3 >>> 0] : t => Mn[t >>> 3 >>> 0];
                    default:
                        throw new TypeError(`invalid integer width (${r}): ${e}`)
                }
            },
            bo = function(e, r, n, t, a) {
                e >>>= 0, r >>>= 0, n >>>= 0, r = se(r);
                const i = t === 0n;
                let o = s => s;
                if (i) {
                    const s = n * 8;
                    o = c => BigInt.asUintN(s, c), a = o(a)
                }
                de(e, {
                    name: r,
                    fromWireType: o,
                    toWireType: (s, c) => (typeof c == "number" && (c = BigInt(c)), c),
                    readValueFromPointer: Rn(r, n, !i),
                    destructorFunction: null
                })
            };

        function ho(e, r, n, t) {
            e >>>= 0, r >>>= 0, r = se(r), de(e, {
                name: r,
                fromWireType: function(a) {
                    return !!a
                },
                toWireType: function(a, i) {
                    return i ? n : t
                },
                readValueFromPointer: function(a) {
                    return this.fromWireType(W[a >>> 0])
                },
                destructorFunction: null
            })
        }
        var Ln = [],
            Te = [0, 1, , 1, null, 1, !0, 1, !1, 1],
            Wn = [];

        function wo(e) {
            if (e >>>= 0, e > 9 && --Te[e + 1] === 0) {
                var r = Te[e];
                Te[e] = void 0;
                var n = Wn[e];
                n && (Wn[e] = void 0, n(r)), Ln.push(e)
            }
        }
        var jn = {
            toValue: e => (e || ce(`Cannot use deleted val. handle = ${e}`), Te[e]),
            toHandle: e => {
                switch (e) {
                    case void 0:
                        return 2;
                    case null:
                        return 4;
                    case !0:
                        return 6;
                    case !1:
                        return 8;
                    default: {
                        const r = Ln.pop() || Te.length;
                        return Te[r] = e, Te[r + 1] = 1, r
                    }
                }
            }
        };

        function Br(e) {
            return this.fromWireType(m[e >>> 2 >>> 0])
        }
        var xo = {
            name: "emscripten::val",
            fromWireType: e => {
                var r = jn.toValue(e);
                return wo(e), r
            },
            toWireType: (e, r) => jn.toHandle(r),
            readValueFromPointer: Br,
            destructorFunction: null
        };

        function yo(e) {
            return e >>>= 0, de(e, xo)
        }
        var ee, Co = (e, r) => {
                switch (r) {
                    case 4:
                        return function(n) {
                            return this.fromWireType(ee[n >>> 2 >>> 0])
                        };
                    case 8:
                        return function(n) {
                            return this.fromWireType(N[n >>> 3 >>> 0])
                        };
                    default:
                        throw new TypeError(`invalid float width (${r}): ${e}`)
                }
            },
            So = function(e, r, n) {
                e >>>= 0, r >>>= 0, n >>>= 0, r = se(r), de(e, {
                    name: r,
                    fromWireType: t => t,
                    toWireType: (t, a) => a,
                    readValueFromPointer: Co(r, n),
                    destructorFunction: null
                })
            },
            ko = (e, r) => Object.defineProperty(r, "name", {
                value: e
            }),
            To = e => {
                for (; e.length;) {
                    var r = e.pop(),
                        n = e.pop();
                    n(r)
                }
            };

        function Bo(e) {
            for (var r = 1; r < e.length; ++r)
                if (e[r] !== null && e[r].destructorFunction === void 0) return !0;
            return !1
        }

        function Ao(e, r, n, t, a, i) {
            var o = r.length;
            o < 2 && ce("argTypes array size mismatch! Must at least get return value and receiver (this) types!");
            var s = r[1] !== null && n !== null,
                c = Bo(r),
                u = !r[0].isVoid,
                d = o - 2,
                p = new Array(d),
                x = [],
                B = [],
                k = function(...I) {
                    B.length = 0;
                    var b;
                    x.length = s ? 2 : 1, x[0] = a, s && (b = r[1].toWireType(B, this), x[1] = b);
                    for (var D = 0; D < d; ++D) p[D] = r[D + 2].toWireType(B, I[D]), x.push(p[D]);
                    var C = t(...x);

                    function O(z) {
                        if (c) To(B);
                        else
                            for (var G = s ? 1 : 2; G < r.length; G++) {
                                var M = G === 1 ? b : p[G - 2];
                                r[G].destructorFunction !== null && r[G].destructorFunction(M)
                            }
                        if (u) return r[0].fromWireType(z)
                    }
                    return i ? C.then(O) : O(C)
                };
            return ko(e, k)
        }
        var Eo = (e, r, n) => {
                if (e[r].overloadTable === void 0) {
                    var t = e[r];
                    e[r] = function(...a) {
                        return e[r].overloadTable.hasOwnProperty(a.length) || ce(`Function '${n}' called with an invalid number of arguments (${a.length}) - expects one of (${e[r].overloadTable})!`), e[r].overloadTable[a.length].apply(this, a)
                    }, e[r].overloadTable = [], e[r].overloadTable[t.argCount] = t
                }
            },
            Fo = (e, r, n) => {
                f.hasOwnProperty(e) ? ((n === void 0 || f[e].overloadTable !== void 0 && f[e].overloadTable[n] !== void 0) && ce(`Cannot register public name '${e}' twice`), Eo(f, e, e), f[e].overloadTable.hasOwnProperty(n) && ce(`Cannot register multiple overloads of a function with the same number of arguments (${n})!`), f[e].overloadTable[n] = r) : (f[e] = r, f[e].argCount = n)
            },
            Io = (e, r) => {
                for (var n = [], t = 0; t < e; t++) n.push(m[r + t * 4 >>> 2 >>> 0]);
                return n
            };
        class Do extends Error {
            constructor(r) {
                super(r), this.name = "InternalError"
            }
        }
        var Un = e => {
                throw new Do(e)
            },
            Oo = (e, r, n) => {
                f.hasOwnProperty(e) || Un("Replacing nonexistent public symbol"), f[e].overloadTable !== void 0 && n !== void 0 ? f[e].overloadTable[n] = r : (f[e] = r, f[e].argCount = n)
            },
            Mo = (e, r, n = [], t = !1) => {
                var a = $(r);
                t && (a = WebAssembly.promising(a));
                var i = a(...n);

                function o(s) {
                    return e[0] == "p" ? s >>> 0 : s
                }
                return t ? i.then(o) : o(i)
            },
            Ro = (e, r, n = !1) => (...t) => Mo(e, r, t, n),
            Lo = (e, r, n = !1) => {
                e = se(e);

                function t() {
                    if (e.includes("p")) return Ro(e, r, n);
                    var i = $(r);
                    return n && (i = WebAssembly.promising(i)), i
                }
                var a = t();
                return typeof a != "function" && ce(`unknown function pointer with signature ${e}: ${r}`), a
            };
        class Wo extends Error {}
        var jo = e => {
                var r = yi(e),
                    n = se(r);
                return Y(r), n
            },
            Uo = (e, r) => {
                var n = [],
                    t = {};

                function a(i) {
                    if (!t[i] && !Me[i]) {
                        if (er[i]) {
                            er[i].forEach(a);
                            return
                        }
                        n.push(i), t[i] = !0
                    }
                }
                throw r.forEach(a), new Wo(`${e}: ` + n.map(jo).join([", "]))
            },
            Go = (e, r, n) => {
                e.forEach(s => er[s] = r);

                function t(s) {
                    var c = n(s);
                    c.length !== e.length && Un("Mismatched type converter count");
                    for (var u = 0; u < e.length; ++u) de(e[u], c[u])
                }
                var a = new Array(r.length),
                    i = [],
                    o = 0;
                for (let [s, c] of r.entries()) Me.hasOwnProperty(c) ? a[s] = Me[c] : (i.push(c), Oe.hasOwnProperty(c) || (Oe[c] = []), Oe[c].push(() => {
                    a[s] = Me[c], ++o, o === i.length && t(a)
                }));
                i.length === 0 && t(a)
            },
            Vo = e => {
                e = e.trim();
                const r = e.indexOf("(");
                return r === -1 ? e : e.slice(0, r)
            };

        function Po(e, r, n, t, a, i, o, s) {
            e >>>= 0, n >>>= 0, t >>>= 0, a >>>= 0, i >>>= 0;
            var c = Io(r, n);
            e = se(e), e = Vo(e), a = Lo(t, a, o), Fo(e, function() {
                Uo(`Cannot call ${e} due to unbound types`, c)
            }, r - 1), Go([], c, u => {
                var d = [u[0], null].concat(u.slice(1));
                return Oo(e, Ao(e, d, null, a, i, o), r - 1), []
            })
        }
        var No = function(e, r, n, t, a) {
            e >>>= 0, r >>>= 0, n >>>= 0, r = se(r);
            const i = t === 0;
            let o = c => c;
            if (i) {
                var s = 32 - 8 * n;
                o = c => c << s >>> s, a = o(a)
            }
            de(e, {
                name: r,
                fromWireType: o,
                toWireType: (c, u) => u,
                readValueFromPointer: Rn(r, n, t !== 0),
                destructorFunction: null
            })
        };

        function Jo(e, r, n) {
            e >>>= 0, n >>>= 0;
            var t = [Int8Array, Uint8Array, Int16Array, Uint16Array, Int32Array, Uint32Array, Float32Array, Float64Array, BigInt64Array, BigUint64Array],
                a = t[r];

            function i(o) {
                var s = m[o >>> 2 >>> 0],
                    c = m[o + 4 >>> 2 >>> 0];
                return new a(L.buffer, c, s)
            }
            n = se(n), de(e, {
                name: n,
                fromWireType: i,
                readValueFromPointer: i
            }, {
                ignoreDuplicateRegistrations: !0
            })
        }
        var Ho = (e, r, n, t) => {
                if (n >>>= 0, !(t > 0)) return 0;
                for (var a = n, i = n + t - 1, o = 0; o < e.length; ++o) {
                    var s = e.codePointAt(o);
                    if (s <= 127) {
                        if (n >= i) break;
                        r[n++ >>> 0] = s
                    } else if (s <= 2047) {
                        if (n + 1 >= i) break;
                        r[n++ >>> 0] = 192 | s >> 6, r[n++ >>> 0] = 128 | s & 63
                    } else if (s <= 65535) {
                        if (n + 2 >= i) break;
                        r[n++ >>> 0] = 224 | s >> 12, r[n++ >>> 0] = 128 | s >> 6 & 63, r[n++ >>> 0] = 128 | s & 63
                    } else {
                        if (n + 3 >= i) break;
                        r[n++ >>> 0] = 240 | s >> 18, r[n++ >>> 0] = 128 | s >> 12 & 63, r[n++ >>> 0] = 128 | s >> 6 & 63, r[n++ >>> 0] = 128 | s & 63, o++
                    }
                }
                return r[n >>> 0] = 0, n - a
            },
            P = (e, r, n) => Ho(e, W, r, n),
            te = e => {
                for (var r = 0, n = 0; n < e.length; ++n) {
                    var t = e.charCodeAt(n);
                    t <= 127 ? r++ : t <= 2047 ? r += 2 : t >= 55296 && t <= 57343 ? (r += 4, ++n) : r += 3
                }
                return r
            };

        function zo(e, r) {
            e >>>= 0, r >>>= 0, r = se(r);
            var n = !0;
            de(e, {
                name: r,
                fromWireType(t) {
                    var a = m[t >>> 2 >>> 0],
                        i = t + 4,
                        o;
                    if (n) o = T(i, a, !0);
                    else {
                        o = "";
                        for (var s = 0; s < a; ++s) o += String.fromCharCode(W[i + s >>> 0])
                    }
                    return Y(t), o
                },
                toWireType(t, a) {
                    a instanceof ArrayBuffer && (a = new Uint8Array(a));
                    var i, o = typeof a == "string";
                    o || ArrayBuffer.isView(a) && a.BYTES_PER_ELEMENT == 1 || ce("Cannot pass non-string to std::string"), n && o ? i = te(a) : i = a.length;
                    var s = H(4 + i + 1),
                        c = s + 4;
                    if (m[s >>> 2 >>> 0] = i, o)
                        if (n) P(a, c, i + 1);
                        else
                            for (var u = 0; u < i; ++u) {
                                var d = a.charCodeAt(u);
                                d > 255 && (Y(s), ce("String has UTF-16 code units that do not fit in 8 bits")), W[c + u >>> 0] = d
                            } else W.set(a, c >>> 0);
                    return t !== null && t.push(Y, s), s
                },
                readValueFromPointer: Br,
                destructorFunction(t) {
                    Y(t)
                }
            })
        }
        var Gn = globalThis.TextDecoder ? new TextDecoder("utf-16le") : void 0,
            $o = (e, r, n) => {
                var t = e >>> 1,
                    a = Bn(ke, t, r / 2, n);
                if (a - t > 16 && Gn) return Gn.decode(ke.slice(t, a));
                for (var i = "", o = t; o < a; ++o) {
                    var s = ke[o >>> 0];
                    i += String.fromCharCode(s)
                }
                return i
            },
            qo = (e, r, n = 2147483647) => {
                if (n < 2) return 0;
                n -= 2;
                for (var t = r, a = n < e.length * 2 ? n / 2 : e.length, i = 0; i < a; ++i) {
                    var o = e.charCodeAt(i);
                    ne[r >>> 1 >>> 0] = o, r += 2
                }
                return ne[r >>> 1 >>> 0] = 0, r - t
            },
            Xo = e => e.length * 2,
            Ko = (e, r, n) => {
                for (var t = "", a = e >>> 2, i = 0; !(i >= r / 4); i++) {
                    var o = m[a + i >>> 0];
                    if (!o && !n) break;
                    t += String.fromCodePoint(o)
                }
                return t
            },
            Yo = (e, r, n = 2147483647) => {
                if (r >>>= 0, n < 4) return 0;
                for (var t = r, a = t + n - 4, i = 0; i < e.length; ++i) {
                    var o = e.codePointAt(i);
                    if (o > 65535 && i++, _[r >>> 2 >>> 0] = o, r += 4, r + 4 > a) break
                }
                return _[r >>> 2 >>> 0] = 0, r - t
            },
            Qo = e => {
                for (var r = 0, n = 0; n < e.length; ++n) {
                    var t = e.codePointAt(n);
                    t > 65535 && n++, r += 4
                }
                return r
            };

        function Zo(e, r, n) {
            e >>>= 0, r >>>= 0, n >>>= 0, n = se(n);
            var t, a, i;
            r === 2 ? (t = $o, a = qo, i = Xo) : (t = Ko, a = Yo, i = Qo), de(e, {
                name: n,
                fromWireType: o => {
                    var s = m[o >>> 2 >>> 0],
                        c = t(o + 4, s * r, !0);
                    return Y(o), c
                },
                toWireType: (o, s) => {
                    typeof s != "string" && ce(`Cannot pass non-string to C++ string type ${n}`);
                    var c = i(s),
                        u = H(4 + c + r);
                    return m[u >>> 2 >>> 0] = c / r, a(s, u + 4, c + r), o !== null && o.push(Y, u), u
                },
                readValueFromPointer: Br,
                destructorFunction(o) {
                    Y(o)
                }
            })
        }
        var es = function(e, r) {
            e >>>= 0, r >>>= 0, r = se(r), de(e, {
                isVoid: !0,
                name: r,
                fromWireType: () => {},
                toWireType: (n, t) => {}
            })
        };

        function rs(e, r, n) {
            r >>>= 0, n >>>= 0;
            var t = ae.xhrs.get(e).getAllResponseHeaders();
            return P(t, r, n) + 1
        }

        function ns(e) {
            return te(ae.xhrs.get(e).getAllResponseHeaders())
        }

        function ts(e) {
            e >>>= 0;
            var r = !je;
            try {
                Atomics.wait(_, 0, 0, 0), r = !0
            } catch {}
            on(e, !fe, 1, r, 262144, !1), U.threadInitTLS()
        }
        var Ar = () => new Error().stack.toString(),
            as = e => {
                var r = Ar(),
                    n = r.split(`
`);
                r = "";
                var t = new RegExp("\\s*(.*?)@(.*?):([0-9]+):([0-9]+)"),
                    a = new RegExp("\\s*at (.*?) \\((.*):(.*):(.*)\\)");
                for (var i of n) {
                    var o = "",
                        s = "",
                        c = 0,
                        u = 0,
                        d = a.exec(i);
                    if (d?.length == 5) o = d[1], s = d[2], c = d[3], u = d[4];
                    else if (d = t.exec(i), d?.length >= 4) o = d[1], s = d[2], c = d[3], u = d[4] | 0;
                    else {
                        r += i + `
`;
                        continue
                    }
                    if (o == "_emscripten_log" || o == "_emscripten_get_callstack") {
                        r = "";
                        continue
                    }
                    e & 24 && (e & 64 && (s = s.substring(s.replace(/\\/g, "/").lastIndexOf("/") + 1)), r += `    at ${o} (${s}:${c}:${u})
`)
                }
                return r = r.replace(/\s+$/, ""), r
            };

        function is(e, r) {
            r >>>= 0, r = T(r), e & 24 && (r = r.replace(/\s+$/, ""), r += (r.length > 0 ? `
` : "") + as(e)), e & 1 ? e & 4 ? console.error(r) : e & 2 ? console.warn(r) : e & 512 ? console.info(r) : e & 256 ? console.debug(r) : console.log(r) : e & 6 ? X(r) : Ke(r)
        }
        var rr = e => {
                if (e instanceof hn || e == "unwind") return Fe;
                Ve(1, e)
            },
            Vn = () => {
                if (!Cr()) try {
                    if (E) {
                        he() && sn(Fe);
                        return
                    }
                    kr(Fe)
                } catch (e) {
                    rr(e)
                }
            },
            ge = e => {
                if (!Ee) try {
                    return e()
                } catch (r) {
                    rr(r)
                } finally {
                    Vn()
                }
            };

        function Er(e) {
            if (e >>>= 0, !kn) {
                var r = Atomics.waitAsync(_, e >>> 2, e);
                r.value.then(nr);
                var n = e + 112;
                Atomics.store(_, n >>> 2, 1)
            }
        }
        var nr = () => {
            var e = he();
            e && ge(() => {
                Er(e), Gi()
            })
        };

        function os(e, r) {
            if (e >>>= 0, r >>>= 0, e == r) setTimeout(nr);
            else if (E) postMessage({
                targetThread: e,
                cmd: 4
            });
            else {
                var n = U.pthreads[e];
                if (!n) return;
                n.postMessage({
                    cmd: 4
                })
            }
        }
        var Fr = [];

        function ss(e, r, n, t, a, i, o) {
            r >>>= 0, n >>>= 0, a >>>= 0, i >>>= 0, o >>>= 0, Fr.length = 0;
            for (var s = a >>> 3, c = a + t >>> 3; s < c;) {
                var u;
                Z[s++ >>> 0] ? u = Z[s++ >>> 0] : u = N[s++ >>> 0], Fr.push(u)
            }
            var d = r ? Gr[r] : F_[e];
            U.currentProxiedOperationCallerThread = n;
            var p = d(...Fr);
            if (U.currentProxiedOperationCallerThread = 0, i) {
                p.then(x => Wi(i, o, x));
                return
            }
            return p
        }
        var cs = () => {
            Ne = 0
        };

        function ls(e) {
            e >>>= 0, E ? postMessage({
                cmd: 6,
                thread: e
            }) : xn(e)
        }

        function us(e) {
            e >>>= 0
        }

        function fs(e, r) {
            e = Q(e), r >>>= 0;
            var n = new Date(e * 1e3);
            if (isNaN(n.getTime())) return 1;
            _[r >>> 2 >>> 0] = n.getUTCSeconds(), _[r + 4 >>> 2 >>> 0] = n.getUTCMinutes(), _[r + 8 >>> 2 >>> 0] = n.getUTCHours(), _[r + 12 >>> 2 >>> 0] = n.getUTCDate(), _[r + 16 >>> 2 >>> 0] = n.getUTCMonth(), _[r + 20 >>> 2 >>> 0] = n.getUTCFullYear() - 1900, _[r + 24 >>> 2 >>> 0] = n.getUTCDay();
            var t = Date.UTC(n.getUTCFullYear(), 0, 1, 0, 0, 0, 0),
                a = (n.getTime() - t) / (1e3 * 60 * 60 * 24) | 0;
            return _[r + 28 >>> 2 >>> 0] = a, 0
        }
        var ds = e => e % 4 === 0 && (e % 100 !== 0 || e % 400 === 0),
            _s = [0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335],
            ms = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334],
            Pn = e => {
                var r = ds(e.getFullYear()),
                    n = r ? _s : ms,
                    t = n[e.getMonth()] + e.getDate() - 1;
                return t
            };

        function ps(e, r) {
            e = Q(e), r >>>= 0;
            var n = new Date(e * 1e3);
            if (isNaN(n.getTime())) return 1;
            _[r >>> 2 >>> 0] = n.getSeconds(), _[r + 4 >>> 2 >>> 0] = n.getMinutes(), _[r + 8 >>> 2 >>> 0] = n.getHours(), _[r + 12 >>> 2 >>> 0] = n.getDate(), _[r + 16 >>> 2 >>> 0] = n.getMonth(), _[r + 20 >>> 2 >>> 0] = n.getFullYear() - 1900, _[r + 24 >>> 2 >>> 0] = n.getDay();
            var t = Pn(n) | 0;
            _[r + 28 >>> 2 >>> 0] = t, _[r + 36 >>> 2 >>> 0] = -(n.getTimezoneOffset() * 60);
            var a = new Date(n.getFullYear(), 0, 1),
                i = new Date(n.getFullYear(), 6, 1).getTimezoneOffset(),
                o = a.getTimezoneOffset(),
                s = (i != o && n.getTimezoneOffset() == Math.min(o, i)) | 0;
            return _[r + 32 >>> 2 >>> 0] = s, 0
        }
        var gs = function(e) {
                e >>>= 0;
                var r = (() => {
                    var n = new Date(_[e + 20 >>> 2 >>> 0] + 1900, _[e + 16 >>> 2 >>> 0], _[e + 12 >>> 2 >>> 0], _[e + 8 >>> 2 >>> 0], _[e + 4 >>> 2 >>> 0], _[e >>> 2 >>> 0], 0);
                    if (isNaN(n.getTime())) return -1;
                    var t = _[e + 32 >>> 2 >>> 0],
                        a = n.getTimezoneOffset(),
                        i = new Date(n.getFullYear(), 0, 1),
                        o = new Date(n.getFullYear(), 6, 1).getTimezoneOffset(),
                        s = i.getTimezoneOffset(),
                        c = Math.min(s, o);
                    if (t < 0) t = +(o != s && c == a);
                    else if (t > 0 != (c == a)) {
                        var u = Math.max(s, o),
                            d = t > 0 ? c : u;
                        if (n.setTime(n.getTime() + (d - a) * 6e4), isNaN(n.getTime())) return -1
                    }
                    _[e + 32 >>> 2 >>> 0] = t, _[e + 24 >>> 2 >>> 0] = n.getDay();
                    var p = Pn(n) | 0;
                    return _[e + 28 >>> 2 >>> 0] = p, _[e >>> 2 >>> 0] = n.getSeconds(), _[e + 4 >>> 2 >>> 0] = n.getMinutes(), _[e + 8 >>> 2 >>> 0] = n.getHours(), _[e + 12 >>> 2 >>> 0] = n.getDate(), _[e + 16 >>> 2 >>> 0] = n.getMonth(), _[e + 20 >>> 2 >>> 0] = n.getYear(), n.getTime() / 1e3
                })();
                return BigInt(r)
            },
            Nn = {
                varargs: void 0,
                getStr(e) {
                    var r = T(e);
                    return r
                }
            };

        function Jn(e, r, n, t, a, i) {
            return E ? R(7, 0, 1, e, r, n, t, a, i) : (e >>>= 0, r >>>= 0, i = Q(i), isNaN(i) ? -22 : (Nn.doMsync(e, Nn.getStreamFromFD(a), r, t, i), 0))
        }
        var vs = function(e, r, n, t) {
                e >>>= 0, r >>>= 0, n >>>= 0, t >>>= 0;
                var a = new Date().getFullYear(),
                    i = new Date(a, 0, 1),
                    o = new Date(a, 6, 1),
                    s = i.getTimezoneOffset(),
                    c = o.getTimezoneOffset(),
                    u = Math.max(s, c);
                m[e >>> 2 >>> 0] = u * 60, _[r >>> 2 >>> 0] = +(s != c);
                var d = B => {
                        var k = B >= 0 ? "-" : "+",
                            I = Math.abs(B),
                            b = String(Math.floor(I / 60)).padStart(2, "0"),
                            D = String(I % 60).padStart(2, "0");
                        return `UTC${k}${b}${D}`
                    },
                    p = d(s),
                    x = d(c);
                c < s ? (P(p, n, 17), P(x, t, 17)) : (P(p, t, 17), P(x, n, 17))
            },
            tr = () => performance.timeOrigin + performance.now(),
            Hn = () => Date.now(),
            bs = 1,
            hs = e => e >= 0 && e <= 3;

        function ws(e, r, n) {
            if (r = Q(r), n >>>= 0, !hs(e)) return 28;
            var t;
            if (e === 0) t = Hn();
            else if (bs) t = tr();
            else return 52;
            var a = Math.round(t * 1e3 * 1e3);
            return Z[n >>> 3 >>> 0] = BigInt(a), 0
        }
        var Ir = [],
            zn = (e, r) => {
                Ir.length = 0;
                for (var n; n = W[e++ >>> 0];) {
                    var t = n != 105;
                    t &= n != 112, r += t && r % 8 ? 4 : 0, Ir.push(n == 112 ? m[r >>> 2 >>> 0] : n == 106 ? Z[r >>> 3 >>> 0] : n == 105 ? _[r >>> 2 >>> 0] : N[r >>> 3 >>> 0]), r += t ? 8 : 4
                }
                return Ir
            },
            $n = (e, r, n, t) => {
                var a = zn(r, n);
                return E ? R(0, e, t, ...a) : Gr[e](...a)
            };

        function xs(e, r, n) {
            return e >>>= 0, r >>>= 0, n >>>= 0, $n(e, r, n, 0)
        }
        var qn = (e, r, n) => {
            var t = zn(r, n);
            return Gr[e](...t)
        };

        function ys(e, r, n) {
            return e >>>= 0, r >>>= 0, n >>>= 0, qn(e, r, n)
        }

        function Cs(e, r, n) {
            return e >>>= 0, r >>>= 0, n >>>= 0, qn(e, r, n)
        }

        function Ss(e, r, n) {
            return e >>>= 0, r >>>= 0, n >>>= 0, $n(e, r, n, 1)
        }
        var ve = () => {
                Ne += 1
            },
            _e = () => {
                Ne -= 1
            },
            ks = (e, r) => (ve(), setTimeout(() => {
                _e(), ge(e)
            }, r)),
            Dr = (e, r) => {
                if (F.timingMode = e, F.timingValue = r, !F.func) return 1;
                if (F.scheduler || ve(), e == 0) F.scheduler = function() {
                    var o = Math.max(0, F.tickStartTime + r - tr()) | 0;
                    setTimeout(F.runner, o)
                };
                else if (e == 1) F.scheduler = function() {
                    F.requestAnimationFrame(F.runner)
                };
                else {
                    if (!F.setImmediate)
                        if (globalThis.scheduler) F.setImmediate = scheduler.postTask.bind(scheduler);
                        else {
                            var n = [],
                                t = "setimmediate",
                                a = i => {
                                    i.data === t && (i.stopPropagation(), n.shift()())
                                };
                            addEventListener("message", a, !0), F.setImmediate = i => {
                                n.push(i), fe ? postMessage(t) : postMessage(t, "*")
                            }
                        } F.scheduler = function() {
                        F.setImmediate(F.runner)
                    }
                }
                return 0
            },
            Ts = (e, r, n, t, a) => {
                F.func = e, F.arg = t;
                var i = F.currentlyRunningMainloop;

                function o() {
                    return i < F.currentlyRunningMainloop ? (Vn(), !1) : !0
                }
                if (F.runner = function() {
                        if (!Ee) {
                            if (F.queue.length > 0) {
                                var c = Date.now(),
                                    u = F.queue.shift();
                                if (u.func(u.arg), F.remainingBlockers) {
                                    var d = F.remainingBlockers,
                                        p = d % 1 == 0 ? d - 1 : Math.floor(d);
                                    u.counted ? F.remainingBlockers = p : (p = p + .5, F.remainingBlockers = (8 * d + p) / 9)
                                }
                                if (F.updateStatus(), !o()) return;
                                setTimeout(F.runner, 0);
                                return
                            }
                            if (o()) {
                                if (F.currentFrameNumber = F.currentFrameNumber + 1 | 0, F.timingMode == 1 && F.timingValue > 1 && F.currentFrameNumber % F.timingValue != 0) {
                                    F.scheduler();
                                    return
                                } else F.timingMode == 0 && (F.tickStartTime = tr());
                                F.runIter(e), o() && F.scheduler()
                            }
                        }
                    }, a || (r > 0 ? Dr(0, 1e3 / r) : Dr(1, 1), F.scheduler()), n) throw "unwind"
            },
            F = {
                func: null,
                scheduler: null,
                currentlyRunningMainloop: 0,
                arg: 0,
                timingMode: 0,
                timingValue: 0,
                currentFrameNumber: 0,
                queue: [],
                preMainLoop: [],
                postMainLoop: [],
                pause() {
                    F.scheduler && (F.scheduler = null, F.currentlyRunningMainloop++, _e())
                },
                resume() {
                    F.currentlyRunningMainloop++;
                    var e = F.timingMode,
                        r = F.timingValue,
                        n = F.func;
                    F.func = null, Ts(n, 0, !1, F.arg, !0), Dr(e, r), F.scheduler()
                },
                updateStatus() {
                    if (f.setStatus) {
                        var e = f.statusMessage || "Please wait...",
                            r = F.remainingBlockers ?? 0,
                            n = F.expectedBlockers ?? 0;
                        r ? r < n ? f.setStatus("{message} ({expected - remaining}/{expected})") : f.setStatus(e) : f.setStatus("")
                    }
                },
                init() {},
                runIter(e) {
                    if (!Ee) {
                        for (var r of F.preMainLoop)
                            if (r() === !1) return;
                        ge(e);
                        for (var n of F.postMainLoop) n()
                    }
                },
                nextRAF: 0,
                fakeRequestAnimationFrame(e) {
                    var r = Date.now();
                    if (!F.nextRAF) F.nextRAF = r + 1e3 / 60;
                    else
                        for (; r + 2 >= F.nextRAF;) F.nextRAF += 1e3 / 60;
                    var n = Math.max(F.nextRAF - r, 0);
                    setTimeout(e, n)
                },
                requestAnimationFrame(e) {
                    globalThis.requestAnimationFrame ? requestAnimationFrame(e) : F.fakeRequestAnimationFrame(e)
                }
            },
            Bs = e => (ve(), F.requestAnimationFrame(() => {
                _e(), ge(e)
            })),
            As = function(e, r, n) {
                e >>>= 0, r >>>= 0;
                var t = () => $(e)(r);
                n >= 0 ? ks(t, n) : Bs(t)
            },
            Es = () => {};

        function Fs(e) {
            e >>>= 0, console.error(T(e))
        }

        function Is(e) {
            e >>>= 0, console.log(T(e))
        }

        function Ds(e) {
            e >>>= 0, console.warn(T(e))
        }

        function Os(e, r) {
            return e >>>= 0, r >>>= 0, X(T(e, r))
        }
        var Ms = [],
            wm = e => Ms.push(e),
            S = {
                removeAllEventListeners() {
                    for (; S.eventHandlers.length;) S._removeHandler(S.eventHandlers.length - 1);
                    S.deferredCalls = []
                },
                inEventHandler: 0,
                deferredCalls: [],
                deferCall(e, r, n) {
                    function t(i, o) {
                        if (i.length != o.length) return !1;
                        for (var s = 0; s < i.length; s++)
                            if (i[s] != o[s]) return !1;
                        return !0
                    }
                    for (var a of S.deferredCalls)
                        if (a.targetFunction == e && t(a.argsList, n)) return;
                    S.deferredCalls.push({
                        targetFunction: e,
                        precedence: r,
                        argsList: n
                    }), S.deferredCalls.sort((i, o) => i.precedence - o.precedence)
                },
                removeDeferredCalls(e) {
                    S.deferredCalls = S.deferredCalls.filter(r => r.targetFunction != e)
                },
                canPerformEventHandlerRequests() {
                    return navigator.userActivation.isActive
                },
                runDeferredCalls() {
                    if (S.canPerformEventHandlerRequests()) {
                        var e = S.deferredCalls;
                        S.deferredCalls = [];
                        for (var r of e) r.targetFunction(...r.argsList)
                    }
                },
                eventHandlers: [],
                removeAllHandlersOnTarget: (e, r) => {
                    for (var n = 0; n < S.eventHandlers.length; ++n) S.eventHandlers[n].target == e && (!r || r == S.eventHandlers[n].eventTypeString) && S._removeHandler(n--)
                },
                _removeHandler(e) {
                    var r = S.eventHandlers[e];
                    r.target.removeEventListener(r.eventTypeString, r.eventListenerFunc, r.useCapture), S.eventHandlers.splice(e, 1)
                },
                registerOrRemoveHandler(e) {
                    if (!e.target) return -4;
                    if (e.callbackfunc) e.eventListenerFunc = function(n) {
                        ++S.inEventHandler, S.currentEventHandler = e, S.runDeferredCalls(), e.handlerFunc(n), S.runDeferredCalls(), --S.inEventHandler
                    }, e.target.addEventListener(e.eventTypeString, e.eventListenerFunc, e.useCapture), S.eventHandlers.push(e);
                    else
                        for (var r = 0; r < S.eventHandlers.length; ++r) S.eventHandlers[r].target == e.target && S.eventHandlers[r].eventTypeString == e.eventTypeString && S._removeHandler(r--);
                    return 0
                },
                removeSingleHandler(e) {
                    let r = !1;
                    for (let n = 0; n < S.eventHandlers.length; ++n) {
                        const t = S.eventHandlers[n];
                        t.target === e.target && t.eventTypeId === e.eventTypeId && t.callbackfunc === e.callbackfunc && t.userData === e.userData && (S._removeHandler(n--), r = !0)
                    }
                    return r ? 0 : -5
                },
                getTargetThreadForEventCallback(e) {
                    switch (e) {
                        case 1:
                            return 0;
                        case 2:
                            return U.currentProxiedOperationCallerThread;
                        default:
                            return e
                    }
                },
                getNodeNameForTarget(e) {
                    return e == window ? "#window" : e == screen ? "#screen" : e?.nodeName ?? ""
                },
                fullscreenEnabled() {
                    return document.fullscreenEnabled
                }
            },
            Or = e => {
                if (e.requestPointerLock) e.requestPointerLock();
                else return document.body.requestPointerLock ? -3 : -1;
                return 0
            };

        function Xn() {
            return E ? R(8, 0, 1) : (S.removeDeferredCalls(Or), document.exitPointerLock ? (document.exitPointerLock(), 0) : -1)
        }
        var Rs = () => {
            throw ve(), "unwind"
        };

        function Ls(e) {
            if (ae.xhrs.has(e)) {
                var r = ae.xhrs.get(e);
                ae.xhrs.free(e), r.readyState > 0 && r.readyState < 4 && r.abort()
            }
        }
        var Ws = e => e > 2 ? T(e) : e,
            Kn = [0, globalThis.document ?? 0, globalThis.window ?? 0],
            me = e => {
                e = Ws(e);
                var r = Kn[e] || globalThis.document?.querySelector(e);
                return r
            },
            Re = me,
            Yn = (e, r, n) => {
                var t = Re(e);
                if (!t) return -4;
                if (!t.controlTransferredOffscreen) _[r >>> 2 >>> 0] = t.width, _[n >>> 2 >>> 0] = t.height;
                else return -4;
                return 0
            };

        function Qn(e, r, n) {
            return E ? R(9, 0, 1, e, r, n) : Yn(e, r, n)
        }

        function js(e, r, n) {
            e >>>= 0, r >>>= 0, n >>>= 0;
            var t = Re(e);
            return t ? Yn(e, r, n) : Qn(e, r, n)
        }

        function Zn() {
            return E ? R(10, 0, 1) : devicePixelRatio
        }
        var Mr = e => Kn.indexOf(e) < 0 ? e.getBoundingClientRect() : {
            left: 0,
            top: 0
        };

        function et(e, r, n) {
            if (E) return R(11, 0, 1, e, r, n);
            if (e >>>= 0, r >>>= 0, n >>>= 0, e = me(e), !e) return -4;
            var t = Mr(e);
            return N[r >>> 3 >>> 0] = t.width, N[n >>> 3 >>> 0] = t.height, 0
        }
        var rt = (e, r) => {
            N[e >>> 3 >>> 0] = r.timestamp;
            for (var n = 0; n < r.axes.length; ++n) N[e + n * 8 + 16 >>> 3 >>> 0] = r.axes[n];
            for (var n = 0; n < r.buttons.length; ++n) L[e + n + 1040 >>> 0] = r.buttons[n].pressed, N[e + n * 8 + 528 >>> 3 >>> 0] = r.buttons[n].value;
            L[e + 1104 >>> 0] = r.connected, _[e + 1108 >>> 2 >>> 0] = r.index, _[e + 8 >>> 2 >>> 0] = r.axes.length, _[e + 12 >>> 2 >>> 0] = r.buttons.length, P(r.id, e + 1112, 64), P(r.mapping, e + 1176, 64)
        };

        function nt(e, r) {
            return E ? R(12, 0, 1, e, r) : (r >>>= 0, e < 0 || e >= S.lastGamepadState.length ? -5 : S.lastGamepadState[e] ? (rt(r, S.lastGamepadState[e]), 0) : -7)
        }
        var Us = () => W.length;

        function Gs() {
            return Us()
        }

        function tt() {
            return E ? R(13, 0, 1) : S.lastGamepadState.length
        }
        var Vs = () => 2,
            Ps = () => navigator.hardwareConcurrency;

        function Ns(e, r) {
            return e >>>= 0, r >>>= 0, Ke(T(e, r))
        }
        var Be = {},
            be = e => {
                var r = te(e) + 1,
                    n = H(r);
                return n && P(e, n, r), n
            },
            ar = e => {
                var r;
                return (r = /\bwasm-function\[\d+\]:(0x[0-9a-f]+)/.exec(e)) ? +r[1] : (r = /:(\d+):\d+(?:\)|$)/.exec(e)) ? 2147483648 | +r[1] : 0
            },
            at = e => {
                for (var r of e) {
                    var n = ar(r);
                    n && (Be[n] = r)
                }
            };

        function Js() {
            var e = Ar().split(`
`);
            return e[0] == "Error" && e.shift(), at(e), Be.last_addr = ar(e[3]), Be.last_stack = e, Be.last_addr
        }

        function ir(e) {
            e >>>= 0;
            var r = Be[e];
            if (!r) return 0;
            var n, t;
            if (t = /^\s+at .*\.wasm\.(.*) \(.*\)$/.exec(r)) n = t[1];
            else if (t = /^\s+at (.*) \(.*\)$/.exec(r)) n = t[1];
            else if (t = /^(.+?)@/.exec(r)) n = t[1];
            else return 0;
            return Y(ir.ret ?? 0), ir.ret = be(n), ir.ret
        }

        function it(e, r) {
            return E ? R(14, 0, 1, e, r) : (e >>>= 0, e = me(e), e ? e.requestPointerLock ? S.canPerformEventHandlerRequests() ? Or(e) : r ? (S.deferCall(Or, 2, [e]), 1) : -2 : -1 : -4)
        }

        function Hs(e) {
            e >>>= 0;
            var r = W.length;
            return !1
        }
        var zs = ve;

        function or() {
            if (E) return R(15, 0, 1);
            try {
                if (navigator.getGamepads) return (S.lastGamepadState = navigator.getGamepads()) ? 0 : -1
            } catch {
                navigator.getGamepads = null
            }
            return -1
        }
        var ot = (e, r, n, t, a, i, o) => {
            o = S.getTargetThreadForEventCallback(o);
            var s = 256;
            S.focusEvent || (S.focusEvent = H(s));
            var c = d => {
                    var p = S.getNodeNameForTarget(d.target),
                        x = d.target.id ?? "",
                        B = S.focusEvent;
                    P(p, B + 0, 128), P(x, B + 128, 128), o ? Se(o, t, a, B, s, r) : $(t)(a, B, r) && d.preventDefault()
                },
                u = {
                    target: me(e),
                    eventTypeString: i,
                    eventTypeId: a,
                    userData: r,
                    callbackfunc: t,
                    handlerFunc: c,
                    useCapture: n
                };
            return S.registerOrRemoveHandler(u)
        };

        function st(e, r, n, t, a) {
            return E ? R(16, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, ot(e, r, n, t, 12, "blur", a))
        }
        var ct = (e, r, n) => {
            var t = Re(e);
            if (!t || t.controlTransferredOffscreen) return -4;
            var a = !1;
            if (t.GLctxObject?.GLctx) {
                var i = t.GLctxObject.GLctx.getParameter(2978);
                a = !i[0] && !i[1] && i[2] === t.width && i[3] === t.height
            }
            return t.width = r, t.height = n, a && t.GLctxObject.GLctx.viewport(0, 0, r, n), 0
        };

        function lt(e, r, n) {
            return E ? R(17, 0, 1, e, r, n) : ct(e, r, n)
        }

        function $s(e, r, n) {
            e >>>= 0;
            var t = Re(e);
            return t ? ct(e, r, n) : lt(e, r, n)
        }

        function ut(e, r, n, t, a) {
            return E ? R(18, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, ot(e, r, n, t, 13, "focus", a))
        }
        var ft = (e, r, n, t, a, i, o) => {
            o = S.getTargetThreadForEventCallback(o);
            var s = 1240;
            S.gamepadEvent || (S.gamepadEvent = H(s));
            var c = d => {
                    var p = S.gamepadEvent;
                    rt(p, d.gamepad), o ? Se(o, t, a, p, s, r) : $(t)(a, p, r) && d.preventDefault()
                },
                u = {
                    target: me(e),
                    allowsDeferredCalls: !0,
                    eventTypeString: i,
                    eventTypeId: a,
                    userData: r,
                    callbackfunc: t,
                    handlerFunc: c,
                    useCapture: n
                };
            return S.registerOrRemoveHandler(u)
        };

        function dt(e, r, n, t) {
            return E ? R(19, 0, 1, e, r, n, t) : (e >>>= 0, n >>>= 0, t >>>= 0, or() ? -1 : ft(2, e, r, n, 26, "gamepadconnected", t))
        }

        function _t(e, r, n, t) {
            return E ? R(20, 0, 1, e, r, n, t) : (e >>>= 0, n >>>= 0, t >>>= 0, or() ? -1 : ft(2, e, r, n, 27, "gamepaddisconnected", t))
        }
        var mt = (e, r, n, t, a, i, o) => {
            o = S.getTargetThreadForEventCallback(o);
            var s = 160;
            S.keyEvent || (S.keyEvent = H(s));
            var c = d => {
                    var p = S.keyEvent;
                    N[p >>> 3 >>> 0] = d.timeStamp;
                    var x = p >>> 2;
                    _[x + 2 >>> 0] = d.location, L[p + 12 >>> 0] = d.ctrlKey, L[p + 13 >>> 0] = d.shiftKey, L[p + 14 >>> 0] = d.altKey, L[p + 15 >>> 0] = d.metaKey, L[p + 16 >>> 0] = d.repeat, _[x + 5 >>> 0] = d.charCode, _[x + 6 >>> 0] = d.keyCode, _[x + 7 >>> 0] = d.which, P(d.key ?? "", p + 32, 32), P(d.code ?? "", p + 64, 32), P(d.char ?? "", p + 96, 32), P(d.locale ?? "", p + 128, 32), o ? Se(o, t, a, p, s, r) : $(t)(a, p, r) && d.preventDefault()
                },
                u = {
                    target: me(e),
                    eventTypeString: i,
                    eventTypeId: a,
                    userData: r,
                    callbackfunc: t,
                    handlerFunc: c,
                    useCapture: n
                };
            return S.registerOrRemoveHandler(u)
        };

        function pt(e, r, n, t, a) {
            return E ? R(21, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, mt(e, r, n, t, 2, "keydown", a))
        }

        function gt(e, r, n, t, a) {
            return E ? R(22, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, mt(e, r, n, t, 3, "keyup", a))
        }
        var vt = (e, r, n) => {
                N[e >>> 3 >>> 0] = r.timeStamp;
                var t = e >>> 2;
                _[t + 2 >>> 0] = r.screenX, _[t + 3 >>> 0] = r.screenY, _[t + 4 >>> 0] = r.clientX, _[t + 5 >>> 0] = r.clientY, L[e + 24 >>> 0] = r.ctrlKey, L[e + 25 >>> 0] = r.shiftKey, L[e + 26 >>> 0] = r.altKey, L[e + 27 >>> 0] = r.metaKey, ne[t * 2 + 14 >>> 0] = r.button, ne[t * 2 + 15 >>> 0] = r.buttons, _[t + 8 >>> 0] = r.movementX, _[t + 9 >>> 0] = r.movementY;
                var a = Mr(n);
                _[t + 10 >>> 0] = r.clientX - (a.left | 0), _[t + 11 >>> 0] = r.clientY - (a.top | 0)
            },
            Je = (e, r, n, t, a, i, o) => {
                o = S.getTargetThreadForEventCallback(o);
                var s = 64;
                S.mouseEvent || (S.mouseEvent = H(s)), e = me(e);
                var c = d => {
                        vt(S.mouseEvent, d, e), o ? Se(o, t, a, S.mouseEvent, s, r) : $(t)(a, S.mouseEvent, r) && d.preventDefault()
                    },
                    u = {
                        target: e,
                        allowsDeferredCalls: i != "mousemove" && i != "mouseenter" && i != "mouseleave",
                        eventTypeString: i,
                        eventTypeId: a,
                        userData: r,
                        callbackfunc: t,
                        handlerFunc: c,
                        useCapture: n
                    };
                return S.registerOrRemoveHandler(u)
            };

        function bt(e, r, n, t, a) {
            return E ? R(23, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, Je(e, r, n, t, 5, "mousedown", a))
        }

        function ht(e, r, n, t, a) {
            return E ? R(24, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, Je(e, r, n, t, 33, "mouseenter", a))
        }

        function wt(e, r, n, t, a) {
            return E ? R(25, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, Je(e, r, n, t, 34, "mouseleave", a))
        }

        function xt(e, r, n, t, a) {
            return E ? R(26, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, Je(e, r, n, t, 8, "mousemove", a))
        }

        function yt(e, r, n, t, a) {
            return E ? R(27, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, Je(e, r, n, t, 6, "mouseup", a))
        }
        var qs = (e, r, n, t, a, i, o) => {
            o = S.getTargetThreadForEventCallback(o);
            var s = u => {
                    o ? Se(o, t, a, 0, 0, r) : $(t)(a, 0, r) && u.preventDefault()
                },
                c = {
                    target: e,
                    eventTypeString: i,
                    eventTypeId: a,
                    userData: r,
                    callbackfunc: t,
                    handlerFunc: s,
                    useCapture: n
                };
            return S.registerOrRemoveHandler(c)
        };

        function Ct(e, r, n, t, a) {
            return E ? R(28, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, document.body?.requestPointerLock ? (e = me(e), e ? qs(e, r, n, t, 38, "pointerlockerror", a) : -4) : -1)
        }
        var sr = (e, r, n, t, a, i, o) => {
            o = S.getTargetThreadForEventCallback(o);
            var s = 1552;
            S.touchEvent || (S.touchEvent = H(s)), e = me(e);
            var c = d => {
                    var p, x = {},
                        B = d.touches;
                    for (let O of B) O.isChanged = O.onTarget = 0, x[O.identifier] = O;
                    for (let O of d.changedTouches) O.isChanged = 1, x[O.identifier] = O;
                    for (let O of d.targetTouches) x[O.identifier].onTarget = 1;
                    var k = S.touchEvent;
                    N[k >>> 3 >>> 0] = d.timeStamp, L[k + 12 >>> 0] = d.ctrlKey, L[k + 13 >>> 0] = d.shiftKey, L[k + 14 >>> 0] = d.altKey, L[k + 15 >>> 0] = d.metaKey;
                    var I = k + 16,
                        b = Mr(e),
                        D = 0;
                    for (let O of Object.values(x)) {
                        var C = I >>> 2;
                        if (_[C + 0 >>> 0] = O.identifier, _[C + 1 >>> 0] = O.screenX, _[C + 2 >>> 0] = O.screenY, _[C + 3 >>> 0] = O.clientX, _[C + 4 >>> 0] = O.clientY, _[C + 5 >>> 0] = O.pageX, _[C + 6 >>> 0] = O.pageY, L[I + 28 >>> 0] = O.isChanged, L[I + 29 >>> 0] = O.onTarget, _[C + 8 >>> 0] = O.clientX - (b.left | 0), _[C + 9 >>> 0] = O.clientY - (b.top | 0), I += 48, ++D > 31) break
                    }
                    _[k + 8 >>> 2 >>> 0] = D, o ? Se(o, t, a, k, s, r) : $(t)(a, k, r) && d.preventDefault()
                },
                u = {
                    target: e,
                    allowsDeferredCalls: i == "touchstart" || i == "touchend",
                    eventTypeString: i,
                    eventTypeId: a,
                    userData: r,
                    callbackfunc: t,
                    handlerFunc: c,
                    useCapture: n
                };
            return S.registerOrRemoveHandler(u)
        };

        function St(e, r, n, t, a) {
            return E ? R(29, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, sr(e, r, n, t, 25, "touchcancel", a))
        }

        function kt(e, r, n, t, a) {
            return E ? R(30, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, sr(e, r, n, t, 23, "touchend", a))
        }

        function Tt(e, r, n, t, a) {
            return E ? R(31, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, sr(e, r, n, t, 24, "touchmove", a))
        }

        function Bt(e, r, n, t, a) {
            return E ? R(32, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, sr(e, r, n, t, 22, "touchstart", a))
        }
        var Xs = (e, r, n, t, a, i, o) => {
            o = S.getTargetThreadForEventCallback(o);
            var s = 96;
            S.wheelEvent || (S.wheelEvent = H(s));
            var c = d => {
                    var p = S.wheelEvent;
                    vt(p, d, e), N[p + 64 >>> 3 >>> 0] = d.deltaX, N[p + 72 >>> 3 >>> 0] = d.deltaY, N[p + 80 >>> 3 >>> 0] = d.deltaZ, _[p + 88 >>> 2 >>> 0] = d.deltaMode, o ? Se(o, t, a, p, s, r) : $(t)(a, p, r) && d.preventDefault()
                },
                u = {
                    target: e,
                    allowsDeferredCalls: !0,
                    eventTypeString: i,
                    eventTypeId: a,
                    userData: r,
                    callbackfunc: t,
                    handlerFunc: c,
                    useCapture: n
                };
            return S.registerOrRemoveHandler(u)
        };

        function At(e, r, n, t, a) {
            return E ? R(33, 0, 1, e, r, n, t, a) : (e >>>= 0, r >>>= 0, t >>>= 0, a >>>= 0, e = me(e), e ? typeof e.onwheel < "u" ? Xs(e, r, n, t, 9, "wheel", a) : -1 : -4)
        }

        function Ks(e, r, n) {
            e >>>= 0, r >>>= 0;
            var t;
            Be.last_addr == e ? t = Be.last_stack : (t = Ar().split(`
`), t[0] == "Error" && t.shift(), at(t));
            for (var a = 3; t[a] && ar(t[a]) != e;) ++a;
            for (var i = 0; i < n && t[i + a]; ++i) m[r + i * 4 >>> 2 >>> 0] = ar(t[i + a]);
            return i
        }
        class Et {
            constructor() {
                gr(this, "allocated", [void 0]);
                gr(this, "freelist", [])
            }
            get(r) {
                return this.allocated[r]
            }
            has(r) {
                return this.allocated[r] !== void 0
            }
            allocate(r) {
                var n = this.freelist.pop() ?? this.allocated.length;
                return this.allocated[n] = r, n
            }
            free(r) {
                this.allocated[r] = void 0, this.freelist.push(r)
            }
        }
        var ae = {
            async init() {
                ae.xhrs = new Et
            }
        };

        function Ft(e, r, n, t, a) {
            var i = m[e + 8 >>> 2 >>> 0];
            if (!i) {
                n(e, "no url specified!");
                return
            }
            var o = T(i),
                s = e + 108,
                c = T(s + 0);
            c || (c = "GET");
            var u = m[s + 56 >>> 2 >>> 0],
                d = m[s + 68 >>> 2 >>> 0],
                p = m[s + 72 >>> 2 >>> 0],
                x = m[s + 76 >>> 2 >>> 0],
                B = m[s + 80 >>> 2 >>> 0],
                k = m[s + 84 >>> 2 >>> 0],
                I = m[s + 88 >>> 2 >>> 0],
                b = m[s + 52 >>> 2 >>> 0],
                D = !!(b & 1),
                C = !!(b & 2),
                O = !!(b & 64),
                z = d ? T(d) : void 0,
                G = p ? T(p) : void 0,
                M = new XMLHttpRequest;
            if (M.withCredentials = !!W[s + 60 >>> 0], M._streamData = C, M.open(c, o, !O, z, G), O || (M.timeout = u), M.url_ = o, M.responseType = "arraybuffer", B) {
                var _r = T(B);
                M.overrideMimeType(_r)
            }
            if (x)
                for (;;) {
                    var A = m[x >>> 2 >>> 0];
                    if (!A) break;
                    var qe = m[x + 4 >>> 2 >>> 0];
                    if (!qe) break;
                    x += 8;
                    var cn = T(A),
                        ln = T(qe);
                    M.setRequestHeader(cn, ln)
                }
            var le = ae.xhrs.allocate(M);
            m[e >>> 2 >>> 0] = le;
            var un = k && I ? W.slice(k, k + I) : null;

            function mr() {
                var q = 0,
                    y = 0;
                M.response && D && m[e + 12 >>> 2 >>> 0] === 0 && (y = M.response.byteLength), y > 0 && (q = Vr(m[e + 12 >>> 2 >>> 0], y), W.set(new Uint8Array(M.response), q >>> 0)), m[e + 12 >>> 2 >>> 0] = q, ye(e + 16, y), ye(e + 24, 0);
                var h = M.response?.byteLength ?? 0;
                if (h && ye(e + 32, h), ne[e + 40 >>> 1 >>> 0] = M.readyState, ne[e + 42 >>> 1 >>> 0] = M.status, M.statusText && P(M.statusText, e + 44, 64), O) {
                    var w = be(M.responseURL);
                    m[e + 200 >>> 2 >>> 0] = w
                }
            }
            M.onload = q => {
                ae.xhrs.has(le) && (mr(), M.status >= 200 && M.status < 300 ? r(e, M, q) : n(e, q))
            }, M.onerror = q => {
                ae.xhrs.has(le) && (mr(), n(e, q))
            }, M.ontimeout = q => {
                ae.xhrs.has(le) && n(e, q)
            }, M.onprogress = q => {
                if (ae.xhrs.has(le))
                    for (var y = D && C ? M.response?.byteLength ?? 0 : 0, h = 8 * 1024 * 1024, w = 0; w < y || !y;) {
                        var j = Math.min(y - w, h),
                            K = 0;
                        j > 0 && D && C && (K = Vr(m[e + 12 >>> 2 >>> 0], j), W.set(new Uint8Array(M.response, w, j), K >>> 0)), m[e + 12 >>> 2 >>> 0] = K, ye(e + 16, j), ye(e + 24, q.loaded - y + w), ye(e + 32, q.total), ne[e + 40 >>> 1 >>> 0] = M.readyState;
                        var V = M.status;
                        if (M.readyState >= 3 && M.status === 0 && q.loaded > 0 && (V = 200), ne[e + 42 >>> 1 >>> 0] = V, M.statusText && P(M.statusText, e + 44, 64), t(e, q), w += j, !y) break
                    }
            }, M.onreadystatechange = q => {
                if (!ae.xhrs.has(le)) {
                    _e();
                    return
                }
                if (ne[e + 40 >>> 1 >>> 0] = M.readyState, M.readyState >= 2 && (ne[e + 42 >>> 1 >>> 0] = M.status), !O && M.readyState === 2 && M.responseURL.length > 0) {
                    var y = be(M.responseURL);
                    m[e + 200 >>> 2 >>> 0] = y
                }
                a(e, q)
            };
            try {
                M.send(un)
            } catch (q) {
                n(e, q)
            }
        }
        var ye = (e, r) => {
            m[e >>> 2 >>> 0] = r;
            var n = m[e >>> 2 >>> 0];
            m[e + 4 >>> 2 >>> 0] = (r - n) / 4294967296
        };

        function Ys(e, r, n, t, a) {
            e >>>= 0, ve();
            var i = e + 108,
                o = m[i + 36 >>> 2 >>> 0],
                s = m[i + 40 >>> 2 >>> 0],
                c = m[i + 44 >>> 2 >>> 0],
                u = m[i + 48 >>> 2 >>> 0],
                d = m[i + 52 >>> 2 >>> 0],
                p = !!(d & 64);

            function x(C) {
                p ? C() : ge(C)
            }
            var B = (C, O, z) => {
                    _e(), x(() => {
                        o ? $(o)(C) : r?.(C)
                    })
                },
                k = (C, O) => {
                    x(() => {
                        c ? $(c)(C) : t?.(C)
                    })
                },
                I = (C, O) => {
                    _e(), x(() => {
                        s ? $(s)(C) : n?.(C)
                    })
                },
                b = (C, O) => {
                    x(() => {
                        u ? $(u)(C) : a?.(C)
                    })
                },
                D = (C, O, z) => {
                    Ft(C, B, I, k, b)
                };
            return Ft(e, B, I, k, b), e
        }
        var Qs = () => {
                throw "unwind"
            },
            v, Zs = e => !!(e.dibvbi = e.getExtension("WEBGL_draw_instanced_base_vertex_base_instance")),
            ec = e => !!(e.mdibvbi = e.getExtension("WEBGL_multi_draw_instanced_base_vertex_base_instance")),
            rc = e => !!(e.extPolygonOffsetClamp = e.getExtension("EXT_polygon_offset_clamp")),
            nc = e => !!(e.extClipControl = e.getExtension("EXT_clip_control")),
            tc = e => !!(e.webglPolygonMode = e.getExtension("WEBGL_polygon_mode")),
            ac = e => !!(e.multiDrawWebgl = e.getExtension("WEBGL_multi_draw")),
            It = e => {
                var r = ["EXT_color_buffer_float", "EXT_conservative_depth", "EXT_disjoint_timer_query_webgl2", "EXT_texture_norm16", "NV_shader_noperspective_interpolation", "WEBGL_clip_cull_distance", "EXT_clip_control", "EXT_color_buffer_half_float", "EXT_depth_clamp", "EXT_float_blend", "EXT_polygon_offset_clamp", "EXT_texture_compression_bptc", "EXT_texture_compression_rgtc", "EXT_texture_filter_anisotropic", "KHR_parallel_shader_compile", "OES_texture_float_linear", "WEBGL_blend_func_extended", "WEBGL_compressed_texture_astc", "WEBGL_compressed_texture_etc", "WEBGL_compressed_texture_etc1", "WEBGL_compressed_texture_s3tc", "WEBGL_compressed_texture_s3tc_srgb", "WEBGL_debug_renderer_info", "WEBGL_debug_shaders", "WEBGL_lose_context", "WEBGL_multi_draw", "WEBGL_polygon_mode"];
                return e.getSupportedExtensions()?.filter(n => r.includes(n)) ?? []
            },
            ic = e => {
                typeof F < "u" && F.preMainLoop.push(e)
            },
            cr = (e, r, n, t, a = W) => {
                v.bufferSubData(e, r, a.subarray(t, t + n))
            },
            g = {
                counter: 1,
                buffers: [],
                mappedBuffers: {},
                programs: [],
                framebuffers: [],
                renderbuffers: [],
                textures: [],
                shaders: [],
                vaos: [],
                contexts: {},
                offscreenCanvases: {},
                queries: [],
                samplers: [],
                transformFeedbacks: [],
                syncs: [],
                byteSizeByTypeRoot: 5120,
                byteSizeByType: [1, 1, 2, 2, 4, 4, 4, 2, 3, 4, 8],
                stringCache: {},
                stringiCache: {},
                unpackAlignment: 4,
                unpackRowLength: 0,
                recordError: e => {
                    g.lastError || (g.lastError = e)
                },
                getNewId: e => {
                    for (var r = g.counter++, n = e.length; n < r; n++) e[n] = null;
                    for (; e[r];) r = g.counter++;
                    return r
                },
                genObject: (e, r, n, t) => {
                    for (var a = 0; a < e; a++) {
                        var i = v[n](),
                            o = i && g.getNewId(t);
                        i ? (i.name = o, t[o] = i) : g.recordError(1282), _[r + a * 4 >>> 2 >>> 0] = o
                    }
                },
                MAX_TEMP_BUFFER_SIZE: 2097152,
                numTempVertexBuffersPerSize: 64,
                log2ceilLookup: e => 32 - Math.clz32(e ? e - 1 : 0),
                generateTempBuffers: (e, r) => {
                    var n = g.log2ceilLookup(g.MAX_TEMP_BUFFER_SIZE);
                    r.tempVertexBufferCounters1 = [], r.tempVertexBufferCounters2 = [], r.tempVertexBufferCounters1.length = r.tempVertexBufferCounters2.length = n + 1, r.tempVertexBuffers1 = [], r.tempVertexBuffers2 = [], r.tempVertexBuffers1.length = r.tempVertexBuffers2.length = n + 1, r.tempIndexBuffers = [], r.tempIndexBuffers.length = n + 1;
                    for (var t = 0; t <= n; ++t) {
                        r.tempIndexBuffers[t] = null, r.tempVertexBufferCounters1[t] = r.tempVertexBufferCounters2[t] = 0;
                        var a = g.numTempVertexBuffersPerSize;
                        r.tempVertexBuffers1[t] = [], r.tempVertexBuffers2[t] = [];
                        var i = r.tempVertexBuffers1[t],
                            o = r.tempVertexBuffers2[t];
                        i.length = o.length = a;
                        for (var s = 0; s < a; ++s) i[s] = o[s] = null
                    }
                    if (e) {
                        r.tempQuadIndexBuffer = v.createBuffer(), r.GLctx.bindBuffer(34963, r.tempQuadIndexBuffer);
                        for (var c = g.MAX_TEMP_BUFFER_SIZE >> 1, u = new Uint16Array(c), t = 0, d = 0; u[t++] = d, !(t >= c || (u[t++] = d + 1, t >= c) || (u[t++] = d + 2, t >= c) || (u[t++] = d, t >= c) || (u[t++] = d + 2, t >= c) || (u[t++] = d + 3, t >= c));) d += 4;
                        r.GLctx.bufferData(34963, u, 35044), r.GLctx.bindBuffer(34963, null)
                    }
                },
                getTempVertexBuffer: e => {
                    var r = g.log2ceilLookup(e),
                        n = g.currentContext.tempVertexBuffers1[r],
                        t = g.currentContext.tempVertexBufferCounters1[r];
                    g.currentContext.tempVertexBufferCounters1[r] = g.currentContext.tempVertexBufferCounters1[r] + 1 & g.numTempVertexBuffersPerSize - 1;
                    var a = n[t];
                    if (a) return a;
                    var i = v.getParameter(34964);
                    return n[t] = v.createBuffer(), v.bindBuffer(34962, n[t]), v.bufferData(34962, 1 << r, 35048), v.bindBuffer(34962, i), n[t]
                },
                getTempIndexBuffer: e => {
                    var r = g.log2ceilLookup(e),
                        n = g.currentContext.tempIndexBuffers[r];
                    if (n) return n;
                    var t = v.getParameter(34965);
                    return g.currentContext.tempIndexBuffers[r] = v.createBuffer(), v.bindBuffer(34963, g.currentContext.tempIndexBuffers[r]), v.bufferData(34963, 1 << r, 35048), v.bindBuffer(34963, t), g.currentContext.tempIndexBuffers[r]
                },
                newRenderingFrameStarted: () => {
                    if (g.currentContext) {
                        var e = g.currentContext.tempVertexBuffers1;
                        g.currentContext.tempVertexBuffers1 = g.currentContext.tempVertexBuffers2, g.currentContext.tempVertexBuffers2 = e, e = g.currentContext.tempVertexBufferCounters1, g.currentContext.tempVertexBufferCounters1 = g.currentContext.tempVertexBufferCounters2, g.currentContext.tempVertexBufferCounters2 = e;
                        for (var r = g.log2ceilLookup(g.MAX_TEMP_BUFFER_SIZE), n = 0; n <= r; ++n) g.currentContext.tempVertexBufferCounters1[n] = 0
                    }
                },
                getSource: (e, r, n, t) => {
                    for (var a = "", i = 0; i < r; ++i) {
                        var o = t ? m[t + i * 4 >>> 2 >>> 0] : void 0;
                        a += T(m[n + i * 4 >>> 2 >>> 0], o)
                    }
                    return a
                },
                calcBufLength: (e, r, n, t) => {
                    if (n > 0) return t * n;
                    var a = g.byteSizeByType[r - g.byteSizeByTypeRoot];
                    return e * a * t
                },
                usedTempBuffers: [],
                preDrawHandleClientVertexAttribBindings: e => {
                    g.resetBufferBinding = !1;
                    for (var r = 0; r < g.currentContext.maxVertexAttribs; ++r) {
                        var n = g.currentContext.clientBuffers[r];
                        if (!(!n.clientside || !n.enabled)) {
                            g.resetBufferBinding = !0;
                            var t = g.calcBufLength(n.size, n.type, n.stride, e),
                                a = g.getTempVertexBuffer(t);
                            v.bindBuffer(34962, a), cr(34962, 0, t, n.ptr), n.vertexAttribPointerAdaptor.call(v, r, n.size, n.type, n.normalized, n.stride, 0)
                        }
                    }
                },
                postDrawHandleClientVertexAttribBindings: () => {
                    g.resetBufferBinding && v.bindBuffer(34962, g.buffers[v.currentArrayBufferBinding])
                },
                createContext: (e, r) => {
                    if (!e.getContextSafariWebGL2Fixed) {
                        let i = function(o, s) {
                            var c = e.getContextSafariWebGL2Fixed(o, s);
                            return o == "webgl" == c instanceof WebGLRenderingContext ? c : null
                        };
                        var a = i;
                        e.getContextSafariWebGL2Fixed = e.getContext, e.getContext = i
                    }
                    var n = e.getContext("webgl2", r);
                    if (!n) return 0;
                    var t = g.registerContext(n, r);
                    return t
                },
                registerContext: (e, r) => {
                    var n = H(8);
                    m[n + 4 >>> 2 >>> 0] = he();
                    var t = {
                        handle: n,
                        attributes: r,
                        version: r.majorVersion,
                        GLctx: e
                    };
                    e.canvas && (e.canvas.GLctxObject = t), g.contexts[n] = t, (typeof r.enableExtensionsByDefault > "u" || r.enableExtensionsByDefault) && g.initExtensions(t), t.maxVertexAttribs = t.GLctx.getParameter(34921), t.clientBuffers = [];
                    for (var a = 0; a < t.maxVertexAttribs; a++) t.clientBuffers[a] = {
                        enabled: !1,
                        clientside: !1,
                        size: 0,
                        type: 0,
                        normalized: 0,
                        stride: 0,
                        ptr: 0,
                        vertexAttribPointerAdaptor: null
                    };
                    return g.generateTempBuffers(!1, t), n
                },
                makeContextCurrent: e => (g.currentContext = g.contexts[e], f.ctx = v = g.currentContext?.GLctx, !(e && !v)),
                getContext: e => g.contexts[e],
                deleteContext: e => {
                    g.currentContext === g.contexts[e] && (g.currentContext = null), typeof S == "object" && S.removeAllHandlersOnTarget(g.contexts[e].GLctx.canvas), g.contexts[e]?.GLctx.canvas && (g.contexts[e].GLctx.canvas.GLctxObject = void 0), Y(g.contexts[e].handle), g.contexts[e] = null
                },
                initExtensions: e => {
                    if (e || (e = g.currentContext), !e.initExtensionsDone) {
                        e.initExtensionsDone = !0;
                        var r = e.GLctx;
                        ac(r), rc(r), nc(r), tc(r), Zs(r), ec(r), e.version >= 2 && (r.disjointTimerQueryExt = r.getExtension("EXT_disjoint_timer_query_webgl2")), (e.version < 2 || !r.disjointTimerQueryExt) && (r.disjointTimerQueryExt = r.getExtension("EXT_disjoint_timer_query"));
                        for (var n of It(r)) !n.includes("lose_context") && !n.includes("debug") && r.getExtension(n)
                    }
                }
            },
            Dt = ["default", "low-power", "high-performance"];

        function oc(e, r) {
            e >>>= 0, r >>>= 0;
            var n = r >>> 2,
                t = _[n + 2 >>> 0],
                a = {
                    alpha: !!L[r + 0 >>> 0],
                    depth: !!L[r + 1 >>> 0],
                    stencil: !!L[r + 2 >>> 0],
                    antialias: !!L[r + 3 >>> 0],
                    premultipliedAlpha: !!L[r + 4 >>> 0],
                    preserveDrawingBuffer: !!L[r + 5 >>> 0],
                    powerPreference: Dt[t],
                    failIfMajorPerformanceCaveat: !!L[r + 12 >>> 0],
                    desynchronized: !!L[r + 33 >>> 0],
                    majorVersion: _[n + 4 >>> 0],
                    minorVersion: _[n + 5 >>> 0],
                    enableExtensionsByDefault: L[r + 24 >>> 0],
                    explicitSwapControl: L[r + 25 >>> 0],
                    proxyContextToMainThread: _[n + 7 >>> 0],
                    renderViaOffscreenBackBuffer: L[r + 32 >>> 0]
                },
                i = Re(e);
            if (!i || a.explicitSwapControl) return 0;
            var o = g.createContext(i, a);
            return o
        }
        var sc = oc;

        function cc(e) {
            e >>>= 0, g.currentContext == e && (g.currentContext = 0), g.deleteContext(e)
        }

        function lc(e, r) {
            if (e >>>= 0, r >>>= 0, !r) return -5;
            if (e = g.contexts[e], !e) return -3;
            var n = e.GLctx?.getContextAttributes();
            if (!n) return -3;
            L[r >>> 0] = n.alpha, L[r + 1 >>> 0] = n.depth, L[r + 2 >>> 0] = n.stencil, L[r + 3 >>> 0] = n.antialias, L[r + 4 >>> 0] = n.premultipliedAlpha, L[r + 5 >>> 0] = n.preserveDrawingBuffer;
            var t = n.powerPreference && Dt.indexOf(n.powerPreference);
            return _[r + 8 >>> 2 >>> 0] = t, L[r + 12 >>> 0] = n.failIfMajorPerformanceCaveat, L[r + 33 >>> 0] = n.desynchronized, _[r + 16 >>> 2 >>> 0] = e.version, _[r + 20 >>> 2 >>> 0] = 0, L[r + 24 >>> 0] = e.attributes.enableExtensionsByDefault, 0
        }

        function uc(e) {
            e >>>= 0;
            var r = g.makeContextCurrent(e);
            return r ? 0 : -5
        }
        var lr = e => {
                var r = te(e) + 1,
                    n = Ze(r);
                return P(e, n, r), n
            },
            Ce = e => m[e >>> 2 >>> 0] + _[e + 4 >>> 2 >>> 0] * 4294967296,
            l = {
                Internals: {
                    jsObjects: [],
                    jsObjectInsert: (e, r) => {
                        e >>>= 0, l.Internals.jsObjects[e] = r
                    },
                    bufferOnUnmaps: [],
                    futures: [],
                    futureInsert: (e, r) => {
                        l.Internals.futures[e] = new Promise(n => r.finally(() => n(e)))
                    }
                },
                getJsObject: e => {
                    if (e) return e >>>= 0, l.Internals.jsObjects[e]
                },
                importJsAdapter: (e, r = 0) => {
                    var n = Fi(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsBindGroup: (e, r = 0) => {
                    var n = tn(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsBindGroupLayout: (e, r = 0) => {
                    var n = en(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsBuffer: (e, r = 0) => {
                    Xi(e.mapState === "unmapped");
                    var n = Mi(r);
                    return l.Internals.jsObjectInsert(n, e), n
                },
                importJsCommandBuffer: (e, r = 0) => {
                    var n = Yr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsCommandEncoder: (e, r = 0) => {
                    var n = Zr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsComputePassEncoder: (e, r = 0) => {
                    var n = Nr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsComputePipeline: (e, r = 0) => {
                    var n = Qr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsDevice: (e, r = 0) => {
                    var n = $r(r),
                        t = Ei(r, n);
                    return l.Internals.jsObjectInsert(n, e.queue), l.Internals.jsObjectInsert(t, e), t
                },
                importJsExternalTexture: (e, r = 0) => {
                    var n = Ii(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsPipelineLayout: (e, r = 0) => {
                    var n = rn(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsQuerySet: (e, r = 0) => {
                    var n = qr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsQueue: (e, r = 0) => {
                    var n = $r(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsRenderBundle: (e, r = 0) => {
                    var n = Ai(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsRenderBundleEncoder: (e, r = 0) => {
                    var n = Oi(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsRenderPassEncoder: (e, r = 0) => {
                    var n = Kr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsRenderPipeline: (e, r = 0) => {
                    var n = nn(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsSampler: (e, r = 0) => {
                    var n = Hr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsShaderModule: (e, r = 0) => {
                    var n = Bi(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsSurface: (e, r = 0) => {
                    var n = Jr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsTexture: (e, r = 0) => {
                    var n = Xr(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                importJsTextureView: (e, r = 0) => {
                    var n = an(r);
                    return l.Internals.jsObjects[n] = e, n
                },
                errorCallback: (e, r, n, t) => {
                    var a = Ye(),
                        i = lr(n);
                    $(e)(r, i, t), Qe(a)
                },
                iterateExtensions: (e, r) => {
                    for (var n = m[e >>> 2 >>> 0]; n; n = m[n >>> 2 >>> 0]) var t = _[n + 4 >>> 2 >>> 0],
                        a = r[t](n)
                },
                setStringView: (e, r, n) => {
                    m[e >>> 2 >>> 0] = r, m[e + 4 >>> 2 >>> 0] = n
                },
                makeStringFromStringView: e => {
                    var r = m[e >>> 2 >>> 0],
                        n = m[e + 4 >>> 2 >>> 0];
                    return T(r, n)
                },
                makeStringFromOptionalStringView: e => {
                    var r = m[e >>> 2 >>> 0],
                        n = m[e + 4 >>> 2 >>> 0];
                    return r ? T(r, n) : n === 0 ? "" : void 0
                },
                makeColor: e => ({
                    r: N[e >>> 3 >>> 0],
                    g: N[e + 8 >>> 3 >>> 0],
                    b: N[e + 16 >>> 3 >>> 0],
                    a: N[e + 24 >>> 3 >>> 0]
                }),
                makeExtent3D: e => ({
                    width: m[e >>> 2 >>> 0],
                    height: m[e + 4 >>> 2 >>> 0],
                    depthOrArrayLayers: m[e + 8 >>> 2 >>> 0]
                }),
                makeOrigin3D: e => ({
                    x: m[e >>> 2 >>> 0],
                    y: m[e + 4 >>> 2 >>> 0],
                    z: m[e + 8 >>> 2 >>> 0]
                }),
                makeTexelCopyTextureInfo: e => ({
                    texture: l.getJsObject(m[e >>> 2 >>> 0]),
                    mipLevel: m[e + 4 >>> 2 >>> 0],
                    origin: l.makeOrigin3D(e + 8),
                    aspect: l.TextureAspect[_[e + 20 >>> 2 >>> 0]]
                }),
                makeTexelCopyBufferLayout: e => {
                    var r = m[e + 8 >>> 2 >>> 0],
                        n = m[e + 12 >>> 2 >>> 0];
                    return {
                        offset: Ce(e),
                        bytesPerRow: r === 4294967295 ? void 0 : r,
                        rowsPerImage: n === 4294967295 ? void 0 : n
                    }
                },
                makeTexelCopyBufferInfo: e => {
                    var r = e + 0,
                        n = l.makeTexelCopyBufferLayout(r);
                    return n.buffer = l.getJsObject(m[e + 16 >>> 2 >>> 0]), n
                },
                makePassTimestampWrites: e => {
                    if (e !== 0) return {
                        querySet: l.getJsObject(m[e + 4 >>> 2 >>> 0]),
                        beginningOfPassWriteIndex: m[e + 8 >>> 2 >>> 0],
                        endOfPassWriteIndex: m[e + 12 >>> 2 >>> 0]
                    }
                },
                makePipelineConstants: (e, r) => {
                    if (e) {
                        for (var n = {}, t = 0; t < e; ++t) {
                            var a = r + 24 * t,
                                i = l.makeStringFromStringView(a + 4);
                            n[i] = N[a + 16 >>> 3 >>> 0]
                        }
                        return n
                    }
                },
                makePipelineLayout: e => e ? l.getJsObject(e) : "auto",
                makeComputeState: e => {
                    if (e) {
                        var r = {
                            module: l.getJsObject(m[e + 4 >>> 2 >>> 0]),
                            constants: l.makePipelineConstants(m[e + 16 >>> 2 >>> 0], m[e + 20 >>> 2 >>> 0]),
                            entryPoint: l.makeStringFromOptionalStringView(e + 8)
                        };
                        return r
                    }
                },
                makeComputePipelineDesc: e => {
                    var r = {
                        label: l.makeStringFromOptionalStringView(e + 4),
                        layout: l.makePipelineLayout(m[e + 12 >>> 2 >>> 0]),
                        compute: l.makeComputeState(e + 16)
                    };
                    return r
                },
                makeRenderPipelineDesc: e => {
                    function r(b) {
                        if (b) return {
                            topology: l.PrimitiveTopology[_[b + 4 >>> 2 >>> 0]],
                            stripIndexFormat: l.IndexFormat[_[b + 8 >>> 2 >>> 0]],
                            frontFace: l.FrontFace[_[b + 12 >>> 2 >>> 0]],
                            cullMode: l.CullMode[_[b + 16 >>> 2 >>> 0]],
                            unclippedDepth: !!m[b + 20 >>> 2 >>> 0]
                        }
                    }

                    function n(b) {
                        if (b) return {
                            operation: l.BlendOperation[_[b >>> 2 >>> 0]],
                            srcFactor: l.BlendFactor[_[b + 4 >>> 2 >>> 0]],
                            dstFactor: l.BlendFactor[_[b + 8 >>> 2 >>> 0]]
                        }
                    }

                    function t(b) {
                        if (b) return {
                            alpha: n(b + 12),
                            color: n(b + 0)
                        }
                    }

                    function a(b) {
                        var D = l.TextureFormat[_[b + 4 >>> 2 >>> 0]];
                        return D ? {
                            format: D,
                            blend: t(m[b + 8 >>> 2 >>> 0]),
                            writeMask: m[b + 16 >>> 2 >>> 0]
                        } : void 0
                    }

                    function i(b, D) {
                        for (var C = [], O = 0; O < b; ++O) C.push(a(D + 24 * O));
                        return C
                    }

                    function o(b) {
                        return {
                            compare: l.CompareFunction[_[b >>> 2 >>> 0]],
                            failOp: l.StencilOperation[_[b + 4 >>> 2 >>> 0]],
                            depthFailOp: l.StencilOperation[_[b + 8 >>> 2 >>> 0]],
                            passOp: l.StencilOperation[_[b + 12 >>> 2 >>> 0]]
                        }
                    }

                    function s(b) {
                        if (b) return {
                            format: l.TextureFormat[_[b + 4 >>> 2 >>> 0]],
                            depthWriteEnabled: !!m[b + 8 >>> 2 >>> 0],
                            depthCompare: l.CompareFunction[_[b + 12 >>> 2 >>> 0]],
                            stencilFront: o(b + 16),
                            stencilBack: o(b + 32),
                            stencilReadMask: m[b + 48 >>> 2 >>> 0],
                            stencilWriteMask: m[b + 52 >>> 2 >>> 0],
                            depthBias: _[b + 56 >>> 2 >>> 0],
                            depthBiasSlopeScale: ee[b + 60 >>> 2 >>> 0],
                            depthBiasClamp: ee[b + 64 >>> 2 >>> 0]
                        }
                    }

                    function c(b) {
                        return {
                            format: l.VertexFormat[_[b + 4 >>> 2 >>> 0]],
                            offset: Ce(b + 8),
                            shaderLocation: m[b + 16 >>> 2 >>> 0]
                        }
                    }

                    function u(b, D) {
                        for (var C = [], O = 0; O < b; ++O) C.push(c(D + O * 24));
                        return C
                    }

                    function d(b) {
                        if (b) {
                            var D = l.VertexStepMode[_[b + 4 >>> 2 >>> 0]],
                                C = m[b + 16 >>> 2 >>> 0];
                            return !D && !C ? null : {
                                arrayStride: Ce(b + 8),
                                stepMode: D,
                                attributes: u(C, m[b + 20 >>> 2 >>> 0])
                            }
                        }
                    }

                    function p(b, D) {
                        if (b) {
                            for (var C = [], O = 0; O < b; ++O) C.push(d(D + O * 24));
                            return C
                        }
                    }

                    function x(b) {
                        if (b) {
                            var D = {
                                module: l.getJsObject(m[b + 4 >>> 2 >>> 0]),
                                constants: l.makePipelineConstants(m[b + 16 >>> 2 >>> 0], m[b + 20 >>> 2 >>> 0]),
                                buffers: p(m[b + 24 >>> 2 >>> 0], m[b + 28 >>> 2 >>> 0]),
                                entryPoint: l.makeStringFromOptionalStringView(b + 8)
                            };
                            return D
                        }
                    }

                    function B(b) {
                        if (b) return {
                            count: m[b + 4 >>> 2 >>> 0],
                            mask: m[b + 8 >>> 2 >>> 0],
                            alphaToCoverageEnabled: !!m[b + 12 >>> 2 >>> 0]
                        }
                    }

                    function k(b) {
                        if (b) {
                            var D = {
                                module: l.getJsObject(m[b + 4 >>> 2 >>> 0]),
                                constants: l.makePipelineConstants(m[b + 16 >>> 2 >>> 0], m[b + 20 >>> 2 >>> 0]),
                                targets: i(m[b + 24 >>> 2 >>> 0], m[b + 28 >>> 2 >>> 0]),
                                entryPoint: l.makeStringFromOptionalStringView(b + 8)
                            };
                            return D
                        }
                    }
                    var I = {
                        label: l.makeStringFromOptionalStringView(e + 4),
                        layout: l.makePipelineLayout(m[e + 12 >>> 2 >>> 0]),
                        vertex: x(e + 16),
                        primitive: r(e + 48),
                        depthStencil: s(m[e + 72 >>> 2 >>> 0]),
                        multisample: B(e + 76),
                        fragment: k(m[e + 92 >>> 2 >>> 0])
                    };
                    return I
                },
                fillLimitStruct: (e, r) => {
                    var n = m[r >>> 2 >>> 0];

                    function t(s, c, u, d = 0) {
                        var p = e[s] ?? d;
                        m[c + u >>> 2 >>> 0] = p
                    }

                    function a(s, c, u, d = 0) {
                        var p = e[s] ?? d;
                        ye(c + u, p)
                    }
                    if (t("maxTextureDimension1D", r, 4), t("maxTextureDimension2D", r, 8), t("maxTextureDimension3D", r, 12), t("maxTextureArrayLayers", r, 16), t("maxBindGroups", r, 20), t("maxBindGroupsPlusVertexBuffers", r, 24), t("maxBindingsPerBindGroup", r, 28), t("maxDynamicUniformBuffersPerPipelineLayout", r, 32), t("maxDynamicStorageBuffersPerPipelineLayout", r, 36), t("maxSampledTexturesPerShaderStage", r, 40), t("maxSamplersPerShaderStage", r, 44), t("maxStorageBuffersPerShaderStage", r, 48), t("maxStorageTexturesPerShaderStage", r, 52), t("maxUniformBuffersPerShaderStage", r, 56), t("minUniformBufferOffsetAlignment", r, 80), t("minStorageBufferOffsetAlignment", r, 84), a("maxUniformBufferBindingSize", r, 64), a("maxStorageBufferBindingSize", r, 72), t("maxVertexBuffers", r, 88), a("maxBufferSize", r, 96), t("maxVertexAttributes", r, 104), t("maxVertexBufferArrayStride", r, 108), t("maxInterStageShaderVariables", r, 112), t("maxColorAttachments", r, 116), t("maxColorAttachmentBytesPerSample", r, 120), t("maxComputeWorkgroupStorageSize", r, 124), t("maxComputeInvocationsPerWorkgroup", r, 128), t("maxComputeWorkgroupSizeX", r, 132), t("maxComputeWorkgroupSizeY", r, 136), t("maxComputeWorkgroupSizeZ", r, 140), t("maxComputeWorkgroupsPerDimension", r, 144), t("maxImmediateSize", r, 148), n !== 0) {
                        var i = _[n + 4 >>> 2 >>> 0],
                            o = n;
                        t("maxStorageBuffersInVertexStage", o, 8, e.maxStorageBuffersPerShaderStage), t("maxStorageBuffersInFragmentStage", o, 16, e.maxStorageBuffersPerShaderStage), t("maxStorageTexturesInVertexStage", o, 12, e.maxStorageTexturesPerShaderStage), t("maxStorageTexturesInFragmentStage", o, 20, e.maxStorageTexturesPerShaderStage)
                    }
                },
                fillAdapterInfoStruct: (e, r) => {
                    m[r + 52 >>> 2 >>> 0] = e.subgroupMinSize, m[r + 56 >>> 2 >>> 0] = e.subgroupMaxSize;
                    var n = e.vendor + e.architecture + e.device + e.description,
                        t = be(n),
                        a = te(e.vendor);
                    l.setStringView(r + 4, t, a), t += a;
                    var i = te(e.architecture);
                    l.setStringView(r + 12, t, i), t += i;
                    var o = te(e.device);
                    l.setStringView(r + 20, t, o), t += o;
                    var s = te(e.description);
                    l.setStringView(r + 28, t, s), t += s, _[r + 36 >>> 2 >>> 0] = 2;
                    var c = e.isFallbackAdapter ? 3 : 4;
                    _[r + 40 >>> 2 >>> 0] = c, m[r + 44 >>> 2 >>> 0] = 0, m[r + 48 >>> 2 >>> 0] = 0, l.iterateExtensions(r, {
                        327739: u => {
                            let d = 0,
                                p = 0;
                            if (e.subgroupMatrixConfigs) {
                                d = e.subgroupMatrixConfigs.length, p = H(d * 28);
                                for (const [x, B] of e.subgroupMatrixConfigs.entries()) {
                                    const k = p + x * 28,
                                        I = l.SubgroupMatrixComponentType.indexOf(B.componentType),
                                        b = l.SubgroupMatrixComponentType.indexOf(B.resultComponentType);
                                    _[k >>> 2 >>> 0] = I, _[k + 4 >>> 2 >>> 0] = b, m[k + 8 >>> 2 >>> 0] = B.M, m[k + 12 >>> 2 >>> 0] = B.N, m[k + 16 >>> 2 >>> 0] = B.K
                                }
                            }
                            m[u + 12 >>> 2 >>> 0] = p, m[u + 8 >>> 2 >>> 0] = d
                        }
                    })
                },
                AddressMode: [, "clamp-to-edge", "repeat", "mirror-repeat"],
                BlendFactor: [, "zero", "one", "src", "one-minus-src", "src-alpha", "one-minus-src-alpha", "dst", "one-minus-dst", "dst-alpha", "one-minus-dst-alpha", "src-alpha-saturated", "constant", "one-minus-constant", "src1", "one-minus-src1", "src1-alpha", "one-minus-src1-alpha"],
                BlendOperation: [, "add", "subtract", "reverse-subtract", "min", "max"],
                BufferBindingType: [, , "uniform", "storage", "read-only-storage"],
                BufferMapState: [, "unmapped", "pending", "mapped"],
                CompareFunction: [, "never", "less", "equal", "less-equal", "greater", "not-equal", "greater-equal", "always"],
                CompilationInfoRequestStatus: [, "success", "callback-cancelled"],
                ComponentSwizzle: [, "0", "1", "r", "g", "b", "a"],
                CompositeAlphaMode: [, "opaque", "premultiplied", "unpremultiplied", "inherit"],
                CullMode: [, "none", "front", "back"],
                ErrorFilter: [, "validation", "out-of-memory", "internal"],
                FeatureLevel: [, "compatibility", "core"],
                FeatureName: {
                    1: "core-features-and-limits",
                    2: "depth-clip-control",
                    3: "depth32float-stencil8",
                    4: "texture-compression-bc",
                    5: "texture-compression-bc-sliced-3d",
                    6: "texture-compression-etc2",
                    7: "texture-compression-astc",
                    8: "texture-compression-astc-sliced-3d",
                    9: "timestamp-query",
                    10: "indirect-first-instance",
                    11: "shader-f16",
                    12: "rg11b10ufloat-renderable",
                    13: "bgra8unorm-storage",
                    14: "float32-filterable",
                    15: "float32-blendable",
                    16: "clip-distances",
                    17: "dual-source-blending",
                    18: "subgroups",
                    19: "texture-formats-tier1",
                    20: "texture-formats-tier2",
                    21: "primitive-index",
                    22: "texture-component-swizzle",
                    23: "subgroup-size-control",
                    24: "texture-compression-unaligned",
                    25: "atomic-vec2u-min-max",
                    327692: "chromium-experimental-unorm16-texture-formats",
                    327729: "chromium-experimental-multi-draw-indirect",
                    327732: "chromium-experimental-subgroup-matrix"
                },
                FilterMode: [, "nearest", "linear"],
                FrontFace: [, "ccw", "cw"],
                IndexFormat: [, "uint16", "uint32"],
                InstanceFeatureName: [, "timed-wait-any", "shader-source-spirv", "multiple-devices-per-adapter"],
                LoadOp: [, "load", "clear"],
                MipmapFilterMode: [, "nearest", "linear"],
                OptionalBool: ["false", "true"],
                PowerPreference: [, "low-power", "high-performance"],
                PredefinedColorSpace: [, "srgb", "display-p3"],
                PrimitiveTopology: [, "point-list", "line-list", "line-strip", "triangle-list", "triangle-strip"],
                QueryType: [, "occlusion", "timestamp"],
                SamplerBindingType: [, , "filtering", "non-filtering", "comparison"],
                Status: [, "success", "error"],
                StencilOperation: [, "keep", "zero", "replace", "invert", "increment-clamp", "decrement-clamp", "increment-wrap", "decrement-wrap"],
                StorageTextureAccess: [, , "write-only", "read-only", "read-write"],
                StoreOp: [, "store", "discard"],
                SubgroupMatrixComponentType: [, "f32", "f16", "u32", "i32", "u8", "i8"],
                SurfaceGetCurrentTextureStatus: [, "success-optimal", "success-suboptimal", "timeout", "outdated", "lost", "error"],
                TextureAspect: [, "all", "stencil-only", "depth-only"],
                TextureDimension: [, "1d", "2d", "3d"],
                TextureFormat: [, "r8unorm", "r8snorm", "r8uint", "r8sint", "r16unorm", "r16snorm", "r16uint", "r16sint", "r16float", "rg8unorm", "rg8snorm", "rg8uint", "rg8sint", "r32float", "r32uint", "r32sint", "rg16unorm", "rg16snorm", "rg16uint", "rg16sint", "rg16float", "rgba8unorm", "rgba8unorm-srgb", "rgba8snorm", "rgba8uint", "rgba8sint", "bgra8unorm", "bgra8unorm-srgb", "rgb10a2uint", "rgb10a2unorm", "rg11b10ufloat", "rgb9e5ufloat", "rg32float", "rg32uint", "rg32sint", "rgba16unorm", "rgba16snorm", "rgba16uint", "rgba16sint", "rgba16float", "rgba32float", "rgba32uint", "rgba32sint", "stencil8", "depth16unorm", "depth24plus", "depth24plus-stencil8", "depth32float", "depth32float-stencil8", "bc1-rgba-unorm", "bc1-rgba-unorm-srgb", "bc2-rgba-unorm", "bc2-rgba-unorm-srgb", "bc3-rgba-unorm", "bc3-rgba-unorm-srgb", "bc4-r-unorm", "bc4-r-snorm", "bc5-rg-unorm", "bc5-rg-snorm", "bc6h-rgb-ufloat", "bc6h-rgb-float", "bc7-rgba-unorm", "bc7-rgba-unorm-srgb", "etc2-rgb8unorm", "etc2-rgb8unorm-srgb", "etc2-rgb8a1unorm", "etc2-rgb8a1unorm-srgb", "etc2-rgba8unorm", "etc2-rgba8unorm-srgb", "eac-r11unorm", "eac-r11snorm", "eac-rg11unorm", "eac-rg11snorm", "astc-4x4-unorm", "astc-4x4-unorm-srgb", "astc-5x4-unorm", "astc-5x4-unorm-srgb", "astc-5x5-unorm", "astc-5x5-unorm-srgb", "astc-6x5-unorm", "astc-6x5-unorm-srgb", "astc-6x6-unorm", "astc-6x6-unorm-srgb", "astc-8x5-unorm", "astc-8x5-unorm-srgb", "astc-8x6-unorm", "astc-8x6-unorm-srgb", "astc-8x8-unorm", "astc-8x8-unorm-srgb", "astc-10x5-unorm", "astc-10x5-unorm-srgb", "astc-10x6-unorm", "astc-10x6-unorm-srgb", "astc-10x8-unorm", "astc-10x8-unorm-srgb", "astc-10x10-unorm", "astc-10x10-unorm-srgb", "astc-12x10-unorm", "astc-12x10-unorm-srgb", "astc-12x12-unorm", "astc-12x12-unorm-srgb"],
                TextureSampleType: [, , "float", "unfilterable-float", "depth", "sint", "uint"],
                TextureViewDimension: [, "1d", "2d", "2d-array", "cube", "cube-array", "3d"],
                ToneMappingMode: [, "standard", "extended"],
                VertexFormat: [, "uint8", "uint8x2", "uint8x4", "sint8", "sint8x2", "sint8x4", "unorm8", "unorm8x2", "unorm8x4", "snorm8", "snorm8x2", "snorm8x4", "uint16", "uint16x2", "uint16x4", "sint16", "sint16x2", "sint16x4", "unorm16", "unorm16x2", "unorm16x4", "snorm16", "snorm16x2", "snorm16x4", "float16", "float16x2", "float16x4", "float32", "float32x2", "float32x3", "float32x4", "uint32", "uint32x2", "uint32x3", "uint32x4", "sint32", "sint32x2", "sint32x3", "sint32x4", "unorm10-10-10-2", "unorm8x4-bgra", "snorm10-10-10-2"],
                VertexStepMode: [, "vertex", "instance"],
                WGSLLanguageFeatureName: [, "readonly_and_readwrite_storage_textures", "packed_4x8_integer_dot_product", "unrestricted_pointer_parameters", "pointer_composite_access", "uniform_buffer_standard_layout", "subgroup_id", "texture_and_sampler_let", "subgroup_uniformity", "texture_formats_tier1", "linear_indexing", "immediate_address_space", "buffer_view", "swizzle_assignment", "fragment_depth"]
            };

        function fc() {
            return l.preinitializedDeviceId === void 0 && (l.preinitializedDeviceId = l.importJsDevice(f.preinitializedWebGPUDevice), Pr(l.preinitializedDeviceId)), Pr(l.preinitializedDeviceId), l.preinitializedDeviceId
        }
        var ur = new Et,
            ie = {
                socketEvent: null,
                getSocket(e) {
                    return ur.has(e) ? ur.get(e) : 0
                },
                getSocketEvent(e) {
                    return this.socketEvent || (this.socketEvent = H(520)), m[this.socketEvent >>> 2 >>> 0] = e, this.socketEvent
                }
            };

        function Ot(e, r, n) {
            if (E) return R(34, 0, 1, e, r, n);
            n >>>= 0;
            var t = ie.getSocket(e);
            if (!t) return -3;
            var a = n ? T(n) : void 0;
            return n ? t.close(r || void 0, T(n)) : r ? t.close(r) : t.close(), 0
        }

        function Mt(e) {
            if (E) return R(35, 0, 1, e);
            var r = ie.getSocket(e);
            return r ? (r.onopen = r.onerror = r.onclose = r.onmessage = null, ur.free(e), 0) : -3
        }

        function Rt(e) {
            if (E) return R(36, 0, 1, e);
            if (e >>>= 0, !globalThis.WebSocket) return -1;
            if (!e) return -5;
            var r = T(m[e >>> 2 >>> 0]),
                n = m[e + 4 >>> 2 >>> 0],
                t = n ? new WebSocket(r, T(n).split(",")) : new WebSocket(r);
            t.binaryType = "arraybuffer";
            var a = ur.allocate(t);
            return a
        }

        function Lt(e, r, n) {
            if (E) return R(37, 0, 1, e, r, n);
            r >>>= 0;
            var t = ie.getSocket(e);
            return t ? (t.send(W.slice(r, r + n)), 0) : -3
        }

        function Wt(e, r) {
            if (E) return R(38, 0, 1, e, r);
            r >>>= 0;
            var n = ie.getSocket(e);
            if (!n) return -3;
            var t = T(r);
            return n.send(t), 0
        }

        function jt(e, r, n, t) {
            if (E) return R(39, 0, 1, e, r, n, t);
            r >>>= 0, n >>>= 0, t >>>= 0;
            var a = ie.getSocket(e);
            return a ? (a.onclose = i => {
                var o = ie.getSocketEvent(e);
                L[o + 4 >>> 0] = i.wasClean, ne[o + 6 >>> 1 >>> 0] = i.code, P(i.reason, o + 8, 512), $(n)(0, o, r)
            }, 0) : -3
        }

        function Ut(e, r, n, t) {
            if (E) return R(40, 0, 1, e, r, n, t);
            r >>>= 0, n >>>= 0, t >>>= 0;
            var a = ie.getSocket(e);
            return a ? (a.onerror = i => {
                var o = ie.getSocketEvent(e);
                $(n)(0, o, r)
            }, 0) : -3
        }

        function Gt(e, r, n, t) {
            if (E) return R(41, 0, 1, e, r, n, t);
            r >>>= 0, n >>>= 0, t >>>= 0;
            var a = ie.getSocket(e);
            return a ? (a.onmessage = i => {
                var o = typeof i.data == "string";
                if (o) var s = be(i.data),
                    c = te(i.data) + 1;
                else {
                    var c = i.data.byteLength,
                        s = H(c);
                    L.set(new Uint8Array(i.data), s >>> 0)
                }
                var u = ie.getSocketEvent(e);
                m[u + 4 >>> 2 >>> 0] = s, _[u + 8 >>> 2 >>> 0] = c, L[u + 12 >>> 0] = o, $(n)(0, u, r), Y(s)
            }, 0) : -3
        }

        function Vt(e, r, n, t) {
            if (E) return R(42, 0, 1, e, r, n, t);
            r >>>= 0, n >>>= 0, t >>>= 0;
            var a = ie.getSocket(e);
            return a ? (a.onopen = i => {
                var o = ie.getSocketEvent(e);
                $(n)(0, o, r)
            }, 0) : -3
        }
        var He = e => {
            He.shown || (He.shown = {}), He.shown[e] || (He.shown[e] = 1, X(e))
        };

        function dc(e, r, n) {
            e >>>= 0, r >>>= 0, n >>>= 0;
            var t = l.getJsObject(e);
            n == 4294967295 && (n = void 0);
            var a;
            try {
                a = t.getMappedRange(r, n)
            } catch {
                return 0
            }
            var i = Vi(16, a.byteLength);
            return W.set(new Uint8Array(a), i >>> 0), l.Internals.bufferOnUnmaps[e].push(() => Y(i)), i
        }
        var _c = function(e, r, n, t, a) {
            e >>>= 0, r = Q(r), n = Q(n), t >>>= 0, a >>>= 0;
            var i = l.getJsObject(e);
            l.Internals.bufferOnUnmaps[e] = [], a == 4294967295 && (a = void 0), ve(), l.Internals.futureInsert(r, i.mapAsync(n, t, a).then(() => {
                _e(), ge(() => {
                    zr(r, 1, 0)
                })
            }, o => {
                _e(), ge(() => {
                    var s = Ye(),
                        c = lr(o.message),
                        u = o.name === "AbortError" ? 4 : o.name === "OperationError" ? 3 : 0;
                    zr(r, u, c), delete l.Internals.bufferOnUnmaps[e]
                })
            }))
        };

        function mc(e) {
            e >>>= 0;
            var r = l.getJsObject(e),
                n = l.Internals.bufferOnUnmaps[e];
            if (n) {
                for (var t = 0; t < n.length; ++t) n[t]();
                delete l.Internals.bufferOnUnmaps[e], r.unmap()
            }
        }

        function pc(e) {
            e >>>= 0, delete l.Internals.jsObjects[e]
        }

        function gc(e, r, n) {
            e >>>= 0, r >>>= 0, n >>>= 0;
            var t = !!m[r + 32 >>> 2 >>> 0],
                a = {
                    label: l.makeStringFromOptionalStringView(r + 4),
                    usage: m[r + 16 >>> 2 >>> 0],
                    size: Ce(r + 24),
                    mappedAtCreation: t
                },
                i = l.getJsObject(e),
                o;
            try {
                o = i.createBuffer(a)
            } catch {
                return !1
            }
            return l.Internals.jsObjectInsert(n, o), t && (l.Internals.bufferOnUnmaps[n] = []), !0
        }

        function vc(e, r, n) {
            e >>>= 0, r >>>= 0, n >>>= 0;
            var t = m[r >>> 2 >>> 0],
                a = _[t + 4 >>> 2 >>> 0],
                i = {
                    label: l.makeStringFromOptionalStringView(r + 4),
                    code: ""
                };
            switch (a) {
                case 2: {
                    i.code = l.makeStringFromStringView(t + 8);
                    break
                }
            }
            var o = l.getJsObject(e);
            l.Internals.jsObjectInsert(n, o.createShaderModule(i))
        }
        var bc = e => {
                const r = l.getJsObject(e);
                r.onuncapturederror = null, r.destroy()
            },
            hc = {
                rgba8unorm: 22,
                bgra8unorm: 27
            },
            wc = () => {
                var e = navigator.gpu.getPreferredCanvasFormat();
                return hc[e]
            },
            xc = {
                error: 1,
                warning: 2,
                info: 3
            },
            yc = function(e, r, n) {
                e >>>= 0, r = Q(r), n >>>= 0;
                var t = l.getJsObject(e);
                ve(), l.Internals.futureInsert(r, t.getCompilationInfo().then(a => {
                    _e(), ge(() => {
                        const i = a.messages.length;
                        if (m[n + 4 >>> 2 >>> 0] = i, i) {
                            for (var o = 1, s = [], c = 0; c < i; ++c) {
                                var u = te(a.messages[c].message);
                                o += u, s.push(u)
                            }
                            var d = H(o),
                                p = H(48 * i);
                            m[n + 8 >>> 2 >>> 0] = p;
                            for (var x = H(32 * i), c = 0; c < i; ++c) {
                                var B = a.messages[c],
                                    k = p + 48 * c,
                                    I = x + 32 * c;
                                l.setStringView(k + 4, d, s[c]), m[k >>> 2 >>> 0] = I, _[k + 12 >>> 2 >>> 0] = xc[B.type], Z[k + 16 >>> 3 >>> 0] = BigInt(B.lineNum), Z[k + 24 >>> 3 >>> 0] = BigInt(B.linePos), Z[k + 32 >>> 3 >>> 0] = BigInt(B.offset), Z[k + 40 >>> 3 >>> 0] = BigInt(B.length), m[I >>> 2 >>> 0] = 0, _[I + 4 >>> 2 >>> 0] = 327743, Z[I + 8 >>> 3 >>> 0] = BigInt(B.linePos), Z[I + 16 >>> 3 >>> 0] = BigInt(B.offset), Z[I + 24 >>> 3 >>> 0] = BigInt(B.length), P(B.message, d, s[c] + 1), d += s[c]
                            }
                        }
                        Di(r, 1, n)
                    })
                }, () => {
                    Ie("Unexpected failure in GPUShaderModule.getCompilationInfo().")
                }))
            },
            Rr = {},
            Cc = () => Ge,
            ze = () => {
                if (!ze.strings) {
                    var e = (globalThis.navigator?.language ?? "C").replace("-", "_") + ".UTF-8",
                        r = {
                            USER: "web_user",
                            LOGNAME: "web_user",
                            PATH: "/",
                            PWD: "/",
                            HOME: "/home/web_user",
                            LANG: e,
                            _: Cc()
                        };
                    for (var n in Rr) Rr[n] === void 0 ? delete r[n] : r[n] = Rr[n];
                    var t = [];
                    for (var n in r) t.push(`${n}=${r[n]}`);
                    ze.strings = t
                }
                return ze.strings
            };

        function Pt(e, r) {
            if (E) return R(43, 0, 1, e, r);
            e >>>= 0, r >>>= 0;
            var n = 0,
                t = 0;
            for (var a of ze()) {
                var i = r + n;
                m[e + t >>> 2 >>> 0] = i, n += P(a, i, 1 / 0) + 1, t += 4
            }
            return 0
        }

        function Nt(e, r) {
            if (E) return R(44, 0, 1, e, r);
            e >>>= 0, r >>>= 0;
            var n = ze();
            m[e >>> 2 >>> 0] = n.length;
            var t = 0;
            for (var a of n) t += te(a) + 1;
            return m[r >>> 2 >>> 0] = t, 0
        }

        function Jt(e, r, n, t, a) {
            return E ? R(45, 0, 1, e, r, n, t, a) : (r >>>= 0, n >>>= 0, t = Q(t), a >>>= 0, 52)
        }
        var Sc = e => v.activeTexture(e),
            kc = Sc,
            Tc = (e, r) => {
                v.attachShader(g.programs[e], g.shaders[r])
            },
            Bc = Tc;

        function Ac(e, r, n) {
            n >>>= 0, v.bindAttribLocation(g.programs[e], r, T(n))
        }
        var Ec = Ac,
            Fc = (e, r) => {
                if (r && !g.buffers[r]) {
                    var n = v.createBuffer();
                    n.name = r, g.buffers[r] = n
                }
                e == 34962 ? v.currentArrayBufferBinding = r : e == 34963 && (v.currentElementArrayBufferBinding = r), e == 35051 ? v.currentPixelPackBufferBinding = r : e == 35052 && (v.currentPixelUnpackBufferBinding = r), v.bindBuffer(e, g.buffers[r])
            },
            Ic = Fc,
            Dc = (e, r, n) => {
                v.bindBufferBase(e, r, g.buffers[n])
            },
            Oc = Dc;

        function Mc(e, r, n, t, a) {
            t >>>= 0, a >>>= 0, v.bindBufferRange(e, r, g.buffers[n], t, a)
        }
        var Rc = Mc,
            Lc = (e, r) => {
                v.bindFramebuffer(e, g.framebuffers[r])
            },
            Wc = Lc,
            jc = (e, r) => {
                v.bindRenderbuffer(e, g.renderbuffers[r])
            },
            Uc = jc,
            Gc = (e, r) => {
                v.bindTexture(e, g.textures[r])
            },
            Vc = Gc,
            Pc = e => {
                v.bindVertexArray(g.vaos[e]);
                var r = v.getParameter(34965);
                v.currentElementArrayBufferBinding = r ? r.name | 0 : 0
            },
            Nc = Pc,
            Jc = (e, r) => v.blendFunc(e, r),
            Hc = Jc,
            zc = (e, r, n, t) => v.blendFuncSeparate(e, r, n, t),
            $c = zc,
            qc = (e, r, n, t, a, i, o, s, c, u) => v.blitFramebuffer(e, r, n, t, a, i, o, s, c, u),
            Xc = qc;

        function Kc(e, r, n, t) {
            r >>>= 0, n >>>= 0, v.bufferData(e, n ? W.subarray(n >>> 0, n + r >>> 0) : r, t)
        }
        var Yc = Kc;

        function Qc(e, r, n, t) {
            return r >>>= 0, n >>>= 0, t >>>= 0, cr(e, r, n, t)
        }
        var Zc = Qc,
            el = e => v.checkFramebufferStatus(e),
            rl = el,
            nl = e => v.clear(e),
            tl = nl,
            al = (e, r, n, t) => v.clearBufferfi(e, r, n, t),
            il = al;

        function ol(e, r, n) {
            n >>>= 0, v.clearBufferfv(e, r, ee, n >>> 2)
        }
        var sl = ol;

        function cl(e, r, n) {
            n >>>= 0, v.clearBufferiv(e, r, _, n >>> 2)
        }
        var ll = cl,
            ul = (e, r, n, t) => v.clearColor(e, r, n, t),
            fl = ul,
            dl = e => v.clearDepth(e),
            _l = dl,
            ml = e => v.clearStencil(e),
            pl = ml;

        function gl(e, r, n) {
            return e >>>= 0, n = Number(n), v.clientWaitSync(g.syncs[e], r, n)
        }
        var vl = gl,
            bl = (e, r) => {
                v.extClipControl.clipControlEXT(e, r)
            },
            hl = bl,
            wl = (e, r, n, t) => {
                v.colorMask(!!e, !!r, !!n, !!t)
            },
            xl = wl,
            yl = e => {
                v.compileShader(g.shaders[e])
            },
            Cl = yl;

        function Sl(e, r, n, t, a, i, o, s) {
            if (s >>>= 0, v.currentPixelUnpackBufferBinding || !o) {
                v.compressedTexImage2D(e, r, n, t, a, i, o, s);
                return
            }
            v.compressedTexImage2D(e, r, n, t, a, i, W.subarray(s >>> 0, s + o >>> 0))
        }
        var kl = Sl;

        function Tl(e, r, n, t, a, i, o, s, c) {
            c >>>= 0, v.currentPixelUnpackBufferBinding ? v.compressedTexImage3D(e, r, n, t, a, i, o, s, c) : v.compressedTexImage3D(e, r, n, t, a, i, o, W, c, s)
        }
        var Bl = Tl;

        function Al(e, r, n, t, a, i, o, s, c) {
            if (c >>>= 0, v.currentPixelUnpackBufferBinding || !s) {
                v.compressedTexSubImage2D(e, r, n, t, a, i, o, s, c);
                return
            }
            v.compressedTexSubImage2D(e, r, n, t, a, i, o, W.subarray(c >>> 0, c + s >>> 0))
        }
        var El = Al;

        function Fl(e, r, n, t, a, i, o, s, c, u, d) {
            d >>>= 0, v.currentPixelUnpackBufferBinding ? v.compressedTexSubImage3D(e, r, n, t, a, i, o, s, c, u, d) : v.compressedTexSubImage3D(e, r, n, t, a, i, o, s, c, W, d, u)
        }
        var Il = Fl,
            Dl = (e, r, n, t, a, i, o, s) => v.copyTexSubImage2D(e, r, n, t, a, i, o, s),
            Ol = Dl,
            Ml = () => {
                var e = g.getNewId(g.programs),
                    r = v.createProgram();
                return r.name = e, r.maxUniformLength = r.maxAttributeLength = r.maxUniformBlockNameLength = 0, r.uniformIdCounter = 1, g.programs[e] = r, e
            },
            Rl = Ml,
            Ll = e => {
                var r = g.getNewId(g.shaders);
                return g.shaders[r] = v.createShader(e), r
            },
            Wl = Ll,
            jl = e => v.cullFace(e),
            Ul = jl;

        function Gl(e, r) {
            r >>>= 0;
            for (var n = 0; n < e; n++) {
                var t = _[r + n * 4 >>> 2 >>> 0],
                    a = g.buffers[t];
                a && (v.deleteBuffer(a), a.name = 0, g.buffers[t] = null, t == v.currentArrayBufferBinding && (v.currentArrayBufferBinding = 0), t == v.currentElementArrayBufferBinding && (v.currentElementArrayBufferBinding = 0), t == v.currentPixelPackBufferBinding && (v.currentPixelPackBufferBinding = 0), t == v.currentPixelUnpackBufferBinding && (v.currentPixelUnpackBufferBinding = 0))
            }
        }
        var Vl = Gl;

        function Pl(e, r) {
            r >>>= 0;
            for (var n = 0; n < e; ++n) {
                var t = _[r + n * 4 >>> 2 >>> 0],
                    a = g.framebuffers[t];
                a && (v.deleteFramebuffer(a), a.name = 0, g.framebuffers[t] = null)
            }
        }
        var Nl = Pl,
            Jl = e => {
                if (e) {
                    var r = g.programs[e];
                    if (!r) {
                        g.recordError(1281);
                        return
                    }
                    v.deleteProgram(r), r.name = 0, g.programs[e] = null
                }
            },
            Hl = Jl;

        function zl(e, r) {
            r >>>= 0;
            for (var n = 0; n < e; n++) {
                var t = _[r + n * 4 >>> 2 >>> 0],
                    a = g.renderbuffers[t];
                a && (v.deleteRenderbuffer(a), a.name = 0, g.renderbuffers[t] = null)
            }
        }
        var $l = zl,
            ql = e => {
                if (e) {
                    var r = g.shaders[e];
                    if (!r) {
                        g.recordError(1281);
                        return
                    }
                    v.deleteShader(r), g.shaders[e] = null
                }
            },
            Xl = ql;

        function Kl(e) {
            if (e >>>= 0, !!e) {
                var r = g.syncs[e];
                if (!r) {
                    g.recordError(1281);
                    return
                }
                v.deleteSync(r), r.name = 0, g.syncs[e] = null
            }
        }
        var Yl = Kl;

        function Ql(e, r) {
            r >>>= 0;
            for (var n = 0; n < e; n++) {
                var t = _[r + n * 4 >>> 2 >>> 0],
                    a = g.textures[t];
                a && (v.deleteTexture(a), a.name = 0, g.textures[t] = null)
            }
        }
        var Zl = Ql;

        function eu(e, r) {
            r >>>= 0;
            for (var n = 0; n < e; n++) {
                var t = _[r + n * 4 >>> 2 >>> 0];
                v.deleteVertexArray(g.vaos[t]), g.vaos[t] = null
            }
        }
        var ru = eu,
            nu = e => v.depthFunc(e),
            tu = nu,
            au = e => {
                v.depthMask(!!e)
            },
            iu = au,
            ou = e => v.disable(e),
            su = ou,
            cu = e => {
                var r = g.currentContext.clientBuffers[e];
                r.enabled = !1, v.disableVertexAttribArray(e)
            },
            lu = cu,
            uu = (e, r, n) => {
                g.preDrawHandleClientVertexAttribBindings(r + n), v.drawArrays(e, r, n), g.postDrawHandleClientVertexAttribBindings()
            },
            fu = uu,
            du = (e, r, n, t) => {
                v.drawArraysInstanced(e, r, n, t)
            },
            _u = du,
            Lr = [];

        function mu(e, r) {
            r >>>= 0;
            for (var n = Lr[e], t = 0; t < e; t++) n[t] = _[r + t * 4 >>> 2 >>> 0];
            v.drawBuffers(n)
        }
        var pu = mu;

        function gu(e, r, n, t) {
            t >>>= 0;
            var a, i = 0;
            if (!v.currentElementArrayBufferBinding) {
                var o = g.calcBufLength(1, n, 0, r);
                if (a = g.getTempIndexBuffer(o), v.bindBuffer(34963, a), cr(34963, 0, o, t), r > 0)
                    for (var s = 0; s < g.currentContext.maxVertexAttribs; ++s) {
                        var c = g.currentContext.clientBuffers[s];
                        if (c.clientside && c.enabled) {
                            let u;
                            switch (n) {
                                case 5121:
                                    u = Uint8Array;
                                    break;
                                case 5123:
                                    u = Uint16Array;
                                    break;
                                case 5125:
                                    u = Uint32Array;
                                    break;
                                default:
                                    g.recordError(1282);
                                    return
                            }
                            i = new u(W.buffer, t, r).reduce((d, p) => Math.max(d, p)) + 1;
                            break
                        }
                    }
                t = 0
            }
            g.preDrawHandleClientVertexAttribBindings(i), v.drawElements(e, r, n, t), g.postDrawHandleClientVertexAttribBindings(r), v.currentElementArrayBufferBinding || v.bindBuffer(34963, null)
        }
        var vu = gu;

        function bu(e, r, n, t, a) {
            t >>>= 0, v.drawElementsInstanced(e, r, n, t, a)
        }
        var hu = bu,
            wu = e => v.enable(e),
            xu = wu,
            yu = e => {
                var r = g.currentContext.clientBuffers[e];
                r.enabled = !0, v.enableVertexAttribArray(e)
            },
            Cu = yu;

        function Su(e, r) {
            var n = v.fenceSync(e, r);
            if (n) {
                var t = g.getNewId(g.syncs);
                return n.name = t, g.syncs[t] = n, t
            }
            return 0
        }
        var ku = Su,
            Tu = (e, r, n, t) => {
                v.framebufferRenderbuffer(e, r, n, g.renderbuffers[t])
            },
            Bu = Tu,
            Au = (e, r, n, t, a) => {
                v.framebufferTexture2D(e, r, n, g.textures[t], a)
            },
            Eu = Au,
            Fu = (e, r, n, t, a) => {
                v.framebufferTextureLayer(e, r, g.textures[n], t, a)
            },
            Iu = Fu;

        function Du(e, r) {
            r >>>= 0, g.genObject(e, r, "createBuffer", g.buffers)
        }
        var Ou = Du;

        function Mu(e, r) {
            r >>>= 0, g.genObject(e, r, "createFramebuffer", g.framebuffers)
        }
        var Ru = Mu;

        function Lu(e, r) {
            r >>>= 0, g.genObject(e, r, "createRenderbuffer", g.renderbuffers)
        }
        var Wu = Lu;

        function ju(e, r) {
            r >>>= 0, g.genObject(e, r, "createTexture", g.textures)
        }
        var Uu = ju;

        function Gu(e, r) {
            r >>>= 0, g.genObject(e, r, "createVertexArray", g.vaos)
        }
        var Vu = Gu,
            Pu = e => v.generateMipmap(e),
            Nu = Pu,
            Ju = (e, r, n, t, a, i, o, s) => {
                r = g.programs[r];
                var c = v[e](r, n);
                if (c) {
                    var u = s && P(c.name, s, t);
                    a && (_[a >>> 2 >>> 0] = u), i && (_[i >>> 2 >>> 0] = c.size), o && (_[o >>> 2 >>> 0] = c.type)
                }
            };

        function Hu(e, r, n, t, a, i, o) {
            return t >>>= 0, a >>>= 0, i >>>= 0, o >>>= 0, Ju("getActiveUniform", e, r, n, t, a, i, o)
        }
        var zu = Hu;

        function $u(e, r, n, t) {
            if (t >>>= 0, !t) {
                g.recordError(1281);
                return
            }
            if (e = g.programs[e], n == 35393) {
                var a = v.getActiveUniformBlockName(e, r);
                _[t >>> 2 >>> 0] = a.length + 1;
                return
            }
            var i = v.getActiveUniformBlockParameter(e, r, n);
            if (i !== null)
                if (n == 35395)
                    for (var o = 0; o < i.length; o++) _[t + o * 4 >>> 2 >>> 0] = i[o];
                else _[t >>> 2 >>> 0] = i
        }
        var qu = $u,
            Xu = () => {
                var e = v.getError() || g.lastError;
                return g.lastError = 0, e
            },
            Ku = Xu,
            Ht = () => {
                var e = It(v);
                return e = e.concat(e.map(r => "GL_" + r)), e
            },
            Yu = (e, r, n) => {
                if (!r) {
                    g.recordError(1281);
                    return
                }
                var t = void 0;
                switch (e) {
                    case 36346:
                        t = 1;
                        break;
                    case 36344:
                        n != 0 && n != 1 && g.recordError(1280);
                        return;
                    case 34814:
                    case 36345:
                        t = 0;
                        break;
                    case 34466:
                        var a = v.getParameter(34467);
                        t = a ? a.length : 0;
                        break;
                    case 33309:
                        if (g.currentContext.version < 2) {
                            g.recordError(1282);
                            return
                        }
                        t = Ht().length;
                        break;
                    case 33307:
                    case 33308:
                        if (g.currentContext.version < 2) {
                            g.recordError(1280);
                            return
                        }
                        t = e == 33307 ? 3 : 0;
                        break
                }
                if (t === void 0) {
                    var i = v.getParameter(e);
                    switch (typeof i) {
                        case "number":
                            t = i;
                            break;
                        case "boolean":
                            t = i ? 1 : 0;
                            break;
                        case "string":
                            g.recordError(1280);
                            return;
                        case "object":
                            if (i === null) switch (e) {
                                case 34964:
                                case 35725:
                                case 34965:
                                case 36006:
                                case 36007:
                                case 32873:
                                case 34229:
                                case 36662:
                                case 36663:
                                case 35053:
                                case 35055:
                                case 36010:
                                case 35097:
                                case 35869:
                                case 32874:
                                case 36389:
                                case 35983:
                                case 35368:
                                case 34068: {
                                    t = 0;
                                    break
                                }
                                default: {
                                    g.recordError(1280);
                                    return
                                }
                            } else if (i instanceof Float32Array || i instanceof Uint32Array || i instanceof Int32Array || i instanceof Array) {
                                for (var o = 0; o < i.length; ++o) switch (n) {
                                    case 0:
                                        _[r + o * 4 >>> 2 >>> 0] = i[o];
                                        break;
                                    case 2:
                                        ee[r + o * 4 >>> 2 >>> 0] = i[o];
                                        break;
                                    case 4:
                                        L[r + o >>> 0] = i[o] ? 1 : 0;
                                        break
                                }
                                return
                            } else try {
                                t = i.name | 0
                            } catch (s) {
                                g.recordError(1280), X(`GL_INVALID_ENUM in glGet${n}v: Unknown object returned from WebGL getParameter(${e})! (error: ${s})`);
                                return
                            }
                            break;
                        default:
                            g.recordError(1280), X(`GL_INVALID_ENUM in glGet${n}v: Native code calling glGet${n}v(${e}) and it returns ${i} of type ${typeof i}!`);
                            return
                    }
                }
                switch (n) {
                    case 1:
                        ye(r, t);
                        break;
                    case 0:
                        _[r >>> 2 >>> 0] = t;
                        break;
                    case 2:
                        ee[r >>> 2 >>> 0] = t;
                        break;
                    case 4:
                        L[r >>> 0] = t ? 1 : 0;
                        break
                }
            };

        function Qu(e, r) {
            return r >>>= 0, Yu(e, r, 0)
        }
        var Zu = Qu;

        function ef(e, r, n, t) {
            n >>>= 0, t >>>= 0;
            var a = v.getProgramInfoLog(g.programs[e]);
            a === null && (a = "(unknown error)");
            var i = r > 0 && t ? P(a, t, r) : 0;
            n && (_[n >>> 2 >>> 0] = i)
        }
        var rf = ef;

        function nf(e, r, n) {
            if (n >>>= 0, !n) {
                g.recordError(1281);
                return
            }
            if (e >= g.counter) {
                g.recordError(1281);
                return
            }
            if (e = g.programs[e], r == 35716) {
                var t = v.getProgramInfoLog(e);
                t === null && (t = "(unknown error)"), _[n >>> 2 >>> 0] = t.length + 1
            } else if (r == 35719) {
                if (!e.maxUniformLength)
                    for (var a = v.getProgramParameter(e, 35718), i = 0; i < a; ++i) e.maxUniformLength = Math.max(e.maxUniformLength, v.getActiveUniform(e, i).name.length + 1);
                _[n >>> 2 >>> 0] = e.maxUniformLength
            } else if (r == 35722) {
                if (!e.maxAttributeLength)
                    for (var o = v.getProgramParameter(e, 35721), i = 0; i < o; ++i) e.maxAttributeLength = Math.max(e.maxAttributeLength, v.getActiveAttrib(e, i).name.length + 1);
                _[n >>> 2 >>> 0] = e.maxAttributeLength
            } else if (r == 35381) {
                if (!e.maxUniformBlockNameLength)
                    for (var s = v.getProgramParameter(e, 35382), i = 0; i < s; ++i) e.maxUniformBlockNameLength = Math.max(e.maxUniformBlockNameLength, v.getActiveUniformBlockName(e, i).length + 1);
                _[n >>> 2 >>> 0] = e.maxUniformBlockNameLength
            } else _[n >>> 2 >>> 0] = v.getProgramParameter(e, r)
        }
        var tf = nf;

        function af(e, r, n, t) {
            n >>>= 0, t >>>= 0;
            var a = v.getShaderInfoLog(g.shaders[e]);
            a === null && (a = "(unknown error)");
            var i = r > 0 && t ? P(a, t, r) : 0;
            n && (_[n >>> 2 >>> 0] = i)
        }
        var of = af;

        function sf(e, r, n) {
            if (n >>>= 0, !n) {
                g.recordError(1281);
                return
            }
            if (r == 35716) {
                var t = v.getShaderInfoLog(g.shaders[e]);
                t === null && (t = "(unknown error)");
                var a = t ? t.length + 1 : 0;
                _[n >>> 2 >>> 0] = a
            } else if (r == 35720) {
                var i = v.getShaderSource(g.shaders[e]),
                    o = i ? i.length + 1 : 0;
                _[n >>> 2 >>> 0] = o
            } else _[n >>> 2 >>> 0] = v.getShaderParameter(g.shaders[e], r)
        }
        var cf = sf;

        function lf(e) {
            var r = g.stringCache[e];
            if (!r) {
                switch (e) {
                    case 7939:
                        r = be(Ht().join(" "));
                        break;
                    case 7936:
                    case 7937:
                    case 37445:
                    case 37446:
                        var n = v.getParameter(e);
                        n || g.recordError(1280), r = n ? be(n) : 0;
                        break;
                    case 7938:
                        var t = v.getParameter(7938),
                            a = `OpenGL ES 2.0 (${t})`;
                        a = `OpenGL ES 3.0 (${t})`, r = be(a);
                        break;
                    case 35724:
                        var i = v.getParameter(35724),
                            o = /^WebGL GLSL ES ([0-9]\.[0-9][0-9]?)(?:$| .*)/,
                            s = i.match(o);
                        s !== null && (s[1].length == 3 && (s[1] = s[1] + "0"), i = `OpenGL ES GLSL ES ${s[1]} (${i})`), r = be(i);
                        break;
                    default:
                        g.recordError(1280)
                }
                g.stringCache[e] = r
            }
            return r
        }
        var uf = lf;

        function ff(e, r) {
            return r >>>= 0, v.getUniformBlockIndex(g.programs[e], T(r))
        }
        var df = ff,
            _f = e => parseInt(e),
            zt = e => e.slice(-1) == "]" && e.lastIndexOf("["),
            mf = e => {
                var r = e.uniformLocsById,
                    n = e.uniformSizeAndIdsByName,
                    t, a;
                if (!r) {
                    e.uniformLocsById = r = {}, e.uniformArrayNamesById = {};
                    var i = v.getProgramParameter(e, 35718);
                    for (t = 0; t < i; ++t) {
                        var o = v.getActiveUniform(e, t),
                            s = o.name,
                            c = o.size,
                            u = zt(s),
                            d = u > 0 ? s.slice(0, u) : s,
                            p = e.uniformIdCounter;
                        for (e.uniformIdCounter += c, n[d] = [c, p], a = 0; a < c; ++a) r[p] = a, e.uniformArrayNamesById[p++] = d
                    }
                }
            };

        function pf(e, r) {
            if (r >>>= 0, r = T(r), e = g.programs[e]) {
                mf(e);
                var n = e.uniformLocsById,
                    t = 0,
                    a = r,
                    i = zt(r);
                i > 0 && (t = _f(r.slice(i + 1)) >>> 0, a = r.slice(0, i));
                var o = e.uniformSizeAndIdsByName[a];
                if (o && t < o[0] && (t += o[1], n[t] = n[t] || v.getUniformLocation(e, r))) return t
            } else g.recordError(1281);
            return -1
        }
        var gf = pf;

        function vf(e, r, n) {
            n >>>= 0;
            for (var t = Lr[r], a = 0; a < r; a++) t[a] = _[n + a * 4 >>> 2 >>> 0];
            v.invalidateFramebuffer(e, t)
        }
        var bf = vf,
            hf = e => {
                e = g.programs[e], v.linkProgram(e), e.uniformLocsById = 0, e.uniformSizeAndIdsByName = {}
            },
            wf = hf,
            $t = e => {
                switch (e) {
                    case 34962:
                        e = 34964;
                        break;
                    case 34963:
                        e = 34965;
                        break;
                    case 35051:
                        e = 35053;
                        break;
                    case 35052:
                        e = 35055;
                        break;
                    case 35982:
                        e = 35983;
                        break;
                    case 36662:
                        e = 36662;
                        break;
                    case 36663:
                        e = 36663;
                        break;
                    case 35345:
                        e = 35368;
                        break
                }
                var r = v.getParameter(e);
                return r ? r.name | 0 : 0
            },
            qt = e => {
                switch (e) {
                    case 34962:
                    case 34963:
                    case 36662:
                    case 36663:
                    case 35051:
                    case 35052:
                    case 35882:
                    case 35982:
                    case 35345:
                        return !0;
                    default:
                        return !1
                }
            };

        function xf(e, r, n, t) {
            var o;
            if (r >>>= 0, n >>>= 0, t & 33) return X("glMapBufferRange access does not support MAP_READ or MAP_UNSYNCHRONIZED"), 0;
            if (!(t & 2)) return X("glMapBufferRange access must include MAP_WRITE"), 0;
            if (!(t & 12)) return X("glMapBufferRange access must include INVALIDATE_BUFFER or INVALIDATE_RANGE"), 0;
            if (!qt(e)) return g.recordError(1280), X("GL_INVALID_ENUM in glMapBufferRange"), 0;
            var a = H(n),
                i = $t(e);
            return a ? (i = (o = g.mappedBuffers)[i] ?? (o[i] = {}), i.offset = r, i.length = n, i.mem = a, i.access = t, a) : 0
        }
        var yf = xf,
            Cf = (e, r) => {
                e == 3317 ? g.unpackAlignment = r : e == 3314 && (g.unpackRowLength = r), v.pixelStorei(e, r)
            },
            Sf = Cf,
            kf = (e, r) => v.polygonOffset(e, r),
            Tf = kf,
            Bf = (e, r, n) => {
                function t(o, s) {
                    return o + s - 1 & -s
                }
                var a = (g.unpackRowLength || e) * n,
                    i = t(a, g.unpackAlignment);
                return r * i
            },
            Af = e => {
                var r = {
                    5: 3,
                    6: 4,
                    8: 2,
                    29502: 3,
                    29504: 4,
                    26917: 2,
                    26918: 2,
                    29846: 3,
                    29847: 4
                };
                return r[e - 6402] || 1
            },
            Wr = e => (e -= 5120, e == 0 ? L : e == 1 ? W : e == 2 ? ne : e == 4 ? _ : e == 6 ? ee : e == 5 || e == 28922 || e == 28520 || e == 30779 || e == 30782 ? m : ke),
            Xt = (e, r) => e >>> 31 - Math.clz32(r.BYTES_PER_ELEMENT),
            $e = (e, r, n, t, a) => {
                var i = Wr(e),
                    o = Af(r) * i.BYTES_PER_ELEMENT,
                    s = Bf(n, t, o);
                return i.subarray(Xt(a, i) >>> 0, Xt(a + s, i) >>> 0)
            };

        function Ef(e, r, n, t, a, i, o) {
            if (o >>>= 0, v.currentPixelPackBufferBinding) {
                v.readPixels(e, r, n, t, a, i, o);
                return
            }
            var s = $e(i, a, n, t, o);
            if (!s) {
                g.recordError(1280);
                return
            }
            v.readPixels(e, r, n, t, a, i, s)
        }
        var Ff = Ef,
            If = (e, r, n, t) => v.renderbufferStorage(e, r, n, t),
            Df = If,
            Of = (e, r, n, t, a) => v.renderbufferStorageMultisample(e, r, n, t, a),
            Mf = Of,
            Rf = (e, r, n, t) => v.scissor(e, r, n, t),
            Lf = Rf;

        function Wf(e, r, n, t) {
            n >>>= 0, t >>>= 0;
            var a = g.getSource(e, r, n, t);
            v.shaderSource(g.shaders[e], a)
        }
        var jf = Wf,
            Uf = (e, r, n) => v.stencilFunc(e, r, n),
            Gf = Uf,
            Vf = e => v.stencilMask(e),
            Pf = Vf,
            Nf = (e, r, n) => v.stencilOp(e, r, n),
            Jf = Nf;

        function Hf(e, r, n, t, a, i, o, s, c) {
            if (c >>>= 0, v.currentPixelUnpackBufferBinding) {
                v.texImage2D(e, r, n, t, a, i, o, s, c);
                return
            }
            var u = c ? $e(s, o, t, a, c) : null;
            v.texImage2D(e, r, n, t, a, i, o, s, u)
        }
        var zf = Hf;

        function $f(e, r, n, t, a, i, o, s, c, u) {
            if (u >>>= 0, v.currentPixelUnpackBufferBinding) v.texImage3D(e, r, n, t, a, i, o, s, c, u);
            else if (u) {
                var d = Wr(c),
                    p = $e(c, s, t, a * i, u);
                v.texImage3D(e, r, n, t, a, i, o, s, c, p)
            } else v.texImage3D(e, r, n, t, a, i, o, s, c, null)
        }
        var qf = $f,
            Xf = (e, r, n) => v.texParameterf(e, r, n),
            Kf = Xf;

        function Yf(e, r, n) {
            n >>>= 0;
            var t = ee[n >>> 2 >>> 0];
            v.texParameterf(e, r, t)
        }
        var Qf = Yf,
            Zf = (e, r, n) => v.texParameteri(e, r, n),
            ed = Zf,
            rd = (e, r, n, t, a) => v.texStorage2D(e, r, n, t, a),
            nd = rd,
            td = (e, r, n, t, a, i) => v.texStorage3D(e, r, n, t, a, i),
            ad = td;

        function id(e, r, n, t, a, i, o, s, c) {
            if (c >>>= 0, v.currentPixelUnpackBufferBinding) {
                v.texSubImage2D(e, r, n, t, a, i, o, s, c);
                return
            }
            var u = c ? $e(s, o, a, i, c) : null;
            v.texSubImage2D(e, r, n, t, a, i, o, s, u)
        }
        var od = id;

        function sd(e, r, n, t, a, i, o, s, c, u, d) {
            if (d >>>= 0, v.currentPixelUnpackBufferBinding) v.texSubImage3D(e, r, n, t, a, i, o, s, c, u, d);
            else if (d) {
                var p = Wr(u),
                    x = $e(u, c, i, o * s, d);
                v.texSubImage3D(e, r, n, t, a, i, o, s, c, u, x)
            } else v.texSubImage3D(e, r, n, t, a, i, o, s, c, u, null)
        }
        var cd = sd,
            ld = (e, r) => {
                if (e) {
                    var n = e.uniformLocsById[r];
                    return typeof n == "number" && (e.uniformLocsById[r] = n = v.getUniformLocation(e, e.uniformArrayNamesById[r] + (n > 0 ? `[${n}]` : ""))), n
                } else g.recordError(1282)
            },
            ud = e => ld(v.currentProgram, e),
            fd = (e, r) => {
                v.uniform1i(ud(e), r)
            },
            dd = fd,
            _d = (e, r, n) => {
                e = g.programs[e], v.uniformBlockBinding(e, r, n)
            },
            md = _d,
            pd = e => {
                if (!qt(e)) return g.recordError(1280), X("GL_INVALID_ENUM in glUnmapBuffer"), 0;
                var r = $t(e),
                    n = g.mappedBuffers[r];
                return !n || !n.mem ? (g.recordError(1282), X("buffer was never mapped in glUnmapBuffer"), 0) : (n.access & 16 || cr(e, n.offset, n.length, n.mem), Y(n.mem), n.mem = 0, 1)
            },
            gd = pd,
            vd = e => {
                e = g.programs[e], v.useProgram(e), v.currentProgram = e
            },
            bd = vd;

        function hd(e, r, n, t, a, i) {
            i >>>= 0;
            var o = g.currentContext.clientBuffers[e];
            if (!v.currentArrayBufferBinding) {
                o.size = r, o.type = n, o.normalized = t, o.stride = a, o.ptr = i, o.clientside = !0, o.vertexAttribPointerAdaptor = function(s, c, u, d, p, x) {
                    this.vertexAttribPointer(s, c, u, d, p, x)
                };
                return
            }
            o.clientside = !1, v.vertexAttribPointer(e, r, n, !!t, a, i)
        }
        var wd = hd,
            xd = (e, r, n, t) => v.viewport(e, r, n, t),
            yd = xd;

        function Cd() {
            const e = typeof he == "function" ? "0x" + he().toString(16) : "?",
                r = typeof self < "u" && self.name ? self.name : "";
            return "[FS-JS][" + e + (r ? " " + r : "") + "]"
        }

        function Kt(e, r, n) {
            const t = T(e),
                a = Cd(),
                i = new AbortController;
            return fetch(t, {
                signal: i.signal
            }).then(function(o) {
                return o.ok ? o.arrayBuffer().then(function(s) {
                    return s.byteLength !== n ? (console.warn(a, "size mismatch for", t, "expected=" + n, "got=" + s.byteLength), -1) : (W.set(new Uint8Array(s), r >>> 0), 0)
                }) : -1
            }).catch(function(o) {
                return console.warn(a, "fetch failed:", t, o && o.name === "AbortError" ? "(timeout)" : o), -1
            })
        }
        Kt.isAsync = !0;
        var Sd = () => e => (e.set(crypto.getRandomValues(new Uint8Array(e.byteLength))), 0),
            Yt = e => (Yt = Sd())(e);

        function kd(e, r) {
            return e >>>= 0, r >>>= 0, Yt(W.subarray(e >>> 0, e + r >>> 0))
        }
        var jr = {
                envelopeUrl: "https://sentry-relay.rbxinfra.com/api/26/envelope/?sentry_key=fd31d5d821fe2ac98694d57ca0c93b76&sentry_version=7&sentry_client=roblox-wasm-client/1.0.0",
                sdk: {
                    name: "roblox-wasm-client",
                    version: "1.0.0"
                },
                maxEnvelopeBytes: 61440
            },
            Ae = {
                application: "RobloxWasmPlayer",
                "application.version": "1.0.0",
                "uname.sysname": "Web"
            },
            Ur = {
                reported: !1
            };

        function Td() {
            return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function(e) {
                const r = Math.random() * 16 | 0;
                return (e === "x" ? r : r & 3 | 8).toString(16)
            })
        }
        var Bd = ["_report_crash", "invokeEntryPoint", "handleMessage"];

        function Qt(e) {
            if (!e) return [];
            const r = [];
            for (const n of e.split(`
`)) {
                let t = n.match(/at\s+(?:(.+?)\s+\()?[^\s(]*:wasm-function\[(\d+)\]:0x([0-9a-fA-F]+)\)?/);
                if (t) {
                    r.push({
                        funcName: t[1] || "wasm-function[" + t[2] + "]",
                        sourceCode: "wasm-function[" + t[2] + "]",
                        line: parseInt(t[3], 16),
                        column: 0
                    });
                    continue
                }
                if (t = n.match(/at\s+(.+?)\s+\((.+):(\d+):(\d+)\)/), t) {
                    r.push({
                        funcName: t[1],
                        sourceCode: t[2],
                        line: parseInt(t[3]),
                        column: parseInt(t[4])
                    });
                    continue
                }
                if (t = n.match(/at\s+(.+?)\s+\(wasm:\/\/wasm\/[^:]*:wasm-function\[(\d+)\]:0x([0-9a-fA-F]+)\)/), t) {
                    r.push({
                        funcName: t[1],
                        sourceCode: "wasm-function[" + t[2] + "]",
                        line: parseInt(t[3], 16),
                        column: 0
                    });
                    continue
                }
                if (t = n.match(/at\s+wasm:\/\/wasm\/[^:]*:wasm-function\[(\d+)\]:0x([0-9a-fA-F]+)/), t) {
                    r.push({
                        funcName: "wasm-function[" + t[1] + "]",
                        sourceCode: "wasm-function[" + t[1] + "]",
                        line: parseInt(t[2], 16),
                        column: 0
                    });
                    continue
                }
                if (t = n.match(/^(.+)@wasm:\/\/wasm\/[^:]*:wasm-function\[(\d+)\]:0x([0-9a-fA-F]+)/), t) {
                    r.push({
                        funcName: t[1],
                        sourceCode: "wasm-function[" + t[2] + "]",
                        line: parseInt(t[3], 16),
                        column: 0
                    });
                    continue
                }
                t = n.match(/at\s+(.+):(\d+):(\d+)/), t && r.push({
                    funcName: "<anonymous>",
                    sourceCode: t[1],
                    line: parseInt(t[2]),
                    column: parseInt(t[3])
                })
            }
            return r.filter(function(n) {
                return Bd.indexOf(n.funcName) === -1
            })
        }

        function Ad() {
            if (typeof xe > "u" || !xe) return null;
            const e = WebAssembly.Module.customSections(xe, "build_id")[0];
            if (!e) return null;
            const r = new Uint8Array(e);
            let n = 0,
                t = 0;
            for (let o = 0; t < r.length; o += 7) {
                const s = r[t++];
                if (n |= (s & 127) << o, !(s & 128)) break
            }
            if (n < 16 || t + n > r.length) return null;
            let a = "";
            for (const o of r.subarray(t, t + n)) a += o.toString(16).padStart(2, "0");
            return {
                type: "wasm",
                debug_id: a.slice(0, 8) + "-" + a.slice(8, 12) + "-" + a.slice(12, 16) + "-" + a.slice(16, 20) + "-" + a.slice(20, 32),
                code_id: a,
                code_file: "WebClient.wasm"
            }
        }

        function Ed(e) {
            if (typeof _sentryDebugIds > "u" || !_sentryDebugIds) return [];
            const r = {};
            for (const t of Object.keys(_sentryDebugIds)) {
                const a = Qt(t)[0];
                a && (r[a.sourceCode] = _sentryDebugIds[t])
            }
            const n = [];
            for (const t of e) {
                const a = r[t];
                a && !n.some(function(i) {
                    return i.code_file === t
                }) && n.push({
                    type: "sourcemap",
                    debug_id: a,
                    code_file: t
                })
            }
            return n
        }

        function Zt(e, r, n, t, a) {
            e !== "LiveTrace" && (Ur.reported = !0);
            const i = E ? "0x" + he().toString(16) : "main",
                o = a || i;
            try {
                const s = Ad(),
                    c = Qt(n),
                    u = c.some(function(C) {
                        return C.sourceCode.startsWith("wasm-function[")
                    }),
                    d = c.slice().reverse().map(function(C) {
                        return C.sourceCode.startsWith("wasm-function[") ? s ? {
                            function: C.funcName,
                            platform: "native",
                            instruction_addr: `0x${C.line.toString(16)}`,
                            addr_mode: "rel:0"
                        } : {
                            function: C.funcName,
                            module: C.sourceCode
                        } : {
                            function: C.funcName,
                            filename: C.sourceCode,
                            lineno: C.line,
                            colno: C.column
                        }
                    }),
                    p = [];
                s && p.push(s), p.push(...Ed(c.map(function(C) {
                    return C.sourceCode
                })));
                const x = {};
                for (const C of Object.keys(Ae)) C !== "Token" && C !== "HttpProxy" && C !== "SentryEnvironment" && (x[C] = Ae[C]);
                x.language = t, x["thread.id"] = i, x["thread.name"] = o, u && !s && (x.symbolication = "no-debug-image");
                const B = {
                        rawStack: n
                    },
                    k = {
                        event_id: Td().replace(/-/g, ""),
                        timestamp: Date.now() / 1e3,
                        platform: "javascript",
                        level: e === "LiveTrace" ? "info" : "fatal",
                        environment: Ae.SentryEnvironment || "unknown",
                        release: Ae.AppVersion || Ae.EngineVersion,
                        dist: Ae.RobloxChannel,
                        sdk: jr.sdk,
                        exception: {
                            values: [{
                                type: e,
                                value: r,
                                stacktrace: {
                                    frames: d
                                }
                            }]
                        },
                        tags: x,
                        extra: B,
                        ...p.length ? {
                            debug_meta: {
                                images: p
                            }
                        } : {}
                    },
                    I = function() {
                        return [JSON.stringify({
                            event_id: k.event_id,
                            sent_at: new Date().toISOString()
                        }), JSON.stringify({
                            type: "event"
                        }), JSON.stringify(k)].join(`
`) + `
`
                    },
                    b = function(C) {
                        return new TextEncoder().encode(C).byteLength > jr.maxEnvelopeBytes
                    };
                let D = I();
                if (b(D) && (delete B.rawStack, D = I(), console.warn("[CrashReporter] dropped extra.rawStack to fit keepalive size limit")), b(D)) {
                    console.warn("[CrashReporter] Sentry envelope exceeds keepalive size limit");
                    return
                }
                console.log('[CrashReporter] uploading "' + e + '" from thread ' + o + " (" + i + ")"), fetch(jr.envelopeUrl, {
                    method: "POST",
                    headers: {
                        "Content-Type": "text/plain;charset=UTF-8"
                    },
                    credentials: "omit",
                    body: D,
                    keepalive: !0
                }).then(function(C) {
                    console.log("[CrashReporter] upload status " + C.status + " from thread " + o + " (" + i + ")")
                }).catch(function(C) {
                    console.error("[CrashReporter] upload failed:", C)
                })
            } catch (s) {
                console.error("[CrashReporter] report failed:", s)
            }
        }

        function ea(e, r) {
            return e === "RBXCRASH" || e === "LiveTrace" || e === "RuntimeError" || r.includes("wasm") || r.includes("WebAssembly") ? "wasm" : "javascript"
        }

        function Fd() {
            if (typeof globalThis.addEventListener != "function") return;
            const e = function(r) {
                if (Ur.reported || !(r instanceof Error)) return;
                const n = r.stack || "";
                if (!E && !(r instanceof WebAssembly.RuntimeError) && n.indexOf("wasm-function[") === -1) return;
                let t = !0;
                try {
                    t = Ti() !== 0
                } catch {}
                if (!t) {
                    Ur.reported = !0;
                    return
                }
                Zt(r.name, r.message, n, ea(r.name, r.message), E ? self.name : "")
            };
            globalThis.addEventListener("error", function(r) {
                e(r.error)
            }), globalThis.addEventListener("unhandledrejection", function(r) {
                e(r.reason)
            }), E || (f.reportEngineError = e)
        }

        function Id(e, r, n, t, a) {
            const i = T(e),
                o = T(r),
                s = T(n) || new Error().stack || "",
                c = T(t) || ea(i, o);
            Zt(i, o, s, c, T(a))
        }

        function Dd(e, r) {
            Ae[T(e)] = T(r)
        }
        var Od = function(e) {
            e >>>= 0;
            var r = (() => {
                var n = l.getJsObject(e);
                return n.size
            })();
            return BigInt(r)
        };

        function Md(e, r) {
            e >>>= 0, r >>>= 0;
            var n;
            r && (n = {
                label: l.makeStringFromOptionalStringView(r + 4),
                timestampWrites: l.makePassTimestampWrites(m[r + 12 >>> 2 >>> 0])
            });
            var t = l.getJsObject(e),
                a = Nr(0);
            return l.Internals.jsObjectInsert(a, t.beginComputePass(n)), a
        }

        function Rd(e, r) {
            e >>>= 0, r >>>= 0;

            function n(u) {
                var d = m[u + 4 >>> 2 >>> 0];
                if (d !== 0) {
                    var p = m[u + 8 >>> 2 >>> 0];
                    return p == 4294967295 && (p = void 0), {
                        view: l.getJsObject(d),
                        depthSlice: p,
                        resolveTarget: l.getJsObject(m[u + 12 >>> 2 >>> 0]),
                        clearValue: l.makeColor(u + 24),
                        loadOp: l.LoadOp[_[u + 16 >>> 2 >>> 0]],
                        storeOp: l.StoreOp[_[u + 20 >>> 2 >>> 0]]
                    }
                }
            }

            function t(u, d) {
                for (var p = [], x = 0; x < u; ++x) p.push(n(d + 56 * x));
                return p
            }

            function a(u) {
                if (u !== 0) return {
                    view: l.getJsObject(m[u + 4 >>> 2 >>> 0]),
                    depthClearValue: ee[u + 16 >>> 2 >>> 0],
                    depthLoadOp: l.LoadOp[_[u + 8 >>> 2 >>> 0]],
                    depthStoreOp: l.StoreOp[_[u + 12 >>> 2 >>> 0]],
                    depthReadOnly: !!m[u + 20 >>> 2 >>> 0],
                    stencilClearValue: m[u + 32 >>> 2 >>> 0],
                    stencilLoadOp: l.LoadOp[_[u + 24 >>> 2 >>> 0]],
                    stencilStoreOp: l.StoreOp[_[u + 28 >>> 2 >>> 0]],
                    stencilReadOnly: !!m[u + 36 >>> 2 >>> 0]
                }
            }

            function i(u) {
                var d = m[u >>> 2 >>> 0],
                    p = void 0;
                if (d !== 0) {
                    var x = _[d + 4 >>> 2 >>> 0],
                        B = d;
                    p = Ce(B + 8)
                }
                var k = {
                    label: l.makeStringFromOptionalStringView(u + 4),
                    colorAttachments: t(m[u + 12 >>> 2 >>> 0], m[u + 16 >>> 2 >>> 0]),
                    depthStencilAttachment: a(m[u + 20 >>> 2 >>> 0]),
                    occlusionQuerySet: l.getJsObject(m[u + 24 >>> 2 >>> 0]),
                    timestampWrites: l.makePassTimestampWrites(m[u + 28 >>> 2 >>> 0]),
                    maxDrawCount: p
                };
                return k
            }
            var o = i(r),
                s = l.getJsObject(e),
                c = Kr(0);
            return l.Internals.jsObjectInsert(c, s.beginRenderPass(o)), c
        }

        function Ld(e, r, n, t, a, i) {
            e >>>= 0, r >>>= 0, n = Q(n), t >>>= 0, a = Q(a), i = Q(i);
            var o = l.getJsObject(e),
                s = l.getJsObject(r),
                c = l.getJsObject(t);
            o.copyBufferToBuffer(s, n, c, a, i)
        }

        function Wd(e, r, n, t) {
            e >>>= 0, r >>>= 0, n >>>= 0, t >>>= 0;
            var a = l.getJsObject(e),
                i = l.makeExtent3D(t);
            a.copyTextureToBuffer(l.makeTexelCopyTextureInfo(r), l.makeTexelCopyBufferInfo(n), i)
        }

        function jd(e, r, n, t) {
            e >>>= 0, r >>>= 0, n >>>= 0, t >>>= 0;
            var a = l.getJsObject(e),
                i = l.makeExtent3D(t);
            a.copyTextureToTexture(l.makeTexelCopyTextureInfo(r), l.makeTexelCopyTextureInfo(n), i)
        }

        function Ud(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.getJsObject(e),
                t = Yr(0);
            return l.Internals.jsObjectInsert(t, n.finish()), t
        }

        function Gd(e) {
            e >>>= 0;
            var r = l.getJsObject(e);
            r.popDebugGroup()
        }
        var Vd = (e, r) => {
            var n = l.getJsObject(e);
            n.pushDebugGroup(l.makeStringFromStringView(r))
        };

        function Pd(e, r, n, t, a, i) {
            e >>>= 0, r >>>= 0, a >>>= 0, i = Q(i);
            var o = l.getJsObject(e),
                s = l.getJsObject(r),
                c = l.getJsObject(a);
            o.resolveQuerySet(s, n, t, c, i)
        }

        function Nd(e, r, n, t) {
            e >>>= 0;
            var a = l.getJsObject(e);
            a.dispatchWorkgroups(r, n, t)
        }

        function Jd(e) {
            e >>>= 0;
            var r = l.getJsObject(e);
            r.end()
        }

        function Hd(e) {
            e >>>= 0;
            var r = l.getJsObject(e);
            r.popDebugGroup()
        }
        var zd = (e, r) => {
            var n = l.getJsObject(e);
            n.pushDebugGroup(l.makeStringFromStringView(r))
        };

        function $d(e, r, n, t, a) {
            e >>>= 0, n >>>= 0, t >>>= 0, a >>>= 0;
            var i = l.getJsObject(e),
                o = l.getJsObject(n);
            t == 0 ? i.setBindGroup(r, o) : i.setBindGroup(r, o, m, a >>> 2, t)
        }

        function qd(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.getJsObject(e),
                t = l.getJsObject(r);
            n.setPipeline(t)
        }
        var Xd = function(e, r) {
            e >>>= 0, r >>>= 0;

            function n(s) {
                var c = m[s + 8 >>> 2 >>> 0],
                    u = m[s + 32 >>> 2 >>> 0],
                    d = m[s + 36 >>> 2 >>> 0],
                    p = 0;
                l.iterateExtensions(s, {
                    14: k => {
                        p = m[k + 8 >>> 2 >>> 0]
                    }
                });
                var x;
                if (c) {
                    var B = Ce(s + 24);
                    B == -1 && (B = void 0), x = {
                        buffer: l.getJsObject(c),
                        offset: Ce(s + 16),
                        size: B
                    }
                } else x = l.getJsObject(u || d || p);
                return {
                    binding: m[s + 4 >>> 2 >>> 0],
                    resource: x
                }
            }

            function t(s, c) {
                for (var u = [], d = 0; d < s; ++d) u.push(n(c + 40 * d));
                return u
            }
            var a = {
                    label: l.makeStringFromOptionalStringView(r + 4),
                    layout: l.getJsObject(m[r + 12 >>> 2 >>> 0]),
                    entries: t(m[r + 16 >>> 2 >>> 0], m[r + 20 >>> 2 >>> 0])
                },
                i = l.getJsObject(e),
                o = tn(0);
            return l.Internals.jsObjectInsert(o, i.createBindGroup(a)), o
        };

        function Kd(e, r) {
            e >>>= 0, r >>>= 0;

            function n(p) {
                var x = m[p + 4 >>> 2 >>> 0];
                if (x) return {
                    type: l.BufferBindingType[x],
                    hasDynamicOffset: !!m[p + 8 >>> 2 >>> 0],
                    minBindingSize: Ce(p + 16)
                }
            }

            function t(p) {
                var x = m[p + 4 >>> 2 >>> 0];
                if (x) return {
                    type: l.SamplerBindingType[x]
                }
            }

            function a(p) {
                var x = m[p + 4 >>> 2 >>> 0];
                if (x) return {
                    sampleType: l.TextureSampleType[x],
                    viewDimension: l.TextureViewDimension[_[p + 8 >>> 2 >>> 0]],
                    multisampled: !!m[p + 12 >>> 2 >>> 0]
                }
            }

            function i(p) {
                var x = m[p + 4 >>> 2 >>> 0];
                if (x) return {
                    access: l.StorageTextureAccess[x],
                    format: l.TextureFormat[_[p + 8 >>> 2 >>> 0]],
                    viewDimension: l.TextureViewDimension[_[p + 12 >>> 2 >>> 0]]
                }
            }

            function o(p) {
                var x = {
                    binding: m[p + 4 >>> 2 >>> 0],
                    visibility: m[p + 8 >>> 2 >>> 0],
                    buffer: n(p + 24),
                    sampler: t(p + 48),
                    texture: a(p + 56),
                    storageTexture: i(p + 72)
                };
                return l.iterateExtensions(p, {
                    13: B => {
                        x.externalTexture = {}
                    }
                }), x
            }

            function s(p, x) {
                for (var B = [], k = 0; k < p; ++k) B.push(o(x + 88 * k));
                return B
            }
            var c = {
                    label: l.makeStringFromOptionalStringView(r + 4),
                    entries: s(m[r + 12 >>> 2 >>> 0], m[r + 16 >>> 2 >>> 0])
                },
                u = l.getJsObject(e),
                d = en(0);
            return l.Internals.jsObjectInsert(d, u.createBindGroupLayout(c)), d
        }

        function Yd(e, r) {
            e >>>= 0, r >>>= 0;
            var n;
            r && (n = {
                label: l.makeStringFromOptionalStringView(r + 4)
            });
            var t = l.getJsObject(e),
                a = Zr(0);
            return l.Internals.jsObjectInsert(a, t.createCommandEncoder(n)), a
        }

        function Qd(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.makeComputePipelineDesc(r),
                t = l.getJsObject(e),
                a = Qr(0);
            return l.Internals.jsObjectInsert(a, t.createComputePipeline(n)), a
        }

        function Zd(e, r) {
            e >>>= 0, r >>>= 0;
            for (var n = m[r + 12 >>> 2 >>> 0], t = m[r + 16 >>> 2 >>> 0], a = [], i = 0; i < n; ++i) a.push(l.getJsObject(m[t + 4 * i >>> 2 >>> 0]));
            var o = {
                    label: l.makeStringFromOptionalStringView(r + 4),
                    bindGroupLayouts: a,
                    immediateSize: m[r + 20 >>> 2 >>> 0]
                },
                s = l.getJsObject(e),
                c = rn(0);
            return l.Internals.jsObjectInsert(c, s.createPipelineLayout(o)), c
        }

        function e_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = {
                    type: l.QueryType[_[r + 12 >>> 2 >>> 0]],
                    count: m[r + 16 >>> 2 >>> 0]
                },
                t = l.getJsObject(e),
                a = qr(0);
            return l.Internals.jsObjectInsert(a, t.createQuerySet(n)), a
        }

        function r_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.makeRenderPipelineDesc(r),
                t = l.getJsObject(e),
                a = nn(0);
            return l.Internals.jsObjectInsert(a, t.createRenderPipeline(n)), a
        }

        function n_(e, r) {
            e >>>= 0, r >>>= 0;
            var n;
            r && (n = {
                label: l.makeStringFromOptionalStringView(r + 4),
                addressModeU: l.AddressMode[_[r + 12 >>> 2 >>> 0]],
                addressModeV: l.AddressMode[_[r + 16 >>> 2 >>> 0]],
                addressModeW: l.AddressMode[_[r + 20 >>> 2 >>> 0]],
                magFilter: l.FilterMode[_[r + 24 >>> 2 >>> 0]],
                minFilter: l.FilterMode[_[r + 28 >>> 2 >>> 0]],
                mipmapFilter: l.MipmapFilterMode[_[r + 32 >>> 2 >>> 0]],
                lodMinClamp: ee[r + 36 >>> 2 >>> 0],
                lodMaxClamp: ee[r + 40 >>> 2 >>> 0],
                compare: l.CompareFunction[_[r + 44 >>> 2 >>> 0]],
                maxAnisotropy: ke[r + 48 >>> 1 >>> 0]
            });
            var t = l.getJsObject(e),
                a = Hr(0);
            return l.Internals.jsObjectInsert(a, t.createSampler(n)), a
        }

        function t_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = m[r >>> 2 >>> 0],
                t;
            if (n !== 0) {
                var a = _[n + 4 >>> 2 >>> 0],
                    i = n;
                t = l.TextureViewDimension[_[i + 8 >>> 2 >>> 0]]
            }
            var o = {
                    label: l.makeStringFromOptionalStringView(r + 4),
                    size: l.makeExtent3D(r + 28),
                    mipLevelCount: m[r + 44 >>> 2 >>> 0],
                    sampleCount: m[r + 48 >>> 2 >>> 0],
                    dimension: l.TextureDimension[_[r + 24 >>> 2 >>> 0]],
                    format: l.TextureFormat[_[r + 40 >>> 2 >>> 0]],
                    usage: m[r + 16 >>> 2 >>> 0],
                    textureBindingViewDimension: t
                },
                s = m[r + 52 >>> 2 >>> 0];
            if (s) {
                var c = m[r + 56 >>> 2 >>> 0];
                o.viewFormats = Array.from(_.subarray(c >>> 2 >>> 0, c + s * 4 >>> 2 >>> 0), p => l.TextureFormat[p])
            }
            var u = l.getJsObject(e),
                d = Xr(0);
            return l.Internals.jsObjectInsert(d, u.createTexture(o)), d
        }

        function a_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.getJsObject(e);
            return l.fillLimitStruct(n.limits, r), 1
        }

        function i_(e, r) {
            e >>>= 0;
            var n = l.getJsObject(e);
            return n.features.has(l.FeatureName[r])
        }

        function o_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = m[r >>> 2 >>> 0],
                t = n,
                a = m[t + 8 >>> 2 >>> 0],
                i = Re(a),
                o = i.getContext("webgpu");
            if (!o) return 0;
            o.surfaceLabelWebGPU = l.makeStringFromOptionalStringView(r + 4);
            var s = Jr(0);
            return l.Internals.jsObjectInsert(s, o), s
        }
        var s_ = function(e, r, n) {
            e >>>= 0, r >>>= 0, n >>>= 0;
            var t = l.getJsObject(e),
                a = Array.from(_.subarray(n >>> 2 >>> 0, n + r * 4 >>> 2 >>> 0), i => l.getJsObject(i));
            t.submit(a)
        };

        function c_(e, r, n, t, a) {
            e >>>= 0, r >>>= 0, n = Q(n), t >>>= 0, a >>>= 0;
            var i = l.getJsObject(e),
                o = l.getJsObject(r),
                s = W.subarray(t >>> 0, t + a >>> 0);
            i.writeBuffer(o, n, s, 0, a)
        }

        function l_(e, r, n, t, a, i) {
            e >>>= 0, r >>>= 0, n >>>= 0, t >>>= 0, a >>>= 0, i >>>= 0;
            var o = l.getJsObject(e),
                s = l.makeTexelCopyTextureInfo(r),
                c = l.makeTexelCopyBufferLayout(a),
                u = l.makeExtent3D(i),
                d = W.subarray(n >>> 0, n + t >>> 0);
            o.writeTexture(s, d, c, u)
        }

        function u_(e, r, n, t, a) {
            e >>>= 0, t >>>= 0, a >>>= 0;
            var i = l.getJsObject(e);
            i.draw(r, n, t, a)
        }

        function f_(e, r, n, t, a, i) {
            e >>>= 0, t >>>= 0, i >>>= 0;
            var o = l.getJsObject(e);
            o.drawIndexed(r, n, t, a, i)
        }

        function d_(e) {
            e >>>= 0;
            var r = l.getJsObject(e);
            r.end()
        }

        function __(e) {
            e >>>= 0;
            var r = l.getJsObject(e);
            r.popDebugGroup()
        }
        var m_ = (e, r) => {
            var n = l.getJsObject(e);
            n.pushDebugGroup(l.makeStringFromStringView(r))
        };

        function p_(e, r, n, t, a) {
            e >>>= 0, n >>>= 0, t >>>= 0, a >>>= 0;
            var i = l.getJsObject(e),
                o = l.getJsObject(n);
            t == 0 ? i.setBindGroup(r, o) : i.setBindGroup(r, o, m, a >>> 2, t)
        }

        function g_(e, r, n, t, a) {
            e >>>= 0, r >>>= 0, t = Q(t), a = Q(a);
            var i = l.getJsObject(e),
                o = l.getJsObject(r);
            a == -1 && (a = void 0), i.setIndexBuffer(o, l.IndexFormat[n], t, a)
        }

        function v_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.getJsObject(e),
                t = l.getJsObject(r);
            n.setPipeline(t)
        }

        function b_(e, r, n, t, a) {
            e >>>= 0;
            var i = l.getJsObject(e);
            i.setScissorRect(r, n, t, a)
        }

        function h_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.getJsObject(e);
            n.setStencilReference(r)
        }

        function w_(e, r, n, t, a) {
            e >>>= 0, n >>>= 0, t = Q(t), a = Q(a);
            var i = l.getJsObject(e),
                o = l.getJsObject(n);
            a == -1 && (a = void 0), i.setVertexBuffer(r, o, t, a)
        }

        function x_(e, r, n, t, a, i, o) {
            e >>>= 0;
            var s = l.getJsObject(e);
            s.setViewport(r, n, t, a, i, o)
        }

        function y_(e, r) {
            e >>>= 0, r >>>= 0;
            var n = l.getJsObject(e),
                t = [m[r + 24 >>> 2 >>> 0], m[r + 28 >>> 2 >>> 0]];
            t[0] !== 0 && (n.canvas.width = t[0]), t[1] !== 0 && (n.canvas.height = t[1]);
            var a = {
                    device: l.getJsObject(m[r + 4 >>> 2 >>> 0]),
                    format: l.TextureFormat[_[r + 8 >>> 2 >>> 0]],
                    usage: m[r + 16 >>> 2 >>> 0],
                    alphaMode: l.CompositeAlphaMode[_[r + 40 >>> 2 >>> 0]]
                },
                i = m[r + 32 >>> 2 >>> 0];
            if (i) {
                var o = m[r + 36 >>> 2 >>> 0];
                a.viewFormats = Array.from(_.subarray(o >>> 2 >>> 0, o + i * 4 >>> 2 >>> 0), d => l.TextureFormat[d])
            } {
                var s = m[r >>> 2 >>> 0];
                if (s !== 0) {
                    var c = _[s + 4 >>> 2 >>> 0],
                        u = s;
                    a.colorSpace = l.PredefinedColorSpace[_[u + 8 >>> 2 >>> 0]], a.toneMapping = {
                        mode: l.ToneMappingMode[_[u + 12 >>> 2 >>> 0]]
                    }
                }
            }
            n.configure(a)
        }

        function C_(e, r) {
            e >>>= 0, r >>>= 0;
            var n;
            if (r) {
                var t, a = m[r >>> 2 >>> 0];
                if (a !== 0) {
                    var i = _[a + 4 >>> 2 >>> 0],
                        o = a,
                        s = o + 8,
                        c = l.ComponentSwizzle[_[s >>> 2 >>> 0]] || "r",
                        u = l.ComponentSwizzle[_[s + 4 >>> 2 >>> 0]] || "g",
                        d = l.ComponentSwizzle[_[s + 8 >>> 2 >>> 0]] || "b",
                        p = l.ComponentSwizzle[_[s + 12 >>> 2 >>> 0]] || "a";
                    t = `${c}${u}${d}${p}`
                }
                var x = m[r + 24 >>> 2 >>> 0],
                    B = m[r + 32 >>> 2 >>> 0];
                n = {
                    label: l.makeStringFromOptionalStringView(r + 4),
                    format: l.TextureFormat[_[r + 12 >>> 2 >>> 0]],
                    dimension: l.TextureViewDimension[_[r + 16 >>> 2 >>> 0]],
                    baseMipLevel: m[r + 20 >>> 2 >>> 0],
                    mipLevelCount: x === 4294967295 ? void 0 : x,
                    baseArrayLayer: m[r + 28 >>> 2 >>> 0],
                    arrayLayerCount: B === 4294967295 ? void 0 : B,
                    aspect: l.TextureAspect[_[r + 36 >>> 2 >>> 0]],
                    usage: m[r + 40 >>> 2 >>> 0],
                    swizzle: t
                }
            }
            var k = l.getJsObject(e),
                I = an(0);
            return l.Internals.jsObjectInsert(I, k.createView(n)), I
        }

        function S_(e) {
            e >>>= 0;
            var r = l.getJsObject(e);
            return r.depthOrArrayLayers
        }

        function k_(e) {
            e >>>= 0;
            var r = l.getJsObject(e);
            return l.TextureDimension.indexOf(r.dimension)
        }
        var T_ = function(e) {
                e >>>= 0;
                var r = (() => {
                    var n = l.getJsObject(e);
                    return n.usage
                })();
                return BigInt(r)
            },
            xm = e => {
                try {
                    return e()
                } catch (r) {
                    Ie(r)
                }
            },
            J = {
                instrumentWasmImports(e) {
                    var r = /^(invoke_.*|__asyncjs__.*)$/;
                    for (let [n, t] of Object.entries(e)) typeof t == "function" && (t.isAsync || r.test(n)) && (e[n] = t = new WebAssembly.Suspending(t))
                },
                instrumentWasmExports(e) {
                    var r = /^(fiber_entry|dispatch_current|_emscripten_check_mailbox|_emscripten_thread_free_data|dispatch_current_timeout_target|__wasm_call_ctors|main_loop_iteration|main|__main_argc_argv)$/;
                    J.asyncExports = new Set;
                    var n = {};
                    for (let [t, a] of Object.entries(e)) typeof a == "function" && r.test(t) && (J.asyncExports.add(a), a = J.makeAsyncFunction(a)), n[t] = a;
                    return n
                },
                asyncExports: null,
                isAsyncExport(e) {
                    return J.asyncExports?.has(e)
                },
                handleAsync: async e => {
                    ve();
                    try {
                        return await e()
                    } finally {
                        _e()
                    }
                },
                handleSleep: e => J.handleAsync(() => new Promise(e)),
                makeAsyncFunction(e) {
                    return WebAssembly.promising(e)
                }
            },
            ra = e => {
                var r = f["_" + e];
                return r
            },
            B_ = (e, r) => {
                L.set(e, r >>> 0)
            },
            A_ = (e, r, n, t, a) => {
                var i = {
                    string: I => {
                        var b = 0;
                        return I != null && I !== 0 && (b = lr(I)), b
                    },
                    array: I => {
                        var b = Ze(I.length);
                        return B_(I, b), b
                    }
                };

                function o(I) {
                    return r === "string" ? T(I) : r === "pointer" ? I >>> 0 : r === "boolean" ? !!I : I
                }
                var s = ra(e),
                    c = [],
                    u = 0;
                if (t)
                    for (var d = 0; d < t.length; d++) {
                        var p = i[n[d]];
                        p ? (u || (u = Ye()), c[d] = p(t[d])) : c[d] = t[d]
                    }
                var x = s(...c);

                function B(I) {
                    return u && Qe(u), o(I)
                }
                var k = a?.async;
                return k ? x.then(B) : (x = B(x), x)
            },
            E_ = (e, r, n, t) => {
                var a = !n || n.every(o => o === "number" || o === "boolean"),
                    i = r !== "string";
                return i && a && !t ? ra(e) : (...o) => A_(e, r, n, o, t)
            };
        U.init(), f.requestAnimationFrame = F.requestAnimationFrame, f.pauseMainLoop = F.pause, f.resumeMainLoop = F.resume, F.init(), ae.init(), ic(() => g.newRenderingFrameStarted());
        for (let e = 0; e < 32; ++e) Lr.push(new Array(e));
        Fd();
        {
            Ki(), f.print && (Ke = f.print);
            var Le = f.preInit;
            if (Le)
                for (typeof Le == "function" && (f.preInit = Le = [Le]); Le.length > 0;) Le.shift()()
        }
        f.cwrap = E_, f.UTF8ToString = T;
        var F_ = [Sr, Cn, An, Fn, In, Dn, On, Jn, Xn, Qn, Zn, et, nt, tt, it, or, st, lt, ut, dt, _t, pt, gt, bt, ht, wt, xt, yt, Ct, St, kt, Tt, Bt, At, Ot, Mt, Rt, Lt, Wt, jt, Ut, Gt, Vt, Pt, Nt, Jt],
            Gr = {
                9098847: () => navigator.webdriver ? 1 : 0,
                9098887: () => {
                    var e = performance.now(),
                        r = window.__wasmPreInitTime || 0;
                    console.log("[WASM-TIMING] main() entered: +" + (e - r).toFixed(1) + "ms from preInit")
                },
                9099052: e => {
                    window.__onExperienceLeft && window.__onExperienceLeft(e)
                },
                9099118: (e, r, n, t, a) => {
                    var i = {};
                    i.kind = e ? "failure" : "status", i.source = r == 1 ? "join" : r == 2 ? "teleport" : "gui-service", i.message = T(n), i.errorCode = t >= 0 ? t : null, i.statusCode = a >= 0 ? a : null, window.__onEngineLoadingStatus(i)
                },
                9099404: () => {
                    window.__resolveGameExit({
                        reason: "native_exit"
                    })
                },
                9099461: () => {
                    window.__resolveGameExit({
                        reason: "native_exit"
                    })
                },
                9099518: e => {
                    window.__resolveGameExit({
                        reason: "teleport_failed",
                        statusCode: e
                    })
                },
                9099595: e => {
                    window.__onDefaultLoadingScreenRemoved && window.__onDefaultLoadingScreenRemoved(e)
                },
                9099687: () => performance.now(),
                9099717: e => {
                    window.__resolveGameExit({
                        reason: "join_failed",
                        statusCode: e
                    })
                },
                9099790: () => window.__wasmPreInitTime || 0,
                9099832: e => {
                    window.__onExperienceJoined && window.__onExperienceJoined(e)
                },
                9099902: () => {
                    window.__resolveGameExit({
                        reason: "leave"
                    })
                },
                9099953: () => {
                    if (window.__rbxTabPrompt) return;
                    const e = "padding:10px 16px;border:0;border-radius:8px;color:#fff;font:600 14px Arial,sans-serif;cursor:pointer;";
                    window.__rbxTabPrompt = {
                        blockedMessage: "The browser blocked the new tab. Allow pop-ups for this site, then try again.",
                        create(r) {
                            const n = document.createElement("div");
                            n.setAttribute("role", "dialog"), n.setAttribute("aria-modal", "true"), n.style.cssText = "position:fixed;inset:0;z-index:1000;display:flex;align-items:center;justify-content:center;background:rgba(0,0,0,.72);font-family:Arial,sans-serif;";
                            const t = document.createElement("div");
                            t.style.cssText = "width:min(420px,calc(100% - 32px));box-sizing:border-box;padding:24px;border-radius:12px;background:#232527;color:#fff;box-shadow:0 16px 48px rgba(0,0,0,.45);";
                            const a = document.createElement("div");
                            a.style.cssText = "font-size:20px;font-weight:700;line-height:1.3;margin-bottom:8px;overflow-wrap:anywhere;";
                            const i = document.createElement("div");
                            i.style.cssText = "font-size:14px;line-height:1.45;color:#c7cbce;margin-bottom:20px;overflow-wrap:anywhere;";
                            const o = document.createElement("div");
                            o.setAttribute("role", "alert"), o.style.cssText = "display:none;margin-bottom:14px;color:#ffb8b8;font-size:13px;line-height:1.4;";
                            const s = document.createElement("div");
                            s.style.cssText = "display:flex;justify-content:flex-end;gap:10px;";
                            const c = document.createElement("button");
                            c.type = "button", c.style.cssText = e + "background:#4b4d50;";
                            const u = document.createElement("button");
                            u.type = "button", u.style.cssText = e + "background:#335fff;", s.append(c, u), t.append(a, i, o, s), n.appendChild(t);
                            const d = {
                                setText(p) {
                                    p.heading !== void 0 && (a.textContent = p.heading), p.description !== void 0 && (i.textContent = p.description), p.cancelLabel !== void 0 && (c.textContent = p.cancelLabel), p.openLabel !== void 0 && (u.textContent = p.openLabel ?? "", u.style.display = p.openLabel === null ? "none" : "")
                                },
                                showError(p) {
                                    o.textContent = p, o.style.display = "block"
                                },
                                hideError() {
                                    o.style.display = "none"
                                },
                                show() {
                                    n.isConnected || document.body.appendChild(n), n.style.display = "flex"
                                },
                                hide() {
                                    n.style.display = "none"
                                },
                                remove() {
                                    n.remove()
                                },
                                isShown() {
                                    return n.isConnected && n.style.display !== "none"
                                },
                                focus() {
                                    (u.style.display === "none" ? c : u).focus()
                                }
                            };
                            return d.setText(r), c.onclick = () => r.onCancel(), u.onclick = () => r.onOpen(), document.body.appendChild(n), d
                        }
                    }
                },
                9102932: () => {
                    const e = window.__rbxWebViewTabState;
                    e && typeof e.dispose == "function" && e.dispose()
                },
                9103046: (e, r, n, t) => {
                    const a = window.__rbxWebViewTabState;
                    if (!a || a.completed) return;
                    const i = (e ? T(e) : "") || null,
                        o = r ? T(r) : null,
                        s = i !== null && i !== a.url;
                    if (i !== null && (a.url = i), o !== null && (a.title = o, a.tab || a.resetToOpenStep()), s && a.tab && (a.closeTab(), a.resetToOpenStep()), !!n) {
                        if (t) {
                            a.showPrompt();
                            return
                        }
                        a.hidePrompt(), a.tab && !a.tab.closed && (a.closeTab(), a.resetToOpenStep())
                    }
                },
                9103637: (e, r, n, t, a, i) => {
                    const o = e ? T(e) : null,
                        s = r ? T(r) : null,
                        c = n,
                        u = t,
                        d = a,
                        p = i;
                    console.log("[WebView JS] js_mutate_webview called:", {
                        url: o,
                        title: s,
                        hasVisibility: c,
                        isVisible: u,
                        hasBackButton: d,
                        showBackButton: p
                    });
                    const x = document.getElementById("rbx-webview-container");
                    if (!x) {
                        console.warn("[WebView JS] mutate called but container doesn't exist!");
                        return
                    }
                    const B = document.getElementById("rbx-webview-title"),
                        k = document.getElementById("rbx-webview-iframe"),
                        I = document.getElementById("rbx-webview-close");
                    B && s && s.length > 0 && (console.log("[WebView JS] Setting title to:", s), B.textContent = s), k && o && o.length > 0 && (console.log("[WebView JS] Mutating iframe src to:", o), k.src = o), I && d && (I.style.display = p ? "block" : "none"), c && (console.log("[WebView JS] Mutating visibility to:", u ? "flex" : "none"), x.style.display = u ? "flex" : "none")
                },
                9104828: (e, r, n, t) => {
                    const a = T(e),
                        i = T(r),
                        o = !!n,
                        s = t,
                        c = window.__rbxWebViewTabState;
                    c && typeof c.dispose == "function" && c.dispose();
                    const u = {
                        step: s,
                        url: a,
                        title: i,
                        prompt: null,
                        tab: null,
                        completed: !1,
                        closeTab() {
                            if (this.tab && !this.tab.closed) try {
                                this.tab.close()
                            } catch {}
                        },
                        dispose() {
                            this.completed || (this.completed = !0, this.closeTab(), this.prompt.remove(), window.__rbxWebViewTabState === this && (window.__rbxWebViewTabState = null))
                        },
                        finish(d) {
                            this.completed || (this.dispose(), f._webview_on_close(this.step, d ? 1 : 0))
                        },
                        resetToOpenStep() {
                            this.tab = null, this.prompt.hideError(), this.prompt.setText({
                                heading: this.title || "Continue in a new tab",
                                description: "This step opens the requested page in a separate browser tab. Return here when it is complete.",
                                cancelLabel: "Cancel",
                                openLabel: "Open in new tab"
                            }), this.prompt.isShown() && this.prompt.focus()
                        },
                        showPrompt() {
                            this.prompt.show(), this.prompt.focus()
                        },
                        hidePrompt() {
                            this.prompt.hide()
                        },
                        openTab() {
                            this.prompt.hideError();
                            const d = window.open(this.url, "_blank");
                            if (!d) {
                                this.prompt.showError(window.__rbxTabPrompt.blockedMessage);
                                return
                            }
                            this.tab = d, this.prompt.setText({
                                heading: "Complete this step in the other tab",
                                description: "Gameplay will remain blocked until you return here and select Done.",
                                cancelLabel: "Done",
                                openLabel: null
                            }), this.prompt.focus()
                        }
                    };
                    u.prompt = window.__rbxTabPrompt.create({
                        onCancel: () => u.finish(!u.tab),
                        onOpen: () => u.openTab()
                    }), window.__rbxWebViewTabState = u, o || u.hidePrompt(), u.resetToOpenStep()
                },
                9106623: () => {
                    console.log("[WebView JS] js_close_webview called");
                    const e = document.getElementById("rbx-webview-container");
                    if (e) {
                        console.log("[WebView JS] Hiding container and clearing iframe"), e.style.display = "none";
                        const r = document.getElementById("rbx-webview-iframe");
                        r && (r.src = "about:blank")
                    } else console.warn("[WebView JS] close called but container doesn't exist")
                },
                9107053: (e, r, n, t, a, i, o) => {
                    const s = T(e),
                        c = T(r),
                        u = n,
                        d = t,
                        p = a,
                        x = i,
                        B = o;
                    console.log("[WebView JS] js_create_webview called:", {
                        url: s,
                        title: c,
                        isVisible: u,
                        showBackButton: d
                    }), window.__rbxGenericChallengeListenerInstalled || (window.addEventListener("message", function(C) {
                        let O;
                        try {
                            O = new URL(C.origin).hostname
                        } catch {
                            return
                        }
                        if (!O.endsWith(".roblox.com") && !O.endsWith(".rbxcdn.com") && !O.endsWith(".robloxlabs.com") && !O.endsWith(".rbx.com")) return;
                        const z = C.data && C.data.genericChallengeResponse;
                        if (!z) return;
                        console.log("[WebView JS] relaying genericChallengeResponse:", z.type, z.data);
                        const G = JSON.stringify({
                                moduleID: "Navigation",
                                functionName: "navigateToFeature",
                                params: {
                                    params: {
                                        feature: z.type,
                                        data: z.data
                                    }
                                }
                            }),
                            M = te(G);
                        if (M >= x) {
                            console.warn("[WebView JS] genericChallengeResponse too large, dropping:", M);
                            return
                        }
                        P(G, p, x), f._webview_on_message()
                    }), window.__rbxGenericChallengeListenerInstalled = !0);
                    let k = document.getElementById("rbx-webview-container");
                    if (k) console.log("[WebView JS] Using existing webview container");
                    else {
                        console.log("[WebView JS] Creating new webview container"), k = document.createElement("div"), k.id = "rbx-webview-container", k.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 1000; display: flex; flex-direction: column; background: rgba(0, 0, 0, 0.8);";
                        const C = document.createElement("div");
                        C.id = "rbx-webview-titlebar", C.style.cssText = "display: flex; align-items: center; justify-content: space-between; padding: 8px 16px; background: #333; color: white; font-family: sans-serif; font-size: 14px; min-height: 40px; box-sizing: border-box;";
                        const O = document.createElement("span");
                        O.id = "rbx-webview-title", O.style.cssText = "flex: 1; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;";
                        const z = document.createElement("button");
                        z.id = "rbx-webview-close", z.textContent = "\u2715", z.style.cssText = "background: #555; border: none; color: white; width: 32px; height: 32px; border-radius: 4px; cursor: pointer; font-size: 16px; margin-left: 16px;", z.onmouseover = function() {
                            z.style.background = "#777"
                        }, z.onmouseout = function() {
                            z.style.background = "#555"
                        }, z.onclick = function() {
                            k.style.display = "none";
                            const M = document.getElementById("rbx-webview-iframe");
                            M && (M.src = "about:blank"), f._webview_on_close(Number(k.dataset.rbxStep), 0)
                        }, C.appendChild(O), C.appendChild(z);
                        const G = document.createElement("iframe");
                        G.id = "rbx-webview-iframe", G.style.cssText = "flex: 1; border: none; background: white;", G.setAttribute("sandbox", "allow-scripts allow-same-origin allow-forms allow-popups"), G.addEventListener("load", function() {
                            console.log("[WebView JS] iframe loaded successfully, src:", G.src)
                        }), G.addEventListener("error", function(M) {
                            console.error("[WebView JS] iframe load error:", M)
                        }), k.appendChild(C), k.appendChild(G), document.body.appendChild(k), console.log("[WebView JS] Container appended to document body")
                    }
                    k.dataset.rbxStep = String(B);
                    const I = document.getElementById("rbx-webview-title"),
                        b = document.getElementById("rbx-webview-iframe"),
                        D = document.getElementById("rbx-webview-close");
                    I && (I.textContent = c || ""), b ? s && s.length > 0 ? (console.log("[WebView JS] Setting iframe src to:", s), b.src = s) : console.log("[WebView JS] Not setting iframe src, url is empty or null") : console.error("[WebView JS] iframe element not found!"), D && (D.style.display = d ? "block" : "none"), console.log("[WebView JS] Setting container visibility:", u ? "flex" : "none"), k.style.display = u ? "flex" : "none"
                },
                9111537: () => {
                    const e = document.getElementById("canvas");
                    e ? document.fullscreenElement ? (console.log("Exiting fullscreen"), document.exitFullscreen()) : (console.log("Requesting fullscreen"), e.requestFullscreen()) : console.log("#canvas element not found. Aborting fullscreen request.")
                },
                9111863: (e, r) => {
                    globalThis.__resolveGameExit({
                        reason: "crash",
                        errorType: T(e),
                        errorMessage: T(r)
                    })
                },
                9111979: (e, r) => {
                    const n = e,
                        t = r,
                        a = navigator.userAgentData ? navigator.userAgentData.platform === "Android" : /Android/i.test(navigator.userAgent);
                    return console.log("[FMOD] DSP buffer size override " + (a && t ? "ON" : "OFF") + " (android=" + (a ? "yes" : "no") + ", bufferSize=" + n + (n !== 0 && !t ? " invalid" : "") + ")"), a ? 1 : 0
                },
                9112441: () => (contextForCheck = new(window.AudioContext || window.webkitAudioContext), contextForCheck ? (retValue = 0, self.AudioWorkletNode && contextForCheck.audioWorklet.addModule && (retValue = 1), contextForCheck.close(), delete contextForCheck, retValue) : 0),
                9112730: () => {
                    mModuleLoading || (mModuleLoading = !0, mAddModuleRef++, mContext.resume().then(function() {
                        mContext.audioWorklet.addModule(mUrl).then(function() {
                            mAddModuleRef === 1 && (mWorkletNode = new AudioWorkletNode(mContext, "audio-processor", {
                                outputChannelCount: [mSpeakerChannelCount]
                            }), mModulePolling = !1, URL.revokeObjectURL(mUrl), mWorkletNode ? mSharedArrayBuffers ? mWorkletNode.port.postMessage(mFastpathPayload) : (mWorkletNode.port.postMessage(mOutputData), mWorkletNode.port.onmessage = function(e) {
                                FMOD_JS_MixerSlowpathFunction(), mWorkletNode.port.postMessage(mOutputData)
                            }) : console.log("Error when creating AudioWorkletNode: Null object")), mAddModuleRef--
                        }).catch(function(e) {
                            mModulePolling = !1, mAddModuleRef--, console.log("Error when opening audio processor "), console.log(e)
                        })
                    }).catch(function(e) {
                        mModulePolling = !1, mAddModuleRef--, console.log("Error with mContext.resume()"), console.log(e)
                    }))
                },
                9113734: () => {
                    mStartInterval = waitForAudioWorklet(function() {
                        return mWorkletNode === null && mModulePolling
                    }, function() {
                        mWorkletNode && (mWorkletNode.connect(mContext.destination), mWorkletNodeConnected = !0)
                    })
                },
                9113952: () => {
                    window.waitForAudioWorklet = function(e, r) {
                        var n = null;
                        if (e()) n = setInterval(function() {
                            e() || (r(), clearInterval(n))
                        }, 50);
                        else return r(), null;
                        return n
                    }
                },
                9114224: () => (mContext && mContext.resume(), mWorkletNode),
                9114286: () => (mWorkletNode = null, mModulePolling = !1, mModuleLoading = !1, mStartInterval = null, mStopInterval = null, mSuspendInterval = null, mResumeInterval = null, mWorkletNodeConnected = !1, mContext = new(window.AudioContext || window.webkitAudioContext), mContext ? (mContext.destination.channelCount = mContext.destination.maxChannelCount, mContext.destination.maxChannelCount) : 0),
                9114701: e => (e || (mAddModuleRef = 0), self.AudioWorkletNode ? mContext.audioWorklet.addModule ? (FMOD_JS_MixerSlowpathFunction = f.cwrap("FMOD_JS_MixerSlowpathFunction", "void", []), FMOD_JS_MixerFastpathFunction = f.cwrap("FMOD_JS_MixerFastpathFunction", "void", ["number"]), mContext.sampleRate) : -2 : -1),
                9115094: (e, r, n) => {
                    const t = e,
                        a = r,
                        i = n;
                    for (var o = ee.subarray(t / 4 >>> 0, t / 4 + a * i >>> 0), s = 0; s < i; s++) {
                        const u = s * a;
                        for (var c = 0; c < a; c++) mOutputData[c + u] = o[c * i + s]
                    }
                },
                9115514: () => (infocontext = new(window.AudioContext || window.webkitAudioContext), infocontext ? (inforate = infocontext.sampleRate, infocontext.close(), delete infocontext, inforate) : 0),
                9115715: (e, r, n, t) => {
                    mFastpathPayload = {}, mFastpathPayload.heapBuffer = ee.buffer, mFastpathPayload.dataOffset = e, mFastpathPayload.syncOffset = r, mFastpathPayload.channelCount = n, mFastpathPayload.bufferSize = t
                },
                9115926: () => {
                    mStartInterval && clearInterval(mStartInterval), mStopInterval && clearInterval(mStopInterval), mSuspendInterval && clearInterval(mSuspendInterval), mResumeInterval && clearInterval(mResumeInterval), mWorkletNode && (mWorkletNodeConnected && mWorkletNode.disconnect(), mWorkletNode.port.onmessage = null, delete mWorkletNode), mContext && (mContext.close(), delete mContext)
                },
                9116344: (e, r, n, t) => {
                    const a = e,
                        i = r,
                        o = n,
                        s = t;
                    var c = ee.subarray(a / 4 >>> 0, a / 4 + i * o >>> 0);
                    const u = o * s * i;
                    for (var d = 0; d < o; d++) {
                        const x = d * i + u;
                        for (var p = 0; p < i; p++) mOutputData[p + x] = c[p * o + d]
                    }
                },
                9116868: (e, r) => {
                    mSpeakerChannelCount = e;
                    const n = r;
                    return mUrl = null, mOutputData = null, mSharedArrayBuffers = !1, self.SharedArrayBuffer && self.crossOriginIsolated && (mSharedArrayBuffers = !0), !mSharedArrayBuffers || (mUrl = f.audioProcessorUrl, !mUrl) ? -1 : (mOutputData = null, mModulePolling = !0, mSharedArrayBuffers)
                },
                9117251: () => {
                    mContext && mContext.suspend()
                },
                9117293: () => {
                    mStartInterval && (clearInterval(mStartInterval), mStartInterval = null), mStopInterval && (clearInterval(mStopInterval), mStopInterval = null), mModulePolling = !1, mWorkletNode && mWorkletNodeConnected && (mWorkletNode.disconnect(), mWorkletNodeConnected = !1)
                },
                9117579: () => {
                    _as_script_node.disconnect(context.destination)
                },
                9117632: () => {
                    context.suspend()
                },
                9117655: () => (infocontext = new(window.AudioContext || window.webkitAudioContext), infocontext ? (inforate = infocontext.sampleRate, infocontext.close(), delete infocontext, inforate) : 0),
                9117856: (e, r) => {
                    _as_script_node = context.createScriptProcessor(r, 0, e)
                },
                9117920: (e, r, n, t) => {
                    for (var a = ee.subarray(e / 4 >>> 0, e / 4 + n * t >>> 0), i = 0; i < t; i++)
                        for (var o = _as_output_buffer.getChannelData(i), s = 0; s < n; s++) o[s + r] = a[s * t + i]
                },
                9118195: () => {
                    context.resume()
                },
                9118217: () => (context = new(window.AudioContext || window.webkitAudioContext), context ? (FMOD_JS_MixFunction = f.cwrap("FMOD_JS_MixFunction", "void", ["number"]), context.sampleRate) : 0),
                9118423: () => {
                    _as_script_node.connect(context.destination), _as_script_node.onaudioprocess = function(e) {
                        _as_output_buffer = e.outputBuffer, FMOD_JS_MixFunction(_as_output_buffer.getChannelData(0).length)
                    }
                },
                9118661: () => f.preinitializedWebGPUDevice ? 1 : 0,
                9118718: () => {
                    const e = f.preinitializedWebGPUDevice;
                    e.rbxDeviceLost = !1, e.lost.then(function(r) {
                        e.rbxDeviceLost = !0, console.error("[WebGPU] Device LOST:", r.reason, r.message)
                    })
                },
                9118945: () => f.preinitializedWebGPUDevice.rbxDeviceLost ? 1 : 0,
                9119019: (e, r) => {
                    f.saveIxpSettings && f.saveIxpSettings(T(e, r))
                },
                9119097: e => {
                    console.warn("[wasm-cors] engine sent non-allowlisted request header: " + T(e))
                },
                9119194: (e, r, n, t) => {
                    const i = T(e).split(/[\/]/).pop() || "MicroProfilerDump.html";
                    if (globalThis.__downloadMicroProfile) {
                        const o = W.slice(r, r + n),
                            s = t ? "application/octet-stream" : "text/html;charset=utf-8";
                        globalThis.__downloadMicroProfile(o, i, s)
                    } else console.error("[MicroProfile] browser download helper is unavailable")
                },
                9119603: () => typeof wasmOffsetConverter < "u",
                9119660: () => {
                    if (f.getRandomValue === void 0) try {
                        var e = typeof window == "object" ? window : self,
                            r = typeof e.crypto < "u" ? e.crypto : e.msCrypto;
                        r = r === void 0 ? t : r;
                        var n = function() {
                            var i = new Uint32Array(1);
                            return r.getRandomValues(i), i[0] >>> 0
                        };
                        n(), f.getRandomValue = n
                    } catch {
                        try {
                            var t = require("crypto"),
                                a = function() {
                                    var o = t.randomBytes(4);
                                    return (o[0] << 24 | o[1] << 16 | o[2] << 8 | o[3]) >>> 0
                                };
                            a(), f.getRandomValue = a
                        } catch {
                            throw "No secure random number generator found"
                        }
                    }
                },
                9120436: () => f.getRandomValue()
            };

        function na(e, r, n) {
            return J.handleAsync(async () => {
                const t = n === 1 / 0 ? void 0 : n,
                    a = Atomics.waitAsync(_, e >> 2, r, t);
                if (a.async) {
                    const i = await a.value;
                    return i === "ok" ? 0 : i === "not-equal" ? 1 : 2
                }
                return a.value === "ok" ? 0 : a.value === "not-equal" ? 1 : 2
            })
        }
        na.sig = "iiid";

        function ym(e, r, n, t, a, i) {
            return J.handleAsync(async () => {
                try {
                    const o = n ? "image/png" : "image/jpeg";
                    let s = 0,
                        c = 0,
                        u = 0;
                    if (typeof ImageDecoder == "function" && await ImageDecoder.isTypeSupported(o)) {
                        const p = new ImageDecoder({
                                data: W.subarray(e >>> 0, e + r >>> 0),
                                type: o,
                                premultiplyAlpha: "none",
                                colorSpaceConversion: "none"
                            }),
                            x = await p.decode();
                        s = x.image.codedWidth, c = x.image.codedHeight;
                        const B = s * c * 4;
                        if (u = H(B), !u) return x.image.close(), p.close(), -1;
                        await x.image.copyTo(W.subarray(u >>> 0, u + B >>> 0), {
                            format: "RGBA",
                            colorSpace: "srgb"
                        }), x.image.close(), p.close()
                    }
                    if (!u) {
                        const d = new Blob([W.subarray(e >>> 0, e + r >>> 0)], {
                                type: o
                            }),
                            p = await createImageBitmap(d, {
                                premultiplyAlpha: "none",
                                colorSpaceConversion: "none"
                            });
                        s = p.width, c = p.height;
                        const B = new OffscreenCanvas(s, c).getContext("2d", {
                            willReadFrequently: !0
                        });
                        B.drawImage(p, 0, 0);
                        const k = B.getImageData(0, 0, s, c),
                            I = s * c * 4;
                        if (u = H(I), !u) return p.close(), -1;
                        W.set(k.data, u >>> 0), p.close()
                    }
                    return _[t >>> 2] = s, _[a >>> 2] = c, _[i >>> 2] = u, 0
                } catch (o) {
                    return console.warn("[image_decode] browser decode failed:", o), -1
                }
            })
        }

        function ta() {
            return !matchMedia("(hover: none), (pointer: coarse)").matches
        }
        ta.sig = "i";

        function aa() {
            var e = !1;
            return "maxTouchPoints" in navigator && (e = navigator.maxTouchPoints > 0), e
        }
        aa.sig = "i";

        function ia(e) {
            S.keyEvent || (S.keyEvent = e)
        }
        ia.sig = "vi";

        function oa() {
            const e = f.lastPointerType;
            return e === "touch" ? !1 : e !== "pen" ? !0 : (f.penFiresTouchEvents === null && f.penContactActive && (f.penFiresTouchEvents = !1), f.penFiresTouchEvents === !1)
        }
        oa.sig = "i";

        function sa() {
            f.lastPointerType = "mouse", f.penFiresTouchEvents = null, f.penContactActive = !1;
            const e = r => {
                f.lastPointerType = r.pointerType, r.pointerType === "pen" && (r.type === "pointerdown" ? f.penContactActive = !0 : (r.type === "pointerup" || r.type === "pointercancel") && (f.penContactActive = !1))
            };
            for (const r of ["pointerover", "pointerenter", "pointerdown", "pointermove", "pointerup", "pointercancel", "pointerout", "pointerleave"]) window.addEventListener(r, e, {
                capture: !0,
                passive: !0
            });
            window.addEventListener("touchstart", () => {
                f.lastPointerType === "pen" && (f.penFiresTouchEvents = !0)
            }, {
                capture: !0,
                passive: !0
            })
        }
        sa.sig = "v";

        function ca() {
            return matchMedia("(pointer: fine)").matches
        }
        ca.sig = "i";

        function la() {
            if (!f._mainLoopChan) {
                var e = new MessageChannel;
                f._mainLoopChan = e;
                var r = 1,
                    n = 0;
                e.port1.onmessage = async function() {
                    var t = performance.now() - n;
                    t < r && await new Promise(function(a) {
                        setTimeout(a, r - t)
                    }), n = performance.now();
                    try {
                        await f._main_loop_iteration()
                    } catch (a) {
                        console.error("main_loop_iteration threw", a), f.reportEngineError?.(a)
                    }
                    e.port2.postMessage(0)
                }, e.port2.postMessage(0)
            }
        }
        la.sig = "v";

        function ua() {
            return f && typeof f.getEffectiveDevicePixelRatio == "function" ? f.getEffectiveDevicePixelRatio() : window.devicePixelRatio || 1
        }
        ua.sig = "d";

        function fa() {
            return f && typeof f.isMobileDevice == "function" ? f.isMobileDevice() : /Mobi|Android/i.test(navigator.userAgent)
        }
        fa.sig = "i";

        function da() {
            return matchMedia("(hover: none), (pointer: coarse)").matches
        }
        da.sig = "i";

        function _a(e, r) {
            const i = window.__rbxLinkingPrompt;
            i && (i.remove(), window.__rbxLinkingPrompt = null);
            let o = null;
            try {
                o = new URL(T(e))
            } catch {}
            if (!o || o.protocol !== "https:" && o.protocol !== "http:") return console.warn("[Linking] openURL rejected a URL that is not http(s)"), 0;
            const s = () => {
                const d = window.open(o.href, "_blank");
                if (!d) return !1;
                try {
                    d.opener = null
                } catch {}
                return !0
            };
            if (navigator.userActivation && navigator.userActivation.isActive && s()) return 1;
            const c = d => {
                    u.remove(), window.__rbxLinkingPrompt === u && (window.__rbxLinkingPrompt = null), f._linking_on_prompt_result(r, d ? 1 : 0)
                },
                u = window.__rbxTabPrompt.create({
                    heading: "Open link in a new tab",
                    description: `This opens ${o.hostname} in a new browser tab.`,
                    cancelLabel: "Cancel",
                    openLabel: "Open",
                    onCancel: () => c(!1),
                    onOpen: () => {
                        s() ? c(!0) : u.showError(window.__rbxTabPrompt.blockedMessage)
                    }
                });
            return window.__rbxLinkingPrompt = u, u.focus(), 2
        }
        _a.sig = "iii";

        function ma() {
            return performance.now()
        }
        ma.sig = "d";

        function pa() {
            return document.visibilityState === "visible" ? 1 : 0
        }
        pa.sig = "i";

        function ga() {
            return window.__webClientWasmCacheState || 0
        }
        ga.sig = "i";

        function va() {
            const e = f.currentInput;
            e && e.focus()
        }
        va.sig = "v";

        function ba(e) {
            const r = f.inputContainer,
                n = f.currentInput;
            r && n && (e ? (n.style.background = "none", r.style.zIndex = 100) : (n.style.background = "white", r.style.zIndex = -100))
        }
        ba.sig = "vi";

        function ha(e) {
            const r = document.getElementById("canvas"),
                n = f.inputContainer;
            r && n && (r.style.transform = `translateY(${e}px)`, n.style.transform = `translateY(${e}px)`)
        }
        ha.sig = "vf";

        function wa(e) {
            f.pendingBytes && W.set(f.pendingBytes, e >>> 0)
        }
        wa.sig = "vi";

        function xa(e, r, n, t) {
            const a = f.currentInput;
            if (a) {
                const i = Math.floor(e * 255),
                    o = Math.floor(r * 255),
                    s = Math.floor(n * 255);
                a.style.color = `rgb(${i} ${o} ${s} / ${t})`
            }
        }
        xa.sig = "vffff";

        function ya(e, r, n) {
            var t = T(e),
                a = null;
            t == "text" || t == "no-suggestions" ? (!r && !n ? (a = f.inputElement, a.type = "text") : a = f.textAreaElement, t == "no-suggestions" ? (a.setAttribute("autocomplete", "off"), a.setAttribute("autocorrect", "off"), a.setAttribute("spellcheck", "false")) : (a.removeAttribute("autocomplete"), a.removeAttribute("autocorrect"), a.removeAttribute("spellcheck"))) : (a = f.inputElement, a.type = t), a.tagName === "TEXTAREA" && (a.rows = r ? 2 : 1), a.style.display = "block", f.currentInput = a, f.currentInputMultiline = r
        }
        ya.sig = "viii";

        function Ca() {
            const e = f.inputContainer,
                r = f.currentInput;
            e && r && (e.style.zIndex = -100, r.blur())
        }
        Ca.sig = "v";

        function Sa() {
            f.currentInput && (f.currentInput.style.display = "none", f.currentInput = null)
        }
        Sa.sig = "v";

        function ka(e) {
            const r = f.currentInput;
            r && (r.style.textAlign = T(e))
        }
        ka.sig = "vi";

        function Ta(e) {
            const r = f.inputContainer;
            r && (r.style.alignItems = T(e))
        }
        Ta.sig = "vi";

        function Ba(e, r, n, t, a, i) {
            const o = T(e),
                s = window.__wasmLoaderContext.engineBase + T(r),
                c = f.currentInput;
            if (!c) {
                console.warn(`[WebKeyboard] setup_font: no current text input for ${o}`);
                return
            }
            const u = `rbx-${o}`,
                d = n > 0 ? n : 400;
            if (c.style.fontFamily = `"${u}", sans-serif`, c.style.fontWeight = `${d}`, c.style.fontSize = `${t}px`, c.style.fontStyle = a ? "italic" : "normal", u in f.fontMap) return;
            const p = performance.now(),
                x = {
                    weight: `${d}`,
                    style: a ? "italic" : "normal"
                },
                B = i ? fetch(s).then(k => {
                    if (!k.ok) throw new Error(`HTTP ${k.status}`);
                    return k.arrayBuffer()
                }).then(k => new FontFace(u, k, x).load()) : new FontFace(u, `url(${JSON.stringify(s)})`, x).load();
            f.fontMap[u] = B.then(k => (document.fonts.add(k), k), k => {
                delete f.fontMap[u];
                const I = Array.from(document.fonts).map(b => `${b.family}:${b.status}`);
                console.error(`[WebKeyboard] font load failed name=${u} url=${s} after ${Math.round(performance.now()-p)}ms`, k, `page font faces: ${I.join(", ")}`)
            })
        }
        Ba.sig = "viiifii";

        function Aa(e, r, n) {
            const t = f.currentInput;
            if (t) {
                const a = T(e),
                    i = f.encoder.encode(a),
                    o = f.decoder.decode(i.subarray(0, r)).length,
                    s = n == r ? o : f.decoder.decode(i.subarray(0, n)).length;
                t.value = a, t.selectionStart = o, t.selectionEnd = s
            } else console.error("Could not find current text input to update.")
        }
        Aa.sig = "viii";

        function Ea(e, r, n, t) {
            const a = f.inputContainer,
                i = f.currentInput;
            a && i ? (a.style.left = `${e}px`, a.style.top = `${r}px`, a.style.width = `${n}px`, a.style.height = `${t}px`, i.style.width = `${n}px`, i.style.maxHeight = `${t}px`) : console.error("Could not find current text input to update.")
        }
        Ea.sig = "vffff";

        function Fa(e, r) {
            const n = T(e),
                t = (window.__rbxShareRequest || 0) + 1;
            window.__rbxShareRequest = t;
            const a = window.__rbxSharePrompt;
            a && (a.remove(), window.__rbxSharePrompt = null);
            const i = r !== 0 && typeof navigator.share == "function" && (typeof navigator.canShare != "function" || navigator.canShare({
                    text: n
                })),
                o = () => navigator.clipboard.writeText(n),
                s = p => p && p.name === "AbortError",
                c = p => p && p.name === "InvalidStateError",
                u = p => p && p.name === "NotAllowedError",
                d = p => {
                    if (window.__rbxShareRequest !== t) return;
                    const x = () => {
                            I.remove(), window.__rbxSharePrompt === I && (window.__rbxSharePrompt = null)
                        },
                        B = () => o().then(x, () => I.showError("The browser blocked copying to the clipboard.")),
                        k = () => navigator.share({
                            text: n
                        }).then(x, b => {
                            if (!c(b)) {
                                if (s(b)) {
                                    x();
                                    return
                                }
                                B()
                            }
                        }),
                        I = window.__rbxTabPrompt.create({
                            heading: p ? "Share" : "Copy to clipboard",
                            description: n,
                            cancelLabel: "Cancel",
                            openLabel: p ? "Share" : "Copy",
                            onCancel: x,
                            onOpen: p ? k : B
                        });
                    window.__rbxSharePrompt = I, I.focus()
                };
            if (i) {
                navigator.share({
                    text: n
                }).catch(p => {
                    if (!(s(p) || c(p))) {
                        if (u(p)) {
                            d(!0);
                            return
                        }
                        o().catch(() => d(!1))
                    }
                });
                return
            }
            o().catch(() => d(!1))
        }
        Fa.sig = "vii";

        function Ia(e, r, n, t, a) {
            return J.handleAsync(async () => (f.resumptions == null && (f.resumptions = {}), f.updateStackLimits || (f.updateStackLimits = function(i, o) {
                f._set_stack_limits(i, o), f.___set_stack_limits && f.___set_stack_limits(i, o)
            }), new Promise(i => {
                f.resumptions[e] = [i, f._get_stack_ptr(), f._get_stack_base(), f._get_stack_end()], f.updateStackLimits(r, n), f._set_stack_ptr(r), f._fiber_entry(e, t, a).catch(o => {
                    if (f._pendingFiberDestroys > 0) {
                        f._pendingFiberDestroys--;
                        return
                    }
                    throw o
                })
            })))
        }
        Ia.sig = "iiiiii";

        function Da(e, r) {
            if (e != r) return new Promise(n => {
                e != 0 && (f.resumptions[e] = [n, f._get_stack_ptr(), f._get_stack_base(), f._get_stack_end()]);
                const t = f.resumptions[r];
                delete f.resumptions[r], f.updateStackLimits(t[2], t[3]), f._set_stack_ptr(t[1]), t[0](e)
            })
        }
        Da.sig = "iii";

        function Oa(e) {
            const r = f.resumptions[e];
            delete f.resumptions[e], f._pendingFiberDestroys = (f._pendingFiberDestroys || 0) + 1, r[0](0)
        }
        Oa.sig = "vi";

        function Ma(e, r, n) {
            const t = f.rbxKeyboardLayout.get(T(e)) || "",
                a = t.toLocaleUpperCase();
            P(a.length === t.length ? a : t, r, n)
        }
        Ma.sig = "viii";

        function Ra() {
            const e = f.rbxKeyboardLayout;
            return e === void 0 ? 0 : e === null ? -1 : 1
        }
        Ra.sig = "i";

        function La() {
            const e = typeof navigator < "u" ? navigator.keyboard : void 0;
            if (!e || typeof e.getLayoutMap != "function") {
                f.rbxKeyboardLayout = null;
                return
            }
            f.rbxKeyboardLayout = void 0;
            try {
                e.getLayoutMap().then(function(r) {
                    f.rbxKeyboardLayout = r
                }, function() {
                    f.rbxKeyboardLayout = null
                })
            } catch {
                f.rbxKeyboardLayout = null
            }
        }
        La.sig = "v";

        function Wa(e) {
            const r = f.__rbxWasmRna,
                n = Number(e) >>> 0,
                t = r && r.findConn(e);
            if (t) {
                t.reportHandshake && t.reportHandshake(!1, !1), t.closed = !0;
                try {
                    t.transport && t.transport.close({
                        closeCode: 0,
                        reason: ""
                    })
                } catch {}
                r.conns.delete(n)
            }
            Promise.resolve().then(() => {
                r && r.queueDeferredCallback && r.queueDeferredCallback({
                    kind: "closeComplete",
                    id: n
                })
            })
        }
        Wa.sig = "vi";

        function ja(e, r, n, t, a, i, o, s, c, u, d, p, x, B) {
            const k = T(r),
                I = [];
            for (let y = 0; y < t; ++y) I.push(T(m[(n >> 2) + y >>> 0]));
            const b = f.__rbxWasmRna || (f.__rbxWasmRna = {
                conns: new Map
            });
            b.findConn || (b.findConn = function(y) {
                return b.conns.get(Number(y) >>> 0)
            }), b.pendingCallbacks = b.pendingCallbacks || [];
            const D = Number(e) >>> 0;

            function C(y) {
                return {
                    name: y && y.name,
                    message: y && y.message,
                    source: y && y.source,
                    streamErrorCode: y && y.streamErrorCode,
                    stack: y && y.stack,
                    value: String(y)
                }
            }

            function O(y) {
                const h = C(y);
                return "name=" + h.name + " message=" + h.message + " source=" + h.source + " streamErrorCode=" + h.streamErrorCode + " value=" + h.value + " stack=" + h.stack
            }

            function z(y) {
                if (!u) return 0;
                const h = y && y.streamErrorCode;
                return Number.isInteger(h) && h > 0 && h <= 4294967295 ? h : 0
            }
            if (b.queueDeferredCallback || (b.queueDeferredCallback = function(y) {
                    b.pendingCallbacks.push(y), b.schedulePendingCallbackDrain()
                }), b.drainPendingCallbacks || (b.drainPendingCallbacks = async function() {
                    if (b.drainingPendingCallbacks || !b.pendingCallbacks || b.pendingCallbacks.length === 0) return;
                    b.drainingPendingCallbacks = !0;
                    const y = b.pendingCallbacks;
                    b.pendingCallbacks = [];
                    async function h(w, j) {
                        const K = f[w];
                        return typeof K == "function" ? (await K.apply(null, j), !0) : !1
                    }
                    try {
                        for (const w of y) try {
                            switch (w.kind) {
                                case "handshake":
                                    await h("rbx_wasm_rna_on_handshake", [w.id, w.isCompleted, w.hasError, w.errorName, w.errorSource, w.streamErrorCode, w.closeCode]);
                                    break;
                                case "connectSuccess":
                                    await h("rbx_wasm_rna_on_connect_success", [w.id, w.maxDatagramSize]);
                                    break;
                                case "connectError":
                                    await h("rbx_wasm_rna_on_connect_error", [w.id]);
                                    break;
                                case "closeComplete":
                                    await h("rbx_wasm_rna_on_close_complete", [w.id]);
                                    break;
                                case "connectionClosed":
                                    await h("rbx_wasm_rna_on_connection_closed", [w.id, w.closeCode, w.serializedReasonClass, w.hasSerializedStateReason]);
                                    break;
                                case "streamAccepted":
                                    await h("rbx_wasm_rna_on_stream_accepted", [w.id, w.streamId]);
                                    break;
                                case "receiveRingSlot":
                                    await h("rbx_wasm_rna_on_receive_ring_slot", [w.id, w.receiveKind, w.streamId, w.slotIndex, w.dataLen]);
                                    break;
                                case "streamFin":
                                    await h("rbx_wasm_rna_on_stream_fin", [w.id, w.streamId]);
                                    break;
                                case "streamError":
                                    await h("rbx_wasm_rna_on_stream_error", [w.id, w.streamId, w.streamErrorCode || 0]);
                                    break;
                                case "streamWriteSuccess":
                                    await h("rbx_wasm_rna_on_stream_write_success", [w.id, w.streamId, w.bytesWritten]);
                                    break;
                                case "streamWriteError":
                                    await h("rbx_wasm_rna_on_stream_write_error", [w.id, w.streamId]);
                                    break;
                                case "datagramAcked":
                                    await h("rbx_wasm_rna_on_datagram_acked", [w.id, w.datagramHi, w.datagramLo]);
                                    break;
                                case "datagramLost":
                                    await h("rbx_wasm_rna_on_datagram_lost", [w.id, w.datagramHi, w.datagramLo]);
                                    break;
                                case "connectionStats":
                                    await h("rbx_wasm_rna_on_connection_stats", [w.id].concat(w.values));
                                    break;
                                default:
                                    console.error("[WASM-RNA] JS unknown deferred callback kind=" + w.kind);
                                    break
                            }
                        } catch (j) {
                            if (console.error("[WASM-RNA] JS deferred callback failed kind=" + w.kind + " error=" + O(j)), w.kind === "receiveRingSlot" && w.receiveKind === 0) try {
                                await h("rbx_wasm_rna_on_stream_error", [w.id, w.streamId, 0])
                            } catch (K) {
                                console.error("[WASM-RNA] JS deferred stream error callback failed error=" + O(K))
                            }
                        }
                    } finally {
                        b.drainingPendingCallbacks = !1, b.pendingCallbacks.length !== 0 && b.schedulePendingCallbackDrain()
                    }
                }), !b.schedulePendingCallbackDrain) {
                const y = new MessageChannel;
                b.callbackDrainChannel = y, b.callbackDrainScheduled = !1, b.schedulePendingCallbackDrain = function() {
                    b.callbackDrainScheduled || (b.callbackDrainScheduled = !0, y.port2.postMessage(0))
                }, y.port1.onmessage = async function() {
                    b.callbackDrainScheduled = !1;
                    try {
                        await b.drainPendingCallbacks()
                    } catch (h) {
                        console.error("[WASM-RNA] JS callback drain failed error=" + O(h))
                    }
                }
            }

            function G(y) {
                b.queueDeferredCallback(y)
            }

            function M(y) {
                const h = atob(y),
                    w = new Uint8Array(h.length);
                for (let j = 0; j < h.length; ++j) w[j] = h.charCodeAt(j);
                return w
            }

            function _r(y) {
                if (typeof y != "string") return null;
                if (y.startsWith("RBX1:")) return y.length === 13 && /^RBX1:[0-9a-f]{8}$/.test(y) ? parseInt(y.slice(5), 16) : 0;
                const h = new TextEncoder().encode(y);
                if (h.byteLength < 8) return null;
                for (let w = 0; w < 4; ++w)
                    if (h[w] > 127) return 0;
                return h[0] * 16777216 + (h[1] << 16) + (h[2] << 8) + h[3] >>> 0
            }
            if (typeof WebTransport > "u") {
                console.error("[WASM-RNA] JS WebTransport is unavailable"), G({
                    kind: "connectError",
                    id: D
                });
                return
            }
            const A = {
                transport: null,
                streams: new Map,
                datagramWriter: null,
                nextIncomingStreamId: 3,
                closed: !1,
                fixConnOwnership: !!d,
                receiveDataPtr: Number(a),
                receiveHeadPtr: Number(i),
                receiveTailPtr: Number(o),
                receiveSlotSize: Number(s),
                receiveSlotCount: Number(c),
                droppedDatagrams: 0
            };
            p && (A.datagramWritableCompatEnabled = !0), b.conns.set(D, A), A.isCurrentConnection = () => b.conns.get(D) === A, A.isActive = () => !A.closed && (!A.fixConnOwnership || A.isCurrentConnection());
            const qe = 0,
                cn = 1;
            A.tryWriteReceiveRingSlot = function(y, h, w, j) {
                if (A.fixConnOwnership && !A.isActive()) return 0;
                const K = A.receiveHeadPtr >>> 2,
                    V = A.receiveTailPtr >>> 2,
                    ue = Atomics.load(f.HEAP32, K) >>> 0,
                    pr = Atomics.load(f.HEAP32, V) >>> 0;
                if (ue - pr >>> 0 >= A.receiveSlotCount) return 0;
                const we = Math.min(w.byteLength - j, A.receiveSlotSize),
                    qi = ue % A.receiveSlotCount,
                    pm = A.receiveDataPtr + qi * A.receiveSlotSize;
                return f.HEAPU8.set(w.subarray(j, j + we), pm), Atomics.store(f.HEAP32, K, ue + 1 | 0), G({
                    kind: "receiveRingSlot",
                    id: D,
                    receiveKind: y,
                    streamId: h,
                    slotIndex: qi,
                    dataLen: we
                }), we
            };
            async function ln() {
                try {
                    const y = A.transport.incomingUnidirectionalStreams.getReader();
                    for (;;) {
                        const h = await y.read();
                        if (h.done || !A.isActive()) return;
                        const w = A.nextIncomingStreamId;
                        A.nextIncomingStreamId += 4;
                        const j = h.value;
                        A.streams.set(w, {
                            readable: j,
                            reader: null,
                            readLoopActive: !1,
                            paused: !0,
                            cancelled: !1,
                            pendingChunk: null,
                            pendingChunkOffset: 0,
                            awaitingReceiveConsumption: !1
                        }), G({
                            kind: "streamAccepted",
                            id: D,
                            streamId: w
                        })
                    }
                } catch (y) {
                    if (A.isActive()) {
                        if (console.error("[WASM-RNA] JS incoming stream reader failed", {
                                id: D,
                                error: C(y)
                            }), u && y && y.source === "session") return;
                        A.closed = !0;
                        try {
                            A.transport && A.transport.close({
                                closeCode: 0,
                                reason: "incoming stream reader failed"
                            })
                        } catch {}
                        b.conns.delete(D), G({
                            kind: "connectError",
                            id: D
                        })
                    }
                }
            }

            function le(y, h) {
                if (!(!h || !h.readable || !A.isActive() || h.cancelled || h.paused || h.readLoopActive || h.awaitingReceiveConsumption)) {
                    if (h.pendingChunk) {
                        const w = A.tryWriteReceiveRingSlot(qe, y, h.pendingChunk, h.pendingChunkOffset);
                        if (w === 0) return;
                        h.pendingChunkOffset += w, h.awaitingReceiveConsumption = !0;
                        return
                    }
                    un(y, h)
                }
            }
            async function un(y, h) {
                if (!(h.readLoopActive || h.awaitingReceiveConsumption || h.pendingChunk || !A.isActive() || h.cancelled || h.paused)) {
                    h.readLoopActive = !0, h.reader || (h.reader = h.readable.getReader());
                    try {
                        const w = await h.reader.read();
                        if (h.readLoopActive = !1, !A.isActive() || h.cancelled) return;
                        if (w.done) {
                            G({
                                kind: "streamFin",
                                id: D,
                                streamId: y
                            });
                            return
                        }
                        h.pendingChunk = w.value instanceof Uint8Array ? w.value : new Uint8Array(w.value), h.pendingChunkOffset = 0, h.pendingChunk.byteLength === 0 && (h.pendingChunk = null), le(y, h)
                    } catch (w) {
                        if (h.readLoopActive = !1, A.isActive() && !h.cancelled) {
                            if (console.error("[WASM-RNA] JS stream read failed id=" + D + " streamId=" + y + " error=" + O(w)), u && w && w.source === "session") return;
                            G({
                                kind: "streamError",
                                id: D,
                                streamId: y,
                                streamErrorCode: z(w)
                            })
                        }
                    }
                }
            }
            A.onReceiveRingConsumed = function(y, h) {
                if (y === qe) {
                    const w = A.streams.get(h);
                    w && w.readable && (w.awaitingReceiveConsumption = !1, w.pendingChunk && w.pendingChunkOffset >= w.pendingChunk.byteLength && (w.pendingChunk = null, w.pendingChunkOffset = 0), le(h, w))
                }
                for (const [w, j] of A.streams) j && j.readable && j.pendingChunk && !j.awaitingReceiveConsumption && le(w, j)
            }, A.resumeStreamRead = function(y) {
                const h = A.streams.get(y);
                !h || !h.readable || !A.isActive() || h.cancelled || (h.paused = !1, le(y, h))
            };
            async function mr() {
                if (!A.transport.datagrams || !A.transport.datagrams.readable) return;
                const y = A.transport.datagrams.readable.getReader();
                try {
                    for (;;) {
                        const h = await y.read();
                        if (h.done || !A.isActive()) return;
                        const w = h.value instanceof Uint8Array ? h.value : new Uint8Array(h.value);
                        (w.byteLength > A.receiveSlotSize || A.tryWriteReceiveRingSlot(cn, 0, w, 0) === 0) && ++A.droppedDatagrams
                    }
                } catch (h) {
                    A.isActive() && console.error("[WASM-RNA] JS datagram reader stopped id=" + D + " error=" + O(h))
                }
            }

            function q(y) {
                if (typeof y.getStats != "function") return;

                function h(V) {
                    return typeof V == "bigint" && (V = Number(V)), typeof V == "number" && Number.isFinite(V) && V >= 0 ? V : -1
                }
                let w = !1,
                    j = null;

                function K() {
                    if (!A.isActive()) {
                        clearInterval(j);
                        return
                    }
                    w || (w = !0, y.getStats().then(V => {
                        if (w = !1, !V || !A.isActive()) return;
                        const ue = V.datagrams || {};
                        G({
                            kind: "connectionStats",
                            id: D,
                            values: [h(V.smoothedRtt), h(V.minRtt), h(V.rttVariation), h(V.estimatedSendRate), h(V.packetsSent), h(V.bytesSent), h(V.bytesSentOverhead), h(V.packetsReceived), h(V.bytesReceived), h(V.packetsLost), h(V.bytesLost), A.droppedDatagrams, h(ue.droppedIncoming), h(ue.expiredIncoming), h(ue.expiredOutgoing), h(ue.lostOutgoing)]
                        })
                    }, () => {
                        w = !1
                    }))
                }
                j = setInterval(K, B), K()
            }
            x && (A.reportHandshake = function(h, w, j, K = -1) {
                A.reportHandshake = null;
                let V = "",
                    ue = "",
                    pr = -1;
                try {
                    V = j && typeof j.name == "string" ? j.name.slice(0, 64) : "", ue = j && typeof j.source == "string" ? j.source.slice(0, 64) : "";
                    const we = j && j.streamErrorCode;
                    Number.isInteger(we) && we >= 0 && we <= 4294967295 && (pr = we)
                } catch {}
                G({
                    kind: "handshake",
                    id: D,
                    isCompleted: h,
                    hasError: w,
                    errorName: V,
                    errorSource: ue,
                    streamErrorCode: pr,
                    closeCode: K
                })
            });
            try {
                const y = I.length > 0 ? {
                        serverCertificateHashes: I.map(w => ({
                            algorithm: "sha-256",
                            value: M(w)
                        }))
                    } : void 0,
                    h = y ? new WebTransport(k, y) : new WebTransport(k);
                A.transport = h, h.ready.then(() => {
                    if (!A.isActive()) return;
                    let w = 0;
                    h.datagrams && typeof h.datagrams.maxDatagramSize == "number" && (w = h.datagrams.maxDatagramSize), A.reportHandshake && A.reportHandshake(!0, !1), G({
                        kind: "connectSuccess",
                        id: D,
                        maxDatagramSize: w >>> 0
                    }), ln(), mr(), B !== 0 && q(h)
                }, w => {
                    A.isActive() && (A.reportHandshake && A.reportHandshake(!1, !0, w), console.error("[WASM-RNA] JS WebTransport ready rejected", {
                        id: D,
                        error: C(w)
                    }), A.closed = !0, G({
                        kind: "connectError",
                        id: D
                    }))
                }), h.closed.then(w => {
                    if (!(A.fixConnOwnership && !A.isCurrentConnection())) {
                        if (!A.closed) {
                            A.closed = !0;
                            const j = w && typeof w.closeCode == "number" ? w.closeCode >>> 0 : 0;
                            if (A.reportHandshake) {
                                const V = w && typeof w.closeCode == "number" ? w.closeCode : -1;
                                A.reportHandshake(!1, !0, void 0, V)
                            }
                            const K = _r(w && w.reason);
                            G({
                                kind: "connectionClosed",
                                id: D,
                                closeCode: j,
                                serializedReasonClass: K === null ? 0 : K,
                                hasSerializedStateReason: K !== null
                            })
                        }
                        b.conns.delete(D)
                    }
                }).catch(w => {
                    A.fixConnOwnership && !A.isCurrentConnection() || (console.error("[WASM-RNA] JS WebTransport closed rejected id=" + D + " error=" + O(w)), A.closed || (A.reportHandshake && A.reportHandshake(!1, !0, w), A.closed = !0, G({
                        kind: "connectError",
                        id: D
                    })), b.conns.delete(D))
                })
            } catch (y) {
                console.error("[WASM-RNA] JS WebTransport constructor threw", {
                    id: D,
                    url: k,
                    error: C(y)
                }), A.reportHandshake && A.reportHandshake(!1, !0, y), b.conns.delete(D), G({
                    kind: "connectError",
                    id: D
                })
            }
        }
        ja.sig = "viiiiiiiiiiiiii";

        function Ua() {
            return typeof WebTransport < "u"
        }
        Ua.sig = "i";

        function Ga(e, r) {
            const n = f.__rbxWasmRna,
                t = Number(e) >>> 0,
                a = n && n.findConn(e);
            if (!a || !a.transport || !a.isActive()) return;
            const i = {
                writer: null,
                ready: null,
                writeChain: Promise.resolve(),
                writeClosed: !1
            };

            function o(s) {
                return s ? (i.writer = s.getWriter(), a.fixConnOwnership && !a.isActive() ? (i.writer.abort().catch(() => {}), null) : i.writer) : null
            }
            a.fixConnOwnership ? (i.failWrite = function(s) {
                !a.isActive() || i.writeClosed || (i.writeClosed = !0, console.error("[WASM-RNA] JS send stream failed id=" + t + " streamId=" + r + " error=" + String(s)), n.queueDeferredCallback({
                    kind: "streamWriteError",
                    id: t,
                    streamId: r
                }))
            }, i.ready = Promise.resolve().then(() => !a.isActive() || i.writeClosed ? null : a.transport.createUnidirectionalStream()).then(o).catch(s => (i.failWrite(s), null))) : (i.ready = a.transport.createUnidirectionalStream().then(o), i.ready.catch(() => {})), a.streams.set(r, i)
        }
        Ga.sig = "vii";

        function Va(e, r) {
            const n = f.__rbxWasmRna,
                t = n && n.findConn(e),
                a = t && t.streams.get(r);
            a && (a.paused = !0)
        }
        Va.sig = "vii";

        function Pa(e, r, n) {
            const t = f.__rbxWasmRna,
                a = t && t.findConn(e);
            a && a.onReceiveRingConsumed && !a.closed && a.onReceiveRingConsumed(r, n)
        }
        Pa.sig = "viii";

        function Na(e, r) {
            const n = f.__rbxWasmRna,
                t = n && n.findConn(e);
            t && t.resumeStreamRead && t.resumeStreamRead(r)
        }
        Na.sig = "vii";

        function Ja(e) {
            const r = f.__rbxWasmRna,
                n = r && r.findConn(e);
            if (n) {
                n.reportHandshake && n.reportHandshake(!1, !1);
                try {
                    n.closed = !0, n.transport && n.transport.close({
                        closeCode: 0,
                        reason: ""
                    })
                } catch {}
            }
        }
        Ja.sig = "vi";

        function Ha(e, r, n, t, a) {
            const i = f.__rbxWasmRna,
                o = Number(e) >>> 0,
                s = i && i.findConn(e);

            function c(d) {
                i && i.queueDeferredCallback && (!s || !s.fixConnOwnership || s.isActive()) && i.queueDeferredCallback({
                    kind: d,
                    id: o,
                    datagramHi: t,
                    datagramLo: a
                })
            }
            if (!s || !s.transport || !s.transport.datagrams || s.closed) {
                c("datagramLost");
                return
            }
            if (s.datagramWritableCompatEnabled && !s.datagramWriter) try {
                const d = s.transport.datagrams;
                typeof d.createWritable == "function" && (s.datagramWriter = d.createWritable().getWriter())
            } catch {}
            s.datagramWriter || (s.datagramWriter = s.transport.datagrams.writable.getWriter());
            const u = new Uint8Array(n);
            u.set(f.HEAPU8.subarray(r, r + n)), s.datagramWriter.write(u).then(() => {
                c("datagramAcked")
            }).catch(() => {
                c("datagramLost")
            })
        }
        Ha.sig = "viiiii";

        function za(e, r) {
            const n = f.__rbxWasmRna,
                t = n && n.findConn(e),
                a = t && t.streams.get(r);
            if (a && (a.cancelled = !0, a.paused = !0, a.pendingChunk = null, a.pendingChunkOffset = 0), a && a.reader && a.reader.cancel) try {
                a.reader.cancel()
            } catch {} else if (a && a.readable && a.readable.cancel) try {
                a.readable.cancel()
            } catch {}
        }
        za.sig = "vii";

        function $a(e, r) {
            const n = f.__rbxWasmRna,
                t = Number(e) >>> 0,
                a = n && n.findConn(e),
                i = a && a.streams.get(r);
            i && (i.writeClosed = !0, i.writeChain = (i.writeChain || Promise.resolve()).catch(() => {}).then(async () => {
                try {
                    const o = await i.ready;
                    (!a.fixConnOwnership || o && a.isActive()) && await o.close()
                } catch (o) {
                    console.error("[WASM-RNA] JS stream writer close failed id=" + t + " streamId=" + r + " error=" + (o && o.name) + ":" + (o && o.message))
                }
            }))
        }
        $a.sig = "vii";

        function qa(e, r, n, t) {
            const a = f.__rbxWasmRna,
                i = Number(e) >>> 0,
                o = a && a.findConn(e),
                s = o && o.streams.get(r);

            function c(d) {
                a && a.queueDeferredCallback && a.queueDeferredCallback(d)
            }
            if (!o || !s || !o.isActive() || o.fixConnOwnership && s.writeClosed) {
                c({
                    kind: "streamWriteError",
                    id: i,
                    streamId: r
                });
                return
            }
            const u = new Uint8Array(t);
            u.set(f.HEAPU8.subarray(n, n + t)), s.writeChain = s.writeChain.catch(() => {}).then(async () => {
                if (o.fixConnOwnership && (!o.isActive() || s.writeClosed)) return;
                const d = await s.ready;
                o.fixConnOwnership && (!d || !o.isActive() || s.writeClosed) || (await d.write(u), (!o.fixConnOwnership || o.isActive() && !s.writeClosed) && c({
                    kind: "streamWriteSuccess",
                    id: i,
                    streamId: r,
                    bytesWritten: t
                }))
            }).catch(d => {
                o.fixConnOwnership ? s.failWrite(d) : (console.error("[WASM-RNA] JS stream write failed id=" + i + " streamId=" + r + " len=" + t + " error=" + String(d)), c({
                    kind: "streamWriteError",
                    id: i,
                    streamId: r
                }))
            })
        }
        qa.sig = "viiii";

        function Xa(e, r) {
            if (f.applyPendingResize && f.applyPendingResize()) {
                var n = f.canvas;
                return _[e >>> 2] = n.width, _[r >>> 2] = n.height, 1
            }
            return 0
        }
        Xa.sig = "iii";

        function Ka() {
            f.applyPendingResize && f.applyPendingResize()
        }
        Ka.sig = "v";

        function Ya(e, r, n) {
            const t = l.getJsObject(e),
                a = l.getJsObject(r),
                i = l.getJsObject(n),
                o = f.canvas.getContext("webgpu"),
                s = t.createCommandEncoder(),
                c = o.getCurrentTexture();
            s.copyTextureToTexture({
                texture: a
            }, {
                texture: c
            }, [Math.min(a.width, c.width), Math.min(a.height, c.height), 1]);
            const u = s.finish();
            t.queue.submit([i]), t.queue.submit([u])
        }
        Ya.sig = "viii";

        function Qa() {
            const e = Number(new URLSearchParams(globalThis.location.search).get("webgpuTimestampInterval") || 4);
            return Number.isInteger(e) && e >= 1 && e <= 120 ? e : 4
        }
        Qa.sig = "i";

        function Za(e, r) {
            return J.handleAsync(async () => {
                N[e >>> 3] = 0, _[r >>> 2] = 0;
                try {
                    let n;
                    try {
                        n = await globalThis.rbxOpfsDir(!1)
                    } catch {
                        return 0
                    }
                    const t = [];
                    let a = 0;
                    for await (const [c, u] of n.entries()) if (u.kind === "file") {
                        const d = await u.getFile();
                        if (d.size === 0) continue;
                        a += d.size, t.push(d.size + "	" + c)
                    }
                    if (t.length === 0) return 0;
                    const i = t.join(`
`),
                        o = te(i) + 1,
                        s = H(o);
                    if (s === 0) return 0;
                    try {
                        P(i, s, o)
                    } catch {
                        return Y(s), 0
                    }
                    return N[e >>> 3] = a, _[r >>> 2] = t.length, s
                } catch (n) {
                    return console.error("rbx_opfs_list_sized failed:", n), 0
                }
            })
        }
        Za.sig = "iii";

        function ei(e, r) {
            globalThis.rbxOpfsWithHandle || (e >= 0 && !globalThis.asyncFileHandleCache && (globalThis.asyncFileHandleCache = new Map), globalThis.rbxOpfsDir = async function(n) {
                return await (await navigator.storage.getDirectory()).getDirectoryHandle("rbx-storage", {
                    create: n
                })
            }, globalThis.rbxOpfsWithHandle = async function(n, t, a, i) {
                let o = globalThis.asyncFileHandleCache ? globalThis.asyncFileHandleCache.get(n) : void 0,
                    s;
                if (o) try {
                    s = await o.getFile()
                } catch {
                    globalThis.asyncFileHandleCache.delete(n), o = void 0
                }
                if (!o) {
                    const c = await globalThis.rbxOpfsDir(t);
                    let u = !1;
                    if (t) try {
                        await c.getFileHandle(n, {
                            create: !1
                        })
                    } catch {
                        u = !0
                    }
                    o = await c.getFileHandle(n, {
                        create: t
                    }), s = a ? await o.getFile() : void 0;
                    let d;
                    try {
                        d = await i(o, s)
                    } catch (p) {
                        if (u) try {
                            await c.removeEntry(n)
                        } catch {}
                        throw p
                    }
                    if (globalThis.asyncFileHandleCache) {
                        if (e > 0 && globalThis.asyncFileHandleCache.size >= e) {
                            const p = globalThis.asyncFileHandleCache.keys();
                            for (; globalThis.asyncFileHandleCache.size > e * r / 100;) globalThis.asyncFileHandleCache.delete(p.next().value)
                        }
                        globalThis.asyncFileHandleCache.set(n, o)
                    }
                    return d
                }
                return await i(o, s)
            })
        }
        ei.sig = "vii";

        function ri() {
            return J.handleAsync(async () => {
                try {
                    const e = await navigator.storage.getDirectory();
                    try {
                        await e.removeEntry("rbx-storage", {
                            recursive: !0
                        })
                    } catch {}
                    return globalThis.asyncFileHandleCache && globalThis.asyncFileHandleCache.clear(), 1
                } catch (e) {
                    return console.error("rbx_opfs_clear failed:", e), 0
                }
            })
        }
        ri.sig = "i";

        function ni(e) {
            return J.handleAsync(async () => {
                try {
                    const r = T(e);
                    return (await (await (await globalThis.rbxOpfsDir(!1)).getFileHandle(r, {
                        create: !1
                    })).getFile()).size > 0 ? 1 : 0
                } catch {
                    return 0
                }
            })
        }
        ni.sig = "ii";

        function ti(e) {
            return J.handleAsync(async () => {
                try {
                    const r = T(e);
                    return await globalThis.rbxOpfsWithHandle(r, !1, !0, (t, a) => a.size) | 0
                } catch {
                    return 0
                }
            })
        }
        ti.sig = "ii";

        function ai(e, r) {
            return J.handleAsync(async () => {
                _[r >>> 2] = 0;
                try {
                    const n = T(e),
                        t = await globalThis.rbxOpfsWithHandle(n, !1, !0, (o, s) => s.arrayBuffer()),
                        a = t.byteLength;
                    if (a === 0) return 0;
                    const i = H(a);
                    if (i === 0) return 0;
                    try {
                        W.set(new Uint8Array(t), i >>> 0)
                    } catch {
                        return Y(i), 0
                    }
                    return _[r >>> 2] = a, i
                } catch {
                    return 0
                }
            })
        }
        ai.sig = "iii";

        function ii(e, r, n) {
            return J.handleAsync(async () => {
                try {
                    if (n <= 0) return 0;
                    const t = T(e),
                        a = await globalThis.rbxOpfsWithHandle(t, !1, !0, (o, s) => {
                            const c = Math.min(s.size, n);
                            return c == 0 ? null : s.slice(0, c).arrayBuffer()
                        });
                    if (a === null) return 0;
                    const i = new Uint8Array(a, 0, Math.min(a.byteLength, n));
                    return W.set(i, r >>> 0), i.length
                } catch {
                    return -1
                }
            })
        }
        ii.sig = "iiii";

        function oi(e, r, n, t, a) {
            return J.handleAsync(async () => {
                try {
                    const i = Math.min(a, n);
                    if (i <= 0) return 0;
                    const o = T(e),
                        s = await globalThis.rbxOpfsWithHandle(o, !1, !0, (u, d) => {
                            if (t >= d.size) return null;
                            const p = Math.min(t + i, d.size);
                            return d.slice(t, p).arrayBuffer()
                        });
                    if (s === null) return 0;
                    const c = new Uint8Array(s, 0, Math.min(s.byteLength, i));
                    return W.set(c, r >>> 0), c.length
                } catch {
                    return -1
                }
            })
        }
        oi.sig = "iiiiii";

        function si(e, r, n, t) {
            return J.handleAsync(async () => {
                _[r >>> 2] = 0;
                try {
                    const a = T(e),
                        i = await globalThis.rbxOpfsWithHandle(a, !1, !0, (c, u) => {
                            if (n >= u.size) return null;
                            const d = Math.min(n + t, u.size);
                            return u.slice(n, d).arrayBuffer()
                        });
                    if (i === null) return 0;
                    const o = i.byteLength;
                    if (o === 0) return 0;
                    const s = H(o);
                    if (s === 0) return 0;
                    try {
                        W.set(new Uint8Array(i), s >>> 0)
                    } catch {
                        return Y(s), 0
                    }
                    return _[r >>> 2] = o, s
                } catch {
                    return 0
                }
            })
        }
        si.sig = "iiiii";

        function ci(e, r) {
            return J.handleAsync(async () => {
                N[e >>> 3] = 0, _[r >>> 2] = 0;
                try {
                    let n;
                    try {
                        n = await globalThis.rbxOpfsDir(!1)
                    } catch {
                        return 0
                    }
                    const t = [];
                    let a = 0;
                    for await (const [c, u] of n.entries()) if (u.kind === "file") {
                        const d = await u.getFile();
                        if (d.size === 0) continue;
                        a += d.size, t.push(c)
                    }
                    if (t.length === 0) return 0;
                    const i = t.join(`
`),
                        o = te(i) + 1,
                        s = H(o);
                    if (s === 0) return 0;
                    try {
                        P(i, s, o)
                    } catch {
                        return Y(s), 0
                    }
                    return N[e >>> 3] = a, _[r >>> 2] = t.length, s
                } catch (n) {
                    return console.error("rbx_opfs_list failed:", n), 0
                }
            })
        }
        ci.sig = "iii";

        function li(e, r) {
            return J.handleAsync(async () => {
                globalThis.syncFileHandleCache || (globalThis.syncFileHandleCache = new Map);
                const n = globalThis.syncFileHandleCache,
                    t = T(e),
                    a = n.get(t);
                if (a) {
                    a.ref++;
                    return
                }
                const i = {
                    acc: null,
                    ref: 1
                };
                n.set(t, i);
                try {
                    const s = await (await globalThis.rbxOpfsDir(!1)).getFileHandle(t, {
                        create: !1
                    });
                    if (!r) try {
                        i.acc = await s.createSyncAccessHandle({
                            mode: "read-only"
                        })
                    } catch {}
                } catch {
                    --i.ref <= 0 && n.delete(t)
                }
            })
        }
        li.sig = "vii";

        function ui(e) {
            return J.handleAsync(async () => {
                try {
                    const r = T(e);
                    return await (await globalThis.rbxOpfsDir(!1)).removeEntry(r), globalThis.asyncFileHandleCache && globalThis.asyncFileHandleCache.delete(r), 1
                } catch {
                    return 0
                }
            })
        }
        ui.sig = "ii";

        function fi(e) {
            return J.handleAsync(async () => {
                try {
                    const r = T(e);
                    if (r.length === 0) return 0;
                    const n = await globalThis.rbxOpfsDir(!1);
                    let t = 0;
                    for (const a of r.split(`
`))
                        if (a.length !== 0) try {
                            await n.removeEntry(a), globalThis.asyncFileHandleCache && globalThis.asyncFileHandleCache.delete(a), t++
                        } catch {}
                    return t
                } catch (r) {
                    return console.error("rbx_opfs_remove_batch failed:", r), 0
                }
            })
        }
        fi.sig = "ii";

        function di(e, r, n) {
            return J.handleAsync(async () => {
                try {
                    if (n <= 0 || r === 0) return 0;
                    const t = T(e),
                        a = W.slice(r, r + n);
                    return await globalThis.rbxOpfsWithHandle(t, !0, !1, async i => {
                        const o = await i.createWritable();
                        let s = !1;
                        try {
                            await o.write(a), await o.close(), s = !0
                        } finally {
                            if (!s) try {
                                await o.abort()
                            } catch {}
                        }
                    }), 1
                } catch (t) {
                    return console.error("rbx_opfs_set failed:", t), 0
                }
            })
        }
        di.sig = "iiii";

        function _i(e) {
            const r = globalThis.syncFileHandleCache;
            if (!r) return;
            const n = T(e),
                t = r.get(n);
            if (t && --t.ref <= 0) {
                if (t.acc) try {
                    t.acc.close()
                } catch {}
                r.delete(n)
            }
        }
        _i.sig = "vi";

        function mi(e) {
            Y(e)
        }
        mi.sig = "vi";

        function pi(e, r, n, t) {
            const a = globalThis.syncFileHandleCache;
            if (!a) return -1;
            const i = T(e),
                o = a.get(i);
            if (!o || !o.acc) return -1;
            try {
                const s = o.acc.getSize();
                return n >= s ? 0 : o.acc.read(W.subarray(r >>> 0, r + t >>> 0), {
                    at: n
                })
            } catch {
                try {
                    o.acc.close()
                } catch {}
                return o.acc = null, -1
            }
        }
        pi.sig = "iiiii";

        function gi(e) {
            e < 0 ? delete Error.stackTraceLimit : Error.stackTraceLimit = e
        }
        gi.sig = "vd";

        function vi() {
            const e = Error.stackTraceLimit;
            return Error.stackTraceLimit = 1 / 0, typeof e == "number" ? e : -1
        }
        vi.sig = "d";

        function bi(e) {
            const r = f.hostInfo || {};
            return Number(r[T(e)]) | 0
        }
        bi.sig = "ii";

        function hi(e, r, n) {
            const t = f.hostInfo || {};
            P(String(t[T(e)] || ""), r, n)
        }
        hi.sig = "viii";

        function wi() {
            return navigator.hardwareConcurrency || 0
        }
        wi.sig = "i";

        function xi() {
            return typeof wasmOffsetConverter < "u"
        }
        xi.sig = "i";
        var yi, Ci, I_, D_, H, Vr, O_, M_, R_, Y, dr, fr, Si, L_, he, W_, j_, U_, G_, V_, P_, N_, J_, H_, z_, $_, q_, ki, X_, K_, Ti, Y_, Q_, Z_, em, Pr, Nr, Jr, Bi, rm, Hr, zr, Ai, $r, Ei, nm, qr, tm, am, Fi, Xr, Kr, im, Ii, Di, Yr, Qr, Zr, en, om, rn, nn, Oi, sm, tn, Mi, an, cm, lm, Se, on, Ri, Li, Wi, ji, Ui, sn, Gi, Vi, Pi, Ni, Ji, Hi, um, zi, fr, dr;

        function fm(e) {
            yi = e.__getTypeName, Ci = e._embind_initialize_bindings, I_ = f._rbx_fs_set_base_url = e.rbx_fs_set_base_url, D_ = f._rbx_fs_register_asset = e.rbx_fs_register_asset, fr = f._rbxJspiJsAllocatorEnter = e.rbxJspiJsAllocatorEnter, dr = f._rbxJspiJsAllocatorLeave = e.rbxJspiJsAllocatorLeave;
            var r = n => fe ? n : (...t) => {
                fr();
                try {
                    return n(...t)
                } finally {
                    dr()
                }
            };
            H = f._malloc = r(e.malloc), Vr = r(e.realloc), O_ = f._rbx_fs_preload_asset = e.rbx_fs_preload_asset, M_ = f._rbx_fs_add_file = e.rbx_fs_add_file, R_ = f._rbx_fs_load_index = e.rbx_fs_load_index, Y = f._free = r(e.free), dr = f._rbxJspiJsAllocatorLeave = e.rbxJspiJsAllocatorLeave, fr = f._rbxJspiJsAllocatorEnter = e.rbxJspiJsAllocatorEnter, Si = f._main = e.__main_argc_argv, L_ = f._main_loop_iteration = e.main_loop_iteration, he = e.pthread_self, W_ = f._linking_on_prompt_result = e.linking_on_prompt_result, j_ = f._web_client_record_browser_event = e.web_client_record_browser_event, U_ = f._webview_on_message = e.webview_on_message, G_ = f._webview_on_close = e.webview_on_close, V_ = f._update_virtual_keyboard_bounds = e.update_virtual_keyboard_bounds, P_ = f._on_virtual_text_changed = e.on_virtual_text_changed, N_ = f._on_return_pressed = e.on_return_pressed, J_ = f._get_stack_ptr = e.get_stack_ptr, H_ = f._set_stack_ptr = e.set_stack_ptr, z_ = f._get_stack_base = e.get_stack_base, $_ = f._get_stack_end = e.get_stack_end, q_ = f._set_stack_limits = e.set_stack_limits, ki = e.emscripten_stack_set_limits, X_ = f._fiber_entry = e.fiber_entry, K_ = f._wasmCrashCallback = e.wasmCrashCallback, Ti = e.crash_reporter_prepare_js_report, Y_ = e.htons, Q_ = f._FMOD_JS_MixerFastpathFunction = e.FMOD_JS_MixerFastpathFunction, Z_ = f._FMOD_JS_MixerSlowpathFunction = e.FMOD_JS_MixerSlowpathFunction, em = f._FMOD_JS_MixFunction = e.FMOD_JS_MixFunction, Pr = e.wgpuDeviceAddRef, Nr = r(e.emwgpuCreateComputePassEncoder), Jr = r(e.emwgpuCreateSurface), Bi = r(e.emwgpuCreateShaderModule), rm = r(e.emwgpuOnCreateComputePipelineCompleted), Hr = r(e.emwgpuCreateSampler), zr = r(e.emwgpuOnMapAsyncCompleted), Ai = r(e.emwgpuCreateRenderBundle), $r = r(e.emwgpuCreateQueue), Ei = r(e.emwgpuCreateDevice), nm = r(e.emwgpuOnCreateRenderPipelineCompleted), qr = r(e.emwgpuCreateQuerySet), tm = r(e.emwgpuOnDeviceLostCompleted), am = r(e.emwgpuOnRequestDeviceCompleted), Fi = r(e.emwgpuCreateAdapter), Xr = r(e.emwgpuCreateTexture), Kr = r(e.emwgpuCreateRenderPassEncoder), im = r(e.emwgpuOnPopErrorScopeCompleted), Ii = r(e.emwgpuCreateExternalTexture), Di = r(e.emwgpuOnCompilationInfoCompleted), Yr = r(e.emwgpuCreateCommandBuffer), Qr = r(e.emwgpuCreateComputePipeline), Zr = r(e.emwgpuCreateCommandEncoder), en = r(e.emwgpuCreateBindGroupLayout), om = r(e.emwgpuOnRequestAdapterCompleted), rn = r(e.emwgpuCreatePipelineLayout), nn = r(e.emwgpuCreateRenderPipeline), Oi = r(e.emwgpuCreateRenderBundleEncoder), sm = r(e.emwgpuOnWorkDoneCompleted), tn = r(e.emwgpuCreateBindGroup), Mi = r(e.emwgpuImportBuffer), an = r(e.emwgpuCreateTextureView), cm = r(e.emwgpuOnUncapturedError), lm = e._emscripten_tls_init, Se = e._emscripten_run_callback_on_thread, on = e._emscripten_thread_init, Ri = e.__set_thread_state, Li = e._emscripten_thread_crashed, Wi = e._emscripten_run_js_on_main_thread_done, ji = e._emscripten_run_js_on_main_thread, Ui = e._emscripten_thread_free_data, sn = e._emscripten_thread_exit, Gi = e._emscripten_check_mailbox, Vi = r(e.memalign), Pi = e.__trap, Ni = e._emscripten_stack_restore, Ji = e._emscripten_stack_alloc, Hi = e.emscripten_stack_get_current, um = zi = e.__indirect_function_table
        }
        var We;

        function dm() {
            We = {
                HaveOffsetConverter: xi,
                RBX_restoreWasmStackTraceLimit: gi,
                RBX_setFullWasmStackTrace: vi,
                __assert_fail: fo,
                __asyncjs__create_suspended_fiber_js: Ia,
                __asyncjs__fiber_transfer_js: Da,
                __asyncjs__rbxFutexWaitMainJspi: na,
                __asyncjs__rbx_opfs_clear: ri,
                __asyncjs__rbx_opfs_contains: ni,
                __asyncjs__rbx_opfs_file_size: ti,
                __asyncjs__rbx_opfs_get: ai,
                __asyncjs__rbx_opfs_get_buffer: ii,
                __asyncjs__rbx_opfs_get_buffer_offset: oi,
                __asyncjs__rbx_opfs_get_offset: si,
                __asyncjs__rbx_opfs_list: ci,
                __asyncjs__rbx_opfs_list_sized: Za,
                __asyncjs__rbx_opfs_open: li,
                __asyncjs__rbx_opfs_remove: ui,
                __asyncjs__rbx_opfs_remove_batch: fi,
                __asyncjs__rbx_opfs_set: di,
                __call_sighandler: _o,
                __pthread_create_js: En,
                __syscall_getegid32: Fn,
                __syscall_geteuid32: In,
                __syscall_getgid32: Dn,
                __syscall_getuid32: On,
                _abort_js: po,
                _embind_register_bigint: bo,
                _embind_register_bool: ho,
                _embind_register_emval: yo,
                _embind_register_float: So,
                _embind_register_function: Po,
                _embind_register_integer: No,
                _embind_register_memory_view: Jo,
                _embind_register_std_string: zo,
                _embind_register_std_wstring: Zo,
                _embind_register_void: es,
                _emscripten_fetch_get_response_headers: rs,
                _emscripten_fetch_get_response_headers_length: ns,
                _emscripten_init_main_thread_js: ts,
                _emscripten_log_formatted: is,
                _emscripten_notify_mailbox_postmessage: os,
                _emscripten_receive_on_main_thread_js: ss,
                _emscripten_runtime_keepalive_clear: cs,
                _emscripten_thread_cleanup: ls,
                _emscripten_thread_mailbox_await: Er,
                _emscripten_thread_set_strongref: us,
                _gmtime_js: fs,
                _localtime_js: ps,
                _mktime_js: gs,
                _msync_js: Jn,
                _tzset_js: vs,
                applyPendingBrowserCanvasResize: Ka,
                applyPendingCanvasResize: Xa,
                blur_text_input: Ca,
                choose_current_text_input: ya,
                clock_time_get: ws,
                copy_pending_text: wa,
                emscripten_asm_const_async_on_main_thread: xs,
                emscripten_asm_const_double: ys,
                emscripten_asm_const_int: Cs,
                emscripten_asm_const_int_sync_on_main_thread: Ss,
                emscripten_async_call: As,
                emscripten_check_blocking_allowed: Es,
                emscripten_console_error: Fs,
                emscripten_console_log: Is,
                emscripten_console_warn: Ds,
                emscripten_date_now: Hn,
                emscripten_errn: Os,
                emscripten_exit_pointerlock: Xn,
                emscripten_exit_with_live_runtime: Rs,
                emscripten_fetch_free: Ls,
                emscripten_get_canvas_element_size: js,
                emscripten_get_device_pixel_ratio: Zn,
                emscripten_get_element_css_size: et,
                emscripten_get_gamepad_status: nt,
                emscripten_get_heap_max: Gs,
                emscripten_get_now: tr,
                emscripten_get_num_gamepads: tt,
                emscripten_has_asyncify: Vs,
                emscripten_num_logical_cores: Ps,
                emscripten_outn: Ns,
                emscripten_pc_get_function: ir,
                emscripten_request_pointerlock: it,
                emscripten_resize_heap: Hs,
                emscripten_runtime_keepalive_push: zs,
                emscripten_sample_gamepad_data: or,
                emscripten_set_blur_callback_on_thread: st,
                emscripten_set_canvas_element_size: $s,
                emscripten_set_focus_callback_on_thread: ut,
                emscripten_set_gamepadconnected_callback_on_thread: dt,
                emscripten_set_gamepaddisconnected_callback_on_thread: _t,
                emscripten_set_keydown_callback_on_thread: pt,
                emscripten_set_keyup_callback_on_thread: gt,
                emscripten_set_mousedown_callback_on_thread: bt,
                emscripten_set_mouseenter_callback_on_thread: ht,
                emscripten_set_mouseleave_callback_on_thread: wt,
                emscripten_set_mousemove_callback_on_thread: xt,
                emscripten_set_mouseup_callback_on_thread: yt,
                emscripten_set_pointerlockerror_callback_on_thread: Ct,
                emscripten_set_touchcancel_callback_on_thread: St,
                emscripten_set_touchend_callback_on_thread: kt,
                emscripten_set_touchmove_callback_on_thread: Tt,
                emscripten_set_touchstart_callback_on_thread: Bt,
                emscripten_set_wheel_callback_on_thread: At,
                emscripten_stack_snapshot: Js,
                emscripten_stack_unwind_buffer: Ks,
                emscripten_start_fetch: Ys,
                emscripten_unwind_to_js_event_loop: Qs,
                emscripten_webgl_create_context: sc,
                emscripten_webgl_destroy_context: cc,
                emscripten_webgl_get_context_attributes: lc,
                emscripten_webgl_make_context_current: uc,
                emscripten_webgpu_get_device: fc,
                emscripten_websocket_close: Ot,
                emscripten_websocket_delete: Mt,
                emscripten_websocket_new: Rt,
                emscripten_websocket_send_binary: Lt,
                emscripten_websocket_send_utf8_text: Wt,
                emscripten_websocket_set_onclose_callback_on_thread: jt,
                emscripten_websocket_set_onerror_callback_on_thread: Ut,
                emscripten_websocket_set_onmessage_callback_on_thread: Gt,
                emscripten_websocket_set_onopen_callback_on_thread: Vt,
                emwgpuBufferGetConstMappedRange: dc,
                emwgpuBufferMapAsync: _c,
                emwgpuBufferUnmap: mc,
                emwgpuDelete: pc,
                emwgpuDeviceCreateBuffer: gc,
                emwgpuDeviceCreateShaderModule: vc,
                emwgpuDeviceDestroy: bc,
                emwgpuGetPreferredFormat: wc,
                emwgpuShaderModuleGetCompilationInfo: yc,
                environ_get: Pt,
                environ_sizes_get: Nt,
                exit: kr,
                fd_pread: Jt,
                fiber_destroy_js: Oa,
                focus_text_input: va,
                getWebGpuTimestampInterval: Qa,
                get_effective_device_pixel_ratio: ua,
                get_hardware_concurrency: wi,
                glActiveTexture: kc,
                glAttachShader: Bc,
                glBindAttribLocation: Ec,
                glBindBuffer: Ic,
                glBindBufferBase: Oc,
                glBindBufferRange: Rc,
                glBindFramebuffer: Wc,
                glBindRenderbuffer: Uc,
                glBindTexture: Vc,
                glBindVertexArray: Nc,
                glBlendFunc: Hc,
                glBlendFuncSeparate: $c,
                glBlitFramebuffer: Xc,
                glBufferData: Yc,
                glBufferSubData: Zc,
                glCheckFramebufferStatus: rl,
                glClear: tl,
                glClearBufferfi: il,
                glClearBufferfv: sl,
                glClearBufferiv: ll,
                glClearColor: fl,
                glClearDepthf: _l,
                glClearStencil: pl,
                glClientWaitSync: vl,
                glClipControlEXT: hl,
                glColorMask: xl,
                glCompileShader: Cl,
                glCompressedTexImage2D: kl,
                glCompressedTexImage3D: Bl,
                glCompressedTexSubImage2D: El,
                glCompressedTexSubImage3D: Il,
                glCopyTexSubImage2D: Ol,
                glCreateProgram: Rl,
                glCreateShader: Wl,
                glCullFace: Ul,
                glDeleteBuffers: Vl,
                glDeleteFramebuffers: Nl,
                glDeleteProgram: Hl,
                glDeleteRenderbuffers: $l,
                glDeleteShader: Xl,
                glDeleteSync: Yl,
                glDeleteTextures: Zl,
                glDeleteVertexArrays: ru,
                glDepthFunc: tu,
                glDepthMask: iu,
                glDisable: su,
                glDisableVertexAttribArray: lu,
                glDrawArrays: fu,
                glDrawArraysInstanced: _u,
                glDrawBuffers: pu,
                glDrawElements: vu,
                glDrawElementsInstanced: hu,
                glEnable: xu,
                glEnableVertexAttribArray: Cu,
                glFenceSync: ku,
                glFramebufferRenderbuffer: Bu,
                glFramebufferTexture2D: Eu,
                glFramebufferTextureLayer: Iu,
                glGenBuffers: Ou,
                glGenFramebuffers: Ru,
                glGenRenderbuffers: Wu,
                glGenTextures: Uu,
                glGenVertexArrays: Vu,
                glGenerateMipmap: Nu,
                glGetActiveUniform: zu,
                glGetActiveUniformBlockiv: qu,
                glGetError: Ku,
                glGetIntegerv: Zu,
                glGetProgramInfoLog: rf,
                glGetProgramiv: tf,
                glGetShaderInfoLog: of,
                glGetShaderiv: cf,
                glGetString: uf,
                glGetUniformBlockIndex: df,
                glGetUniformLocation: gf,
                glInvalidateFramebuffer: bf,
                glLinkProgram: wf,
                glMapBufferRange: yf,
                glPixelStorei: Sf,
                glPolygonOffset: Tf,
                glReadPixels: Ff,
                glRenderbufferStorage: Df,
                glRenderbufferStorageMultisample: Mf,
                glScissor: Lf,
                glShaderSource: jf,
                glStencilFunc: Gf,
                glStencilMask: Pf,
                glStencilOp: Jf,
                glTexImage2D: zf,
                glTexImage3D: qf,
                glTexParameterf: Kf,
                glTexParameterfv: Qf,
                glTexParameteri: ed,
                glTexStorage2D: nd,
                glTexStorage3D: ad,
                glTexSubImage2D: od,
                glTexSubImage3D: cd,
                glUniform1i: dd,
                glUniformBlockBinding: md,
                glUnmapBuffer: gd,
                glUseProgram: bd,
                glVertexAttribPointer: wd,
                glViewport: yd,
                has_keyboard: ta,
                has_mouse: ca,
                install_pointer_source_tracking: sa,
                is_mobile_browser: fa,
                is_mouse_sourced_event: oa,
                is_touch_mobile: da,
                is_touch_screen_device: aa,
                js_copy_keyboard_layout_key: Ma,
                js_external_content_sharing_deliver: Fa,
                js_fetch_file: Kt,
                js_keyboard_layout_status: Ra,
                js_linking_open_url: _a,
                js_request_keyboard_layout: La,
                js_web_client_ms_since_navigation: ma,
                js_web_client_page_visible: pa,
                js_web_client_wasm_cache_state: ga,
                memory: De,
                preallocate_emscripten_key_event_buffer: ia,
                presentBrowserFrame: Ya,
                proc_exit: Sr,
                random_get: kd,
                rbx_opfs_close: _i,
                rbx_opfs_free: mi,
                rbx_opfs_install_helpers: ei,
                rbx_opfs_read_sync_if_cached: pi,
                rbx_wasm_rna_close_js: Wa,
                rbx_wasm_rna_connect_js: ja,
                rbx_wasm_rna_is_supported_js: Ua,
                rbx_wasm_rna_open_stream_js: Ga,
                rbx_wasm_rna_pause_stream_read_js: Va,
                rbx_wasm_rna_receive_ring_consumed_js: Pa,
                rbx_wasm_rna_resume_stream_read_js: Na,
                rbx_wasm_rna_send_connection_close_js: Ja,
                rbx_wasm_rna_send_datagram_js: Ha,
                rbx_wasm_rna_shutdown_stream_read_js: za,
                rbx_wasm_rna_shutdown_stream_write_js: $a,
                rbx_wasm_rna_write_stream_js: qa,
                read_host_info_int: bi,
                read_host_info_string: hi,
                report_crash: Id,
                reset_current_text_input: Sa,
                schedule_main_loop: la,
                set_crash_attribute: Dd,
                set_text_box_horiz_alignment: ka,
                set_text_box_overlay: ba,
                set_text_box_vert_alignment: Ta,
                set_text_color: xa,
                setup_font: Ba,
                shift_canvas: ha,
                sync_text_and_pos: Aa,
                update_text_box_rect: Ea,
                wgpuBufferGetSize: Od,
                wgpuCommandEncoderBeginComputePass: Md,
                wgpuCommandEncoderBeginRenderPass: Rd,
                wgpuCommandEncoderCopyBufferToBuffer: Ld,
                wgpuCommandEncoderCopyTextureToBuffer: Wd,
                wgpuCommandEncoderCopyTextureToTexture: jd,
                wgpuCommandEncoderFinish: Ud,
                wgpuCommandEncoderPopDebugGroup: Gd,
                wgpuCommandEncoderPushDebugGroup: Vd,
                wgpuCommandEncoderResolveQuerySet: Pd,
                wgpuComputePassEncoderDispatchWorkgroups: Nd,
                wgpuComputePassEncoderEnd: Jd,
                wgpuComputePassEncoderPopDebugGroup: Hd,
                wgpuComputePassEncoderPushDebugGroup: zd,
                wgpuComputePassEncoderSetBindGroup: $d,
                wgpuComputePassEncoderSetPipeline: qd,
                wgpuDeviceCreateBindGroup: Xd,
                wgpuDeviceCreateBindGroupLayout: Kd,
                wgpuDeviceCreateCommandEncoder: Yd,
                wgpuDeviceCreateComputePipeline: Qd,
                wgpuDeviceCreatePipelineLayout: Zd,
                wgpuDeviceCreateQuerySet: e_,
                wgpuDeviceCreateRenderPipeline: r_,
                wgpuDeviceCreateSampler: n_,
                wgpuDeviceCreateTexture: t_,
                wgpuDeviceGetLimits: a_,
                wgpuDeviceHasFeature: i_,
                wgpuInstanceCreateSurface: o_,
                wgpuQueueSubmit: s_,
                wgpuQueueWriteBuffer: c_,
                wgpuQueueWriteTexture: l_,
                wgpuRenderPassEncoderDraw: u_,
                wgpuRenderPassEncoderDrawIndexed: f_,
                wgpuRenderPassEncoderEnd: d_,
                wgpuRenderPassEncoderPopDebugGroup: __,
                wgpuRenderPassEncoderPushDebugGroup: m_,
                wgpuRenderPassEncoderSetBindGroup: p_,
                wgpuRenderPassEncoderSetIndexBuffer: g_,
                wgpuRenderPassEncoderSetPipeline: v_,
                wgpuRenderPassEncoderSetScissorRect: b_,
                wgpuRenderPassEncoderSetStencilReference: h_,
                wgpuRenderPassEncoderSetVertexBuffer: w_,
                wgpuRenderPassEncoderSetViewport: x_,
                wgpuSurfaceConfigure: y_,
                wgpuTextureCreateView: C_,
                wgpuTextureGetDepthOrArrayLayers: S_,
                wgpuTextureGetDimension: k_,
                wgpuTextureGetUsage: T_
            }
        }

        function _m(e) {
            e = Object.assign({}, e);
            var r = a => i => a(i) >>> 0,
                n = a => (i, o) => a(i, o) >>> 0,
                t = a => () => a() >>> 0;
            return e.__getTypeName = r(e.__getTypeName), e.malloc = r(e.malloc), e.realloc = n(e.realloc), e.pthread_self = t(e.pthread_self), e._emscripten_tls_init = t(e._emscripten_tls_init), e.memalign = n(e.memalign), e._emscripten_stack_alloc = r(e._emscripten_stack_alloc), e.emscripten_stack_get_current = t(e.emscripten_stack_get_current), e
        }
        async function mm(e = []) {
            var r = Si;
            e.unshift(Ge);
            var n = e.length,
                t = Ze((n + 1) * 4),
                a = t;
            for (var i of e) m[a >>> 2 >>> 0] = lr(i), a += 4;
            m[a >>> 2 >>> 0] = 0;
            try {
                var o = r(n, t);
                return o = await o, Sn(o, !0), o
            } catch (s) {
                return rr(s)
            }
        }
        async function $i(e = Ue) {
            if (E) {
                pn();
                return
            }
            Yi();
            var r = f.setStatus;
            if (r && (r("Running..."), await new Promise(t => setTimeout(t, 1)), setTimeout(r, 1, "")), !Ee) {
                await pn(), f.onRuntimeInitialized?.();
                var n = !1;
                n || await mm(e)
            }
        }
        var pe;
        return E || (pe = await bn(), await $i()), f
    }
})();
typeof exports == "object" && typeof module == "object" ? (module.exports = createWebClient, module.exports.default = createWebClient) : typeof define == "function" && define.amd && define([], () => createWebClient);
var isPthread = globalThis.name == "em-pthread";
if (isPthread && createWebClient(), typeof WorkerGlobalScope < "u" && globalThis.name === "rbx-cpu-bench") {
    let re = null;
    self.onmessage = async oe => {
        const {
            type: f,
            module: je,
            durationMs: fe,
            batchSize: vr
        } = oe.data;
        if (f === "init") {
            re = (await WebAssembly.instantiate(je, {})).exports, re.bench_init(), self.postMessage({
                type: "ready"
            });
            return
        }
        if (f === "run" && re) {
            const br = re.bench_run,
                E = vr || 100;
            let Ue = 0,
                Ge = 0;
            const Ve = performance.now(),
                Pe = Ve + fe;
            for (; performance.now() < Pe;) Ge += br(E), Ue += E;
            const Xe = performance.now() - Ve;
            self.postMessage({
                type: "result",
                iterations: Ue,
                elapsedMs: Xe,
                itersPerMs: Ue / Xe,
                checksum: Ge
            })
        }
    }
}

;
! function() {
    try {
        var g = globalThis,
            s = new g.Error().stack;
        s && ((g._sentryDebugIds = g._sentryDebugIds || {})[s] = "92078627-64b0-5833-bf43-c2b97098c808")
    } catch (e) {}
}();
//# debugId=92078627-64b0-5833-bf43-c2b97098c808