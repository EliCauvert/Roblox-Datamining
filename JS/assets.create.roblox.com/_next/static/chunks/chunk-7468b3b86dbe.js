;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "12d54266-9457-08d3-77ef-ceb131133a02")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 749490, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "useReportWebVitals", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let r = e.r(643766),
        i = e.r(390754);

    function a(e) {
        (0, r.useEffect)(() => {
            (0, i.onCLS)(e, {
                reportSoftNavs: !0
            }), (0, i.onLCP)(e, {
                reportSoftNavs: !0
            }), (0, i.onINP)(e, {
                reportSoftNavs: !0
            }), (0, i.onFCP)(e, {
                reportSoftNavs: !0
            }), (0, i.onTTFB)(e)
        }, [e])
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 83205, (e, t, n) => {
    var r = e.i(163021),
        i = {
            638: function(e) {
                "function" == typeof Object.create ? e.exports = function(e, t) {
                    t && (e.super_ = t, e.prototype = Object.create(t.prototype, {
                        constructor: {
                            value: e,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }))
                } : e.exports = function(e, t) {
                    if (t) {
                        e.super_ = t;
                        var n = function() {};
                        n.prototype = t.prototype, e.prototype = new n, e.prototype.constructor = e
                    }
                }
            },
            329: function(e) {
                "use strict";
                let t = {};

                function n(e, n, r) {
                    r || (r = Error);
                    class i extends r {
                        constructor(e, t, r) {
                            super("string" == typeof n ? n : n(e, t, r))
                        }
                    }
                    i.prototype.name = r.name, i.prototype.code = e, t[e] = i
                }

                function r(e, t) {
                    if (!Array.isArray(e)) return "of ".concat(t, " ").concat(String(e));
                    {
                        let n = e.length;
                        return (e = e.map(e => String(e)), n > 2) ? "one of ".concat(t, " ").concat(e.slice(0, n - 1).join(", "), ", or ") + e[n - 1] : 2 === n ? "one of ".concat(t, " ").concat(e[0], " or ").concat(e[1]) : "of ".concat(t, " ").concat(e[0])
                    }
                }
                n("ERR_INVALID_OPT_VALUE", function(e, t) {
                    return 'The value "' + t + '" is invalid for option "' + e + '"'
                }, TypeError), n("ERR_INVALID_ARG_TYPE", function(e, t, n) {
                    var i, a, o, s;
                    let u, l;
                    if ("string" == typeof t && (i = "not ", t.substr(0, i.length) === i) ? (u = "must not be", t = t.replace(/^not /, "")) : u = "must be", a = " argument", (void 0 === o || o > e.length) && (o = e.length), e.substring(o - a.length, o) === a) l = "The ".concat(e, " ").concat(u, " ").concat(r(t, "type"));
                    else {
                        let n = ("number" != typeof s && (s = 0), s + 1 > e.length || -1 === e.indexOf(".", s)) ? "argument" : "property";
                        l = 'The "'.concat(e, '" ').concat(n, " ").concat(u, " ").concat(r(t, "type"))
                    }
                    return l + ". Received type ".concat(typeof n)
                }, TypeError), n("ERR_STREAM_PUSH_AFTER_EOF", "stream.push() after EOF"), n("ERR_METHOD_NOT_IMPLEMENTED", function(e) {
                    return "The " + e + " method is not implemented"
                }), n("ERR_STREAM_PREMATURE_CLOSE", "Premature close"), n("ERR_STREAM_DESTROYED", function(e) {
                    return "Cannot call " + e + " after a stream was destroyed"
                }), n("ERR_MULTIPLE_CALLBACK", "Callback called multiple times"), n("ERR_STREAM_CANNOT_PIPE", "Cannot pipe, not readable"), n("ERR_STREAM_WRITE_AFTER_END", "write after end"), n("ERR_STREAM_NULL_VALUES", "May not write null values to stream", TypeError), n("ERR_UNKNOWN_ENCODING", function(e) {
                    return "Unknown encoding: " + e
                }, TypeError), n("ERR_STREAM_UNSHIFT_AFTER_END_EVENT", "stream.unshift() after end event"), e.exports.F = t
            },
            686: function(e, t, n) {
                "use strict";
                var i = Object.keys || function(e) {
                    var t = [];
                    for (var n in e) t.push(n);
                    return t
                };
                e.exports = c;
                var a = n(276),
                    o = n(732);
                n(638)(c, a);
                for (var s = i(o.prototype), u = 0; u < s.length; u++) {
                    var l = s[u];
                    c.prototype[l] || (c.prototype[l] = o.prototype[l])
                }

                function c(e) {
                    if (!(this instanceof c)) return new c(e);
                    a.call(this, e), o.call(this, e), this.allowHalfOpen = !0, e && (!1 === e.readable && (this.readable = !1), !1 === e.writable && (this.writable = !1), !1 === e.allowHalfOpen && (this.allowHalfOpen = !1, this.once("end", d)))
                }

                function d() {
                    this._writableState.ended || r.default.nextTick(f, this)
                }

                function f(e) {
                    e.end()
                }
                Object.defineProperty(c.prototype, "writableHighWaterMark", {
                    enumerable: !1,
                    get: function() {
                        return this._writableState.highWaterMark
                    }
                }), Object.defineProperty(c.prototype, "writableBuffer", {
                    enumerable: !1,
                    get: function() {
                        return this._writableState && this._writableState.getBuffer()
                    }
                }), Object.defineProperty(c.prototype, "writableLength", {
                    enumerable: !1,
                    get: function() {
                        return this._writableState.length
                    }
                }), Object.defineProperty(c.prototype, "destroyed", {
                    enumerable: !1,
                    get: function() {
                        return void 0 !== this._readableState && void 0 !== this._writableState && this._readableState.destroyed && this._writableState.destroyed
                    },
                    set: function(e) {
                        void 0 !== this._readableState && void 0 !== this._writableState && (this._readableState.destroyed = e, this._writableState.destroyed = e)
                    }
                })
            },
            512: function(e, t, n) {
                "use strict";
                e.exports = i;
                var r = n(586);

                function i(e) {
                    if (!(this instanceof i)) return new i(e);
                    r.call(this, e)
                }
                n(638)(i, r), i.prototype._transform = function(e, t, n) {
                    n(null, e)
                }
            },
            276: function(t, n, i) {
                "use strict";
                t.exports = E, E.ReadableState = T, i(434).EventEmitter;
                var a, o, s, u, l, c = function(e, t) {
                        return e.listeners(t).length
                    },
                    d = i(120),
                    f = i(181).Buffer,
                    h = e.g.Uint8Array || function() {},
                    p = i(23);
                o = p && p.debuglog ? p.debuglog("stream") : function() {};
                var v = i(137),
                    y = i(528),
                    m = i(771).getHighWaterMark,
                    g = i(329).F,
                    b = g.ERR_INVALID_ARG_TYPE,
                    w = g.ERR_STREAM_PUSH_AFTER_EOF,
                    x = g.ERR_METHOD_NOT_IMPLEMENTED,
                    P = g.ERR_STREAM_UNSHIFT_AFTER_END_EVENT;
                i(638)(E, d);
                var S = y.errorOrDestroy,
                    R = ["error", "close", "destroy", "pause", "resume"];

                function T(e, t, n) {
                    a = a || i(686), e = e || {}, "boolean" != typeof n && (n = t instanceof a), this.objectMode = !!e.objectMode, n && (this.objectMode = this.objectMode || !!e.readableObjectMode), this.highWaterMark = m(this, e, "readableHighWaterMark", n), this.buffer = new v, this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = null, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.resumeScheduled = !1, this.paused = !0, this.emitClose = !1 !== e.emitClose, this.autoDestroy = !!e.autoDestroy, this.destroyed = !1, this.defaultEncoding = e.defaultEncoding || "utf8", this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, e.encoding && (s || (s = i(319).I), this.decoder = new s(e.encoding), this.encoding = e.encoding)
                }

                function E(e) {
                    if (a = a || i(686), !(this instanceof E)) return new E(e);
                    var t = this instanceof a;
                    this._readableState = new T(e, this, t), this.readable = !0, e && ("function" == typeof e.read && (this._read = e.read), "function" == typeof e.destroy && (this._destroy = e.destroy)), d.call(this)
                }

                function k(e, t, n, r, i) {
                    o("readableAddChunk", t);
                    var a, s, u = e._readableState;
                    if (null === t) u.reading = !1,
                        function(e, t) {
                            if (o("onEofChunk"), !t.ended) {
                                if (t.decoder) {
                                    var n = t.decoder.end();
                                    n && n.length && (t.buffer.push(n), t.length += t.objectMode ? 1 : n.length)
                                }
                                t.ended = !0, t.sync ? j(e) : (t.needReadable = !1, t.emittedReadable || (t.emittedReadable = !0, _(e)))
                            }
                        }(e, u);
                    else if (i || (s = function(e, t) {
                            var n;
                            return f.isBuffer(t) || t instanceof h || "string" == typeof t || void 0 === t || e.objectMode || (n = new b("chunk", ["string", "Buffer", "Uint8Array"], t)), n
                        }(u, t)), s) S(e, s);
                    else if (u.objectMode || t && t.length > 0)
                        if ("string" == typeof t || u.objectMode || Object.getPrototypeOf(t) === f.prototype || (a = t, t = f.from(a)), r) u.endEmitted ? S(e, new P) : A(e, u, t, !0);
                        else if (u.ended) S(e, new w);
                    else {
                        if (u.destroyed) return !1;
                        u.reading = !1, u.decoder && !n ? (t = u.decoder.write(t), u.objectMode || 0 !== t.length ? A(e, u, t, !1) : I(e, u)) : A(e, u, t, !1)
                    } else r || (u.reading = !1, I(e, u));
                    return !u.ended && (u.length < u.highWaterMark || 0 === u.length)
                }

                function A(e, t, n, r) {
                    t.flowing && 0 === t.length && !t.sync ? (t.awaitDrain = 0, e.emit("data", n)) : (t.length += t.objectMode ? 1 : n.length, r ? t.buffer.unshift(n) : t.buffer.push(n), t.needReadable && j(e)), I(e, t)
                }

                function q(e, t) {
                    var n;
                    if (e <= 0 || 0 === t.length && t.ended) return 0;
                    if (t.objectMode) return 1;
                    if (e != e)
                        if (t.flowing && t.length) return t.buffer.head.data.length;
                        else return t.length;
                    return (e > t.highWaterMark && ((n = e) >= 0x40000000 ? n = 0x40000000 : (n--, n |= n >>> 1, n |= n >>> 2, n |= n >>> 4, n |= n >>> 8, n |= n >>> 16, n++), t.highWaterMark = n), e <= t.length) ? e : t.ended ? t.length : (t.needReadable = !0, 0)
                }

                function j(e) {
                    var t = e._readableState;
                    o("emitReadable", t.needReadable, t.emittedReadable), t.needReadable = !1, t.emittedReadable || (o("emitReadable", t.flowing), t.emittedReadable = !0, r.default.nextTick(_, e))
                }

                function _(e) {
                    var t = e._readableState;
                    o("emitReadable_", t.destroyed, t.length, t.ended), !t.destroyed && (t.length || t.ended) && (e.emit("readable"), t.emittedReadable = !1), t.needReadable = !t.flowing && !t.ended && t.length <= t.highWaterMark, M(e)
                }

                function I(e, t) {
                    t.readingMore || (t.readingMore = !0, r.default.nextTick(C, e, t))
                }

                function C(e, t) {
                    for (; !t.reading && !t.ended && (t.length < t.highWaterMark || t.flowing && 0 === t.length);) {
                        var n = t.length;
                        if (o("maybeReadMore read 0"), e.read(0), n === t.length) break
                    }
                    t.readingMore = !1
                }

                function O(e) {
                    var t = e._readableState;
                    t.readableListening = e.listenerCount("readable") > 0, t.resumeScheduled && !t.paused ? t.flowing = !0 : e.listenerCount("data") > 0 && e.resume()
                }

                function L(e) {
                    o("readable nexttick read 0"), e.read(0)
                }

                function D(e, t) {
                    o("resume", t.reading), t.reading || e.read(0), t.resumeScheduled = !1, e.emit("resume"), M(e), t.flowing && !t.reading && e.read(0)
                }

                function M(e) {
                    var t = e._readableState;
                    for (o("flow", t.flowing); t.flowing && null !== e.read(););
                }

                function N(e, t) {
                    var n;
                    return 0 === t.length ? null : (t.objectMode ? n = t.buffer.shift() : !e || e >= t.length ? (n = t.decoder ? t.buffer.join("") : 1 === t.buffer.length ? t.buffer.first() : t.buffer.concat(t.length), t.buffer.clear()) : n = t.buffer.consume(e, t.decoder), n)
                }

                function U(e) {
                    var t = e._readableState;
                    o("endReadable", t.endEmitted), t.endEmitted || (t.ended = !0, r.default.nextTick(B, t, e))
                }

                function B(e, t) {
                    if (o("endReadableNT", e.endEmitted, e.length), !e.endEmitted && 0 === e.length && (e.endEmitted = !0, t.readable = !1, t.emit("end"), e.autoDestroy)) {
                        var n = t._writableState;
                        (!n || n.autoDestroy && n.finished) && t.destroy()
                    }
                }

                function F(e, t) {
                    for (var n = 0, r = e.length; n < r; n++)
                        if (e[n] === t) return n;
                    return -1
                }
                Object.defineProperty(E.prototype, "destroyed", {
                    enumerable: !1,
                    get: function() {
                        return void 0 !== this._readableState && this._readableState.destroyed
                    },
                    set: function(e) {
                        this._readableState && (this._readableState.destroyed = e)
                    }
                }), E.prototype.destroy = y.destroy, E.prototype._undestroy = y.undestroy, E.prototype._destroy = function(e, t) {
                    t(e)
                }, E.prototype.push = function(e, t) {
                    var n, r = this._readableState;
                    return r.objectMode ? n = !0 : "string" == typeof e && ((t = t || r.defaultEncoding) !== r.encoding && (e = f.from(e, t), t = ""), n = !0), k(this, e, t, !1, n)
                }, E.prototype.unshift = function(e) {
                    return k(this, e, null, !0, !1)
                }, E.prototype.isPaused = function() {
                    return !1 === this._readableState.flowing
                }, E.prototype.setEncoding = function(e) {
                    s || (s = i(319).I);
                    var t = new s(e);
                    this._readableState.decoder = t, this._readableState.encoding = this._readableState.decoder.encoding;
                    for (var n = this._readableState.buffer.head, r = ""; null !== n;) r += t.write(n.data), n = n.next;
                    return this._readableState.buffer.clear(), "" !== r && this._readableState.buffer.push(r), this._readableState.length = r.length, this
                }, E.prototype.read = function(e) {
                    o("read", e), e = parseInt(e, 10);
                    var t, n = this._readableState,
                        r = e;
                    if (0 !== e && (n.emittedReadable = !1), 0 === e && n.needReadable && ((0 !== n.highWaterMark ? n.length >= n.highWaterMark : n.length > 0) || n.ended)) return o("read: emitReadable", n.length, n.ended), 0 === n.length && n.ended ? U(this) : j(this), null;
                    if (0 === (e = q(e, n)) && n.ended) return 0 === n.length && U(this), null;
                    var i = n.needReadable;
                    return o("need readable", i), (0 === n.length || n.length - e < n.highWaterMark) && o("length less than watermark", i = !0), n.ended || n.reading ? o("reading or ended", i = !1) : i && (o("do read"), n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1, n.reading || (e = q(r, n))), null === (t = e > 0 ? N(e, n) : null) ? (n.needReadable = n.length <= n.highWaterMark, e = 0) : (n.length -= e, n.awaitDrain = 0), 0 === n.length && (n.ended || (n.needReadable = !0), r !== e && n.ended && U(this)), null !== t && this.emit("data", t), t
                }, E.prototype._read = function(e) {
                    S(this, new x("_read()"))
                }, E.prototype.pipe = function(e, t) {
                    var n, i = this,
                        a = this._readableState;
                    switch (a.pipesCount) {
                        case 0:
                            a.pipes = e;
                            break;
                        case 1:
                            a.pipes = [a.pipes, e];
                            break;
                        default:
                            a.pipes.push(e)
                    }
                    a.pipesCount += 1, o("pipe count=%d opts=%j", a.pipesCount, t);
                    var s = t && !1 === t.end || e === r.default.stdout || e === r.default.stderr ? y : u;

                    function u() {
                        o("onend"), e.end()
                    }
                    a.endEmitted ? r.default.nextTick(s) : i.once("end", s), e.on("unpipe", function t(n, r) {
                        o("onunpipe"), n === i && r && !1 === r.hasUnpiped && (r.hasUnpiped = !0, o("cleanup"), e.removeListener("close", p), e.removeListener("finish", v), e.removeListener("drain", l), e.removeListener("error", h), e.removeListener("unpipe", t), i.removeListener("end", u), i.removeListener("end", y), i.removeListener("data", f), d = !0, a.awaitDrain && (!e._writableState || e._writableState.needDrain) && l())
                    });
                    var l = (n = i, function() {
                        var e = n._readableState;
                        o("pipeOnDrain", e.awaitDrain), e.awaitDrain && e.awaitDrain--, 0 === e.awaitDrain && c(n, "data") && (e.flowing = !0, M(n))
                    });
                    e.on("drain", l);
                    var d = !1;

                    function f(t) {
                        o("ondata");
                        var n = e.write(t);
                        o("dest.write", n), !1 === n && ((1 === a.pipesCount && a.pipes === e || a.pipesCount > 1 && -1 !== F(a.pipes, e)) && !d && (o("false write response, pause", a.awaitDrain), a.awaitDrain++), i.pause())
                    }

                    function h(t) {
                        o("onerror", t), y(), e.removeListener("error", h), 0 === c(e, "error") && S(e, t)
                    }

                    function p() {
                        e.removeListener("finish", v), y()
                    }

                    function v() {
                        o("onfinish"), e.removeListener("close", p), y()
                    }

                    function y() {
                        o("unpipe"), i.unpipe(e)
                    }
                    return i.on("data", f), ! function(e, t, n) {
                        if ("function" == typeof e.prependListener) return e.prependListener(t, n);
                        e._events && e._events[t] ? Array.isArray(e._events[t]) ? e._events[t].unshift(n) : e._events[t] = [n, e._events[t]] : e.on(t, n)
                    }(e, "error", h), e.once("close", p), e.once("finish", v), e.emit("pipe", i), a.flowing || (o("pipe resume"), i.resume()), e
                }, E.prototype.unpipe = function(e) {
                    var t = this._readableState,
                        n = {
                            hasUnpiped: !1
                        };
                    if (0 === t.pipesCount) return this;
                    if (1 === t.pipesCount) return e && e !== t.pipes || (e || (e = t.pipes), t.pipes = null, t.pipesCount = 0, t.flowing = !1, e && e.emit("unpipe", this, n)), this;
                    if (!e) {
                        var r = t.pipes,
                            i = t.pipesCount;
                        t.pipes = null, t.pipesCount = 0, t.flowing = !1;
                        for (var a = 0; a < i; a++) r[a].emit("unpipe", this, {
                            hasUnpiped: !1
                        });
                        return this
                    }
                    var o = F(t.pipes, e);
                    return -1 === o || (t.pipes.splice(o, 1), t.pipesCount -= 1, 1 === t.pipesCount && (t.pipes = t.pipes[0]), e.emit("unpipe", this, n)), this
                }, E.prototype.on = function(e, t) {
                    var n = d.prototype.on.call(this, e, t),
                        i = this._readableState;
                    return "data" === e ? (i.readableListening = this.listenerCount("readable") > 0, !1 !== i.flowing && this.resume()) : "readable" !== e || i.endEmitted || i.readableListening || (i.readableListening = i.needReadable = !0, i.flowing = !1, i.emittedReadable = !1, o("on readable", i.length, i.reading), i.length ? j(this) : i.reading || r.default.nextTick(L, this)), n
                }, E.prototype.addListener = E.prototype.on, E.prototype.removeListener = function(e, t) {
                    var n = d.prototype.removeListener.call(this, e, t);
                    return "readable" === e && r.default.nextTick(O, this), n
                }, E.prototype.removeAllListeners = function(e) {
                    var t = d.prototype.removeAllListeners.apply(this, arguments);
                    return ("readable" === e || void 0 === e) && r.default.nextTick(O, this), t
                }, E.prototype.resume = function() {
                    var e, t, n = this._readableState;
                    return n.flowing || (o("resume"), n.flowing = !n.readableListening, e = this, (t = n).resumeScheduled || (t.resumeScheduled = !0, r.default.nextTick(D, e, t))), n.paused = !1, this
                }, E.prototype.pause = function() {
                    return o("call pause flowing=%j", this._readableState.flowing), !1 !== this._readableState.flowing && (o("pause"), this._readableState.flowing = !1, this.emit("pause")), this._readableState.paused = !0, this
                }, E.prototype.wrap = function(e) {
                    var t = this,
                        n = this._readableState,
                        r = !1;
                    for (var i in e.on("end", function() {
                            if (o("wrapped end"), n.decoder && !n.ended) {
                                var e = n.decoder.end();
                                e && e.length && t.push(e)
                            }
                            t.push(null)
                        }), e.on("data", function(i) {
                            o("wrapped data"), n.decoder && (i = n.decoder.write(i)), n.objectMode && null == i || (n.objectMode || i && i.length) && (t.push(i) || (r = !0, e.pause()))
                        }), e) void 0 === this[i] && "function" == typeof e[i] && (this[i] = function(t) {
                        return function() {
                            return e[t].apply(e, arguments)
                        }
                    }(i));
                    for (var a = 0; a < R.length; a++) e.on(R[a], this.emit.bind(this, R[a]));
                    return this._read = function(t) {
                        o("wrapped _read", t), r && (r = !1, e.resume())
                    }, this
                }, "function" == typeof Symbol && (E.prototype[Symbol.asyncIterator] = function() {
                    return void 0 === u && (u = i(531)), u(this)
                }), Object.defineProperty(E.prototype, "readableHighWaterMark", {
                    enumerable: !1,
                    get: function() {
                        return this._readableState.highWaterMark
                    }
                }), Object.defineProperty(E.prototype, "readableBuffer", {
                    enumerable: !1,
                    get: function() {
                        return this._readableState && this._readableState.buffer
                    }
                }), Object.defineProperty(E.prototype, "readableFlowing", {
                    enumerable: !1,
                    get: function() {
                        return this._readableState.flowing
                    },
                    set: function(e) {
                        this._readableState && (this._readableState.flowing = e)
                    }
                }), E._fromList = N, Object.defineProperty(E.prototype, "readableLength", {
                    enumerable: !1,
                    get: function() {
                        return this._readableState.length
                    }
                }), "function" == typeof Symbol && (E.from = function(e, t) {
                    return void 0 === l && (l = i(812)), l(E, e, t)
                })
            },
            586: function(e, t, n) {
                "use strict";
                e.exports = c;
                var r = n(329).F,
                    i = r.ERR_METHOD_NOT_IMPLEMENTED,
                    a = r.ERR_MULTIPLE_CALLBACK,
                    o = r.ERR_TRANSFORM_ALREADY_TRANSFORMING,
                    s = r.ERR_TRANSFORM_WITH_LENGTH_0,
                    u = n(686);

                function l(e, t) {
                    var n = this._transformState;
                    n.transforming = !1;
                    var r = n.writecb;
                    if (null === r) return this.emit("error", new a);
                    n.writechunk = null, n.writecb = null, null != t && this.push(t), r(e);
                    var i = this._readableState;
                    i.reading = !1, (i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
                }

                function c(e) {
                    if (!(this instanceof c)) return new c(e);
                    u.call(this, e), this._transformState = {
                        afterTransform: l.bind(this),
                        needTransform: !1,
                        transforming: !1,
                        writecb: null,
                        writechunk: null,
                        writeencoding: null
                    }, this._readableState.needReadable = !0, this._readableState.sync = !1, e && ("function" == typeof e.transform && (this._transform = e.transform), "function" == typeof e.flush && (this._flush = e.flush)), this.on("prefinish", d)
                }

                function d() {
                    var e = this;
                    "function" != typeof this._flush || this._readableState.destroyed ? f(this, null, null) : this._flush(function(t, n) {
                        f(e, t, n)
                    })
                }

                function f(e, t, n) {
                    if (t) return e.emit("error", t);
                    if (null != n && e.push(n), e._writableState.length) throw new s;
                    if (e._transformState.transforming) throw new o;
                    return e.push(null)
                }
                n(638)(c, u), c.prototype.push = function(e, t) {
                    return this._transformState.needTransform = !1, u.prototype.push.call(this, e, t)
                }, c.prototype._transform = function(e, t, n) {
                    n(new i("_transform()"))
                }, c.prototype._write = function(e, t, n) {
                    var r = this._transformState;
                    if (r.writecb = n, r.writechunk = e, r.writeencoding = t, !r.transforming) {
                        var i = this._readableState;
                        (r.needTransform || i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
                    }
                }, c.prototype._read = function(e) {
                    var t = this._transformState;
                    null === t.writechunk || t.transforming ? t.needTransform = !0 : (t.transforming = !0, this._transform(t.writechunk, t.writeencoding, t.afterTransform))
                }, c.prototype._destroy = function(e, t) {
                    u.prototype._destroy.call(this, e, function(e) {
                        t(e)
                    })
                }
            },
            732: function(t, n, i) {
                "use strict";

                function a(e) {
                    var t = this;
                    this.next = null, this.entry = null, this.finish = function() {
                        var n = t,
                            r = e,
                            i = n.entry;
                        for (n.entry = null; i;) {
                            var a = i.callback;
                            r.pendingcb--, a(void 0), i = i.next
                        }
                        r.corkedRequestsFree.next = n
                    }
                }
                t.exports = E, E.WritableState = T;
                var o, s, u = {
                        deprecate: i(774)
                    },
                    l = i(120),
                    c = i(181).Buffer,
                    d = e.g.Uint8Array || function() {},
                    f = i(528),
                    h = i(771).getHighWaterMark,
                    p = i(329).F,
                    v = p.ERR_INVALID_ARG_TYPE,
                    y = p.ERR_METHOD_NOT_IMPLEMENTED,
                    m = p.ERR_MULTIPLE_CALLBACK,
                    g = p.ERR_STREAM_CANNOT_PIPE,
                    b = p.ERR_STREAM_DESTROYED,
                    w = p.ERR_STREAM_NULL_VALUES,
                    x = p.ERR_STREAM_WRITE_AFTER_END,
                    P = p.ERR_UNKNOWN_ENCODING,
                    S = f.errorOrDestroy;

                function R() {}

                function T(e, t, n) {
                    o = o || i(686), e = e || {}, "boolean" != typeof n && (n = t instanceof o), this.objectMode = !!e.objectMode, n && (this.objectMode = this.objectMode || !!e.writableObjectMode), this.highWaterMark = h(this, e, "writableHighWaterMark", n), this.finalCalled = !1, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1, this.destroyed = !1;
                    var s = !1 === e.decodeStrings;
                    this.decodeStrings = !s, this.defaultEncoding = e.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.corked = 0, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(e) {
                        ! function(e, t) {
                            var n = e._writableState,
                                i = n.sync,
                                a = n.writecb;
                            if ("function" != typeof a) throw new m;
                            if (n.writing = !1, n.writecb = null, n.length -= n.writelen, n.writelen = 0, t) --n.pendingcb, i ? (r.default.nextTick(a, t), r.default.nextTick(I, e, n), e._writableState.errorEmitted = !0, S(e, t)) : (a(t), e._writableState.errorEmitted = !0, S(e, t), I(e, n));
                            else {
                                var o = j(n) || e.destroyed;
                                o || n.corked || n.bufferProcessing || !n.bufferedRequest || q(e, n), i ? r.default.nextTick(A, e, n, o, a) : A(e, n, o, a)
                            }
                        }(t, e)
                    }, this.writecb = null, this.writelen = 0, this.bufferedRequest = null, this.lastBufferedRequest = null, this.pendingcb = 0, this.prefinished = !1, this.errorEmitted = !1, this.emitClose = !1 !== e.emitClose, this.autoDestroy = !!e.autoDestroy, this.bufferedRequestCount = 0, this.corkedRequestsFree = new a(this)
                }
                i(638)(E, l), T.prototype.getBuffer = function() {
                    for (var e = this.bufferedRequest, t = []; e;) t.push(e), e = e.next;
                    return t
                };
                try {
                    Object.defineProperty(T.prototype, "buffer", {
                        get: u.deprecate(function() {
                            return this.getBuffer()
                        }, "_writableState.buffer is deprecated. Use _writableState.getBuffer instead.", "DEP0003")
                    })
                } catch (e) {}

                function E(e) {
                    var t = this instanceof(o = o || i(686));
                    if (!t && !s.call(E, this)) return new E(e);
                    this._writableState = new T(e, this, t), this.writable = !0, e && ("function" == typeof e.write && (this._write = e.write), "function" == typeof e.writev && (this._writev = e.writev), "function" == typeof e.destroy && (this._destroy = e.destroy), "function" == typeof e.final && (this._final = e.final)), l.call(this)
                }

                function k(e, t, n, r, i, a, o) {
                    t.writelen = r, t.writecb = o, t.writing = !0, t.sync = !0, t.destroyed ? t.onwrite(new b("write")) : n ? e._writev(i, t.onwrite) : e._write(i, a, t.onwrite), t.sync = !1
                }

                function A(e, t, n, r) {
                    var i, a;
                    n || (i = e, 0 === (a = t).length && a.needDrain && (a.needDrain = !1, i.emit("drain"))), t.pendingcb--, r(), I(e, t)
                }

                function q(e, t) {
                    t.bufferProcessing = !0;
                    var n = t.bufferedRequest;
                    if (e._writev && n && n.next) {
                        var r = Array(t.bufferedRequestCount),
                            i = t.corkedRequestsFree;
                        i.entry = n;
                        for (var o = 0, s = !0; n;) r[o] = n, n.isBuf || (s = !1), n = n.next, o += 1;
                        r.allBuffers = s, k(e, t, !0, t.length, r, "", i.finish), t.pendingcb++, t.lastBufferedRequest = null, i.next ? (t.corkedRequestsFree = i.next, i.next = null) : t.corkedRequestsFree = new a(t), t.bufferedRequestCount = 0
                    } else {
                        for (; n;) {
                            var u = n.chunk,
                                l = n.encoding,
                                c = n.callback,
                                d = t.objectMode ? 1 : u.length;
                            if (k(e, t, !1, d, u, l, c), n = n.next, t.bufferedRequestCount--, t.writing) break
                        }
                        null === n && (t.lastBufferedRequest = null)
                    }
                    t.bufferedRequest = n, t.bufferProcessing = !1
                }

                function j(e) {
                    return e.ending && 0 === e.length && null === e.bufferedRequest && !e.finished && !e.writing
                }

                function _(e, t) {
                    e._final(function(n) {
                        t.pendingcb--, n && S(e, n), t.prefinished = !0, e.emit("prefinish"), I(e, t)
                    })
                }

                function I(e, t) {
                    var n = j(t);
                    if (n && (t.prefinished || t.finalCalled || ("function" != typeof e._final || t.destroyed ? (t.prefinished = !0, e.emit("prefinish")) : (t.pendingcb++, t.finalCalled = !0, r.default.nextTick(_, e, t))), 0 === t.pendingcb && (t.finished = !0, e.emit("finish"), t.autoDestroy))) {
                        var i = e._readableState;
                        (!i || i.autoDestroy && i.endEmitted) && e.destroy()
                    }
                    return n
                }
                "function" == typeof Symbol && Symbol.hasInstance && "function" == typeof Function.prototype[Symbol.hasInstance] ? (s = Function.prototype[Symbol.hasInstance], Object.defineProperty(E, Symbol.hasInstance, {
                    value: function(e) {
                        return !!s.call(this, e) || this === E && e && e._writableState instanceof T
                    }
                })) : s = function(e) {
                    return e instanceof this
                }, E.prototype.pipe = function() {
                    S(this, new g)
                }, E.prototype.write = function(e, t, n) {
                    var i, a, o, s, u, l, f, h = this._writableState,
                        p = !1,
                        y = !h.objectMode && (i = e, c.isBuffer(i) || i instanceof d);
                    return (y && !c.isBuffer(e) && (a = e, e = c.from(a)), "function" == typeof t && (n = t, t = null), y ? t = "buffer" : t || (t = h.defaultEncoding), "function" != typeof n && (n = R), h.ending) ? (o = n, S(this, s = new x), r.default.nextTick(o, s)) : (y || (u = e, l = n, null === u ? f = new w : "string" == typeof u || h.objectMode || (f = new v("chunk", ["string", "Buffer"], u)), !f || (S(this, f), r.default.nextTick(l, f), 0))) && (h.pendingcb++, p = function(e, t, n, r, i, a) {
                        if (!n) {
                            var o, s, u = (o = r, s = i, t.objectMode || !1 === t.decodeStrings || "string" != typeof o || (o = c.from(o, s)), o);
                            r !== u && (n = !0, i = "buffer", r = u)
                        }
                        var l = t.objectMode ? 1 : r.length;
                        t.length += l;
                        var d = t.length < t.highWaterMark;
                        if (d || (t.needDrain = !0), t.writing || t.corked) {
                            var f = t.lastBufferedRequest;
                            t.lastBufferedRequest = {
                                chunk: r,
                                encoding: i,
                                isBuf: n,
                                callback: a,
                                next: null
                            }, f ? f.next = t.lastBufferedRequest : t.bufferedRequest = t.lastBufferedRequest, t.bufferedRequestCount += 1
                        } else k(e, t, !1, l, r, i, a);
                        return d
                    }(this, h, y, e, t, n)), p
                }, E.prototype.cork = function() {
                    this._writableState.corked++
                }, E.prototype.uncork = function() {
                    var e = this._writableState;
                    e.corked && (e.corked--, e.writing || e.corked || e.bufferProcessing || !e.bufferedRequest || q(this, e))
                }, E.prototype.setDefaultEncoding = function(e) {
                    if ("string" == typeof e && (e = e.toLowerCase()), !(["hex", "utf8", "utf-8", "ascii", "binary", "base64", "ucs2", "ucs-2", "utf16le", "utf-16le", "raw"].indexOf((e + "").toLowerCase()) > -1)) throw new P(e);
                    return this._writableState.defaultEncoding = e, this
                }, Object.defineProperty(E.prototype, "writableBuffer", {
                    enumerable: !1,
                    get: function() {
                        return this._writableState && this._writableState.getBuffer()
                    }
                }), Object.defineProperty(E.prototype, "writableHighWaterMark", {
                    enumerable: !1,
                    get: function() {
                        return this._writableState.highWaterMark
                    }
                }), E.prototype._write = function(e, t, n) {
                    n(new y("_write()"))
                }, E.prototype._writev = null, E.prototype.end = function(e, t, n) {
                    var i, a, o, s = this._writableState;
                    return "function" == typeof e ? (n = e, e = null, t = null) : "function" == typeof t && (n = t, t = null), null != e && this.write(e, t), s.corked && (s.corked = 1, this.uncork()), s.ending || (i = this, a = s, o = n, a.ending = !0, I(i, a), o && (a.finished ? r.default.nextTick(o) : i.once("finish", o)), a.ended = !0, i.writable = !1), this
                }, Object.defineProperty(E.prototype, "writableLength", {
                    enumerable: !1,
                    get: function() {
                        return this._writableState.length
                    }
                }), Object.defineProperty(E.prototype, "destroyed", {
                    enumerable: !1,
                    get: function() {
                        return void 0 !== this._writableState && this._writableState.destroyed
                    },
                    set: function(e) {
                        this._writableState && (this._writableState.destroyed = e)
                    }
                }), E.prototype.destroy = f.destroy, E.prototype._undestroy = f.undestroy, E.prototype._destroy = function(e, t) {
                    t(e)
                }
            },
            531: function(e, t, n) {
                "use strict";

                function i(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }
                var a, o = n(134),
                    s = Symbol("lastResolve"),
                    u = Symbol("lastReject"),
                    l = Symbol("error"),
                    c = Symbol("ended"),
                    d = Symbol("lastPromise"),
                    f = Symbol("handlePromise"),
                    h = Symbol("stream");

                function p(e, t) {
                    return {
                        value: e,
                        done: t
                    }
                }

                function v(e) {
                    var t = e[s];
                    if (null !== t) {
                        var n = e[h].read();
                        null !== n && (e[d] = null, e[s] = null, e[u] = null, t(p(n, !1)))
                    }
                }

                function y(e) {
                    r.default.nextTick(v, e)
                }
                var m = Object.getPrototypeOf(function() {}),
                    g = Object.setPrototypeOf((i(a = {
                        get stream() {
                            return this[h]
                        },
                        next: function() {
                            var e, t, n = this,
                                i = this[l];
                            if (null !== i) return Promise.reject(i);
                            if (this[c]) return Promise.resolve(p(void 0, !0));
                            if (this[h].destroyed) return new Promise(function(e, t) {
                                r.default.nextTick(function() {
                                    n[l] ? t(n[l]) : e(p(void 0, !0))
                                })
                            });
                            var a = this[d];
                            if (a) t = new Promise((e = this, function(t, n) {
                                a.then(function() {
                                    e[c] ? t(p(void 0, !0)) : e[f](t, n)
                                }, n)
                            }));
                            else {
                                var o = this[h].read();
                                if (null !== o) return Promise.resolve(p(o, !1));
                                t = new Promise(this[f])
                            }
                            return this[d] = t, t
                        }
                    }, Symbol.asyncIterator, function() {
                        return this
                    }), i(a, "return", function() {
                        var e = this;
                        return new Promise(function(t, n) {
                            e[h].destroy(null, function(e) {
                                e ? n(e) : t(p(void 0, !0))
                            })
                        })
                    }), a), m);
                e.exports = function(e) {
                    var t, n = Object.create(g, (i(t = {}, h, {
                        value: e,
                        writable: !0
                    }), i(t, s, {
                        value: null,
                        writable: !0
                    }), i(t, u, {
                        value: null,
                        writable: !0
                    }), i(t, l, {
                        value: null,
                        writable: !0
                    }), i(t, c, {
                        value: e._readableState.endEmitted,
                        writable: !0
                    }), i(t, f, {
                        value: function(e, t) {
                            var r = n[h].read();
                            r ? (n[d] = null, n[s] = null, n[u] = null, e(p(r, !1))) : (n[s] = e, n[u] = t)
                        },
                        writable: !0
                    }), t));
                    return n[d] = null, o(e, function(e) {
                        if (e && "ERR_STREAM_PREMATURE_CLOSE" !== e.code) {
                            var t = n[u];
                            null !== t && (n[d] = null, n[s] = null, n[u] = null, t(e)), n[l] = e;
                            return
                        }
                        var r = n[s];
                        null !== r && (n[d] = null, n[s] = null, n[u] = null, r(p(void 0, !0))), n[c] = !0
                    }), e.on("readable", y.bind(null, n)), n
                }
            },
            137: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t && (r = r.filter(function(t) {
                            return Object.getOwnPropertyDescriptor(e, t).enumerable
                        })), n.push.apply(n, r)
                    }
                    return n
                }
                var i = n(181).Buffer,
                    a = n(23).inspect,
                    o = a && a.custom || "inspect";
                e.exports = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        this.head = null, this.tail = null, this.length = 0
                    }
                    return e = [{
                            key: "push",
                            value: function(e) {
                                var t = {
                                    data: e,
                                    next: null
                                };
                                this.length > 0 ? this.tail.next = t : this.head = t, this.tail = t, ++this.length
                            }
                        }, {
                            key: "unshift",
                            value: function(e) {
                                var t = {
                                    data: e,
                                    next: this.head
                                };
                                0 === this.length && (this.tail = t), this.head = t, ++this.length
                            }
                        }, {
                            key: "shift",
                            value: function() {
                                if (0 !== this.length) {
                                    var e = this.head.data;
                                    return 1 === this.length ? this.head = this.tail = null : this.head = this.head.next, --this.length, e
                                }
                            }
                        }, {
                            key: "clear",
                            value: function() {
                                this.head = this.tail = null, this.length = 0
                            }
                        }, {
                            key: "join",
                            value: function(e) {
                                if (0 === this.length) return "";
                                for (var t = this.head, n = "" + t.data; t = t.next;) n += e + t.data;
                                return n
                            }
                        }, {
                            key: "concat",
                            value: function(e) {
                                if (0 === this.length) return i.alloc(0);
                                for (var t, n, r = i.allocUnsafe(e >>> 0), a = this.head, o = 0; a;) t = a.data, n = o, i.prototype.copy.call(t, r, n), o += a.data.length, a = a.next;
                                return r
                            }
                        }, {
                            key: "consume",
                            value: function(e, t) {
                                var n;
                                return e < this.head.data.length ? (n = this.head.data.slice(0, e), this.head.data = this.head.data.slice(e)) : n = e === this.head.data.length ? this.shift() : t ? this._getString(e) : this._getBuffer(e), n
                            }
                        }, {
                            key: "first",
                            value: function() {
                                return this.head.data
                            }
                        }, {
                            key: "_getString",
                            value: function(e) {
                                var t = this.head,
                                    n = 1,
                                    r = t.data;
                                for (e -= r.length; t = t.next;) {
                                    var i = t.data,
                                        a = e > i.length ? i.length : e;
                                    if (a === i.length ? r += i : r += i.slice(0, e), 0 == (e -= a)) {
                                        a === i.length ? (++n, t.next ? this.head = t.next : this.head = this.tail = null) : (this.head = t, t.data = i.slice(a));
                                        break
                                    }++n
                                }
                                return this.length -= n, r
                            }
                        }, {
                            key: "_getBuffer",
                            value: function(e) {
                                var t = i.allocUnsafe(e),
                                    n = this.head,
                                    r = 1;
                                for (n.data.copy(t), e -= n.data.length; n = n.next;) {
                                    var a = n.data,
                                        o = e > a.length ? a.length : e;
                                    if (a.copy(t, t.length - e, 0, o), 0 == (e -= o)) {
                                        o === a.length ? (++r, n.next ? this.head = n.next : this.head = this.tail = null) : (this.head = n, n.data = a.slice(o));
                                        break
                                    }++r
                                }
                                return this.length -= r, t
                            }
                        }, {
                            key: o,
                            value: function(e, t) {
                                return a(this, function(e) {
                                    for (var t = 1; t < arguments.length; t++) {
                                        var n = null != arguments[t] ? arguments[t] : {};
                                        t % 2 ? r(Object(n), !0).forEach(function(t) {
                                            var r, i, a;
                                            r = e, i = t, a = n[t], i in r ? Object.defineProperty(r, i, {
                                                value: a,
                                                enumerable: !0,
                                                configurable: !0,
                                                writable: !0
                                            }) : r[i] = a
                                        }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : r(Object(n)).forEach(function(t) {
                                            Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                                        })
                                    }
                                    return e
                                }({}, t, {
                                    depth: 0,
                                    customInspect: !1
                                }))
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }()
            },
            528: function(e) {
                "use strict";

                function t(e, t) {
                    i(e, t), n(e)
                }

                function n(e) {
                    e._writableState && !e._writableState.emitClose || (!e._readableState || e._readableState.emitClose) && e.emit("close")
                }

                function i(e, t) {
                    e.emit("error", t)
                }
                e.exports = {
                    destroy: function(e, a) {
                        var o = this,
                            s = this._readableState && this._readableState.destroyed,
                            u = this._writableState && this._writableState.destroyed;
                        return s || u ? a ? a(e) : e && (this._writableState ? this._writableState.errorEmitted || (this._writableState.errorEmitted = !0, r.default.nextTick(i, this, e)) : r.default.nextTick(i, this, e)) : (this._readableState && (this._readableState.destroyed = !0), this._writableState && (this._writableState.destroyed = !0), this._destroy(e || null, function(e) {
                            !a && e ? o._writableState ? o._writableState.errorEmitted ? r.default.nextTick(n, o) : (o._writableState.errorEmitted = !0, r.default.nextTick(t, o, e)) : r.default.nextTick(t, o, e) : a ? (r.default.nextTick(n, o), a(e)) : r.default.nextTick(n, o)
                        })), this
                    },
                    undestroy: function() {
                        this._readableState && (this._readableState.destroyed = !1, this._readableState.reading = !1, this._readableState.ended = !1, this._readableState.endEmitted = !1), this._writableState && (this._writableState.destroyed = !1, this._writableState.ended = !1, this._writableState.ending = !1, this._writableState.finalCalled = !1, this._writableState.prefinished = !1, this._writableState.finished = !1, this._writableState.errorEmitted = !1)
                    },
                    errorOrDestroy: function(e, t) {
                        var n = e._readableState,
                            r = e._writableState;
                        n && n.autoDestroy || r && r.autoDestroy ? e.destroy(t) : e.emit("error", t)
                    }
                }
            },
            134: function(e, t, n) {
                "use strict";
                var r = n(329).F.ERR_STREAM_PREMATURE_CLOSE;

                function i() {}
                e.exports = function e(t, n, a) {
                    if ("function" == typeof n) return e(t, null, n);
                    n || (n = {}), o = a || i, s = !1, a = function() {
                        if (!s) {
                            s = !0;
                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            o.apply(this, t)
                        }
                    };
                    var o, s, u = n.readable || !1 !== n.readable && t.readable,
                        l = n.writable || !1 !== n.writable && t.writable,
                        c = function() {
                            t.writable || f()
                        },
                        d = t._writableState && t._writableState.finished,
                        f = function() {
                            l = !1, d = !0, u || a.call(t)
                        },
                        h = t._readableState && t._readableState.endEmitted,
                        p = function() {
                            u = !1, h = !0, l || a.call(t)
                        },
                        v = function(e) {
                            a.call(t, e)
                        },
                        y = function() {
                            var e;
                            return u && !h ? (t._readableState && t._readableState.ended || (e = new r), a.call(t, e)) : l && !d ? (t._writableState && t._writableState.ended || (e = new r), a.call(t, e)) : void 0
                        },
                        m = function() {
                            t.req.on("finish", f)
                        };
                    return t.setHeader && "function" == typeof t.abort ? (t.on("complete", f), t.on("abort", y), t.req ? m() : t.on("request", m)) : l && !t._writableState && (t.on("end", c), t.on("close", c)), t.on("end", p), t.on("finish", f), !1 !== n.error && t.on("error", v), t.on("close", y),
                        function() {
                            t.removeListener("complete", f), t.removeListener("abort", y), t.removeListener("request", m), t.req && t.req.removeListener("finish", f), t.removeListener("end", c), t.removeListener("close", c), t.removeListener("finish", f), t.removeListener("end", p), t.removeListener("error", v), t.removeListener("close", y)
                        }
                }
            },
            812: function(e, t, n) {
                "use strict";

                function r(e, t, n, r, i, a, o) {
                    try {
                        var s = e[a](o),
                            u = s.value
                    } catch (e) {
                        n(e);
                        return
                    }
                    s.done ? t(u) : Promise.resolve(u).then(r, i)
                }

                function i(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t && (r = r.filter(function(t) {
                            return Object.getOwnPropertyDescriptor(e, t).enumerable
                        })), n.push.apply(n, r)
                    }
                    return n
                }
                var a = n(329).F.ERR_INVALID_ARG_TYPE;
                e.exports = function(e, t, n) {
                    if (t && "function" == typeof t.next) o = t;
                    else if (t && t[Symbol.asyncIterator]) o = t[Symbol.asyncIterator]();
                    else if (t && t[Symbol.iterator]) o = t[Symbol.iterator]();
                    else throw new a("iterable", ["Iterable"], t);
                    var o, s = new e(function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {};
                                t % 2 ? i(Object(n), !0).forEach(function(t) {
                                    var r, i, a;
                                    r = e, i = t, a = n[t], i in r ? Object.defineProperty(r, i, {
                                        value: a,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : r[i] = a
                                }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : i(Object(n)).forEach(function(t) {
                                    Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                                })
                            }
                            return e
                        }({
                            objectMode: !0
                        }, n)),
                        u = !1;

                    function l() {
                        return c.apply(this, arguments)
                    }

                    function c() {
                        var e;
                        return e = function*() {
                            try {
                                var e = yield o.next(), t = e.value;
                                e.done ? s.push(null) : s.push((yield t)) ? l() : u = !1
                            } catch (e) {
                                s.destroy(e)
                            }
                        }, (c = function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(i, a) {
                                var o = e.apply(t, n);

                                function s(e) {
                                    r(o, i, a, s, u, "next", e)
                                }

                                function u(e) {
                                    r(o, i, a, s, u, "throw", e)
                                }
                                s(void 0)
                            })
                        }).apply(this, arguments)
                    }
                    return s._read = function() {
                        u || (u = !0, l())
                    }, s
                }
            },
            694: function(e, t, n) {
                "use strict";
                var r, i = n(329).F,
                    a = i.ERR_MISSING_ARGS,
                    o = i.ERR_STREAM_DESTROYED;

                function s(e) {
                    if (e) throw e
                }

                function u(e) {
                    e()
                }

                function l(e, t) {
                    return e.pipe(t)
                }
                e.exports = function() {
                    for (var e, t, i = arguments.length, c = Array(i), d = 0; d < i; d++) c[d] = arguments[d];
                    var f = (e = c).length && "function" == typeof e[e.length - 1] ? e.pop() : s;
                    if (Array.isArray(c[0]) && (c = c[0]), c.length < 2) throw new a("streams");
                    var h = c.map(function(e, i) {
                        var a, s, l, d, p, v, y = i < c.length - 1;
                        return a = i > 0, l = s = function(e) {
                                t || (t = e), e && h.forEach(u), y || (h.forEach(u), f(t))
                            }, d = !1, s = function() {
                                d || (d = !0, l.apply(void 0, arguments))
                            }, p = !1, e.on("close", function() {
                                p = !0
                            }), void 0 === r && (r = n(134)), r(e, {
                                readable: y,
                                writable: a
                            }, function(e) {
                                if (e) return s(e);
                                p = !0, s()
                            }), v = !1,
                            function(t) {
                                if (!p && !v) {
                                    if (v = !0, e.setHeader && "function" == typeof e.abort) return e.abort();
                                    if ("function" == typeof e.destroy) return e.destroy();
                                    s(t || new o("pipe"))
                                }
                            }
                    });
                    return c.reduce(l)
                }
            },
            771: function(e, t, n) {
                "use strict";
                var r = n(329).F.ERR_INVALID_OPT_VALUE;
                e.exports = {
                    getHighWaterMark: function(e, t, n, i) {
                        var a = null != t.highWaterMark ? t.highWaterMark : i ? t[n] : null;
                        if (null != a) {
                            if (!(isFinite(a) && Math.floor(a) === a) || a < 0) throw new r(i ? n : "highWaterMark", a);
                            return Math.floor(a)
                        }
                        return e.objectMode ? 16 : 16384
                    }
                }
            },
            120: function(e, t, n) {
                e.exports = n(203)
            },
            56: function(e, t, n) {
                var r = n(181),
                    i = r.Buffer;

                function a(e, t) {
                    for (var n in e) t[n] = e[n]
                }

                function o(e, t, n) {
                    return i(e, t, n)
                }
                i.from && i.alloc && i.allocUnsafe && i.allocUnsafeSlow ? e.exports = r : (a(r, t), t.Buffer = o), o.prototype = Object.create(i.prototype), a(i, o), o.from = function(e, t, n) {
                    if ("number" == typeof e) throw TypeError("Argument must not be a number");
                    return i(e, t, n)
                }, o.alloc = function(e, t, n) {
                    if ("number" != typeof e) throw TypeError("Argument must be a number");
                    var r = i(e);
                    return void 0 !== t ? "string" == typeof n ? r.fill(t, n) : r.fill(t) : r.fill(0), r
                }, o.allocUnsafe = function(e) {
                    if ("number" != typeof e) throw TypeError("Argument must be a number");
                    return i(e)
                }, o.allocUnsafeSlow = function(e) {
                    if ("number" != typeof e) throw TypeError("Argument must be a number");
                    return r.SlowBuffer(e)
                }
            },
            854: function(e, t, n) {
                e.exports = i;
                var r = n(434).EventEmitter;

                function i() {
                    r.call(this)
                }
                n(638)(i, r), i.Readable = n(276), i.Writable = n(732), i.Duplex = n(686), i.Transform = n(586), i.PassThrough = n(512), i.finished = n(134), i.pipeline = n(694), i.Stream = i, i.prototype.pipe = function(e, t) {
                    var n = this;

                    function i(t) {
                        e.writable && !1 === e.write(t) && n.pause && n.pause()
                    }

                    function a() {
                        n.readable && n.resume && n.resume()
                    }
                    n.on("data", i), e.on("drain", a), e._isStdio || t && !1 === t.end || (n.on("end", s), n.on("close", u));
                    var o = !1;

                    function s() {
                        o || (o = !0, e.end())
                    }

                    function u() {
                        o || (o = !0, "function" == typeof e.destroy && e.destroy())
                    }

                    function l(e) {
                        if (c(), 0 === r.listenerCount(this, "error")) throw e
                    }

                    function c() {
                        n.removeListener("data", i), e.removeListener("drain", a), n.removeListener("end", s), n.removeListener("close", u), n.removeListener("error", l), e.removeListener("error", l), n.removeListener("end", c), n.removeListener("close", c), e.removeListener("close", c)
                    }
                    return n.on("error", l), e.on("error", l), n.on("end", c), n.on("close", c), e.on("close", c), e.emit("pipe", n), e
                }
            },
            319: function(e, t, n) {
                "use strict";
                var r = n(56).Buffer,
                    i = r.isEncoding || function(e) {
                        switch ((e = "" + e) && e.toLowerCase()) {
                            case "hex":
                            case "utf8":
                            case "utf-8":
                            case "ascii":
                            case "binary":
                            case "base64":
                            case "ucs2":
                            case "ucs-2":
                            case "utf16le":
                            case "utf-16le":
                            case "raw":
                                return !0;
                            default:
                                return !1
                        }
                    };

                function a(e) {
                    var t;
                    switch (this.encoding = function(e) {
                            var t = function(e) {
                                var t;
                                if (!e) return "utf8";
                                for (;;) switch (e) {
                                    case "utf8":
                                    case "utf-8":
                                        return "utf8";
                                    case "ucs2":
                                    case "ucs-2":
                                    case "utf16le":
                                    case "utf-16le":
                                        return "utf16le";
                                    case "latin1":
                                    case "binary":
                                        return "latin1";
                                    case "base64":
                                    case "ascii":
                                    case "hex":
                                        return e;
                                    default:
                                        if (t) return;
                                        e = ("" + e).toLowerCase(), t = !0
                                }
                            }(e);
                            if ("string" != typeof t && (r.isEncoding === i || !i(e))) throw Error("Unknown encoding: " + e);
                            return t || e
                        }(e), this.encoding) {
                        case "utf16le":
                            this.text = u, this.end = l, t = 4;
                            break;
                        case "utf8":
                            this.fillLast = s, t = 4;
                            break;
                        case "base64":
                            this.text = c, this.end = d, t = 3;
                            break;
                        default:
                            this.write = f, this.end = h;
                            return
                    }
                    this.lastNeed = 0, this.lastTotal = 0, this.lastChar = r.allocUnsafe(t)
                }

                function o(e) {
                    return e <= 127 ? 0 : e >> 5 == 6 ? 2 : e >> 4 == 14 ? 3 : e >> 3 == 30 ? 4 : e >> 6 == 2 ? -1 : -2
                }

                function s(e) {
                    var t = this.lastTotal - this.lastNeed,
                        n = function(e, t) {
                            if ((192 & t[0]) != 128) return e.lastNeed = 0, "�";
                            if (e.lastNeed > 1 && t.length > 1) {
                                if ((192 & t[1]) != 128) return e.lastNeed = 1, "�";
                                if (e.lastNeed > 2 && t.length > 2 && (192 & t[2]) != 128) return e.lastNeed = 2, "�"
                            }
                        }(this, e);
                    return void 0 !== n ? n : this.lastNeed <= e.length ? (e.copy(this.lastChar, t, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal)) : void(e.copy(this.lastChar, t, 0, e.length), this.lastNeed -= e.length)
                }

                function u(e, t) {
                    if ((e.length - t) % 2 == 0) {
                        var n = e.toString("utf16le", t);
                        if (n) {
                            var r = n.charCodeAt(n.length - 1);
                            if (r >= 55296 && r <= 56319) return this.lastNeed = 2, this.lastTotal = 4, this.lastChar[0] = e[e.length - 2], this.lastChar[1] = e[e.length - 1], n.slice(0, -1)
                        }
                        return n
                    }
                    return this.lastNeed = 1, this.lastTotal = 2, this.lastChar[0] = e[e.length - 1], e.toString("utf16le", t, e.length - 1)
                }

                function l(e) {
                    var t = e && e.length ? this.write(e) : "";
                    if (this.lastNeed) {
                        var n = this.lastTotal - this.lastNeed;
                        return t + this.lastChar.toString("utf16le", 0, n)
                    }
                    return t
                }

                function c(e, t) {
                    var n = (e.length - t) % 3;
                    return 0 === n ? e.toString("base64", t) : (this.lastNeed = 3 - n, this.lastTotal = 3, 1 === n ? this.lastChar[0] = e[e.length - 1] : (this.lastChar[0] = e[e.length - 2], this.lastChar[1] = e[e.length - 1]), e.toString("base64", t, e.length - n))
                }

                function d(e) {
                    var t = e && e.length ? this.write(e) : "";
                    return this.lastNeed ? t + this.lastChar.toString("base64", 0, 3 - this.lastNeed) : t
                }

                function f(e) {
                    return e.toString(this.encoding)
                }

                function h(e) {
                    return e && e.length ? this.write(e) : ""
                }
                t.I = a, a.prototype.write = function(e) {
                    var t, n;
                    if (0 === e.length) return "";
                    if (this.lastNeed) {
                        if (void 0 === (t = this.fillLast(e))) return "";
                        n = this.lastNeed, this.lastNeed = 0
                    } else n = 0;
                    return n < e.length ? t ? t + this.text(e, n) : this.text(e, n) : t || ""
                }, a.prototype.end = function(e) {
                    var t = e && e.length ? this.write(e) : "";
                    return this.lastNeed ? t + "�" : t
                }, a.prototype.text = function(e, t) {
                    var n = function(e, t, n) {
                        var r = t.length - 1;
                        if (r < n) return 0;
                        var i = o(t[r]);
                        return i >= 0 ? (i > 0 && (e.lastNeed = i - 1), i) : --r < n || -2 === i ? 0 : (i = o(t[r])) >= 0 ? (i > 0 && (e.lastNeed = i - 2), i) : --r < n || -2 === i ? 0 : (i = o(t[r])) >= 0 ? (i > 0 && (2 === i ? i = 0 : e.lastNeed = i - 3), i) : 0
                    }(this, e, t);
                    if (!this.lastNeed) return e.toString("utf8", t);
                    this.lastTotal = n;
                    var r = e.length - (n - this.lastNeed);
                    return e.copy(this.lastChar, 0, r), e.toString("utf8", t, r)
                }, a.prototype.fillLast = function(e) {
                    if (this.lastNeed <= e.length) return e.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal);
                    e.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, e.length), this.lastNeed -= e.length
                }
            },
            774: function(t) {
                t.exports = function(e, t) {
                    if (n("noDeprecation")) return e;
                    var r = !1;
                    return function() {
                        if (!r) {
                            if (n("throwDeprecation")) throw Error(t);
                            n("traceDeprecation") ? console.trace(t) : console.warn(t), r = !0
                        }
                        return e.apply(this, arguments)
                    }
                };

                function n(t) {
                    try {
                        if (!e.g.localStorage) return !1
                    } catch (e) {
                        return !1
                    }
                    var n = e.g.localStorage[t];
                    return null != n && "true" === String(n).toLowerCase()
                }
            },
            181: function(t) {
                "use strict";
                t.exports = e.r(570098)
            },
            434: function(t) {
                "use strict";
                t.exports = e.r(796701)
            },
            203: function(t) {
                "use strict";
                t.exports = e.r(796701).EventEmitter
            },
            23: function(t) {
                "use strict";
                t.exports = e.r(171475)
            }
        },
        a = {};

    function o(e) {
        var t = a[e];
        if (void 0 !== t) return t.exports;
        var n = a[e] = {
                exports: {}
            },
            r = !0;
        try {
            i[e](n, n.exports, o), r = !1
        } finally {
            r && delete a[e]
        }
        return n.exports
    }
    o.ab = "/ROOT/links/@/next/16.4.5/0de1122c89b9724448b83052600528d4b1dce37d3127900fabdf5af34275552d/node_modules/next/dist/compiled/stream-browserify/", t.exports = o(854)
}, 171475, (e, t, n) => {
    var r = e.i(570098),
        i = e.i(163021),
        a = {
            7492: function(e) {
                e.exports = function(e, n, r) {
                    if (e.filter) return e.filter(n, r);
                    if (null == e || "function" != typeof n) throw TypeError();
                    for (var i = [], a = 0; a < e.length; a++)
                        if (t.call(e, a)) {
                            var o = e[a];
                            n.call(r, o, a, e) && i.push(o)
                        } return i
                };
                var t = Object.prototype.hasOwnProperty
            },
            1648: function(e, t, n) {
                "use strict";
                var r = n(7797),
                    i = n(4834),
                    a = n(8772);
                e.exports = n(9095) || r.call(a, i)
            },
            4757: function(e, t, n) {
                "use strict";
                var r = n(7797),
                    i = n(4834),
                    a = n(1648);
                e.exports = function() {
                    return a(r, i, arguments)
                }
            },
            4834: function(e) {
                "use strict";
                e.exports = Function.prototype.apply
            },
            8772: function(e) {
                "use strict";
                e.exports = Function.prototype.call
            },
            2462: function(e, t, n) {
                "use strict";
                var r = n(7797),
                    i = n(4785),
                    a = n(8772),
                    o = n(1648);
                e.exports = function(e) {
                    if (e.length < 1 || "function" != typeof e[0]) throw new i("a function is required");
                    return o(r, a, e)
                }
            },
            9095: function(e) {
                "use strict";
                e.exports = "u" > typeof Reflect && Reflect && Reflect.apply
            },
            2982: function(e, t, n) {
                "use strict";
                var r = n(1893),
                    i = n(5494),
                    a = i(r("String.prototype.indexOf"));
                e.exports = function(e, t) {
                    var n = r(e, !!t);
                    return "function" == typeof n && a(e, ".prototype.") > -1 ? i(n) : n
                }
            },
            5494: function(e, t, n) {
                "use strict";
                var r = n(3798),
                    i = n(871),
                    a = n(2462),
                    o = n(4757);
                e.exports = function(e) {
                    var t = a(arguments),
                        n = e.length - (arguments.length - 1);
                    return r(t, 1 + (n > 0 ? n : 0), !0)
                }, i ? i(e.exports, "apply", {
                    value: o
                }) : e.exports.apply = o
            },
            2071: function(e, t, n) {
                "use strict";
                var r = n(871),
                    i = n(9546),
                    a = n(4785),
                    o = n(8322);
                e.exports = function(e, t, n) {
                    if (!e || "object" != typeof e && "function" != typeof e) throw new a("`obj` must be an object or a function`");
                    if ("string" != typeof t && "symbol" != typeof t) throw new a("`property` must be a string or a symbol`");
                    if (arguments.length > 3 && "boolean" != typeof arguments[3] && null !== arguments[3]) throw new a("`nonEnumerable`, if provided, must be a boolean or null");
                    if (arguments.length > 4 && "boolean" != typeof arguments[4] && null !== arguments[4]) throw new a("`nonWritable`, if provided, must be a boolean or null");
                    if (arguments.length > 5 && "boolean" != typeof arguments[5] && null !== arguments[5]) throw new a("`nonConfigurable`, if provided, must be a boolean or null");
                    if (arguments.length > 6 && "boolean" != typeof arguments[6]) throw new a("`loose`, if provided, must be a boolean");
                    var s = arguments.length > 3 ? arguments[3] : null,
                        u = arguments.length > 4 ? arguments[4] : null,
                        l = arguments.length > 5 ? arguments[5] : null,
                        c = arguments.length > 6 && arguments[6],
                        d = !!o && o(e, t);
                    if (r) r(e, t, {
                        configurable: null === l && d ? d.configurable : !l,
                        enumerable: null === s && d ? d.enumerable : !s,
                        value: n,
                        writable: null === u && d ? d.writable : !u
                    });
                    else if (!c && (s || u || l)) throw new i("This environment does not support defining a property as non-configurable, non-writable, or non-enumerable.");
                    else e[t] = n
                }
            },
            3859: function(e, t, n) {
                "use strict";
                var r, i = n(2462),
                    a = n(8322);
                try {
                    r = [].__proto__ === Array.prototype
                } catch (e) {
                    if (!e || "object" != typeof e || !("code" in e) || "ERR_PROTO_ACCESS" !== e.code) throw e
                }
                var o = !!r && a && a(Object.prototype, "__proto__"),
                    s = Object,
                    u = s.getPrototypeOf;
                e.exports = o && "function" == typeof o.get ? i([o.get]) : "function" == typeof u && function(e) {
                    return u(null == e ? e : s(e))
                }
            },
            871: function(e) {
                "use strict";
                var t = Object.defineProperty || !1;
                if (t) try {
                    t({}, "a", {
                        value: 1
                    })
                } catch (e) {
                    t = !1
                }
                e.exports = t
            },
            1247: function(e) {
                "use strict";
                e.exports = EvalError
            },
            6621: function(e) {
                "use strict";
                e.exports = Error
            },
            6136: function(e) {
                "use strict";
                e.exports = RangeError
            },
            252: function(e) {
                "use strict";
                e.exports = ReferenceError
            },
            9546: function(e) {
                "use strict";
                e.exports = SyntaxError
            },
            4785: function(e) {
                "use strict";
                e.exports = TypeError
            },
            1223: function(e) {
                "use strict";
                e.exports = URIError
            },
            8300: function(e) {
                "use strict";
                e.exports = Object
            },
            4680: function(e) {
                var t = Object.prototype.hasOwnProperty,
                    n = Object.prototype.toString;
                e.exports = function(e, r, i) {
                    if ("[object Function]" !== n.call(r)) throw TypeError("iterator must be a function");
                    var a = e.length;
                    if (a === +a)
                        for (var o = 0; o < a; o++) r.call(i, e[o], o, e);
                    else
                        for (var s in e) t.call(e, s) && r.call(i, e[s], s, e)
                }
            },
            6555: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    n = Math.max,
                    r = function(e, t) {
                        for (var n = [], r = 0; r < e.length; r += 1) n[r] = e[r];
                        for (var i = 0; i < t.length; i += 1) n[i + e.length] = t[i];
                        return n
                    },
                    i = function(e, t) {
                        for (var n = [], r = t || 0, i = 0; r < e.length; r += 1, i += 1) n[i] = e[r];
                        return n
                    },
                    a = function(e, t) {
                        for (var n = "", r = 0; r < e.length; r += 1) n += e[r], r + 1 < e.length && (n += t);
                        return n
                    };
                e.exports = function(e) {
                    var o, s = this;
                    if ("function" != typeof s || "[object Function]" !== t.apply(s)) throw TypeError("Function.prototype.bind called on incompatible " + s);
                    for (var u = i(arguments, 1), l = n(0, s.length - u.length), c = [], d = 0; d < l; d++) c[d] = "$" + d;
                    if (o = Function("binder", "return function (" + a(c, ",") + "){ return binder.apply(this,arguments); }")(function() {
                            if (this instanceof o) {
                                var t = s.apply(this, r(u, arguments));
                                return Object(t) === t ? t : this
                            }
                            return s.apply(e, r(u, arguments))
                        }), s.prototype) {
                        var f = function() {};
                        f.prototype = s.prototype, o.prototype = new f, f.prototype = null
                    }
                    return o
                }
            },
            7797: function(e, t, n) {
                "use strict";
                var r = n(6555);
                e.exports = Function.prototype.bind || r
            },
            1893: function(e, t, n) {
                "use strict";
                var r, i = n(8300),
                    a = n(6621),
                    o = n(1247),
                    s = n(6136),
                    u = n(252),
                    l = n(9546),
                    c = n(4785),
                    d = n(1223),
                    f = n(4197),
                    h = n(4455),
                    p = n(1295),
                    v = n(6949),
                    y = n(2943),
                    m = n(1721),
                    g = n(3536),
                    b = Function,
                    w = function(e) {
                        try {
                            return b('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    x = n(8322),
                    P = n(871),
                    S = function() {
                        throw new c
                    },
                    R = x ? function() {
                        try {
                            return arguments.callee, S
                        } catch (e) {
                            try {
                                return x(arguments, "callee").get
                            } catch (e) {
                                return S
                            }
                        }
                    }() : S,
                    T = n(9131)(),
                    E = n(9717),
                    k = n(45),
                    A = n(7767),
                    q = n(4834),
                    j = n(8772),
                    _ = {},
                    I = "u" > typeof Uint8Array && E ? E(Uint8Array) : r,
                    C = {
                        __proto__: null,
                        "%AggregateError%": "u" < typeof AggregateError ? r : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "u" < typeof ArrayBuffer ? r : ArrayBuffer,
                        "%ArrayIteratorPrototype%": T && E ? E([][Symbol.iterator]()) : r,
                        "%AsyncFromSyncIteratorPrototype%": r,
                        "%AsyncFunction%": _,
                        "%AsyncGenerator%": _,
                        "%AsyncGeneratorFunction%": _,
                        "%AsyncIteratorPrototype%": _,
                        "%Atomics%": "u" < typeof Atomics ? r : Atomics,
                        "%BigInt%": "u" < typeof BigInt ? r : BigInt,
                        "%BigInt64Array%": "u" < typeof BigInt64Array ? r : BigInt64Array,
                        "%BigUint64Array%": "u" < typeof BigUint64Array ? r : BigUint64Array,
                        "%Boolean%": Boolean,
                        "%DataView%": "u" < typeof DataView ? r : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": a,
                        "%eval%": eval,
                        "%EvalError%": o,
                        "%Float16Array%": "u" < typeof Float16Array ? r : Float16Array,
                        "%Float32Array%": "u" < typeof Float32Array ? r : Float32Array,
                        "%Float64Array%": "u" < typeof Float64Array ? r : Float64Array,
                        "%FinalizationRegistry%": "u" < typeof FinalizationRegistry ? r : FinalizationRegistry,
                        "%Function%": b,
                        "%GeneratorFunction%": _,
                        "%Int8Array%": "u" < typeof Int8Array ? r : Int8Array,
                        "%Int16Array%": "u" < typeof Int16Array ? r : Int16Array,
                        "%Int32Array%": "u" < typeof Int32Array ? r : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": T && E ? E(E([][Symbol.iterator]())) : r,
                        "%JSON%": "object" == typeof JSON ? JSON : r,
                        "%Map%": "u" < typeof Map ? r : Map,
                        "%MapIteratorPrototype%": "u" > typeof Map && T && E ? E((new Map)[Symbol.iterator]()) : r,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": i,
                        "%Object.getOwnPropertyDescriptor%": x,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "u" < typeof Promise ? r : Promise,
                        "%Proxy%": "u" < typeof Proxy ? r : Proxy,
                        "%RangeError%": s,
                        "%ReferenceError%": u,
                        "%Reflect%": "u" < typeof Reflect ? r : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "u" < typeof Set ? r : Set,
                        "%SetIteratorPrototype%": "u" > typeof Set && T && E ? E((new Set)[Symbol.iterator]()) : r,
                        "%SharedArrayBuffer%": "u" < typeof SharedArrayBuffer ? r : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": T && E ? E("" [Symbol.iterator]()) : r,
                        "%Symbol%": T ? Symbol : r,
                        "%SyntaxError%": l,
                        "%ThrowTypeError%": R,
                        "%TypedArray%": I,
                        "%TypeError%": c,
                        "%Uint8Array%": "u" < typeof Uint8Array ? r : Uint8Array,
                        "%Uint8ClampedArray%": "u" < typeof Uint8ClampedArray ? r : Uint8ClampedArray,
                        "%Uint16Array%": "u" < typeof Uint16Array ? r : Uint16Array,
                        "%Uint32Array%": "u" < typeof Uint32Array ? r : Uint32Array,
                        "%URIError%": d,
                        "%WeakMap%": "u" < typeof WeakMap ? r : WeakMap,
                        "%WeakRef%": "u" < typeof WeakRef ? r : WeakRef,
                        "%WeakSet%": "u" < typeof WeakSet ? r : WeakSet,
                        "%Function.prototype.call%": j,
                        "%Function.prototype.apply%": q,
                        "%Object.defineProperty%": P,
                        "%Object.getPrototypeOf%": k,
                        "%Math.abs%": f,
                        "%Math.floor%": h,
                        "%Math.max%": p,
                        "%Math.min%": v,
                        "%Math.pow%": y,
                        "%Math.round%": m,
                        "%Math.sign%": g,
                        "%Reflect.getPrototypeOf%": A
                    };
                if (E) try {
                    null.error
                } catch (e) {
                    var O = E(E(e));
                    C["%Error.prototype%"] = O
                }
                var L = function e(t) {
                        var n;
                        if ("%AsyncFunction%" === t) n = w("async function () {}");
                        else if ("%GeneratorFunction%" === t) n = w("function* () {}");
                        else if ("%AsyncGeneratorFunction%" === t) n = w("async function* () {}");
                        else if ("%AsyncGenerator%" === t) {
                            var r = e("%AsyncGeneratorFunction%");
                            r && (n = r.prototype)
                        } else if ("%AsyncIteratorPrototype%" === t) {
                            var i = e("%AsyncGenerator%");
                            i && E && (n = E(i.prototype))
                        }
                        return C[t] = n, n
                    },
                    D = {
                        __proto__: null,
                        "%ArrayBufferPrototype%": ["ArrayBuffer", "prototype"],
                        "%ArrayPrototype%": ["Array", "prototype"],
                        "%ArrayProto_entries%": ["Array", "prototype", "entries"],
                        "%ArrayProto_forEach%": ["Array", "prototype", "forEach"],
                        "%ArrayProto_keys%": ["Array", "prototype", "keys"],
                        "%ArrayProto_values%": ["Array", "prototype", "values"],
                        "%AsyncFunctionPrototype%": ["AsyncFunction", "prototype"],
                        "%AsyncGenerator%": ["AsyncGeneratorFunction", "prototype"],
                        "%AsyncGeneratorPrototype%": ["AsyncGeneratorFunction", "prototype", "prototype"],
                        "%BooleanPrototype%": ["Boolean", "prototype"],
                        "%DataViewPrototype%": ["DataView", "prototype"],
                        "%DatePrototype%": ["Date", "prototype"],
                        "%ErrorPrototype%": ["Error", "prototype"],
                        "%EvalErrorPrototype%": ["EvalError", "prototype"],
                        "%Float32ArrayPrototype%": ["Float32Array", "prototype"],
                        "%Float64ArrayPrototype%": ["Float64Array", "prototype"],
                        "%FunctionPrototype%": ["Function", "prototype"],
                        "%Generator%": ["GeneratorFunction", "prototype"],
                        "%GeneratorPrototype%": ["GeneratorFunction", "prototype", "prototype"],
                        "%Int8ArrayPrototype%": ["Int8Array", "prototype"],
                        "%Int16ArrayPrototype%": ["Int16Array", "prototype"],
                        "%Int32ArrayPrototype%": ["Int32Array", "prototype"],
                        "%JSONParse%": ["JSON", "parse"],
                        "%JSONStringify%": ["JSON", "stringify"],
                        "%MapPrototype%": ["Map", "prototype"],
                        "%NumberPrototype%": ["Number", "prototype"],
                        "%ObjectPrototype%": ["Object", "prototype"],
                        "%ObjProto_toString%": ["Object", "prototype", "toString"],
                        "%ObjProto_valueOf%": ["Object", "prototype", "valueOf"],
                        "%PromisePrototype%": ["Promise", "prototype"],
                        "%PromiseProto_then%": ["Promise", "prototype", "then"],
                        "%Promise_all%": ["Promise", "all"],
                        "%Promise_reject%": ["Promise", "reject"],
                        "%Promise_resolve%": ["Promise", "resolve"],
                        "%RangeErrorPrototype%": ["RangeError", "prototype"],
                        "%ReferenceErrorPrototype%": ["ReferenceError", "prototype"],
                        "%RegExpPrototype%": ["RegExp", "prototype"],
                        "%SetPrototype%": ["Set", "prototype"],
                        "%SharedArrayBufferPrototype%": ["SharedArrayBuffer", "prototype"],
                        "%StringPrototype%": ["String", "prototype"],
                        "%SymbolPrototype%": ["Symbol", "prototype"],
                        "%SyntaxErrorPrototype%": ["SyntaxError", "prototype"],
                        "%TypedArrayPrototype%": ["TypedArray", "prototype"],
                        "%TypeErrorPrototype%": ["TypeError", "prototype"],
                        "%Uint8ArrayPrototype%": ["Uint8Array", "prototype"],
                        "%Uint8ClampedArrayPrototype%": ["Uint8ClampedArray", "prototype"],
                        "%Uint16ArrayPrototype%": ["Uint16Array", "prototype"],
                        "%Uint32ArrayPrototype%": ["Uint32Array", "prototype"],
                        "%URIErrorPrototype%": ["URIError", "prototype"],
                        "%WeakMapPrototype%": ["WeakMap", "prototype"],
                        "%WeakSetPrototype%": ["WeakSet", "prototype"]
                    },
                    M = n(7797),
                    N = n(3383),
                    U = M.call(j, Array.prototype.concat),
                    B = M.call(q, Array.prototype.splice),
                    F = M.call(j, String.prototype.replace),
                    H = M.call(j, String.prototype.slice),
                    V = M.call(j, RegExp.prototype.exec),
                    G = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    W = /\\(\\)?/g,
                    K = function(e) {
                        var t = H(e, 0, 1),
                            n = H(e, -1);
                        if ("%" === t && "%" !== n) throw new l("invalid intrinsic syntax, expected closing `%`");
                        if ("%" === n && "%" !== t) throw new l("invalid intrinsic syntax, expected opening `%`");
                        var r = [];
                        return F(e, G, function(e, t, n, i) {
                            r[r.length] = n ? F(i, W, "$1") : t || e
                        }), r
                    },
                    z = function(e, t) {
                        var n, r = e;
                        if (N(D, r) && (r = "%" + (n = D[r])[0] + "%"), N(C, r)) {
                            var i = C[r];
                            if (i === _ && (i = L(r)), void 0 === i && !t) throw new c("intrinsic " + e + " exists, but is not available. Please file an issue!");
                            return {
                                alias: n,
                                name: r,
                                value: i
                            }
                        }
                        throw new l("intrinsic " + e + " does not exist!")
                    };
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new c("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new c('"allowMissing" argument must be a boolean');
                    if (null === V(/^%?[^%]*%?$/, e)) throw new l("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                    var n = K(e),
                        r = n.length > 0 ? n[0] : "",
                        i = z("%" + r + "%", t),
                        a = i.name,
                        o = i.value,
                        s = !1,
                        u = i.alias;
                    u && (r = u[0], B(n, U([0, 1], u)));
                    for (var d = 1, f = !0; d < n.length; d += 1) {
                        var h = n[d],
                            p = H(h, 0, 1),
                            v = H(h, -1);
                        if (('"' === p || "'" === p || "`" === p || '"' === v || "'" === v || "`" === v) && p !== v) throw new l("property names with quotes must have matching quotes");
                        if ("constructor" !== h && f || (s = !0), r += "." + h, N(C, a = "%" + r + "%")) o = C[a];
                        else if (null != o) {
                            if (!(h in o)) {
                                if (!t) throw new c("base intrinsic for " + e + " exists, but the property is not available.");
                                return
                            }
                            if (x && d + 1 >= n.length) {
                                var y = x(o, h);
                                o = (f = !!y) && "get" in y && !("originalValue" in y.get) ? y.get : o[h]
                            } else f = N(o, h), o = o[h];
                            f && !s && (C[a] = o)
                        }
                    }
                    return o
                }
            },
            45: function(e, t, n) {
                "use strict";
                e.exports = n(8300).getPrototypeOf || null
            },
            7767: function(e) {
                "use strict";
                e.exports = "u" > typeof Reflect && Reflect.getPrototypeOf || null
            },
            9717: function(e, t, n) {
                "use strict";
                var r = n(7767),
                    i = n(45),
                    a = n(3859);
                e.exports = r ? function(e) {
                    return r(e)
                } : i ? function(e) {
                    if (!e || "object" != typeof e && "function" != typeof e) throw TypeError("getProto: not an object");
                    return i(e)
                } : a ? function(e) {
                    return a(e)
                } : null
            },
            8422: function(e) {
                "use strict";
                e.exports = Object.getOwnPropertyDescriptor
            },
            8322: function(e, t, n) {
                "use strict";
                var r = n(8422);
                if (r) try {
                    r([], "length")
                } catch (e) {
                    r = null
                }
                e.exports = r
            },
            8122: function(e, t, n) {
                "use strict";
                var r = n(871),
                    i = function() {
                        return !!r
                    };
                i.hasArrayLengthDefineBug = function() {
                    if (!r) return null;
                    try {
                        return 1 !== r([], "length", {
                            value: 1
                        }).length
                    } catch (e) {
                        return !0
                    }
                }, e.exports = i
            },
            8564: function(e, t, n) {
                "use strict";
                var r = "u" > typeof Symbol && Symbol,
                    i = n(9094);
                e.exports = function() {
                    return "function" == typeof r && "function" == typeof Symbol && "symbol" == typeof r("foo") && "symbol" == typeof Symbol("bar") && i()
                }
            },
            9094: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        n = Object(t);
                    if ("string" == typeof t || "[object Symbol]" !== Object.prototype.toString.call(t) || "[object Symbol]" !== Object.prototype.toString.call(n)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length || "function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var r = Object.getOwnPropertySymbols(e);
                    if (1 !== r.length || r[0] !== t || !Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var i = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== i.value || !0 !== i.enumerable) return !1
                    }
                    return !0
                }
            },
            9131: function(e, t, n) {
                "use strict";
                var r = "u" > typeof Symbol && Symbol,
                    i = n(6313);
                e.exports = function() {
                    return "function" == typeof r && "function" == typeof Symbol && "symbol" == typeof r("foo") && "symbol" == typeof Symbol("bar") && i()
                }
            },
            6313: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        n = Object(t);
                    if ("string" == typeof t || "[object Symbol]" !== Object.prototype.toString.call(t) || "[object Symbol]" !== Object.prototype.toString.call(n)) return !1;
                    for (var r in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length || "function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var i = Object.getOwnPropertySymbols(e);
                    if (1 !== i.length || i[0] !== t || !Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var a = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== a.value || !0 !== a.enumerable) return !1
                    }
                    return !0
                }
            },
            3383: function(e, t, n) {
                "use strict";
                var r = Function.prototype.call,
                    i = Object.prototype.hasOwnProperty;
                e.exports = n(7797).call(r, i)
            },
            1638: function(e) {
                "function" == typeof Object.create ? e.exports = function(e, t) {
                    t && (e.super_ = t, e.prototype = Object.create(t.prototype, {
                        constructor: {
                            value: e,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }))
                } : e.exports = function(e, t) {
                    if (t) {
                        e.super_ = t;
                        var n = function() {};
                        n.prototype = t.prototype, e.prototype = new n, e.prototype.constructor = e
                    }
                }
            },
            6960: function(e) {
                "use strict";
                var t = "function" == typeof Symbol && "symbol" == typeof Symbol.toStringTag,
                    n = Object.prototype.toString,
                    r = function(e) {
                        return (!t || !e || "object" != typeof e || !(Symbol.toStringTag in e)) && "[object Arguments]" === n.call(e)
                    },
                    i = function(e) {
                        return !!r(e) || null !== e && "object" == typeof e && "number" == typeof e.length && e.length >= 0 && "[object Array]" !== n.call(e) && "[object Function]" === n.call(e.callee)
                    },
                    a = function() {
                        return r(arguments)
                    }();
                r.isLegacyArguments = i, e.exports = a ? r : i
            },
            8979: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    n = Function.prototype.toString,
                    r = /^\s*(?:function)?\*/,
                    i = "function" == typeof Symbol && "symbol" == typeof Symbol.toStringTag,
                    a = Object.getPrototypeOf,
                    o = function() {
                        if (!i) return !1;
                        try {
                            return Function("return function*() {}")()
                        } catch (e) {}
                    }(),
                    s = o ? a(o) : {};
                e.exports = function(e) {
                    return "function" == typeof e && (!!r.test(n.call(e)) || (i ? a(e) === s : "[object GeneratorFunction]" === t.call(e)))
                }
            },
            9572: function(t, n, r) {
                "use strict";
                var i = r(4680),
                    a = r(3147),
                    o = r(2982),
                    s = o("Object.prototype.toString"),
                    u = r(8564)() && "symbol" == typeof Symbol.toStringTag,
                    l = a(),
                    c = o("Array.prototype.indexOf", !0) || function(e, t) {
                        for (var n = 0; n < e.length; n += 1)
                            if (e[n] === t) return n;
                        return -1
                    },
                    d = o("String.prototype.slice"),
                    f = {},
                    h = r(9745),
                    p = Object.getPrototypeOf;
                u && h && p && i(l, function(t) {
                    var n = new e.g[t];
                    if (!(Symbol.toStringTag in n)) throw EvalError("this engine has support for Symbol.toStringTag, but " + t + " does not have the property! Please report this.");
                    var r = p(n),
                        i = h(r, Symbol.toStringTag);
                    i || (i = h(p(r), Symbol.toStringTag)), f[t] = i.get
                });
                var v = function(e) {
                    var t = !1;
                    return i(f, function(n, r) {
                        if (!t) try {
                            t = n.call(e) === r
                        } catch (e) {}
                    }), t
                };
                t.exports = function(e) {
                    return !!e && "object" == typeof e && (u ? !!h && v(e) : c(l, d(s(e), 8, -1)) > -1)
                }
            },
            4197: function(e) {
                "use strict";
                e.exports = Math.abs
            },
            4455: function(e) {
                "use strict";
                e.exports = Math.floor
            },
            6128: function(e) {
                "use strict";
                e.exports = Number.isNaN || function(e) {
                    return e != e
                }
            },
            1295: function(e) {
                "use strict";
                e.exports = Math.max
            },
            6949: function(e) {
                "use strict";
                e.exports = Math.min
            },
            2943: function(e) {
                "use strict";
                e.exports = Math.pow
            },
            1721: function(e) {
                "use strict";
                e.exports = Math.round
            },
            3536: function(e, t, n) {
                "use strict";
                var r = n(6128);
                e.exports = function(e) {
                    return r(e) || 0 === e ? e : e < 0 ? -1 : 1
                }
            },
            3798: function(e, t, n) {
                "use strict";
                var r = n(1893),
                    i = n(2071),
                    a = n(8122)(),
                    o = n(8322),
                    s = n(4785),
                    u = r("%Math.floor%");
                e.exports = function(e, t) {
                    if ("function" != typeof e) throw new s("`fn` is not a function");
                    if ("number" != typeof t || t < 0 || t > 0xffffffff || u(t) !== t) throw new s("`length` must be a positive 32-bit integer");
                    var n = arguments.length > 2 && !!arguments[2],
                        r = !0,
                        l = !0;
                    if ("length" in e && o) {
                        var c = o(e, "length");
                        c && !c.configurable && (r = !1), c && !c.writable && (l = !1)
                    }
                    return (r || l || !n) && (a ? i(e, "length", t, !0, !0) : i(e, "length", t)), e
                }
            },
            3614: function(e) {
                e.exports = function(e) {
                    return e instanceof r.Buffer
                }
            },
            7551: function(e, t, n) {
                "use strict";
                var r = n(6960),
                    i = n(8979),
                    a = n(3051),
                    o = n(9572);

                function s(e) {
                    return e.call.bind(e)
                }
                var u = "u" > typeof BigInt,
                    l = "u" > typeof Symbol,
                    c = s(Object.prototype.toString),
                    d = s(Number.prototype.valueOf),
                    f = s(String.prototype.valueOf),
                    h = s(Boolean.prototype.valueOf);
                if (u) var p = s(BigInt.prototype.valueOf);
                if (l) var v = s(Symbol.prototype.valueOf);

                function y(e, t) {
                    if ("object" != typeof e) return !1;
                    try {
                        return t(e), !0
                    } catch (e) {
                        return !1
                    }
                }

                function m(e) {
                    return "[object Map]" === c(e)
                }

                function g(e) {
                    return "[object Set]" === c(e)
                }

                function b(e) {
                    return "[object WeakMap]" === c(e)
                }

                function w(e) {
                    return "[object WeakSet]" === c(e)
                }

                function x(e) {
                    return "[object ArrayBuffer]" === c(e)
                }

                function P(e) {
                    return !("u" < typeof ArrayBuffer) && (x.working ? x(e) : e instanceof ArrayBuffer)
                }

                function S(e) {
                    return "[object DataView]" === c(e)
                }

                function R(e) {
                    return !("u" < typeof DataView) && (S.working ? S(e) : e instanceof DataView)
                }
                t.isArgumentsObject = r, t.isGeneratorFunction = i, t.isTypedArray = o, t.isPromise = function(e) {
                    return "u" > typeof Promise && e instanceof Promise || null !== e && "object" == typeof e && "function" == typeof e.then && "function" == typeof e.catch
                }, t.isArrayBufferView = function(e) {
                    return "u" > typeof ArrayBuffer && ArrayBuffer.isView ? ArrayBuffer.isView(e) : o(e) || R(e)
                }, t.isUint8Array = function(e) {
                    return "Uint8Array" === a(e)
                }, t.isUint8ClampedArray = function(e) {
                    return "Uint8ClampedArray" === a(e)
                }, t.isUint16Array = function(e) {
                    return "Uint16Array" === a(e)
                }, t.isUint32Array = function(e) {
                    return "Uint32Array" === a(e)
                }, t.isInt8Array = function(e) {
                    return "Int8Array" === a(e)
                }, t.isInt16Array = function(e) {
                    return "Int16Array" === a(e)
                }, t.isInt32Array = function(e) {
                    return "Int32Array" === a(e)
                }, t.isFloat32Array = function(e) {
                    return "Float32Array" === a(e)
                }, t.isFloat64Array = function(e) {
                    return "Float64Array" === a(e)
                }, t.isBigInt64Array = function(e) {
                    return "BigInt64Array" === a(e)
                }, t.isBigUint64Array = function(e) {
                    return "BigUint64Array" === a(e)
                }, m.working = "u" > typeof Map && m(new Map), t.isMap = function(e) {
                    return !("u" < typeof Map) && (m.working ? m(e) : e instanceof Map)
                }, g.working = "u" > typeof Set && g(new Set), t.isSet = function(e) {
                    return !("u" < typeof Set) && (g.working ? g(e) : e instanceof Set)
                }, b.working = "u" > typeof WeakMap && b(new WeakMap), t.isWeakMap = function(e) {
                    return !("u" < typeof WeakMap) && (b.working ? b(e) : e instanceof WeakMap)
                }, w.working = "u" > typeof WeakSet && w(new WeakSet), t.isWeakSet = function(e) {
                    return w(e)
                }, x.working = "u" > typeof ArrayBuffer && x(new ArrayBuffer), t.isArrayBuffer = P, S.working = "u" > typeof ArrayBuffer && "u" > typeof DataView && S(new DataView(new ArrayBuffer(1), 0, 1)), t.isDataView = R;
                var T = "u" > typeof SharedArrayBuffer ? SharedArrayBuffer : void 0;

                function E(e) {
                    return "[object SharedArrayBuffer]" === c(e)
                }

                function k(e) {
                    return void 0 !== T && (void 0 === E.working && (E.working = E(new T)), E.working ? E(e) : e instanceof T)
                }

                function A(e) {
                    return y(e, d)
                }

                function q(e) {
                    return y(e, f)
                }

                function j(e) {
                    return y(e, h)
                }

                function _(e) {
                    return u && y(e, p)
                }

                function I(e) {
                    return l && y(e, v)
                }
                t.isSharedArrayBuffer = k, t.isAsyncFunction = function(e) {
                    return "[object AsyncFunction]" === c(e)
                }, t.isMapIterator = function(e) {
                    return "[object Map Iterator]" === c(e)
                }, t.isSetIterator = function(e) {
                    return "[object Set Iterator]" === c(e)
                }, t.isGeneratorObject = function(e) {
                    return "[object Generator]" === c(e)
                }, t.isWebAssemblyCompiledModule = function(e) {
                    return "[object WebAssembly.Module]" === c(e)
                }, t.isNumberObject = A, t.isStringObject = q, t.isBooleanObject = j, t.isBigIntObject = _, t.isSymbolObject = I, t.isBoxedPrimitive = function(e) {
                    return A(e) || q(e) || j(e) || _(e) || I(e)
                }, t.isAnyArrayBuffer = function(e) {
                    return "u" > typeof Uint8Array && (P(e) || k(e))
                }, ["isProxy", "isExternal", "isModuleNamespaceObject"].forEach(function(e) {
                    Object.defineProperty(t, e, {
                        enumerable: !1,
                        value: function() {
                            throw Error(e + " is not supported in userland")
                        }
                    })
                })
            },
            4268: function(e, t, n) {
                var r = Object.getOwnPropertyDescriptors || function(e) {
                        for (var t = Object.keys(e), n = {}, r = 0; r < t.length; r++) n[t[r]] = Object.getOwnPropertyDescriptor(e, t[r]);
                        return n
                    },
                    a = /%[sdj%]/g;
                t.format = function(e) {
                    if (!b(e)) {
                        for (var t = [], n = 0; n < arguments.length; n++) t.push(l(arguments[n]));
                        return t.join(" ")
                    }
                    for (var n = 1, r = arguments, i = r.length, o = String(e).replace(a, function(e) {
                            if ("%%" === e) return "%";
                            if (n >= i) return e;
                            switch (e) {
                                case "%s":
                                    return String(r[n++]);
                                case "%d":
                                    return Number(r[n++]);
                                case "%j":
                                    try {
                                        return JSON.stringify(r[n++])
                                    } catch (e) {
                                        return "[Circular]"
                                    }
                                default:
                                    return e
                            }
                        }), s = r[n]; n < i; s = r[++n]) m(s) || !P(s) ? o += " " + s : o += " " + l(s);
                    return o
                }, t.deprecate = function(e, n) {
                    if (void 0 !== i.default && !0 === i.default.noDeprecation) return e;
                    if (void 0 === i.default) return function() {
                        return t.deprecate(e, n).apply(this, arguments)
                    };
                    var r = !1;
                    return function() {
                        if (!r) {
                            if (i.default.throwDeprecation) throw Error(n);
                            i.default.traceDeprecation ? console.trace(n) : console.error(n), r = !0
                        }
                        return e.apply(this, arguments)
                    }
                };
                var o = {},
                    s = /^$/;
                if (i.default.env.NODE_DEBUG) {
                    var u = i.default.env.NODE_DEBUG;
                    s = RegExp("^" + (u = u.replace(/[|\\{}()[\]^$+?.]/g, "\\$&").replace(/\*/g, ".*").replace(/,/g, "$|^").toUpperCase()) + "$", "i")
                }

                function l(e, n) {
                    var r = {
                        seen: [],
                        stylize: d
                    };
                    return arguments.length >= 3 && (r.depth = arguments[2]), arguments.length >= 4 && (r.colors = arguments[3]), y(n) ? r.showHidden = n : n && t._extend(r, n), w(r.showHidden) && (r.showHidden = !1), w(r.depth) && (r.depth = 2), w(r.colors) && (r.colors = !1), w(r.customInspect) && (r.customInspect = !0), r.colors && (r.stylize = c), f(r, e, r.depth)
                }

                function c(e, t) {
                    var n = l.styles[t];
                    return n ? "\x1b[" + l.colors[n][0] + "m" + e + "\x1b[" + l.colors[n][1] + "m" : e
                }

                function d(e, t) {
                    return e
                }

                function f(e, n, r) {
                    if (e.customInspect && n && T(n.inspect) && n.inspect !== t.inspect && !(n.constructor && n.constructor.prototype === n)) {
                        var i, a, o, s, u, l, c = n.inspect(r, e);
                        return b(c) || (c = f(e, c, r)), c
                    }
                    var d = function(e, t) {
                        if (w(t)) return e.stylize("undefined", "undefined");
                        if (b(t)) {
                            var n = "'" + JSON.stringify(t).replace(/^"|"$/g, "").replace(/'/g, "\\'").replace(/\\"/g, '"') + "'";
                            return e.stylize(n, "string")
                        }
                        return g(t) ? e.stylize("" + t, "number") : y(t) ? e.stylize("" + t, "boolean") : m(t) ? e.stylize("null", "null") : void 0
                    }(e, n);
                    if (d) return d;
                    var P = Object.keys(n),
                        E = (u = {}, P.forEach(function(e, t) {
                            u[e] = !0
                        }), u);
                    if (e.showHidden && (P = Object.getOwnPropertyNames(n)), R(n) && (P.indexOf("message") >= 0 || P.indexOf("description") >= 0)) return h(n);
                    if (0 === P.length) {
                        if (T(n)) {
                            var k = n.name ? ": " + n.name : "";
                            return e.stylize("[Function" + k + "]", "special")
                        }
                        if (x(n)) return e.stylize(RegExp.prototype.toString.call(n), "regexp");
                        if (S(n)) return e.stylize(Date.prototype.toString.call(n), "date");
                        if (R(n)) return h(n)
                    }
                    var A = "",
                        j = !1,
                        _ = ["{", "}"];
                    if (v(n) && (j = !0, _ = ["[", "]"]), T(n) && (A = " [Function" + (n.name ? ": " + n.name : "") + "]"), x(n) && (A = " " + RegExp.prototype.toString.call(n)), S(n) && (A = " " + Date.prototype.toUTCString.call(n)), R(n) && (A = " " + h(n)), 0 === P.length && (!j || 0 == n.length)) return _[0] + A + _[1];
                    if (r < 0)
                        if (x(n)) return e.stylize(RegExp.prototype.toString.call(n), "regexp");
                        else return e.stylize("[Object]", "special");
                    return e.seen.push(n), l = j ? function(e, t, n, r, i) {
                        for (var a = [], o = 0, s = t.length; o < s; ++o) q(t, String(o)) ? a.push(p(e, t, n, r, String(o), !0)) : a.push("");
                        return i.forEach(function(i) {
                            i.match(/^\d+$/) || a.push(p(e, t, n, r, i, !0))
                        }), a
                    }(e, n, r, E, P) : P.map(function(t) {
                        return p(e, n, r, E, t, j)
                    }), e.seen.pop(), i = l, a = A, o = _, s = 0, i.reduce(function(e, t) {
                        return s++, t.indexOf("\n") >= 0 && s++, e + t.replace(/\u001b\[\d\d?m/g, "").length + 1
                    }, 0) > 60 ? o[0] + ("" === a ? "" : a + "\n ") + " " + i.join(",\n  ") + " " + o[1] : o[0] + a + " " + i.join(", ") + " " + o[1]
                }

                function h(e) {
                    return "[" + Error.prototype.toString.call(e) + "]"
                }

                function p(e, t, n, r, i, a) {
                    var o, s, u;
                    if ((u = Object.getOwnPropertyDescriptor(t, i) || {
                            value: t[i]
                        }).get ? s = u.set ? e.stylize("[Getter/Setter]", "special") : e.stylize("[Getter]", "special") : u.set && (s = e.stylize("[Setter]", "special")), q(r, i) || (o = "[" + i + "]"), !s && (0 > e.seen.indexOf(u.value) ? (s = m(n) ? f(e, u.value, null) : f(e, u.value, n - 1)).indexOf("\n") > -1 && (s = a ? s.split("\n").map(function(e) {
                            return "  " + e
                        }).join("\n").substr(2) : "\n" + s.split("\n").map(function(e) {
                            return "   " + e
                        }).join("\n")) : s = e.stylize("[Circular]", "special")), w(o)) {
                        if (a && i.match(/^\d+$/)) return s;
                        (o = JSON.stringify("" + i)).match(/^"([a-zA-Z_][a-zA-Z_0-9]*)"$/) ? (o = o.substr(1, o.length - 2), o = e.stylize(o, "name")) : (o = o.replace(/'/g, "\\'").replace(/\\"/g, '"').replace(/(^"|"$)/g, "'"), o = e.stylize(o, "string"))
                    }
                    return o + ": " + s
                }

                function v(e) {
                    return Array.isArray(e)
                }

                function y(e) {
                    return "boolean" == typeof e
                }

                function m(e) {
                    return null === e
                }

                function g(e) {
                    return "number" == typeof e
                }

                function b(e) {
                    return "string" == typeof e
                }

                function w(e) {
                    return void 0 === e
                }

                function x(e) {
                    return P(e) && "[object RegExp]" === E(e)
                }

                function P(e) {
                    return "object" == typeof e && null !== e
                }

                function S(e) {
                    return P(e) && "[object Date]" === E(e)
                }

                function R(e) {
                    return P(e) && ("[object Error]" === E(e) || e instanceof Error)
                }

                function T(e) {
                    return "function" == typeof e
                }

                function E(e) {
                    return Object.prototype.toString.call(e)
                }

                function k(e) {
                    return e < 10 ? "0" + e.toString(10) : e.toString(10)
                }
                t.debuglog = function(e) {
                    if (!o[e = e.toUpperCase()])
                        if (s.test(e)) {
                            var n = i.default.pid;
                            o[e] = function() {
                                var r = t.format.apply(t, arguments);
                                console.error("%s %d: %s", e, n, r)
                            }
                        } else o[e] = function() {};
                    return o[e]
                }, t.inspect = l, l.colors = {
                    bold: [1, 22],
                    italic: [3, 23],
                    underline: [4, 24],
                    inverse: [7, 27],
                    white: [37, 39],
                    grey: [90, 39],
                    black: [30, 39],
                    blue: [34, 39],
                    cyan: [36, 39],
                    green: [32, 39],
                    magenta: [35, 39],
                    red: [31, 39],
                    yellow: [33, 39]
                }, l.styles = {
                    special: "cyan",
                    number: "yellow",
                    boolean: "yellow",
                    undefined: "grey",
                    null: "bold",
                    string: "green",
                    date: "magenta",
                    regexp: "red"
                }, t.types = n(7551), t.isArray = v, t.isBoolean = y, t.isNull = m, t.isNullOrUndefined = function(e) {
                    return null == e
                }, t.isNumber = g, t.isString = b, t.isSymbol = function(e) {
                    return "symbol" == typeof e
                }, t.isUndefined = w, t.isRegExp = x, t.types.isRegExp = x, t.isObject = P, t.isDate = S, t.types.isDate = S, t.isError = R, t.types.isNativeError = R, t.isFunction = T, t.isPrimitive = function(e) {
                    return null === e || "boolean" == typeof e || "number" == typeof e || "string" == typeof e || "symbol" == typeof e || void 0 === e
                }, t.isBuffer = n(3614);
                var A = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

                function q(e, t) {
                    return Object.prototype.hasOwnProperty.call(e, t)
                }
                t.log = function() {
                    var e, n;
                    console.log("%s - %s", (n = [k((e = new Date).getHours()), k(e.getMinutes()), k(e.getSeconds())].join(":"), [e.getDate(), A[e.getMonth()], n].join(" ")), t.format.apply(t, arguments))
                }, t.inherits = n(1638), t._extend = function(e, t) {
                    if (!t || !P(t)) return e;
                    for (var n = Object.keys(t), r = n.length; r--;) e[n[r]] = t[n[r]];
                    return e
                };
                var j = "u" > typeof Symbol ? Symbol("util.promisify.custom") : void 0;

                function _(e, t) {
                    if (!e) {
                        var n = Error("Promise was rejected with a falsy value");
                        n.reason = e, e = n
                    }
                    return t(e)
                }
                t.promisify = function(e) {
                    if ("function" != typeof e) throw TypeError('The "original" argument must be of type Function');
                    if (j && e[j]) {
                        var t = e[j];
                        if ("function" != typeof t) throw TypeError('The "util.promisify.custom" argument must be of type Function');
                        return Object.defineProperty(t, j, {
                            value: t,
                            enumerable: !1,
                            writable: !1,
                            configurable: !0
                        }), t
                    }

                    function t() {
                        for (var t, n, r = new Promise(function(e, r) {
                                t = e, n = r
                            }), i = [], a = 0; a < arguments.length; a++) i.push(arguments[a]);
                        i.push(function(e, r) {
                            e ? n(e) : t(r)
                        });
                        try {
                            e.apply(this, i)
                        } catch (e) {
                            n(e)
                        }
                        return r
                    }
                    return Object.setPrototypeOf(t, Object.getPrototypeOf(e)), j && Object.defineProperty(t, j, {
                        value: t,
                        enumerable: !1,
                        writable: !1,
                        configurable: !0
                    }), Object.defineProperties(t, r(e))
                }, t.promisify.custom = j, t.callbackify = function(e) {
                    if ("function" != typeof e) throw TypeError('The "original" argument must be of type Function');

                    function t() {
                        for (var t = [], n = 0; n < arguments.length; n++) t.push(arguments[n]);
                        var r = t.pop();
                        if ("function" != typeof r) throw TypeError("The last argument must be of type Function");
                        var a = this,
                            o = function() {
                                return r.apply(a, arguments)
                            };
                        e.apply(this, t).then(function(e) {
                            i.default.nextTick(o.bind(null, null, e))
                        }, function(e) {
                            i.default.nextTick(_.bind(null, e, o))
                        })
                    }
                    return Object.setPrototypeOf(t, Object.getPrototypeOf(e)), Object.defineProperties(t, r(e)), t
                }
            },
            3051: function(t, n, r) {
                "use strict";
                var i = r(4680),
                    a = r(3147),
                    o = r(2982),
                    s = o("Object.prototype.toString"),
                    u = r(8564)() && "symbol" == typeof Symbol.toStringTag,
                    l = a(),
                    c = o("String.prototype.slice"),
                    d = {},
                    f = r(9745),
                    h = Object.getPrototypeOf;
                u && f && h && i(l, function(t) {
                    if ("function" == typeof e.g[t]) {
                        var n = new e.g[t];
                        if (!(Symbol.toStringTag in n)) throw EvalError("this engine has support for Symbol.toStringTag, but " + t + " does not have the property! Please report this.");
                        var r = h(n),
                            i = f(r, Symbol.toStringTag);
                        i || (i = f(h(r), Symbol.toStringTag)), d[t] = i.get
                    }
                });
                var p = function(e) {
                        var t = !1;
                        return i(d, function(n, r) {
                            if (!t) try {
                                var i = n.call(e);
                                i === r && (t = i)
                            } catch (e) {}
                        }), t
                    },
                    v = r(9572);
                t.exports = function(e) {
                    return !!v(e) && (u ? p(e) : c(s(e), 8, -1))
                }
            },
            3147: function(t, n, r) {
                "use strict";
                var i = r(7492);
                t.exports = function() {
                    return i(["BigInt64Array", "BigUint64Array", "Float32Array", "Float64Array", "Int16Array", "Int32Array", "Int8Array", "Uint16Array", "Uint32Array", "Uint8Array", "Uint8ClampedArray"], function(t) {
                        return "function" == typeof e.g[t]
                    })
                }
            },
            9745: function(e, t, n) {
                "use strict";
                e.exports = n(8322)
            }
        },
        o = {};

    function s(e) {
        var t = o[e];
        if (void 0 !== t) return t.exports;
        var n = o[e] = {
                exports: {}
            },
            r = !0;
        try {
            a[e](n, n.exports, s), r = !1
        } finally {
            r && delete o[e]
        }
        return n.exports
    }
    s.ab = "/ROOT/links/@/next/16.4.5/0de1122c89b9724448b83052600528d4b1dce37d3127900fabdf5af34275552d/node_modules/next/dist/compiled/util/", t.exports = s(4268)
}, 390754, (e, t, n) => {
    var r = e.r(592270);
    ! function() {
        "use strict";
        let e;
        var n = {};
        n.d = function(e, t) {
            for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
                enumerable: !0,
                get: t[r]
            })
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, void 0 !== n && (n.ab = "/ROOT/links/@/next/16.4.5/0de1122c89b9724448b83052600528d4b1dce37d3127900fabdf5af34275552d/node_modules/next/dist/compiled/web-vitals/");
        var i = {};
        n.r(i), n.d(i, {
            CLSThresholds: function() {
                return A
            },
            FCPThresholds: function() {
                return E
            },
            INPThresholds: function() {
                return M
            },
            LCPThresholds: function() {
                return B
            },
            TTFBThresholds: function() {
                return H
            },
            onCLS: function() {
                return q
            },
            onFCP: function() {
                return k
            },
            onINP: function() {
                return N
            },
            onLCP: function() {
                return F
            },
            onTTFB: function() {
                return G
            }
        });
        let a = -1,
            o = e => {
                addEventListener("pageshow", t => {
                    t.persisted && (a = t.timeStamp, e(t))
                }, !0)
            },
            s = (e, t, n, r) => {
                let i, a;
                return o => {
                    let s;
                    t.value >= 0 && (o || r) && ((a = t.value - (null != i ? i : 0)) || void 0 === i) && (i = t.value, t.delta = a, s = t.value, t.rating = s > n[1] ? "poor" : s > n[0] ? "needs-improvement" : "good", e(t))
                }
            },
            u = e => {
                requestAnimationFrame(() => requestAnimationFrame(() => e()))
            },
            l = () => {
                let e = performance.getEntriesByType("navigation")[0];
                if (e && e.responseStart > 0 && e.responseStart < performance.now()) return e
            },
            c = () => {
                var e, t;
                return null != (e = null == (t = l()) ? void 0 : t.activationStart) ? e : 0
            },
            d = -1,
            f = new Set,
            h = () => "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0,
            p = e => {
                if ("hidden" === document.visibilityState) {
                    if ("visibilitychange" === e.type)
                        for (let e of f) e();
                    isFinite(d) || (d = "visibilitychange" === e.type ? e.timeStamp : 0, removeEventListener("prerenderingchange", p, !0))
                }
            },
            v = function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                if (e && (d = 1 / 0), d < 0) {
                    var t;
                    let e = c(),
                        n = document.prerendering || null == (t = globalThis.performance.getEntriesByType("visibility-state").find(t => "hidden" === t.name && t.startTime >= e)) ? void 0 : t.startTime;
                    d = null != n ? n : h(), addEventListener("visibilitychange", p, !0), addEventListener("prerenderingchange", p, !0), o(() => {
                        setTimeout(() => {
                            d = h()
                        })
                    })
                }
                return {
                    get firstHiddenTime() {
                        return d
                    },
                    onHidden(e) {
                        f.add(e)
                    }
                }
            },
            y = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : -1,
                    n = arguments.length > 2 ? arguments[2] : void 0,
                    r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0,
                    i = arguments.length > 4 ? arguments[4] : void 0,
                    o = arguments.length > 5 ? arguments[5] : void 0,
                    s = arguments.length > 6 ? arguments[6] : void 0,
                    u = l(),
                    d = (null == u ? void 0 : u.navigationId) || 0,
                    f = "navigate";
                return n ? f = n : a >= 0 ? f = "back-forward-cache" : u && (document.prerendering || c() > 0 ? f = "prerender" : document.wasDiscarded ? f = "restore" : u.type && (f = u.type.replace(/_/g, "-"))), {
                    name: e,
                    value: t,
                    rating: "good",
                    delta: 0,
                    entries: [],
                    id: "v6-".concat(Date.now(), "-").concat(Math.floor(0x82f79cd8fff * Math.random()) + 1e12),
                    navigationType: f,
                    navigationId: r || d,
                    navigationInteractionId: i,
                    navigationURL: o || (null == u ? void 0 : u.name),
                    navigationStartTime: s || 0
                }
            },
            m = new WeakMap;

        function g(e, t) {
            let n = m.get(t);
            return n || (n = new WeakMap, m.set(t, n)), n.get(e) || n.set(e, new t), n.get(e)
        }
        class b {
            h(e) {
                var t;
                if (e.hadRecentInput) return;
                let n = this.o[0],
                    r = this.o.at(-1);
                this.i && n && r && e.startTime - r.startTime < 1e3 && e.startTime - n.startTime < 5e3 ? (this.i += e.value, this.o.push(e)) : (this.i = e.value, this.o = [e]), null == (t = this.t) || t.call(this, e)
            }
            constructor() {
                r._(this, "t", void 0), r._(this, "i", 0), r._(this, "o", [])
            }
        }
        let w = function(e, t) {
                let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                try {
                    let r = e.filter(e => PerformanceObserver.supportedEntryTypes.includes(e));
                    if (r.length > 0) {
                        let e = new PerformanceObserver(e => {
                            queueMicrotask(() => {
                                let n = e.getEntries();
                                r.length > 1 && n.sort((e, t) => e.startTime + e.duration - (t.startTime + t.duration)), t(n)
                            })
                        });
                        for (let t of r) e.observe({
                            type: t,
                            buffered: !0,
                            ...n
                        });
                        return e
                    }
                } catch (e) {}
            },
            x = e => {
                var t, n, r, i;
                return (null == (n = globalThis.PerformanceObserver) || null == (t = n.supportedEntryTypes) ? void 0 : t.includes("soft-navigation")) && "function" == typeof(null == (i = globalThis.PerformanceSoftNavigation) || null == (r = i.prototype) ? void 0 : r.getLargestInteractionContentfulPaint) && e && e.reportSoftNavs
            },
            P = (e, t) => {
                if (e.set(t.navigationId, t), e.size > 2) {
                    let t = e.keys().next().value;
                    void 0 !== t && e.delete(t)
                }
            },
            S = e => {
                let t = !1;
                return () => {
                    t || (e(), t = !0)
                }
            };
        class R {
            constructor() {
                r._(this, "l", void 0)
            }
        }
        let T = e => {
                document.prerendering ? addEventListener("prerenderingchange", e, !0) : e()
            },
            E = [1800, 3e3],
            k = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = x(t);
                T(() => {
                    let r = g(t, R),
                        i = v(),
                        l, d = y("FCP"),
                        f = w(["paint"], e => {
                            for (let t of e) "first-contentful-paint" === t.name && (f.disconnect(), t.startTime < i.firstHiddenTime && (d.value = Math.max(t.startTime - c(), 0), d.entries.push(t), d.navigationId = t.navigationId || d.navigationId, l(!0)))
                        });
                    f && (l = s(e, d, E, t.reportAllChanges), o(n => {
                        l = s(e, d = y("FCP", -1, "back-forward-cache", d.navigationId, d.navigationInteractionId, d.navigationURL, a), E, t.reportAllChanges), u(() => {
                            d.value = performance.now() - n.timeStamp, l(!0)
                        })
                    })), n && w(["soft-navigation"], n => {
                        n.forEach(n => {
                            r.l && n.navigationId && P(r.l, n), (l = s(e, d = y("FCP", Math.max((n.presentationTime || n.paintTime || 0) - n.startTime, 0), "soft-navigation", n.navigationId, n.interactionId, n.name, n.startTime), E, t.reportAllChanges))(!0)
                        })
                    }, t)
                })
            },
            A = [.1, .25],
            q = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = v();
                k(S(() => {
                    let r, i = y("CLS", 0),
                        l = g(t, b),
                        c = (n, a, o, u, c) => {
                            i = y("CLS", 0, n, a, o, u, c), l.i = 0, r = s(e, i, A, t.reportAllChanges)
                        },
                        d = function() {
                            let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                            l.i > i.value && (i.value = l.i, i.entries = l.o), r(e)
                        },
                        f = e => {
                            d(!0), c("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime)
                        },
                        h = e => {
                            for (let t of e) "soft-navigation" !== t.entryType ? l.h(t) : f(t);
                            d()
                        },
                        p = ["layout-shift"];
                    x(t) && p.push("soft-navigation");
                    let v = w(p, h);
                    v && (r = s(e, i, A, t.reportAllChanges), n.onHidden(() => {
                        h(v.takeRecords()), r(!0)
                    }), o(() => {
                        c("back-forward-cache", i.navigationId, i.navigationInteractionId, i.navigationURL, a), u(r)
                    }), setTimeout(r))
                }))
            },
            j = 0,
            _ = 1 / 0,
            I = 0,
            C = e => {
                for (let t of e) t.interactionId && (_ = Math.min(_, t.interactionId), j = (I = Math.max(I, t.interactionId)) ? (I - _) / 7 + 1 : 0)
            },
            O = () => {
                var t;
                return e ? j : null != (t = performance.interactionCount) ? t : 0
            };
        class L {
            _() {
                return O() - this.u
            }
            M() {
                this.u = O(), this.v.length = 0, this.m.clear()
            }
            L(e) {
                let t = this._(),
                    n = Math.min(this.v.length - 1, Math.floor(t / 50));
                return t && -1 === n && ("soft-navigation" === e || "back-forward-cache" === e) ? {
                    P: 8,
                    id: -1,
                    entries: []
                } : this.v[n]
            }
            h(e) {
                var t, n;
                if (null == (t = this.p) || t.call(this, e), !e.interactionId) return;
                let r = this.v.at(-1),
                    i = this.m.get(e.interactionId);
                if (i || this.v.length < 10 || e.duration > r.P) {
                    if (i ? e.duration > i.P ? (i.entries = [e], i.P = e.duration) : e.duration === i.P && e.startTime === i.entries[0].startTime && i.entries.push(e) : (i = {
                            id: e.interactionId,
                            entries: [e],
                            P: e.duration
                        }, this.m.set(i.id, i), this.v.push(i)), this.v.sort((e, t) => t.P - e.P), this.v.length > 10)
                        for (let e of this.v.splice(10)) this.m.delete(e.id);
                    null == (n = this.T) || n.call(this, i)
                }
            }
            constructor() {
                r._(this, "u", 0), r._(this, "v", []), r._(this, "m", new Map), r._(this, "p", void 0), r._(this, "T", void 0)
            }
        }
        let D = e => {
                let t = 1e3 * ("requestIdleCallback" in globalThis),
                    n = globalThis.requestIdleCallback || setTimeout,
                    r = globalThis.cancelIdleCallback || clearTimeout;
                if ("hidden" === document.visibilityState) e();
                else {
                    let i = S(e),
                        a = -1,
                        o = () => {
                            r(a), i()
                        };
                    addEventListener("visibilitychange", o, {
                        once: !0,
                        capture: !0
                    }), a = n(() => {
                        removeEventListener("visibilitychange", o, {
                            capture: !0
                        }), i()
                    }, {
                        timeout: t
                    })
                }
            },
            M = [200, 500],
            N = function(t) {
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if (!globalThis.PerformanceEventTiming || !("interactionId" in PerformanceEventTiming.prototype)) return;
                let r = v();
                T(() => {
                    var i;
                    "interactionCount" in performance || e || (e = w(["event"], C, {
                        durationThreshold: 0
                    }));
                    let u, l = y("INP"),
                        c = g(n, L),
                        d = (e, r, i, a, o) => {
                            c.M(), u = s(t, l = y("INP", -1, e, r, i, a, o), M, n.reportAllChanges)
                        },
                        f = () => {
                            let e = c.L(l.navigationType);
                            e && e.P !== l.value && (l.value = e.P, l.entries = e.entries, u())
                        },
                        h = e => {
                            f(), u(!0), d("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime)
                        },
                        p = function(e) {
                            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                            D(() => {
                                for (let t of e) "soft-navigation" !== t.entryType ? c.h(t) : h(t);
                                f(), t && u(!0)
                            })
                        },
                        v = ["event", "first-input"];
                    x(n) && v.push("soft-navigation");
                    let m = w(v, p, {
                        ...n,
                        durationThreshold: null != (i = n.durationThreshold) ? i : 40
                    });
                    u = s(t, l, M, n.reportAllChanges), m && (r.onHidden(() => {
                        p(m.takeRecords(), !0)
                    }), o(() => {
                        d("back-forward-cache", l.navigationId, l.navigationInteractionId, l.navigationURL, a)
                    }))
                })
            };
        class U {
            h(e) {
                var t;
                null == (t = this.p) || t.call(this, e)
            }
            constructor() {
                r._(this, "p", void 0), r._(this, "l", void 0)
            }
        }
        let B = [2500, 4e3],
            F = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = !1,
                    r = x(t);
                T(() => {
                    let i, l = v(),
                        d = y("LCP"),
                        f = g(t, U),
                        h = (r, a, o, u, c) => {
                            i = s(e, d = y("LCP", -1, r, a, o, u, c), B, t.reportAllChanges), n = !1, "soft-navigation" === r && (l = v(!0))
                        },
                        p = e => {
                            var t;
                            f.l && e.navigationId && P(f.l, e), n || i(!0), h("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime);
                            let r = null == (t = e.getLargestInteractionContentfulPaint) ? void 0 : t.call(e);
                            r && m([r])
                        },
                        m = e => {
                            for (let a of (t.reportAllChanges || r || (e = e.slice(-1)), e)) {
                                if (!a) continue;
                                if ("soft-navigation" === a.entryType) {
                                    p(a);
                                    continue
                                }
                                let e = 0,
                                    t = [],
                                    r = a.startTime;
                                if ("largest-contentful-paint" === a.entryType) e = Math.max(a.startTime - c(), 0), f.h(a), t = [a];
                                else if ("interaction-contentful-paint" === a.entryType) {
                                    var n;
                                    if (!d.navigationId || "interactionId" in a && a.interactionId != d.navigationInteractionId) continue;
                                    e = Math.max((r = (null == (n = a.largestContentfulPaint) ? void 0 : n.renderTime) || 0) - a.startTime, 0), a.largestContentfulPaint && (f.h(a.largestContentfulPaint), t = [a.largestContentfulPaint])
                                }
                                r < l.firstHiddenTime && (d.value = e, d.entries = t, i())
                            }
                        },
                        b = ["largest-contentful-paint"];
                    r && b.push("interaction-contentful-paint", "soft-navigation");
                    let x = w(b, m);
                    if (x) {
                        i = s(e, d, B, t.reportAllChanges);
                        let l = ["keydown", "click", "visibilitychange"],
                            c = e => {
                                if (e.isTrusted && !n) {
                                    let e = d.id;
                                    D(() => {
                                        if (!n) {
                                            if (!r)
                                                for (let e of (x.disconnect(), l)) removeEventListener(e, c, {
                                                    capture: !0
                                                });
                                            e === d.id && (n = !0, i(!0))
                                        }
                                    })
                                }
                            };
                        for (let e of l) addEventListener(e, c, {
                            capture: !0
                        });
                        o(r => {
                            h("back-forward-cache", d.navigationId, d.navigationInteractionId, d.navigationURL, a), i = s(e, d, B, t.reportAllChanges), u(() => {
                                d.value = performance.now() - r.timeStamp, n = !0, i(!0)
                            })
                        })
                    }
                })
            },
            H = [800, 1800],
            V = e => {
                document.prerendering ? T(() => V(e)) : "complete" !== document.readyState ? addEventListener("load", () => V(e), !0) : setTimeout(e)
            },
            G = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = x(t),
                    r = y("TTFB"),
                    i = s(e, r, H, t.reportAllChanges);
                V(() => {
                    let u = l();
                    if (u) {
                        let l = u.responseStart;
                        r.value = Math.max(l - c(), 0), r.entries = [u], i(!0), o(() => {
                            (i = s(e, r = y("TTFB", 0, "back-forward-cache", r.navigationId, r.navigationInteractionId, r.navigationURL, a), H, t.reportAllChanges))(!0)
                        }), n && w(["soft-navigation"], n => {
                            n.forEach(n => {
                                n.navigationId && ((r = y("TTFB", 0, "soft-navigation", n.navigationId, n.interactionId, n.name, n.startTime)).entries = [n], (i = s(e, r, H, t.reportAllChanges))(!0))
                            })
                        }, t)
                    }
                })
            };
        t.exports = i
    }()
}, 236476, (e, t, n) => {
    t.exports = e.r(749490)
}, 592270, (e, t, n) => {
    "use strict";
    n._ = function(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }
}, 681109, (e, t, n) => {
    let r = "/_app";
    (window.__NEXT_P = window.__NEXT_P || []).push([r, () => e.r(656350)]), t.hot && t.hot.dispose(function() {
        window.__NEXT_P.push([r])
    })
}, 656350, e => {
    "use strict";
    let t, n, r;
    var i, a, o, s, u, l, c, d, f, h, p, v, y, m, g = e.i(163021),
        b = e.i(785517);
    let w = "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : window;

    function x(e) {
        return Number(e)
    }
    let P = e => () => {
        throw Error("BigInt.".concat(e, " is not supported by the BigInt polyfill"))
    };
    x.asIntN = P("asIntN"), x.asUintN = P("asUintN"), w && void 0 === w.BigInt && Object.defineProperty(w, "BigInt", {
        value: x,
        writable: !0,
        configurable: !0
    });
    let S = "change",
        R = ["capture", "once", "signal"],
        T = new WeakMap,
        E = e => {
            if ("function" == typeof e) return e;
            let t = T.get(e);
            if (t) return t;
            let n = t => e.handleEvent(t);
            return T.set(e, n), n
        },
        k = (e, t, n) => {
            t !== S && console.warn("MediaQueryList polyfill: ".concat(e, " ignored '").concat(t, "' event type."));
            let r = "boolean" == typeof n ? n ? ["capture"] : [] : n ? R.filter(e => !!n[e]) : [];
            r.length > 0 && console.warn("MediaQueryList polyfill: ".concat(e, " ignored unsupported option(s) ").concat(r.join(", "), "."))
        };
    (n = (() => {
        if ("function" != typeof window.matchMedia) return;
        let e = window.matchMedia("all"),
            t = "function" == typeof e.addListener;
        if ("function" == typeof e.addEventListener || !t) return;
        let n = Object.getPrototypeOf(e);
        return "object" == typeof n && null !== n && n !== Object.prototype ? n : void 0
    })()) && (Object.defineProperty(n, "addEventListener", {
        value: function(e, t, n) {
            k("addEventListener", e, n), e === S && null != t && this.addListener(E(t))
        },
        writable: !0,
        configurable: !0
    }), Object.defineProperty(n, "removeEventListener", {
        value: function(e, t, n) {
            k("removeEventListener", e, n), e === S && null != t && this.removeListener(E(t))
        },
        writable: !0,
        configurable: !0
    }));
    "function" != typeof Object.hasOwn && Object.defineProperty(Object, "hasOwn", {
        value: function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        },
        writable: !0,
        configurable: !0
    }), "u" > typeof crypto && "function" == typeof crypto.randomUUID || "u" > typeof crypto && Object.defineProperty(crypto, "randomUUID", {
        value: function() {
            let e = new Uint8Array(16);
            crypto.getRandomValues(e), e[6] = 15 & e[6] | 64, e[8] = 63 & e[8] | 128;
            let t = Array.from(e, e => e.toString(16).padStart(2, "0")).join("");
            return "".concat(t.slice(0, 8), "-").concat(t.slice(8, 12), "-").concat(t.slice(12, 16), "-").concat(t.slice(16, 20), "-").concat(t.slice(20))
        },
        writable: !0,
        configurable: !0
    });
    var A, q, j, _, I, C, O, L, D, M, N, U, B, F, H, V, G, W, K, z, X, Q, $, Y, J, Z, ee, et, en, er, ei, ea, eo, es, eu, el, ec, ed, ef, eh, ep, ev, ey, em, eg, eb, ew, ex, eP, eS, eR, eT, eE, ek, eA, eq, ej, e_, eI, eC, eO, eL, eD, eM, eN, eU, eB, eF, eH, eV, eG, eW, eK, ez, eX, eQ, e$, eY, eJ, eZ, e0, e1, e2, e4, e3, e6, e8, e5, e7, e9, te, tt, tn, tr, ti, ta, to, ts, tu, tl, tc, td, tf, th, tp, tv, ty, tm, tg, tb, tw, tx, tP, tS, tR, tT, tE, tk, tA, tq, tj, t_, tI, tC, tO, tL, tD, tM, tN, tU, tB, tF, tH, tV, tG, tW, tK, tz, tX, tQ, t$, tY, tJ, tZ, t0, t1, t2, t4, t3, t6, t8, t5, t7, t9, ne, nt, nn, nr, ni, na, no, ns, nu, nl, nc, nd, nf, nh, np, nv, ny, nm, ng, nb, nw, nx, nP, nS, nR, nT, nE, nk, nA, nq, nj, n_, nI, nC, nO, nL, nD, nM, nN, nU, nB, nF, nH, nV, nG, nW, nK, nz, nX, nQ, n$, nY, nJ, nZ, n0, n1, n2, n4, n3, n6, n8, n5, n7, n9, re, rt, rn, rr, ri, ra, ro, rs, ru, rl, rc, rd, rf, rh, rp, rv, ry, rm, rg, rb, rw, rx, rP, rS, rR, rT, rE, rk, rA, rq, rj, r_, rI, rC, rO, rL, rD, rM, rN, rU, rB, rF, rH, rV, rG, rW, rK, rz, rX, rQ, r$, rY, rJ, rZ, r0, r1, r2, r4, r3, r6, r8, r5, r7, r9, ie, it, ir, ii, ia, io, is, iu, il, ic, id, ih, ip, iv, iy, im, ig, ib, iw = e.i(929036),
        ix = {};

    function iP() {
        if (q) return A;
        q = 1;
        var e = function(e) {
            return e && e.Math === Math && e
        };
        return A = e("object" == typeof globalThis && globalThis) || e(window) || e("object" == typeof self && self) || e("object" == typeof iw.c && iw.c) || e("object" == typeof A && A) || function() {
            return this
        }() || Function("return this")()
    }
    var iS = {};

    function iR() {
        return _ ? j : (_ = 1, j = function(e) {
            try {
                return !!e()
            } catch (e) {
                return !0
            }
        })
    }

    function iT() {
        return C ? I : (C = 1, I = !iR()(function() {
            return 7 !== Object.defineProperty({}, 1, {
                get: function() {
                    return 7
                }
            })[1]
        }))
    }

    function iE() {
        return L ? O : (L = 1, O = !iR()(function() {
            var e = (function() {}).bind();
            return "function" != typeof e || e.hasOwnProperty("prototype")
        }))
    }

    function ik() {
        if (M) return D;
        M = 1;
        var e = iE(),
            t = Function.prototype.call;
        return D = e ? t.bind(t) : function() {
            return t.apply(t, arguments)
        }
    }
    var iA = {};

    function iq() {
        return B ? U : (B = 1, U = function(e, t) {
            return {
                enumerable: !(1 & e),
                configurable: !(2 & e),
                writable: !(4 & e),
                value: t
            }
        })
    }

    function ij() {
        if (H) return F;
        H = 1;
        var e = iE(),
            t = Function.prototype,
            n = t.call,
            r = e && t.bind.bind(n, n);
        return F = e ? r : function(e) {
            return function() {
                return n.apply(e, arguments)
            }
        }
    }

    function i_() {
        if (G) return V;
        G = 1;
        var e = ij(),
            t = e({}.toString),
            n = e("".slice);
        return V = function(e) {
            return n(t(e), 8, -1)
        }
    }

    function iI() {
        if (K) return W;
        K = 1;
        var e = ij(),
            t = iR(),
            n = i_(),
            r = Object,
            i = e("".split);
        return W = t(function() {
            return !r("z").propertyIsEnumerable(0)
        }) ? function(e) {
            return "String" === n(e) ? i(e, "") : r(e)
        } : r
    }

    function iC() {
        return X ? z : (X = 1, z = function(e) {
            return null == e
        })
    }

    function iO() {
        if ($) return Q;
        $ = 1;
        var e = iC(),
            t = TypeError;
        return Q = function(n) {
            if (e(n)) throw new t("Can't call method on " + n);
            return n
        }
    }

    function iL() {
        if (J) return Y;
        J = 1;
        var e = iI(),
            t = iO();
        return Y = function(n) {
            return e(t(n))
        }
    }

    function iD() {
        if (ee) return Z;
        ee = 1;
        var e = "object" == typeof document && document.all;
        return Z = void 0 === e && void 0 !== e ? function(t) {
            return "function" == typeof t || t === e
        } : function(e) {
            return "function" == typeof e
        }
    }

    function iM() {
        if (en) return et;
        en = 1;
        var e = iD();
        return et = function(t) {
            return "object" == typeof t ? null !== t : e(t)
        }
    }

    function iN() {
        if (ei) return er;
        ei = 1;
        var e = iP(),
            t = iD();
        return er = function(n, r) {
            var i;
            return arguments.length < 2 ? t(i = e[n]) ? i : void 0 : e[n] && e[n][r]
        }
    }

    function iU() {
        return eo ? ea : (eo = 1, ea = ij()({}.isPrototypeOf))
    }

    function iB() {
        if (eu) return es;
        eu = 1;
        var e = iP().navigator,
            t = e && e.userAgent;
        return es = t ? String(t) : ""
    }

    function iF() {
        if (ec) return el;
        ec = 1;
        var e, t, n = iP(),
            r = iB(),
            i = n.process,
            a = n.Deno,
            o = i && i.versions || a && a.version,
            s = o && o.v8;
        return s && (t = (e = s.split("."))[0] > 0 && e[0] < 4 ? 1 : +(e[0] + e[1])), !t && r && (!(e = r.match(/Edge\/(\d+)/)) || e[1] >= 74) && (e = r.match(/Chrome\/(\d+)/)) && (t = +e[1]), el = t
    }

    function iH() {
        if (ef) return ed;
        ef = 1;
        var e = iF(),
            t = iR(),
            n = iP().String;
        return ed = !!Object.getOwnPropertySymbols && !t(function() {
            var t = Symbol("symbol detection");
            return !n(t) || !(Object(t) instanceof Symbol) || !Symbol.sham && e && e < 41
        })
    }

    function iV() {
        return ep ? eh : (ep = 1, eh = iH() && !Symbol.sham && "symbol" == typeof Symbol.iterator)
    }

    function iG() {
        if (ey) return ev;
        ey = 1;
        var e = iN(),
            t = iD(),
            n = iU(),
            r = iV(),
            i = Object;
        return ev = r ? function(e) {
            return "symbol" == typeof e
        } : function(r) {
            var a = e("Symbol");
            return t(a) && n(a.prototype, i(r))
        }
    }

    function iW() {
        if (eg) return em;
        eg = 1;
        var e = String;
        return em = function(t) {
            try {
                return e(t)
            } catch (e) {
                return "Object"
            }
        }
    }

    function iK() {
        if (ew) return eb;
        ew = 1;
        var e = iD(),
            t = iW(),
            n = TypeError;
        return eb = function(r) {
            if (e(r)) return r;
            throw new n(t(r) + " is not a function")
        }
    }

    function iz() {
        if (eP) return ex;
        eP = 1;
        var e = iK(),
            t = iC();
        return ex = function(n, r) {
            var i = n[r];
            return t(i) ? void 0 : e(i)
        }
    }
    var iX = {
        exports: {}
    };

    function iQ() {
        return eE ? eT : (eE = 1, eT = !1)
    }

    function i$() {
        if (eA) return ek;
        eA = 1;
        var e = iP(),
            t = Object.defineProperty;
        return ek = function(n, r) {
            try {
                t(e, n, {
                    value: r,
                    configurable: !0,
                    writable: !0
                })
            } catch (t) {
                e[n] = r
            }
            return r
        }
    }

    function iY() {
        if (eq) return iX.exports;
        eq = 1;
        var e = iQ(),
            t = iP(),
            n = i$(),
            r = "__core-js_shared__",
            i = iX.exports = t[r] || n(r, {});
        return (i.versions || (i.versions = [])).push({
            version: "3.49.0",
            mode: e ? "pure" : "global",
            copyright: "© 2013–2025 Denis Pushkarev (zloirock.ru), 2025–2026 CoreJS Company (core-js.io). All rights reserved.",
            license: "https://github.com/zloirock/core-js/blob/v3.49.0/LICENSE",
            source: "https://github.com/zloirock/core-js"
        }), iX.exports
    }

    function iJ() {
        if (e_) return ej;
        e_ = 1;
        var e = iY();
        return ej = function(t, n) {
            return e[t] || (e[t] = n || {})
        }
    }

    function iZ() {
        if (eC) return eI;
        eC = 1;
        var e = iO(),
            t = Object;
        return eI = function(n) {
            return t(e(n))
        }
    }

    function i0() {
        if (eL) return eO;
        eL = 1;
        var e = ij(),
            t = iZ(),
            n = e({}.hasOwnProperty);
        return eO = Object.hasOwn || function(e, r) {
            return n(t(e), r)
        }
    }

    function i1() {
        if (eM) return eD;
        eM = 1;
        var e = ij(),
            t = 0,
            n = Math.random(),
            r = e(1.1.toString);
        return eD = function(e) {
            return "Symbol(" + (void 0 === e ? "" : e) + ")_" + r(++t + n, 36)
        }
    }

    function i2() {
        if (eU) return eN;
        eU = 1;
        var e = iP(),
            t = iJ(),
            n = i0(),
            r = i1(),
            i = iH(),
            a = iV(),
            o = e.Symbol,
            s = t("wks"),
            u = a ? o.for || o : o && o.withoutSetter || r;
        return eN = function(e) {
            return n(s, e) || (s[e] = i && n(o, e) ? o[e] : u("Symbol." + e)), s[e]
        }
    }

    function i4() {
        if (eV) return eH;
        eV = 1;
        var e = function() {
                if (eF) return eB;
                eF = 1;
                var e = ik(),
                    t = iM(),
                    n = iG(),
                    r = iz(),
                    i = function() {
                        if (eR) return eS;
                        eR = 1;
                        var e = ik(),
                            t = iD(),
                            n = iM(),
                            r = TypeError;
                        return eS = function(i, a) {
                            var o, s;
                            if ("string" === a && t(o = i.toString) && !n(s = e(o, i)) || t(o = i.valueOf) && !n(s = e(o, i)) || "string" !== a && t(o = i.toString) && !n(s = e(o, i))) return s;
                            throw new r("Can't convert object to primitive value")
                        }
                    }(),
                    a = i2(),
                    o = TypeError,
                    s = a("toPrimitive");
                return eB = function(a, u) {
                    if (!t(a) || n(a)) return a;
                    var l, c = r(a, s);
                    if (c) {
                        if (void 0 === u && (u = "default"), !t(l = e(c, a, u)) || n(l)) return l;
                        throw new o("Can't convert object to primitive value")
                    }
                    return void 0 === u && (u = "number"), i(a, u)
                }
            }(),
            t = iG();
        return eH = function(n) {
            var r = e(n, "string");
            return t(r) ? r : r + ""
        }
    }

    function i3() {
        if (eW) return eG;
        eW = 1;
        var e = iP(),
            t = iM(),
            n = e.document,
            r = t(n) && t(n.createElement);
        return eG = function(e) {
            return r ? n.createElement(e) : {}
        }
    }

    function i6() {
        if (ez) return eK;
        ez = 1;
        var e = iT(),
            t = iR(),
            n = i3();
        return eK = !e && !t(function() {
            return 7 !== Object.defineProperty(n("div"), "a", {
                get: function() {
                    return 7
                }
            }).a
        })
    }

    function i8() {
        if (eX) return iS;
        eX = 1;
        var e = iT(),
            t = ik(),
            n = function() {
                if (N) return iA;
                N = 1;
                var e = {}.propertyIsEnumerable,
                    t = Object.getOwnPropertyDescriptor;
                return iA.f = t && !e.call({
                    1: 2
                }, 1) ? function(e) {
                    var n = t(this, e);
                    return !!n && n.enumerable
                } : e, iA
            }(),
            r = iq(),
            i = iL(),
            a = i4(),
            o = i0(),
            s = i6(),
            u = Object.getOwnPropertyDescriptor;
        return iS.f = e ? u : function(e, l) {
            if (e = i(e), l = a(l), s) try {
                return u(e, l)
            } catch (e) {}
            if (o(e, l)) return r(!t(n.f, e, l), e[l])
        }, iS
    }
    var i5 = {};

    function i7() {
        if (e$) return eQ;
        e$ = 1;
        var e = iT(),
            t = iR();
        return eQ = e && t(function() {
            return 42 !== Object.defineProperty(function() {}, "prototype", {
                value: 42,
                writable: !1
            }).prototype
        })
    }

    function i9() {
        if (eJ) return eY;
        eJ = 1;
        var e = iM(),
            t = String,
            n = TypeError;
        return eY = function(r) {
            if (e(r)) return r;
            throw new n(t(r) + " is not an object")
        }
    }

    function ae() {
        if (eZ) return i5;
        eZ = 1;
        var e = iT(),
            t = i6(),
            n = i7(),
            r = i9(),
            i = i4(),
            a = TypeError,
            o = Object.defineProperty,
            s = Object.getOwnPropertyDescriptor,
            u = "enumerable",
            l = "configurable",
            c = "writable";
        return i5.f = e ? n ? function(e, t, n) {
            if (r(e), t = i(t), r(n), "function" == typeof e && "prototype" === t && "value" in n && c in n && !n[c]) {
                var a = s(e, t);
                a && a[c] && (e[t] = n.value, n = {
                    configurable: l in n ? n[l] : a[l],
                    enumerable: u in n ? n[u] : a[u],
                    writable: !1
                })
            }
            return o(e, t, n)
        } : o : function(e, n, s) {
            if (r(e), n = i(n), r(s), t) try {
                return o(e, n, s)
            } catch (e) {}
            if ("get" in s || "set" in s) throw new a("Accessors not supported");
            return "value" in s && (e[n] = s.value), e
        }, i5
    }

    function at() {
        if (e1) return e0;
        e1 = 1;
        var e = iT(),
            t = ae(),
            n = iq();
        return e0 = e ? function(e, r, i) {
            return t.f(e, r, n(1, i))
        } : function(e, t, n) {
            return e[t] = n, e
        }
    }
    var an = {
        exports: {}
    };

    function ar() {
        if (e4) return e2;
        e4 = 1;
        var e = iT(),
            t = i0(),
            n = Function.prototype,
            r = e && Object.getOwnPropertyDescriptor,
            i = t(n, "name"),
            a = i && (!e || e && r(n, "name").configurable);
        return e2 = {
            EXISTS: i,
            PROPER: i && "something" === (function() {}).name,
            CONFIGURABLE: a
        }
    }

    function ai() {
        if (e6) return e3;
        e6 = 1;
        var e = ij(),
            t = iD(),
            n = iY(),
            r = e(Function.toString);
        return t(n.inspectSource) || (n.inspectSource = function(e) {
            return r(e)
        }), e3 = n.inspectSource
    }

    function aa() {
        if (e9) return e7;
        e9 = 1;
        var e = iJ(),
            t = i1(),
            n = e("keys");
        return e7 = function(e) {
            return n[e] || (n[e] = t(e))
        }
    }

    function ao() {
        return tt ? te : (tt = 1, te = {})
    }

    function as() {
        if (tr) return tn;
        tr = 1;
        var e, t, n, r = function() {
                if (e5) return e8;
                e5 = 1;
                var e = iP(),
                    t = iD(),
                    n = e.WeakMap;
                return e8 = t(n) && /native code/.test(String(n))
            }(),
            i = iP(),
            a = iM(),
            o = at(),
            s = i0(),
            u = iY(),
            l = aa(),
            c = ao(),
            d = "Object already initialized",
            f = i.TypeError,
            h = i.WeakMap;
        if (r || u.state) {
            var p = u.state || (u.state = new h);
            p.get = p.get, p.has = p.has, p.set = p.set, e = function(e, t) {
                if (p.has(e)) throw new f(d);
                return t.facade = e, p.set(e, t), t
            }, t = function(e) {
                return p.get(e) || {}
            }, n = function(e) {
                return p.has(e)
            }
        } else {
            var v = l("state");
            c[v] = !0, e = function(e, t) {
                if (s(e, v)) throw new f(d);
                return t.facade = e, o(e, v, t), t
            }, t = function(e) {
                return s(e, v) ? e[v] : {}
            }, n = function(e) {
                return s(e, v)
            }
        }
        return tn = {
            set: e,
            get: t,
            has: n,
            enforce: function(r) {
                return n(r) ? t(r) : e(r, {})
            },
            getterFor: function(e) {
                return function(n) {
                    var r;
                    if (!a(n) || (r = t(n)).type !== e) throw new f("Incompatible receiver, " + e + " required");
                    return r
                }
            }
        }
    }

    function au() {
        if (ti) return an.exports;
        ti = 1;
        var e = ij(),
            t = iR(),
            n = iD(),
            r = i0(),
            i = iT(),
            a = ar().CONFIGURABLE,
            o = ai(),
            s = as(),
            u = s.enforce,
            l = s.get,
            c = String,
            d = Object.defineProperty,
            f = e("".slice),
            h = e("".replace),
            p = e([].join),
            v = i && !t(function() {
                return 8 !== d(function() {}, "length", {
                    value: 8
                }).length
            }),
            y = String(String).split("String"),
            m = an.exports = function(e, t, n) {
                "Symbol(" === f(c(t), 0, 7) && (t = "[" + h(c(t), /^Symbol\(([^)]*)\).*$/, "$1") + "]"), n && n.getter && (t = "get " + t), n && n.setter && (t = "set " + t), (!r(e, "name") || a && e.name !== t) && (i ? d(e, "name", {
                    value: t,
                    configurable: !0
                }) : e.name = t), v && n && r(n, "arity") && e.length !== n.arity && d(e, "length", {
                    value: n.arity
                });
                try {
                    n && r(n, "constructor") && n.constructor ? i && d(e, "prototype", {
                        writable: !1
                    }) : e.prototype && (e.prototype = void 0)
                } catch (e) {}
                var o = u(e);
                return r(o, "source") || (o.source = p(y, "string" == typeof t ? t : "")), e
            };
        return Function.prototype.toString = m(function() {
            return n(this) && l(this).source || o(this)
        }, "toString"), an.exports
    }

    function al() {
        if (to) return ta;
        to = 1;
        var e = iD(),
            t = ae(),
            n = au(),
            r = i$();
        return ta = function(i, a, o, s) {
            s || (s = {});
            var u = s.enumerable,
                l = void 0 !== s.name ? s.name : a;
            if (e(o) && n(o, l, s), s.global) u ? i[a] = o : r(a, o);
            else {
                try {
                    s.unsafe ? i[a] && (u = !0) : delete i[a]
                } catch (e) {}
                u ? i[a] = o : t.f(i, a, {
                    value: o,
                    enumerable: !1,
                    configurable: !s.nonConfigurable,
                    writable: !s.nonWritable
                })
            }
            return i
        }
    }
    var ac = {};

    function ad() {
        if (tc) return tl;
        tc = 1;
        var e = function() {
            if (tu) return ts;
            tu = 1;
            var e = Math.ceil,
                t = Math.floor;
            return ts = Math.trunc || function(n) {
                var r = +n;
                return (r > 0 ? t : e)(r)
            }
        }();
        return tl = function(t) {
            var n = +t;
            return n != n || 0 === n ? 0 : e(n)
        }
    }

    function af() {
        if (tp) return th;
        tp = 1;
        var e = ad(),
            t = Math.min;
        return th = function(n) {
            var r = e(n);
            return r > 0 ? t(r, 0x1fffffffffffff) : 0
        }
    }

    function ah() {
        if (ty) return tv;
        ty = 1;
        var e = af();
        return tv = function(t) {
            return e(t.length)
        }
    }

    function ap() {
        if (tw) return tb;
        tw = 1;
        var e = ij(),
            t = i0(),
            n = iL(),
            r = function() {
                if (tg) return tm;
                tg = 1;
                var e = iL(),
                    t = function() {
                        if (tf) return td;
                        tf = 1;
                        var e = ad(),
                            t = Math.max,
                            n = Math.min;
                        return td = function(r, i) {
                            var a = e(r);
                            return a < 0 ? t(a + i, 0) : n(a, i)
                        }
                    }(),
                    n = ah(),
                    r = function(r) {
                        return function(i, a, o) {
                            var s, u = e(i),
                                l = n(u);
                            if (0 === l) return !r && -1;
                            var c = t(o, l);
                            if (r && a != a) {
                                for (; l > c;)
                                    if ((s = u[c++]) != s) return !0
                            } else
                                for (; l > c; c++)
                                    if ((r || c in u) && u[c] === a) return r || c || 0;
                            return !r && -1
                        }
                    };
                return tm = {
                    includes: r(!0),
                    indexOf: r(!1)
                }
            }().indexOf,
            i = ao(),
            a = e([].push);
        return tb = function(e, o) {
            var s, u = n(e),
                l = 0,
                c = [];
            for (s in u) !t(i, s) && t(u, s) && a(c, s);
            for (; o.length > l;) t(u, s = o[l++]) && (~r(c, s) || a(c, s));
            return c
        }
    }

    function av() {
        return tP ? tx : (tP = 1, tx = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"])
    }

    function ay() {
        if (tS) return ac;
        tS = 1;
        var e = ap(),
            t = av().concat("length", "prototype");
        return ac.f = Object.getOwnPropertyNames || function(n) {
            return e(n, t)
        }, ac
    }
    var am = {};

    function ag() {
        if (tj) return tq;
        tj = 1;
        var e = iR(),
            t = iD(),
            n = /#|\.prototype\./,
            r = function(n, r) {
                var u = a[i(n)];
                return u === s || u !== o && (t(r) ? e(r) : !!r)
            },
            i = r.normalize = function(e) {
                return String(e).replace(n, ".").toLowerCase()
            },
            a = r.data = {},
            o = r.NATIVE = "N",
            s = r.POLYFILL = "P";
        return tq = r
    }

    function ab() {
        if (tI) return t_;
        tI = 1;
        var e = iP(),
            t = i8().f,
            n = at(),
            r = al(),
            i = i$(),
            a = function() {
                if (tA) return tk;
                tA = 1;
                var e = i0(),
                    t = function() {
                        if (tE) return tT;
                        tE = 1;
                        var e = iN(),
                            t = ij(),
                            n = ay(),
                            r = (tR || (tR = 1, am.f = Object.getOwnPropertySymbols), am),
                            i = i9(),
                            a = t([].concat);
                        return tT = e("Reflect", "ownKeys") || function(e) {
                            var t = n.f(i(e)),
                                o = r.f;
                            return o ? a(t, o(e)) : t
                        }
                    }(),
                    n = i8(),
                    r = ae();
                return tk = function(i, a, o) {
                    for (var s = t(a), u = r.f, l = n.f, c = 0; c < s.length; c++) {
                        var d = s[c];
                        e(i, d) || o && e(o, d) || u(i, d, l(a, d))
                    }
                }
            }(),
            o = ag();
        return t_ = function(s, u) {
            var l, c, d, f, h, p = s.target,
                v = s.global,
                y = s.stat;
            if (l = v ? e : y ? e[p] || i(p, {}) : e[p] && e[p].prototype)
                for (c in u) {
                    if (f = u[c], d = s.dontCallGetSet ? (h = t(l, c)) && h.value : l[c], !o(v ? c : p + (y ? "." : "#") + c, s.forced) && void 0 !== d) {
                        if (typeof f == typeof d) continue;
                        a(f, d)
                    }(s.sham || d && d.sham) && n(f, "sham", !0), r(l, c, f, s)
                }
        }
    }

    function aw() {
        if (tO) return tC;
        tO = 1;
        var e = i2()("toStringTag"),
            t = {};
        return t[e] = "z", tC = "[object z]" === String(t)
    }

    function ax() {
        if (tD) return tL;
        tD = 1;
        var e = aw(),
            t = iD(),
            n = i_(),
            r = i2()("toStringTag"),
            i = Object,
            a = "Arguments" === n(function() {
                return arguments
            }()),
            o = function(e, t) {
                try {
                    return e[t]
                } catch (e) {}
            };
        return tL = e ? n : function(e) {
            var s, u, l;
            return void 0 === e ? "Undefined" : null === e ? "Null" : "string" == typeof(u = o(s = i(e), r)) ? u : a ? n(s) : "Object" === (l = n(s)) && t(s.callee) ? "Arguments" : l
        }
    }

    function aP() {
        if (tN) return tM;
        tN = 1;
        var e = ax(),
            t = String;
        return tM = function(n) {
            if ("Symbol" === e(n)) throw TypeError("Cannot convert a Symbol value to a string");
            return t(n)
        }
    }

    function aS() {
        if (tB) return tU;
        tB = 1;
        var e = i9();
        return tU = function() {
            var t = e(this),
                n = "";
            return t.hasIndices && (n += "d"), t.global && (n += "g"), t.ignoreCase && (n += "i"), t.multiline && (n += "m"), t.dotAll && (n += "s"), t.unicode && (n += "u"), t.unicodeSets && (n += "v"), t.sticky && (n += "y"), n
        }
    }
    var aR = {};

    function aT() {
        if (tG) return tV;
        tG = 1;
        var e = ap(),
            t = av();
        return tV = Object.keys || function(n) {
            return e(n, t)
        }
    }

    function aE() {
        if (tQ) return tX;
        tQ = 1;
        var e, t = i9(),
            n = function() {
                if (tW) return aR;
                tW = 1;
                var e = iT(),
                    t = i7(),
                    n = ae(),
                    r = i9(),
                    i = iL(),
                    a = aT();
                return aR.f = e && !t ? Object.defineProperties : function(e, t) {
                    r(e);
                    for (var o, s = i(t), u = a(t), l = u.length, c = 0; l > c;) n.f(e, o = u[c++], s[o]);
                    return e
                }, aR
            }(),
            r = av(),
            i = ao(),
            a = tz ? tK : (tz = 1, tK = iN()("document", "documentElement")),
            o = i3(),
            s = aa(),
            u = "prototype",
            l = "script",
            c = s("IE_PROTO"),
            d = function() {},
            f = function(e) {
                return "<" + l + ">" + e + "</" + l + ">"
            },
            h = function(e) {
                e.write(f("")), e.close();
                var t = e.parentWindow.Object;
                return e = null, t
            },
            p = function() {
                var e, t = o("iframe");
                return t.style.display = "none", a.appendChild(t), t.src = String("java" + l + ":"), (e = t.contentWindow.document).open(), e.write(f("document.F=Object")), e.close(), e.F
            },
            v = function() {
                try {
                    e = new ActiveXObject("htmlfile")
                } catch (e) {}
                v = "u" > typeof document ? document.domain && e ? h(e) : p() : h(e);
                for (var t = r.length; t--;) delete v[u][r[t]];
                return v()
            };
        return i[c] = !0, tX = Object.create || function(e, r) {
            var i;
            return null !== e ? (d[u] = t(e), i = new d, d[u] = null, i[c] = e) : i = v(), void 0 === r ? i : n.f(i, r)
        }
    }

    function ak() {
        if (t1) return t0;
        t1 = 1;
        var e, t, n = ik(),
            r = ij(),
            i = aP(),
            a = aS(),
            o = function() {
                if (tH) return tF;
                tH = 1;
                var e = iR(),
                    t = iP().RegExp,
                    n = e(function() {
                        var e = t("a", "y");
                        return e.lastIndex = 2, null !== e.exec("abcd")
                    }),
                    r = n || e(function() {
                        return !t("a", "y").sticky
                    });
                return tF = {
                    BROKEN_CARET: n || e(function() {
                        var e = t("^r", "gy");
                        return e.lastIndex = 2, null !== e.exec("str")
                    }),
                    MISSED_STICKY: r,
                    UNSUPPORTED_Y: n
                }
            }(),
            s = iJ(),
            u = aE(),
            l = as().get,
            c = function() {
                if (tY) return t$;
                tY = 1;
                var e = iR(),
                    t = iP().RegExp;
                return t$ = e(function() {
                    var e = t(".", "s");
                    return !(e.dotAll && e.test("\n") && "s" === e.flags)
                })
            }(),
            d = function() {
                if (tZ) return tJ;
                tZ = 1;
                var e = iR(),
                    t = iP().RegExp;
                return tJ = e(function() {
                    var e = t("(?<a>b)", "g");
                    return "b" !== e.exec("b").groups.a || "bc" !== "b".replace(e, "$<a>c")
                })
            }(),
            f = s("native-string-replace", String.prototype.replace),
            h = RegExp.prototype.exec,
            p = h,
            v = r("".charAt),
            y = r("".indexOf),
            m = r("".replace),
            g = r("".slice),
            b = (t = /b*/g, n(h, e = /a/, "a"), n(h, t, "a"), 0 !== e.lastIndex || 0 !== t.lastIndex),
            w = o.BROKEN_CARET,
            x = void 0 !== /()??/.exec("")[1],
            P = function(e, t) {
                for (var n = e.groups = u(null), r = 0; r < t.length; r++) {
                    var i = t[r];
                    n[i[0]] = e[i[1]]
                }
            };
        return (b || x || w || c || d) && (p = function(e) {
            var t, r, o, s = l(this),
                u = i(e),
                c = s.raw;
            if (c) return c.lastIndex = this.lastIndex, t = n(p, c, u), this.lastIndex = c.lastIndex, t && s.groups && P(t, s.groups), t;
            var d = s.groups,
                S = w && this.sticky,
                R = n(a, this),
                T = this.source,
                E = 0,
                k = u;
            if (S) {
                -1 === y(R = m(R, "y", ""), "g") && (R += "g"), k = g(u, this.lastIndex);
                var A = this.lastIndex > 0 && v(u, this.lastIndex - 1);
                this.lastIndex > 0 && (!this.multiline || this.multiline && "\n" !== A && "\r" !== A && "\u2028" !== A && "\u2029" !== A) && (T = "(?: (?:" + T + "))", k = " " + k, E++), r = RegExp("^(?:" + T + ")", R)
            }
            x && (r = RegExp("^" + T + "$(?!\\s)", R)), b && (o = this.lastIndex);
            var q = n(h, S ? r : this, k);
            return S ? q ? (q.input = u, q[0] = g(q[0], E), q.index = this.lastIndex, this.lastIndex += q[0].length) : this.lastIndex = 0 : b && q && (this.lastIndex = this.global ? q.index + q[0].length : o), x && q && q.length > 1 && n(f, q[0], r, function() {
                for (var e = 1; e < arguments.length - 2; e++) void 0 === arguments[e] && (q[e] = void 0)
            }), q && d && P(q, d), q
        }), t0 = p
    }

    function aA() {
        if (t2) return ix;
        t2 = 1;
        var e = ab(),
            t = ak();
        return e({
            target: "RegExp",
            proto: !0,
            forced: /./.exec !== t
        }, {
            exec: t
        }), ix
    }

    function aq() {
        if (nn) return nt;
        nn = 1;
        var e = ij(),
            t = iZ(),
            n = Math.floor,
            r = e("".charAt),
            i = e("".replace),
            a = e("".slice),
            o = /\$([$&'`]|\d{1,2}|<[^>]*>)/g,
            s = /\$([$&'`]|\d{1,2})/g;
        return nt = function(e, u, l, c, d, f) {
            var h = l + e.length,
                p = c.length,
                v = s;
            return void 0 !== d && (d = t(d), v = o), i(f, v, function(t, i) {
                var o;
                switch (r(i, 0)) {
                    case "$":
                        return "$";
                    case "&":
                        return e;
                    case "`":
                        return a(u, 0, l);
                    case "'":
                        return a(u, h);
                    case "<":
                        o = d[a(i, 1, -1)];
                        break;
                    default:
                        var s = +i;
                        if (0 === s) return t;
                        if (s > p) {
                            var f = n(s / 10);
                            if (0 === f) return t;
                            if (f <= p) return void 0 === c[f - 1] ? r(i, 1) : c[f - 1] + r(i, 1);
                            return t
                        }
                        o = c[s - 1]
                }
                return void 0 === o ? "" : o
            })
        }
    }

    function aj() {
        if (no) return na;
        no = 1;
        var e = ik(),
            t = i0(),
            n = iU(),
            r = function() {
                if (ni) return nr;
                ni = 1;
                var e = iP(),
                    t = iR(),
                    n = e.RegExp;
                return nr = {
                    correct: !t(function() {
                        var e = !0;
                        try {
                            n(".", "d")
                        } catch (t) {
                            e = !1
                        }
                        var t = {},
                            r = "",
                            i = e ? "dgimsy" : "gimsy",
                            a = function(e, n) {
                                Object.defineProperty(t, e, {
                                    get: function() {
                                        return r += n, !0
                                    }
                                })
                            },
                            o = {
                                dotAll: "s",
                                global: "g",
                                ignoreCase: "i",
                                multiline: "m",
                                sticky: "y"
                            };
                        for (var s in e && (o.hasIndices = "d"), o) a(s, o[s]);
                        return Object.getOwnPropertyDescriptor(n.prototype, "flags").get.call(t) !== i || r !== i
                    })
                }
            }(),
            i = aS(),
            a = RegExp.prototype;
        return na = r.correct ? function(e) {
            return e.flags
        } : function(o) {
            return !r.correct && n(a, o) && !t(o, "flags") ? e(i, o) : o.flags
        }
    }

    function a_() {
        if (np) return nh;
        np = 1;
        var e = iP(),
            t = ij();
        return nh = function(n, r) {
            return t(e[n].prototype[r])
        }
    }

    function aI() {
        if (nm) return ny;
        nm = 1;
        var e = i2(),
            t = aE(),
            n = ae().f,
            r = e("unscopables"),
            i = Array.prototype;
        return void 0 === i[r] && n(i, r, {
            configurable: !0,
            value: t(null)
        }), ny = function(e) {
            i[r][e] = !0
        }
    }

    function aC() {
        if (nT) return nR;
        nT = 1;
        var e = function() {
                if (nS) return nP;
                nS = 1;
                var e = i_(),
                    t = ij();
                return nP = function(n) {
                    if ("Function" === e(n)) return t(n)
                }
            }(),
            t = iK(),
            n = iE(),
            r = e(e.bind);
        return nR = function(e, i) {
            return t(e), void 0 === i ? e : n ? r(e, i) : function() {
                return e.apply(i, arguments)
            }
        }
    }

    function aO() {
        if (nk) return nE;
        nk = 1;
        var e = aC(),
            t = iI(),
            n = iZ(),
            r = ah(),
            i = function(i) {
                var a = 1 === i;
                return function(o, s, u) {
                    for (var l, c = n(o), d = t(c), f = r(d), h = e(s, u); f-- > 0;)
                        if (h(l = d[f], f, c)) switch (i) {
                            case 0:
                                return l;
                            case 1:
                                return f
                        }
                    return a ? -1 : void 0
                }
            };
        return nE = {
            findLast: i(0),
            findLastIndex: i(1)
        }
    }

    function aL() {
        if (nO) return nC;
        nO = 1;
        var e = iT(),
            t = ae(),
            n = iq();
        return nC = function(r, i, a) {
            e ? t.f(r, i, n(0, a)) : r[i] = a
        }
    }

    function aD() {
        return nD ? nL : (nD = 1, nL = {})
    }

    function aM() {
        if (nB) return nU;
        nB = 1;
        var e = ax(),
            t = iz(),
            n = iC(),
            r = aD(),
            i = i2()("iterator");
        return nU = function(a) {
            if (!n(a)) return t(a, i) || t(a, "@@iterator") || r[e(a)]
        }
    }

    function aN() {
        if (nK) return nW;
        nK = 1;
        var e = aC(),
            t = ik(),
            n = i9(),
            r = iW(),
            i = function() {
                if (nN) return nM;
                nN = 1;
                var e = i2(),
                    t = aD(),
                    n = e("iterator"),
                    r = Array.prototype;
                return nM = function(e) {
                    return void 0 !== e && (t.Array === e || r[n] === e)
                }
            }(),
            a = ah(),
            o = iU(),
            s = function() {
                if (nH) return nF;
                nH = 1;
                var e = ik(),
                    t = iK(),
                    n = i9(),
                    r = iW(),
                    i = aM(),
                    a = TypeError;
                return nF = function(o, s) {
                    var u = arguments.length < 2 ? i(o) : s;
                    if (t(u)) return n(e(u, o));
                    throw new a(r(o) + " is not iterable")
                }
            }(),
            u = aM(),
            l = function() {
                if (nG) return nV;
                nG = 1;
                var e = ik(),
                    t = i9(),
                    n = iz();
                return nV = function(r, i, a) {
                    var o, s;
                    t(r);
                    try {
                        if (!(o = n(r, "return"))) {
                            if ("throw" === i) throw a;
                            return a
                        }
                        o = e(o, r)
                    } catch (e) {
                        s = !0, o = e
                    }
                    if ("throw" === i) throw a;
                    if (s) throw o;
                    return t(o), a
                }
            }(),
            c = TypeError,
            d = function(e, t) {
                this.stopped = e, this.result = t
            },
            f = d.prototype;
        return nW = function(h, p, v) {
            var y, m, g, b, w, x, P, S = v && v.that,
                R = !!(v && v.AS_ENTRIES),
                T = !!(v && v.IS_RECORD),
                E = !!(v && v.IS_ITERATOR),
                k = !!(v && v.INTERRUPTED),
                A = e(p, S),
                q = function(e) {
                    var t = y;
                    return y = void 0, t && l(t, "normal"), new d(!0, e)
                },
                j = function(e) {
                    return R ? (n(e), k ? A(e[0], e[1], q) : A(e[0], e[1])) : k ? A(e, q) : A(e)
                };
            if (T) y = h.iterator;
            else if (E) y = h;
            else {
                if (!(m = u(h))) throw new c(r(h) + " is not iterable");
                if (i(m)) {
                    for (g = 0, b = a(h); b > g; g++)
                        if ((w = j(h[g])) && o(f, w)) return w;
                    return new d(!1)
                }
                y = s(h, m)
            }
            for (x = T ? h.next : y.next; !(P = t(x, y)).done;) {
                var _ = P.value;
                try {
                    w = j(_)
                } catch (e) {
                    if (y) l(y, "throw", e);
                    else throw e
                }
                if ("object" == typeof w && w && o(f, w)) return w
            }
            return new d(!1)
        }
    }

    function aU() {
        return nQ ? nX : (nQ = 1, nX = iP())
    }

    function aB() {
        if (nJ) return nY;
        nJ = 1;
        var e = aP();
        return nY = function(t, n) {
            return void 0 === t ? arguments.length < 2 ? "" : n : e(t)
        }
    }

    function aF() {
        if (n0) return nZ;
        n0 = 1;
        var e = iT(),
            t = iR(),
            n = i9(),
            r = aB(),
            i = Error.prototype.toString;
        return nZ = t(function() {
            if (e) {
                var t = Object.create(Object.defineProperty({}, "name", {
                    get: function() {
                        return this === t
                    }
                }));
                if ("true" !== i.call(t)) return !0
            }
            return "2: 1" !== i.call({
                message: 1,
                name: 2
            }) || "Error" !== i.call({})
        }) ? function() {
            var e = n(this),
                t = r(e.name, "Error"),
                i = r(e.message);
            return t ? i ? t + ": " + i : t : i
        } : i
    }

    function aH() {
        if (n6) return n3;
        n6 = 1;
        var e = i0(),
            t = iD(),
            n = iZ(),
            r = aa(),
            i = n4 ? n2 : (n4 = 1, n2 = !iR()(function() {
                function e() {}
                return e.prototype.constructor = null, Object.getPrototypeOf(new e) !== e.prototype
            })),
            a = r("IE_PROTO"),
            o = Object,
            s = o.prototype;
        return n3 = i ? o.getPrototypeOf : function(r) {
            var i = n(r);
            if (e(i, a)) return i[a];
            var u = i.constructor;
            return t(u) && i instanceof u ? u.prototype : i instanceof o ? s : null
        }
    }

    function aV() {
        if (n5) return n8;
        n5 = 1;
        var e, t, n, r = iR(),
            i = iD(),
            a = iM(),
            o = aE(),
            s = aH(),
            u = al(),
            l = i2(),
            c = iQ(),
            d = l("iterator"),
            f = !1;
        return [].keys && ("next" in (n = [].keys()) ? (t = s(s(n))) !== Object.prototype && (e = t) : f = !0), !a(e) || r(function() {
            var t = {};
            return e[d].call(t) !== t
        }) ? e = {} : c && (e = o(e)), i(e[d]) || u(e, d, function() {
            return this
        }), n8 = {
            IteratorPrototype: e,
            BUGGY_SAFARI_ITERATORS: f
        }
    }

    function aG() {
        if (n9) return n7;
        n9 = 1;
        var e = ae().f,
            t = i0(),
            n = i2()("toStringTag");
        return n7 = function(r, i, a) {
            r && !a && (r = r.prototype), r && !t(r, n) && e(r, n, {
                configurable: !0,
                value: i
            })
        }
    }

    function aW() {
        if (rl) return ru;
        rl = 1;
        var e = function() {
                if (rr) return rn;
                rr = 1;
                var e = ij(),
                    t = iK();
                return rn = function(n, r, i) {
                    try {
                        return e(t(Object.getOwnPropertyDescriptor(n, r)[i]))
                    } catch (e) {}
                }
            }(),
            t = iM(),
            n = iO(),
            r = function() {
                if (rs) return ro;
                rs = 1;
                var e = function() {
                        if (ra) return ri;
                        ra = 1;
                        var e = iM();
                        return ri = function(t) {
                            return e(t) || null === t
                        }
                    }(),
                    t = String,
                    n = TypeError;
                return ro = function(r) {
                    if (e(r)) return r;
                    throw new n("Can't set " + t(r) + " as a prototype")
                }
            }();
        return ru = Object.setPrototypeOf || ("__proto__" in {} ? function() {
            var i, a = !1,
                o = {};
            try {
                (i = e(Object.prototype, "__proto__", "set"))(o, []), a = o instanceof Array
            } catch (e) {}
            return function(e, o) {
                return n(e), r(o), t(e) && (a ? i(e, o) : e.__proto__ = o), e
            }
        }() : void 0)
    }

    function aK() {
        if (rd) return rc;
        rd = 1;
        var e = ab(),
            t = ik(),
            n = iQ(),
            r = ar(),
            i = iD(),
            a = function() {
                if (rt) return re;
                rt = 1;
                var e = aV().IteratorPrototype,
                    t = aE(),
                    n = iq(),
                    r = aG(),
                    i = aD(),
                    a = function() {
                        return this
                    };
                return re = function(o, s, u, l) {
                    var c = s + " Iterator";
                    return o.prototype = t(e, {
                        next: n(+!l, u)
                    }), r(o, c, !1, !0), i[c] = a, o
                }
            }(),
            o = aH(),
            s = aW(),
            u = aG(),
            l = at(),
            c = al(),
            d = i2(),
            f = aD(),
            h = aV(),
            p = r.PROPER,
            v = r.CONFIGURABLE,
            y = h.IteratorPrototype,
            m = h.BUGGY_SAFARI_ITERATORS,
            g = d("iterator"),
            b = "keys",
            w = "values",
            x = "entries",
            P = function() {
                return this
            };
        return rc = function(r, d, h, S, R, T, E) {
            a(h, d, S);
            var k, A, q, j = function(e) {
                    if (e === R && L) return L;
                    if (!m && e && e in C) return C[e];
                    switch (e) {
                        case b:
                        case w:
                        case x:
                            return function() {
                                return new h(this, e)
                            }
                    }
                    return function() {
                        return new h(this)
                    }
                },
                _ = d + " Iterator",
                I = !1,
                C = r.prototype,
                O = C[g] || C["@@iterator"] || R && C[R],
                L = !m && O || j(R),
                D = "Array" === d && C.entries || O;
            if (D && (k = o(D.call(new r))) !== Object.prototype && k.next && (!n && o(k) !== y && (s ? s(k, y) : i(k[g]) || c(k, g, P)), u(k, _, !0, !0), n && (f[_] = P)), p && R === w && O && O.name !== w && (!n && v ? l(C, "name", w) : (I = !0, L = function() {
                    return t(O, this)
                })), R)
                if (A = {
                        values: j(w),
                        keys: T ? L : j(b),
                        entries: j(x)
                    }, E)
                    for (q in A) !m && !I && q in C || c(C, q, A[q]);
                else e({
                    target: d,
                    proto: !0,
                    forced: m || I
                }, A);
            return (!n || E) && C[g] !== L && c(C, g, L, {
                name: R
            }), f[d] = L, A
        }
    }

    function az() {
        return rh ? rf : (rh = 1, rf = function(e, t) {
            return {
                value: e,
                done: t
            }
        })
    }
    nv || (nv = 1, aA(), function() {
        if (!nl) {
            nl = 1;
            var e = function() {
                    if (t3) return t4;
                    t3 = 1;
                    var e = iE(),
                        t = Function.prototype,
                        n = t.apply,
                        r = t.call;
                    return t4 = "object" == typeof Reflect && Reflect.apply || (e ? r.bind(n) : function() {
                        return r.apply(n, arguments)
                    })
                }(),
                t = ik(),
                n = ij(),
                r = function() {
                    if (t8) return t6;
                    t8 = 1, aA();
                    var e = ik(),
                        t = al(),
                        n = ak(),
                        r = iR(),
                        i = i2(),
                        a = at(),
                        o = i("species"),
                        s = RegExp.prototype;
                    return t6 = function(u, l, c, d) {
                        var f = i(u),
                            h = !r(function() {
                                var e = {};
                                return e[f] = function() {
                                    return 7
                                }, 7 !== "" [u](e)
                            }),
                            p = h && !r(function() {
                                var e = !1,
                                    t = /a/;
                                if ("split" === u) {
                                    var n = {};
                                    n[o] = function() {
                                        return t
                                    }, (t = {
                                        constructor: n,
                                        flags: ""
                                    })[f] = /./ [f]
                                }
                                return t.exec = function() {
                                    return e = !0, null
                                }, t[f](""), !e
                            });
                        if (!h || !p || c) {
                            var v = /./ [f],
                                y = l(f, "" [u], function(t, r, i, a, o) {
                                    var u = r.exec;
                                    return u === n || u === s.exec ? h && !o ? {
                                        done: !0,
                                        value: e(v, r, i, a)
                                    } : {
                                        done: !0,
                                        value: e(t, i, r, a)
                                    } : {
                                        done: !1
                                    }
                                });
                            t(String.prototype, u, y[0]), t(s, f, y[1])
                        }
                        d && a(s[f], "sham", !0)
                    }
                }(),
                i = iR(),
                a = i9(),
                o = iD(),
                s = iM(),
                u = ad(),
                l = af(),
                c = aP(),
                d = iO(),
                f = function() {
                    if (ne) return t9;
                    ne = 1;
                    var e = function() {
                        if (t7) return t5;
                        t7 = 1;
                        var e = ij(),
                            t = ad(),
                            n = aP(),
                            r = iO(),
                            i = e("".charAt),
                            a = e("".charCodeAt),
                            o = e("".slice),
                            s = function(e) {
                                return function(s, u) {
                                    var l, c, d = n(r(s)),
                                        f = t(u),
                                        h = d.length;
                                    return f < 0 || f >= h ? e ? "" : void 0 : (l = a(d, f)) < 55296 || l > 56319 || f + 1 === h || (c = a(d, f + 1)) < 56320 || c > 57343 ? e ? i(d, f) : l : e ? o(d, f, f + 2) : (l - 55296 << 10) + (c - 56320) + 65536
                                }
                            };
                        return t5 = {
                            codeAt: s(!1),
                            charAt: s(!0)
                        }
                    }().charAt;
                    return t9 = function(t, n, r) {
                        return n + (r && e(t, n).length || 1)
                    }
                }(),
                h = iz(),
                p = aq(),
                v = aj(),
                y = function() {
                    if (nu) return ns;
                    nu = 1;
                    var e = ik(),
                        t = i9(),
                        n = iD(),
                        r = i_(),
                        i = ak(),
                        a = TypeError;
                    return ns = function(o, s) {
                        var u = o.exec;
                        if (n(u)) {
                            var l = e(u, o, s);
                            return null !== l && t(l), l
                        }
                        if ("RegExp" === r(o)) return e(i, o, s);
                        throw new a("RegExp#exec called on incompatible receiver")
                    }
                }(),
                m = i2()("replace"),
                g = Math.max,
                b = Math.min,
                w = n([].concat),
                x = n([].push),
                P = n("".indexOf),
                S = n("".slice),
                R = "$0" === "a".replace(/./, "$0"),
                T = !!/./ [m] && "" === /./ [m]("a", "$0");
            r("replace", function(n, r, i) {
                var R = T ? "$" : "$0";
                return [function(e, n) {
                    var i = d(this),
                        a = s(e) ? h(e, m) : void 0;
                    return a ? t(a, e, i, n) : t(r, c(i), e, n)
                }, function(t, n) {
                    var s = a(this),
                        d = c(t),
                        h = o(n);
                    h || (n = c(n));
                    var m = c(v(s));
                    if ("string" == typeof n && !~P(n, R) && !~P(n, "$<") && !~P(m, "y")) {
                        var T = i(r, s, d, n);
                        if (T.done) return T.value
                    }
                    var E = !!~P(m, "g");
                    E && (I = !!~P(m, "u") || !!~P(m, "v"), s.lastIndex = 0);
                    for (var k = []; null !== (O = y(s, d)) && (x(k, O), E);) "" === c(O[0]) && (s.lastIndex = f(d, l(s.lastIndex), I));
                    for (var A = "", q = 0, j = 0; j < k.length; j++) {
                        for (var _, I, C, O = k[j], L = c(O[0]), D = g(b(u(O.index), d.length), 0), M = [], N = 1; N < O.length; N++) x(M, void 0 === (_ = O[N]) ? _ : String(_));
                        var U = O.groups;
                        if (h) {
                            var B = w([L], M, D, d);
                            void 0 !== U && x(B, U), C = c(e(n, void 0, B))
                        } else C = p(L, d, D, M, U, n);
                        D >= q && (A += S(d, q, D) + C, q = D + L.length)
                    }
                    return A + S(d, q)
                }]
            }, !!i(function() {
                var e = /./;
                return e.exec = function() {
                    var e = [];
                    return e.groups = {
                        a: "7"
                    }, e
                }, "7" !== "".replace(e, "$<a>")
            }) || !R || T)
        }
    }(), function() {
        if (!nf) {
            nf = 1;
            var e = ab(),
                t = ik(),
                n = ij(),
                r = iO(),
                i = iD(),
                a = iM(),
                o = function() {
                    if (nd) return nc;
                    nd = 1;
                    var e = iM(),
                        t = i_(),
                        n = i2()("match");
                    return nc = function(r) {
                        var i;
                        return e(r) && (void 0 !== (i = r[n]) ? !!i : "RegExp" === t(r))
                    }
                }(),
                s = aP(),
                u = iz(),
                l = aj(),
                c = aq(),
                d = i2(),
                f = iQ(),
                h = d("replace"),
                p = TypeError,
                v = n("".indexOf),
                y = n("".replace),
                m = n("".slice),
                g = Math.max;
            e({
                target: "String",
                proto: !0
            }, {
                replaceAll: function(e, n) {
                    var d, b, w, x, P, S, R, T, E, k = r(this),
                        A = 0,
                        q = "";
                    if (a(e)) {
                        if ((d = o(e)) && !~v(s(r(l(e))), "g")) throw new p("`.replaceAll` does not allow non-global regexes");
                        if (b = u(e, h)) return t(b, e, k, n);
                        if (f && d) return y(s(k), e, n)
                    }
                    for (w = s(k), x = s(e), (P = i(n)) || (n = s(n)), R = g(1, S = x.length), T = v(w, x); - 1 !== T;) E = P ? s(n(x, T, w)) : c(x, w, T, [], void 0, n), q += m(w, A, T) + E, A = T + S, T = T + R > w.length ? -1 : v(w, x, T + R);
                    return A < w.length && (q += m(w, A)), q
                }
            })
        }
    }(), a_()("String", "replaceAll")), nb || (nb = 1, function() {
        if (!ng) {
            ng = 1;
            var e = ab(),
                t = iZ(),
                n = ah(),
                r = ad(),
                i = aI();
            e({
                target: "Array",
                proto: !0
            }, {
                at: function(e) {
                    var i = t(this),
                        a = n(i),
                        o = r(e),
                        s = o >= 0 ? o : a + o;
                    return s < 0 || s >= a ? void 0 : i[s]
                }
            }), i("at")
        }
    }(), a_()("Array", "at")), nx || (nx = 1, function() {
        if (!nw) {
            nw = 1;
            var e = ab(),
                t = ij(),
                n = iO(),
                r = ad(),
                i = aP(),
                a = iR(),
                o = t("".charAt);
            e({
                target: "String",
                proto: !0,
                forced: a(function() {
                    return "\uD842" !== "𠮷".at(-2)
                })
            }, {
                at: function(e) {
                    var t = i(n(this)),
                        a = t.length,
                        s = r(e),
                        u = s >= 0 ? s : a + s;
                    return u < 0 || u >= a ? void 0 : o(t, u)
                }
            })
        }
    }(), a_()("String", "at")), nq || (nq = 1, function() {
        if (!nA) {
            nA = 1;
            var e = ab(),
                t = aO().findLast,
                n = aI();
            e({
                target: "Array",
                proto: !0
            }, {
                findLast: function(e) {
                    return t(this, e, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), n("findLast")
        }
    }(), a_()("Array", "findLast")), n_ || (n_ = 1, function() {
        if (!nj) {
            nj = 1;
            var e = ab(),
                t = aO().findLastIndex,
                n = aI();
            e({
                target: "Array",
                proto: !0
            }, {
                findLastIndex: function(e) {
                    return t(this, e, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), n("findLastIndex")
        }
    }(), a_()("Array", "findLastIndex")), n$ || (n$ = 1, nI || (nI = 1, ab()({
        target: "Object",
        stat: !0,
        sham: !iT()
    }, {
        create: aE()
    })), function() {
        if (!nz) {
            nz = 1;
            var e = ab(),
                t = aL(),
                n = iN(),
                r = ij(),
                i = iK(),
                a = iO(),
                o = i4(),
                s = aN(),
                u = iR(),
                l = Object.groupBy,
                c = n("Object", "create"),
                d = r([].push);
            e({
                target: "Object",
                stat: !0,
                forced: !l || u(function() {
                    return 1 !== l("ab", function(e) {
                        return e
                    }).a.length
                })
            }, {
                groupBy: function(e, n) {
                    a(e), i(n);
                    var r = c(null),
                        u = 0;
                    return s(e, function(e) {
                        var i = o(n(e, u++));
                        i in r ? d(r[i], e) : t(r, i, [e])
                    }), r
                }
            })
        }
    }(), aU().Object.groupBy);
    var aX = {
            exports: {}
        },
        aQ = {};

    function a$() {
        if (rA) return aX.exports;
        rA = 1;
        var e = ab(),
            t = ij(),
            n = ao(),
            r = iM(),
            i = i0(),
            a = ae().f,
            o = ay(),
            s = function() {
                if (rx) return aQ;
                rx = 1;
                var e = i_(),
                    t = iL(),
                    n = ay().f,
                    r = rw ? rb : (rw = 1, rb = ij()([].slice)),
                    i = window && Object.getOwnPropertyNames ? Object.getOwnPropertyNames(window) : [],
                    a = function(e) {
                        try {
                            return n(e)
                        } catch (e) {
                            return r(i)
                        }
                    };
                return aQ.f = function(r) {
                    return i && "Window" === e(r) ? a(r) : n(t(r))
                }, aQ
            }(),
            u = function() {
                if (rT) return rR;
                rT = 1;
                var e = iR(),
                    t = iM(),
                    n = i_(),
                    r = rS ? rP : (rS = 1, rP = iR()(function() {
                        if ("function" == typeof ArrayBuffer) {
                            var e = new ArrayBuffer(8);
                            Object.isExtensible(e) && Object.defineProperty(e, "a", {
                                value: 8
                            })
                        }
                    })),
                    i = Object.isExtensible;
                return rR = e(function() {}) || r ? function(e) {
                    return !!t(e) && (!r || "ArrayBuffer" !== n(e)) && (!i || i(e))
                } : i
            }(),
            l = i1(),
            c = rk ? rE : (rk = 1, rE = !iR()(function() {
                return Object.isExtensible(Object.preventExtensions({}))
            })),
            d = !1,
            f = l("meta"),
            h = 0,
            p = function(e) {
                a(e, f, {
                    value: {
                        objectID: "O" + h++,
                        weakData: {}
                    }
                })
            },
            v = aX.exports = {
                enable: function() {
                    v.enable = function() {}, d = !0;
                    var n = o.f,
                        r = t([].splice),
                        i = {};
                    i[f] = 1, n(i).length && (o.f = function(e) {
                        for (var t = n(e), i = 0, a = t.length; i < a; i++)
                            if (t[i] === f) {
                                r(t, i, 1);
                                break
                            } return t
                    }, e({
                        target: "Object",
                        stat: !0,
                        forced: !0
                    }, {
                        getOwnPropertyNames: s.f
                    }))
                },
                fastKey: function(e, t) {
                    if (!r(e)) return "symbol" == typeof e ? e : ("string" == typeof e ? "S" : "P") + e;
                    if (!i(e, f)) {
                        if (!u(e)) return "F";
                        if (!t) return "E";
                        p(e)
                    }
                    return e[f].objectID
                },
                getWeakData: function(e, t) {
                    if (!i(e, f)) {
                        if (!u(e)) return !0;
                        if (!t) return !1;
                        p(e)
                    }
                    return e[f].weakData
                },
                onFreeze: function(e) {
                    return c && d && u(e) && !i(e, f) && p(e), e
                }
            };
        return n[f] = !0, aX.exports
    }

    function aY() {
        if (rj) return rq;
        rj = 1;
        var e = iU(),
            t = TypeError;
        return rq = function(n, r) {
            if (e(r, n)) return n;
            throw new t("Incorrect invocation")
        }
    }

    function aJ() {
        if (rO) return rC;
        rO = 1;
        var e = iD(),
            t = iM(),
            n = aW();
        return rC = function(r, i, a) {
            var o, s;
            return n && e(o = i.constructor) && o !== a && t(s = o.prototype) && s !== a.prototype && n(r, s), r
        }
    }

    function aZ() {
        if (rD) return rL;
        rD = 1;
        var e = ab(),
            t = iP(),
            n = ij(),
            r = ag(),
            i = al(),
            a = a$(),
            o = aN(),
            s = aY(),
            u = iD(),
            l = iC(),
            c = iM(),
            d = iR(),
            f = function() {
                if (rI) return r_;
                rI = 1;
                var e = i2()("iterator"),
                    t = !1;
                try {
                    var n = 0,
                        r = {
                            next: function() {
                                return {
                                    done: !!n++
                                }
                            },
                            return: function() {
                                t = !0
                            }
                        };
                    r[e] = function() {
                        return this
                    }, Array.from(r, function() {
                        throw 2
                    })
                } catch (e) {}
                return r_ = function(n, r) {
                    try {
                        if (!r && !t) return !1
                    } catch (e) {
                        return !1
                    }
                    var i = !1;
                    try {
                        var a = {};
                        a[e] = function() {
                            return {
                                next: function() {
                                    return {
                                        done: i = !0
                                    }
                                }
                            }
                        }, n(a)
                    } catch (e) {}
                    return i
                }
            }(),
            h = aG(),
            p = aJ();
        return rL = function(v, y, m) {
            var g = -1 !== v.indexOf("Map"),
                b = -1 !== v.indexOf("Weak"),
                w = g ? "set" : "add",
                x = t[v],
                P = x && x.prototype,
                S = x,
                R = {},
                T = function(e) {
                    var t = n(P[e]);
                    i(P, e, "add" === e ? function(e) {
                        return t(this, 0 === e ? 0 : e), this
                    } : "delete" === e ? function(e) {
                        return (!b || !!c(e)) && t(this, 0 === e ? 0 : e)
                    } : "get" === e ? function(e) {
                        return b && !c(e) ? void 0 : t(this, 0 === e ? 0 : e)
                    } : "has" === e ? function(e) {
                        return (!b || !!c(e)) && t(this, 0 === e ? 0 : e)
                    } : function(e, n) {
                        return t(this, 0 === e ? 0 : e, n), this
                    })
                };
            if (r(v, !u(x) || !(b || P.forEach && !d(function() {
                    new x().entries().next()
                })))) S = m.getConstructor(y, v, g, w), a.enable();
            else if (r(v, !0)) {
                var E = new S,
                    k = E[w](b ? {} : -0, 1) !== E,
                    A = d(function() {
                        E.has(1)
                    }),
                    q = f(function(e) {
                        new x(e)
                    }),
                    j = !b && d(function() {
                        for (var e = new x, t = 5; t--;) e[w](t, t);
                        return !e.has(-0)
                    });
                q || ((S = y(function(e, t) {
                    s(e, P);
                    var n = p(new x, e, S);
                    return l(t) || o(t, n[w], {
                        that: n,
                        AS_ENTRIES: g
                    }), n
                })).prototype = P, P.constructor = S), (A || j) && (T("delete"), T("has"), g && T("get")), (j || k) && T(w), b && P.clear && delete P.clear
            }
            return R[v] = S, e({
                global: !0,
                constructor: !0,
                forced: S !== x
            }, R), h(S, v), b || m.setStrong(S, v, g), S
        }
    }

    function a0() {
        if (rN) return rM;
        rN = 1;
        var e = au(),
            t = ae();
        return rM = function(n, r, i) {
            return i.get && e(i.get, r, {
                getter: !0
            }), i.set && e(i.set, r, {
                setter: !0
            }), t.f(n, r, i)
        }
    }

    function a1() {
        if (rG) return rV;
        rG = 1;
        var e = aE(),
            t = a0(),
            n = function() {
                if (rB) return rU;
                rB = 1;
                var e = al();
                return rU = function(t, n, r) {
                    for (var i in n) e(t, i, n[i], r);
                    return t
                }
            }(),
            r = aC(),
            i = aY(),
            a = iC(),
            o = aN(),
            s = aK(),
            u = az(),
            l = function() {
                if (rH) return rF;
                rH = 1;
                var e = iN(),
                    t = a0(),
                    n = i2(),
                    r = iT(),
                    i = n("species");
                return rF = function(n) {
                    var a = e(n);
                    r && a && !a[i] && t(a, i, {
                        configurable: !0,
                        get: function() {
                            return this
                        }
                    })
                }
            }(),
            c = iT(),
            d = a$().fastKey,
            f = as(),
            h = f.set,
            p = f.getterFor;
        return rV = {
            getConstructor: function(s, u, l, f) {
                var v = s(function(t, n) {
                        i(t, y), h(t, {
                            type: u,
                            index: e(null),
                            first: null,
                            last: null,
                            size: 0
                        }), c || (t.size = 0), a(n) || o(n, t[f], {
                            that: t,
                            AS_ENTRIES: l
                        })
                    }),
                    y = v.prototype,
                    m = p(u),
                    g = function(e, t, n) {
                        var r, i, a = m(e),
                            o = b(e, t);
                        return o ? o.value = n : (a.last = o = {
                            index: i = d(t, !0),
                            key: t,
                            value: n,
                            previous: r = a.last,
                            next: null,
                            removed: !1
                        }, a.first || (a.first = o), r && (r.next = o), c ? a.size++ : e.size++, "F" !== i && (a.index[i] = o)), e
                    },
                    b = function(e, t) {
                        var n, r = m(e),
                            i = d(t);
                        if ("F" !== i) return r.index[i];
                        for (n = r.first; n; n = n.next)
                            if (n.key === t) return n
                    };
                return n(y, {
                    clear: function() {
                        for (var t = m(this), n = t.first; n;) n.removed = !0, n.previous && (n.previous = n.previous.next = null), n = n.next;
                        t.first = t.last = null, t.index = e(null), c ? t.size = 0 : this.size = 0
                    },
                    delete: function(e) {
                        var t = m(this),
                            n = b(this, e);
                        if (n) {
                            var r = n.next,
                                i = n.previous;
                            delete t.index[n.index], n.removed = !0, i && (i.next = r), r && (r.previous = i), t.first === n && (t.first = r), t.last === n && (t.last = i), c ? t.size-- : this.size--
                        }
                        return !!n
                    },
                    forEach: function(e) {
                        for (var t, n = m(this), i = r(e, arguments.length > 1 ? arguments[1] : void 0); t = t ? t.next : n.first;)
                            for (i(t.value, t.key, this); t && t.removed;) t = t.previous
                    },
                    has: function(e) {
                        return !!b(this, e)
                    }
                }), n(y, l ? {
                    get: function(e) {
                        var t = b(this, e);
                        return t && t.value
                    },
                    set: function(e, t) {
                        return g(this, 0 === e ? 0 : e, t)
                    }
                } : {
                    add: function(e) {
                        return g(this, e = 0 === e ? 0 : e, e)
                    }
                }), c && t(y, "size", {
                    configurable: !0,
                    get: function() {
                        return m(this).size
                    }
                }), v
            },
            setStrong: function(e, t, n) {
                var r = t + " Iterator",
                    i = p(t),
                    a = p(r);
                s(e, t, function(e, t) {
                    h(this, {
                        type: r,
                        target: e,
                        state: i(e),
                        kind: t,
                        last: null
                    })
                }, function() {
                    for (var e = a(this), t = e.kind, n = e.last; n && n.removed;) n = n.previous;
                    return e.target && (e.last = n = n ? n.next : e.state.first) ? "keys" === t ? u(n.key, !1) : "values" === t ? u(n.value, !1) : u([n.key, n.value], !1) : (e.target = null, u(void 0, !0))
                }, n ? "entries" : "values", !n, !0), l(t)
            }
        }
    }

    function a2() {
        if (r$) return rQ;
        r$ = 1;
        var e = iP(),
            t = iB(),
            n = i_(),
            r = function(e) {
                return t.slice(0, e.length) === e
            };
        return rQ = r("Bun/") ? "BUN" : r("Cloudflare-Workers") ? "CLOUDFLARE" : r("Deno/") ? "DENO" : r("Node.js/") ? "NODE" : e.Bun && "string" == typeof Bun.version ? "BUN" : e.Deno && "object" == typeof Deno.version ? "DENO" : "process" === n(e.process) ? "NODE" : e.window && e.document ? "BROWSER" : "REST"
    }

    function a4() {
        if (r0) return rZ;
        r0 = 1;
        var e = iP(),
            t = rJ ? rY : (rJ = 1, rY = "NODE" === a2());
        return rZ = function(n) {
            if (t) {
                try {
                    return e.process.getBuiltinModule(n)
                } catch (e) {}
                try {
                    return Function('return require("' + n + '")')()
                } catch (e) {}
            }
        }
    }

    function a3() {
        return r2 ? r1 : (r2 = 1, r1 = {
            IndexSizeError: {
                s: "INDEX_SIZE_ERR",
                c: 1,
                m: 1
            },
            DOMStringSizeError: {
                s: "DOMSTRING_SIZE_ERR",
                c: 2,
                m: 0
            },
            HierarchyRequestError: {
                s: "HIERARCHY_REQUEST_ERR",
                c: 3,
                m: 1
            },
            WrongDocumentError: {
                s: "WRONG_DOCUMENT_ERR",
                c: 4,
                m: 1
            },
            InvalidCharacterError: {
                s: "INVALID_CHARACTER_ERR",
                c: 5,
                m: 1
            },
            NoDataAllowedError: {
                s: "NO_DATA_ALLOWED_ERR",
                c: 6,
                m: 0
            },
            NoModificationAllowedError: {
                s: "NO_MODIFICATION_ALLOWED_ERR",
                c: 7,
                m: 1
            },
            NotFoundError: {
                s: "NOT_FOUND_ERR",
                c: 8,
                m: 1
            },
            NotSupportedError: {
                s: "NOT_SUPPORTED_ERR",
                c: 9,
                m: 1
            },
            InUseAttributeError: {
                s: "INUSE_ATTRIBUTE_ERR",
                c: 10,
                m: 1
            },
            InvalidStateError: {
                s: "INVALID_STATE_ERR",
                c: 11,
                m: 1
            },
            SyntaxError: {
                s: "SYNTAX_ERR",
                c: 12,
                m: 1
            },
            InvalidModificationError: {
                s: "INVALID_MODIFICATION_ERR",
                c: 13,
                m: 1
            },
            NamespaceError: {
                s: "NAMESPACE_ERR",
                c: 14,
                m: 1
            },
            InvalidAccessError: {
                s: "INVALID_ACCESS_ERR",
                c: 15,
                m: 1
            },
            ValidationError: {
                s: "VALIDATION_ERR",
                c: 16,
                m: 0
            },
            TypeMismatchError: {
                s: "TYPE_MISMATCH_ERR",
                c: 17,
                m: 1
            },
            SecurityError: {
                s: "SECURITY_ERR",
                c: 18,
                m: 1
            },
            NetworkError: {
                s: "NETWORK_ERR",
                c: 19,
                m: 1
            },
            AbortError: {
                s: "ABORT_ERR",
                c: 20,
                m: 1
            },
            URLMismatchError: {
                s: "URL_MISMATCH_ERR",
                c: 21,
                m: 1
            },
            QuotaExceededError: {
                s: "QUOTA_EXCEEDED_ERR",
                c: 22,
                m: 1
            },
            TimeoutError: {
                s: "TIMEOUT_ERR",
                c: 23,
                m: 1
            },
            InvalidNodeTypeError: {
                s: "INVALID_NODE_TYPE_ERR",
                c: 24,
                m: 1
            },
            DataCloneError: {
                s: "DATA_CLONE_ERR",
                c: 25,
                m: 1
            }
        })
    }

    function a6() {
        if (r3) return r4;
        r3 = 1;
        var e = ij(),
            t = Error,
            n = e("".replace),
            r = String(new t("zxcasd").stack),
            i = /\n\s*at [^:]*:[^\n]*/,
            a = i.test(r);
        return r4 = function(e, r) {
            if (a && "string" == typeof e && !t.prepareStackTrace)
                for (; r--;) e = n(e, i, "");
            return e
        }
    }

    function a8() {
        if (io) return ia;
        io = 1;
        var e = ij(),
            t = Set.prototype;
        return ia = {
            Set: Set,
            add: e(t.add),
            has: e(t.has),
            remove: e(t.delete),
            proto: t
        }
    }

    function a5() {
        if (ih) return id;
        ih = 1;
        var e = iP(),
            t = iR(),
            n = iF(),
            r = a2(),
            i = e.structuredClone;
        return id = !!i && !t(function() {
            if ("DENO" === r && n > 92 || "NODE" === r && n > 94 || "BROWSER" === r && n > 97) return !1;
            var e = new ArrayBuffer(8),
                t = i(e, {
                    transfer: [e]
                });
            return 0 !== e.byteLength || 8 !== t.byteLength
        })
    }

    function a7(e) {
        var t = this.constructor;
        return this.then(function(n) {
            return t.resolve(e()).then(function() {
                return n
            })
        }, function(n) {
            return t.resolve(e()).then(function() {
                return t.reject(n)
            })
        })
    }

    function a9(e) {
        return new this(function(t, n) {
            if (!(e && void 0 !== e.length)) return n(TypeError(typeof e + " " + e + " is not iterable(cannot read property Symbol(Symbol.iterator))"));
            var r = Array.prototype.slice.call(e);
            if (0 === r.length) return t([]);
            for (var i = r.length, a = 0; a < r.length; a++) ! function e(n, a) {
                if (a && ("object" == typeof a || "function" == typeof a)) {
                    var o = a.then;
                    if ("function" == typeof o) return void o.call(a, function(t) {
                        e(n, t)
                    }, function(e) {
                        r[n] = {
                            status: "rejected",
                            reason: e
                        }, 0 == --i && t(r)
                    })
                }
                r[n] = {
                    status: "fulfilled",
                    value: a
                }, 0 == --i && t(r)
            }(a, r[a])
        })
    }

    function oe(e, t) {
        this.name = "AggregateError", this.errors = e, this.message = t || ""
    }

    function ot(e) {
        var t = this;
        return new t(function(n, r) {
            if (!(e && void 0 !== e.length)) return r(TypeError("Promise.any accepts an array"));
            var i = Array.prototype.slice.call(e);
            if (0 === i.length) return r();
            for (var a = [], o = 0; o < i.length; o++) try {
                t.resolve(i[o]).then(n).catch(function(e) {
                    a.push(e), a.length === i.length && r(new oe(a, "All promises were rejected"))
                })
            } catch (e) {
                r(e)
            }
        })
    }
    ib || (ib = 1, function() {
        if (!n1) {
            n1 = 1;
            var e = al(),
                t = aF(),
                n = Error.prototype;
            n.toString !== t && e(n, "toString", t)
        }
    }(), function() {
        if (!rp) {
            rp = 1;
            var e = iL(),
                t = aI(),
                n = aD(),
                r = as(),
                i = ae().f,
                a = aK(),
                o = az(),
                s = iQ(),
                u = iT(),
                l = "Array Iterator",
                c = r.set,
                d = r.getterFor(l);
            a(Array, "Array", function(t, n) {
                c(this, {
                    type: l,
                    target: e(t),
                    index: 0,
                    kind: n
                })
            }, function() {
                var e = d(this),
                    t = e.target,
                    n = e.index++;
                if (!t || n >= t.length) return e.target = null, o(void 0, !0);
                switch (e.kind) {
                    case "keys":
                        return o(n, !1);
                    case "values":
                        return o(t[n], !1)
                }
                return o([n, t[n]], !1)
            }, "values");
            var f = n.Arguments = n.Array;
            if (t("keys"), t("values"), t("entries"), !s && u && "values" !== f.name) try {
                i(f, "name", {
                    value: "values"
                })
            } catch (e) {}
        }
    }(), function() {
        if (!rv) {
            rv = 1;
            var e = ab(),
                t = iZ(),
                n = aT();
            e({
                target: "Object",
                stat: !0,
                forced: iR()(function() {
                    n(1)
                })
            }, {
                keys: function(e) {
                    return n(t(e))
                }
            })
        }
    }(), function() {
        if (!rg) {
            rg = 1;
            var e = aw(),
                t = al(),
                n = function() {
                    if (rm) return ry;
                    rm = 1;
                    var e = aw(),
                        t = ax();
                    return ry = e ? ({}).toString : function() {
                        return "[object " + t(this) + "]"
                    }
                }();
            e || t(Object.prototype, "toString", n, {
                unsafe: !0
            })
        }
    }(), rK || (rK = 1, rW || (rW = 1, aZ()("Map", function(e) {
        return function() {
            return e(this, arguments.length ? arguments[0] : void 0)
        }
    }, a1()))), rX || (rX = 1, rz || (rz = 1, aZ()("Set", function(e) {
        return function() {
            return e(this, arguments.length ? arguments[0] : void 0)
        }
    }, a1()))), function() {
        if (!r6) {
            r6 = 1;
            var e = ab(),
                t = iN(),
                n = a4(),
                r = iR(),
                i = aE(),
                a = iq(),
                o = ae().f,
                s = al(),
                u = a0(),
                l = i0(),
                c = aY(),
                d = i9(),
                f = aF(),
                h = aB(),
                p = a3(),
                v = a6(),
                y = as(),
                m = iT(),
                g = iQ(),
                b = "DOMException",
                w = "DATA_CLONE_ERR",
                x = t("Error"),
                P = t(b) || function() {
                    try {
                        new(t("MessageChannel") || n("worker_threads").MessageChannel)().port1.postMessage(new WeakMap)
                    } catch (e) {
                        if (e.name === w && 25 === e.code) return e.constructor
                    }
                }(),
                S = P && P.prototype,
                R = x.prototype,
                T = y.set,
                E = y.getterFor(b),
                k = "stack" in new x(b),
                A = function(e) {
                    return l(p, e) && p[e].m ? p[e].c : 0
                },
                q = function() {
                    c(this, j);
                    var e = arguments.length,
                        t = h(e < 1 ? void 0 : arguments[0]),
                        n = h(e < 2 ? void 0 : arguments[1], "Error"),
                        r = A(n);
                    if (T(this, {
                            type: b,
                            name: n,
                            message: t,
                            code: r
                        }), m || (this.name = n, this.message = t, this.code = r), k) {
                        var i = new x(t);
                        i.name = b, o(this, "stack", a(1, v(i.stack, 1)))
                    }
                },
                j = q.prototype = i(R),
                _ = function(e) {
                    return {
                        enumerable: !0,
                        configurable: !0,
                        get: e
                    }
                },
                I = function(e) {
                    return _(function() {
                        return E(this)[e]
                    })
                };
            m && (u(j, "code", I("code")), u(j, "message", I("message")), u(j, "name", I("name"))), o(j, "constructor", a(1, q));
            var C = r(function() {
                    return !(new P instanceof x)
                }),
                O = C || r(function() {
                    return R.toString !== f || "2: 1" !== String(new P(1, 2))
                }),
                L = C || r(function() {
                    return 25 !== new P(1, "DataCloneError").code
                }),
                D = C || 25 !== P[w] || 25 !== S[w],
                M = g ? O || L || D : C;
            e({
                global: !0,
                constructor: !0,
                forced: M
            }, {
                DOMException: M ? q : P
            });
            var N = t(b),
                U = N.prototype;
            for (var B in O && (g || P === N) && s(U, "toString", f), L && m && P === N && u(U, "code", _(function() {
                    return A(d(this).name)
                })), p)
                if (l(p, B)) {
                    var F = p[B],
                        H = F.s,
                        V = a(6, F.c);
                    l(N, H) || o(N, H, V), l(U, H) || o(U, H, V)
                }
        }
    }(), function() {
        if (!r8) {
            r8 = 1;
            var e = ab(),
                t = iP(),
                n = iN(),
                r = iq(),
                i = ae().f,
                a = i0(),
                o = aY(),
                s = aJ(),
                u = aB(),
                l = a3(),
                c = a6(),
                d = iT(),
                f = iQ(),
                h = "DOMException",
                p = n("Error"),
                v = n(h),
                y = function() {
                    o(this, m);
                    var e = arguments.length,
                        t = u(e < 1 ? void 0 : arguments[0]),
                        n = u(e < 2 ? void 0 : arguments[1], "Error"),
                        a = new v(t, n),
                        l = new p(t);
                    return l.name = h, i(a, "stack", r(1, c(l.stack, 1))), s(a, this, y), a
                },
                m = y.prototype = v.prototype,
                g = "stack" in new p(h),
                b = "stack" in new v(1, 2),
                w = v && d && Object.getOwnPropertyDescriptor(t, h),
                x = !!w && !(w.writable && w.configurable),
                P = g && !x && !b;
            e({
                global: !0,
                constructor: !0,
                forced: f || P
            }, {
                DOMException: P ? y : v
            });
            var S = n(h),
                R = S.prototype;
            if (R.constructor !== S) {
                for (var T in f || i(R, "constructor", r(1, S)), l)
                    if (a(l, T)) {
                        var E = l[T],
                            k = E.s;
                        a(S, k) || i(S, k, r(6, E.c))
                    }
            }
        }
    }(), function() {
        if (!r5) {
            r5 = 1;
            var e = iN(),
                t = aG(),
                n = "DOMException";
            t(e(n), n)
        }
    }(), function() {
        if (!ig) {
            ig = 1;
            var e = iQ(),
                t = ab(),
                n = iP(),
                r = iN(),
                i = ij(),
                a = iR(),
                o = i1(),
                s = iD(),
                u = function() {
                    if (r9) return r7;
                    r9 = 1;
                    var e = ij(),
                        t = iR(),
                        n = iD(),
                        r = ax(),
                        i = iN(),
                        a = ai(),
                        o = function() {},
                        s = i("Reflect", "construct"),
                        u = /^\s*(?:class|function)\b/,
                        l = e(u.exec),
                        c = !u.test(o),
                        d = function(e) {
                            if (!n(e)) return !1;
                            try {
                                return s(o, [], e), !0
                            } catch (e) {
                                return !1
                            }
                        },
                        f = function(e) {
                            if (!n(e)) return !1;
                            switch (r(e)) {
                                case "AsyncFunction":
                                case "GeneratorFunction":
                                case "AsyncGeneratorFunction":
                                    return !1
                            }
                            try {
                                return c || !!l(u, a(e))
                            } catch (e) {
                                return !0
                            }
                        };
                    return f.sham = !0, r7 = !s || t(function() {
                        var e;
                        return d(d.call) || !d(Object) || !d(function() {
                            e = !0
                        }) || e
                    }) ? f : d
                }(),
                l = iC(),
                c = iM(),
                d = iG(),
                f = aN(),
                h = i9(),
                p = ax(),
                v = i0(),
                y = aL(),
                m = at(),
                g = ah(),
                b = function() {
                    if (it) return ie;
                    it = 1;
                    var e = TypeError;
                    return ie = function(t, n) {
                        if (t < n) throw new e("Not enough arguments");
                        return t
                    }
                }(),
                w = aj(),
                x = function() {
                    if (ii) return ir;
                    ii = 1;
                    var e = ij(),
                        t = Map.prototype;
                    return ir = {
                        Map: Map,
                        set: e(t.set),
                        get: e(t.get),
                        has: e(t.has),
                        remove: e(t.delete),
                        proto: t
                    }
                }(),
                P = a8(),
                S = function() {
                    if (ic) return il;
                    ic = 1;
                    var e = ij(),
                        t = function() {
                            if (iu) return is;
                            iu = 1;
                            var e = ik();
                            return is = function(t, n, r) {
                                for (var i, a, o = r ? t : t.iterator, s = t.next; !(i = e(s, o)).done;)
                                    if (void 0 !== (a = n(i.value))) return a
                            }
                        }(),
                        n = a8(),
                        r = n.Set,
                        i = n.proto,
                        a = e(i.forEach),
                        o = e(i.keys),
                        s = o(new r).next;
                    return il = function(e, n, r) {
                        return r ? t({
                            iterator: o(e),
                            next: s
                        }, n) : a(e, n)
                    }
                }(),
                R = function() {
                    if (iv) return ip;
                    iv = 1;
                    var e, t, n, r, i = iP(),
                        a = a4(),
                        o = a5(),
                        s = i.structuredClone,
                        u = i.ArrayBuffer,
                        l = i.MessageChannel,
                        c = !1;
                    if (o) c = function(e) {
                        s(e, {
                            transfer: [e]
                        })
                    };
                    else if (u) try {
                        !l && (e = a("worker_threads")) && (l = e.MessageChannel), l && (t = new l, n = new u(2), r = function(e) {
                            t.port1.postMessage(null, [e])
                        }, 2 === n.byteLength && (r(n), 0 === n.byteLength && (c = r)))
                    } catch (e) {}
                    return ip = c
                }(),
                T = function() {
                    if (im) return iy;
                    im = 1;
                    var e = iR(),
                        t = iq();
                    return iy = !e(function() {
                        var e = Error("a");
                        return !("stack" in e) || (Object.defineProperty(e, "stack", t(1, 7)), 7 !== e.stack)
                    })
                }(),
                E = a5(),
                k = n.Object,
                A = n.Array,
                q = n.Date,
                j = n.Error,
                _ = n.TypeError,
                I = n.PerformanceMark,
                C = r("DOMException"),
                O = x.Map,
                L = x.has,
                D = x.get,
                M = x.set,
                N = P.Set,
                U = P.add,
                B = P.has,
                F = r("Object", "keys"),
                H = i([].push),
                V = i((!0).valueOf),
                G = i(1.1.valueOf),
                W = i("".valueOf),
                K = i(q.prototype.getTime),
                z = o("structuredClone"),
                X = "DataCloneError",
                Q = "Transferring",
                $ = function(e) {
                    return !a(function() {
                        var t = new n.Set([7]),
                            r = e(t),
                            i = e(k(7));
                        return r === t || !r.has(7) || !c(i) || 7 != +i
                    }) && e
                },
                Y = function(e, t) {
                    return !a(function() {
                        var n = new t,
                            r = e({
                                a: n,
                                b: n
                            });
                        return !(r && r.a === r.b && r.a instanceof t && r.a.stack === n.stack)
                    })
                },
                J = n.structuredClone,
                Z = e || !Y(J, j) || !Y(J, C) || !!a(function() {
                    var e = J(new n.AggregateError([1], z, {
                        cause: 3
                    }));
                    return "AggregateError" !== e.name || 1 !== e.errors[0] || e.message !== z || 3 !== e.cause
                }),
                ee = !J && $(function(e) {
                    return new I(z, {
                        detail: e
                    }).detail
                }),
                et = $(J) || ee,
                en = function(e) {
                    throw new C("Uncloneable type: " + e, X)
                },
                er = function(e, t) {
                    throw new C((t || "Cloning") + " of " + e + " cannot be properly polyfilled in this engine", X)
                },
                ei = function(e, t) {
                    return et || er(t), et(e)
                },
                ea = function() {
                    var e;
                    try {
                        e = new n.DataTransfer
                    } catch (t) {
                        try {
                            e = new n.ClipboardEvent("").clipboardData
                        } catch (e) {}
                    }
                    return e && e.items && e.files ? e : null
                },
                eo = function(e, t, r) {
                    if (L(t, e)) return D(t, e);
                    if ("SharedArrayBuffer" === (r || p(e))) i = et ? et(e) : e;
                    else {
                        var i, a, o, u, l, c, d = n.DataView;
                        d || s(e.slice) || er("ArrayBuffer");
                        try {
                            if (s(e.slice) && !e.resizable) i = e.slice(0);
                            else
                                for (a = e.byteLength, o = ("maxByteLength" in e) ? {
                                        maxByteLength: e.maxByteLength
                                    } : void 0, i = new ArrayBuffer(a, o), u = new d(e), l = new d(i), c = 0; c < a; c++) l.setUint8(c, u.getUint8(c))
                        } catch (e) {
                            throw new C("ArrayBuffer is detached", X)
                        }
                    }
                    return M(t, e, i), i
                },
                es = function(e, t, r, i, a) {
                    var o = n[t];
                    return c(o) || er(t), new o(eo(e.buffer, a), r, i)
                },
                eu = function(e, t) {
                    if (d(e) && en("Symbol"), !c(e)) return e;
                    if (t) {
                        if (L(t, e)) return D(t, e)
                    } else t = new O;
                    var i, a, o, u, l, f, h, b, x = p(e);
                    switch (x) {
                        case "Array":
                            o = A(g(e));
                            break;
                        case "Object":
                            o = {};
                            break;
                        case "Map":
                            o = new O;
                            break;
                        case "Set":
                            o = new N;
                            break;
                        case "RegExp":
                            o = new RegExp(e.source, w(e));
                            break;
                        case "Error":
                            switch (a = e.name) {
                                case "AggregateError":
                                    o = new(r(a))([]);
                                    break;
                                case "EvalError":
                                case "RangeError":
                                case "ReferenceError":
                                case "SuppressedError":
                                case "SyntaxError":
                                case "TypeError":
                                case "URIError":
                                    o = new(r(a));
                                    break;
                                case "CompileError":
                                case "LinkError":
                                case "RuntimeError":
                                    o = new(r("WebAssembly", a));
                                    break;
                                default:
                                    o = new j
                            }
                            break;
                        case "DOMException":
                            o = new C(e.message, e.name);
                            break;
                        case "ArrayBuffer":
                        case "SharedArrayBuffer":
                            o = eo(e, t, x);
                            break;
                        case "DataView":
                        case "Int8Array":
                        case "Uint8Array":
                        case "Uint8ClampedArray":
                        case "Int16Array":
                        case "Uint16Array":
                        case "Int32Array":
                        case "Uint32Array":
                        case "Float16Array":
                        case "Float32Array":
                        case "Float64Array":
                        case "BigInt64Array":
                        case "BigUint64Array":
                            f = "DataView" === x ? e.byteLength : e.length, o = es(e, x, e.byteOffset, f, t);
                            break;
                        case "DOMQuad":
                            try {
                                o = new DOMQuad(eu(e.p1, t), eu(e.p2, t), eu(e.p3, t), eu(e.p4, t))
                            } catch (t) {
                                o = ei(e, x)
                            }
                            break;
                        case "File":
                            if (et) try {
                                o = et(e), p(o) !== x && (o = void 0)
                            } catch (e) {}
                            if (!o) try {
                                o = new File([e], e.name, e)
                            } catch (e) {}
                            o || er(x);
                            break;
                        case "FileList":
                            if (u = ea()) {
                                for (l = 0, f = g(e); l < f; l++) u.items.add(eu(e[l], t));
                                o = u.files
                            } else o = ei(e, x);
                            break;
                        case "ImageData":
                            try {
                                o = new ImageData(eu(e.data, t), e.width, e.height, {
                                    colorSpace: e.colorSpace
                                })
                            } catch (t) {
                                o = ei(e, x)
                            }
                            break;
                        default:
                            if (et) o = et(e);
                            else switch (x) {
                                case "BigInt":
                                    o = k(e.valueOf());
                                    break;
                                case "Boolean":
                                    o = k(V(e));
                                    break;
                                case "Number":
                                    o = k(G(e));
                                    break;
                                case "String":
                                    o = k(W(e));
                                    break;
                                case "Date":
                                    o = new q(K(e));
                                    break;
                                case "Blob":
                                    try {
                                        o = e.slice(0, e.size, e.type)
                                    } catch (e) {
                                        er(x)
                                    }
                                    break;
                                case "DOMPoint":
                                case "DOMPointReadOnly":
                                    i = n[x];
                                    try {
                                        o = i.fromPoint ? i.fromPoint(e) : new i(e.x, e.y, e.z, e.w)
                                    } catch (e) {
                                        er(x)
                                    }
                                    break;
                                case "DOMRect":
                                case "DOMRectReadOnly":
                                    i = n[x];
                                    try {
                                        o = i.fromRect ? i.fromRect(e) : new i(e.x, e.y, e.width, e.height)
                                    } catch (e) {
                                        er(x)
                                    }
                                    break;
                                case "DOMMatrix":
                                case "DOMMatrixReadOnly":
                                    i = n[x];
                                    try {
                                        o = i.fromMatrix ? i.fromMatrix(e) : new i(e)
                                    } catch (e) {
                                        er(x)
                                    }
                                    break;
                                case "AudioData":
                                case "VideoFrame":
                                    s(e.clone) || er(x);
                                    try {
                                        o = e.clone()
                                    } catch (e) {
                                        en(x)
                                    }
                                    break;
                                case "CropTarget":
                                case "CryptoKey":
                                case "FileSystemDirectoryHandle":
                                case "FileSystemFileHandle":
                                case "FileSystemHandle":
                                case "GPUCompilationInfo":
                                case "GPUCompilationMessage":
                                case "ImageBitmap":
                                case "RTCCertificate":
                                case "WebAssembly.Module":
                                    er(x);
                                default:
                                    en(x)
                            }
                    }
                    switch (M(t, e, o), x) {
                        case "Array":
                        case "Object":
                            for (l = 0, f = g(h = F(e)); l < f; l++) b = h[l], y(o, b, eu(e[b], t));
                            break;
                        case "Map":
                            e.forEach(function(e, n) {
                                M(o, eu(n, t), eu(e, t))
                            });
                            break;
                        case "Set":
                            e.forEach(function(e) {
                                U(o, eu(e, t))
                            });
                            break;
                        case "Error":
                            m(o, "message", eu(e.message, t)), v(e, "cause") && m(o, "cause", eu(e.cause, t)), "AggregateError" === a ? o.errors = eu(e.errors, t) : "SuppressedError" === a && (o.error = eu(e.error, t), o.suppressed = eu(e.suppressed, t));
                        case "DOMException":
                            T && m(o, "stack", eu(e.stack, t))
                    }
                    return o
                },
                el = function(e, t) {
                    if (!c(e)) throw new _("Transfer option cannot be converted to a sequence");
                    var r, i, a, o, l, d = [];
                    f(e, function(e) {
                        H(d, h(e))
                    });
                    for (var v = 0, y = g(d), m = new N; v < y;) {
                        if (i = p(r = d[v++]), o = void 0, "ArrayBuffer" === i ? B(m, r) : L(t, r)) throw new C("Duplicate transferable", X);
                        if ("ArrayBuffer" === i) {
                            U(m, r);
                            continue
                        }
                        if (E) o = J(r, {
                            transfer: [r]
                        });
                        else switch (i) {
                            case "ImageBitmap":
                                u(a = n.OffscreenCanvas) || er(i, Q);
                                try {
                                    (l = new a(r.width, r.height)).getContext("bitmaprenderer").transferFromImageBitmap(r), o = l.transferToImageBitmap()
                                } catch (e) {}
                                break;
                            case "AudioData":
                            case "VideoFrame":
                                s(r.clone) && s(r.close) || er(i, Q);
                                try {
                                    o = r.clone(), r.close()
                                } catch (e) {}
                                break;
                            case "MediaSourceHandle":
                            case "MessagePort":
                            case "MIDIAccess":
                            case "OffscreenCanvas":
                            case "ReadableStream":
                            case "RTCDataChannel":
                            case "TransformStream":
                            case "WebTransportReceiveStream":
                            case "WebTransportSendStream":
                            case "WritableStream":
                                er(i, Q)
                        }
                        if (void 0 === o) throw new C("This object cannot be transferred: " + i, X);
                        M(t, r, o)
                    }
                    return m
                },
                ec = function(e) {
                    S(e, function(e) {
                        E ? J(e, {
                            transfer: [e]
                        }) : s(e.transfer) ? e.transfer() : R ? R(e) : er("ArrayBuffer", Q)
                    })
                };
            t({
                global: !0,
                enumerable: !0,
                sham: !E,
                forced: Z
            }, {
                structuredClone: function(e) {
                    var t, n, r = b(arguments.length, 1) > 1 && !l(arguments[1]) ? h(arguments[1]) : void 0,
                        i = r ? r.transfer : void 0;
                    void 0 !== i && (n = el(i, t = new O));
                    var a = eu(e, t);
                    return n && ec(n), a
                }
            })
        }
    }(), aU().structuredClone), oe.prototype = Error.prototype;
    var on = setTimeout;

    function or(e) {
        return !!(e && void 0 !== e.length)
    }

    function oi() {}

    function oa(e) {
        if (!(this instanceof oa)) throw TypeError("Promises must be constructed via new");
        if ("function" != typeof e) throw TypeError("not a function");
        this._state = 0, this._handled = !1, this._value = void 0, this._deferreds = [], od(e, this)
    }

    function oo(e, t) {
        for (; 3 === e._state;) e = e._value;
        0 === e._state ? e._deferreds.push(t) : (e._handled = !0, oa._immediateFn(function() {
            var n, r = 1 === e._state ? t.onFulfilled : t.onRejected;
            if (null === r) return void(1 === e._state ? os : ou)(t.promise, e._value);
            try {
                n = r(e._value)
            } catch (e) {
                ou(t.promise, e);
                return
            }
            os(t.promise, n)
        }))
    }

    function os(e, t) {
        try {
            if (t === e) throw TypeError("A promise cannot be resolved with itself.");
            if (t && ("object" == typeof t || "function" == typeof t)) {
                var n = t.then;
                if (t instanceof oa) {
                    e._state = 3, e._value = t, ol(e);
                    return
                }
                if ("function" == typeof n) return void od(function() {
                    n.apply(t, arguments)
                }, e)
            }
            e._state = 1, e._value = t, ol(e)
        } catch (t) {
            ou(e, t)
        }
    }

    function ou(e, t) {
        e._state = 2, e._value = t, ol(e)
    }

    function ol(e) {
        2 === e._state && 0 === e._deferreds.length && oa._immediateFn(function() {
            e._handled || oa._unhandledRejectionFn(e._value)
        });
        for (var t = 0, n = e._deferreds.length; t < n; t++) oo(e, e._deferreds[t]);
        e._deferreds = null
    }

    function oc(e, t, n) {
        this.onFulfilled = "function" == typeof e ? e : null, this.onRejected = "function" == typeof t ? t : null, this.promise = n
    }

    function od(e, t) {
        var n = !1;
        try {
            e(function(e) {
                n || (n = !0, os(t, e))
            }, function(e) {
                n || (n = !0, ou(t, e))
            })
        } catch (e) {
            if (n) return;
            n = !0, ou(t, e)
        }
    }
    oa.prototype.catch = function(e) {
        return this.then(null, e)
    }, oa.prototype.then = function(e, t) {
        var n = new this.constructor(oi);
        return oo(this, new oc(e, t, n)), n
    }, oa.prototype.finally = a7, oa.all = function(e) {
        return new oa(function(t, n) {
            if (!or(e)) return n(TypeError("Promise.all accepts an array"));
            var r = Array.prototype.slice.call(e);
            if (0 === r.length) return t([]);
            for (var i = r.length, a = 0; a < r.length; a++) ! function e(a, o) {
                try {
                    if (o && ("object" == typeof o || "function" == typeof o)) {
                        var s = o.then;
                        if ("function" == typeof s) return void s.call(o, function(t) {
                            e(a, t)
                        }, n)
                    }
                    r[a] = o, 0 == --i && t(r)
                } catch (e) {
                    n(e)
                }
            }(a, r[a])
        })
    }, oa.any = ot, oa.allSettled = a9, oa.resolve = function(e) {
        return e && "object" == typeof e && e.constructor === oa ? e : new oa(function(t) {
            t(e)
        })
    }, oa.reject = function(e) {
        return new oa(function(t, n) {
            n(e)
        })
    }, oa.race = function(e) {
        return new oa(function(t, n) {
            if (!or(e)) return n(TypeError("Promise.race accepts an array"));
            for (var r = 0, i = e.length; r < i; r++) oa.resolve(e[r]).then(t, n)
        })
    }, oa._immediateFn = "function" == typeof setImmediate && function(e) {
        setImmediate(e)
    } || function(e) {
        on(e, 0)
    }, oa._unhandledRejectionFn = function(e) {
        "u" > typeof console && console && console.warn("Possible Unhandled Promise Rejection:", e)
    };
    var of = "u" > typeof self ? self : window;
    "function" != typeof of.Promise ? of.Promise = oa : (of.Promise.prototype.finally || (of.Promise.prototype.finally = a7), of.Promise.allSettled || (of.Promise.allSettled = a9), of.Promise.any || (of.Promise.any = ot));
    var oh = e.i(643766),
        op = e.i(341260),
        ov = e.i(236476),
        oy = e.i(638281),
        om = e.i(436089),
        og = e.i(228096),
        ob = e.i(458451),
        ow = e.i(260241),
        ox = e.i(429884),
        oP = e.i(602635),
        oS = e.i(822092),
        oS = oS,
        oR = e.i(380866),
        oR = oR,
        oT = e.i(500758);
    e.i(725924);
    var oE = e.i(79187),
        ok = e.i(218701),
        oA = e.i(570098);
    e.i(225226);
    var oq = e.i(729393),
        oj = e.i(83205),
        o_ = e.i(796701),
        oI = e.i(806205),
        oC = e.i(171475),
        oO = e.i(920763),
        oL = e.i(439224),
        oD = e.i(366132),
        oM = {},
        oN = oj.default;

    function oU(e, t, n) {
        e = e || function(e) {
            this.queue(e)
        }, t = t || function() {
            this.queue(null)
        };
        var r = !1,
            i = !1,
            a = [],
            o = !1,
            s = new oN;

        function u() {
            for (; a.length && !s.paused;) {
                var e = a.shift();
                if (null === e) return s.emit("end");
                s.emit("data", e)
            }
        }
        return s.readable = s.writable = !0, s.paused = !1, s.autoDestroy = !(n && !1 === n.autoDestroy), s.write = function(t) {
            return e.call(this, t), !s.paused
        }, s.queue = s.push = function(e) {
            return o || (null === e && (o = !0), a.push(e), u()), s
        }, s.on("end", function() {
            s.readable = !1, !s.writable && s.autoDestroy && g.default.nextTick(function() {
                s.destroy()
            })
        }), s.end = function(e) {
            if (!r) return r = !0, arguments.length && s.write(e), s.writable = !1, t.call(s), !s.readable && s.autoDestroy && s.destroy(), s
        }, s.destroy = function() {
            if (!i) return i = !0, r = !0, a.length = 0, s.writable = s.readable = !1, s.emit("close"), s
        }, s.pause = function() {
            if (!s.paused) return s.paused = !0, s
        }, s.resume = function() {
            return s.paused && (s.paused = !1, s.emit("resume")), u(), s.paused || s.emit("drain"), s
        }, s
    }({
        get exports() {
            return oM
        },
        set exports(e) {
            oM = e
        }
    }).exports = oU, oU.through = oU;
    var oB = Object.prototype.toString,
        oF = "function" == typeof oA.Buffer.alloc && "function" == typeof oA.Buffer.allocUnsafe && "function" == typeof oA.Buffer.from,
        oH = {},
        oV = Array.isArray || function(e) {
            return "[object Array]" == Object.prototype.toString.call(e)
        },
        oG = {};

    function oW(e) {
        return Object.prototype.toString.call(e)
    }
    oG.isArray = function(e) {
        return Array.isArray ? Array.isArray(e) : "[object Array]" === oW(e)
    }, oG.isBoolean = function(e) {
        return "boolean" == typeof e
    }, oG.isNull = function(e) {
        return null === e
    }, oG.isNullOrUndefined = function(e) {
        return null == e
    }, oG.isNumber = function(e) {
        return "number" == typeof e
    }, oG.isString = function(e) {
        return "string" == typeof e
    }, oG.isSymbol = function(e) {
        return "symbol" == typeof e
    }, oG.isUndefined = function(e) {
        return void 0 === e
    }, oG.isRegExp = function(e) {
        return "[object RegExp]" === oW(e)
    }, oG.isObject = function(e) {
        return "object" == typeof e && null !== e
    }, oG.isDate = function(e) {
        return "[object Date]" === oW(e)
    }, oG.isError = function(e) {
        return "[object Error]" === oW(e) || e instanceof Error
    }, oG.isFunction = function(e) {
        return "function" == typeof e
    }, oG.isPrimitive = function(e) {
        return null === e || "boolean" == typeof e || "number" == typeof e || "string" == typeof e || "symbol" == typeof e || void 0 === e
    }, oG.isBuffer = oA.default.Buffer.isBuffer;
    var oK, oz = {},
        oX = {},
        oQ = {
            get exports() {
                return oX
            },
            set exports(e) {
                oX = e
            }
        },
        o$ = {
            get exports() {
                return oz
            },
            set exports(e) {
                oz = e
            }
        };
    try {
        var oY = e.r(171475);
        if ("function" != typeof oY.inherits) throw "";
        o$.exports = oY.inherits
    } catch (e) {
        oK || (oK = 1, "function" == typeof Object.create ? oQ.exports = function(e, t) {
            t && (e.super_ = t, e.prototype = Object.create(t.prototype, {
                constructor: {
                    value: e,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }))
        } : oQ.exports = function(e, t) {
            if (t) {
                e.super_ = t;
                var n = function() {};
                n.prototype = t.prototype, e.prototype = new n, e.prototype.constructor = e
            }
        }), o$.exports = oX
    }
    var oJ, oZ = {};

    function o0() {
        if (oJ) return oZ;
        oJ = 1;
        var e = oA.default.Buffer,
            t = e.isEncoding || function(e) {
                switch (e && e.toLowerCase()) {
                    case "hex":
                    case "utf8":
                    case "utf-8":
                    case "ascii":
                    case "binary":
                    case "base64":
                    case "ucs2":
                    case "ucs-2":
                    case "utf16le":
                    case "utf-16le":
                    case "raw":
                        return !0;
                    default:
                        return !1
                }
            },
            n = oZ.StringDecoder = function(n) {
                switch (this.encoding = (n || "utf8").toLowerCase().replace(/[-_]/, ""), function(e) {
                        if (e && !t(e)) throw Error("Unknown encoding: " + e)
                    }(n), this.encoding) {
                    case "utf8":
                        this.surrogateSize = 3;
                        break;
                    case "ucs2":
                    case "utf16le":
                        this.surrogateSize = 2, this.detectIncompleteChar = i;
                        break;
                    case "base64":
                        this.surrogateSize = 3, this.detectIncompleteChar = a;
                        break;
                    default:
                        return void(this.write = r)
                }
                this.charBuffer = new e(6), this.charReceived = 0, this.charLength = 0
            };

        function r(e) {
            return e.toString(this.encoding)
        }

        function i(e) {
            this.charReceived = e.length % 2, this.charLength = 2 * !!this.charReceived
        }

        function a(e) {
            this.charReceived = e.length % 3, this.charLength = 3 * !!this.charReceived
        }
        return n.prototype.write = function(e) {
            for (var t, n = ""; this.charLength;) {
                var r = e.length >= this.charLength - this.charReceived ? this.charLength - this.charReceived : e.length;
                if (e.copy(this.charBuffer, this.charReceived, 0, r), this.charReceived += r, this.charReceived < this.charLength) return "";
                if (e = e.slice(r, e.length), !((t = (n = this.charBuffer.slice(0, this.charLength).toString(this.encoding)).charCodeAt(n.length - 1)) >= 55296 && t <= 56319)) {
                    if (this.charReceived = this.charLength = 0, 0 === e.length) return n;
                    break
                }
                this.charLength += this.surrogateSize, n = ""
            }
            this.detectIncompleteChar(e);
            var i = e.length;
            if (this.charLength && (e.copy(this.charBuffer, 0, e.length - this.charReceived, i), i -= this.charReceived), i = (n += e.toString(this.encoding, 0, i)).length - 1, (t = n.charCodeAt(i)) >= 55296 && t <= 56319) {
                var a = this.surrogateSize;
                return this.charLength += a, this.charReceived += a, this.charBuffer.copy(this.charBuffer, a, 0, a), e.copy(this.charBuffer, 0, 0, a), n.substring(0, i)
            }
            return n
        }, n.prototype.detectIncompleteChar = function(e) {
            for (var t = e.length >= 3 ? 3 : e.length; t > 0; t--) {
                var n = e[e.length - t];
                if (1 == t && n >> 5 == 6) {
                    this.charLength = 2;
                    break
                }
                if (t <= 2 && n >> 4 == 14) {
                    this.charLength = 3;
                    break
                }
                if (t <= 3 && n >> 3 == 30) {
                    this.charLength = 4;
                    break
                }
            }
            this.charReceived = t
        }, n.prototype.end = function(e) {
            var t = "";
            if (e && e.length && (t = this.write(e)), this.charReceived) {
                var n = this.charReceived,
                    r = this.charBuffer,
                    i = this.encoding;
                t += r.slice(0, n).toString(i)
            }
            return t
        }, oZ
    }
    var o1 = oA.default.Buffer;
    o8.ReadableState = o6;
    var o2 = o_.default.EventEmitter;
    o2.listenerCount || (o2.listenerCount = function(e, t) {
        return e.listeners(t).length
    });
    var o4, o3 = oj.default;

    function o6(e, t) {
        var n = (e = e || {}).highWaterMark;
        this.highWaterMark = n || 0 === n ? n : 16384, this.highWaterMark = ~~this.highWaterMark, this.buffer = [], this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = !1, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.calledRead = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.objectMode = !!e.objectMode, this.defaultEncoding = e.defaultEncoding || "utf8", this.ranOut = !1, this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, e.encoding && (o4 || (o4 = o0().StringDecoder), this.decoder = new o4(e.encoding), this.encoding = e.encoding)
    }

    function o8(e) {
        if (!(this instanceof o8)) return new o8(e);
        this._readableState = new o6(e), this.readable = !0, o3.call(this)
    }

    function o5(e, t, n, r, i) {
        var a, o, s = (a = n, o = null, o1.isBuffer(a) || "string" == typeof a || null == a || t.objectMode || (o = TypeError("Invalid non-string/buffer chunk")), o);
        if (s) e.emit("error", s);
        else if (null == n) t.reading = !1, t.ended || function(e, t) {
            if (t.decoder && !t.ended) {
                var n = t.decoder.end();
                n && n.length && (t.buffer.push(n), t.length += t.objectMode ? 1 : n.length)
            }
            t.ended = !0, t.length > 0 ? o9(e) : sa(e)
        }(e, t);
        else if (t.objectMode || n && n.length > 0)
            if (t.ended && !i) {
                var u = Error("stream.push() after EOF");
                e.emit("error", u)
            } else t.endEmitted && i ? (u = Error("stream.unshift() after end event"), e.emit("error", u)) : (!t.decoder || i || r || (n = t.decoder.write(n)), t.length += t.objectMode ? 1 : n.length, i ? t.buffer.unshift(n) : (t.reading = !1, t.buffer.push(n)), t.needReadable && o9(e), t.readingMore || (t.readingMore = !0, g.default.nextTick(function() {
                for (var n = t.length; !t.reading && !t.flowing && !t.ended && t.length < t.highWaterMark && (e.read(0), n !== t.length);) n = t.length;
                t.readingMore = !1
            })));
        else i || (t.reading = !1);
        return !t.ended && (t.needReadable || t.length < t.highWaterMark || 0 === t.length)
    }

    function o7(e, t) {
        return 0 === t.length && t.ended ? 0 : t.objectMode ? +(0 !== e) : null === e || isNaN(e) ? t.flowing && t.buffer.length ? t.buffer[0].length : t.length : e <= 0 ? 0 : (e > t.highWaterMark && (t.highWaterMark = function(e) {
            if (e >= 8388608) e = 8388608;
            else {
                e--;
                for (var t = 1; t < 32; t <<= 1) e |= e >> t;
                e++
            }
            return e
        }(e)), e > t.length ? t.ended ? t.length : (t.needReadable = !0, 0) : e)
    }

    function o9(e) {
        var t = e._readableState;
        t.needReadable = !1, t.emittedReadable || (t.emittedReadable = !0, t.sync ? g.default.nextTick(function() {
            se(e)
        }) : se(e))
    }

    function se(e) {
        e.emit("readable")
    }

    function st(e) {
        var t, n = e._readableState;

        function r(e, r, i) {
            !1 === e.write(t) && n.awaitDrain++
        }
        for (n.awaitDrain = 0; n.pipesCount && null !== (t = e.read());)
            if (1 === n.pipesCount ? r(n.pipes) : so(n.pipes, r), e.emit("data", t), n.awaitDrain > 0) return;
        0 === n.pipesCount ? (n.flowing = !1, o2.listenerCount(e, "data") > 0 && sr(e)) : n.ranOut = !0
    }

    function sn() {
        this._readableState.ranOut && (this._readableState.ranOut = !1, st(this))
    }

    function sr(e, t) {
        if (e._readableState.flowing) throw Error("Cannot switch to old mode now.");
        var n = t || !1,
            r = !1;
        e.readable = !0, e.pipe = o3.prototype.pipe, e.on = e.addListener = o3.prototype.on, e.on("readable", function() {
            var t;
            for (r = !0; !n && null !== (t = e.read());) e.emit("data", t);
            null === t && (r = !1, e._readableState.needReadable = !0)
        }), e.pause = function() {
            n = !0, this.emit("pause")
        }, e.resume = function() {
            n = !1, r ? g.default.nextTick(function() {
                e.emit("readable")
            }) : this.read(0), this.emit("resume")
        }, e.emit("readable")
    }

    function si(e, t) {
        var n, r = t.buffer,
            i = t.length,
            a = !!t.decoder,
            o = !!t.objectMode;
        if (0 === r.length) return null;
        if (0 === i) n = null;
        else if (o) n = r.shift();
        else if (!e || e >= i) n = a ? r.join("") : o1.concat(r, i), r.length = 0;
        else if (e < r[0].length) n = (c = r[0]).slice(0, e), r[0] = c.slice(e);
        else if (e === r[0].length) n = r.shift();
        else {
            n = a ? "" : new o1(e);
            for (var s = 0, u = 0, l = r.length; u < l && s < e; u++) {
                var c = r[0],
                    d = Math.min(e - s, c.length);
                a ? n += c.slice(0, d) : c.copy(n, s, 0, d), d < c.length ? r[0] = c.slice(d) : r.shift(), s += d
            }
        }
        return n
    }

    function sa(e) {
        var t = e._readableState;
        if (t.length > 0) throw Error("endReadable called on non-empty stream");
        !t.endEmitted && t.calledRead && (t.ended = !0, g.default.nextTick(function() {
            t.endEmitted || 0 !== t.length || (t.endEmitted = !0, e.readable = !1, e.emit("end"))
        }))
    }

    function so(e, t) {
        for (var n = 0, r = e.length; n < r; n++) t(e[n], n)
    }

    function ss() {
        if (sP) return sx;
        sP = 1, sx = n;
        var e = Object.keys || function(e) {
            var t = [];
            for (var n in e) t.push(n);
            return t
        };
        oG.inherits = oz;
        var t = su();

        function n(e) {
            if (!(this instanceof n)) return new n(e);
            o8.call(this, e), t.call(this, e), e && !1 === e.readable && (this.readable = !1), e && !1 === e.writable && (this.writable = !1), this.allowHalfOpen = !0, e && !1 === e.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", r)
        }

        function r() {
            this.allowHalfOpen || this._writableState.ended || g.default.nextTick(this.end.bind(this))
        }
        return oG.inherits(n, o8),
            function(e, t) {
                for (var n = 0, r = e.length; n < r; n++) t(e[n], n)
            }(e(t.prototype), function(e) {
                n.prototype[e] || (n.prototype[e] = t.prototype[e])
            }), sx
    }

    function su() {
        if (sR) return sS;
        sR = 1, sS = i;
        var e = oA.default.Buffer;
        i.WritableState = r, oG.inherits = oz;
        var t = oj.default;

        function n(e, t, n) {
            this.chunk = e, this.encoding = t, this.callback = n
        }

        function r(e, t) {
            var n = (e = e || {}).highWaterMark;
            this.highWaterMark = n || 0 === n ? n : 16384, this.objectMode = !!e.objectMode, this.highWaterMark = ~~this.highWaterMark, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1;
            var r = !1 === e.decodeStrings;
            this.decodeStrings = !r, this.defaultEncoding = e.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(e) {
                ! function(e, t) {
                    var n = e._writableState,
                        r = n.sync,
                        i = n.writecb;
                    if (n.writing = !1, n.writecb = null, n.length -= n.writelen, n.writelen = 0, t) r ? g.default.nextTick(function() {
                        i(t)
                    }) : i(t), e._writableState.errorEmitted = !0, e.emit("error", t);
                    else {
                        var u = s(e, n);
                        u || n.bufferProcessing || !n.buffer.length || function(e, t) {
                            t.bufferProcessing = !0;
                            for (var n = 0; n < t.buffer.length; n++) {
                                var r = t.buffer[n],
                                    i = r.chunk,
                                    o = r.encoding,
                                    s = r.callback;
                                if (a(e, t, t.objectMode ? 1 : i.length, i, o, s), t.writing) {
                                    n++;
                                    break
                                }
                            }
                            t.bufferProcessing = !1, n < t.buffer.length ? t.buffer = t.buffer.slice(n) : t.buffer.length = 0
                        }(e, n), r ? g.default.nextTick(function() {
                            o(e, n, u, i)
                        }) : o(e, n, u, i)
                    }
                }(t, e)
            }, this.writecb = null, this.writelen = 0, this.buffer = [], this.errorEmitted = !1
        }

        function i(e) {
            var n = ss();
            if (!(this instanceof i || this instanceof n)) return new i(e);
            this._writableState = new r(e, this), this.writable = !0, t.call(this)
        }

        function a(e, t, n, r, i, a) {
            t.writelen = n, t.writecb = a, t.writing = !0, t.sync = !0, e._write(r, i, t.onwrite), t.sync = !1
        }

        function o(e, t, n, r) {
            n || 0 === t.length && t.needDrain && (t.needDrain = !1, e.emit("drain")), r(), n && u(e, t)
        }

        function s(e, t) {
            return t.ending && 0 === t.length && !t.finished && !t.writing
        }

        function u(e, t) {
            var n = s(0, t);
            return n && (t.finished = !0, e.emit("finish")), n
        }
        return oG.inherits(i, t), i.prototype.pipe = function() {
            this.emit("error", Error("Cannot pipe. Not readable."))
        }, i.prototype.write = function(t, r, i) {
            var o, s, u, l, c, d, f, h, p, v = this._writableState,
                y = !1;
            return "function" == typeof r && (i = r, r = null), e.isBuffer(t) ? r = "buffer" : r || (r = v.defaultEncoding), "function" != typeof i && (i = function() {}), v.ended ? (o = i, s = Error("write after end"), this.emit("error", s), g.default.nextTick(function() {
                o(s)
            })) : function(t, n, r, i) {
                var a = !0;
                if (!e.isBuffer(r) && "string" != typeof r && null != r && !n.objectMode) {
                    var o = TypeError("Invalid non-string/buffer chunk");
                    t.emit("error", o), g.default.nextTick(function() {
                        i(o)
                    }), a = !1
                }
                return a
            }(this, v, t, i) && (u = t, l = r, c = i, d = u, f = l, v.objectMode || !1 === v.decodeStrings || "string" != typeof d || (d = new e(d, f)), u = d, e.isBuffer(u) && (l = "buffer"), h = v.objectMode ? 1 : u.length, v.length += h, (p = v.length < v.highWaterMark) || (v.needDrain = !0), v.writing ? v.buffer.push(new n(u, l, c)) : a(this, v, h, u, l, c), y = p), y
        }, i.prototype._write = function(e, t, n) {
            n(Error("not implemented"))
        }, i.prototype.end = function(e, t, n) {
            var r, i = this._writableState;
            "function" == typeof e ? (n = e, e = null, t = null) : "function" == typeof t && (n = t, t = null), null != e && this.write(e, t), i.ending || i.finished || (r = n, i.ending = !0, u(this, i), r && (i.finished ? g.default.nextTick(r) : this.once("finish", r)), i.ended = !0)
        }, sS
    }
    oG.inherits = oz, oG.inherits(o8, o3), o8.prototype.push = function(e, t) {
        var n = this._readableState;
        return "string" != typeof e || n.objectMode || (t = t || n.defaultEncoding) !== n.encoding && (e = new o1(e, t), t = ""), o5(this, n, e, t, !1)
    }, o8.prototype.unshift = function(e) {
        return o5(this, this._readableState, e, "", !0)
    }, o8.prototype.setEncoding = function(e) {
        o4 || (o4 = o0().StringDecoder), this._readableState.decoder = new o4(e), this._readableState.encoding = e
    }, o8.prototype.read = function(e) {
        var t = this._readableState;
        t.calledRead = !0;
        var n, r = e;
        if (("number" != typeof e || e > 0) && (t.emittedReadable = !1), 0 === e && t.needReadable && (t.length >= t.highWaterMark || t.ended)) return o9(this), null;
        if (0 === (e = o7(e, t)) && t.ended) return n = null, t.length > 0 && t.decoder && (n = si(e, t), t.length -= n.length), 0 === t.length && sa(this), n;
        var i = t.needReadable;
        return t.length - e <= t.highWaterMark && (i = !0), (t.ended || t.reading) && (i = !1), i && (t.reading = !0, t.sync = !0, 0 === t.length && (t.needReadable = !0), this._read(t.highWaterMark), t.sync = !1), i && !t.reading && (e = o7(r, t)), null === (n = e > 0 ? si(e, t) : null) && (t.needReadable = !0, e = 0), t.length -= e, 0 !== t.length || t.ended || (t.needReadable = !0), t.ended && !t.endEmitted && 0 === t.length && sa(this), n
    }, o8.prototype._read = function(e) {
        this.emit("error", Error("not implemented"))
    }, o8.prototype.pipe = function(e, t) {
        var n = this,
            r = this._readableState;
        switch (r.pipesCount) {
            case 0:
                r.pipes = e;
                break;
            case 1:
                r.pipes = [r.pipes, e];
                break;
            default:
                r.pipes.push(e)
        }
        r.pipesCount += 1;
        var i = t && !1 === t.end || e === g.default.stdout || e === g.default.stderr ? u : o;

        function a(e) {
            e === n && u()
        }

        function o() {
            e.end()
        }
        r.endEmitted ? g.default.nextTick(i) : n.once("end", i), e.on("unpipe", a);
        var s = function() {
            var e = n._readableState;
            e.awaitDrain--, 0 === e.awaitDrain && st(n)
        };

        function u() {
            e.removeListener("close", c), e.removeListener("finish", d), e.removeListener("drain", s), e.removeListener("error", l), e.removeListener("unpipe", a), n.removeListener("end", o), n.removeListener("end", u), e._writableState && !e._writableState.needDrain || s()
        }

        function l(t) {
            f(), e.removeListener("error", l), 0 === o2.listenerCount(e, "error") && e.emit("error", t)
        }

        function c() {
            e.removeListener("finish", d), f()
        }

        function d() {
            e.removeListener("close", c), f()
        }

        function f() {
            n.unpipe(e)
        }
        return e.on("drain", s), e._events && e._events.error ? oV(e._events.error) ? e._events.error.unshift(l) : e._events.error = [l, e._events.error] : e.on("error", l), e.once("close", c), e.once("finish", d), e.emit("pipe", n), r.flowing || (this.on("readable", sn), r.flowing = !0, g.default.nextTick(function() {
            st(n)
        })), e
    }, o8.prototype.unpipe = function(e) {
        var t = this._readableState;
        if (0 === t.pipesCount) return this;
        if (1 === t.pipesCount) return e && e !== t.pipes || (e || (e = t.pipes), t.pipes = null, t.pipesCount = 0, this.removeListener("readable", sn), t.flowing = !1, e && e.emit("unpipe", this)), this;
        if (!e) {
            var n = t.pipes,
                r = t.pipesCount;
            t.pipes = null, t.pipesCount = 0, this.removeListener("readable", sn), t.flowing = !1;
            for (var i = 0; i < r; i++) n[i].emit("unpipe", this);
            return this
        }
        return -1 === (i = function(e, t) {
            for (var n = 0, r = e.length; n < r; n++)
                if (e[n] === t) return n;
            return -1
        }(t.pipes, e)) || (t.pipes.splice(i, 1), t.pipesCount -= 1, 1 === t.pipesCount && (t.pipes = t.pipes[0]), e.emit("unpipe", this)), this
    }, o8.prototype.on = function(e, t) {
        var n = o3.prototype.on.call(this, e, t);
        if ("data" !== e || this._readableState.flowing || sr(this), "readable" === e && this.readable) {
            var r = this._readableState;
            r.readableListening || (r.readableListening = !0, r.emittedReadable = !1, r.needReadable = !0, r.reading ? r.length && o9(this) : this.read(0))
        }
        return n
    }, o8.prototype.addListener = o8.prototype.on, o8.prototype.resume = function() {
        sr(this), this.read(0), this.emit("resume")
    }, o8.prototype.pause = function() {
        sr(this, !0), this.emit("pause")
    }, o8.prototype.wrap = function(e) {
        var t = this._readableState,
            n = !1,
            r = this;
        for (var i in e.on("end", function() {
                if (t.decoder && !t.ended) {
                    var e = t.decoder.end();
                    e && e.length && r.push(e)
                }
                r.push(null)
            }), e.on("data", function(i) {
                t.decoder && (i = t.decoder.write(i)), t.objectMode && null == i || (t.objectMode || i && i.length) && (r.push(i) || (n = !0, e.pause()))
            }), e) "function" == typeof e[i] && void 0 === this[i] && (this[i] = function(t) {
            return function() {
                return e[t].apply(e, arguments)
            }
        }(i));
        return so(["error", "close", "destroy", "pause", "resume"], function(t) {
            e.on(t, r.emit.bind(r, t))
        }), r._read = function(t) {
            n && (n = !1, e.resume())
        }, r
    }, o8._fromList = si;
    var sl = ss();

    function sc(e, t) {
        this.afterTransform = function(e, n) {
            var r = t._transformState;
            r.transforming = !1;
            var i = r.writecb;
            if (!i) return t.emit("error", Error("no writecb in Transform class"));
            r.writechunk = null, r.writecb = null, null != n && t.push(n), i && i(e);
            var a = t._readableState;
            a.reading = !1, (a.needReadable || a.length < a.highWaterMark) && t._read(a.highWaterMark)
        }, this.needTransform = !1, this.transforming = !1, this.writecb = null, this.writechunk = null
    }

    function sd(e) {
        if (!(this instanceof sd)) return new sd(e);
        sl.call(this, e), this._transformState = new sc(e, this);
        var t = this;
        this._readableState.needReadable = !0, this._readableState.sync = !1, this.once("finish", function() {
            "function" == typeof this._flush ? this._flush(function(e) {
                sf(t, e)
            }) : sf(t)
        })
    }

    function sf(e, t) {
        if (t) return e.emit("error", t);
        var n = e._writableState;
        e._readableState;
        var r = e._transformState;
        if (n.length) throw Error("calling transform done when ws.length != 0");
        if (r.transforming) throw Error("calling transform done when still transforming");
        return e.push(null)
    }

    function sh(e) {
        if (!(this instanceof sh)) return new sh(e);
        sd.call(this, e)
    }
    oG.inherits = oz, oG.inherits(sd, sl), sd.prototype.push = function(e, t) {
        return this._transformState.needTransform = !1, sl.prototype.push.call(this, e, t)
    }, sd.prototype._transform = function(e, t, n) {
        throw Error("not implemented")
    }, sd.prototype._write = function(e, t, n) {
        var r = this._transformState;
        if (r.writecb = n, r.writechunk = e, r.writeencoding = t, !r.transforming) {
            var i = this._readableState;
            (r.needTransform || i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
        }
    }, sd.prototype._read = function(e) {
        var t = this._transformState;
        null !== t.writechunk && t.writecb && !t.transforming ? (t.transforming = !0, this._transform(t.writechunk, t.writeencoding, t.afterTransform)) : t.needTransform = !0
    }, oG.inherits = oz, oG.inherits(sh, sd), sh.prototype._transform = function(e, t, n) {
        n(null, e)
    }, sT = oH, sE = oj.default, (sT = ({
        get exports() {
            return oH
        },
        set exports(e) {
            oH = e
        }
    }).exports = o8).Stream = sE, sT.Readable = sT, sT.Writable = su(), sT.Duplex = ss(), sT.Transform = sd, sT.PassThrough = sh;
    var sp = function(e, t, n) {
            if ("number" == typeof e) throw TypeError('"value" argument must not be a number');
            return "ArrayBuffer" === oB.call(e).slice(8, -1) ? function(e, t, n) {
                t >>>= 0;
                var r = e.byteLength - t;
                if (r < 0) throw RangeError("'offset' is out of bounds");
                if (void 0 === n) n = r;
                else if ((n >>>= 0) > r) throw RangeError("'length' is out of bounds");
                return oF ? oA.Buffer.from(e.slice(t, t + n)) : new oA.Buffer(new Uint8Array(e.slice(t, t + n)))
            }(e, t, n) : "string" == typeof e ? function(e, t) {
                if ("string" == typeof t && "" !== t || (t = "utf8"), !oA.Buffer.isEncoding(t)) throw TypeError('"encoding" must be a valid string encoding');
                return oF ? oA.Buffer.from(e, t) : new oA.Buffer(e, t)
            }(e, t) : oF ? oA.Buffer.from(e) : new oA.Buffer(e)
        },
        sv = oH.Transform;
    oz(sm, sv);
    var sy = {
        endScript: sp("</script"),
        endStyle: sp("</style"),
        endTitle: sp("</title"),
        comment: sp("<!--"),
        endComment: sp("-->"),
        cdata: sp("<![CDATA["),
        endCdata: sp("]]>")
    };

    function sm() {
        if (!(this instanceof sm)) return new sm;
        sv.call(this), this._readableState.objectMode = !0, this.state = "text", this.tagState = null, this.quoteState = null, this.raw = null, this.buffers = [], this._last = []
    }

    function sg(e, t) {
        if (e.length < t.length) return !1;
        for (var n = e.length - 1, r = t.length - 1; n >= 0 && r >= 0; n--, r--)
            if (sb(e[n]) !== sb(t[r])) return !1;
        return !0
    }

    function sb(e) {
        return e >= 65 && e <= 90 ? e + 32 : e
    }

    function sw(e) {
        return 32 === e || 9 === e || 10 === e || 12 === e || 13 === e
    }
    sm.prototype._transform = function(e, t, n) {
        var r = 0,
            i = 0;
        for (this._prev && (e = oA.Buffer.concat([this._prev, e]), r = this._prev.length - 1, i = this._offset, this._prev = null, this._offset = 0); r < e.length; r++) {
            var a = e[r];
            if (this._last.push(a), this._last.length > 9 && this._last.shift(), this.raw) {
                var o = this._testRaw(e, i, r);
                o && (this.push(["text", o[0]]), this.raw === sy.endComment || this.raw === sy.endCdata ? (this.state = "text", this.buffers = [], this.push(["close", o[1]])) : (this.state = "open", this.buffers = [o[1]]), this.raw = null, i = r + 1)
            } else {
                if ("text" === this.state && 60 === a && r === e.length - 1) return this._prev = e, this._offset = i, n();
                if ("text" !== this.state || 60 !== a || sw(e[r + 1]))
                    if (1 === this.tagState && sw(a)) this.tagState = 2;
                    else if (2 === this.tagState && 61 === a) this.tagState = 3;
                else if (3 === this.tagState && sw(a));
                else if (3 === this.tagState && 62 !== a) this.tagState = 4, this.quoteState = 34 === a ? "double" : 39 === a ? "single" : null;
                else if (4 === this.tagState && !this.quoteState && sw(a)) this.tagState = 2;
                else if (4 === this.tagState && "double" === this.quoteState && 34 === a) this.quoteState = null, this.tagState = 2;
                else if (4 === this.tagState && "single" === this.quoteState && 39 === a) this.quoteState = null, this.tagState = 2;
                else if ("open" !== this.state || 62 !== a || this.quoteState) "open" === this.state && sg(this._last, sy.comment) ? (this.buffers.push(e.slice(i, r + 1)), i = r + 1, this.state = "text", this.raw = sy.endComment, this._pushState("open")) : "open" === this.state && sg(this._last, sy.cdata) && (this.buffers.push(e.slice(i, r + 1)), i = r + 1, this.state = "text", this.raw = sy.endCdata, this._pushState("open"));
                else if (this.buffers.push(e.slice(i, r + 1)), i = r + 1, this.state = "text", this.tagState = null, 47 === this._getChar(1)) this._pushState("close");
                else {
                    var s = this._getTag();
                    "script" === s && (this.raw = sy.endScript), "style" === s && (this.raw = sy.endStyle), "title" === s && (this.raw = sy.endTitle), this._pushState("open")
                } else r > 0 && r - i > 0 && this.buffers.push(e.slice(i, r)), i = r, this.state = "open", this.tagState = 1, this._pushState("text")
            }
        }
        i < e.length && this.buffers.push(e.slice(i)), n()
    }, sm.prototype._flush = function(e) {
        "text" === this.state && this._pushState("text"), this.push(null), e()
    }, sm.prototype._pushState = function(e) {
        if (0 !== this.buffers.length) {
            var t = oA.Buffer.concat(this.buffers);
            this.buffers = [], this.push([e, t])
        }
    }, sm.prototype._getChar = function(e) {
        for (var t = 0, n = 0; n < this.buffers.length; n++) {
            var r = this.buffers[n];
            if (t + r.length > e) return r[e - t];
            t += r
        }
    }, sm.prototype._getTag = function() {
        for (var e = 0, t = "", n = 0; n < this.buffers.length; n++) {
            for (var r = this.buffers[n], i = 0; i < r.length; i++)
                if (0 !== e || 0 !== i) {
                    var a = String.fromCharCode(r[i]);
                    if (/[^\w-!\[\]]/.test(a)) return t.toLowerCase();
                    t += a
                } e += r.length
        }
    }, sm.prototype._testRaw = function(e, t, n) {
        var r = this.raw;
        if (sg(this._last, r)) {
            this.buffers.push(e.slice(t, n + 1));
            var i = (e = oA.Buffer.concat(this.buffers)).length - r.length;
            return [e.slice(0, i), e.slice(i)]
        }
    };
    var sx, sP, sS, sR, sT, sE, sk, sA, sq, sj = {},
        s_ = {},
        sI = {},
        sC = {
            get exports() {
                return sI
            },
            set exports(e) {
                sI = e
            }
        };

    function sO() {
        return sk || (sk = 1, void 0 !== g.default && g.default.version && 0 !== g.default.version.indexOf("v0.") && (0 !== g.default.version.indexOf("v1.") || 0 === g.default.version.indexOf("v1.8.")) ? sC.exports = g.default : sC.exports = {
            nextTick: function(e, t, n, r) {
                if ("function" != typeof e) throw TypeError('"callback" argument must be a function');
                var i, a, o = arguments.length;
                switch (o) {
                    case 0:
                    case 1:
                        return g.default.nextTick(e);
                    case 2:
                        return g.default.nextTick(function() {
                            e.call(null, t)
                        });
                    case 3:
                        return g.default.nextTick(function() {
                            e.call(null, t, n)
                        });
                    case 4:
                        return g.default.nextTick(function() {
                            e.call(null, t, n, r)
                        });
                    default:
                        for (i = Array(o - 1), a = 0; a < i.length;) i[a++] = arguments[a];
                        return g.default.nextTick(function() {
                            e.apply(null, i)
                        })
                }
            }
        }), sI
    }
    var sL, sD = {},
        sM = {
            get exports() {
                return sD
            },
            set exports(e) {
                sD = e
            }
        };

    function sN() {
        return sL || (sL = 1, sM.exports = oj.default), sD
    }
    var sU, sB = {},
        sF = {
            get exports() {
                return sB
            },
            set exports(e) {
                sB = e
            }
        };

    function sH() {
        return sU || (sU = 1, function(e, t) {
            var n = oA.default,
                r = n.Buffer;

            function i(e, t) {
                for (var n in e) t[n] = e[n]
            }

            function a(e, t, n) {
                return r(e, t, n)
            }
            r.from && r.alloc && r.allocUnsafe && r.allocUnsafeSlow ? e.exports = n : (i(n, t), t.Buffer = a), i(r, a), a.from = function(e, t, n) {
                if ("number" == typeof e) throw TypeError("Argument must not be a number");
                return r(e, t, n)
            }, a.alloc = function(e, t, n) {
                if ("number" != typeof e) throw TypeError("Argument must be a number");
                var i = r(e);
                return void 0 !== t ? "string" == typeof n ? i.fill(t, n) : i.fill(t) : i.fill(0), i
            }, a.allocUnsafe = function(e) {
                if ("number" != typeof e) throw TypeError("Argument must be a number");
                return r(e)
            }, a.allocUnsafeSlow = function(e) {
                if ("number" != typeof e) throw TypeError("Argument must be a number");
                return n.SlowBuffer(e)
            }
        }(sF, sB)), sB
    }
    var sV, sG, sW, sK, sz, sX, sQ, s$, sY, sJ = {},
        sZ = {
            get exports() {
                return sJ
            },
            set exports(e) {
                sJ = e
            }
        };

    function s0() {
        if (sW) return sG;
        sW = 1;
        var e = sO();

        function t(e, t) {
            e.emit("error", t)
        }
        return sG = {
            destroy: function(n, r) {
                var i = this,
                    a = this._readableState && this._readableState.destroyed,
                    o = this._writableState && this._writableState.destroyed;
                return a || o ? r ? r(n) : !n || this._writableState && this._writableState.errorEmitted || e.nextTick(t, this, n) : (this._readableState && (this._readableState.destroyed = !0), this._writableState && (this._writableState.destroyed = !0), this._destroy(n || null, function(n) {
                    !r && n ? (e.nextTick(t, i, n), i._writableState && (i._writableState.errorEmitted = !0)) : r && r(n)
                })), this
            },
            undestroy: function() {
                this._readableState && (this._readableState.destroyed = !1, this._readableState.reading = !1, this._readableState.ended = !1, this._readableState.endEmitted = !1), this._writableState && (this._writableState.destroyed = !1, this._writableState.ended = !1, this._writableState.ending = !1, this._writableState.finished = !1, this._writableState.errorEmitted = !1)
            }
        }
    }

    function s1() {
        if (sQ) return sX;
        sQ = 1;
        var e = sO();

        function t(e) {
            var t = this;
            this.next = null, this.entry = null, this.finish = function() {
                var n = t.entry;
                for (t.entry = null; n;) {
                    var r = n.callback;
                    e.pendingcb--, r(void 0), n = n.next
                }
                e.corkedRequestsFree ? e.corkedRequestsFree.next = t : e.corkedRequestsFree = t
            }
        }
        sX = h;
        var n, r = e.nextTick;
        h.WritableState = f;
        var i = Object.create(oG);
        i.inherits = oz;
        var a, o = {
                deprecate: sz ? sK : (sz = 1, sK = oC.default.deprecate)
            },
            s = sN(),
            u = sH().Buffer,
            l = oI.c.Uint8Array || function() {},
            c = s0();

        function d() {}

        function f(i, a) {
            n = n || s2(), i = i || {};
            var o = a instanceof n;
            this.objectMode = !!i.objectMode, o && (this.objectMode = this.objectMode || !!i.writableObjectMode);
            var s = i.highWaterMark,
                u = i.writableHighWaterMark,
                l = this.objectMode ? 16 : 16384;
            this.highWaterMark = s || 0 === s ? s : o && (u || 0 === u) ? u : l, this.highWaterMark = Math.floor(this.highWaterMark), this.finalCalled = !1, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1, this.destroyed = !1;
            var c = !1 === i.decodeStrings;
            this.decodeStrings = !c, this.defaultEncoding = i.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.corked = 0, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(t) {
                ! function(t, n) {
                    var i = t._writableState,
                        a = i.sync,
                        o = i.writecb;
                    if (i.writing = !1, i.writecb = null, i.length -= i.writelen, i.writelen = 0, n) --i.pendingcb, a ? (e.nextTick(o, n), e.nextTick(b, t, i), t._writableState.errorEmitted = !0, t.emit("error", n)) : (o(n), t._writableState.errorEmitted = !0, t.emit("error", n), b(t, i));
                    else {
                        var s = m(i);
                        s || i.corked || i.bufferProcessing || !i.bufferedRequest || y(t, i), a ? r(v, t, i, s, o) : v(t, i, s, o)
                    }
                }(a, t)
            }, this.writecb = null, this.writelen = 0, this.bufferedRequest = null, this.lastBufferedRequest = null, this.pendingcb = 0, this.prefinished = !1, this.errorEmitted = !1, this.bufferedRequestCount = 0, this.corkedRequestsFree = new t(this)
        }

        function h(e) {
            if (n = n || s2(), !(a.call(h, this) || this instanceof n)) return new h(e);
            this._writableState = new f(e, this), this.writable = !0, e && ("function" == typeof e.write && (this._write = e.write), "function" == typeof e.writev && (this._writev = e.writev), "function" == typeof e.destroy && (this._destroy = e.destroy), "function" == typeof e.final && (this._final = e.final)), s.call(this)
        }

        function p(e, t, n, r, i, a, o) {
            t.writelen = r, t.writecb = o, t.writing = !0, t.sync = !0, n ? e._writev(i, t.onwrite) : e._write(i, a, t.onwrite), t.sync = !1
        }

        function v(e, t, n, r) {
            n || 0 === t.length && t.needDrain && (t.needDrain = !1, e.emit("drain")), t.pendingcb--, r(), b(e, t)
        }

        function y(e, n) {
            n.bufferProcessing = !0;
            var r = n.bufferedRequest;
            if (e._writev && r && r.next) {
                var i = Array(n.bufferedRequestCount),
                    a = n.corkedRequestsFree;
                a.entry = r;
                for (var o = 0, s = !0; r;) i[o] = r, r.isBuf || (s = !1), r = r.next, o += 1;
                i.allBuffers = s, p(e, n, !0, n.length, i, "", a.finish), n.pendingcb++, n.lastBufferedRequest = null, a.next ? (n.corkedRequestsFree = a.next, a.next = null) : n.corkedRequestsFree = new t(n), n.bufferedRequestCount = 0
            } else {
                for (; r;) {
                    var u = r.chunk,
                        l = r.encoding,
                        c = r.callback;
                    if (p(e, n, !1, n.objectMode ? 1 : u.length, u, l, c), r = r.next, n.bufferedRequestCount--, n.writing) break
                }
                null === r && (n.lastBufferedRequest = null)
            }
            n.bufferedRequest = r, n.bufferProcessing = !1
        }

        function m(e) {
            return e.ending && 0 === e.length && null === e.bufferedRequest && !e.finished && !e.writing
        }

        function g(e, t) {
            e._final(function(n) {
                t.pendingcb--, n && e.emit("error", n), t.prefinished = !0, e.emit("prefinish"), b(e, t)
            })
        }

        function b(t, n) {
            var r = m(n);
            return r && (n.prefinished || n.finalCalled || ("function" == typeof t._final ? (n.pendingcb++, n.finalCalled = !0, e.nextTick(g, t, n)) : (n.prefinished = !0, t.emit("prefinish"))), 0 === n.pendingcb && (n.finished = !0, t.emit("finish"))), r
        }
        return i.inherits(h, s), f.prototype.getBuffer = function() {
                for (var e = this.bufferedRequest, t = []; e;) t.push(e), e = e.next;
                return t
            },
            function() {
                try {
                    Object.defineProperty(f.prototype, "buffer", {
                        get: o.deprecate(function() {
                            return this.getBuffer()
                        }, "_writableState.buffer is deprecated. Use _writableState.getBuffer instead.", "DEP0003")
                    })
                } catch (e) {}
            }(), "function" == typeof Symbol && Symbol.hasInstance && "function" == typeof Function.prototype[Symbol.hasInstance] ? (a = Function.prototype[Symbol.hasInstance], Object.defineProperty(h, Symbol.hasInstance, {
                value: function(e) {
                    return !!a.call(this, e) || this === h && e && e._writableState instanceof f
                }
            })) : a = function(e) {
                return e instanceof this
            }, h.prototype.pipe = function() {
                this.emit("error", Error("Cannot pipe, not readable"))
            }, h.prototype.write = function(t, n, r) {
                var i, a, o, s, c, f, h, v, y = this._writableState,
                    m = !1,
                    g = !y.objectMode && (v = t, u.isBuffer(v) || v instanceof l);
                return g && !u.isBuffer(t) && (i = t, t = u.from(i)), "function" == typeof n && (r = n, n = null), g ? n = "buffer" : n || (n = y.defaultEncoding), "function" != typeof r && (r = d), y.ended ? (a = r, o = Error("write after end"), this.emit("error", o), e.nextTick(a, o)) : (g || (s = t, c = r, f = !0, h = !1, null === s ? h = TypeError("May not write null values to stream") : "string" == typeof s || void 0 === s || y.objectMode || (h = TypeError("Invalid non-string/buffer chunk")), h && (this.emit("error", h), e.nextTick(c, h), f = !1), f)) && (y.pendingcb++, m = function(e, t, n, r, i, a) {
                    if (!n) {
                        var o, s, l = (o = r, s = i, t.objectMode || !1 === t.decodeStrings || "string" != typeof o || (o = u.from(o, s)), o);
                        r !== l && (n = !0, i = "buffer", r = l)
                    }
                    var c = t.objectMode ? 1 : r.length;
                    t.length += c;
                    var d = t.length < t.highWaterMark;
                    if (d || (t.needDrain = !0), t.writing || t.corked) {
                        var f = t.lastBufferedRequest;
                        t.lastBufferedRequest = {
                            chunk: r,
                            encoding: i,
                            isBuf: n,
                            callback: a,
                            next: null
                        }, f ? f.next = t.lastBufferedRequest : t.bufferedRequest = t.lastBufferedRequest, t.bufferedRequestCount += 1
                    } else p(e, t, !1, c, r, i, a);
                    return d
                }(this, y, g, t, n, r)), m
            }, h.prototype.cork = function() {
                this._writableState.corked++
            }, h.prototype.uncork = function() {
                var e = this._writableState;
                e.corked && (e.corked--, e.writing || e.corked || e.finished || e.bufferProcessing || !e.bufferedRequest || y(this, e))
            }, h.prototype.setDefaultEncoding = function(e) {
                if ("string" == typeof e && (e = e.toLowerCase()), !(["hex", "utf8", "utf-8", "ascii", "binary", "base64", "ucs2", "ucs-2", "utf16le", "utf-16le", "raw"].indexOf((e + "").toLowerCase()) > -1)) throw TypeError("Unknown encoding: " + e);
                return this._writableState.defaultEncoding = e, this
            }, Object.defineProperty(h.prototype, "writableHighWaterMark", {
                enumerable: !1,
                get: function() {
                    return this._writableState.highWaterMark
                }
            }), h.prototype._write = function(e, t, n) {
                n(Error("_write() is not implemented"))
            }, h.prototype._writev = null, h.prototype.end = function(t, n, r) {
                var i, a = this._writableState;
                "function" == typeof t ? (r = t, t = null, n = null) : "function" == typeof n && (r = n, n = null), null != t && this.write(t, n), a.corked && (a.corked = 1, this.uncork()), a.ending || a.finished || (i = r, a.ending = !0, b(this, a), i && (a.finished ? e.nextTick(i) : this.once("finish", i)), a.ended = !0, this.writable = !1)
            }, Object.defineProperty(h.prototype, "destroyed", {
                get: function() {
                    return void 0 !== this._writableState && this._writableState.destroyed
                },
                set: function(e) {
                    this._writableState && (this._writableState.destroyed = e)
                }
            }), h.prototype.destroy = c.destroy, h.prototype._undestroy = c.undestroy, h.prototype._destroy = function(e, t) {
                this.end(), t(e)
            }, sX
    }

    function s2() {
        if (sY) return s$;
        sY = 1;
        var e = sO(),
            t = Object.keys || function(e) {
                var t = [];
                for (var n in e) t.push(n);
                return t
            };
        s$ = u;
        var n = Object.create(oG);
        n.inherits = oz;
        var r = un(),
            i = s1();
        n.inherits(u, r);
        for (var a = t(i.prototype), o = 0; o < a.length; o++) {
            var s = a[o];
            u.prototype[s] || (u.prototype[s] = i.prototype[s])
        }

        function u(e) {
            if (!(this instanceof u)) return new u(e);
            r.call(this, e), i.call(this, e), e && !1 === e.readable && (this.readable = !1), e && !1 === e.writable && (this.writable = !1), this.allowHalfOpen = !0, e && !1 === e.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", l)
        }

        function l() {
            this.allowHalfOpen || this._writableState.ended || e.nextTick(c, this)
        }

        function c(e) {
            e.end()
        }
        return Object.defineProperty(u.prototype, "writableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._writableState.highWaterMark
            }
        }), Object.defineProperty(u.prototype, "destroyed", {
            get: function() {
                return void 0 !== this._readableState && void 0 !== this._writableState && this._readableState.destroyed && this._writableState.destroyed
            },
            set: function(e) {
                void 0 !== this._readableState && void 0 !== this._writableState && (this._readableState.destroyed = e, this._writableState.destroyed = e)
            }
        }), u.prototype._destroy = function(t, n) {
            this.push(null), this.end(), e.nextTick(n, t)
        }, s$
    }
    var s4, s3, s6, s8, s5, s7, s9, ue = {};

    function ut() {
        if (s4) return ue;
        s4 = 1;
        var e = sH().Buffer,
            t = e.isEncoding || function(e) {
                switch ((e = "" + e) && e.toLowerCase()) {
                    case "hex":
                    case "utf8":
                    case "utf-8":
                    case "ascii":
                    case "binary":
                    case "base64":
                    case "ucs2":
                    case "ucs-2":
                    case "utf16le":
                    case "utf-16le":
                    case "raw":
                        return !0;
                    default:
                        return !1
                }
            };

        function n(n) {
            var r;
            switch (this.encoding = function(n) {
                    var r = function(e) {
                        if (!e) return "utf8";
                        for (var t;;) switch (e) {
                            case "utf8":
                            case "utf-8":
                                return "utf8";
                            case "ucs2":
                            case "ucs-2":
                            case "utf16le":
                            case "utf-16le":
                                return "utf16le";
                            case "latin1":
                            case "binary":
                                return "latin1";
                            case "base64":
                            case "ascii":
                            case "hex":
                                return e;
                            default:
                                if (t) return;
                                e = ("" + e).toLowerCase(), t = !0
                        }
                    }(n);
                    if ("string" != typeof r && (e.isEncoding === t || !t(n))) throw Error("Unknown encoding: " + n);
                    return r || n
                }(n), this.encoding) {
                case "utf16le":
                    this.text = a, this.end = o, r = 4;
                    break;
                case "utf8":
                    this.fillLast = i, r = 4;
                    break;
                case "base64":
                    this.text = s, this.end = u, r = 3;
                    break;
                default:
                    return this.write = l, void(this.end = c)
            }
            this.lastNeed = 0, this.lastTotal = 0, this.lastChar = e.allocUnsafe(r)
        }

        function r(e) {
            return e <= 127 ? 0 : e >> 5 == 6 ? 2 : e >> 4 == 14 ? 3 : e >> 3 == 30 ? 4 : e >> 6 == 2 ? -1 : -2
        }

        function i(e) {
            var t = this.lastTotal - this.lastNeed,
                n = function(e, t) {
                    if (128 != (192 & t[0])) return e.lastNeed = 0, "�";
                    if (e.lastNeed > 1 && t.length > 1) {
                        if (128 != (192 & t[1])) return e.lastNeed = 1, "�";
                        if (e.lastNeed > 2 && t.length > 2 && 128 != (192 & t[2])) return e.lastNeed = 2, "�"
                    }
                }(this, e);
            return void 0 !== n ? n : this.lastNeed <= e.length ? (e.copy(this.lastChar, t, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal)) : (e.copy(this.lastChar, t, 0, e.length), void(this.lastNeed -= e.length))
        }

        function a(e, t) {
            if ((e.length - t) % 2 == 0) {
                var n = e.toString("utf16le", t);
                if (n) {
                    var r = n.charCodeAt(n.length - 1);
                    if (r >= 55296 && r <= 56319) return this.lastNeed = 2, this.lastTotal = 4, this.lastChar[0] = e[e.length - 2], this.lastChar[1] = e[e.length - 1], n.slice(0, -1)
                }
                return n
            }
            return this.lastNeed = 1, this.lastTotal = 2, this.lastChar[0] = e[e.length - 1], e.toString("utf16le", t, e.length - 1)
        }

        function o(e) {
            var t = e && e.length ? this.write(e) : "";
            if (this.lastNeed) {
                var n = this.lastTotal - this.lastNeed;
                return t + this.lastChar.toString("utf16le", 0, n)
            }
            return t
        }

        function s(e, t) {
            var n = (e.length - t) % 3;
            return 0 === n ? e.toString("base64", t) : (this.lastNeed = 3 - n, this.lastTotal = 3, 1 === n ? this.lastChar[0] = e[e.length - 1] : (this.lastChar[0] = e[e.length - 2], this.lastChar[1] = e[e.length - 1]), e.toString("base64", t, e.length - n))
        }

        function u(e) {
            var t = e && e.length ? this.write(e) : "";
            return this.lastNeed ? t + this.lastChar.toString("base64", 0, 3 - this.lastNeed) : t
        }

        function l(e) {
            return e.toString(this.encoding)
        }

        function c(e) {
            return e && e.length ? this.write(e) : ""
        }
        return ue.StringDecoder = n, n.prototype.write = function(e) {
            var t, n;
            if (0 === e.length) return "";
            if (this.lastNeed) {
                if (void 0 === (t = this.fillLast(e))) return "";
                n = this.lastNeed, this.lastNeed = 0
            } else n = 0;
            return n < e.length ? t ? t + this.text(e, n) : this.text(e, n) : t || ""
        }, n.prototype.end = function(e) {
            var t = e && e.length ? this.write(e) : "";
            return this.lastNeed ? t + "�" : t
        }, n.prototype.text = function(e, t) {
            var n = function(e, t, n) {
                var i = t.length - 1;
                if (i < n) return 0;
                var a = r(t[i]);
                return a >= 0 ? (a > 0 && (e.lastNeed = a - 1), a) : --i < n || -2 === a ? 0 : (a = r(t[i])) >= 0 ? (a > 0 && (e.lastNeed = a - 2), a) : --i < n || -2 === a ? 0 : (a = r(t[i])) >= 0 ? (a > 0 && (2 === a ? a = 0 : e.lastNeed = a - 3), a) : 0
            }(this, e, t);
            if (!this.lastNeed) return e.toString("utf8", t);
            this.lastTotal = n;
            var i = e.length - (n - this.lastNeed);
            return e.copy(this.lastChar, 0, i), e.toString("utf8", t, i)
        }, n.prototype.fillLast = function(e) {
            if (this.lastNeed <= e.length) return e.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal);
            e.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, e.length), this.lastNeed -= e.length
        }, ue
    }

    function un() {
        if (s6) return s3;
        s6 = 1;
        var e = sO();
        s3 = m;
        var t, n = function() {
            if (sq) return sA;
            sq = 1;
            var e = {}.toString;
            return sA = Array.isArray || function(t) {
                return "[object Array]" == e.call(t)
            }
        }();
        m.ReadableState = y, o_.default.EventEmitter;
        var r = function(e, t) {
                return e.listeners(t).length
            },
            i = sN(),
            a = sH().Buffer,
            o = oI.c.Uint8Array || function() {},
            s = Object.create(oG);
        s.inherits = oz;
        var u = oC.default,
            l = void 0;
        l = u && u.debuglog ? u.debuglog("stream") : function() {};
        var c, d, f, h = (sV || (sV = 1, c = sH().Buffer, d = oC.default, sZ.exports = function() {
                function e() {
                    ! function(e, t) {
                        if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
                    }(this, e), this.head = null, this.tail = null, this.length = 0
                }
                return e.prototype.push = function(e) {
                    var t = {
                        data: e,
                        next: null
                    };
                    this.length > 0 ? this.tail.next = t : this.head = t, this.tail = t, ++this.length
                }, e.prototype.unshift = function(e) {
                    var t = {
                        data: e,
                        next: this.head
                    };
                    0 === this.length && (this.tail = t), this.head = t, ++this.length
                }, e.prototype.shift = function() {
                    if (0 !== this.length) {
                        var e = this.head.data;
                        return 1 === this.length ? this.head = this.tail = null : this.head = this.head.next, --this.length, e
                    }
                }, e.prototype.clear = function() {
                    this.head = this.tail = null, this.length = 0
                }, e.prototype.join = function(e) {
                    if (0 === this.length) return "";
                    for (var t = this.head, n = "" + t.data; t = t.next;) n += e + t.data;
                    return n
                }, e.prototype.concat = function(e) {
                    if (0 === this.length) return c.alloc(0);
                    if (1 === this.length) return this.head.data;
                    for (var t, n, r = c.allocUnsafe(e >>> 0), i = this.head, a = 0; i;) t = i.data, n = a, t.copy(r, n), a += i.data.length, i = i.next;
                    return r
                }, e
            }(), d && d.inspect && d.inspect.custom && (sZ.exports.prototype[d.inspect.custom] = function() {
                var e = d.inspect({
                    length: this.length
                });
                return this.constructor.name + " " + e
            })), sJ),
            p = s0();
        s.inherits(m, i);
        var v = ["error", "close", "destroy", "pause", "resume"];

        function y(e, n) {
            e = e || {};
            var r = n instanceof(t = t || s2());
            this.objectMode = !!e.objectMode, r && (this.objectMode = this.objectMode || !!e.readableObjectMode);
            var i = e.highWaterMark,
                a = e.readableHighWaterMark,
                o = this.objectMode ? 16 : 16384;
            this.highWaterMark = i || 0 === i ? i : r && (a || 0 === a) ? a : o, this.highWaterMark = Math.floor(this.highWaterMark), this.buffer = new h, this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = null, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.resumeScheduled = !1, this.destroyed = !1, this.defaultEncoding = e.defaultEncoding || "utf8", this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, e.encoding && (f || (f = ut().StringDecoder), this.decoder = new f(e.encoding), this.encoding = e.encoding)
        }

        function m(e) {
            if (t = t || s2(), !(this instanceof m)) return new m(e);
            this._readableState = new y(e, this), this.readable = !0, e && ("function" == typeof e.read && (this._read = e.read), "function" == typeof e.destroy && (this._destroy = e.destroy)), i.call(this)
        }

        function b(e, t, n, r, i) {
            var s, u, l, c, d, f = e._readableState;
            return null === t ? (f.reading = !1, function(e, t) {
                if (!t.ended) {
                    if (t.decoder) {
                        var n = t.decoder.end();
                        n && n.length && (t.buffer.push(n), t.length += t.objectMode ? 1 : n.length)
                    }
                    t.ended = !0, P(e)
                }
            }(e, f)) : (i || (s = f, u = t, a.isBuffer(u) || u instanceof o || "string" == typeof u || void 0 === u || s.objectMode || (l = TypeError("Invalid non-string/buffer chunk")), d = l), d ? e.emit("error", d) : f.objectMode || t && t.length > 0 ? ("string" == typeof t || f.objectMode || Object.getPrototypeOf(t) === a.prototype || (c = t, t = a.from(c)), r ? f.endEmitted ? e.emit("error", Error("stream.unshift() after end event")) : w(e, f, t, !0) : f.ended ? e.emit("error", Error("stream.push() after EOF")) : (f.reading = !1, f.decoder && !n ? (t = f.decoder.write(t), f.objectMode || 0 !== t.length ? w(e, f, t, !1) : R(e, f)) : w(e, f, t, !1))) : r || (f.reading = !1)), !f.ended && (f.needReadable || f.length < f.highWaterMark || 0 === f.length)
        }

        function w(e, t, n, r) {
            t.flowing && 0 === t.length && !t.sync ? (e.emit("data", n), e.read(0)) : (t.length += t.objectMode ? 1 : n.length, r ? t.buffer.unshift(n) : t.buffer.push(n), t.needReadable && P(e)), R(e, t)
        }

        function x(e, t) {
            var n;
            return e <= 0 || 0 === t.length && t.ended ? 0 : t.objectMode ? 1 : e != e ? t.flowing && t.length ? t.buffer.head.data.length : t.length : (e > t.highWaterMark && ((n = e) >= 8388608 ? n = 8388608 : (n--, n |= n >>> 1, n |= n >>> 2, n |= n >>> 4, n |= n >>> 8, n |= n >>> 16, n++), t.highWaterMark = n), e <= t.length ? e : t.ended ? t.length : (t.needReadable = !0, 0))
        }

        function P(t) {
            var n = t._readableState;
            n.needReadable = !1, n.emittedReadable || (l("emitReadable", n.flowing), n.emittedReadable = !0, n.sync ? e.nextTick(S, t) : S(t))
        }

        function S(e) {
            l("emit readable"), e.emit("readable"), A(e)
        }

        function R(t, n) {
            n.readingMore || (n.readingMore = !0, e.nextTick(T, t, n))
        }

        function T(e, t) {
            for (var n = t.length; !t.reading && !t.flowing && !t.ended && t.length < t.highWaterMark && (l("maybeReadMore read 0"), e.read(0), n !== t.length);) n = t.length;
            t.readingMore = !1
        }

        function E(e) {
            l("readable nexttick read 0"), e.read(0)
        }

        function k(e, t) {
            t.reading || (l("resume read 0"), e.read(0)), t.resumeScheduled = !1, t.awaitDrain = 0, e.emit("resume"), A(e), t.flowing && !t.reading && e.read(0)
        }

        function A(e) {
            var t = e._readableState;
            for (l("flow", t.flowing); t.flowing && null !== e.read(););
        }

        function q(e, t) {
            var n, r, i, o;
            return 0 === t.length ? null : (t.objectMode ? n = t.buffer.shift() : !e || e >= t.length ? (n = t.decoder ? t.buffer.join("") : 1 === t.buffer.length ? t.buffer.head.data : t.buffer.concat(t.length), t.buffer.clear()) : (r = t.buffer, i = t.decoder, e < r.head.data.length ? (o = r.head.data.slice(0, e), r.head.data = r.head.data.slice(e)) : o = e === r.head.data.length ? r.shift() : i ? function(e, t) {
                var n = t.head,
                    r = 1,
                    i = n.data;
                for (e -= i.length; n = n.next;) {
                    var a = n.data,
                        o = e > a.length ? a.length : e;
                    if (o === a.length ? i += a : i += a.slice(0, e), 0 == (e -= o)) {
                        o === a.length ? (++r, n.next ? t.head = n.next : t.head = t.tail = null) : (t.head = n, n.data = a.slice(o));
                        break
                    }++r
                }
                return t.length -= r, i
            }(e, r) : function(e, t) {
                var n = a.allocUnsafe(e),
                    r = t.head,
                    i = 1;
                for (r.data.copy(n), e -= r.data.length; r = r.next;) {
                    var o = r.data,
                        s = e > o.length ? o.length : e;
                    if (o.copy(n, n.length - e, 0, s), 0 == (e -= s)) {
                        s === o.length ? (++i, r.next ? t.head = r.next : t.head = t.tail = null) : (t.head = r, r.data = o.slice(s));
                        break
                    }++i
                }
                return t.length -= i, n
            }(e, r), n = o), n)
        }

        function j(t) {
            var n = t._readableState;
            if (n.length > 0) throw Error('"endReadable()" called on non-empty stream');
            n.endEmitted || (n.ended = !0, e.nextTick(_, n, t))
        }

        function _(e, t) {
            e.endEmitted || 0 !== e.length || (e.endEmitted = !0, t.readable = !1, t.emit("end"))
        }

        function I(e, t) {
            for (var n = 0, r = e.length; n < r; n++)
                if (e[n] === t) return n;
            return -1
        }
        return Object.defineProperty(m.prototype, "destroyed", {
            get: function() {
                return void 0 !== this._readableState && this._readableState.destroyed
            },
            set: function(e) {
                this._readableState && (this._readableState.destroyed = e)
            }
        }), m.prototype.destroy = p.destroy, m.prototype._undestroy = p.undestroy, m.prototype._destroy = function(e, t) {
            this.push(null), t(e)
        }, m.prototype.push = function(e, t) {
            var n, r = this._readableState;
            return r.objectMode ? n = !0 : "string" == typeof e && ((t = t || r.defaultEncoding) !== r.encoding && (e = a.from(e, t), t = ""), n = !0), b(this, e, t, !1, n)
        }, m.prototype.unshift = function(e) {
            return b(this, e, null, !0, !1)
        }, m.prototype.isPaused = function() {
            return !1 === this._readableState.flowing
        }, m.prototype.setEncoding = function(e) {
            return f || (f = ut().StringDecoder), this._readableState.decoder = new f(e), this._readableState.encoding = e, this
        }, m.prototype.read = function(e) {
            l("read", e), e = parseInt(e, 10);
            var t = this._readableState,
                n = e;
            if (0 !== e && (t.emittedReadable = !1), 0 === e && t.needReadable && (t.length >= t.highWaterMark || t.ended)) return l("read: emitReadable", t.length, t.ended), 0 === t.length && t.ended ? j(this) : P(this), null;
            if (0 === (e = x(e, t)) && t.ended) return 0 === t.length && j(this), null;
            var r, i = t.needReadable;
            return l("need readable", i), (0 === t.length || t.length - e < t.highWaterMark) && l("length less than watermark", i = !0), t.ended || t.reading ? l("reading or ended", i = !1) : i && (l("do read"), t.reading = !0, t.sync = !0, 0 === t.length && (t.needReadable = !0), this._read(t.highWaterMark), t.sync = !1, t.reading || (e = x(n, t))), null === (r = e > 0 ? q(e, t) : null) ? (t.needReadable = !0, e = 0) : t.length -= e, 0 === t.length && (t.ended || (t.needReadable = !0), n !== e && t.ended && j(this)), null !== r && this.emit("data", r), r
        }, m.prototype._read = function(e) {
            this.emit("error", Error("_read() is not implemented"))
        }, m.prototype.pipe = function(t, i) {
            var a = this,
                o = this._readableState;
            switch (o.pipesCount) {
                case 0:
                    o.pipes = t;
                    break;
                case 1:
                    o.pipes = [o.pipes, t];
                    break;
                default:
                    o.pipes.push(t)
            }
            o.pipesCount += 1, l("pipe count=%d opts=%j", o.pipesCount, i);
            var s = i && !1 === i.end || t === g.default.stdout || t === g.default.stderr ? m : u;

            function u() {
                l("onend"), t.end()
            }
            o.endEmitted ? e.nextTick(s) : a.once("end", s), t.on("unpipe", function e(n, r) {
                l("onunpipe"), n === a && r && !1 === r.hasUnpiped && (r.hasUnpiped = !0, l("cleanup"), t.removeListener("close", v), t.removeListener("finish", y), t.removeListener("drain", c), t.removeListener("error", p), t.removeListener("unpipe", e), a.removeListener("end", u), a.removeListener("end", m), a.removeListener("data", h), d = !0, o.awaitDrain && (!t._writableState || t._writableState.needDrain) && c())
            });
            var c = function() {
                var e = a._readableState;
                l("pipeOnDrain", e.awaitDrain), e.awaitDrain && e.awaitDrain--, 0 === e.awaitDrain && r(a, "data") && (e.flowing = !0, A(a))
            };
            t.on("drain", c);
            var d = !1,
                f = !1;

            function h(e) {
                l("ondata"), f = !1, !1 !== t.write(e) || f || ((1 === o.pipesCount && o.pipes === t || o.pipesCount > 1 && -1 !== I(o.pipes, t)) && !d && (l("false write response, pause", a._readableState.awaitDrain), a._readableState.awaitDrain++, f = !0), a.pause())
            }

            function p(e) {
                l("onerror", e), m(), t.removeListener("error", p), 0 === r(t, "error") && t.emit("error", e)
            }

            function v() {
                t.removeListener("finish", y), m()
            }

            function y() {
                l("onfinish"), t.removeListener("close", v), m()
            }

            function m() {
                l("unpipe"), a.unpipe(t)
            }
            return a.on("data", h),
                function(e, t, r) {
                    if ("function" == typeof e.prependListener) return e.prependListener(t, r);
                    e._events && e._events[t] ? n(e._events[t]) ? e._events[t].unshift(r) : e._events[t] = [r, e._events[t]] : e.on(t, r)
                }(t, "error", p), t.once("close", v), t.once("finish", y), t.emit("pipe", a), o.flowing || (l("pipe resume"), a.resume()), t
        }, m.prototype.unpipe = function(e) {
            var t = this._readableState,
                n = {
                    hasUnpiped: !1
                };
            if (0 === t.pipesCount) return this;
            if (1 === t.pipesCount) return e && e !== t.pipes || (e || (e = t.pipes), t.pipes = null, t.pipesCount = 0, t.flowing = !1, e && e.emit("unpipe", this, n)), this;
            if (!e) {
                var r = t.pipes,
                    i = t.pipesCount;
                t.pipes = null, t.pipesCount = 0, t.flowing = !1;
                for (var a = 0; a < i; a++) r[a].emit("unpipe", this, n);
                return this
            }
            var o = I(t.pipes, e);
            return -1 === o || (t.pipes.splice(o, 1), t.pipesCount -= 1, 1 === t.pipesCount && (t.pipes = t.pipes[0]), e.emit("unpipe", this, n)), this
        }, m.prototype.on = function(t, n) {
            var r = i.prototype.on.call(this, t, n);
            if ("data" === t) !1 !== this._readableState.flowing && this.resume();
            else if ("readable" === t) {
                var a = this._readableState;
                a.endEmitted || a.readableListening || (a.readableListening = a.needReadable = !0, a.emittedReadable = !1, a.reading ? a.length && P(this) : e.nextTick(E, this))
            }
            return r
        }, m.prototype.addListener = m.prototype.on, m.prototype.resume = function() {
            var t = this._readableState;
            return t.flowing || (l("resume"), t.flowing = !0, t.resumeScheduled || (t.resumeScheduled = !0, e.nextTick(k, this, t))), this
        }, m.prototype.pause = function() {
            return l("call pause flowing=%j", this._readableState.flowing), !1 !== this._readableState.flowing && (l("pause"), this._readableState.flowing = !1, this.emit("pause")), this
        }, m.prototype.wrap = function(e) {
            var t = this,
                n = this._readableState,
                r = !1;
            for (var i in e.on("end", function() {
                    if (l("wrapped end"), n.decoder && !n.ended) {
                        var e = n.decoder.end();
                        e && e.length && t.push(e)
                    }
                    t.push(null)
                }), e.on("data", function(i) {
                    l("wrapped data"), n.decoder && (i = n.decoder.write(i)), n.objectMode && null == i || (n.objectMode || i && i.length) && (t.push(i) || (r = !0, e.pause()))
                }), e) void 0 === this[i] && "function" == typeof e[i] && (this[i] = function(t) {
                return function() {
                    return e[t].apply(e, arguments)
                }
            }(i));
            for (var a = 0; a < v.length; a++) e.on(v[a], this.emit.bind(this, v[a]));
            return this._read = function(t) {
                l("wrapped _read", t), r && (r = !1, e.resume())
            }, this
        }, Object.defineProperty(m.prototype, "readableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._readableState.highWaterMark
            }
        }), m._fromList = q, s3
    }

    function ur() {
        if (s5) return s8;
        s5 = 1, s8 = r;
        var e = s2(),
            t = Object.create(oG);

        function n(e, t) {
            var n = this._transformState;
            n.transforming = !1;
            var r = n.writecb;
            if (!r) return this.emit("error", Error("write callback called multiple times"));
            n.writechunk = null, n.writecb = null, null != t && this.push(t), r(e);
            var i = this._readableState;
            i.reading = !1, (i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
        }

        function r(t) {
            if (!(this instanceof r)) return new r(t);
            e.call(this, t), this._transformState = {
                afterTransform: n.bind(this),
                needTransform: !1,
                transforming: !1,
                writecb: null,
                writechunk: null,
                writeencoding: null
            }, this._readableState.needReadable = !0, this._readableState.sync = !1, t && ("function" == typeof t.transform && (this._transform = t.transform), "function" == typeof t.flush && (this._flush = t.flush)), this.on("prefinish", i)
        }

        function i() {
            var e = this;
            "function" == typeof this._flush ? this._flush(function(t, n) {
                a(e, t, n)
            }) : a(this, null, null)
        }

        function a(e, t, n) {
            if (t) return e.emit("error", t);
            if (null != n && e.push(n), e._writableState.length) throw Error("Calling transform done when ws.length != 0");
            if (e._transformState.transforming) throw Error("Calling transform done when still transforming");
            return e.push(null)
        }
        return t.inherits = oz, t.inherits(r, e), r.prototype.push = function(t, n) {
            return this._transformState.needTransform = !1, e.prototype.push.call(this, t, n)
        }, r.prototype._transform = function(e, t, n) {
            throw Error("_transform() is not implemented")
        }, r.prototype._write = function(e, t, n) {
            var r = this._transformState;
            if (r.writecb = n, r.writechunk = e, r.writeencoding = t, !r.transforming) {
                var i = this._readableState;
                (r.needTransform || i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
            }
        }, r.prototype._read = function(e) {
            var t = this._transformState;
            null !== t.writechunk && t.writecb && !t.transforming ? (t.transforming = !0, this._transform(t.writechunk, t.writeencoding, t.afterTransform)) : t.needTransform = !0
        }, r.prototype._destroy = function(t, n) {
            var r = this;
            e.prototype._destroy.call(this, t, function(e) {
                n(e), r.emit("close")
            })
        }, s8
    }
    i = {
        get exports() {
            return s_
        },
        set exports(e) {
            s_ = e
        }
    }, a = s_, o = oj.default, "disable" === g.default.env.READABLE_STREAM && o ? (i.exports = o, (a = i.exports = o.Readable).Readable = o.Readable, a.Writable = o.Writable, a.Duplex = o.Duplex, a.Transform = o.Transform, a.PassThrough = o.PassThrough, a.Stream = o) : ((a = i.exports = un()).Stream = o || a, a.Readable = a, a.Writable = s1(), a.Duplex = s2(), a.Transform = ur(), a.PassThrough = function() {
        if (s9) return s7;
        s9 = 1, s7 = n;
        var e = ur(),
            t = Object.create(oG);

        function n(t) {
            if (!(this instanceof n)) return new n(t);
            e.call(this, t)
        }
        return t.inherits = oz, t.inherits(n, e), n.prototype._transform = function(e, t, n) {
            n(null, e)
        }, s7
    }());
    var ui = s_;

    function ua(e, t, n) {
        void 0 === n && (n = t, t = e, e = null), ui.Duplex.call(this, e), "function" != typeof n.read && (n = new ui.Readable(e).wrap(n)), this._writable = t, this._readable = n, this._waiting = !1;
        var r = this;
        t.once("finish", function() {
            r.end()
        }), this.once("finish", function() {
            t.end()
        }), n.on("readable", function() {
            r._waiting && (r._waiting = !1, r._read())
        }), n.once("end", function() {
            r.push(null)
        }), e && void 0 !== e.bubbleErrors && !e.bubbleErrors || (t.on("error", function(e) {
            r.emit("error", e)
        }), n.on("error", function(e) {
            r.emit("error", e)
        }))
    }
    ua.prototype = Object.create(ui.Duplex.prototype, {
        constructor: {
            value: ua
        }
    }), ua.prototype._write = function(e, t, n) {
        this._writable.write(e, t, n)
    }, ua.prototype._read = function() {
        for (var e, t = 0; null !== (e = this._readable.read());) this.push(e), t++;
        0 === t && (this._waiting = !0)
    }, ({
        get exports() {
            return sj
        },
        set exports(e) {
            sj = e
        }
    }).exports = function(e, t, n) {
        return new ua(e, t, n)
    }, sj.DuplexWrapper = ua, oj.default.PassThrough, oj.default.PassThrough, oO.o, [].slice;
    var uo = "web-blox-css-mui",
        us = "web-blox-css-tss",
        uu = "u" > typeof window && void 0 !== window.document,
        ul = function() {
            var e = document.querySelector('meta[name="'.concat("emotion-insertion-point-ssr", '"]')),
                t = !1;
            document.head.childNodes.forEach(function(n) {
                var r, i;
                n === e ? t = !0 : t && n.nodeType === Node.ELEMENT_NODE && ((null == (r = n.getAttribute("data-emotion")) ? void 0 : r.includes("".concat(uo, "-global"))) || (null == (i = n.getAttribute("data-emotion")) ? void 0 : i.includes("".concat(us, "-global")))) && n.remove()
            })
        },
        uc = function(e) {
            var t = e.cache,
                n = e.children,
                r = t.muiCache,
                i = t.tssCache;
            return oh.default.createElement(oL.f, {
                value: r
            }, oh.default.createElement(oD.T, {
                value: i
            }, n))
        },
        ud = e.i(146931),
        uf = e.i(491278);
    let uh = null;
    var up = e.i(665869),
        uv = e.i(906791),
        uy = e.i(968439),
        um = e.i(415858),
        ug = function(e, t) {
            return (ug = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function ub(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        ug(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function uw(e, t, n, r) {
        return new(n || (n = Promise))(function(i, a) {
            function o(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function s(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function ux(e, t) {
        var n, r, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(u) {
                var l = [s, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                    if (n = 1, r && (i = 2 & l[0] ? r.return : l[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, l[1])).done) return i;
                    switch (r = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < i[1]) {
                                a.label = i[1], i = l;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(l);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function uP(e) {
        if (void 0 !== e) return null === e ? null : {
            LinkingPlatform: e.linkingPlatform
        }
    }

    function uS(e) {
        if (void 0 !== e) return null === e ? null : {
            pin: e.pin,
            reauthenticationToken: e.reauthenticationToken
        }
    }

    function uR(e) {
        if (void 0 !== e) return null === e ? null : {
            usernamePrefix: e.usernamePrefix,
            gender: e.gender,
            birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
            locale: e.locale,
            password: e.password,
            authenticationMethods: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    generateAndSetPassword: e.generateAndSetPassword
                }
            }(e.authenticationMethods),
            identityAttributes: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    originTypes: e.originTypes,
                    accountCountry: e.accountCountry,
                    accountCountrySubDivision: e.accountCountrySubDivision
                }
            }(e.identityAttributes),
            exemptions: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    bypassLoginAutomationChallenges: e.bypassLoginAutomationChallenges,
                    bypassLoginAccountSecurityChallenges: e.bypassLoginAccountSecurityChallenges,
                    allowAutomation: e.allowAutomation
                }
            }(e.exemptions),
            initialAccountSettings: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    boundAuthTokenValidation: e.boundAuthTokenValidation
                }
            }(e.initialAccountSettings),
            verifications: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    emailVerified: e.emailVerified,
                    idVerified: e.idVerified,
                    twoStepVerificationEmailEnabled: e.twoStepVerificationEmailEnabled,
                    faeVerified: e.faeVerified
                }
            }(e.verifications),
            group: e.group,
            hasPermanentExclusion: e.hasPermanentExclusion
        }
    }

    function uT(e) {
        var t;
        return null == (t = e) ? t : {
            code: (0, um.u)(t, "Code") ? t.Code : void 0,
            message: (0, um.u)(t, "Message") ? t.Message : void 0
        }
    }

    function uE(e) {
        var t;
        return null == (t = e) ? t : {
            errors: (0, um.u)(t, "errors") ? t.errors.map(uT) : void 0,
            usernamePrefix: (0, um.u)(t, "usernamePrefix") ? t.usernamePrefix : void 0,
            username: (0, um.u)(t, "username") ? t.username : void 0,
            userId: (0, um.u)(t, "userId") ? t.userId : void 0,
            password: (0, um.u)(t, "password") ? t.password : void 0
        }
    }

    function uk(e) {
        var t;
        return null == (t = e) ? t : {
            userId: (0, um.u)(t, "userId") ? t.userId : void 0,
            userKey: (0, um.u)(t, "userKey") ? t.userKey : void 0,
            name: (0, um.u)(t, "name") ? t.name : void 0,
            displayName: (0, um.u)(t, "displayName") ? t.displayName : void 0,
            createdTime: (0, um.u)(t, "createdTime") ? new Date(t.createdTime) : void 0,
            updatedTime: (0, um.u)(t, "updatedTime") ? new Date(t.updatedTime) : void 0,
            accountCountry: (0, um.u)(t, "accountCountry") ? t.accountCountry : void 0
        }
    }

    function uA(e) {
        var t;
        return null == (t = e) ? t : {
            method: (0, um.u)(t, "method") ? t.method : void 0,
            priority: (0, um.u)(t, "priority") ? t.priority : void 0
        }
    }

    function uq(e) {
        if (void 0 !== e) return null === e ? null : {
            clientPublicKey: e.clientPublicKey,
            clientEpochTimestamp: e.clientEpochTimestamp,
            saiSignature: e.saiSignature,
            serverNonce: e.serverNonce
        }
    }

    function uj(e) {
        if (void 0 !== e) return null === e ? null : {
            ctype: e.ctype,
            cvalue: e.cvalue,
            password: e.password,
            userId: e.userId,
            securityQuestionSessionId: e.securityQuestionSessionId,
            securityQuestionRedemptionToken: e.securityQuestionRedemptionToken,
            secureAuthenticationIntent: uq(e.secureAuthenticationIntent),
            accountBlob: e.accountBlob,
            accountLinkParameters: uP(e.accountLinkParameters),
            captchaId: e.captchaId,
            captchaToken: e.captchaToken,
            captchaProvider: e.captchaProvider,
            challengeId: e.challengeId
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u_(e, t) {
        var n, r;
        return null == e ? e : {
            user: (0, um.u)(e, "user") ? null == (n = e.user) ? n : {
                id: (0, um.u)(n, "id") ? n.id : void 0,
                name: (0, um.u)(n, "name") ? n.name : void 0,
                displayName: (0, um.u)(n, "displayName") ? n.displayName : void 0
            } : void 0,
            twoStepVerificationData: (0, um.u)(e, "twoStepVerificationData") ? null == (r = e.twoStepVerificationData) ? r : {
                mediaType: (0, um.u)(r, "mediaType") ? r.mediaType : void 0,
                ticket: (0, um.u)(r, "ticket") ? r.ticket : void 0
            } : void 0,
            identityVerificationLoginTicket: (0, um.u)(e, "identityVerificationLoginTicket") ? e.identityVerificationLoginTicket : void 0,
            isBanned: (0, um.u)(e, "isBanned") ? e.isBanned : void 0,
            accountBlob: (0, um.u)(e, "accountBlob") ? e.accountBlob : void 0,
            shouldUpdateEmail: (0, um.u)(e, "shouldUpdateEmail") ? e.shouldUpdateEmail : void 0,
            recoveryEmail: (0, um.u)(e, "recoveryEmail") ? e.recoveryEmail : void 0,
            passkeyRegistrationSucceeded: (0, um.u)(e, "passkeyRegistrationSucceeded") ? e.passkeyRegistrationSucceeded : void 0,
            shouldAutoLoginFromRecovery: (0, um.u)(e, "shouldAutoLoginFromRecovery") ? e.shouldAutoLoginFromRecovery : void 0,
            shouldPrompt2svRemoval: (0, um.u)(e, "shouldPrompt2svRemoval") ? e.shouldPrompt2svRemoval : void 0,
            shouldPromptPasskeyAddition: (0, um.u)(e, "shouldPromptPasskeyAddition") ? e.shouldPromptPasskeyAddition : void 0
        }
    }

    function uI(e, t) {
        return null == e ? e : {
            code: (0, um.u)(e, "code") ? e.code : void 0,
            message: (0, um.u)(e, "message") ? e.message : void 0
        }
    }

    function uC(e) {
        if (void 0 !== e) return null === e ? null : {
            translationKey: e.translationKey,
            translationNamespace: e.translationNamespace,
            translatedSourceString: e.translatedSourceString,
            parameters: e.parameters
        }
    }

    function uO(e) {
        if (void 0 !== e) return null === e ? null : {
            capturedAuditContent: void 0 === e.capturedAuditContent ? void 0 : (0, um.A)(e.capturedAuditContent, uC),
            additionalAuditContent: e.additionalAuditContent
        }
    }

    function uL(e) {
        var t;
        return null == (t = e) ? t : {
            provider: (0, um.u)(t, "provider") ? t.provider : void 0,
            identifier: (0, um.u)(t, "identifier") ? t.identifier : void 0
        }
    }

    function uD(e, t) {
        return null == e ? e : {
            didGenerateNewUsername: (0, um.u)(e, "didGenerateNewUsername") ? e.didGenerateNewUsername : void 0,
            suggestedUsernames: (0, um.u)(e, "suggestedUsernames") ? e.suggestedUsernames : void 0
        }
    }

    function uM(e) {
        var t;
        return null == (t = e) ? t : {
            nickname: (0, um.u)(t, "nickname") ? t.nickname : void 0
        }
    }

    function uN(e) {
        if (void 0 !== e) return null === e ? null : {
            username: e.username,
            password: e.password,
            gender: e.gender,
            birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
            displayName: e.displayName,
            isTosAgreementBoxChecked: e.isTosAgreementBoxChecked,
            email: e.email,
            locale: e.locale,
            assetIds: e.assetIds,
            bodyColorId: e.bodyColorId,
            bodyTypeScale: e.bodyTypeScale,
            headScale: e.headScale,
            heightScale: e.heightScale,
            widthScale: e.widthScale,
            proportionScale: e.proportionScale,
            referralData: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    acquisitionTime: void 0 === e.acquisitionTime ? void 0 : e.acquisitionTime.toISOString(),
                    acquisitionReferrer: e.acquisitionReferrer,
                    medium: e.medium,
                    source: e.source,
                    campaign: e.campaign,
                    adGroup: e.adGroup,
                    keyword: e.keyword,
                    matchType: e.matchType,
                    sendInfo: e.sendInfo,
                    requestSessionId: e.requestSessionId,
                    offerId: e.offerId
                }
            }(e.referralData),
            agreementIds: e.agreementIds,
            identityVerificationResultToken: e.identityVerificationResultToken,
            secureAuthenticationIntent: uq(e.secureAuthenticationIntent),
            otpSession: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    otpSessionToken: e.otpSessionToken,
                    otpContactType: e.otpContactType
                }
            }(e.otpSession),
            dataToken: e.dataToken,
            accountBlob: e.accountBlob,
            passkeySessionId: e.passkeySessionId,
            passkeyRegistrationResponse: e.passkeyRegistrationResponse,
            accountLinkParameters: uP(e.accountLinkParameters),
            auditSystemContent: uO(e.auditSystemContent),
            captchaId: e.captchaId,
            captchaToken: e.captchaToken,
            captchaProvider: e.captchaProvider,
            challengeId: e.challengeId
        }
    }

    function uU(e, t) {
        return null == e ? e : {
            userId: (0, um.u)(e, "userId") ? e.userId : void 0,
            starterPlaceId: (0, um.u)(e, "starterPlaceId") ? e.starterPlaceId : void 0,
            returnUrl: (0, um.u)(e, "returnUrl") ? e.returnUrl : void 0,
            accountBlob: (0, um.u)(e, "accountBlob") ? e.accountBlob : void 0
        }
    }

    function uB(e, t) {
        return null == e ? e : {
            voucher: (0, um.u)(e, "voucher") ? e.voucher : void 0,
            gender: (0, um.u)(e, "gender") ? e.gender : void 0,
            userId: (0, um.u)(e, "userId") ? e.userId : void 0,
            displayName: (0, um.u)(e, "displayName") ? e.displayName : void 0,
            openId: (0, um.u)(e, "openId") ? e.openId : void 0
        }
    }

    function uF(e) {
        if (void 0 !== e) return null === e ? null : {
            voucher: e.voucher,
            username: e.username,
            password: e.password
        }
    }

    function uH(e, t) {
        return null == e ? e : {
            loginPage: (0, um.u)(e, "loginPage") ? e.loginPage : void 0,
            realNameVerificationUrl: (0, um.u)(e, "realNameVerificationUrl") ? e.realNameVerificationUrl : void 0,
            isLinkingEnabled: (0, um.u)(e, "isLinkingEnabled") ? e.isLinkingEnabled : void 0
        }
    }

    function uV(e) {
        if (void 0 !== e) return null === e ? null : {
            displayName: e.displayName,
            agreementIds: e.agreementIds,
            tencentDeveloperAppType: e.tencentDeveloperAppType,
            channelId: e.channelId,
            gender: e.gender,
            birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
            voucher: e.voucher
        }
    }

    function uG(e) {
        if (void 0 !== e) return null === e ? null : {
            code: e.code,
            state: e.state,
            appType: e.appType,
            channelId: e.channelId
        }
    }

    function uW(e) {
        if (void 0 !== e) return null === e ? null : {
            voucher: e.voucher,
            username: e.username,
            ticket: e.ticket,
            code: e.code
        }
    }

    function uK(e, t) {
        return null == e ? e : {
            code: (0, um.u)(e, "code") ? e.code : void 0,
            message: (0, um.u)(e, "message") ? e.message : void 0
        }
    }

    function uz(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, um.u)(t, "Id") ? t.Id : void 0,
            userId: (0, um.u)(t, "UserId") ? t.UserId : void 0,
            username: (0, um.u)(t, "Username") ? t.Username : void 0
        }
    }

    function uX(e, t) {
        return null == e ? e : {
            success: (0, um.u)(e, "success") ? e.success : void 0
        }
    }(function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1AccountCreationMetadataGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/account-creation/metadata",
                                schemaPath: "/v1/account-creation/metadata",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    isEligibleForALSignup: (0, um.u)(e, "isEligibleForALSignup") ? e.isEligibleForALSignup : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AccountCreationMetadataGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1AccountCreationMetadataGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1AccountPinDeleteRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "DELETE",
                                headers: r,
                                query: n,
                                body: uS(e.requestBody)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uX(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1AccountPinDelete = function() {
            return uw(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AccountPinDeleteRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1AccountPinGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    isEnabled: (0, um.u)(e, "isEnabled") ? e.isEnabled : void 0,
                                    unlockedUntil: (0, um.u)(e, "unlockedUntil") ? e.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AccountPinGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1AccountPinGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1AccountPinLockPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/account/pin/lock",
                                schemaPath: "/v1/account/pin/lock",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return uX(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1AccountPinLockPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1AccountPinLockPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1AccountPinPatchRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.requestBody || void 0 === e.requestBody) throw new um.w("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPatch.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: uS(e.requestBody)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uX(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1AccountPinPatch = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AccountPinPatchRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1AccountPinPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.requestBody || void 0 === e.requestBody) throw new um.w("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uS(e.requestBody)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uX(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1AccountPinPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AccountPinPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1AccountPinUnlockPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.requestBody || void 0 === e.requestBody) throw new um.w("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinUnlockPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin/unlock",
                                schemaPath: "/v1/account/pin/unlock",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uS(e.requestBody)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    unlockedUntil: (0, um.u)(e, "unlockedUntil") ? e.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AccountPinUnlockPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AccountPinUnlockPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._);
    var uQ = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return ub(t, e), t.prototype.v1AuthMetadataGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/auth/metadata",
                                schemaPath: "/v1/auth/metadata",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    cookieLawNoticeTimeout: (0, um.u)(e, "cookieLawNoticeTimeout") ? e.cookieLawNoticeTimeout : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AuthMetadataGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1AuthMetadataGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1LoginLinkedPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginLinkedPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login/linked",
                                schemaPath: "/v1/login/linked",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uj(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1LoginLinkedPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1LoginLinkedPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1LoginPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login",
                                schemaPath: "/v1/login",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uj(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1LoginPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1LoginPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1LogoutPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/logout",
                                schemaPath: "/v1/logout",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r)]
                    }
                })
            })
        }, t.prototype.v1LogoutPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1LogoutPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1LogoutfromallsessionsandreauthenticatePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1LogoutfromallsessionsandreauthenticatePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/logoutfromallsessionsandreauthenticate",
                                schemaPath: "/v1/logoutfromallsessionsandreauthenticate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        SecureAuthenticationIntent: uq(e.secureAuthenticationIntent)
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1LogoutfromallsessionsandreauthenticatePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1LogoutfromallsessionsandreauthenticatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1SessionRefreshPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/session/refresh",
                                schemaPath: "/v1/session/refresh",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r)]
                    }
                })
            })
        }, t.prototype.v1SessionRefreshPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1SessionRefreshPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdImpersonatePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new um.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdImpersonatePost.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/users/{userId}/impersonate".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/users/{userId}/impersonate",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1UsersUserIdImpersonatePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UsersUserIdImpersonatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t
    }(um._);
    (function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1AuthenticationTicketPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/authentication-ticket",
                                schemaPath: "/v1/authentication-ticket",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        clientAssertion: e.clientAssertion
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1AuthenticationTicketPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AuthenticationTicketPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1AuthenticationTicketRedeemPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.rBXAuthenticationNegotiation || void 0 === e.rBXAuthenticationNegotiation) throw new um.w("rBXAuthenticationNegotiation", "Required parameter requestParameters.rBXAuthenticationNegotiation was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", void 0 !== e.rBXAuthenticationNegotiation && null !== e.rBXAuthenticationNegotiation && (r.RBXAuthenticationNegotiation = String(e.rBXAuthenticationNegotiation)), [4, this.request({
                                path: "/v1/authentication-ticket/redeem",
                                schemaPath: "/v1/authentication-ticket/redeem",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        authenticationTicket: e.authenticationTicket,
                                        retainCurrentSession: e.retainCurrentSession,
                                        accountBlob: e.accountBlob,
                                        issueNewBlob: e.issueNewBlob
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    accountBlob: (0, um.u)(e, "accountBlob") ? e.accountBlob : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AuthenticationTicketRedeemPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AuthenticationTicketRedeemPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1AuthenticationTicketRetrieveUserPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRetrieveUserPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/authentication-ticket/retrieve-user",
                                schemaPath: "/v1/authentication-ticket/retrieve-user",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        authenticationTicket: e.authenticationTicket
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    userId: (0, um.u)(e, "UserId") ? e.UserId : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1AuthenticationTicketRetrieveUserPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1AuthenticationTicketRetrieveUserPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ClientAssertionGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/client-assertion",
                                schemaPath: "/v1/client-assertion",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    clientAssertion: (0, um.u)(e, "clientAssertion") ? e.clientAssertion : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1ClientAssertionGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1ClientAssertionGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1ExternalAccessPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalAccessPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/access",
                                schemaPath: "/v1/external/access",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        authenticationProof: e.authenticationProof,
                                        identityProviderPlatformType: e.identityProviderPlatformType,
                                        additionalInfoPayload: e.additionalInfoPayload
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    placeId: (0, um.u)(e, "placeId") ? e.placeId : void 0,
                                    isolationContext: (0, um.u)(e, "isolationContext") ? e.isolationContext : void 0,
                                    launchData: (0, um.u)(e, "launchData") ? e.launchData : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1ExternalAccessPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalAccessPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ExternalIdentityProviderIdSsoOauthCallbackGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.identityProviderId || void 0 === e.identityProviderId) throw new um.w("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === e.code || void 0 === e.code) throw new um.w("code", "Required parameter requestParameters.code was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === e.state || void 0 === e.state) throw new um.w("state", "Required parameter requestParameters.state was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            return n = {}, void 0 !== e.code && (n.code = e.code), void 0 !== e.state && (n.state = e.state), r = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/callback".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(e.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/callback",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.V(i)]
                    }
                })
            })
        }, t.prototype.v1ExternalIdentityProviderIdSsoOauthCallbackGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthCallbackGetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1ExternalIdentityProviderIdSsoOauthInitGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.identityProviderId || void 0 === e.identityProviderId) throw new um.w("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthInitGet.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/init".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(e.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/init",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.V(i)]
                    }
                })
            })
        }, t.prototype.v1ExternalIdentityProviderIdSsoOauthInitGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthInitGetRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i, a;
                return ux(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.identityProviderId || void 0 === e.identityProviderId) throw new um.w("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost.");
                            return n = {}, r = {}, (0, um.I)([{
                                contentType: "multipart/form-data"
                            }]), i = new URLSearchParams, void 0 !== e.sAMLResponse && i.append("SAMLResponse", e.sAMLResponse), void 0 !== e.relayState && i.append("RelayState", e.relayState), [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/saml/assertion-consumer-service".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(e.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/saml/assertion-consumer-service",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: i
                            }, t)];
                        case 1:
                            return a = o.sent(), [2, new um.V(a)]
                    }
                })
            })
        }, t.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1ExternalLoginAndLinkPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginAndLinkPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/loginAndLink",
                                schemaPath: "/v1/external/loginAndLink",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        ctype: e.ctype,
                                        cvalue: e.cvalue,
                                        password: e.password,
                                        authenticationProof: e.authenticationProof,
                                        IdentityProviderPlatformType: e.identityProviderPlatformType,
                                        additionalInfoPayload: e.additionalInfoPayload
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1ExternalLoginAndLinkPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalLoginAndLinkPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ExternalLoginPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/login",
                                schemaPath: "/v1/external/login",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        identityProvider: e.identityProvider,
                                        additionalData: e.additionalData,
                                        authenticationProof: e.authenticationProof
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    success: (0, um.u)(e, "success") ? e.success : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1ExternalLoginPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalLoginPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ExternalSignupPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalSignupPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/signup",
                                schemaPath: "/v1/external/signup",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        password: e.password,
                                        birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
                                        locale: e.locale,
                                        authenticationProof: e.authenticationProof,
                                        IdentityProviderPlatformType: e.identityProviderPlatformType,
                                        additionalInfoPayload: e.additionalInfoPayload
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.V(i)]
                    }
                })
            })
        }, t.prototype.v1ExternalSignupPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalSignupPostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1ExternalUnlinkPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalUnlinkPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/unlink",
                                schemaPath: "/v1/external/unlink",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        IdentityProviderPlatformType: e.identityProviderPlatformType,
                                        additionalInfoPayload: e.additionalInfoPayload
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.V(i)]
                    }
                })
            })
        }, t.prototype.v1ExternalUnlinkPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ExternalUnlinkPostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1IdentityInitializeLoginPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.initializeLoginRequest || void 0 === e.initializeLoginRequest) throw new um.w("initializeLoginRequest", "Required parameter requestParameters.initializeLoginRequest was null or undefined when calling v1IdentityInitializeLoginPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/identity/initialize-login",
                                schemaPath: "/v1/identity/initialize-login",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        ctype: e.ctype,
                                        cvalue: e.cvalue,
                                        captchaId: e.captchaId,
                                        captchaToken: e.captchaToken,
                                        captchaProvider: e.captchaProvider,
                                        challengeId: e.challengeId
                                    }
                                }(e.initializeLoginRequest)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    loginMethods: (0, um.u)(e, "loginMethods") ? e.loginMethods.map(uA) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1IdentityInitializeLoginPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1IdentityInitializeLoginPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1IdentityVerificationLoginPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1IdentityVerificationLoginPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/identity-verification/login",
                                schemaPath: "/v1/identity-verification/login",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        loginTicket: e.loginTicket,
                                        resultToken: e.resultToken
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1IdentityVerificationLoginPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1IdentityVerificationLoginPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1MetadataGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/metadata",
                                schemaPath: "/v1/metadata",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    isUpdateUsernameEnabled: (0, um.u)(e, "isUpdateUsernameEnabled") ? e.isUpdateUsernameEnabled : void 0,
                                    ftuxAvatarAssetMap: (0, um.u)(e, "ftuxAvatarAssetMap") ? e.ftuxAvatarAssetMap : void 0,
                                    isEmailUpsellAtLogoutEnabled: (0, um.u)(e, "IsEmailUpsellAtLogoutEnabled") ? e.IsEmailUpsellAtLogoutEnabled : void 0,
                                    shouldFetchEmailUpsellIXPValuesAtLogout: (0, um.u)(e, "ShouldFetchEmailUpsellIXPValuesAtLogout") ? e.ShouldFetchEmailUpsellIXPValuesAtLogout : void 0,
                                    isAccountRecoveryPromptEnabled: (0, um.u)(e, "IsAccountRecoveryPromptEnabled") ? e.IsAccountRecoveryPromptEnabled : void 0,
                                    isContactMethodRequiredAtSignup: (0, um.u)(e, "IsContactMethodRequiredAtSignup") ? e.IsContactMethodRequiredAtSignup : void 0,
                                    isUserAgreementsSignupIntegrationEnabled: (0, um.u)(e, "IsUserAgreementsSignupIntegrationEnabled") ? e.IsUserAgreementsSignupIntegrationEnabled : void 0,
                                    isPasswordRequiredForUsernameChange: (0, um.u)(e, "IsPasswordRequiredForUsernameChange") ? e.IsPasswordRequiredForUsernameChange : void 0,
                                    isPasskeyFeatureEnabled: (0, um.u)(e, "IsPasskeyFeatureEnabled") ? e.IsPasskeyFeatureEnabled : void 0,
                                    isAltBrowserTracker: (0, um.u)(e, "IsAltBrowserTracker") ? e.IsAltBrowserTracker : void 0,
                                    isLoginRedirectPageEnabled: (0, um.u)(e, "IsLoginRedirectPageEnabled") ? e.IsLoginRedirectPageEnabled : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1MetadataGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1MetadataGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1PalisadesLiveConnectPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveConnectPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/palisades-live/connect",
                                schemaPath: "/v1/palisades-live/connect",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        ctype: e.ctype,
                                        cvalue: e.cvalue,
                                        password: e.password
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveConnectPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveConnectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveDisconnectPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/palisades-live/disconnect",
                                schemaPath: "/v1/palisades-live/disconnect",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r)]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveDisconnectPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveDisconnectPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveIsLiveGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/palisades-live/is-live",
                                schemaPath: "/v1/palisades-live/is-live",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new um.H(r)] : [2, new um.U(r)]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveIsLiveGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveIsLiveGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveLoginPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/palisades-live/login",
                                schemaPath: "/v1/palisades-live/login",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new um.H(r)] : [2, new um.U(r)]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveLoginPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveLoginPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveSignupPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveSignupPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/palisades-live/signup",
                                schemaPath: "/v1/palisades-live/signup",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        password: e.password,
                                        birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
                                        locale: e.locale,
                                        gender: e.gender,
                                        agreementIds: e.agreementIds,
                                        auditSystemContent: uO(e.auditSystemContent)
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new um.H(i)] : [2, new um.U(i)]
                    }
                })
            })
        }, t.prototype.v1PalisadesLiveSignupPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PalisadesLiveSignupPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1PasskeyDeleteCredentialBatchPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyDeleteCredentialBatchPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/DeleteCredentialBatch",
                                schemaPath: "/v1/passkey/DeleteCredentialBatch",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        credentialNicknames: e.credentialNicknames
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1PasskeyDeleteCredentialBatchPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyDeleteCredentialBatchPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyFinishArPreauthRegistrationPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishArPreauthRegistrationPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/finish-ar-preauth-registration",
                                schemaPath: "/v1/passkey/finish-ar-preauth-registration",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        recoverySession: e.recoverySession,
                                        passkeySessionId: e.passkeySessionId,
                                        passkeyRegistrationResponse: e.passkeyRegistrationResponse,
                                        userId: e.userId,
                                        isPostRecovery: e.isPostRecovery,
                                        source: e.source
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1PasskeyFinishArPreauthRegistrationPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyFinishArPreauthRegistrationPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyFinishPreauthRegistrationPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishPreauthRegistrationPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/finish-preauth-registration",
                                schemaPath: "/v1/passkey/finish-preauth-registration",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        sessionId: e.sessionId,
                                        registrationResponse: e.registrationResponse,
                                        source: e.source
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1PasskeyFinishPreauthRegistrationPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyFinishPreauthRegistrationPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyFinishRegistrationPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishRegistrationPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/FinishRegistration",
                                schemaPath: "/v1/passkey/FinishRegistration",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        sessionId: e.sessionId,
                                        credentialNickname: e.credentialNickname,
                                        attestationResponse: e.attestationResponse,
                                        source: e.source
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1PasskeyFinishRegistrationPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyFinishRegistrationPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyListCredentialsPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyListCredentialsPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/ListCredentials",
                                schemaPath: "/v1/passkey/ListCredentials",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        all: e.all
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    credentials: (0, um.u)(e, "credentials") ? e.credentials.map(uM) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1PasskeyListCredentialsPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyListCredentialsPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartAuthenticationByUserPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartAuthenticationByUserPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/start-authentication-by-user",
                                schemaPath: "/v1/passkey/start-authentication-by-user",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        ctype: e.ctype,
                                        cvalue: e.cvalue
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    authenticationOptions: (0, um.u)(e, "authenticationOptions") ? e.authenticationOptions : void 0,
                                    sessionId: (0, um.u)(e, "sessionId") ? e.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartAuthenticationByUserPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyStartAuthenticationByUserPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartAuthenticationPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/passkey/StartAuthentication",
                                schemaPath: "/v1/passkey/StartAuthentication",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    authenticationOptions: (0, um.u)(e, "authenticationOptions") ? e.authenticationOptions : void 0,
                                    sessionId: (0, um.u)(e, "sessionId") ? e.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartAuthenticationPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1PasskeyStartAuthenticationPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartPreauthRegistrationPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartPreauthRegistrationPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/start-preauth-registration",
                                schemaPath: "/v1/passkey/start-preauth-registration",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    creationOptions: (0, um.u)(e, "creationOptions") ? e.creationOptions : void 0,
                                    sessionId: (0, um.u)(e, "sessionId") ? e.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartPreauthRegistrationPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyStartPreauthRegistrationPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartRegistrationPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartRegistrationPost.");
                            return n = {}, void 0 !== e.flow && (n.flow = e.flow), (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/StartRegistration",
                                schemaPath: "/v1/passkey/StartRegistration",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        isSilentUpgrade: e.isSilentUpgrade
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    creationOptions: (0, um.u)(e, "creationOptions") ? e.creationOptions : void 0,
                                    sessionId: (0, um.u)(e, "sessionId") ? e.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1PasskeyStartRegistrationPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasskeyStartRegistrationPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasskeySuEligibilityGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/passkey/su-eligibility",
                                schemaPath: "/v1/passkey/su-eligibility",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    suEligibility: (0, um.u)(e, "suEligibility") ? e.suEligibility : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1PasskeySuEligibilityGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1PasskeySuEligibilityGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1UserPasswordsChangePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UserPasswordsChangePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/user/passwords/change",
                                schemaPath: "/v1/user/passwords/change",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        currentPassword: e.currentPassword,
                                        newPassword: e.newPassword,
                                        secureAuthenticationIntent: uq(e.secureAuthenticationIntent)
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1UserPasswordsChangePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UserPasswordsChangePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1PasswordsValidateGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.username || void 0 === e.username) throw new um.w("username", "Required parameter requestParameters.username was null or undefined when calling v1PasswordsValidateGet.");
                            if (null === e.password || void 0 === e.password) throw new um.w("password", "Required parameter requestParameters.password was null or undefined when calling v1PasswordsValidateGet.");
                            return n = {}, void 0 !== e.username && (n.Username = e.username), void 0 !== e.password && (n.Password = e.password), r = {}, [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uI(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1PasswordsValidateGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasswordsValidateGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1PasswordsValidatePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PasswordsValidatePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        password: e.password
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uI(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1PasswordsValidatePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1PasswordsValidatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1QqCallbackPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1QqCallbackPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/callback",
                                schemaPath: "/v1/qq/callback",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uG(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uB(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1QqCallbackPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1QqCallbackPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1QqConnectPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1QqConnectPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/connect",
                                schemaPath: "/v1/qq/connect",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uF(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1QqConnectPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1QqConnectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1QqMetadataGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, void 0 !== e.apiKey && (n.apiKey = e.apiKey), void 0 !== e.getIdentifier && (n.getIdentifier = e.getIdentifier), void 0 !== e.appType && (n.appType = e.appType), r = {}, [4, this.request({
                                path: "/v1/qq/metadata",
                                schemaPath: "/v1/qq/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uH(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1QqMetadataGet = function() {
            return uw(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1QqMetadataGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1QqSignupwithoutpasswordPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1QqSignupwithoutpasswordPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/signupwithoutpassword",
                                schemaPath: "/v1/qq/signupwithoutpassword",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uV(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uU(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1QqSignupwithoutpasswordPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1QqSignupwithoutpasswordPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1QqTokenAuthenticationPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1QqTokenAuthenticationPost.");
                            return n = {}, void 0 !== e.apiKey && (n.apiKey = e.apiKey), (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/token-authentication",
                                schemaPath: "/v1/qq/token-authentication",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        openId: e.openId,
                                        accessToken: e.accessToken,
                                        accessTokenExpiry: e.accessTokenExpiry,
                                        channelId: e.channelId
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uB(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1QqTokenAuthenticationPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1QqTokenAuthenticationPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1QqVerifyConnectPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1QqVerifyConnectPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/verify-connect",
                                schemaPath: "/v1/qq/verify-connect",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uW(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1QqVerifyConnectPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1QqVerifyConnectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1RecoveryMetadataGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/recovery/metadata",
                                schemaPath: "/v1/recovery/metadata",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    isOnPhone: (0, um.u)(e, "isOnPhone") ? e.isOnPhone : void 0,
                                    codeLength: (0, um.u)(e, "codeLength") ? e.codeLength : void 0,
                                    isPhoneFeatureEnabledForUsername: (0, um.u)(e, "isPhoneFeatureEnabledForUsername") ? e.isPhoneFeatureEnabledForUsername : void 0,
                                    isPhoneFeatureEnabledForPassword: (0, um.u)(e, "isPhoneFeatureEnabledForPassword") ? e.isPhoneFeatureEnabledForPassword : void 0,
                                    isBedev2CaptchaEnabledForPasswordReset: (0, um.u)(e, "isBedev2CaptchaEnabledForPasswordReset") ? e.isBedev2CaptchaEnabledForPasswordReset : void 0,
                                    isUsernameRecoveryDeprecated: (0, um.u)(e, "isUsernameRecoveryDeprecated") ? e.isUsernameRecoveryDeprecated : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1RecoveryMetadataGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1RecoveryMetadataGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1RevertAccountGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.ticket || void 0 === e.ticket) throw new um.w("ticket", "Required parameter requestParameters.ticket was null or undefined when calling v1RevertAccountGet.");
                            return n = {}, void 0 !== e.ticket && (n.ticket = e.ticket), r = {}, [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    isTwoStepVerificationEnabled: (0, um.u)(e, "isTwoStepVerificationEnabled") ? e.isTwoStepVerificationEnabled : void 0,
                                    isEmailVerified: (0, um.u)(e, "isEmailVerified") ? e.isEmailVerified : void 0,
                                    isEmailChanged: (0, um.u)(e, "isEmailChanged") ? e.isEmailChanged : void 0,
                                    isPhoneVerified: (0, um.u)(e, "isPhoneVerified") ? e.isPhoneVerified : void 0,
                                    userId: (0, um.u)(e, "userId") ? e.userId : void 0,
                                    username: (0, um.u)(e, "username") ? e.username : void 0,
                                    ticket: (0, um.u)(e, "ticket") ? e.ticket : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1RevertAccountGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1RevertAccountGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1RevertAccountPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1RevertAccountPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        UserId: e.userId,
                                        NewPassword: e.newPassword,
                                        NewPasswordRepeated: e.newPasswordRepeated,
                                        Ticket: e.ticket,
                                        TwoStepVerificationChallengeId: e.twoStepVerificationChallengeId,
                                        TwoStepVerificationToken: e.twoStepVerificationToken
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1RevertAccountPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1RevertAccountPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1RevertInvalidateTicketsPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/revert/invalidate-tickets",
                                schemaPath: "/v1/revert/invalidate-tickets",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r)]
                    }
                })
            })
        }, t.prototype.v1RevertInvalidateTicketsPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1RevertInvalidateTicketsPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1SignupLinkedPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupLinkedPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup/linked",
                                schemaPath: "/v1/signup/linked",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uN(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uU(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1SignupLinkedPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SignupLinkedPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1SignupPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup",
                                schemaPath: "/v1/signup",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uN(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uU(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1SignupPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SignupPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1SocialConnectedProvidersGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/social/connected-providers",
                                schemaPath: "/v1/social/connected-providers",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    providers: (0, um.u)(e, "providers") ? e.providers.map(uL) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1SocialConnectedProvidersGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1SocialConnectedProvidersGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1SocialProviderDisconnectPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.provider || void 0 === e.provider) throw new um.w("provider", "Required parameter requestParameters.provider was null or undefined when calling v1SocialProviderDisconnectPost.");
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1SocialProviderDisconnectPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/social/{provider}/disconnect".replace("{".concat("provider", "}"), encodeURIComponent(String(e.provider))),
                                schemaPath: "/v1/social/{provider}/disconnect",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        Password: e.password
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1SocialProviderDisconnectPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SocialProviderDisconnectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1TestUserAuthenticateApiKeyPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserAuthenticateApiKeyPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/authenticate/api-key",
                                schemaPath: "/v1/test-user/authenticate/api-key",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        redirect: e.redirect
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.V(i)]
                    }
                })
            })
        }, t.prototype.v1TestUserAuthenticateApiKeyPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserAuthenticateApiKeyPostRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, t.prototype.v1TestUserCreateBatchPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserCreateBatchPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/create-batch",
                                schemaPath: "/v1/test-user/create-batch",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        createTestUserRequests: void 0 === e.createTestUserRequests ? void 0 : e.createTestUserRequests.map(uR)
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    createTestUserResponses: (0, um.u)(e, "createTestUserResponses") ? e.createTestUserResponses.map(uE) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1TestUserCreateBatchPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserCreateBatchPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1TestUserExemptionAddPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionAddPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/exemption/add",
                                schemaPath: "/v1/test-user/exemption/add",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        testUserId: e.testUserId,
                                        exemptionType: e.exemptionType
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1TestUserExemptionAddPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserExemptionAddPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1TestUserExemptionListGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.testUserId || void 0 === e.testUserId) throw new um.w("testUserId", "Required parameter requestParameters.testUserId was null or undefined when calling v1TestUserExemptionListGet.");
                            return n = {}, void 0 !== e.testUserId && (n.testUserId = e.testUserId), r = {}, [4, this.request({
                                path: "/v1/test-user/exemption/list",
                                schemaPath: "/v1/test-user/exemption/list",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    exemptions: (0, um.u)(e, "exemptions") ? e.exemptions : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1TestUserExemptionListGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserExemptionListGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1TestUserExemptionRemovePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionRemovePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/exemption/remove",
                                schemaPath: "/v1/test-user/exemption/remove",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        testUserId: e.testUserId,
                                        exemptionType: e.exemptionType
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1TestUserExemptionRemovePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserExemptionRemovePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1TestUserListGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/test-user/list",
                                schemaPath: "/v1/test-user/list",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    testUsers: (0, um.u)(e, "testUsers") ? e.testUsers.map(uk) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1TestUserListGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1TestUserListGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1TestUserLogoutManagerPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/test-user/logout-manager",
                                schemaPath: "/v1/test-user/logout-manager",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r)]
                    }
                })
            })
        }, t.prototype.v1TestUserLogoutManagerPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1TestUserLogoutManagerPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1TestUserValidateManagerPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserValidateManagerPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/validate-manager",
                                schemaPath: "/v1/test-user/validate-manager",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        managerApiKey: e.managerApiKey
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    managerExternalIdentifier: (0, um.u)(e, "managerExternalIdentifier") ? e.managerExternalIdentifier : void 0,
                                    sessionExpirationDate: (0, um.u)(e, "sessionExpirationDate") ? new Date(e.sessionExpirationDate) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1TestUserValidateManagerPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1TestUserValidateManagerPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1UsernameChangePriceGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/username/change/price",
                                schemaPath: "/v1/username/change/price",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    priceInRobux: (0, um.u)(e, "priceInRobux") ? e.priceInRobux : void 0,
                                    basePriceInRobux: (0, um.u)(e, "basePriceInRobux") ? e.basePriceInRobux : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UsernameChangePriceGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1UsernameChangePriceGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1UsernamePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/username",
                                schemaPath: "/v1/username",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        password: e.password
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1UsernamePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UsernamePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1UsernamesGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.username || void 0 === e.username) throw new um.w("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesGet.");
                            return n = {}, void 0 !== e.username && (n.username = e.username), r = {}, [4, this.request({
                                path: "/v1/usernames",
                                schemaPath: "/v1/usernames",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    usernames: (0, um.u)(e, "usernames") ? e.usernames : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UsernamesGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UsernamesGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1UsernamesRecoverPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesRecoverPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/usernames/recover",
                                schemaPath: "/v1/usernames/recover",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        targetType: e.targetType,
                                        target: e.target
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    transmissionType: (0, um.u)(e, "transmissionType") ? e.transmissionType : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1UsernamesRecoverPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UsernamesRecoverPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1UsernamesValidateGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.username || void 0 === e.username) throw new um.w("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === e.birthday || void 0 === e.birthday) throw new um.w("birthday", "Required parameter requestParameters.birthday was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === e.context || void 0 === e.context) throw new um.w("context", "Required parameter requestParameters.context was null or undefined when calling v1UsernamesValidateGet.");
                            return n = {}, void 0 !== e.username && (n.Username = e.username), void 0 !== e.birthday && (n.Birthday = e.birthday.toISOString()), void 0 !== e.context && (n.Context = e.context), r = {}, [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uK(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1UsernamesValidateGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UsernamesValidateGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1UsernamesValidatePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesValidatePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
                                        context: e.context
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uK(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1UsernamesValidatePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UsernamesValidatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1ValidatorsEmailGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.email || void 0 === e.email) throw new um.w("email", "Required parameter requestParameters.email was null or undefined when calling v1ValidatorsEmailGet.");
                            return n = {}, void 0 !== e.email && (n.Email = e.email), r = {}, [4, this.request({
                                path: "/v1/validators/email",
                                schemaPath: "/v1/validators/email",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    isEmailValid: (0, um.u)(e, "isEmailValid") ? e.isEmailValid : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1ValidatorsEmailGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ValidatorsEmailGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ValidatorsRecommendedUsernameFromDisplayNameGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.displayName || void 0 === e.displayName) throw new um.w("displayName", "Required parameter requestParameters.displayName was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            if (null === e.birthDay || void 0 === e.birthDay) throw new um.w("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            return n = {}, void 0 !== e.displayName && (n.DisplayName = e.displayName), void 0 !== e.birthDay && (n.BirthDay = e.birthDay.toISOString()), r = {}, [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uD(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1ValidatorsRecommendedUsernameFromDisplayNameGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ValidatorsRecommendedUsernameFromDisplayNameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ValidatorsRecommendedUsernameFromDisplayNamePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.requestBody || void 0 === e.requestBody) throw new um.w("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNamePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        displayName: e.displayName,
                                        birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString()
                                    }
                                }(e.requestBody)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uD(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1ValidatorsRecommendedUsernameFromDisplayNamePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ValidatorsRecommendedUsernameFromDisplayNamePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ValidatorsUsernameGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.username || void 0 === e.username) throw new um.w("username", "Required parameter requestParameters.username was null or undefined when calling v1ValidatorsUsernameGet.");
                            if (null === e.birthDay || void 0 === e.birthDay) throw new um.w("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsUsernameGet.");
                            return n = {}, void 0 !== e.username && (n.Username = e.username), void 0 !== e.birthDay && (n.BirthDay = e.birthDay.toISOString()), r = {}, [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uD(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1ValidatorsUsernameGet = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ValidatorsUsernameGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1ValidatorsUsernamePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.requestBody || void 0 === e.requestBody) throw new um.w("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsUsernamePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString()
                                    }
                                }(e.requestBody)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uD(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1ValidatorsUsernamePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1ValidatorsUsernamePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1WechatCallbackPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatCallbackPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/callback",
                                schemaPath: "/v1/wechat/callback",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uG(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uB(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1WechatCallbackPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatCallbackPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatConnectPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatConnectPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/connect",
                                schemaPath: "/v1/wechat/connect",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uF(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1WechatConnectPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatConnectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatMetadataGetRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, void 0 !== e.apiKey && (n.apiKey = e.apiKey), void 0 !== e.getIdentifier && (n.getIdentifier = e.getIdentifier), void 0 !== e.appType && (n.appType = e.appType), r = {}, [4, this.request({
                                path: "/v1/wechat/metadata",
                                schemaPath: "/v1/wechat/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uH(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1WechatMetadataGet = function() {
            return uw(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatMetadataGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatMigrateLuobuRnvMappingPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatMigrateLuobuRnvMappingPost.");
                            return n = {}, void 0 !== e.apiKey && (n.apiKey = e.apiKey), (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/migrate-luobu-rnv-mapping",
                                schemaPath: "/v1/wechat/migrate-luobu-rnv-mapping",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        unionId: e.unionId,
                                        username: e.username
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    unionId: (0, um.u)(e, "unionId") ? e.unionId : void 0,
                                    username: (0, um.u)(e, "username") ? e.username : void 0,
                                    isSuccess: (0, um.u)(e, "isSuccess") ? e.isSuccess : void 0,
                                    reason: (0, um.u)(e, "reason") ? e.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1WechatMigrateLuobuRnvMappingPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatMigrateLuobuRnvMappingPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatRobloxAccountCreatePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatRobloxAccountCreatePost.");
                            return n = {}, void 0 !== e.apiKey && (n.apiKey = e.apiKey), (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/roblox-account-create",
                                schemaPath: "/v1/wechat/roblox-account-create",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        unionId: e.unionId,
                                        openId: e.openId,
                                        displayName: e.displayName,
                                        birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
                                        username: e.username
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    userId: (0, um.u)(e, "userId") ? e.userId : void 0,
                                    isSuccess: (0, um.u)(e, "isSuccess") ? e.isSuccess : void 0,
                                    reason: (0, um.u)(e, "reason") ? e.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1WechatRobloxAccountCreatePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatRobloxAccountCreatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatSignupwithoutpasswordPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatSignupwithoutpasswordPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/signupwithoutpassword",
                                schemaPath: "/v1/wechat/signupwithoutpassword",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uV(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uU(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1WechatSignupwithoutpasswordPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatSignupwithoutpasswordPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatTencentIdGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/wechat/tencent-id",
                                schemaPath: "/v1/wechat/tencent-id",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r)]
                    }
                })
            })
        }, t.prototype.v1WechatTencentIdGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1WechatTencentIdGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatTokenAuthenticationPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatTokenAuthenticationPost.");
                            return n = {}, void 0 !== e.apiKey && (n.apiKey = e.apiKey), (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/token-authentication",
                                schemaPath: "/v1/wechat/token-authentication",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        openId: e.openId,
                                        accessToken: e.accessToken,
                                        accessTokenExpiry: e.accessTokenExpiry,
                                        refreshToken: e.refreshToken,
                                        refreshTokenExpiry: e.refreshTokenExpiry,
                                        channelId: e.channelId
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return uB(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1WechatTokenAuthenticationPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatTokenAuthenticationPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1WechatVerifyConnectPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatVerifyConnectPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/verify-connect",
                                schemaPath: "/v1/wechat/verify-connect",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: uW(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1WechatVerifyConnectPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1WechatVerifyConnectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1XboxConnectionGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/xbox/connection",
                                schemaPath: "/v1/xbox/connection",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    hasConnectedXboxAccount: (0, um.u)(e, "hasConnectedXboxAccount") ? e.hasConnectedXboxAccount : void 0,
                                    gamertag: (0, um.u)(e, "gamertag") ? e.gamertag : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1XboxConnectionGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1XboxConnectionGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxDisconnectPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/xbox/disconnect",
                                schemaPath: "/v1/xbox/disconnect",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return uX(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1XboxDisconnectPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1XboxDisconnectPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxGetLoginConsecutiveDaysGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/xbox/get-login-consecutive-days",
                                schemaPath: "/v1/xbox/get-login-consecutive-days",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    count: (0, um.u)(e, "count") ? e.count : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1XboxGetLoginConsecutiveDaysGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1XboxGetLoginConsecutiveDaysGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxTranslatePostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.xboxTranslateRequest || void 0 === e.xboxTranslateRequest) throw new um.w("xboxTranslateRequest", "Required parameter requestParameters.xboxTranslateRequest was null or undefined when calling v1XboxTranslatePost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox/translate",
                                schemaPath: "/v1/xbox/translate",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        ids: e.ids
                                    }
                                }(e.xboxTranslateRequest)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    users: (0, um.u)(e, "Users") ? e.Users.map(uz) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1XboxTranslatePost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxTranslatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        ub(t, e), t.prototype.v1XboxLiveAccountGetRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/xbox-live/account",
                                schemaPath: "/v1/xbox-live/account",
                                method: "GET",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r, function(e) {
                                return null == e ? e : {
                                    userId: (0, um.u)(e, "userId") ? e.userId : void 0,
                                    username: (0, um.u)(e, "username") ? e.username : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1XboxLiveAccountGet = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1XboxLiveAccountGetRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxLiveConnectPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/connect",
                                schemaPath: "/v1/xbox-live/connect",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        ctype: e.ctype,
                                        cvalue: e.cvalue,
                                        password: e.password
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return u_(e)
                            })]
                    }
                })
            })
        }, t.prototype.v1XboxLiveConnectPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxLiveConnectPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxLiveConnectVerifyPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.request || void 0 === e.request) throw new um.w("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectVerifyPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/connect/verify",
                                schemaPath: "/v1/xbox-live/connect/verify",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        challengeId: e.challengeId,
                                        verificationToken: e.verificationToken,
                                        actionType: e.actionType
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1XboxLiveConnectVerifyPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxLiveConnectVerifyPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxLiveDisconnectPostRaw = function(e) {
            return uw(this, void 0, void 0, function() {
                var t, n, r;
                return ux(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, n = {}, [4, this.request({
                                path: "/v1/xbox-live/disconnect",
                                schemaPath: "/v1/xbox-live/disconnect",
                                method: "POST",
                                headers: n,
                                query: t
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new um.H(r)]
                    }
                })
            })
        }, t.prototype.v1XboxLiveDisconnectPost = function(e) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1XboxLiveDisconnectPostRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxLiveLoginPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.xboxLoginRequest || void 0 === e.xboxLoginRequest) throw new um.w("xboxLoginRequest", "Required parameter requestParameters.xboxLoginRequest was null or undefined when calling v1XboxLiveLoginPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/login",
                                schemaPath: "/v1/xbox-live/login",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        clientTimeStamp: void 0 === e.clientTimeStamp ? void 0 : e.clientTimeStamp.toISOString()
                                    }
                                }(e.xboxLoginRequest)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i, function(e) {
                                return null == e ? e : {
                                    newDailyLogin: (0, um.u)(e, "newDailyLogin") ? e.newDailyLogin : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1XboxLiveLoginPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxLiveLoginPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, t.prototype.v1XboxLiveSignupPostRaw = function(e, t) {
            return uw(this, void 0, void 0, function() {
                var n, r, i;
                return ux(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.signupRequest || void 0 === e.signupRequest) throw new um.w("signupRequest", "Required parameter requestParameters.signupRequest was null or undefined when calling v1XboxLiveSignupPost.");
                            return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/signup",
                                schemaPath: "/v1/xbox-live/signup",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        username: e.username,
                                        password: e.password,
                                        birthday: void 0 === e.birthday ? void 0 : e.birthday.toISOString(),
                                        gender: e.gender,
                                        locale: e.locale,
                                        agreementIds: e.agreementIds,
                                        auditSystemContent: uO(e.auditSystemContent)
                                    }
                                }(e.signupRequest)
                            }, t)];
                        case 1:
                            return i = a.sent(), [2, new um.H(i)]
                    }
                })
            })
        }, t.prototype.v1XboxLiveSignupPost = function(e, t) {
            return uw(this, void 0, void 0, function() {
                return ux(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1XboxLiveSignupPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(um._);
    var u$ = e.i(272593);
    let uY = new uQ((0, u$.f)("auth", "bedev1"));
    var uJ = e.i(66424),
        uZ = e.i(790806),
        u0 = e.i(650502),
        u1 = e.i(220311);
    let u2 = [u1.f.Home, u1.f.RoadMap, u1.f.AvatarAnalytics, u1.f.ShareLinkAnalytics, u1.f.StoreAnalytics, u1.f.Community, u1.f.Notifications, u1.f.Settings, u1.f.SendrNotificationPreferences, u1.f.Preferences, u1.f.Advanced, u1.f.DataCollectionSettings, u1.f.MarketplaceOnboarding, u1.f.FiatPaidAccess, u1.f.PublicPublish, u1.f.DevEx, u1.f.Wallet, u1.f.GameTranslation, u1.f.GameStringTranslation],
        u4 = e => {
            let {
                provider: t
            } = e, {
                locale: n
            } = (0, oE.z)();
            return (0, oh.useEffect)(() => {
                null != n && t.loadTranslationResources([...u2], n)
            }, [n, t]), null
        };
    var u3 = e.i(921394),
        u6 = e.i(814975);
    let u8 = e => {
        let {
            children: t
        } = e, {
            user: n
        } = (0, u6.f)();
        return (0, b.jsx)(u3.w, {
            bedev2BaseUrl: "https://apis.roblox.com",
            currentUser: n,
            children: t
        })
    };
    var u5 = e.i(354088),
        u7 = e.i(899627);
    let u9 = e => {
        let {
            themeElement: t,
            children: n
        } = e, {
            themeMode: r
        } = (0, u3.g)();
        return (0, oh.useEffect)(() => {
            let e;
            if (null == t) return;
            switch (r) {
                case "light":
                    e = "color-mode-light";
                    break;
                case "dark":
                    e = "color-mode-dark";
                    break;
                default:
                    e = "color-mode-system"
            }
            let {
                classList: n
            } = t;
            return n.add(e), () => {
                n.remove(e)
            }
        }, [r, t]), (0, b.jsx)(u7.f, {
            theme: r,
            children: n
        })
    };
    var le = e.i(910272),
        lt = e.i(28850),
        ln = e.i(950492);
    let lr = ["creatorTransparency", "creatorAcknowledgments"];
    var li = e.i(945451),
        la = e.i(177610),
        lo = e.i(609305),
        ls = e.i(41242),
        lu = e.i(69230),
        ll = e.i(663624),
        lc = e.i(401263),
        ld = e.i(889311),
        lf = e.i(512229),
        lh = e.i(748411),
        lp = e.i(881670),
        lv = um;
    class ly extends lv._ {
        getViolation(e, t) {
            return this.request({
                path: "/v2/users/".concat(encodeURIComponent(e), "/violations/").concat(encodeURIComponent(t)),
                schemaPath: "/v2/users/{user}/violations/{violation}",
                method: "GET",
                headers: {}
            }).then(e => new lv.H(e).value())
        }
        constructor() {
            super((0, u$.f)("moderation-appeal-service", "bedev2"))
        }
    }
    let lm = new ly;
    var lg = e.i(330159),
        lb = e.i(641831),
        lw = e.i(57504),
        lx = e.i(623054),
        lP = e.i(55563),
        lS = e.i(132437),
        lR = e.i(315353),
        lT = e.i(899196),
        lE = e.i(198566);
    let lk = new Set(["VIOLATION_TYPE_NONE", "VIOLATION_TYPE_INVALID"]),
        lA = lw.z.union([lx.z.object({
            type: lP.z.literal("text"),
            labelKey: lS.z.string(),
            text: lS.z.string().optional(),
            textKey: lS.z.string().optional(),
            textKeyParameters: lR.z.record(lS.z.string(), lS.z.string()).optional()
        }).refine(e => void 0 !== e.text || void 0 !== e.textKey), lx.z.object({
            type: lP.z.literal("image"),
            labelKey: lS.z.string(),
            url: lS.z.string(),
            altLabelKey: lS.z.string().optional()
        }), lx.z.object({
            type: lP.z.literal("timestamp"),
            labelKey: lS.z.string(),
            unix: lT.z.number()
        })]),
        lq = e => {
            let {
                label: t,
                value: n,
                preserveLineBreaks: r = !1
            } = e;
            return (0, b.jsxs)("div", {
                className: "flex flex-col",
                children: [(0, b.jsx)("span", {
                    className: "text-title-medium",
                    children: "".concat(t, ":")
                }), (0, b.jsx)("p", {
                    className: "text-body-medium margin-none [word-break:break-word] ".concat(r ? "[white-space:pre-line]" : ""),
                    children: n
                })]
            })
        },
        lj = e => {
            let {
                url: t,
                alt: n,
                loadingLabel: r
            } = e, [i, a] = (0, oh.useState)(!0), o = () => a(!1);
            return (0, b.jsxs)("div", {
                className: "flex aspect-1-1 justify-center items-center bg-shift-200 radius-medium",
                children: [(0, b.jsx)("img", {
                    className: "size-full [object-fit:contain] ".concat(i ? "hidden" : ""),
                    src: t,
                    alt: n,
                    onLoad: o,
                    onError: o
                }), i && (0, b.jsx)(lu.f, {
                    ariaLabel: r,
                    size: "Medium",
                    variant: "Indeterminate"
                })]
            })
        },
        l_ = (0, oE.K)(e => {
            var t, n;
            let {
                violation: r,
                decisionMethod: i
            } = e, {
                translateWithNamespace: a
            } = (0, oE.A)(), {
                locale: o
            } = (0, oE.z)(), s = (0, oh.useMemo)(() => new Intl.DateTimeFormat(null != o ? o : oE.v.English, {
                dateStyle: "medium",
                timeStyle: "short"
            }).format, [o]), u = Object.entries(r.abuse_type_keys).filter(e => {
                let [t] = e;
                return !lk.has(t)
            }).map(e => {
                let [t, n] = e;
                return n ? a(lp.f.NotApproved, n) : t
            }).sort((e, t) => e.localeCompare(t)), l = (null == (n = r.evidence) ? void 0 : n.type) !== "platform" ? [] : (null != (t = r.evidence.elements) ? t : []).flatMap(e => {
                let t = lA.safeParse(e);
                return t.success ? [t.data] : []
            }), c = l.find(e => "image" === e.type), d = a(lp.f.DashboardModeration, "Label.ContentReviewed"), f = a(lp.f.NotApproved, "Label.LoadingImage"), h = a(lp.f.NotApproved, "Label.Reason"), p = a(lp.f.NotApproved, "Label.AbuseType.Other"), v = a(lp.f.NotApproved, "Label.ModeratorNote"), y = a(lp.f.NotApproved, "Label.ReviewDate"), m = a(lp.f.NotApproved, "Label.DecisionMethod");
            return (0, b.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, b.jsx)("span", {
                    className: "text-title-large",
                    children: d
                }), (0, b.jsxs)("div", {
                    className: "flex flex-col gap-small padding-large bg-shift-100 radius-medium",
                    children: [c && (0, b.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, b.jsx)("div", {
                            className: "width-[50%] self-center",
                            children: (0, b.jsx)(lj, {
                                url: c.url,
                                alt: c.altLabelKey && a(lp.f.AppealsPortal, c.altLabelKey),
                                loadingLabel: f
                            })
                        }), (0, b.jsx)(lE.f, {
                            orientation: "horizontal",
                            variant: "Standard"
                        })]
                    }), (0, b.jsx)(lq, {
                        label: h,
                        value: u.join(", ") || p
                    }), r.user_note && (0, b.jsx)(lq, {
                        label: v,
                        value: r.user_note,
                        preserveLineBreaks: !0
                    }), l.map(e => {
                        if ("text" === e.type) {
                            var t, n;
                            return (0, b.jsx)(lq, {
                                label: a(lp.f.AppealsPortal, e.labelKey),
                                value: null != (t = e.text) ? t : a(lp.f.AppealsPortal, null != (n = e.textKey) ? n : "", e.textKeyParameters),
                                preserveLineBreaks: !0
                            }, e.labelKey)
                        }
                        return "timestamp" === e.type ? (0, b.jsx)(lq, {
                            label: a(lp.f.NotApproved, e.labelKey),
                            value: s(1e3 * e.unix)
                        }, e.labelKey) : null
                    }), (0, b.jsx)(lq, {
                        label: y,
                        value: s(new Date(r.create_time))
                    }), i && (0, b.jsx)(lq, {
                        label: m,
                        value: i
                    })]
                })]
            })
        }, [lp.f.DashboardModeration, lp.f.AppealsPortal, lp.f.NotApproved]),
        lI = (0, oE.K)(e => {
            let t, n, r, {
                    acknowledgment: i,
                    values: a,
                    onDismiss: o
                } = e,
                {
                    translateWithNamespace: s,
                    translateWithNamespaceHTML: u
                } = (0, lc.f)((0, oE.A)()),
                {
                    locale: l
                } = (0, oE.z)(),
                c = (0, oh.useMemo)(() => new ll.f({
                    product: "CreatorDashboard",
                    eventBaseUrl: lf.u
                }), []),
                {
                    user: d
                } = (0, u6.f)(),
                {
                    data: f,
                    isLoading: h,
                    error: p
                } = (t = null == d ? void 0 : d.id, n = a.decisionEventId, (0, le.f)({
                    queryKey: ["moderationPortal", "violation", t, n],
                    queryFn: () => lm.getViolation(String(t), n),
                    enabled: void 0 !== t && "" !== n
                })),
                {
                    data: v
                } = (0, lh.f)(i.universeId),
                y = s(lp.f.DashboardModeration, "Heading.GameHasIssue"),
                m = s(lp.f.Controls, "Action.OK"),
                g = s(lp.f.Home, "Label.ViewDetails"),
                w = (0, lb.f)(a.decisionEventId),
                x = (0, oh.useMemo)(() => (0, lg.f)(i, a), [i, a]),
                P = (0, oh.useMemo)(() => i.expiresAt && new Intl.DateTimeFormat(null != l ? l : oE.v.English, {
                    dateStyle: "medium"
                }).format(i.expiresAt), [i.expiresAt, l]);
            (0, oh.useEffect)(() => {
                c.logImpressionEvent({
                    eventName: ld.f.SelectEvictionAckOverlayImpression,
                    parameters: x
                })
            }, [c, x]);
            let S = (0, oh.useCallback)(() => {
                    o(i)
                }, [i, o]),
                R = (0, oh.useCallback)(() => {
                    c.logClickEvent({
                        eventName: ld.f.SelectEvictionAckOverlayDetailClick,
                        parameters: x
                    })
                }, [c, x]);
            return r = h ? (0, b.jsx)("div", {
                className: "flex justify-center padding-y-large",
                children: (0, b.jsx)(lu.f, {
                    ariaLabel: s(lp.f.Creations, "Label.Loading"),
                    size: "Medium",
                    variant: "Indeterminate"
                })
            }) : p || !f ? (0, b.jsx)("p", {
                className: "text-body-medium margin-none",
                children: s(lp.f.Error, "Response.UnknownError")
            }) : (0, b.jsx)(l_, {
                violation: f
            }), (0, b.jsx)(ls.N, {
                open: !0,
                size: "Medium",
                isModal: !0,
                hasCloseAffordance: !1,
                children: (0, b.jsxs)(ls.d, {
                    children: [(0, b.jsxs)(ls.K, {
                        children: [(0, b.jsx)(ls.F, {
                            className: "text-heading-small margin-none",
                            children: y
                        }), (null == v ? void 0 : v.name) && (0, b.jsx)("p", {
                            className: "content-default",
                            children: v.name
                        }), P && (0, b.jsx)("div", {
                            className: "margin-top-small",
                            children: (0, b.jsx)(la.f, {
                                variant: "Feedback",
                                severity: "Warning",
                                hasCloseAffordance: !1,
                                children: (0, b.jsx)("span", {
                                    children: u(lp.f.DashboardModeration, "Description.AvoidSelectRemoval", [{
                                        opening: "boldStart",
                                        closing: "boldEnd",
                                        content: e => (0, b.jsx)("strong", {
                                            children: e
                                        })
                                    }], {
                                        date: P
                                    })
                                })
                            })
                        }), (0, b.jsxs)("div", {
                            className: "flex flex-col gap-medium margin-top-medium",
                            children: [r, (0, b.jsx)(lo.f, {
                                as: "a",
                                href: w,
                                target: "_blank",
                                variant: "Standard",
                                size: "Small",
                                className: "width-full",
                                onClick: R,
                                children: (0, b.jsx)("span", {
                                    className: "text-body-medium",
                                    children: g
                                })
                            })]
                        })]
                    }), (0, b.jsx)(ls.c, {
                        children: (0, b.jsx)("div", {
                            className: "flex justify-end width-full",
                            children: (0, b.jsx)(lo.f, {
                                variant: "Emphasis",
                                type: "button",
                                onClick: S,
                                className: "width-full",
                                children: m
                            })
                        })
                    })]
                })
            })
        }, [lp.f.Home, lp.f.DashboardModeration, lp.f.Controls, lp.f.Creations, lp.f.Error]),
        lC = e => {
            let {
                isSuppressed: t = !1
            } = e, {
                themeMode: n
            } = (0, u3.g)(), {
                status: r
            } = (0, u6.f)(), i = "success" === r, {
                data: a,
                isLoading: o,
                error: s
            } = (0, le.f)({
                queryKey: lr,
                queryFn: async () => ({
                    items: await (0, ln.f)({
                        api: e => lt.f.listCreatorAcknowledgments(e),
                        getItems: e => {
                            var t;
                            return null != (t = e.items) ? t : []
                        },
                        getPageToken: e => e.nextCursor
                    })
                }),
                staleTime: 1 / 0,
                enabled: i
            }), {
                dismissAcks: u,
                filterAcks: l
            } = (0, li.l)(), c = (0, oh.useMemo)(() => {
                var e;
                return l(null != (e = null == a ? void 0 : a.items) ? e : [])
            }, [null == a ? void 0 : a.items, l]), d = (0, oh.useMemo)(() => c.find(e => {
                let t = e.values;
                return !!t && ("SelectGracePeriod" === t.type || (t.type, !1))
            }), [c]), f = (0, oh.useCallback)(e => {
                u([e])
            }, [u]), h = null == d ? void 0 : d.values;
            return t || !i || o || s || !d || !h ? null : "SelectGracePeriod" === h.type ? (0, b.jsx)(u7.f, {
                theme: n,
                children: (0, b.jsx)(lI, {
                    acknowledgment: d,
                    values: h,
                    onDismiss: f
                })
            }) : (h.type, null)
        };
    var lO = e.i(709337),
        lL = e.i(215955),
        lD = e.i(479236),
        lM = e.i(964956),
        lN = e.i(458263),
        lU = e.i(49001),
        lB = e.i(157700),
        lF = e.i(505099);

    function lH(e) {
        var t;
        let {
            namespace: n,
            name: r,
            value: i
        } = e;
        if ("boolean" != typeof i) return;
        let a = null == (t = (0, lF.l)()) ? void 0 : t.getIntegrationByName("FeatureFlags");
        a && a.addFeatureFlag("".concat(n, ".").concat(r), i)
    }

    function lV() {
        return null != t || (t = (0, lB.R)({
            applicationId: "creator-dashboard",
            baseUrl: "https://apis.roblox.com",
            onFlagEvaluated: lH
        })), t
    }
    var lG = e.i(745873);
    let lW = null,
        lK = (0, lN.default)(() => e.A(73576).then(e => {
            let {
                FloatingDraggableWidget: t
            } = e;
            return t
        }), {
            loadableGenerated: {
                modules: [21157]
            },
            ssr: !1
        }),
        lz = () => {
            let e = (0, op.useRouter)(),
                t = (0, lG.W)(),
                [n, r] = (0, oh.useState)(!1);
            (0, oh.useEffect)(() => {
                let e = !0;
                return async function() {
                    try {
                        null != lW || (lW = lV().enableOverrides({
                            mode: "authorized-only",
                            useDefault: !0
                        }));
                        let t = await lW;
                        e && r(t)
                    } catch (t) {
                        e && r(!1)
                    }
                }(), () => {
                    e = !1
                }
            }, []);
            let i = (0, oh.useMemo)(() => {
                let {
                    id: n
                } = e.query, r = "string" == typeof n ? parseInt(n, 10) : 0 / 0;
                return {
                    ...Number.isNaN(r) ? {} : {
                        universeId: r
                    },
                    ...t ? {
                        groupId: t.id
                    } : {}
                }
            }, [t, e.query]);
            return n ? (0, b.jsx)(lK, {
                flags: lU.f,
                contexts: i
            }) : null
        };
    var lX = e.i(911502);
    let lQ = e => {
        let {
            providers: t,
            children: n
        } = e, r = n;
        for (let e = t.length - 1; e >= 0; e -= 1) r = oh.default.cloneElement(t[e], {}, r);
        return (0, b.jsx)(b.Fragment, {
            children: r
        })
    };
    var l$ = e.i(893949),
        lY = e.i(413019),
        lJ = e.i(758835),
        lZ = e.i(823062);
    let l0 = e => {
        let {
            children: t,
            unifiedLogger: n,
            pageLoggerConfig: r
        } = e, i = null != n ? n : lL.f, {
            pathname: a,
            asPath: o,
            basePath: s,
            isReady: u
        } = (0, op.useRouter)(), l = (0, oh.useMemo)(() => {
            if (a) return "".concat(window.location.origin).concat(a)
        }, [a]);
        return (0, b.jsx)(lZ.d, {
            unifiedLogger: i,
            pageLoggerConfig: r,
            path: l,
            url: "".concat(s).concat(o),
            isReady: u,
            children: t
        })
    };
    var l1 = e.i(681559),
        l2 = e.i(272749),
        l4 = e.i(252842);
    let l3 = ["https://vitals.vercel-insights.com/v1/vitals"];
    var l6 = e.i(120654);
    let l8 = e => {
        let {
            children: t
        } = e, {
            user: n
        } = (0, u6.f)(), r = (0, oh.useRef)(window.aegis);
        (0, oh.useEffect)(() => {
            r.current && r.current.setConfig({
                beforeReport: e => !(e.msg && l3.some(t => e.msg.includes(t))),
                api: {
                    retCodeHandler(e, t, n) {
                        let r = !(n.status === l4.R.FORBIDDEN && n.headers.has("x-csrf-token") || n.status === l4.R.OK || n.status === l4.R.ACCEPTED),
                            i = "unknown";
                        try {
                            let t = JSON.parse(e);
                            t.errors && t.errors.length > 0 && (i = t.errors[0].code)
                        } catch (e) {
                            i = "unknown"
                        }
                        return {
                            isErr: r && 0 !== i,
                            retCode: i
                        }
                    }
                },
                uin: null == n ? void 0 : n.id
            })
        }, [n, r]);
        let i = (0, oh.useMemo)(() => ({
            info: () => {},
            error: () => {},
            captureError: () => {},
            reportEvent: () => {}
        }), [r]);
        return (0, b.jsx)(l6.f.Provider, {
            value: i,
            children: t
        })
    };
    var l5 = e.i(37819),
        l7 = e.i(673386);
    let l9 = "".concat("".concat("https://assets.create.roblox.com/dea85e59b76ad172160a6753a6bf9008dac07d11/assets", "/opengraph"), "/global_og_image.png"),
        ce = (0, oE.K)(e => {
            let {
                openGraphMetadata: {
                    title: t,
                    description: n,
                    defaultLocale: r
                }
            } = e, {
                translate: i
            } = (0, oE.A)(), a = new URL(l9, "https://create.roblox.com").href, o = (0, l7.i)();
            return (0, b.jsxs)(l5.i, {
                seoTitle: i("Label.CreatorDashboard"),
                ogTitle: t,
                description: n,
                ogImage: a,
                children: [(0, b.jsx)("link", {
                    rel: "icon",
                    type: "image/svg+xml",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.svg")
                }), (0, b.jsx)("link", {
                    rel: "icon",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.ico"),
                    sizes: "48x48"
                }), (0, b.jsx)("link", {
                    rel: "apple-touch-icon",
                    sizes: "180x180",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/apple-touch-icon.png")
                }), (0, b.jsx)("meta", {
                    name: "theme-color",
                    content: o.palette.surface[0]
                }, "theme-color"), (0, b.jsx)("meta", {
                    name: "viewport",
                    content: "minimum-scale=1, initial-scale=1, width=device-width"
                }), (0, b.jsx)("meta", {
                    name: "zd-site-verification",
                    content: "8ou4bshfpgbc1pk5x0qqt"
                }), (0, b.jsx)("meta", {
                    property: "og:url",
                    content: "https://create.roblox.com"
                }, "og:url"), (0, b.jsx)("meta", {
                    property: "og:type",
                    content: "website"
                }, "og:type"), (0, b.jsx)("meta", {
                    property: "og:locale",
                    content: r
                }, "og:locale")]
            })
        }, [lp.f.Features]);
    var ct = e.i(913785),
        cn = e.i(232360),
        cn = cn,
        cr = e.i(462534),
        ci = e.i(644520),
        ca = e.i(880002);
    e.i(223280), e.i(575177), e.i(862359);
    var co = e.i(155281);
    let cs = ct.$constructor("ZodMiniType", (e, t) => {
            if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
            ci.GX.init(e, t), e.def = t, e.type = t.type
        }, {
            get with() {
                return this.check
            },
            set with(e) {
                cr.own(this, "with", e)
            },
            parse(e, t) {
                return co.parse(this, e, t, {
                    callee: this.parse
                })
            },
            parseAsync(e, t) {
                return co.parseAsync(this, e, t, {
                    callee: this.parseAsync
                })
            },
            safeParse(e, t) {
                return co.safeParse(this, e, t)
            },
            safeParseAsync(e, t) {
                return co.safeParseAsync(this, e, t)
            },
            check() {
                for (var e, t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                let i = this.def;
                return this.clone({
                    ...i,
                    checks: [...null != (e = i.checks) ? e : [], ...n.map(e => "function" == typeof e ? {
                        _zod: {
                            check: e,
                            def: {
                                check: "custom"
                            },
                            onattach: []
                        }
                    } : e)]
                }, {
                    parent: !0
                })
            },
            clone(e, t) {
                return cr.clone(this, e, t)
            },
            brand() {
                return this
            },
            register(e, t) {
                return e.add(this, t), this
            },
            apply(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                return 0 === n.length ? e(this) : e(this, ...n)
            }
        }),
        cu = ct.$constructor("ZodMiniString", (e, t) => {
            ci.FA.init(e, t), cs.init(e, t)
        });

    function cl(e) {
        return ca._string(cu, e)
    }(e, t) => {
        ci.kd.init(e, t), cu.init(e, t)
    }, (e, t) => {
        ci.bk.init(e, t), cs.init(e, t)
    };
    let cc = ct.$constructor("ZodMiniUnknown", (e, t) => {
            ci.t6.init(e, t), cs.init(e, t)
        }),
        cd = ct.$constructor("ZodMiniArray", (e, t) => {
            ci.XK.init(e, t), cs.init(e, t)
        });

    function cf(e, t) {
        return new cd({
            type: "array",
            element: e,
            ...cr.normalizeParams(t)
        })
    }
    let ch = ct.$constructor("ZodMiniObject", (e, t) => {
        ci.AI.init(e, t), cs.init(e, t), cr.installLazyProp(e, "shape", e => e._zod.def.shape, !1)
    });

    function cp(e, t) {
        return new ch({
            type: "object",
            shape: null != e ? e : {},
            ...cr.normalizeParams(t)
        })
    }
    let cv = ct.$constructor("ZodMiniUnion", (e, t) => {
            ci.LW.init(e, t), cs.init(e, t)
        }),
        cy = ct.$constructor("ZodMiniRecord", (e, t) => {
            ci.ey.init(e, t), cs.init(e, t)
        }),
        cm = ct.$constructor("ZodMiniLiteral", (e, t) => {
            ci.XF.init(e, t), cs.init(e, t)
        });

    function cg(e, t) {
        return new cm({
            type: "literal",
            values: Array.isArray(e) ? e : [e],
            ...cr.normalizeParams(t)
        })
    }
    let cb = ct.$constructor("ZodMiniOptional", (e, t) => {
        ci._U.init(e, t), cs.init(e, t)
    });

    function cw(e) {
        return new cb({
            type: "optional",
            innerType: e
        })
    }(e, t) => {
        ci.dL.init(e, t), cs.init(e, t)
    };
    let cx = ct.$constructor("ZodMiniCustom", (e, t) => {
        ci.vg.init(e, t), cs.init(e, t)
    });

    function cP(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return ca._refine(cx, e, t)
    }
    ca.describe, ca.meta;
    var cS = e.i(620331),
        cR = e.i(746878),
        cT = e.i(60584),
        cE = e.i(43594),
        ck = e.i(879224),
        cA = e.i(225885),
        cq = e.i(819010),
        cj = e.i(561178),
        c_ = e.i(327449),
        cI = (0, oh.createContext)(void 0),
        cC = e => {
            let {
                config: t,
                children: n
            } = e;
            return (0, b.jsx)(cI.Provider, {
                value: t,
                children: n
            })
        },
        cO = () => {
            let e = (0, oh.useContext)(cI);
            if (!e) throw Error("useNotApprovedUIConfig must be used within a NotApprovedUIProvider");
            return e
        },
        cL = ((s = cL || {}).Default = "default", s.Kids = "kids", s.Select = "select", s),
        cD = ((u = cD || {}).AccountReactivationPageRendered = "accountReactivationPageRendered", u.PageRendered = "pageRendered", u.UnmappedViolationKey = "unmappedViolationKey", u.CheckboxChecked = "checkboxChecked", u.LogoutClicked = "logoutClicked", u.ReactivateClicked = "reactivateClicked", u.ParentVerificationClicked = "parentVerificationClicked", u.EmailVerificationClicked = "emailVerificationClicked", u.TermsOfUseClicked = "termsOfUseClicked", u.AppealsProcessClicked = "appealsProcessClicked", u.CommunityGuidelineClicked = "communityGuidelineClicked", u.UGCGuidelinesClicked = "ugcGuidelinesClicked", u.AppealsPortalClicked = "appealsPortalClicked", u.ContinueClicked = "continueClicked", u.BackClicked = "backClicked", u.SecondChanceReactivateClicked = "secondChanceReactivateClicked", u.MissingTranslation = "missingTranslation", u.Error = "error", u.VerificationRedirectRendered = "verificationRedirectRendered", u.AccountReactivationRedirectRendered = "accountReactivationRedirectRendered", u),
        cM = ((l = cM || {}).NotApprovedPage = "NotApprovedPageV2", l);
    ct.config(cn.en());
    var cN = cp({
            type: cg("platform"),
            displayMeta: cw(cp({
                lowercaseKey: cl().check(cS.f(1)),
                capitalizedKey: cl().check(cS.f(1)),
                icon: cl()
            })),
            elements: cw(cf(ca._unknown(cc)))
        }),
        cU = new cv({
            type: "union",
            options: [cp({
                type: cg("text"),
                labelKey: cl(),
                text: cw(cl()),
                textKey: cw(cl()),
                textKeyParameters: cw((c = cl(), new cy((d = cl()) && d._zod ? {
                    type: "record",
                    keyType: c,
                    valueType: d,
                    ...cr.normalizeParams(void 0)
                } : {
                    type: "record",
                    keyType: cl(),
                    valueType: c,
                    ...cr.normalizeParams(d)
                })))
            }).check(cP(e => void 0 !== e.text || void 0 !== e.textKey, {
                message: "Either 'text' or 'textKey' must be provided"
            }), cP(e => !e.textKeyParameters || void 0 !== e.textKey, {
                message: "'textKeyParameters' requires 'textKey' to be provided"
            })), cp({
                type: cg("image"),
                labelKey: cl(),
                url: cl(),
                altLabelKey: cw(cl())
            })],
            ...cr.normalizeParams(void 0)
        }),
        cB = e => {
            let t = cU.safeParse(e);
            return !!t.success || (console.warn("Failed to parse platform element: ", t.error), !1)
        },
        cF = cp({
            ...cN.shape,
            elements: cw(cf(cU))
        }),
        cH = e => {
            let t = e.violation;
            if (!t) return !1;
            let {
                evidence: n
            } = t;
            if (!n || !(e => {
                    if ("platform" !== e.type) return !1;
                    let t = cN.safeParse(e);
                    return !!t.success || (console.warn("Failed to parse platform evidence: ", t.error), !1)
                })(n)) return !1;
            let r = null == (i = n.elements) ? void 0 : i.filter(e => cB(e));
            if (!r || 0 === r.length) return !1;
            var i, a = {
                ...n,
                elements: r
            };
            if ("platform" !== a.type) return !1;
            let o = cF.safeParse(a);
            return !!o.success || (console.warn("Failed to parse platform evidence fully typed: ", o.error), !1)
        },
        cV = "UserSafety.NotApprovedPage.UserID",
        cG = {
            displayLabel: "Label.AbuseType.SharingPII.Kids",
            moderatorNote: "Label.AbuseType.SharingPII.Note.Kids",
            education: {
                ruleTitle: "Heading.RuleExplanation.SharingPII.Kids",
                ruleDescription: "Description.RuleExplanation.SharingPII.Kids",
                ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SharingPII.Kids",
                importanceTitle: "Heading.RuleImportance.Kids",
                importanceDescriptionBullets: "Description.RuleImportance.Bullets.SharingPII.Kids",
                policyKey: "kids-sharing-pii",
                deduplicationKey: "pii"
            }
        },
        cW = {
            "Label.AbuseType.Harassment": {
                displayLabel: "Label.AbuseType.Bullying.Kids",
                moderatorNote: "Label.AbuseType.Bullying.Note.Kids",
                education: {
                    ruleTitle: "Heading.RuleExplanation.Bullying.Kids",
                    ruleDescriptionBullets: "Description.RuleExplanation.Bullets.Bullying.Kids",
                    importanceTitle: "Heading.RuleImportance.Kids",
                    importanceDescription: "Description.RuleImportance.Bullying.Kids",
                    policyKey: "kids-bullying",
                    deduplicationKey: "bullying-harassment-discrimination"
                }
            },
            "Label.AbuseType.PrivacyAskingforPII": cG,
            "Label.AbuseType.PrivacyGivingPII": cG,
            "Label.AbuseType.SexualContent": {
                displayLabel: "Label.AbuseType.SexualContent.Kids",
                moderatorNote: "Label.AbuseType.SexualContent.Note.Kids",
                education: {
                    ruleTitle: "Heading.RuleExplanation.SexualContent.Kids",
                    ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SexualContent.Kids",
                    importanceTitle: "Heading.RuleImportance.Kids",
                    importanceDescription: "Description.RuleImportance.SexualContent.Kids",
                    policyKey: "kids-sexual-content",
                    deduplicationKey: "dating"
                }
            }
        },
        cK = (0, oh.createContext)(void 0),
        cz = e => {
            let {
                enableIxp: t = !1,
                children: n
            } = e, {
                translate: r,
                ageExperience: i = "default"
            } = cO(), {
                data: a,
                isLoading: o,
                error: s
            } = (() => {
                let {
                    httpGet: e,
                    userModerationApiUrl: t
                } = cO();
                return (0, le.f)({
                    queryKey: ["not-approved-data"],
                    queryFn: () => e("".concat(t, "/v1/not-approved")),
                    staleTime: 1 / 0
                })
            })(), {
                data: u,
                isLoading: l,
                isFetching: c
            } = (e => {
                let {
                    enabled: t
                } = e, {
                    ageExperience: n = "default",
                    ixp: r
                } = cO(), i = (0, le.f)({
                    queryKey: ["ixp/".concat(cV)],
                    queryFn: async () => {
                        if (!r) return {};
                        try {
                            return await r.fetchLayer(cV)
                        } catch (e) {
                            return {}
                        }
                    },
                    staleTime: 1 / 0,
                    enabled: t && !!r
                }), a = i.data && "FFlagKidsNotApprovedPageTreatment2" in i.data;
                return (0, oh.useEffect)(() => {
                    "kids" === n && a && (null == r || r.logExposure(cV))
                }, [n, a, r]), i
            })({
                enabled: t
            }), {
                data: d,
                isLoading: f
            } = (() => {
                let {
                    httpGet: e,
                    apiGatewayUrl: t
                } = cO();
                return (0, le.f)({
                    queryKey: ["commutation-eligibility"],
                    queryFn: async () => {
                        try {
                            return await e("".concat(t, "/moderation-appeal-service/v2/consequence-commutation-eligibility"))
                        } catch (e) {
                            return {
                                educational_pass_eligible: !1
                            }
                        }
                    },
                    staleTime: 3e5
                })
            })(), h = "kids" === i && t && (null == u ? void 0 : u.FFlagKidsNotApprovedPageTreatment2) === !0, p = (null == a ? void 0 : a.punishedUserId) ? a : void 0, v = (0, oh.useMemo)(() => {
                var e;
                let t, n = new Set;
                (null == p ? void 0 : p.violation) && cH(p) ? p.violation.abuseTypeTranslationKeys.forEach(e => {
                    n.add(e)
                }) : null == p || null == (e = p.badUtterances) || e.forEach(e => {
                    n.add(e.labelTranslationKey)
                });
                let i = [...n].filter(Boolean);
                return {
                    translatedReasons: h ? (t = new Set, i.forEach(e => {
                        var n, i;
                        let a = r(null != (n = null == (i = cW[e]) ? void 0 : i.displayLabel) ? n : e);
                        a && t.add(a)
                    }), [...t]) : i.map(e => r(e)).filter(Boolean),
                    untranslatedReasons: i
                }
            }, [h, p, r]), y = (0, oh.useMemo)(() => {
                let e = (null == p ? void 0 : p.messageToUser) || r("Description.Violation", {
                    startLink: "",
                    endLink: ""
                });
                if (!h || !(null == p ? void 0 : p.labelTranslationKey)) return e;
                let t = cW[p.labelTranslationKey];
                return t && r(t.moderatorNote) || e
            }, [h, p, r]), m = o || t && l && c || f, g = (0, oh.useMemo)(() => ({
                isLoading: m,
                error: s,
                punishmentData: p,
                violationReasons: v,
                ixpData: u,
                isKidsTreatment: h,
                moderatorNote: y,
                commutationEligibility: d
            }), [m, s, p, v, u, h, y, d]);
            return (0, b.jsx)(cK.Provider, {
                value: g,
                children: n
            })
        },
        cX = () => {
            let e = (0, oh.useContext)(cK);
            if (!e) throw Error("useNotApprovedPagePunishment must be used within a NotApprovedPagePunishmentProvider");
            return e
        };

    function cQ() {
        let {
            sendAnalyticsEvent: e,
            platform: t,
            readOnly: n
        } = cO(), {
            isKidsTreatment: r,
            ixpData: i
        } = cX(), a = (null == i ? void 0 : i.FFlagKidsNotApprovedPageTreatment2) === !0;
        return (0, oh.useCallback)((i, o) => {
            var s, u;
            s = null != n && n, u = {
                ...o,
                ...a ? {
                    isKidsTreatment: r
                } : {}
            }, s || e({
                eventName: "NotApprovedPageEvent",
                context: "NotApprovedPageV2",
                properties: {
                    eventType: i,
                    timestamp: Date.now(),
                    platform: t,
                    ...u
                }
            })
        }, [e, t, n, r, a])
    }
    var c$ = ((f = c$ || {}).Warn = "Warn", f.Delete = "Delete", f.Hour1 = "Ban 1 Hour", f.Hour6 = "Ban 6 Hours", f.Day1 = "Ban 1 Day", f.Day3 = "Ban 3 Days", f.Day7 = "Ban 7 Days", f.Day14 = "Ban 14 Days", f.Day30 = "Ban 30 Days", f.Day60 = "Ban 60 Days", f.Month6 = "Ban 6 Months", f.Year1 = "Ban 1 Year", f),
        cY = {
            "Ban 1 Hour": "Heading.SuspendedOneHour",
            "Ban 6 Hours": "Heading.SuspendedSixHours",
            "Ban 1 Day": "Heading.SuspendedOneDay",
            "Ban 3 Days": "Heading.SuspendedThreeDays",
            "Ban 7 Days": "Heading.SuspendedSevenDays",
            "Ban 14 Days": "Heading.Suspended14Days",
            "Ban 30 Days": "Heading.SuspendedThirtyDays",
            "Ban 60 Days": "Heading.SuspendedSixtyDays",
            "Ban 6 Months": "Heading.SuspendedSixMonths",
            "Ban 1 Year": "Heading.Suspended1Year",
            Warn: "Heading.Warning",
            Delete: "Heading.Banned"
        },
        cJ = {
            "Label.Type.Avatar": "Label.TypePlural.Avatar",
            "Label.Type.Audio": "Label.TypePlural.Audio",
            "Label.Type.AvatarAccessory": "Label.TypePlural.AvatarAccessory",
            "Label.Type.Bundle": "Label.TypePlural.Bundle",
            "Label.Type.Chat": "Label.TypePlural.Chat",
            "Label.Type.CommerceProduct": "Label.TypePlural.CommerceProduct",
            "Label.Type.Experience": "Label.TypePlural.Experience",
            "Label.Type.Game": "Label.TypePlural.Game",
            "Label.Type.Image": "Label.TypePlural.Image",
            "Label.Type.Look": "Label.TypePlural.Look",
            "Label.Type.Mesh": "Label.TypePlural.Mesh",
            "Label.Type.Model": "Label.TypePlural.Model",
            "Label.Type.Plugin": "Label.TypePlural.Plugin",
            "Label.Type.Video": "Label.TypePlural.Video",
            "Label.Type.Voice": "Label.TypePlural.Voice"
        },
        cZ = "Email";

    function c0(e, t, n) {
        if (n === cZ || "VPC" === n) return !0;
        let r = new Date(t) < new Date;
        return "Warn" === e || "Delete" !== e && r
    }
    var c1 = (0, oh.createContext)(void 0),
        c2 = e => {
            var t, n;
            let {
                pages: r,
                unmappedViolationKeys: i,
                hasEducationalPages: a,
                commutationEligibility: o,
                children: s
            } = e, [u, l] = (0, oh.useState)(0), [c, d] = (0, oh.useState)(!1), f = null != (t = null == (n = r[u]) ? void 0 : n.pageName) ? t : "unknown", h = r.length, p = 0 === u, v = u === h - 1, y = (0, oh.useMemo)(() => {
                var e;
                return null != (e = null == o ? void 0 : o.educational_pass_eligible) && e
            }, [o]), m = (0, oh.useCallback)(() => {
                u < h - 1 && (d(!0), l(e => e + 1))
            }, [u, h]), g = (0, oh.useCallback)(() => {
                u > 0 && l(e => e - 1)
            }, [u]), w = (0, oh.useCallback)(() => {
                if (h <= 1 || "second-chance-intro" === f || "intro" === f) return 0;
                let e = h - 1,
                    t = u;
                return (e -= !!y, t -= !!y, e <= 0) ? 0 : Math.round(t / e * 100)
            }, [u, h, f, y]), x = (0, oh.useMemo)(() => {
                var e, t, n;
                return {
                    currentPage: u,
                    currentPageName: f,
                    totalPages: h,
                    goToNextPage: m,
                    goToPreviousPage: g,
                    isFirstPage: p,
                    isLastPage: v,
                    getProgress: w,
                    hasEducationalPages: a,
                    currentPageConfigs: null != (e = null == (t = r[u]) ? void 0 : t.pageItems) ? e : [],
                    CurrentCtaComponent: null == (n = r[u]) ? void 0 : n.CtaComponent,
                    unmappedViolationKeys: i,
                    hasNavigatedForward: c
                }
            }, [u, f, h, m, g, p, v, w, r, a, i, c]);
            return (0, b.jsx)(c1.Provider, {
                value: x,
                children: s
            })
        },
        c4 = () => {
            let e = (0, oh.useContext)(c1);
            if (!e) throw Error("usePageNavigation must be used within PageNavigationProvider");
            return e
        },
        c3 = e => {
            let {
                punishmentData: t,
                commutationEligibility: n
            } = e, {
                isFirstPage: r,
                currentPageConfigs: i,
                currentPageName: a
            } = c4(), o = i.map(e => {
                if (!e.getIsVisible(t, a, n)) return null;
                let r = e.renderComponent;
                return (0, b.jsx)("div", {
                    children: (0, b.jsx)(r, {
                        punishmentData: t
                    })
                }, e.configName)
            }).filter(Boolean);
            return (0, b.jsx)("div", {
                className: "flex flex-col ".concat(r ? "gap-xlarge" : "gap-[36px]"),
                children: o
            })
        },
        c6 = () => {
            let e = cO().translate,
                {
                    onLogout: t
                } = cO(),
                n = cQ(),
                [r, i] = (0, oh.useState)(!1),
                a = (0, cT.f)({
                    mutationFn: async () => {
                        await t()
                    },
                    onMutate: () => {
                        i(!0), n("logoutClicked")
                    },
                    onError: e => {
                        let t = e instanceof Error ? e.message : "Unknown error";
                        n("error", {
                            additionalInfo: "headerPopoverLogout: Error logging out - ".concat(t)
                        }), i(!1)
                    },
                    retry: 0
                });
            return (0, b.jsxs)(cE.V, {
                children: [(0, b.jsx)(cE.J, {
                    asChild: !0,
                    children: (0, b.jsx)(cA.f, {
                        icon: "icon-filled-three-dots-vertical",
                        ariaLabel: e("Label.OpenMenu"),
                        variant: "Utility",
                        size: "Medium"
                    })
                }), (0, b.jsx)(cE.T, {
                    side: "bottom",
                    align: "end",
                    ariaLabel: e("Label.MenuContent"),
                    children: (0, b.jsx)(ck.k, {
                        size: "Medium",
                        children: (0, b.jsx)(ck.d, {
                            value: "one",
                            title: e("Action.LogOut"),
                            onSelect: () => {
                                a.mutate()
                            },
                            disabled: r,
                            trailing: r ? (0, b.jsx)(lu.f, {
                                size: "Small",
                                ariaLabel: e("Label.LogoutProgress"),
                                variant: "Indeterminate"
                            }) : void 0
                        })
                    })
                })]
            })
        },
        c8 = () => {
            let e = cO().translate,
                {
                    getProgress: t
                } = c4(),
                n = t();
            return (0, b.jsx)(cq.f, {
                value: n,
                ariaLabel: e("Label.PageProgress"),
                style: {
                    visibility: 0 === n ? "hidden" : "visible"
                }
            })
        },
        c5 = () => {
            let e = cO().translate,
                {
                    goToPreviousPage: t
                } = c4();
            return (0, b.jsx)(cA.f, {
                size: "Medium",
                variant: "Utility",
                icon: "icon-filled-chevron-large-left",
                onClick: t,
                "data-testid": "back-button",
                className: "margin-left-[-12px]",
                ariaLabel: e("Action.Back")
            })
        },
        c7 = e => {
            var t;
            let {
                punishmentData: n
            } = e, {
                isFirstPage: r,
                totalPages: i
            } = c4(), {
                readOnly: a
            } = cO(), o = cO().translate, {
                punishmentTypeDescription: s,
                verificationCategory: u
            } = n, l = u ? o("Heading.Suspended") : o(null != (t = cY[s]) ? t : "") || o("Heading.Suspended");
            return r ? (0, b.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, b.jsxs)("div", {
                    className: "flex justify-between items-center gap-medium",
                    children: [(0, b.jsxs)("div", {
                        className: "flex gap-small items-center padding-y-medium",
                        children: [(0, b.jsx)(cR.f, {
                            name: "Delete" === s ? "icon-regular-circle-slash" : "icon-regular-triangle-exclamation",
                            size: "Large",
                            className: "Warn" !== s || u ? "content-system-alert" : "content-system-warning"
                        }), (0, b.jsx)("span", {
                            className: "text-heading-small",
                            children: l
                        })]
                    }), !a && (0, b.jsx)(c6, {})]
                })
            }) : (0, b.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, b.jsxs)("div", {
                    className: "flex flex-col gap-large items-start",
                    children: [(0, b.jsx)(c5, {}), i > 2 && (0, b.jsx)(c8, {})]
                })
            })
        },
        c9 = e => {
            let {
                punishmentData: t,
                setIsDialogOpen: n
            } = e, {
                CurrentCtaComponent: r,
                currentPageName: i
            } = c4();
            return r ? (0, b.jsx)("div", {
                className: "flex flex-col gap-large justify-between medium:items-end",
                children: (0, b.jsx)(r, {
                    punishmentData: t,
                    setIsDialogOpen: n
                }, i)
            }) : null
        },
        de = e => {
            let {
                readOnly: t
            } = e;
            return (0, b.jsxs)("div", {
                className: "shrink-0 flex flex-row justify-between items-center gap-medium",
                children: [(0, b.jsx)("div", {
                    className: "bg-shift-100 height-[45px] width-[300px] max-width-[85%] radius-medium"
                }), !t && (0, b.jsx)("div", {
                    className: "bg-shift-100 height-[35px] width-[35px] radius-medium shrink-0"
                })]
            })
        },
        dt = () => (0, b.jsxs)("div", {
            className: "flex flex-col gap-large",
            "data-testid": "loading-skeleton-content",
            children: [(0, b.jsx)("div", {
                className: "bg-shift-100 height-[20px] width-full max-width-[450px] radius-medium"
            }), (0, b.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, b.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[125px] radius-medium"
                }), (0, b.jsx)("div", {
                    className: "bg-shift-100 height-[120px] width-full radius-medium"
                })]
            }), (0, b.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, b.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[200px] radius-medium"
                }), (0, b.jsx)("div", {
                    className: "bg-shift-100 height-[160px] width-full radius-medium"
                })]
            })]
        }),
        dn = () => (0, b.jsx)("div", {
            className: "shrink-0 flex width-full justify-end medium:flex-row",
            children: (0, b.jsx)("div", {
                className: "bg-shift-100 height-[40px] width-full medium:width-[90px] radius-medium"
            })
        }),
        dr = () => {
            let {
                readOnly: e
            } = cO();
            return e ? null : (0, b.jsx)("div", {
                className: "shrink-0 flex justify-end items-center",
                children: (0, b.jsx)(c6, {})
            })
        },
        di = e => {
            let {
                error: t
            } = e, n = cO().translate;
            return t && console.error(t), (0, b.jsx)("div", {
                className: "flex flex-col height-full min-height-0",
                children: (0, b.jsxs)("div", {
                    className: "grow-1 flex flex-col items-center justify-center gap-medium padding-xxlarge radius-medium bg-surface-100 width-full min-height-[225px]",
                    children: [(0, b.jsx)(cR.f, {
                        name: "icon-regular-triangle-exclamation",
                        size: "XLarge"
                    }), (0, b.jsx)("span", {
                        className: "text-body-large content-emphasis margin-none",
                        children: n("Heading.Error")
                    })]
                })
            })
        },
        da = (0, oh.createContext)(void 0),
        ds = e => {
            let {
                children: t
            } = e, {
                currentPage: n,
                currentPageName: r,
                unmappedViolationKeys: i
            } = c4(), a = cQ(), o = (0, oh.useRef)(Date.now()), s = (0, oh.useRef)(n), u = (0, oh.useRef)(r), l = (0, oh.useRef)(!0), c = () => Date.now() - o.current;
            (0, oh.useEffect)(() => {
                i.forEach(e => {
                    a("unmappedViolationKey", {
                        unmappedViolationKey: e
                    })
                })
            }, [i]), (0, oh.useEffect)(() => {
                if (l.current) {
                    l.current = !1;
                    return
                }
                let e = c();
                a(n > s.current ? "continueClicked" : "backClicked", {
                    pageName: u.current,
                    timeOnPageMs: e
                }), o.current = Date.now(), s.current = n, u.current = r
            }, [n, r]);
            let d = (0, oh.useCallback)((e, t) => {
                    let n = c();
                    a(e, {
                        ...t,
                        pageName: r,
                        timeOnPageMs: n
                    })
                }, [r, a]),
                f = (0, oh.useMemo)(() => ({
                    sendPageEvent: d
                }), [d]);
            return (0, b.jsx)(da.Provider, {
                value: f,
                children: t
            })
        },
        du = () => {
            let e = (0, oh.useContext)(da);
            if (!e) throw Error("usePageAnalytics must be used within PageAnalyticsProvider");
            return e
        },
        dl = {
            ruleTitle: "Heading.RuleExplanation.Dating",
            ruleSubtitle: "SubHeading.RuleExplanation.Dating",
            ruleDescription: "Description.RuleExplanation.Dating",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.Dating",
            policyKey: "dating"
        },
        dc = {
            ruleTitle: "Heading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleSubtitle: "SubHeading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleDescription: "Description.RuleExplanation.BullyingHarassmentDiscrimination",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.BullyingHarassmentDiscrimination",
            policyKey: "bullying-harassment-discrimination"
        },
        dd = {
            ruleTitle: "Heading.RuleExplanation.MisusingRobloxSystems",
            ruleSubtitle: "SubHeading.RuleExplanation.MisusingRobloxSystems",
            ruleDescription: "Description.RuleExplanation.MisusingRobloxSystems",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.MisusingRobloxSystems",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.MisusingRobloxSystems",
            policyKey: "misusing-roblox-systems"
        },
        df = {
            ruleTitle: "Heading.RuleExplanation.PII",
            ruleSubtitle: "SubHeading.RuleExplanation.PII",
            ruleDescription: "Description.RuleExplanation.PII",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.PII",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.PII",
            policyKey: "pii"
        },
        dh = {
            ruleTitle: "Heading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleSubtitle: "SubHeading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescription: "Description.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SSHAndIllegalRegAct",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.SSHAndIllegalRegulatedActivities",
            policyKey: "ssh-and-illegal-regulated-activities"
        },
        dp = {
            "Label.AbuseType.CheatandExploits": dd,
            "Label.AbuseType.ContestsandSweepstakes": dh,
            "Label.AbuseType.Dating": dl,
            "Label.AbuseType.DirectingUsersOffPlatform": {
                ruleTitle: "Heading.RuleExplanation.DirectingUsersOffPlatform",
                ruleSubtitle: "SubHeading.RuleExplanation.DirectingUsersOffPlatform",
                ruleDescription: "Description.RuleExplanation.DirectingUsersOffPlatform",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.DirectingUsersOffPlatform",
                policyKey: "directing-users-off-platform"
            },
            "Label.AbuseType.DiscriminatoryContent": dc,
            "Label.AbuseType.DisruptiveAudio": dd,
            "Label.AbuseType.EncouragingDangerousBehavior": dh,
            "Label.AbuseType.ExtortionandBlackmail": dc,
            "Label.AbuseType.Harassment": dc,
            "Label.AbuseType.IllegalandRegulatedContent": dh,
            "Label.AbuseType.Impersonation": dc,
            "Label.AbuseType.IrlDangerousActivities": dh,
            "Label.AbuseType.MisusingRobloxSystems": dd,
            "Label.AbuseType.OffPlatformSpeechandBehavior": dc,
            "Label.AbuseType.PrivacyAskingforPII": df,
            "Label.AbuseType.PrivacyGivingPII": df,
            "Label.AbuseType.RealLifeThreats": dc,
            "Label.AbuseType.Scamming": dd,
            "Label.AbuseType.SexualContent": dl,
            "Label.AbuseType.Spam": {
                ruleTitle: "Heading.RuleExplanation.Spam",
                ruleSubtitle: "SubHeading.RuleExplanation.Spam",
                ruleDescription: "Description.RuleExplanation.Spam",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Spam",
                policyKey: "spam"
            },
            "Label.AbuseType.SuicideSelfHarm": dh,
            "Label.AbuseType.Swearing": {
                ruleTitle: "Heading.RuleExplanation.Swearing",
                ruleSubtitle: "SubHeading.RuleExplanation.Swearing",
                ruleDescription: "Description.RuleExplanation.Swearing",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Swearing",
                policyKey: "swearing"
            },
            "Label.AbuseType.ThreatsOrAbuseOfRobloxEmployeesOrAffiliates": dc,
            "Label.AbuseType.ViolentContentAndGore": {
                ruleTitle: "Heading.RuleExplanation.ViolentContentAndGore",
                ruleSubtitle: "SubHeading.RuleExplanation.ViolentContentAndGore",
                ruleDescription: "Description.RuleExplanation.ViolentContentAndGore",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.ViolentContentAndGore",
                policyKey: "violent-content-and-gore"
            },
            "Label.AbuseType.VirtualCasino": dh,
            "Label.Sublabel.RealLifeEvents": {
                ruleTitle: "Heading.RuleExplanation.RealLifeEvents",
                ruleSubtitle: "SubHeading.RuleExplanation.RealLifeEvents",
                ruleDescription: "Description.RuleExplanation.RealLifeEvents",
                ruleDescriptionBullets: "Description.RuleExplanation.Bullets.RealLifeEvents",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.RealLifeEvents",
                policyKey: "real-life-events"
            },
            "Label.Sublabel.RomanceOrSex": dl
        },
        dv = (e, t) => {
            if (t) {
                let t = cW[e];
                if (t) return t.education
            }
            return dp[e]
        },
        dy = e => {
            let {
                size: t = "Medium"
            } = e, n = cO().translate, r = cQ();
            return (0, b.jsx)("div", {
                "data-testid": "appeals-process",
                children: (0, b.jsx)("p", {
                    children: (0, b.jsx)(cj.f, {
                        href: "https://en.help.roblox.com/hc/en-us/articles/360000245263-Appeal-Your-Content-Moderation",
                        target: "_blank",
                        rel: "noreferrer noopener",
                        size: t,
                        color: "Standard",
                        variant: "Inline",
                        underline: "always",
                        isExternal: !1,
                        onClick: () => {
                            r("appealsProcessClicked")
                        },
                        children: n("Action.ViewAppealGuidelines")
                    })
                })
            })
        },
        dm = {
            getIsVisible: e => e.showAppealsProcessLink,
            renderComponent: dy,
            configName: "appeals-process"
        },
        dg = "{startLink}",
        db = "{endLink}",
        dw = (e, t) => (n, r, i, a) => {
            var o;
            let [s, u] = e(n, {
                startLink: dg,
                endLink: db,
                ...i
            }).split(dg, 2), [l, c] = null != (o = null == u ? void 0 : u.split(db, 2)) ? o : [];
            return (0, b.jsxs)("p", {
                className: "text-body-large",
                children: [s, (0, b.jsx)("a", {
                    href: r,
                    className: "content-link",
                    rel: "noreferrer",
                    onClick: () => {
                        null != a && t && t(a)
                    },
                    children: l
                }), c]
            })
        },
        dx = {
            getIsVisible: e => [cZ, "VPC"].includes(e.verificationCategory),
            renderComponent: e => {
                let {
                    punishmentData: t
                } = e, n = cO().translate, {
                    websiteUrl: r
                } = cO(), i = dw(n), {
                    verificationCategory: a
                } = t, o = "".concat(r, "/"), s = i("VPC" === a ? "Label.ParentReactivationNotice" : "Label.EmailReactivationNotice", o);
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, b.jsx)("span", {
                        className: "text-heading-medium",
                        children: n("Label.ChargebackNextSteps")
                    }), s]
                })
            },
            configName: "chargeback-steps"
        },
        dP = {
            getIsVisible: e => "Delete" !== e.punishmentTypeDescription,
            renderComponent: e => {
                let {
                    punishmentData: t
                } = e, n = cO().translate, {
                    hasEducationalPages: r
                } = c4(), {
                    isKidsTreatment: i
                } = cX(), a = cQ(), {
                    showUGCAvatarGuidelinesLink: o,
                    context: s
                } = t, u = null == s ? void 0 : s.IS_ALT_INFORMED;
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, b.jsx)("span", {
                        className: "text-heading-medium",
                        children: n(i ? "Heading.WhatNext" : "Label.RuleBreakingAddsUp")
                    }), (0, b.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, b.jsx)("p", {
                            className: "text-body-large",
                            children: n(i ? "Description.Foreshadow.Kids" : "Description.Foreshadow")
                        }), u && (0, b.jsx)("p", {
                            className: "text-body-large",
                            children: n("Description.LinkedAccounts")
                        }), (!!o || !r) && (0, b.jsx)(lo.f, {
                            as: "a",
                            href: o ? "https://create.roblox.com/docs/marketplace/marketplace-policy#general-creation-guidelines" : "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards",
                            target: "_blank",
                            rel: "noreferrer noopener",
                            variant: "Standard",
                            size: "Small",
                            onClick: () => {
                                a(o ? "ugcGuidelinesClicked" : "communityGuidelineClicked")
                            },
                            children: n(o ? "Action.ViewRulesUGCAvatarGuidelines" : "Action.ViewRules")
                        })]
                    })]
                })
            },
            configName: "prevention-steps"
        },
        dS = function(e, t, n, r) {
            let i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                a = arguments.length > 5 ? arguments[5] : void 0;
            if (i) {
                if ("Warn" === n) return r("Description.WarningDescription.Kids");
                if ("Delete" === n) return r("Description.BannedDescription.Kids");
                if (a) {
                    let e = new Date(a);
                    if (!Number.isNaN(e.getTime())) return r("Description.SuspendedUntil", {
                        date: e.toLocaleDateString(void 0, {
                            year: "numeric",
                            month: "long",
                            day: "numeric"
                        }),
                        time: e.toLocaleTimeString(void 0, {
                            hour: "numeric",
                            minute: "numeric"
                        })
                    })
                }
            }
            if ("Delete" === n) return r("Description.BrokeRulesBanned");
            let o = cJ[null != t ? t : ""],
                s = o ? r(o) : "";
            return e.length > 0 ? s ? r("Description.BrokeRulesTypePolicy.V2", {
                type: s,
                policy: e.join(", ").toLowerCase()
            }) : r("Description.BrokeRulesPolicy.V2", {
                policy: e.join(", ").toLowerCase()
            }) : s ? r("Description.BrokeRulesType", {
                type: s
            }) : r("Description.BrokeRulesGeneric")
        },
        dR = {
            getIsVisible: () => !0,
            renderComponent: e => {
                var t, n, r;
                let {
                    punishmentData: i
                } = e, a = cO().translate, {
                    violationReasons: o,
                    isKidsTreatment: s
                } = cX(), {
                    violation: u,
                    punishmentTypeDescription: l,
                    endDate: c
                } = i, d = null == u || null == (r = u.evidence) || null == (n = r.displayMeta) ? void 0 : n.capitalizedKey, f = dS(null != (t = null == o ? void 0 : o.translatedReasons) ? t : [], d, l, a, s, c);
                return (0, b.jsx)("span", {
                    className: "text-body-medium",
                    children: f
                })
            },
            configName: "punishment-description"
        },
        dT = "/safety-dashboard",
        dE = function() {
            var e;
            let {
                preferViolationDetail: t = !1
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
                websiteUrl: n,
                platform: r,
                onAppealsRedirect: i
            } = cO(), {
                punishmentData: a
            } = cX(), o = cQ(), s = t ? null == a || null == (e = a.violation) ? void 0 : e.uid : void 0;
            return {
                handleAppealsClick: (0, oh.useCallback)(() => {
                    let e;
                    if (o("appealsPortalClicked"), i) return void i(s);
                    try {
                        e = new URL(dT, n)
                    } catch (t) {
                        e = new URL(dT, "https://www.roblox.com")
                    }
                    e.searchParams.set("t_source", r), s ? e.searchParams.set("vid", s) : e.hash = "/violations", window.open(e.toString(), "_blank", "noopener,noreferrer")
                }, [o, i, s, n, r])
            }
        },
        dk = {
            getIsVisible: (e, t, n) => {
                var r;
                return !(null != (r = null == n ? void 0 : n.educational_pass_eligible) && r) || "second-chance-intro" === t
            },
            renderComponent: e => {
                let {
                    punishmentData: t
                } = e, n = cO().translate, {
                    handleAppealsClick: r
                } = dE({
                    preferViolationDetail: !0
                }), {
                    isKidsTreatment: i
                } = cX();
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "report-mistake",
                    children: [(0, b.jsx)("p", {
                        className: "text-body-large",
                        children: n(i ? "Description.Mistake.Kids" : "Description.Mistake.V3")
                    }), (0, b.jsx)(lo.f, {
                        variant: "Standard",
                        size: "Small",
                        onClick: r,
                        children: n("Action.SendAppeal")
                    }), t.showAppealsProcessLink && (0, b.jsx)(dy, {
                        punishmentData: t,
                        size: "Large"
                    })]
                })
            },
            configName: "report-mistake"
        },
        dA = e => {
            let {
                url: t,
                altLabelKey: n
            } = e, r = cO().translate, [i, a] = (0, oh.useState)(!0);
            return (0, b.jsxs)("div", {
                className: "flex aspect-1-1 justify-center items-center bg-shift-200 radius-medium",
                children: [(0, b.jsx)("img", {
                    style: {
                        objectFit: "contain"
                    },
                    className: "size-full ".concat(i ? "hidden" : ""),
                    src: t,
                    alt: n && r(n),
                    onLoad: () => {
                        a(!1)
                    },
                    onError: () => {
                        a(!1)
                    }
                }), (0, b.jsx)("div", {
                    "data-testid": "spinner-container",
                    className: i ? void 0 : "hidden",
                    children: (0, b.jsx)(lu.f, {
                        ariaLabel: r("Label.LoadingImage"),
                        size: "Medium",
                        variant: "Indeterminate"
                    })
                })]
            })
        },
        dq = e => new Date(e).toLocaleString(void 0, {
            month: "long",
            day: "numeric",
            year: "numeric",
            hour: "numeric",
            minute: "numeric"
        });

    function dj() {
        let {
            formatFullDate: e
        } = cO();
        return null != e ? e : dq
    }
    var d_ = e => {
            let {
                fieldLabel: t,
                fieldValue: n,
                preline: r = !1,
                showColon: i = !0
            } = e;
            return (0, b.jsxs)("div", {
                className: "flex flex-col",
                children: [(0, b.jsx)("span", {
                    className: "text-title-medium",
                    children: i ? "".concat(t, ":") : t
                }), (0, b.jsx)("p", {
                    className: "text-body-medium",
                    style: {
                        wordBreak: "break-word",
                        whiteSpace: r ? "pre-line" : "normal"
                    },
                    children: n
                })]
            })
        },
        dI = () => {
            let e = cO().translate,
                {
                    handleAppealsClick: t
                } = dE(),
                {
                    readOnly: n
                } = cO();
            return n ? null : (0, b.jsx)(lo.f, {
                onClick: t,
                variant: "Standard",
                size: "Small",
                children: e("Action.ViewMore")
            })
        },
        dC = {
            getIsVisible: cH,
            renderComponent: e => {
                var t, n;
                let {
                    punishmentData: r
                } = e, {
                    violation: i,
                    consequenceTransparencyMessage: a
                } = r, o = cO().translate, s = dj(), u = cQ(), l = null == i || null == (n = i.evidence) ? void 0 : n.elements, c = null != (t = null == l ? void 0 : l.filter(e => cB(e))) ? t : [], d = [], f = [];
                c.forEach(e => {
                    var t;
                    "image" === e.type ? d.push((0, b.jsx)(dA, {
                        url: e.url,
                        altLabelKey: e.labelKey
                    }, e.url)) : f.push((0, b.jsx)(d_, {
                        fieldLabel: o(e.labelKey),
                        fieldValue: e.textKey ? ((e, t, n, r) => {
                            if (!n) return e(t);
                            try {
                                return e(t, n)
                            } catch (i) {
                                return null == r || r("missingTranslation", {
                                    additionalInfo: JSON.stringify({
                                        key: t,
                                        params: n
                                    })
                                }), e(t)
                            }
                        })(o, e.textKey, e.textKeyParameters, u) : null != (t = e.text) ? t : ""
                    }, e.labelKey))
                });
                let h = d.length > 0;
                return (0, b.jsxs)("div", {
                    "data-testid": "violation-grid",
                    className: "flex flex-col gap-medium medium:flex-row medium:gap-large",
                    children: [h && (0, b.jsx)("div", {
                        className: "shrink-0 width-[50%] medium:width-full medium:basis-[40%]",
                        children: d[0]
                    }), (0, b.jsxs)("div", {
                        className: "flex flex-col gap-small width-full",
                        children: [f, (0, b.jsx)(d_, {
                            fieldLabel: o("Label.ReviewDate"),
                            fieldValue: s(r.beginDate)
                        }), a && (0, b.jsx)(d_, {
                            fieldLabel: o("Label.DecisionMethod"),
                            fieldValue: a
                        }), (0, b.jsx)(dI, {})]
                    })]
                })
            },
            configName: "violation-evidence"
        },
        dO = e => {
            let {
                badUtterances: t
            } = e, [n, r] = (0, oh.useState)(!1), i = cO().translate;
            return (0, b.jsxs)("div", {
                className: "flex flex-col gap-small",
                children: [(0, b.jsxs)("div", {
                    className: "flex flex-col",
                    children: [(0, b.jsxs)("span", {
                        className: "text-title-medium",
                        children: [i("Label.OffensiveItem.V2"), ":"]
                    }), (0, b.jsxs)("div", {
                        className: "flex flex-col items-start",
                        children: [t.slice(0, 4).map(e => (0, b.jsx)("p", {
                            className: "text-body-medium",
                            style: {
                                wordBreak: "break-word"
                            },
                            children: e.utteranceText
                        }, e.utteranceText)), t.slice(4).map(e => (0, b.jsx)("p", {
                            className: "text-body-medium ".concat(n ? "" : "hidden"),
                            style: {
                                wordBreak: "break-word"
                            },
                            children: e.utteranceText
                        }, e.utteranceText))]
                    })]
                }), t.length > 4 && (0, b.jsx)(lo.f, {
                    className: "self-start margin-left-[-7px]",
                    variant: "Link",
                    size: "XSmall",
                    onClick: () => {
                        r(e => !e)
                    },
                    "data-testid": "view-toggle-button",
                    children: i(n ? "Action.ViewLess" : "Action.ViewMore")
                })]
            })
        },
        dL = {
            getIsVisible: e => {
                var t, n;
                return !cH(e) && (null != (t = null == (n = e.badUtterances) ? void 0 : n.length) ? t : 0) > 0
            },
            renderComponent: e => {
                let {
                    punishmentData: t
                } = e, n = cO().translate, r = dj(), {
                    badUtterances: i,
                    consequenceTransparencyMessage: a
                } = t;
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "bad-utterances",
                    children: [(0, b.jsx)(dO, {
                        badUtterances: null != i ? i : []
                    }), (0, b.jsx)(lE.f, {}), (0, b.jsx)(d_, {
                        fieldLabel: n("Label.ReviewDate"),
                        fieldValue: r(t.beginDate)
                    }), a && (0, b.jsx)(d_, {
                        fieldLabel: n("Label.DecisionMethod"),
                        fieldValue: a
                    }), (0, b.jsx)(dI, {})]
                })
            },
            configName: "bad-utterances"
        },
        dD = {
            getIsVisible: e => {
                var t, n;
                return !cH(e) && (null != (t = null == (n = e.badUtterances) ? void 0 : n.length) ? t : 0) === 0
            },
            renderComponent: e => {
                let t = cO().translate,
                    n = dj(),
                    {
                        punishmentData: r
                    } = e,
                    {
                        beginDate: i,
                        consequenceTransparencyMessage: a
                    } = r;
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "simple-evidence",
                    children: [(0, b.jsx)(d_, {
                        fieldLabel: t("Label.ReviewDate"),
                        fieldValue: n(i)
                    }), a && (0, b.jsx)(d_, {
                        fieldLabel: t("Label.DecisionMethod"),
                        fieldValue: a
                    }), (0, b.jsx)(dI, {})]
                })
            },
            configName: "simple-evidence"
        },
        dM = {
            getIsVisible: () => !0,
            renderComponent: e => {
                let {
                    punishmentData: t
                } = e, n = cO().translate, {
                    isKidsTreatment: r
                } = cX(), i = [dC, dL, dD].map(e => e.getIsVisible(t) ? (0, b.jsx)("div", {
                    children: e.renderComponent({
                        punishmentData: t
                    })
                }, e.configName) : null).filter(Boolean);
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "reviewed-evidence-container",
                    children: [(0, b.jsx)("span", {
                        className: "text-title-large",
                        children: n(r ? "Heading.RecentlyChecked" : "Label.LatestActivity")
                    }), (0, b.jsxs)("div", {
                        className: "flex flex-col gap-xsmall",
                        children: [(0, b.jsx)("div", {
                            className: "padding-large bg-shift-100 radius-medium",
                            children: i
                        }), (0, b.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: t.interventionId
                        })]
                    })]
                })
            },
            configName: "rewiewed-evidence"
        },
        dN = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let e = cO().translate;
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, b.jsx)("span", {
                        className: "text-heading-medium",
                        children: e("Heading.SecondChance.Details")
                    }), (0, b.jsx)("p", {
                        className: "text-body-large",
                        children: e("Description.SecondChance.Details")
                    })]
                })
            },
            configName: "second-chance-conclusion"
        },
        dU = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let e = cO().translate;
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-large",
                    children: [(0, b.jsx)("span", {
                        className: "text-heading-medium",
                        children: e("Heading.SecondChance")
                    }), (0, b.jsx)("p", {
                        className: "text-body-large",
                        children: e("Description.SecondChance.Second")
                    })]
                })
            },
            configName: "second-chance-intro"
        },
        dB = {
            getIsVisible: () => !0,
            renderComponent: () => {
                var e;
                let t = cO().translate,
                    {
                        violationReasons: n,
                        isKidsTreatment: r,
                        moderatorNote: i
                    } = cX(),
                    a = (null != (e = null == n ? void 0 : n.translatedReasons) ? e : []).join(", ") || t("Label.AbuseType.Other");
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "what-happened",
                    children: [(0, b.jsx)("span", {
                        className: "text-title-large",
                        children: t(r ? "Heading.Why" : "Label.WhatHappened")
                    }), (0, b.jsx)("div", {
                        className: "padding-large bg-shift-100 radius-medium flex flex-col gap-small",
                        children: r ? (0, b.jsx)(d_, {
                            fieldLabel: a,
                            fieldValue: i,
                            showColon: !1,
                            preline: !0
                        }) : (0, b.jsxs)(oh.Fragment, {
                            children: [(0, b.jsx)(d_, {
                                fieldLabel: t("Label.Reason"),
                                fieldValue: a
                            }), (0, b.jsx)(d_, {
                                fieldLabel: t("Label.ModeratorNote"),
                                fieldValue: i,
                                preline: !0
                            })]
                        })
                    })]
                })
            },
            configName: "what-happened"
        },
        dF = e => e.split("\n").map(e => e.trim()).filter(Boolean),
        dH = e => ({
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = cO().translate,
                    n = e.description ? t(e.description) : void 0,
                    r = n ? dF(n) : [],
                    i = e.descriptionBullets ? t(e.descriptionBullets) : void 0,
                    a = i ? dF(i) : [];
                return (0, b.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": e.policyKey,
                    children: [(0, b.jsx)("span", {
                        className: "text-heading-medium",
                        children: t(e.title)
                    }), e.subtitle && (0, b.jsx)("span", {
                        className: "text-title-large",
                        children: t(e.subtitle)
                    }), (0, b.jsxs)("div", {
                        className: "flex flex-col gap-small",
                        children: [r.length > 0 && (0, b.jsx)("div", {
                            className: "flex flex-col gap-medium",
                            children: r.map(e => (0, b.jsx)("p", {
                                className: "text-body-large",
                                children: e
                            }, e))
                        }), a.length > 0 && (0, b.jsx)("div", {
                            className: "flex flex-col gap-xsmall padding-left-small",
                            children: a.map(e => (0, b.jsxs)("div", {
                                className: "flex flex-row gap-small",
                                children: [(0, b.jsx)("p", {
                                    className: "text-body-large",
                                    children: "•"
                                }), (0, b.jsx)("p", {
                                    className: "text-body-large",
                                    children: e
                                })]
                            }, e))
                        })]
                    })]
                })
            },
            configName: e.policyKey
        }),
        dV = e => {
            let {
                isDisabled: t = !1
            } = e, n = cO().translate, {
                goToNextPage: r
            } = c4();
            return (0, b.jsx)(lo.f, {
                variant: "Emphasis",
                size: "Medium",
                onClick: r,
                "data-testid": "continue-button",
                isDisabled: t,
                children: n("Action.Continue")
            })
        },
        dG = e => {
            let {
                setIsDialogOpen: t
            } = e, n = cO().translate;
            return (0, b.jsx)(lo.f, {
                variant: "Emphasis",
                size: "Medium",
                onClick: () => {
                    t(!1)
                },
                className: "min-width-1800",
                "data-testid": "dismiss-dialog-button",
                children: n("Action.OK")
            })
        },
        dW = ((h = dW || {})[h.Reactivate = 0] = "Reactivate", h[h.Paused = 1] = "Paused", h[h.VerifyEmail = 2] = "VerifyEmail", h[h.VerifyVPC = 3] = "VerifyVPC", h),
        dK = e => {
            let {
                onClose: t
            } = e, n = cO().translate;
            return (0, b.jsxs)("div", {
                className: "width-full flex gap-large items-center justify-between radius-medium padding-medium stroke-system-alert stroke-standard maf-error-alert",
                style: {
                    backgroundColor: "rgba(255, 0, 0, 0.1)"
                },
                "data-testid": "error-alert",
                children: [(0, b.jsxs)("div", {
                    className: "flex gap-small items-center",
                    children: [(0, b.jsx)(cR.f, {
                        name: "icon-filled-circle-x",
                        className: "content-system-alert"
                    }), (0, b.jsx)("span", {
                        className: "text-body-medium",
                        children: n("Heading.Error")
                    })]
                }), (0, b.jsx)(cA.f, {
                    icon: "icon-regular-x-small",
                    ariaLabel: "Close",
                    onClick: t,
                    variant: "Utility",
                    size: "Medium",
                    className: "content-system-alert shrink-0",
                    isCircular: !0
                })]
            })
        },
        dz = e => {
            let t, {
                    proceedAction: n,
                    setIsDialogOpen: r,
                    isAgreed: i,
                    isDisabled: a = !1
                } = e,
                o = cO().translate,
                {
                    sendPageEvent: s
                } = du(),
                {
                    userModerationApiUrl: u,
                    httpPost: l,
                    onVerifyEmail: c,
                    onVerifyParent: d,
                    onAccountReactivated: f
                } = cO(),
                [h, p] = (0, oh.useState)(!1),
                v = (0, cT.f)({
                    mutationFn: () => l("".concat(u, "/v1/not-approved/reactivate")),
                    onSuccess: async () => {
                        await new Promise(e => {
                            setTimeout(e, 2e3)
                        }), f()
                    },
                    onMutate: () => {
                        p(!0), s("reactivateClicked")
                    },
                    onError: e => {
                        console.error("reactivateMutation error", e instanceof Error ? e.message : "Unknown error"), p(!1)
                    },
                    retry: 0
                });
            switch (n) {
                case 1:
                case 0:
                    t = o("Action.Continue");
                    break;
                case 2:
                    t = o("Label.EmailVerificationButtonText");
                    break;
                case 3:
                    t = o("Label.ParentVerificationButtonText");
                    break;
                case null:
                    console.warn("proceedAction has impossible value ".concat(n)), t = ""
            }
            let y = async () => {
                switch (n) {
                    case 0:
                        return void v.mutate();
                    case 2:
                        r(!1), s("emailVerificationClicked"), await (null == c ? void 0 : c());
                        return;
                    case 3:
                        r(!1), s("parentVerificationClicked"), await (null == d ? void 0 : d({
                            featureName: "CanRequestPunishmentLifting",
                            namespace: "account_management/AccountManagement",
                            ampRecourseData: {
                                punishmentType: "Chargeback"
                            },
                            isAsyncCall: !0,
                            usePrologue: !1
                        })), r(!0);
                        return;
                    case 1:
                        return void console.warn("cannot reactivate suspended account yet");
                    case null:
                        console.warn("proceedAction has impossible value ".concat(n))
                }
            };
            return (0, b.jsxs)(oh.Fragment, {
                children: [v.isError && (0, b.jsx)(dK, {
                    onClose: () => {
                        v.reset()
                    }
                }), (0, b.jsx)(lo.f, {
                    onClick: () => {
                        y().catch(e => {
                            console.warn("NotApprovedProceedButton onClick error", e instanceof Error ? e.message : "unknown")
                        })
                    },
                    isDisabled: a || h || !i,
                    isLoading: h,
                    variant: "Emphasis",
                    size: "Medium",
                    "data-testid": "proceed-button",
                    children: t
                })]
            })
        },
        dX = function(e) {
            let {
                punishmentTypeDescription: t,
                endDate: n,
                verificationCategory: r
            } = e;
            switch (r) {
                case cZ:
                    return 2;
                case "VPC":
                    return 3;
                default:
                    return +!c0(t, n, r)
            }
        },
        dQ = e => {
            let {
                endDate: t
            } = e, n = cO().translate, r = ((e, t) => {
                let n = new Date(e),
                    r = Date.now();
                if (Number.isNaN(n.getTime())) return t("Label.Hours", {
                    hours: "00",
                    minutes: "00"
                });
                let i = n.getTime() - r;
                if (i < 0 && (i = 0), i > 864e5) return t("Label.Days", {
                    number: String(Math.ceil(i / 864e5))
                });
                let a = Math.floor(i / 36e5),
                    o = Math.floor(i % 36e5 / 6e4);
                return i > 0 && i < 6e4 && (o = 1), t("Label.Hours", {
                    hours: a.toString().padStart(2, "0"),
                    minutes: o.toString().padStart(2, "0")
                })
            })(t, n);
            return (0, b.jsxs)("div", {
                "data-testid": "suspension-duration-alert",
                className: "flex flex-wrap gap-small bg-shift-100 padding-x-medium padding-y-small stroke-standard stroke-default items-center radius-medium",
                children: [(0, b.jsx)(cR.f, {
                    name: "icon-filled-triangle-exclamation",
                    className: "content-system-warning"
                }), (0, b.jsx)("span", {
                    className: "text-title-medium",
                    children: n("Label.Suspension")
                }), (0, b.jsx)("p", {
                    className: "text-body-medium",
                    children: r
                })]
            })
        },
        d$ = e => {
            let {
                punishmentData: t,
                setIsDialogOpen: n
            } = e, r = cO().translate, i = cQ(), {
                endDate: a,
                punishmentTypeDescription: o
            } = t, s = dX(t), [u, l] = (0, oh.useState)(!1), [c, d] = (0, oh.useState)(!1);
            return (0, oh.useEffect)(() => {
                let e;
                return Object.values(c$).includes(o) && o.startsWith("Ban") && (e = setTimeout(() => {
                    d(e => !e)
                }, 6e4)), () => {
                    clearTimeout(e)
                }
            }, [c, o]), 1 === s ? (0, b.jsxs)("div", {
                className: "flex flex-col gap-large medium:flex-row",
                children: [(0, b.jsx)(dQ, {
                    endDate: a
                }), (0, b.jsx)(dz, {
                    proceedAction: s,
                    setIsDialogOpen: n,
                    isAgreed: u,
                    isDisabled: !0
                })]
            }) : (0, b.jsxs)(oh.Fragment, {
                children: [(0, b.jsx)(c_.f, {
                    label: r("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: u,
                    onCheckedChange: e => {
                        l(!0 === e), i("checkboxChecked")
                    },
                    className: "self-start",
                    "data-testid": "rule-confirmation-checkbox"
                }), (0, b.jsx)(dz, {
                    proceedAction: s,
                    setIsDialogOpen: n,
                    isAgreed: u,
                    isDisabled: !u
                })]
            })
        },
        dY = () => {
            let e = cO().translate,
                {
                    handleAppealsClick: t
                } = dE({
                    preferViolationDetail: !0
                });
            return (0, b.jsx)(lo.f, {
                variant: "SoftEmphasis",
                size: "Medium",
                onClick: t,
                "data-testid": "appeals-button",
                children: e("Action.ReportMistake")
            })
        },
        dJ = async (e, t) => t("".concat(e, "/moderation-appeal-service/v2/consequence-commutation"), {
            type: "EDUCATIONAL_PASS"
        }), dZ = () => {
            let e = cO().translate,
                {
                    sendPageEvent: t
                } = du(),
                {
                    httpPost: n,
                    apiGatewayUrl: r,
                    onAccountReactivated: i
                } = cO(),
                {
                    handleAppealsClick: a
                } = dE({
                    preferViolationDetail: !0
                }),
                [o, s] = (0, oh.useState)(!1),
                u = (0, cT.f)({
                    mutationFn: () => dJ(r, n),
                    onMutate: () => {
                        s(!0), t("secondChanceReactivateClicked")
                    },
                    onSuccess: async () => {
                        await new Promise(e => {
                            setTimeout(e, 2e3)
                        }), i()
                    },
                    onError: e => {
                        console.error("reactivateMutation error", e instanceof Error ? e.message : "Unknown error"), s(!1)
                    },
                    retry: 0
                });
            return (0, b.jsxs)(oh.Fragment, {
                children: [u.isError && (0, b.jsx)(dK, {
                    onClose: () => {
                        u.reset()
                    }
                }), (0, b.jsxs)("div", {
                    className: "flex flex-col gap-small medium:flex-row-reverse",
                    children: [(0, b.jsx)(lo.f, {
                        onClick: () => {
                            u.mutate()
                        },
                        variant: "Emphasis",
                        size: "Medium",
                        className: "min-width-2600",
                        "data-testid": "second-chance-reactivate-button",
                        isLoading: o,
                        isDisabled: o,
                        children: e("Action.OK")
                    }), (0, b.jsx)(lo.f, {
                        onClick: a,
                        variant: "Standard",
                        size: "Medium",
                        "data-testid": "second-chance-send-appeal-button",
                        children: e("Action.SendAppeal")
                    })]
                })]
            })
        }, d0 = () => {
            let e = cO().translate,
                [t, n] = (0, oh.useState)(!1);
            return (0, b.jsxs)(oh.Fragment, {
                children: [(0, b.jsx)(c_.f, {
                    label: e("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: t,
                    onCheckedChange: e => {
                        n(!0 === e)
                    },
                    className: "self-start",
                    "data-testid": "understand-continue-checkbox"
                }), (0, b.jsx)(dV, {
                    isDisabled: !t
                })]
            })
        }, d1 = function(e, t, n) {
            let r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                i = [],
                a = new Set,
                o = [],
                s = new Map;
            return e.forEach(e => {
                var t;
                let n = dv(e, r);
                if (!n) return void a.add(e);
                let i = null != (t = n.deduplicationKey) ? t : n.policyKey,
                    u = s.get(i);
                u ? n.deduplicationKey && !u.deduplicationKey && s.set(i, n) : (o.push(i), s.set(i, n))
            }), o.forEach(e => {
                let r = s.get(e);
                if (!r) return;
                let a = t && !n ? d0 : dV;
                i.push({
                    pageName: "policy-rule-".concat(r.policyKey),
                    pageItems: [dH({
                        title: r.ruleTitle,
                        subtitle: r.ruleSubtitle,
                        description: r.ruleDescription,
                        descriptionBullets: r.ruleDescriptionBullets,
                        policyKey: r.policyKey
                    })],
                    CtaComponent: a
                }), i.push({
                    pageName: "policy-importance-".concat(r.policyKey),
                    pageItems: [dH({
                        title: r.importanceTitle,
                        description: r.importanceDescription,
                        descriptionBullets: r.importanceDescriptionBullets,
                        policyKey: r.policyKey
                    })],
                    CtaComponent: a
                })
            }), {
                educationalPages: i,
                unmappedViolationKeys: [...a]
            }
        }, d2 = function(e, t, n, r) {
            var i;
            let a = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                o = [],
                s = "Delete" === e.punishmentTypeDescription,
                u = null != (i = null == n ? void 0 : n.educational_pass_eligible) && i;
            if (o.push({
                    pageName: "intro",
                    pageItems: [dR, dB, dM, ...s ? [dm] : []],
                    CtaComponent: s ? dY : dV
                }), s) return {
                pages: o,
                unmappedViolationKeys: []
            };
            u && !r && o.push({
                pageName: "second-chance-intro",
                pageItems: [dU, dk],
                CtaComponent: dV
            });
            let {
                educationalPages: l,
                unmappedViolationKeys: c
            } = d1(t, u, r, a);
            o.push(...l);
            let d = r ? dG : u ? d0 : d$;
            return o.push({
                pageName: "resolution",
                pageItems: [dP, dx, dk, ...r && u ? [dm] : []],
                CtaComponent: d
            }), u && !r && o.push({
                pageName: "second-chance-conclusion",
                pageItems: [dN],
                CtaComponent: dZ
            }), {
                pages: o,
                unmappedViolationKeys: c
            }
        }, d4 = e => {
            let {
                onOpenChange: t,
                children: n
            } = e, {
                readOnly: r
            } = cO(), {
                punishmentData: i,
                violationReasons: a,
                isLoading: o,
                error: s,
                commutationEligibility: u,
                isKidsTreatment: l
            } = cX(), c = null == a ? void 0 : a.untranslatedReasons, d = (0, oh.useMemo)(() => (null != c ? c : []).some(e => dv(e, l)), [c, l]), {
                pages: f,
                unmappedViolationKeys: h
            } = (0, oh.useMemo)(() => i ? d2(i, null != c ? c : [], u, r, l) : {
                pages: [],
                unmappedViolationKeys: []
            }, [i, c, u, r, l]);
            return o ? n({
                header: (0, b.jsx)(de, {
                    readOnly: !!r
                }),
                body: (0, b.jsx)(dt, {}),
                ctas: (0, b.jsx)(dn, {})
            }) : s || !i ? n({
                header: (0, b.jsx)(dr, {}),
                body: (0, b.jsx)(di, {
                    error: s
                })
            }) : (0, b.jsx)(c2, {
                pages: f,
                unmappedViolationKeys: h,
                hasEducationalPages: d,
                commutationEligibility: u,
                children: (0, b.jsx)(ds, {
                    children: n({
                        header: (0, b.jsx)(c7, {
                            punishmentData: i
                        }),
                        body: (0, b.jsx)(c3, {
                            punishmentData: i,
                            commutationEligibility: u
                        }),
                        ctas: (0, b.jsx)(c9, {
                            punishmentData: i,
                            setIsDialogOpen: t
                        })
                    })
                })
            })
        }, d3 = e => {
            let {
                impressionEvent: t
            } = e, {
                translate: n,
                websiteUrl: r,
                onLogout: i
            } = cO(), a = cQ(), o = dw(n, a), [s, u] = (0, oh.useState)(!1);
            (0, oh.useEffect)(() => {
                a(t)
            }, [a, t]);
            let l = (0, cT.f)({
                mutationFn: async () => {
                    await i()
                },
                onMutate: () => {
                    u(!0), a("logoutClicked")
                },
                onError: e => {
                    let n = e instanceof Error ? e.message : "Unknown error";
                    a("error", {
                        additionalInfo: "".concat(t, ": Error logging out - ").concat(n)
                    }), u(!1)
                },
                retry: 0
            });
            return (0, b.jsx)(ls.N, {
                open: !0,
                isModal: !0,
                size: "Medium",
                hasCloseAffordance: !1,
                children: (0, b.jsxs)(ls.d, {
                    className: "[&_p]:margin-none [&_h2]:margin-none",
                    children: [(0, b.jsxs)(ls.K, {
                        className: "gap-large flex flex-col",
                        children: [(0, b.jsx)(ls.F, {
                            className: "text-heading-large margin-none",
                            children: n("Heading.AccountIssue")
                        }), o("Description.ResolveIssue", r)]
                    }), (0, b.jsxs)(ls.c, {
                        className: "flex justify-end gap-small flex-col-reverse medium:flex-row",
                        children: [(0, b.jsx)(lo.f, {
                            variant: "Standard",
                            size: "Medium",
                            isLoading: s,
                            isDisabled: s,
                            onClick: () => {
                                l.mutate()
                            },
                            children: n("Action.Logout")
                        }), (0, b.jsx)(lo.f, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: () => {
                                window.open(r, "_blank", "noopener,noreferrer")
                            },
                            children: n("Action.GoToRoblox")
                        })]
                    })]
                })
            })
        }, d6 = e => {
            var t;
            let {
                open: n,
                onClose: r
            } = e, [i, a] = (0, oh.useState)(!0), o = void 0 !== n, s = e => {
                o && !e ? null == r || r() : a(e)
            }, {
                translate: u,
                renderSelfServiceDeactivated: l,
                shouldShowGenericFallback: c,
                readOnly: d
            } = cO(), {
                punishmentData: f,
                isLoading: h,
                error: p
            } = cX(), v = cQ(), y = !h && !p && void 0 !== f, m = !h && !p && !f;
            if ((0, oh.useEffect)(() => {
                    if (y) {
                        var e;
                        v((null == (e = f.context) ? void 0 : e.SelfServiceDeactivated) ? "accountReactivationPageRendered" : "pageRendered", {
                            interventionId: f.interventionId,
                            punishedUserId: f.punishedUserId,
                            isReactivationEligible: c0(f.punishmentTypeDescription, f.endDate, f.verificationCategory),
                            verificationCategory: f.verificationCategory
                        })
                    }
                }, [y, f]), m && !d) return null;
            if (y && (null == (t = f.context) ? void 0 : t.SelfServiceDeactivated)) return l ? (0, b.jsx)(oh.Fragment, {
                children: l()
            }) : (0, b.jsx)(d3, {
                impressionEvent: "accountReactivationRedirectRendered"
            });
            let g = y && (null == c ? void 0 : c(f));
            return g ? (0, b.jsx)(d3, {
                impressionEvent: g
            }) : (0, b.jsx)(ls.N, {
                open: null != n ? n : i,
                size: "Large",
                hasCloseAffordance: !!d,
                closeLabel: u("Action.Close"),
                isModal: !0,
                onOpenChange: d ? e => {
                    e || s(!1)
                } : void 0,
                children: (0, b.jsx)(ls.d, {
                    className: "width-full [&_p]:margin-none [&_h2]:margin-none",
                    onOpenAutoFocus: e => {
                        e.preventDefault()
                    },
                    children: (0, b.jsx)(ls.K, {
                        className: "flex flex-col height-[85vh] max-height-[800px]",
                        children: (0, b.jsx)(d4, {
                            onOpenChange: s,
                            children: e => {
                                let {
                                    header: t,
                                    body: n,
                                    ctas: r
                                } = e;
                                return (0, b.jsxs)("div", {
                                    className: "flex flex-col gap-large height-full min-height-0",
                                    children: [(0, b.jsx)(ls.F, {
                                        className: "padding-none",
                                        children: t
                                    }), (0, b.jsxs)("div", {
                                        className: "grow-1 scroll-y min-height-0",
                                        children: [n, (0, b.jsx)("div", {
                                            className: "bg-surface-100",
                                            style: {
                                                position: "sticky",
                                                bottom: -1,
                                                left: 0,
                                                height: "40px",
                                                maskImage: "linear-gradient(to bottom, transparent 0%, var(--color-surface-100) 100%)",
                                                WebkitMaskImage: "linear-gradient(to bottom, transparent 0%, var(--color-surface-100) 100%)"
                                            }
                                        })]
                                    }), (0, b.jsx)("div", {
                                        className: "shrink-0",
                                        children: r
                                    })]
                                })
                            }
                        })
                    })
                })
            })
        }, d8 = new om.f({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1,
                    refetchOnMount: !1,
                    staleTime: 6e4
                }
            }
        }), d5 = function(e) {
            let {
                open: t,
                onClose: n
            } = e;
            return (0, b.jsx)(og.P, {
                client: d8,
                children: (0, b.jsx)(cz, {
                    enableIxp: !0,
                    children: (0, b.jsx)(d6, {
                        open: t,
                        onClose: n
                    })
                })
            })
        }, d7 = e.i(894244), d9 = e.i(839165);
    let fe = function() {
            let {
                translate: e
            } = (0, oE.A)(), t = (0, u6.f)(), n = (0, op.useRouter)(), r = "https://usermoderation.".concat("roblox.com"), i = "https://apis.roblox.com", a = "https://".concat("roblox.com"), o = "CreatorHub", s = (0, oh.useCallback)(e => {
                lL.f.logHostRoutedEvent({
                    eventType: e.eventName,
                    context: e.context,
                    properties: e.properties
                })
            }, []), u = (0, oh.useCallback)(e => !!e.verificationCategory && cD.VerificationRedirectRendered, []), l = (0, oh.useCallback)(async () => {
                let e = await (0, d7.f)({
                    redirectUri: "https://create.roblox.com"
                });
                await t.logout(), await n.push(e)
            }, [n, t]), c = (0, oh.useCallback)(() => {
                n.reload()
            }, [n]);
            return (0, oh.useMemo)(() => ({
                translate: e,
                httpGet: d9.J,
                httpPost: d9.d,
                userModerationApiUrl: r,
                apiGatewayUrl: i,
                websiteUrl: a,
                sendAnalyticsEvent: s,
                platform: o,
                shouldShowGenericFallback: u,
                onLogout: l,
                onAccountReactivated: c
            }), [e, r, i, a, s, o, u, l, c])
        },
        ft = () => {
            let e = fe();
            return (0, b.jsx)(cC, {
                config: e,
                children: (0, b.jsx)(d5, {})
            })
        },
        fn = (0, oE.K)(() => {
            let {
                themeMode: e
            } = (0, u3.g)();
            return (0, b.jsx)(u7.f, {
                theme: e,
                children: (0, b.jsx)(ft, {})
            })
        }, [lp.f.NotApproved, lp.f.Moderation, lp.f.AppealsPortal, lp.f.CommonUIControls, lp.f.Error, lp.f.DashboardModeration]),
        fr = () => {
            let {
                status: e
            } = (0, u6.f)();
            return "moderated" === e ? (0, b.jsx)(fn, {}) : null
        };
    var fi = e.i(571381);
    let fa = (0, lN.default)(() => e.A(14667), {
            loadableGenerated: {
                modules: [573249]
            },
            ssr: !1
        }),
        fo = e => {
            let {
                children: t
            } = e;
            return (0, b.jsx)(fi.N, {
                Surface: fa,
                children: t
            })
        };
    var fs = e.i(336964);

    function fu(e) {
        return "object" == typeof e && null !== e && "Component" in e
    }

    function fl(e) {
        var t;
        let {
            store: n
        } = e, r = null != n ? n : fs.w, {
            render: i,
            options: a,
            isOpen: o
        } = (0, oh.useSyncExternalStore)(r.subscribe, r.getSnapshot, r.getSnapshot);
        if ((0, oh.useEffect)(() => {
                if (o || null === a || !a.shouldUnmountOnClose) return;
                let e = setTimeout(() => r.clearContent(), 150);
                return () => clearTimeout(e)
            }, [o, a, r]), null === i) return null;
        if ((null == a ? void 0 : a.mode) === "standalone" && fu(i)) return (0, oh.createElement)(i.Component, {
            ...i.props,
            open: o,
            onOpenChange: e => {
                e || r.close()
            }
        });
        let s = null != a ? a : fs.u,
            u = fu(i) ? (0, oh.createElement)(i.Component, i.props) : i;
        return (0, b.jsx)(ls.N, {
            open: o,
            onOpenChange: e => {
                e || r.close()
            },
            size: s.size,
            isModal: s.isModal,
            hasCloseAffordance: s.hasCloseAffordance,
            closeLabel: null != (t = s.closeLabel) ? t : "",
            hasMarginTop: s.hasMarginTop,
            hasMarginBottom: s.hasMarginBottom,
            hasDescription: s.hasDescription,
            children: u
        })
    }
    var fc = e.i(428505),
        fd = e.i(209534);

    function ff() {
        let {
            current: e
        } = (0, oh.useSyncExternalStore)(fd.f.subscribe, fd.f.getSnapshot, fd.f.getSnapshot);
        return null === e ? null : (0, b.jsx)(fc.f, {
            ...e.props,
            onClose: () => fd.f.dismiss()
        }, e.id)
    }
    var fh = e.i(428993),
        fp = e.i(943758);
    let fv = (0, oh.createContext)({
        primarySidebarExpanded: !1,
        setPrimarySidebarExpanded: () => {
            throw Error("Function not implemented. You may be trying to use this context outside of a provider.")
        }
    });
    fv.displayName = "LeftNavigationStateContext";
    let fy = e => {
        let {
            children: t
        } = e, [n, r] = (0, oh.useState)(!0), i = (0, oh.useMemo)(() => ({
            primarySidebarExpanded: n,
            setPrimarySidebarExpanded: r
        }), [n]);
        return (0, b.jsx)(fv.Provider, {
            value: i,
            children: t
        })
    };
    var fm = e.i(729904),
        fg = e.i(623127),
        fb = e.i(47277),
        fw = e.i(148792),
        fx = e.i(373488),
        fP = e.i(446475),
        fS = e.i(196990),
        fR = e.i(533968),
        fT = e.i(210205),
        fE = e.i(616931),
        fk = e.i(407881);
    let fA = (0, oE.K)(e => {
            var t, n;
            let {
                onDialogCompletion: r
            } = e, i = (0, op.useRouter)(), {
                translate: a
            } = (0, oE.A)(), {
                user: o,
                logout: s
            } = (0, u6.f)(), u = (0, oh.useRef)(!1), [l, c] = (0, oh.useState)(!1), {
                completeCheck: d
            } = (0, fk.c)(), {
                captureError: f,
                error: h,
                info: p
            } = (0, fT.f)(), [v, y] = (0, oh.useState)(!1), [m, g] = (0, oh.useState)(!1), [w, x] = (0, oh.useState)([]), P = (0, oh.useCallback)(async e => {
                async function t(e, n) {
                    if (n <= 0) return void h("User Agreement accept failed after retried ".concat(fE.N, " times"));
                    try {
                        var r;
                        let i = null == (r = (await fS.f.acceptUserAgreements(e)).results) ? void 0 : r.filter(e => 0 !== e.errorCode).map(e => e.agreementId);
                        i && i.length > 0 && await t(i, n - 1)
                    } catch (i) {
                        let r = (0, fR.f)(i);
                        (null == r ? void 0 : r.status) === l4.R.UNAUTHORIZED ? (p("User Agreement accept failed with 401 from backend"), await op.default.push("/login")) : (h("User Agreement accept failed with status code ".concat(null == r ? void 0 : r.status)), await t(e, n - 1))
                    }
                }
                await t(e, fE.N)
            }, [h, p]), S = (0, oh.useCallback)(async () => {
                try {
                    await s()
                } catch (e) {
                    e instanceof Error && f(e), h("Logout after user reject update agreements failed")
                } finally {
                    y(!1), null == r || r()
                }
            }, [f, h, s, r]), R = (0, oh.useCallback)(async () => {
                let e = w.map(e => e.id);
                g(!0), await P(e), c(!0), g(!1), y(!1), null == r || r()
            }, [P, w, r]), T = (0, oh.useCallback)(async () => {
                try {
                    let e = fS.f.getUserAgreements({
                            clientType: fg.m.Studio
                        }),
                        t = await e;
                    t.length > 0 ? (x([...t]), y(!0)) : (d(), null == r || r())
                } catch (e) {
                    null == r || r(), h("Fetch update user-agreements failed"), e instanceof Error && f(e), d()
                }
            }, [f, d, h, r]), E = (0, oh.useMemo)(() => ({
                onExited: () => {
                    l && d()
                }
            }), [d, l]);
            return (0, oh.useEffect)(() => {
                (null == o ? void 0 : o.id) === void 0 || u.current || !i.isReady || fE.y.some(e => i.pathname.startsWith(e)) || (T(), u.current = !0)
            }, [o, T, i.isReady, i.pathname]), (0, b.jsx)(fw.f, {
                open: v,
                TransitionProps: E,
                children: (0, b.jsx)(fx.f, {
                    onConfirm: R,
                    onCancel: S,
                    title: a("Heading.AgreementsUpdate"),
                    content: (0, b.jsxs)(b.Fragment, {
                        children: [(0, b.jsx)(fb.f, {
                            component: "p",
                            variant: "body1",
                            children: null != (t = null == (n = w.find(e => null != e.agreementBodyText)) ? void 0 : n.agreementBodyText) ? t : a("Description.AgreementsUpdate")
                        }), (0, b.jsx)("ul", {
                            children: w.map(e => {
                                var t;
                                let n;
                                return (0, b.jsx)("li", {
                                    children: (0, b.jsx)(fP.f, {
                                        href: e.displayUrl,
                                        target: "__blank",
                                        children: (t = e.agreementType, void 0 === (n = fE.M[t]) ? a(n) : t)
                                    })
                                }, e.id)
                            })
                        })]
                    }),
                    confirmText: a("Button.Accept"),
                    cancelText: a("Button.Reject"),
                    loading: m
                })
            })
        }, [lp.f.AgreementsUpdate]),
        {
            authenticationApi: fq
        } = {
            authenticationApi: uY
        },
        {
            discoveryApi: fj
        } = uy.Z,
        {
            usersApi: f_
        } = uZ.V,
        fI = (r = lL.f, e => {
            var t, n, i, a, o, s, u, l, c;
            let d, f;
            return r.logWebVitalsEvent({
                eventName: "webVitals",
                parameters: {
                    metricName: e.name,
                    metricStartTime: String(e.startTime),
                    metricValue: String(e.value),
                    metricLabel: e.label,
                    ...uh || (uh = {
                        staticAsset: void 0 === (d = null == (o = performance) || null == (a = o.getEntriesByType) || null == (i = a.call(o, "resource")) || null == (n = i.find) || null == (t = n.call(i, e => {
                            let {
                                initiatorType: t,
                                name: n
                            } = e;
                            return "script" === t && n.includes("_next/static/chunks/")
                        })) ? void 0 : t.transferSize) ? "unknown" : 0 === d ? "cached" : "network",
                        serviceWorker: (null == (s = navigator) ? void 0 : s.serviceWorker) ? navigator.serviceWorker.controller ? "controlled" : "uncontrolled" : "unsupported",
                        pageLoad: void 0 === (f = null == (c = performance) || null == (l = c.getEntriesByType) || null == (u = l.call(c, "navigation")[0]) ? void 0 : u.transferSize) ? "unknown" : 0 === f ? "cached" : "network"
                    })
                }
            })
        });
    (0, oS.c)({
        unifiedLogger: lL.f
    }), lV();
    let fC = (uu && (y = null != (p = document.querySelector('meta[name="'.concat("emotion-insertion-point-mui", '"]'))) ? p : void 0, m = null != (v = document.querySelector('meta[name="'.concat("emotion-insertion-point-tss", '"]'))) ? v : void 0), {
        muiCache: (0, oq.c)({
            key: uo,
            prepend: !0,
            insertionPoint: y
        }),
        tssCache: (0, oq.c)({
            key: us,
            insertionPoint: m
        })
    });
    (0, ok.g)((0, u0.V)("thumbnails"));
    let fO = {
            locale: l2.J,
            nativeName: l2.n
        },
        fL = new l1.f(fO, l2.E),
        fD = e => {
            let t, n, {
                children: r
            } = e;
            return t = (0, lD.a)(), n = (0, og.d)(), (0, oh.useEffect)(() => t.subscribe(e => {
                if ("external" === e.eventType) return void n.invalidateQueries({
                    queryKey: lM.D.universe(e.universeId)
                });
                if ("pin" === e.eventType || "unpin" === e.eventType) {
                    n.invalidateQueries({
                        queryKey: lM.D.list(e.universeId),
                        refetchType: "none"
                    }), n.invalidateQueries({
                        queryKey: lM.D.pinned(e.universeId)
                    }), n.invalidateQueries({
                        queryKey: lM.D.detail(e.universeId, e.dashboardId)
                    });
                    return
                }
                n.invalidateQueries({
                    queryKey: lM.D.list(e.universeId)
                }), n.invalidateQueries({
                    queryKey: lM.D.pinned(e.universeId)
                }), n.invalidateQueries({
                    queryKey: lM.D.suggestedName(e.universeId)
                }), n.invalidateQueries({
                    queryKey: lM.D.detail(e.universeId, e.dashboardId)
                })
            }), [t, n]), (0, b.jsx)(b.Fragment, {
                children: r
            })
        },
        fM = {
            defaultLocale: l2.J,
            title: l2.y["OpenGraph.Title"],
            description: l2.y["OpenGraph.Description"]
        },
        fN = e => e,
        fU = () => ((() => {
            let {
                trackerClient: e
            } = (0, lO.l)(), t = (0, oh.useCallback)(() => {
                let t = (0, lY.a)();
                e.sendEvent(t)
            }, [e]);
            (0, lJ.f)(void 0, t), (0, oh.useEffect)(() => t(), [t]), (0, oh.useEffect)(() => {
                lL.f.trackPageLoad()
            }, []), (0, oh.useEffect)(() => {
                let {
                    pageSettledTracker: e
                } = lL.f;
                return e.getSnapshot(), op.default.events.on("routeChangeStart", e.start), op.default.events.on("routeChangeComplete", e.complete), op.default.events.on("routeChangeError", e.cancel), () => {
                    op.default.events.off("routeChangeStart", e.start), op.default.events.off("routeChangeComplete", e.complete), op.default.events.off("routeChangeError", e.cancel)
                }
            }, [])
        })(), (0, ov.useReportWebVitals)(fI), null),
        fB = {
            enabled: !0,
            isFetched: !0
        },
        fF = e => {
            let {
                children: t
            } = e, {
                value: n
            } = (0, oT.f)(up.Y), r = (() => {
                let {
                    ready: e,
                    value: t
                } = (0, oT.f)(fh.E);
                return (0, oh.useMemo)(() => ({
                    visible: e && t
                }), [e, t])
            })();
            return (0, b.jsx)(oP.b, {
                currentProduct: "CreatorDashboard",
                environment: (0, fm.f)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: fB,
                creatorWalletsNavigation: r,
                enableGroupModeration: null != n && n,
                children: t
            })
        },
        fH = new om.f({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1
                }
            }
        }),
        fV = (0, ob.x)(),
        fG = e => {
            var t;
            let {
                Component: n,
                pageProps: r,
                cache: i
            } = e, {
                query: a
            } = (0, op.useRouter)(), o = null != (t = n.getPageLayout) ? t : fN, s = (0, oh.useMemo)(() => ({
                ...fM,
                ...n.pageMetadata
            }), [n.pageMetadata]), [u, l] = (0, oh.useState)(!1), c = (0, oh.useCallback)(() => l(!0), []);
            return (0, ox.A)("https://create.roblox.com"), (0, oh.useEffect)(() => {
                ul()
            }, []), lf.U.setUnifiedLoggerClient(lL.f), (0, b.jsx)(oy.f, {
                children: (0, b.jsx)(uc, {
                    cache: null != i ? i : fC,
                    children: (0, b.jsxs)(lQ, {
                        providers: [(0, b.jsx)(fp.U, {}), (0, b.jsx)(og.P, {
                            client: fH
                        }), (0, b.jsx)(oR.C, {
                            client: uJ.f
                        }), (0, b.jsx)(lD.H, {}), (0, b.jsx)(lD.N, {}), (0, b.jsx)(fD, {}), (0, b.jsx)(l0, {
                            pageLoggerConfig: n.loggerConfig
                        }), (0, b.jsx)(lO.e, {
                            trackerClient: lf.U
                        }), (0, b.jsx)(ob.R, {
                            clientId: "4273917941353191905",
                            authenticationClient: fq,
                            discoveryClient: fj,
                            usersClient: f_,
                            store: fV
                        }), (0, b.jsx)(lG.e, {}), (0, b.jsx)(u8, {}), (0, b.jsx)(u9, {
                            themeElement: "u" > typeof document ? document.documentElement : void 0
                        }), (0, b.jsx)(oE.N, {
                            provider: fL
                        }), (0, b.jsx)(ud.f, {}), (0, b.jsx)(uf.f, {}), (0, b.jsx)(u5.U, {}), (0, b.jsx)(ok.z, {
                            baseUrl: lf.u
                        }), (0, b.jsx)(fF, {}), (0, b.jsx)(l$.L, {}), (0, b.jsx)(l8, {}), (0, b.jsx)(lX.f, {}), (0, b.jsx)(fy, {}), (0, b.jsx)(ow.b, {
                            robloxSiteDomain: "roblox.com"
                        }), (0, b.jsx)(uv.G, {}), (0, b.jsx)(fo, {}), (0, b.jsx)(fk.U, {})],
                        children: [(0, b.jsx)(fU, {}), (0, b.jsx)(u4, {
                            provider: fL
                        }), (0, b.jsx)(ff, {}), (0, b.jsx)(fl, {}), (0, b.jsx)(fr, {}), (0, b.jsx)(lC, {
                            isSuppressed: !u
                        }), (0, b.jsx)(fA, {
                            onDialogCompletion: c
                        }), (0, b.jsx)(lz, {}), (0, b.jsx)(ce, {
                            openGraphMetadata: s
                        }), o((0, b.jsx)(n, {
                            ...r
                        }), {
                            query: a
                        })]
                    })
                })
            })
        };
    e.s(["CustomApp", 0, fG, "default", 0, fG, "reportWebVitals", 0, fI], 656350)
}]);

//# debugId=12d54266-9457-08d3-77ef-ceb131133a02
//# sourceMappingURL=2v-_qbt3hmiay.js.map