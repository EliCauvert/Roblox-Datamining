! function() {
    "use strict";
    var e = {},
        n = {};

    function t(r) {
        var o = n[r];
        if (void 0 !== o) return o.exports;
        var i = n[r] = {
            exports: {}
        };
        return e[r](i, i.exports, t), i.exports
    }
    t.n = function(e) {
        var n = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return t.d(n, {
            a: n
        }), n
    }, t.d = function(e, n) {
        for (var r in n) t.o(n, r) && !t.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: n[r]
        })
    }, t.o = function(e, n) {
        return Object.prototype.hasOwnProperty.call(e, n)
    }, t.rv = function() {
        return "1.2.8"
    }, t.ruid = "bundler=rspack@1.2.8";
    var r = window.Roblox["core-scripts"].environmentUrls,
        o = t.n(r),
        i = window.CoreUtilities,
        u = ["click", "dblclick", "focus", "hover", "keypress", "mousedown", "mouseenter", "mouseover", "scroll", "touchmove", "touchstart"],
        a = ["blur"];

    function c(e, n, t, r, o, i, u) {
        try {
            var a = e[i](u),
                c = a.value
        } catch (e) {
            t(e);
            return
        }
        a.done ? n(c) : Promise.resolve(c).then(r, o)
    }

    function l() {
        var e;
        return e = function() {
            var e;
            return function(e, n) {
                var t, r, o, i, u = {
                    label: 0,
                    sent: function() {
                        if (1 & o[0]) throw o[1];
                        return o[1]
                    },
                    trys: [],
                    ops: []
                };
                return i = {
                    next: a(0),
                    throw: a(1),
                    return: a(2)
                }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function a(i) {
                    return function(a) {
                        return function(i) {
                            if (t) throw TypeError("Generator is already executing.");
                            for (; u;) try {
                                if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                    case 0:
                                    case 1:
                                        o = i;
                                        break;
                                    case 4:
                                        return u.label++, {
                                            value: i[1],
                                            done: !1
                                        };
                                    case 5:
                                        u.label++, r = i[1], i = [0];
                                        continue;
                                    case 7:
                                        i = u.ops.pop(), u.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = u.trys).length > 0 && o[o.length - 1]) && (6 === i[0] || 2 === i[0])) {
                                            u = 0;
                                            continue
                                        }
                                        if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                            u.label = i[1];
                                            break
                                        }
                                        if (6 === i[0] && u.label < o[1]) {
                                            u.label = o[1], o = i;
                                            break
                                        }
                                        if (o && u.label < o[2]) {
                                            u.label = o[2], u.ops.push(i);
                                            break
                                        }
                                        o[2] && u.ops.pop(), u.trys.pop();
                                        continue
                                }
                                i = n.call(e, u)
                            } catch (e) {
                                i = [6, e], r = 0
                            } finally {
                                t = o = 0
                            }
                            if (5 & i[0]) throw i[1];
                            return {
                                value: i[0] ? i[1] : void 0,
                                done: !0
                            }
                        }([i, a])
                    }
                }
            }(this, function(n) {
                switch (n.label) {
                    case 0:
                        e = o().apiGatewayUrl, n.label = 1;
                    case 1:
                        var t;
                        return n.trys.push([1, 3, , 4]), [4, i.httpService.post({
                            url: "".concat(e).concat("/user-heartbeats-api/pulse"),
                            withCredentials: !0
                        }, {
                            clientSideTimestampEpochMs: Date.now(),
                            sessionInfo: {
                                sessionId: (t = /sessionid=([a-f0-9-]{36})/.exec(document.cookie)) && t.length >= 2 ? t[1] : "unknown"
                            },
                            locationInfo: {
                                websiteLocationInfo: {
                                    url: window.location.href
                                }
                            }
                        })];
                    case 2:
                        return n.sent(), [3, 4];
                    case 3:
                        return console.error(n.sent()), [3, 4];
                    case 4:
                        return [2]
                }
            })
        }, (l = function() {
            var n = this,
                t = arguments;
            return new Promise(function(r, o) {
                var i = e.apply(n, t);

                function u(e) {
                    c(i, r, o, u, a, "next", e)
                }

                function a(e) {
                    c(i, r, o, u, a, "throw", e)
                }
                u(void 0)
            })
        }).apply(this, arguments)
    }

    function s(e, n, t, r, o, i, u) {
        try {
            var a = e[i](u),
                c = a.value
        } catch (e) {
            t(e);
            return
        }
        a.done ? n(c) : Promise.resolve(c).then(r, o)
    }

    function f(e) {
        return function() {
            var n = this,
                t = arguments;
            return new Promise(function(r, o) {
                var i = e.apply(n, t);

                function u(e) {
                    s(i, r, o, u, a, "next", e)
                }

                function a(e) {
                    s(i, r, o, u, a, "throw", e)
                }
                u(void 0)
            })
        }
    }

    function v(e, n, t) {
        return n in e ? Object.defineProperty(e, n, {
            value: t,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[n] = t, e
    }

    function h(e, n) {
        var t, r, o, i, u = {
            label: 0,
            sent: function() {
                if (1 & o[0]) throw o[1];
                return o[1]
            },
            trys: [],
            ops: []
        };
        return i = {
            next: a(0),
            throw: a(1),
            return: a(2)
        }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function a(i) {
            return function(a) {
                return function(i) {
                    if (t) throw TypeError("Generator is already executing.");
                    for (; u;) try {
                        if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                        switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                            case 0:
                            case 1:
                                o = i;
                                break;
                            case 4:
                                return u.label++, {
                                    value: i[1],
                                    done: !1
                                };
                            case 5:
                                u.label++, r = i[1], i = [0];
                                continue;
                            case 7:
                                i = u.ops.pop(), u.trys.pop();
                                continue;
                            default:
                                if (!(o = (o = u.trys).length > 0 && o[o.length - 1]) && (6 === i[0] || 2 === i[0])) {
                                    u = 0;
                                    continue
                                }
                                if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                    u.label = i[1];
                                    break
                                }
                                if (6 === i[0] && u.label < o[1]) {
                                    u.label = o[1], o = i;
                                    break
                                }
                                if (o && u.label < o[2]) {
                                    u.label = o[2], u.ops.push(i);
                                    break
                                }
                                o[2] && u.ops.pop(), u.trys.pop();
                                continue
                        }
                        i = n.call(e, u)
                    } catch (e) {
                        i = [6, e], r = 0
                    } finally {
                        t = o = 0
                    }
                    if (5 & i[0]) throw i[1];
                    return {
                        value: i[0] ? i[1] : void 0,
                        done: !0
                    }
                }([i, a])
            }
        }
    }
    var p = function() {
            var e;

            function n(e) {
                (function(e, n) {
                    if (!(e instanceof n)) throw TypeError("Cannot call a class as a function")
                })(this, n), v(this, "isActive", !1), v(this, "intervalTimeMs", 0), v(this, "timeoutActive", !1), this.intervalTimeMs = e
            }
            return e = [{
                    key: "start",
                    value: function() {
                        return this.sendPulseAndSetTimeout()
                    }
                }, {
                    key: "onActiveEvent",
                    value: function() {
                        var e = this;
                        return f(function() {
                            return h(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        if (e.timeoutActive) return [3, 2];
                                        return [4, e.sendPulseAndSetTimeout()];
                                    case 1:
                                        return n.sent(), [3, 3];
                                    case 2:
                                        e.isActive = !0, n.label = 3;
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }
                }, {
                    key: "onInactiveEvent",
                    value: function() {
                        this.isActive = !1
                    }
                }, {
                    key: "sendPulseAndSetTimeout",
                    value: function() {
                        var e = this;
                        return f(function() {
                            return h(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return e.timeoutActive = !0, [4, function() {
                                            return l.apply(this, arguments)
                                        }()];
                                    case 1:
                                        return n.sent(), setTimeout(function() {
                                            return e.onTimeout()
                                        }, e.intervalTimeMs), [2]
                                }
                            })
                        })()
                    }
                }, {
                    key: "onTimeout",
                    value: function() {
                        var e = this;
                        return f(function() {
                            return h(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        if (!e.isActive) return [3, 2];
                                        return [4, e.sendPulseAndSetTimeout()];
                                    case 1:
                                        return n.sent(), e.isActive = !1, [3, 3];
                                    case 2:
                                        e.timeoutActive = !1, n.label = 3;
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }
                }],
                function(e, n) {
                    for (var t = 0; t < n.length; t++) {
                        var r = n[t];
                        r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                    }
                }(n.prototype, e), n
        }(),
        b = window.Roblox["core-scripts"].guac;

    function d(e, n, t, r, o, i, u) {
        try {
            var a = e[i](u),
                c = a.value
        } catch (e) {
            t(e);
            return
        }
        a.done ? n(c) : Promise.resolve(c).then(r, o)
    }

    function y() {
        var e;
        return e = function() {
            var e, n, t;
            return function(e, n) {
                var t, r, o, i, u = {
                    label: 0,
                    sent: function() {
                        if (1 & o[0]) throw o[1];
                        return o[1]
                    },
                    trys: [],
                    ops: []
                };
                return i = {
                    next: a(0),
                    throw: a(1),
                    return: a(2)
                }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function a(i) {
                    return function(a) {
                        return function(i) {
                            if (t) throw TypeError("Generator is already executing.");
                            for (; u;) try {
                                if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                    case 0:
                                    case 1:
                                        o = i;
                                        break;
                                    case 4:
                                        return u.label++, {
                                            value: i[1],
                                            done: !1
                                        };
                                    case 5:
                                        u.label++, r = i[1], i = [0];
                                        continue;
                                    case 7:
                                        i = u.ops.pop(), u.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = u.trys).length > 0 && o[o.length - 1]) && (6 === i[0] || 2 === i[0])) {
                                            u = 0;
                                            continue
                                        }
                                        if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                            u.label = i[1];
                                            break
                                        }
                                        if (6 === i[0] && u.label < o[1]) {
                                            u.label = o[1], o = i;
                                            break
                                        }
                                        if (o && u.label < o[2]) {
                                            u.label = o[2], u.ops.push(i);
                                            break
                                        }
                                        o[2] && u.ops.pop(), u.trys.pop();
                                        continue
                                }
                                i = n.call(e, u)
                            } catch (e) {
                                i = [6, e], r = 0
                            } finally {
                                t = o = 0
                            }
                            if (5 & i[0]) throw i[1];
                            return {
                                value: i[0] ? i[1] : void 0,
                                done: !0
                            }
                        }([i, a])
                    }
                }
            }(this, function(r) {
                switch (r.label) {
                    case 0:
                        return r.trys.push([0, 2, , 3]), [4, (0, b.callBehaviour)("user-heartbeats")];
                    case 1:
                        if (!(e = r.sent())) return [2, {
                            isEnabled: !1,
                            rolloutPercentage: 0,
                            intervalTimeMs: 3e4
                        }];
                        return [2, {
                            isEnabled: !!e.isEnabled,
                            rolloutPercentage: null !== (n = e.rolloutPercentage) && void 0 !== n ? n : 0,
                            intervalTimeMs: null !== (t = e.intervalTimeMs) && void 0 !== t ? t : 3e4
                        }];
                    case 2:
                        return console.error(r.sent()), [2, {
                            isEnabled: !1,
                            rolloutPercentage: 0,
                            intervalTimeMs: 3e4
                        }];
                    case 3:
                        return [2]
                }
            })
        }, (y = function() {
            var n = this,
                t = arguments;
            return new Promise(function(r, o) {
                var i = e.apply(n, t);

                function u(e) {
                    d(i, r, o, u, a, "next", e)
                }

                function a(e) {
                    d(i, r, o, u, a, "throw", e)
                }
                u(void 0)
            })
        }).apply(this, arguments)
    }
    var w = {
        loadGuacConfig: function() {
            return y.apply(this, arguments)
        }
    };

    function m(e, n, t, r, o, i, u) {
        try {
            var a = e[i](u),
                c = a.value
        } catch (e) {
            t(e);
            return
        }
        a.done ? n(c) : Promise.resolve(c).then(r, o)
    }

    function k() {
        var e;
        return e = function() {
            var e, n, t;
            return function(e, n) {
                var t, r, o, i, u = {
                    label: 0,
                    sent: function() {
                        if (1 & o[0]) throw o[1];
                        return o[1]
                    },
                    trys: [],
                    ops: []
                };
                return i = {
                    next: a(0),
                    throw: a(1),
                    return: a(2)
                }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function a(i) {
                    return function(a) {
                        return function(i) {
                            if (t) throw TypeError("Generator is already executing.");
                            for (; u;) try {
                                if (t = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
                                    case 0:
                                    case 1:
                                        o = i;
                                        break;
                                    case 4:
                                        return u.label++, {
                                            value: i[1],
                                            done: !1
                                        };
                                    case 5:
                                        u.label++, r = i[1], i = [0];
                                        continue;
                                    case 7:
                                        i = u.ops.pop(), u.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = u.trys).length > 0 && o[o.length - 1]) && (6 === i[0] || 2 === i[0])) {
                                            u = 0;
                                            continue
                                        }
                                        if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
                                            u.label = i[1];
                                            break
                                        }
                                        if (6 === i[0] && u.label < o[1]) {
                                            u.label = o[1], o = i;
                                            break
                                        }
                                        if (o && u.label < o[2]) {
                                            u.label = o[2], u.ops.push(i);
                                            break
                                        }
                                        o[2] && u.ops.pop(), u.trys.pop();
                                        continue
                                }
                                i = n.call(e, u)
                            } catch (e) {
                                i = [6, e], r = 0
                            } finally {
                                t = o = 0
                            }
                            if (5 & i[0]) throw i[1];
                            return {
                                value: i[0] ? i[1] : void 0,
                                done: !0
                            }
                        }([i, a])
                    }
                }
            }(this, function(r) {
                switch (r.label) {
                    case 0:
                        return [4, w.loadGuacConfig()];
                    case 1:
                        if (!((n = r.sent()).isEnabled && (null === (e = window.Roblox.CurrentUser) || void 0 === e ? void 0 : e.userId) && parseInt(window.Roblox.CurrentUser.userId, 10) % 100 < n.rolloutPercentage)) return [3, 3];
                        return t = new p(n.intervalTimeMs), u.forEach(function(e) {
                            window.addEventListener(e, function() {
                                t.onActiveEvent().catch(function(e) {
                                    console.error(e)
                                })
                            })
                        }), a.forEach(function(e) {
                            window.addEventListener(e, function() {
                                t.onInactiveEvent()
                            })
                        }), [4, t.start()];
                    case 2:
                        r.sent(), r.label = 3;
                    case 3:
                        return [2]
                }
            })
        }, (k = function() {
            var n = this,
                t = arguments;
            return new Promise(function(r, o) {
                var i = e.apply(n, t);

                function u(e) {
                    m(i, r, o, u, a, "next", e)
                }

                function a(e) {
                    m(i, r, o, u, a, "throw", e)
                }
                u(void 0)
            })
        }).apply(this, arguments)
    }(function() {
        return k.apply(this, arguments)
    })().catch(function(e) {
        console.error(e)
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PresenceRegistration");
//# debugId=8bd3141a-8692-429b-8a06-af6574222125
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/presenceRegistration-a5511e8a272ef008.js.map