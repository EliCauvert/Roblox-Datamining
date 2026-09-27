! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "14c4ada98faa7e1c59b35fccb850a708f85ea7af"
        };
        var r = (new e.Error).stack;
        r && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[r] = "6c4ffe3f-0e63-4752-b1a2-34af3107d9f4", e._sentryDebugIdIdentifier = "sentry-dbid-6c4ffe3f-0e63-4752-b1a2-34af3107d9f4")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, r = {},
        t = {};

    function n(e) {
        var o = t[e];
        if (void 0 !== o) return o.exports;
        var a = t[e] = {
            exports: {}
        };
        return r[e](a, a.exports, n), a.exports
    }
    n.m = r, n.n = function(e) {
        var r = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return n.d(r, {
            a: r
        }), r
    }, n.d = function(e, r) {
        for (var t in r) n.o(r, t) && !n.o(e, t) && Object.defineProperty(e, t, {
            enumerable: !0,
            get: r[t]
        })
    }, n.o = function(e, r) {
        return Object.prototype.hasOwnProperty.call(e, r)
    }, n.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.7.12"
    }, n.ruid = "bundler=rspack@1.7.12";
    var o = window.ReactJSX,
        a = window.CoreUtilities,
        i = window.Roblox["core-scripts"].react,
        l = window.React,
        c = window.PropTypes,
        u = n.n(c),
        s = window.ReactUtilities,
        f = window.Roblox,
        d = f.EnvironmentUrls.userAgreementsServiceApi,
        p = function() {
            var e = {
                withCredentials: !0,
                url: "".concat(d, "/v1/agreements-resolution/").concat("web")
            };
            return a.httpService.get(e)
        },
        y = function(e) {
            var r = {
                acceptances: e.map(function(e) {
                    return {
                        agreementId: e
                    }
                })
            };
            return a.httpService.post({
                withCredentials: !0,
                url: "".concat(d, "/v1/acceptances")
            }, r)
        },
        v = window.ReactStyleGuide,
        h = "Roblox.UserAgreements",
        b = {
            TermsOfService: "Modal.Agreement.TermsOfService",
            PrivacyPolicy: "Modal.Agreement.PrivacyPolicy",
            RiderTerms: "Modal.Agreement.RiderTerms",
            ChildrenPrivacyPolicy: "Modal.Agreement.ChildrenPrivacyPolicy"
        },
        m = window.CoreRobloxUtilities,
        g = window.HeaderScripts;

    function w(e, r, t, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            t(e);
            return
        }
        l.done ? r(c) : Promise.resolve(c).then(n, o)
    }

    function S(e, r) {
        return null != r && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](e) : e instanceof r
    }
    var x = function(e) {
            var r;
            return (r = function() {
                var r, t, n, o;
                return function(e, r) {
                    var t, n, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                        l = Object.defineProperty;
                    return l(i, "next", {
                        value: c(0)
                    }), l(i, "throw", {
                        value: c(1)
                    }), l(i, "return", {
                        value: c(2)
                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                        value: function() {
                            return this
                        }
                    }), i;

                    function c(l) {
                        return function(c) {
                            var u = [l, c];
                            if (t) throw TypeError("Generator is already executing.");
                            for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                if (t = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                    case 0:
                                    case 1:
                                        o = u;
                                        break;
                                    case 4:
                                        return a.label++, {
                                            value: u[1],
                                            done: !1
                                        };
                                    case 5:
                                        a.label++, n = u[1], u = [0];
                                        continue;
                                    case 7:
                                        u = a.ops.pop(), a.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                            a = 0;
                                            continue
                                        }
                                        if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                            a.label = u[1];
                                            break
                                        }
                                        if (6 === u[0] && a.label < o[1]) {
                                            a.label = o[1], o = u;
                                            break
                                        }
                                        if (o && a.label < o[2]) {
                                            a.label = o[2], a.ops.push(u);
                                            break
                                        }
                                        o[2] && a.ops.pop(), a.trys.pop();
                                        continue
                                }
                                u = r.call(e, a)
                            } catch (e) {
                                u = [6, e], n = 0
                            } finally {
                                t = o = 0
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
                            if (f.DeviceMeta && (0, f.DeviceMeta)().isInApp || !g.authenticatedUser.isAuthenticated) return [2, !1];
                            try {
                                r = m.localStorageService.getLocalStorage(h)
                            } catch (e) {
                                if (S(e, SyntaxError)) return [2, !0];
                                throw e
                            }
                            if (null === r || Number.isNaN(t = Date.parse(r.lastFetchTimestamp)) || r.doesUserNeedToAcceptAgreements) return [2, !0];
                            n = e.getTime(), a.label = 1;
                        case 1:
                            return a.trys.push([1, 3, , 4]), [4, f.Guac.callBehaviour("user-agreements-policy")];
                        case 2:
                            return o = a.sent().cooldownPeriodInMs, [3, 4];
                        case 3:
                            return a.sent(), o = 864e5, [3, 4];
                        case 4:
                            return [2, n > t + o]
                    }
                })
            }, function() {
                var e = this,
                    t = arguments;
                return new Promise(function(n, o) {
                    var a = r.apply(e, t);

                    function i(e) {
                        w(a, n, o, i, l, "next", e)
                    }

                    function l(e) {
                        w(a, n, o, i, l, "throw", e)
                    }
                    i(void 0)
                })
            })()
        },
        T = function(e) {
            var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
            if (e && !S(r, Date)) throw TypeError("if doesUserNeedToAcceptAgreements is true then must provide a valid Date");
            var t = {
                doesUserNeedToAcceptAgreements: e
            };
            if (S(r, Date)) t.lastFetchTimestamp = r.toISOString();
            else try {
                t.lastFetchTimestamp = m.localStorageService.getLocalStorage(h).lastFetchTimestamp
            } catch (e) {
                if (S(e, SyntaxError)) return void m.localStorageService.removeLocalStorage(h);
                throw e
            }
            try {
                m.localStorageService.setLocalStorage(h, t)
            } catch (e) {
                console.error("Error updating doesUserNeedToAcceptAgreements ".concat(e))
            }
        };

    function A(e, r) {
        (null == r || r > e.length) && (r = e.length);
        for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
        return n
    }

    function j(e, r, t, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            t(e);
            return
        }
        l.done ? r(c) : Promise.resolve(c).then(n, o)
    }
    var I = function(e) {
            if (Array.isArray(e)) return e
        }(e = (0, v.createModal)()) || function(e) {
            var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != n) {
                var o = [],
                    a = !0,
                    i = !1;
                try {
                    for (n = n.call(e); !(a = (r = n.next()).done) && (o.push(r.value), 2 !== o.length); a = !0);
                } catch (e) {
                    i = !0, t = e
                } finally {
                    try {
                        a || null == n.return || n.return()
                    } finally {
                        if (i) throw t
                    }
                }
                return o
            }
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return A(e, 2);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return A(e, 2)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }(),
        P = I[0],
        O = I[1],
        R = function(e) {
            var r = e.translate,
                t = e.agreements,
                n = (0, o.jsxs)("div", {
                    className: "agreement-modal-body",
                    children: [(0, o.jsx)(function() {
                        var e, n = null == (e = t.find(function(e) {
                            return null != e.agreementBodyText
                        })) ? void 0 : e.agreementBodyText;
                        return (0, o.jsx)("div", {
                            children: null != n ? n : r("Modal.Body")
                        })
                    }, {}), (0, o.jsx)(function() {
                        var e = t.map(function(e) {
                            return (0, o.jsx)("li", {
                                className: "agreement-item",
                                children: (0, o.jsx)(v.Link, {
                                    url: e.displayUrl,
                                    target: "_blank",
                                    rel: "noreferrer",
                                    className: "text-link",
                                    children: r(b[e.agreementType])
                                })
                            }, e.id)
                        });
                        return (0, o.jsx)("ul", {
                            children: e
                        })
                    }, {
                        agreements: t
                    })]
                });
            return (0, l.useEffect)(function() {
                O.open()
            }, []), (0, o.jsx)(P, {
                title: r("Modal.Title"),
                body: n,
                neutralButtonText: r("Modal.Agree"),
                onNeutral: function() {
                    var e;
                    return (e = function() {
                        var e;
                        return function(e, r) {
                            var t, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: c(0)
                            }), l(i, "throw", {
                                value: c(1)
                            }), l(i, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (t) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                        if (t = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    a.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && a.label < o[1]) {
                                                    a.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(u);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        u = r.call(e, a)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        t = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), [4, y(t.map(function(e) {
                                        return e.id
                                    }))];
                                case 1:
                                    return r.sent(), T(!1), [3, 3];
                                case 2:
                                    return e = r.sent(), console.error("Error accepting user agreements ".concat(e)), [3, 3];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var r = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var a = e.apply(r, t);

                            function i(e) {
                                j(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                j(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                id: "user-agreements-checker-modal",
                closeable: !1
            })
        };

    function E(e, r) {
        (null == r || r > e.length) && (r = e.length);
        for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
        return n
    }

    function U(e, r, t, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            t(e);
            return
        }
        l.done ? r(c) : Promise.resolve(c).then(n, o)
    }
    R.propTypes = {
        translate: u().func.isRequired,
        agreements: u().arrayOf(u().shape({
            displayUrl: u().string.isRequired,
            id: u().string.isRequired,
            agreementType: u().string.isRequired,
            clientType: u().string.isRequired,
            regulationType: u().string.isRequired,
            agreementBodyText: u().string
        })).isRequired
    };
    var k = function(e) {
        var r, t = e.translate,
            n = function(e) {
                if (Array.isArray(e)) return e
            }(r = (0, l.useState)([])) || function(e) {
                var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (null != n) {
                    var o = [],
                        a = !0,
                        i = !1;
                    try {
                        for (n = n.call(e); !(a = (r = n.next()).done) && (o.push(r.value), 2 !== o.length); a = !0);
                    } catch (e) {
                        i = !0, t = e
                    } finally {
                        try {
                            a || null == n.return || n.return()
                        } finally {
                            if (i) throw t
                        }
                    }
                    return o
                }
            }(r) || function(e) {
                if (e) {
                    if ("string" == typeof e) return E(e, 2);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return E(e, 2)
                }
            }(r) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }(),
            a = n[0],
            i = n[1];
        return ((0, l.useEffect)(function() {
            var e, r = new Date;
            (e = function() {
                var e, t, n, o;
                return function(e, r) {
                    var t, n, o, a = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                        l = Object.defineProperty;
                    return l(i, "next", {
                        value: c(0)
                    }), l(i, "throw", {
                        value: c(1)
                    }), l(i, "return", {
                        value: c(2)
                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                        value: function() {
                            return this
                        }
                    }), i;

                    function c(l) {
                        return function(c) {
                            var u = [l, c];
                            if (t) throw TypeError("Generator is already executing.");
                            for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                if (t = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                    case 0:
                                    case 1:
                                        o = u;
                                        break;
                                    case 4:
                                        return a.label++, {
                                            value: u[1],
                                            done: !1
                                        };
                                    case 5:
                                        a.label++, n = u[1], u = [0];
                                        continue;
                                    case 7:
                                        u = a.ops.pop(), a.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                            a = 0;
                                            continue
                                        }
                                        if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                            a.label = u[1];
                                            break
                                        }
                                        if (6 === u[0] && a.label < o[1]) {
                                            a.label = o[1], o = u;
                                            break
                                        }
                                        if (o && a.label < o[2]) {
                                            a.label = o[2], a.ops.push(u);
                                            break
                                        }
                                        o[2] && a.ops.pop(), a.trys.pop();
                                        continue
                                }
                                u = r.call(e, a)
                            } catch (e) {
                                u = [6, e], n = 0
                            } finally {
                                t = o = 0
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
                            e = !1, a.label = 1;
                        case 1:
                            return a.trys.push([1, 3, , 4]), [4, x(r)];
                        case 2:
                            return e = a.sent(), [3, 4];
                        case 3:
                            return t = a.sent(), console.error("Error calling shouldFetchAgreements ".concat(t)), [3, 4];
                        case 4:
                            if (!e) return [3, 8];
                            a.label = 5;
                        case 5:
                            return a.trys.push([5, 7, , 8]), [4, p()];
                        case 6:
                            return i((n = a.sent()).data), n.data.length > 0 ? T(!0, r) : T(!1, r), [3, 8];
                        case 7:
                            return o = a.sent(), console.error("Error fetching or caching user agreements ".concat(o)), [3, 8];
                        case 8:
                            return [2]
                    }
                })
            }, function() {
                var r = this,
                    t = arguments;
                return new Promise(function(n, o) {
                    var a = e.apply(r, t);

                    function i(e) {
                        U(a, n, o, i, l, "next", e)
                    }

                    function l(e) {
                        U(a, n, o, i, l, "throw", e)
                    }
                    i(void 0)
                })
            })()
        }, []), a.length > 0) ? (0, o.jsx)(R, {
            translate: t,
            agreements: a
        }) : null
    };
    k.propTypes = {
        translate: u().func.isRequired
    };
    var M = (0, s.withTranslations)(k, {
            common: ["CommonUI.UserAgreements", "CommonUI.Controls"],
            feature: null
        }),
        C = JSON.parse('{"P":["CommonUI.UserAgreements","CommonUI.Controls"]}');
    (0, a.ready)(function() {
        var e = document.getElementById("user-agreements-checker-container");
        null !== e && (0, i.renderWithErrorBoundary)((0, o.jsx)(i.TranslationProvider, {
            config: C.P,
            children: (0, o.jsx)(M, {})
        }), e)
    })
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("UserAgreementsChecker");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/userAgreementsChecker-69d6c92f03cafc7a.js.map