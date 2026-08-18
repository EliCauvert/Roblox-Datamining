! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "2e4cbdd6942adf4cb89b7ef14ac81a38a2304408"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "d79473ef-0b3b-4c67-a06b-55a8d004a2c8", e._sentryDebugIdIdentifier = "sentry-dbid-d79473ef-0b3b-4c67-a06b-55a8d004a2c8")
    } catch (e) {}
}(),
function() {
    var e = {
            942: function(e) {
                function t(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var n = {}.hasOwnProperty;

                    function r() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return r.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var a in e) n.call(e, a) && e[a] && (i = o(i, a));
                                return i
                            }(a)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (r.default = r, e.exports = r) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return r
                    }) : window.classNames = r
                }()
            },
            258: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            890: function(e, t, n) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var i = t[r] = {
            exports: {}
        };
        return e[r](i, i.exports, n), i.exports
    }
    n.m = e, n.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return n.d(t, {
            a: t
        }), t
    }, n.d = function(e, t) {
        for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, n.k = function(e) {
        return "" + e + ".css"
    }, n.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.nc = void 0, n.rv = function() {
        return "1.5.7"
    }, n.g.importScripts && (r = n.g.location + "");
    var r, o = n.g.document;
    if (!r && o && (o.currentScript && "SCRIPT" === o.currentScript.tagName.toUpperCase() && (r = o.currentScript.src), !r)) {
        var i = o.getElementsByTagName("script");
        if (i.length)
            for (var a = i.length - 1; a > -1 && (!r || !/^http(s?):/.test(r));) r = i[a--].src
    }
    if (!r) throw Error("Automatic publicPath is not supported in this browser");
    n.p = r.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I, T, P, D, _, C, L, R, U, k, M, W, F, V, K, B, z, H, Y, G, X, $, Q, q, J, Z, ee, et, en, er, eo, ei, ea, el, eu, ec, es, ef, ed, ep, ey, ev, em, eb, eh, eg, eO, eS, ew, eE, eA, eN, ej, ex, eI, eT, eP, eD, e_, eC = {};
            n.r(eC), n.d(eC, {
                getMetadata: function() {
                    return tw
                }
            });
            var eL = {};
            n.r(eL), n.d(eL, {
                getEmailConfiguration: function() {
                    return tT
                },
                updateForCurrentUser: function() {
                    return tx
                },
                updateForCurrentUserWithVerification: function() {
                    return tI
                }
            });
            var eR = {};
            n.r(eR), n.d(eR, {
                submitCaptcha: function() {
                    return tU
                }
            });
            var eU = {};
            n.r(eU), n.d(eU, {
                getDetailsForUniverseIds: function() {
                    return tF
                }
            });
            var ek = {};
            n.r(ek), n.d(ek, {
                getMySettingsInfo: function() {
                    return tB
                }
            });
            var eM = {};
            n.r(eM), n.d(eM, {
                getMetadata: function() {
                    return t2
                },
                resendCode: function() {
                    return t0
                },
                sendCodeForUser: function() {
                    return tZ
                },
                validateCode: function() {
                    return t1
                }
            });
            var eW = {};
            n.r(eW), n.d(eW, {
                changeForCurrentUser: function() {
                    return nt
                },
                resetSendPrompted: function() {
                    return nn
                },
                validate: function() {
                    return nr
                }
            });
            var eF = {};
            n.r(eF), n.d(eF, {
                getPhoneConfiguration: function() {
                    return ng
                },
                getPhonePrefixList: function() {
                    return nS
                },
                prioritizeDefaultPrefix: function() {
                    return nO
                },
                resendCode: function() {
                    return nA
                },
                updatePhone: function() {
                    return nw
                },
                verifyCode: function() {
                    return nE
                }
            });
            var eV = {};
            n.r(eV), n.d(eV, {
                disconnectPlaystation: function() {
                    return nD
                },
                getPlaystationConnection: function() {
                    return nP
                }
            });
            var eK = {};
            n.r(eK), n.d(eK, {
                getAllForCurrentUser: function() {
                    return nF
                },
                updateForCurrentUser: function() {
                    return nV
                }
            });
            var eB = {};
            n.r(eB), n.d(eB, {
                verifyPuzzle: function() {
                    return nY
                }
            });
            var ez = {};
            n.r(ez), n.d(ez, {
                getPuzzle: function() {
                    return nZ
                },
                verifyPuzzle: function() {
                    return n0
                }
            });
            var eH = {};
            n.r(eH), n.d(eH, {
                verifyPuzzle: function() {
                    return n6
                }
            });
            var eY = {};
            n.r(eY), n.d(eY, {
                answerQuestion: function() {
                    return rn
                },
                getQuestion: function() {
                    return rt
                }
            });
            var eG = {};
            n.r(eG), n.d(eG, {
                getSessions: function() {
                    return rm
                },
                logoutFromAllSessionsAndReauthenticate: function() {
                    return rh
                },
                logoutSession: function() {
                    return rb
                }
            });
            var eX = {};
            n.r(eX), n.d(eX, {
                getIconsForUniverseIds: function() {
                    return rw
                }
            });
            var e$ = {};
            n.r(e$), n.d(e$, {
                getMetadata: function() {
                    return rj
                }
            });
            var eQ = {};
            n.r(eQ), n.d(eQ, {
                clearRecoveryCodes: function() {
                    return r6
                },
                deleteSecurityKey: function() {
                    return oi
                },
                disableAuthenticator: function() {
                    return r2
                },
                disableEmailTwoStepVerification: function() {
                    return rJ
                },
                disableSmsTwoStepVerification: function() {
                    return oe
                },
                enableAuthenticator: function() {
                    return rZ
                },
                enableEmailTwoStepVerification: function() {
                    return r$
                },
                enableSecurityKey: function() {
                    return ot
                },
                enableSmsTwoStepVerification: function() {
                    return r8
                },
                enableVerifyAuthenticator: function() {
                    return r0
                },
                enableVerifySecurityKey: function() {
                    return on
                },
                generateRecoveryCodes: function() {
                    return r5
                },
                generateResaleFrictionChallenge: function() {
                    return oy
                },
                generateSpendFrictionChallenge: function() {
                    return od
                },
                generateTradeFrictionChallenge: function() {
                    return op
                },
                getMetadata: function() {
                    return rG
                },
                getPasskeyOptions: function() {
                    return ol
                },
                getRecoveryCodesStatus: function() {
                    return r3
                },
                getResaleFrictionStatus: function() {
                    return of
                },
                getSecurityKeyOptions: function() {
                    return or
                },
                getSpendFrictionStatus: function() {
                    return oc
                },
                getTradeFrictionStatus: function() {
                    return os
                },
                getUserConfiguration: function() {
                    return rX
                },
                listSecurityKey: function() {
                    return oa
                },
                redeemResaleFrictionChallenge: function() {
                    return ob
                },
                redeemSpendFrictionChallenge: function() {
                    return ov
                },
                redeemTradeFrictionChallenge: function() {
                    return om
                },
                retractCrossDevice: function() {
                    return oO
                },
                retryCrossDevice: function() {
                    return oh
                },
                sendEmailCode: function() {
                    return rQ
                },
                sendSmsCode: function() {
                    return r7
                },
                verifyAuthenticatorCode: function() {
                    return r1
                },
                verifyCrossDevice: function() {
                    return og
                },
                verifyEmailCode: function() {
                    return rq
                },
                verifyPasskeyCredential: function() {
                    return ou
                },
                verifyPasswordCode: function() {
                    return oS
                },
                verifyRecoveryCode: function() {
                    return r4
                },
                verifySecurityKeyCredential: function() {
                    return oo
                },
                verifySmsCode: function() {
                    return r9
                }
            });
            var eq = {};
            n.r(eq), n.d(eq, {
                getSettingsUiPolicy: function() {
                    return oA
                }
            });
            var eJ = {};
            n.r(eJ), n.d(eJ, {
                disconnectXbox: function() {
                    return oP
                },
                getXboxConnection: function() {
                    return oT
                }
            });
            var eZ = {};
            n.r(eZ), n.d(eZ, {
                recordMetric: function() {
                    return oL
                }
            });
            var e0 = {};
            n.r(e0), n.d(e0, {
                getPatToken: function() {
                    return oW
                }
            });
            var e1 = {};
            n.r(e1), n.d(e1, {
                continueChallenge: function() {
                    return oz
                }
            });
            var e2 = {};
            n.r(e2), n.d(e2, {
                PasswordDeletionSource: function() {
                    return it
                },
                deletePasskeyBatch: function() {
                    return il
                },
                finishARPreAuthPasskeyRegistration: function() {
                    return ia
                },
                finishPasskeyRegistration: function() {
                    return ii
                },
                invalidateTicketsForEppEnrollment: function() {
                    return is
                },
                listAllCredentials: function() {
                    return iu
                },
                resetPassword: function() {
                    return ic
                },
                startPasskeyRegistration: function() {
                    return ir
                },
                startPreAuthPasskeyRegistration: function() {
                    return io
                }
            });
            var e4 = {};
            n.r(e4), n.d(e4, {
                getNativeResponse: function() {
                    return iy
                },
                getNavigatorCredentials: function() {
                    return iv
                }
            });
            var e3 = {};
            n.r(e3), n.d(e3, {
                continueRecovery: function() {
                    return iL
                },
                disableTwoStepMethod: function() {
                    return iM
                },
                getCurrentTwoStepMethod: function() {
                    return ik
                },
                recoverySessionMetadata: function() {
                    return iR
                },
                requestRecovery: function() {
                    return iT
                },
                resendCode: function() {
                    return iD
                },
                sendCode: function() {
                    return iP
                },
                setEmail: function() {
                    return iU
                },
                verifyBackupCode: function() {
                    return iC
                },
                verifyCode: function() {
                    return i_
                }
            });
            var e6 = {};
            n.r(e6), n.d(e6, {
                getAccountInfo: function() {
                    return iV
                }
            });
            var e5 = {};
            n.r(e5), n.d(e5, {
                changeEppStatus: function() {
                    return iH
                },
                userSettings: function() {
                    return iz
                }
            });
            var e8 = {};
            n.r(e8), n.d(e8, {
                getUserById: function() {
                    return iQ
                },
                getUserByUsername: function() {
                    return iq
                },
                getUsersByIds: function() {
                    return iJ
                }
            }), n(258);
            var e7 = window.ReactJSX,
                e9 = window.React,
                te = n.n(e9),
                tt = window.ReactDOM,
                tn = n.n(tt),
                tr = window.Roblox,
                to = n.n(tr),
                ti = window.CoreUtilities,
                ta = function(e) {
                    return {
                        isError: !1,
                        value: e
                    }
                },
                tl = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: e,
                        errorRaw: t,
                        errorStatusCode: n
                    }
                },
                tu = function(e, t) {
                    return e.isError ? e : ta(t(e.value))
                };

            function tc(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function ts(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            tc(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            tc(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function tf(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function td(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(u) {
                        var c = [l, u];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                            switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tp = function(e) {
                    var t, n = [];
                    if (!e || (void 0 === e ? "undefined" : tf(e)) !== "object") return [];
                    var r = e.errors;
                    return (null != (t = Array) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? t[Symbol.hasInstance](r) : r instanceof t) ? (r.forEach(function(e) {
                        if (e && (void 0 === e ? "undefined" : tf(e)) === "object") {
                            var t = e.code;
                            "number" == typeof t && n.push(t)
                        }
                    }), n) : []
                },
                ty = function(e) {
                    return (void 0 === e ? "undefined" : tf(e)) !== "object" ? null : tp(e.data)[0] || null
                },
                tv = function(e, t) {
                    return null == e ? null : Object.values(e).includes(t) ? t : null
                },
                tm = function(e) {
                    if ((void 0 === e ? "undefined" : tf(e)) !== "object" || null === e) return null;
                    var t = e.status || null;
                    return "number" != typeof t ? null : t
                },
                tb = function(e, t, n) {
                    return ts(function() {
                        var r, o, i, a;
                        return td(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return l.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (r = l.sent(), void 0 !== n) return [2, ta(n(r.data))];
                                    return [2, ta(r.data)];
                                case 2:
                                    return i = ty(o = l.sent()), a = tm(o), [2, tl(tv(t, i), o, a)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                th = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : ty,
                        r = arguments.length > 3 ? arguments[3] : void 0;
                    return ts(function() {
                        var o, i;
                        return td(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return a.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (o = a.sent(), void 0 !== r) return [2, ta(r(o))];
                                    return [2, ta(o)];
                                case 2:
                                    return [2, tl(tv(t, n(i = a.sent())), i, 0)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                tg = null != (eo = tr.EnvironmentUrls.apiGatewayCdnUrl) ? eo : "URL_NOT_FOUND",
                tO = ((r = {})[r.UNKNOWN = 0] = "UNKNOWN", r),
                tS = {
                    url: "".concat("".concat(tg, "/captcha"), "/v1/metadata"),
                    timeout: 6e4
                },
                tw = function() {
                    return tb(ti.httpService.get(tS, {}), tO)
                },
                tE = null != (ei = tr.EnvironmentUrls.accountSettingsApi) ? ei : "URL_NOT_FOUND",
                tA = ((o = {})[o.UNKNOWN = 0] = "UNKNOWN", o[o.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", o[o.TOO_MANY_ACCOUNTS_ON_EMAIL = 3] = "TOO_MANY_ACCOUNTS_ON_EMAIL", o[o.UPDATED_EMAIL_IS_EXISTING_EMAIL = 4] = "UPDATED_EMAIL_IS_EXISTING_EMAIL", o[o.TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL = 6] = "TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL", o[o.INVALID_EMAIL_ADDRESS = 9] = "INVALID_EMAIL_ADDRESS", o),
                tN = {
                    withCredentials: !0,
                    url: "".concat(tE, "/v1/email"),
                    timeout: 1e4
                },
                tj = {
                    withCredentials: !0,
                    url: "".concat(tE, "/v1/email"),
                    timeout: 1e4
                },
                tx = function(e) {
                    return tb(ti.httpService.post(tN, {
                        emailAddress: e,
                        skipVerificationEmail: !0
                    }), tA)
                },
                tI = function(e) {
                    return tb(ti.httpService.post(tN, {
                        emailAddress: e,
                        skipVerificationEmail: !1
                    }), tA)
                },
                tT = function() {
                    return tb(ti.httpService.get(tj), tA)
                },
                tP = window.Roblox["core-scripts"].http.http,
                tD = window.Roblox["core-scripts"].environmentUrls,
                t_ = n.n(tD),
                tC = t_().apiGatewayUrl,
                tL = ((i = {})[i.UNKNOWN = 0] = "UNKNOWN", i[i.INVALID_REQUEST = 1] = "INVALID_REQUEST", i[i.SESSION_NOT_FOUND = 2] = "SESSION_NOT_FOUND", i[i.INTERNAL_ERROR = 3] = "INTERNAL_ERROR", i),
                tR = {
                    withCredentials: !0,
                    url: "".concat(tC, "/v2/captcha"),
                    timeout: 1e4,
                    headers: {
                        Accept: "application/json"
                    }
                },
                tU = function(e) {
                    return tb(tP.post(tR, {
                        challenge_id: e
                    }), tL)
                },
                tk = null != (ea = tr.EnvironmentUrls.gamesApi) ? ea : "URL_NOT_FOUND",
                tM = ((a = {})[a.UNKNOWN = 0] = "UNKNOWN", a),
                tW = {
                    url: "".concat(tk, "/v1/games"),
                    timeout: 1e4
                },
                tF = function(e) {
                    return tb(ti.httpService.get(tW, {
                        universeIds: e
                    }), tM)
                },
                tV = ((l = {})[l.UNKNOWN = 0] = "UNKNOWN", l),
                tK = {
                    withCredentials: !0,
                    url: "/my/settings/json",
                    timeout: 1e4
                },
                tB = function() {
                    return tb(ti.httpService.get(tK, {}), tV)
                },
                tz = null != (el = tr.EnvironmentUrls.apiGatewayUrl) ? el : "URL_NOT_FOUND",
                tH = "".concat(tz, "/otp-service"),
                tY = ((u = {})[u.NO_ERROR = 0] = "NO_ERROR", u[u.UNKNOWN = 1] = "UNKNOWN", u[u.INVALID_CODE = 2] = "INVALID_CODE", u[u.INVALID_SESSION_TOKEN = 3] = "INVALID_SESSION_TOKEN", u[u.CODE_EXPIRED = 4] = "CODE_EXPIRED", u[u.UNVALIDATED_SESSION_TOKEN = 5] = "UNVALIDATED_SESSION_TOKEN", u[u.TOO_MANY_REQUESTS = 6] = "TOO_MANY_REQUESTS", u[u.CONTACT_MALFORMED = 7] = "CONTACT_MALFORMED", u[u.VPN_REQUIRED = 8] = "VPN_REQUIRED", u[u.UNAUTHENTICATED = 9] = "UNAUTHENTICATED", u[u.METHOD_UNAVAILABLE = 10] = "METHOD_UNAVAILABLE", u),
                tG = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v1/sendCodeForUser"),
                    timeout: 1e4
                },
                tX = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v1/resendCode"),
                    timeout: 1e4
                },
                t$ = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v1/validateCode"),
                    timeout: 1e4
                },
                tQ = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v1/metadata"),
                    timeout: 1e4
                },
                tq = ((c = {}).Reauth = "Reauth", c.Challenge = "Challenge", c),
                tJ = ((s = {}).Default = "Default", s),
                tZ = function(e) {
                    return tb(ti.httpService.post(tG, {
                        contactType: e,
                        origin: tq.Reauth,
                        messageVariant: tJ.Default
                    }), tY)
                },
                t0 = function(e, t) {
                    return tb(ti.httpService.post(tX, {
                        contactType: e,
                        origin: tq.Reauth,
                        otpSessionToken: t
                    }), tY)
                },
                t1 = function(e, t, n) {
                    return tb(ti.httpService.post(t$, {
                        contactType: e,
                        origin: tq.Reauth,
                        passCode: n,
                        otpSessionToken: t
                    }), tY)
                },
                t2 = function(e) {
                    return tb(ti.httpService.get(tQ, {
                        Origin: e
                    }), tY)
                },
                t4 = null != (eu = tr.EnvironmentUrls.authApi) ? eu : "URL_NOT_FOUND",
                t3 = ((f = {})[f.FLOODED = 2] = "FLOODED", f[f.INVALID_PASSWORD = 7] = "INVALID_PASSWORD", f[f.INVALID_CURRENT_PASSWORD = 8] = "INVALID_CURRENT_PASSWORD", f),
                t6 = {
                    withCredentials: !0,
                    url: "".concat(t4, "/v2/user/passwords/change"),
                    timeout: 1e4
                },
                t5 = ((d = {})[d.USER_DOES_NOT_HAVE_EMAIL = 22] = "USER_DOES_NOT_HAVE_EMAIL", d),
                t8 = {
                    withCredentials: !0,
                    url: "".concat(t4, "/v2/passwords/reset/send-prompted"),
                    timeout: 1e4
                },
                t7 = ((p = {})[p.VALID_PASSWORD = 0] = "VALID_PASSWORD", p[p.WEAK_PASSWORD = 1] = "WEAK_PASSWORD", p[p.SHORT_PASSWORD = 2] = "SHORT_PASSWORD", p[p.PASSWORD_SAME_AS_USERNAME = 3] = "PASSWORD_SAME_AS_USERNAME", p[p.FORBIDDEN_PASSWORD = 4] = "FORBIDDEN_PASSWORD", p[p.DUMB_STRINGS = 5] = "DUMB_STRINGS", p),
                t9 = {
                    withCredentials: !0,
                    url: "".concat(t4, "/v2/passwords/validate"),
                    timeout: 1e4
                };

            function ne(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var nt = function(e, t) {
                    return tb(ti.httpService.post(t6, {
                        currentPassword: e,
                        newPassword: t
                    }), t3)
                },
                nn = function() {
                    return tb(ti.httpService.post(t8), t5)
                },
                nr = function(e, t) {
                    var n;
                    return (n = function() {
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, tb(ti.httpService.post(t9, {
                                username: e,
                                password: t
                            }), null).then(function(e) {
                                return tu(e, function(e) {
                                    return tv(t7, e.code)
                                })
                            })]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                ne(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                ne(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                no = "URL_NOT_FOUND",
                ni = null != (ec = tr.EnvironmentUrls.accountInformationApi) ? ec : no,
                na = null != (es = tr.EnvironmentUrls.apiGatewayUrl) ? es : no,
                nl = ((y = {})[y.UNKNOWN = 0] = "UNKNOWN", y),
                nu = {
                    withCredentials: !0,
                    url: "".concat(ni, "/v1/phone"),
                    timeout: 1e4
                },
                nc = {
                    withCredentials: !0,
                    url: "".concat(ni, "/v1/phone"),
                    timeout: 1e4
                },
                ns = {
                    withCredentials: !0,
                    url: "".concat(ni, "/v1/phone/verify"),
                    timeout: 1e4
                },
                nf = {
                    withCredentials: !0,
                    url: "".concat(ni, "/v1/phone/resend"),
                    timeout: 1e4
                },
                nd = ((v = {})[v.UNKNOWN = 0] = "UNKNOWN", v[v.INVALID = 2] = "INVALID", v),
                np = ((m = {})[m.UNKNOWN = 0] = "UNKNOWN", m[m.INVALID = 7] = "INVALID", m),
                ny = ((b = {})[b.UNKNOWN = 0] = "UNKNOWN", b),
                nv = {
                    withCredentials: !0,
                    url: "".concat(na, "/phone-number-api/v1/phone-prefix-list"),
                    timeout: 1e4
                };

            function nm(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function nb(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            nm(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            nm(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nh(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(u) {
                        var c = [l, u];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                            switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ng = function() {
                    return nb(function() {
                        return nh(this, function(e) {
                            return [2, tb(ti.httpService.get(nu, {}), nl)]
                        })
                    })()
                },
                nO = function(e) {
                    var t = e.find(function(e) {
                            return e.isDefault
                        }),
                        n = e;
                    return void 0 !== t && (n = e.filter(function(e) {
                        return e.code !== t.code
                    })).unshift(t), n
                },
                nS = function() {
                    return nb(function() {
                        return nh(this, function(e) {
                            return [2, tb(ti.httpService.get(nv, {}), nl, nO)]
                        })
                    })()
                },
                nw = function(e) {
                    return nb(function() {
                        return nh(this, function(t) {
                            return [2, tb(ti.httpService.post(nc, e), nd)]
                        })
                    })()
                },
                nE = function(e) {
                    return nb(function() {
                        return nh(this, function(t) {
                            return [2, tb(ti.httpService.post(ns, e), np)]
                        })
                    })()
                },
                nA = function(e) {
                    return nb(function() {
                        return nh(this, function(t) {
                            return [2, tb(ti.httpService.post(nf, e), ny)]
                        })
                    })()
                },
                nN = null != (ef = tr.EnvironmentUrls.authApi) ? ef : "URL_NOT_FOUND",
                nj = "palisades-live",
                nx = ((h = {})[h.UNKNOWN = 0] = "UNKNOWN", h),
                nI = {
                    withCredentials: !0,
                    url: "".concat(nN, "/v1/").concat(nj, "/is-live"),
                    timeout: 1e4
                },
                nT = {
                    withCredentials: !0,
                    url: "".concat(nN, "/v1/").concat(nj, "/disconnect"),
                    timeout: 1e4
                },
                nP = function() {
                    return tb(ti.httpService.get(nI, {}), nx)
                },
                nD = function() {
                    return tb(ti.httpService.post(nT, {}), nx)
                },
                n_ = null != (ed = tr.EnvironmentUrls.apiGatewayUrl) ? ed : "URL_NOT_FOUND",
                nC = "".concat(n_, "/account-security-service"),
                nL = ((g = {})[g.UNKNOWN = 1] = "UNKNOWN", g[g.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", g[g.PROMPT_ASSIGNMENT_WAS_NOT_UPDATED = 3] = "PROMPT_ASSIGNMENT_WAS_NOT_UPDATED", g[g.UNKNOWN_PROMPT_TYPE = 4] = "UNKNOWN_PROMPT_TYPE", g),
                nR = ((O = {}).TEXT_ONLY_BANNER = "DISPLAY_TYPE_TEXT_ONLY_BANNER", O),
                nU = ((S = {}).CHANGE_PASSWORD__SUSPECTED_COMPROMISE = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", S.CHANGE_PASSWORD__BREACHED_CREDENTIAL = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", S.AUTHENTICATOR_UPSELL = "PROMPT_TYPE_AUTHENTICATOR_UPSELL", S.ACCOUNT_RESTORES_POLICY_UPDATE = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", S.ACCOUNT_RESTORES_POLICY_UPDATE_V2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", S.ACCOUNT_RESTORES_POLICY_UPDATE_V3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", S.ACCOUNT_RESTORES_POLICY_UPSELL = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL", S.BROADER_AUTHENTICATOR_UPSELL = "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL", S.EMAIL_2SV_UPSELL = "PROMPT_TYPE_EMAIL_2SV_UPSELL", S),
                nk = {
                    withCredentials: !0,
                    url: "".concat(nC, "/v1/prompt-assignments"),
                    timeout: 1e4
                },
                nM = {
                    withCredentials: !0,
                    url: "".concat(nC, "/v1/prompt-assignments"),
                    timeout: 1e4
                };

            function nW(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var nF = function() {
                    var e;
                    return (e = function() {
                        var e;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, tb(ti.httpService.get(nk, {
                                        shouldReturnMetadata: !0
                                    }), nL)];
                                case 1:
                                    var n, r;
                                    if ((e = t.sent()).isError) return [2, e];
                                    return n = function(e) {
                                        for (var t = 1; t < arguments.length; t++) {
                                            var n = null != arguments[t] ? arguments[t] : {},
                                                r = Object.keys(n);
                                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                                            }))), r.forEach(function(t) {
                                                var r;
                                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                                    value: r,
                                                    enumerable: !0,
                                                    configurable: !0,
                                                    writable: !0
                                                }) : e[t] = r
                                            })
                                        }
                                        return e
                                    }({}, e), r = r = {
                                        value: e.value.filter(function(e) {
                                            return e.isGeneric ? Object.values(nR).includes(e.metadata.displayType) : Object.values(nU).includes(e.promptType)
                                        })
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                                        var n = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var r = Object.getOwnPropertySymbols(e);
                                            n.push.apply(n, r)
                                        }
                                        return n
                                    })(Object(r)).forEach(function(e) {
                                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                                    }), [2, e = n]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = e.apply(t, n);

                            function a(e) {
                                nW(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                nW(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                nV = function(e, t) {
                    return tb(ti.httpService.post(nM, {
                        action: e,
                        promptType: t
                    }), nL)
                },
                nK = null != (ep = tr.EnvironmentUrls.apiGatewayUrl) ? ep : "URL_NOT_FOUND",
                nB = ((w = {})[w.UNKNOWN = 0] = "UNKNOWN", w[w.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", w[w.INVALID_REQUEST = 2] = "INVALID_REQUEST", w[w.INVALID_SESSION = 3] = "INVALID_SESSION", w),
                nz = {
                    withCredentials: !0,
                    url: "".concat("".concat(nK, "/proof-of-space"), "/v1/verify"),
                    timeout: 1e4
                };

            function nH(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var nY = function(e, t) {
                    var n;
                    return (n = function() {
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, tb(ti.httpService.post(nz, {
                                challengeId: e,
                                solution: t
                            }), nB)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                nH(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                nH(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                nG = null != (ey = tr.EnvironmentUrls.apiGatewayUrl) ? ey : "URL_NOT_FOUND",
                nX = "".concat(nG, "/proof-of-work-service"),
                n$ = ((E = {})[E.UNKNOWN = 0] = "UNKNOWN", E[E.REQUEST_INVALID = 1] = "REQUEST_INVALID", E[E.SESSION_INACTIVE = 2] = "SESSION_INACTIVE", E),
                nQ = {
                    withCredentials: !0,
                    url: "".concat(nX, "/v1/pow-puzzle"),
                    timeout: 1e4
                },
                nq = {
                    withCredentials: !0,
                    url: "".concat(nX, "/v1/pow-puzzle"),
                    timeout: 1e4
                };

            function nJ(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var nZ = function(e) {
                    return tb(ti.httpService.get(nQ, {
                        sessionID: e
                    }), n$)
                },
                n0 = function(e, t) {
                    var n;
                    return (n = function() {
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, tb(ti.httpService.post(nq, {
                                sessionID: e,
                                solution: t
                            }), n$)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                nJ(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                nJ(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                n1 = null != (ev = tr.EnvironmentUrls.apiGatewayUrl) ? ev : "URL_NOT_FOUND",
                n2 = ((A = {})[A.UNKNOWN = 0] = "UNKNOWN", A[A.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", A[A.INVALID_REQUEST = 2] = "INVALID_REQUEST", A[A.INVALID_SESSION = 3] = "INVALID_SESSION", A),
                n4 = {
                    withCredentials: !0,
                    url: "".concat("".concat(n1, "/rostile"), "/v1/verify"),
                    timeout: 1e4
                };

            function n3(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var n6 = function(e, t) {
                    var n;
                    return (n = function() {
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, tb(ti.httpService.post(n4, {
                                challengeId: e,
                                solution: t
                            }), n2)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                n3(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                n3(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                n5 = null != (em = tr.EnvironmentUrls.apiGatewayUrl) ? em : "URL_NOT_FOUND",
                n8 = "".concat(n5, "/account-security-service"),
                n7 = ((N = {})[N.UNKNOWN = 1] = "UNKNOWN", N[N.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", N[N.SECURITY_QUESTIONS_DISABLED = 3] = "SECURITY_QUESTIONS_DISABLED", N[N.SESSION_INACTIVE = 4] = "SESSION_INACTIVE", N[N.QUESTION_NOT_FOUND = 5] = "QUESTION_NOT_FOUND", N[N.ANSWER_WRONG_FORMAT = 6] = "ANSWER_WRONG_FORMAT", N),
                n9 = {
                    withCredentials: !0,
                    url: "".concat(n8, "/v1/security-question"),
                    timeout: 1e4
                },
                re = {
                    withCredentials: !0,
                    url: "".concat(n8, "/v1/security-question"),
                    timeout: 1e4
                },
                rt = function(e, t) {
                    return tb(ti.httpService.get(n9, {
                        userId: e,
                        sessionId: t
                    }), n7)
                },
                rn = function(e, t, n) {
                    return tb(ti.httpService.post(re, {
                        userId: e,
                        answer: t,
                        sessionId: n
                    }), n7)
                },
                rr = "URL_NOT_FOUND",
                ro = null != (eb = tr.EnvironmentUrls.apiGatewayUrl) ? eb : rr,
                ri = null != (eh = tr.EnvironmentUrls.authApi) ? eh : rr,
                ra = "".concat(ro, "/token-metadata-service"),
                rl = ((j = {})[j.UNKNOWN = 1] = "UNKNOWN", j[j.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", j[j.ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN = 3] = "ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN", j),
                ru = ((x = {})[x.UNKNOWN = 1] = "UNKNOWN", x),
                rc = ((I = {}).UNKNOWN = "Unknown", I.APP = "App", I.BROWSER = "Browser", I.STUDIO = "Studio", I),
                rs = {
                    withCredentials: !0,
                    url: "".concat(ra, "/v1/sessions"),
                    timeout: 1e4
                },
                rf = {
                    withCredentials: !0,
                    url: "".concat(ra, "/v1/logout"),
                    timeout: 1e4
                },
                rd = {
                    withCredentials: !0,
                    url: "".concat(ri, "/v1/logoutfromallsessionsandreauthenticate"),
                    timeout: 1e4
                };

            function rp(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function ry(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            rp(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            rp(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rv(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(u) {
                        var c = [l, u];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                            switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rm = function(e, t) {
                    return ry(function() {
                        return rv(this, function(n) {
                            return [2, tb(ti.httpService.get(rs, {
                                nextCursor: e,
                                desiredLimit: t
                            }), rl)]
                        })
                    })()
                },
                rb = function(e) {
                    return ry(function() {
                        return rv(this, function(t) {
                            return [2, tb(ti.httpService.post(rf, {
                                token: e
                            }), rl)]
                        })
                    })()
                },
                rh = function(e) {
                    return ry(function() {
                        return rv(this, function(t) {
                            return [2, tb(ti.httpService.post(rd, {
                                secureAuthenticationIntent: e
                            }), ru)]
                        })
                    })()
                },
                rg = null != (eg = tr.EnvironmentUrls.thumbnailsApi) ? eg : "URL_NOT_FOUND",
                rO = ((T = {})[T.UNKNOWN = 0] = "UNKNOWN", T),
                rS = {
                    url: "".concat(rg, "/v1/games/icons"),
                    timeout: 1e4
                },
                rw = function(e, t, n, r) {
                    return tb(ti.httpService.get(rS, {
                        universeIds: e,
                        size: t,
                        format: n,
                        isCircular: r
                    }), rO)
                },
                rE = t_().apiGatewayUrl,
                rA = ((P = {})[P.UNKNOWN = 0] = "UNKNOWN", P),
                rN = {
                    url: "".concat(rE, "/turnstile-service/v1/metadata"),
                    timeout: 1e4
                },
                rj = function(e) {
                    return tb(tP.get(rN, {
                        challenge_id: e
                    }), rA)
                },
                rx = window.CoreRobloxUtilities,
                rI = "URL_NOT_FOUND",
                rT = null != (eO = tr.EnvironmentUrls.twoStepVerificationApi) ? eO : rI,
                rP = null != (eS = tr.EnvironmentUrls.economyApi) ? eS : rI,
                rD = null != (ew = tr.EnvironmentUrls.tradesApi) ? ew : rI,
                r_ = ((D = {})[D.UNKNOWN = 0] = "UNKNOWN", D[D.INVALID_CHALLENGE_ID = 1] = "INVALID_CHALLENGE_ID", D[D.INVALID_USER_ID = 2] = "INVALID_USER_ID", D[D.INVALID_EMAIL = 3] = "INVALID_EMAIL", D[D.INVALID_PASSWORD = 4] = "INVALID_PASSWORD", D[D.TOO_MANY_REQUESTS = 5] = "TOO_MANY_REQUESTS", D[D.PIN_LOCKED = 6] = "PIN_LOCKED", D[D.FEATURE_DISABLED = 7] = "FEATURE_DISABLED", D[D.NOT_ALLOWED = 8] = "NOT_ALLOWED", D[D.INVALID_CONFIGURATION = 9] = "INVALID_CONFIGURATION", D[D.INVALID_CODE = 10] = "INVALID_CODE", D[D.CONFIGURATION_ALREADY_ENABLED = 11] = "CONFIGURATION_ALREADY_ENABLED", D[D.INVALID_SETUP_TOKEN = 12] = "INVALID_SETUP_TOKEN", D[D.REAUTHENTICATION_REQUIRED = 13] = "REAUTHENTICATION_REQUIRED", D[D.INVALID_PHONE_NUMBER = 15] = "INVALID_PHONE_NUMBER", D[D.EXCEEDED_REGISTERED_KEYS_LIMIT = 16] = "EXCEEDED_REGISTERED_KEYS_LIMIT", D[D.INVALID_CREDENTIAL_NICKNAME = 17] = "INVALID_CREDENTIAL_NICKNAME", D[D.AUTHENTICATOR_CODE_ALREADY_USED = 18] = "AUTHENTICATOR_CODE_ALREADY_USED", D[D.CHALLENGE_DENIED = 19] = "CHALLENGE_DENIED", D[D.CROSS_DEVICE_DIALOG_EXPIRED = 20] = "CROSS_DEVICE_DIALOG_EXPIRED", D),
                rC = {
                    url: "".concat(rT, "/v1/metadata"),
                    withCredentials: !0,
                    timeout: 1e4
                },
                rL = {
                    withCredentials: !0,
                    url: "".concat(rP, "/v2/spend-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                rR = {
                    withCredentials: !0,
                    url: "".concat(rD, "/v1/trade-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                rU = {
                    withCredentials: !0,
                    url: "".concat(rP, "/v2/resale-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                rk = {
                    withCredentials: !0,
                    url: "".concat(rP, "/v2/spend-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                rM = {
                    withCredentials: !0,
                    url: "".concat(rD, "/v1/trade-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                rW = {
                    withCredentials: !0,
                    url: "".concat(rP, "/v2/resale-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                rF = {
                    withCredentials: !0,
                    url: "".concat(rP, "/v2/spend-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                rV = {
                    withCredentials: !0,
                    url: "".concat(rD, "/v1/trade-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                rK = {
                    withCredentials: !0,
                    url: "".concat(rP, "/v2/resale-friction/two-step-verification/redeem"),
                    timeout: 1e4
                };

            function rB(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function rz(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            rB(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            rB(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rH(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(u) {
                        var c = [l, u];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                            switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rY = rx.cryptoUtil.generateSecureAuthIntentV2,
                rG = function(e) {
                    return tb(ti.httpService.get(rC, e || {}), r_)
                },
                rX = function(e, t) {
                    return tb(ti.httpService.get({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration"),
                        timeout: 1e4
                    }, t || {}), r_)
                },
                r$ = function(e) {
                    return rz(function() {
                        var t, n, r;
                        return rH(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = ti.httpService.post, n = [{
                                        withCredentials: !0,
                                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/email/enable"),
                                        timeout: 1e4
                                    }], r = {}, [4, rY()];
                                case 1:
                                    return [2, tb.apply(void 0, [t.apply(ti.httpService, n.concat([(r.secureAuthenticationIntent = o.sent(), r)])), r_])]
                            }
                        })
                    })()
                },
                rQ = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/email/send-code"),
                        timeout: 1e4
                    }, t), r_)
                },
                rq = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/email/verify"),
                        timeout: 1e4
                    }, t), r_)
                },
                rJ = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/email/disable"),
                        timeout: 1e4
                    }, {}), r_)
                },
                rZ = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/authenticator/enable"),
                        timeout: 1e4
                    }, {}), r_)
                },
                r0 = function(e, t, n) {
                    return rz(function() {
                        var r, o, i;
                        return rH(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return r = ti.httpService.post, o = [{
                                        withCredentials: !0,
                                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/authenticator/enable-verify"),
                                        timeout: 1e4
                                    }], i = {
                                        setupToken: t,
                                        code: n
                                    }, [4, rY()];
                                case 1:
                                    return [2, tb.apply(void 0, [r.apply(ti.httpService, o.concat([(i.secureAuthenticationIntent = a.sent(), i)])), r_])]
                            }
                        })
                    })()
                },
                r1 = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/authenticator/verify"),
                        timeout: 1e4
                    }, t), r_)
                },
                r2 = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/authenticator/disable"),
                        timeout: 1e4
                    }, {}), r_)
                },
                r4 = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/recovery-codes/verify"),
                        timeout: 1e4
                    }, t), r_)
                },
                r3 = function(e) {
                    return tb(ti.httpService.get({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/recovery-codes"),
                        timeout: 1e4
                    }), r_)
                },
                r6 = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/recovery-codes/clear"),
                        timeout: 1e4
                    }, {}), r_)
                },
                r5 = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/recovery-codes/regenerate"),
                        timeout: 1e4
                    }, {
                        password: "password"
                    }), r_)
                },
                r8 = function(e) {
                    return rz(function() {
                        var t, n, r;
                        return rH(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = ti.httpService.post, n = [{
                                        withCredentials: !0,
                                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/sms/enable"),
                                        timeout: 1e4
                                    }], r = {}, [4, rY()];
                                case 1:
                                    return [2, tb.apply(void 0, [t.apply(ti.httpService, n.concat([(r.secureAuthenticationIntent = o.sent(), r)])), r_])]
                            }
                        })
                    })()
                },
                r7 = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/sms/send-code"),
                        timeout: 1e4
                    }, t), r_)
                },
                r9 = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/sms/verify"),
                        timeout: 1e4
                    }, t), r_)
                },
                oe = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/sms/disable"),
                        timeout: 1e4
                    }, {}), r_)
                },
                ot = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/security-key/enable"),
                        timeout: 1e4
                    }, {}), r_, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                on = function(e, t, n, r) {
                    return rz(function() {
                        var o, i, a;
                        return rH(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return o = ti.httpService.post, i = [{
                                        withCredentials: !0,
                                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/security-key/enable-verify"),
                                        timeout: 1e4
                                    }], a = {
                                        sessionId: t,
                                        credentialNickname: n,
                                        attestationResponse: r
                                    }, [4, rY()];
                                case 1:
                                    return [2, tb.apply(void 0, [o.apply(ti.httpService, i.concat([(a.secureAuthenticationIntent = l.sent(), a)])), r_])]
                            }
                        })
                    })()
                },
                or = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/security-key/verify-start"),
                        timeout: 1e4
                    }, t), r_)
                },
                oo = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/security-key/verify-finish"),
                        timeout: 1e4
                    }, t), r_)
                },
                oi = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/security-key/disable"),
                        timeout: 1e4
                    }, {
                        credentialNicknames: t
                    }), r_)
                },
                oa = function(e) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/configuration/security-key/list"),
                        timeout: 1e4
                    }, {}), r_)
                },
                ol = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/passkey/verify-start"),
                        timeout: 1e4
                    }, t), r_)
                },
                ou = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/passkey/verify-finish"),
                        timeout: 1e4
                    }, t), r_)
                },
                oc = function() {
                    return tb(ti.httpService.get(rL, {}), r_)
                },
                os = function() {
                    return tb(ti.httpService.get(rR, {}), r_)
                },
                of = function() {
                    return tb(ti.httpService.get(rU, {}), r_)
                },
                od = function() {
                    return tb(ti.httpService.post(rk, {}), r_)
                },
                op = function() {
                    return tb(ti.httpService.post(rM, {}), r_)
                },
                oy = function() {
                    return tb(ti.httpService.post(rW, {}), r_)
                },
                ov = function(e, t) {
                    return tb(ti.httpService.post(rF, {
                        challengeToken: e,
                        verificationToken: t
                    }), r_)
                },
                om = function(e, t) {
                    return tb(ti.httpService.post(rV, {
                        challengeToken: e,
                        verificationToken: t
                    }), r_)
                },
                ob = function(e, t) {
                    return tb(ti.httpService.post(rK, {
                        challengeToken: e,
                        verificationToken: t
                    }), r_)
                },
                oh = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/cross-device/retry"),
                        timeout: 1e4
                    }, t), r_)
                },
                og = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/cross-device/verify"),
                        timeout: 1e4
                    }, t), r_)
                },
                oO = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/cross-device/retract"),
                        timeout: 1e4
                    }, t), r_)
                },
                oS = function(e, t) {
                    return tb(ti.httpService.post({
                        withCredentials: !0,
                        url: "".concat(rT, "/v1/users/").concat(e, "/challenges/password/verify"),
                        timeout: 1e4
                    }, t), r_)
                },
                ow = ((_ = {})[_.INTERNAL_ERROR = 9] = "INTERNAL_ERROR", _);

            function oE(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var oA = function() {
                    var e;
                    return (e = function() {
                        var e;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return t.trys.push([0, 2, , 3]), [4, tr.Guac.callBehaviour("account-settings-ui")];
                                case 1:
                                    return [2, {
                                        isError: !1,
                                        value: t.sent()
                                    }];
                                case 2:
                                    return e = t.sent(), [2, {
                                        isError: !0,
                                        error: ow.INTERNAL_ERROR,
                                        errorRaw: e,
                                        errorStatusCode: null
                                    }];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = e.apply(t, n);

                            function a(e) {
                                oE(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                oE(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                oN = null != (eE = tr.EnvironmentUrls.authApi) ? eE : "URL_NOT_FOUND",
                oj = ((C = {})[C.UNKNOWN = 0] = "UNKNOWN", C),
                ox = {
                    withCredentials: !0,
                    url: "".concat(oN, "/v1/xbox/connection"),
                    timeout: 1e4
                },
                oI = {
                    withCredentials: !0,
                    url: "".concat(oN, "/v1/xbox/disconnect"),
                    timeout: 1e4
                },
                oT = function() {
                    return tb(ti.httpService.get(ox, {}), oj)
                },
                oP = function() {
                    return tb(ti.httpService.post(oI, {}), oj)
                },
                oD = null != (eA = tr.EnvironmentUrls.apiGatewayUrl) ? eA : "URL_NOT_FOUND",
                o_ = ((L = {})[L.UNKNOWN = 1] = "UNKNOWN", L[L.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", L[L.INVAID_METRIC_NAME = 3] = "INVAID_METRIC_NAME", L[L.INVALID_METRIC_LABELS = 4] = "INVALID_METRIC_LABELS", L),
                oC = {
                    withCredentials: !0,
                    url: "".concat("".concat(oD, "/account-security-service"), "/v1/metrics/record"),
                    timeout: 1e4
                },
                oL = function(e) {
                    return tb(ti.httpService.post(oC, e), o_)
                },
                oR = null != (eN = tr.EnvironmentUrls.apiGatewayUrl) ? eN : "URL_NOT_FOUND",
                oU = ((R = {})[R.UNKNOWN = 0] = "UNKNOWN", R),
                ok = {
                    withCredentials: !0,
                    url: "".concat("".concat(oR, "/private-access-token"), "/v1/getPATToken"),
                    timeout: 1e4
                };

            function oM(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var oW = function(e) {
                    var t;
                    return (t = function() {
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            return [2, tb(ti.httpService.post(ok, {
                                challengeId: e
                            }), oU)]
                        })
                    }, function() {
                        var e = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = t.apply(e, n);

                            function a(e) {
                                oM(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                oM(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                oF = null != (ej = tr.EnvironmentUrls.apiGatewayUrl) ? ej : "URL_NOT_FOUND",
                oV = ((U = {})[U.UNKNOWN = 1] = "UNKNOWN", U),
                oK = {
                    withCredentials: !0,
                    url: "".concat("".concat(oF, "/challenge"), "/v1/continue"),
                    timeout: 1e4
                };

            function oB(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var oz = function(e, t, n) {
                    var r;
                    return (r = function() {
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, tb(ti.httpService.post(oK, {
                                challengeId: e,
                                challengeType: t,
                                challengeMetadata: n
                            }), oV)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                oB(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                oB(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                oH = null != (ex = tr.EnvironmentUrls.authApi) ? ex : "URL_NOT_FOUND",
                oY = ((k = {})[k.UNKNOWN = 0] = "UNKNOWN", k[k.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", k[k.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", k[k.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", k),
                oG = ((M = {})[M.UNKNOWN = 0] = "UNKNOWN", M[M.FEATURE_DISABLED = 1] = "FEATURE_DISABLED", M[M.FLOODED = 2] = "FLOODED", M[M.INVALID_PASSWORD = 20] = "INVALID_PASSWORD", M[M.PASSWORDS_DO_NOT_MATCH = 21] = "PASSWORDS_DO_NOT_MATCH", M[M.TWO_STEP_VERIFICATION_REQUIRED = 24] = "TWO_STEP_VERIFICATION_REQUIRED", M),
                oX = {
                    withCredentials: !0,
                    url: "".concat(oH, "/v1/passkey/ListCredentials"),
                    timeout: 1e4
                },
                o$ = {
                    withCredentials: !0,
                    url: "".concat(oH, "/v2/passwords/reset"),
                    timeout: 1e4
                },
                oQ = {
                    withCredentials: !0,
                    url: "".concat(oH, "/v1/revert/invalidate-tickets"),
                    timeout: 1e4
                },
                oq = function(e) {
                    return {
                        isError: !1,
                        value: e
                    }
                },
                oJ = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: e,
                        errorRaw: t,
                        errorStatusCode: n
                    }
                };

            function oZ(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function o0(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var o1 = function(e) {
                    var t;
                    return (void 0 === e ? "undefined" : o0(e)) === "object" && null !== e && "data" in e && null != (t = (0, tP.getApiErrorCodes)(e.data)[0]) ? t : null
                },
                o2 = function(e) {
                    if ((void 0 === e ? "undefined" : o0(e)) !== "object" || null === e || !("status" in e)) return null;
                    var t, n = null != (t = e.status) ? t : null;
                    return "number" != typeof n ? null : n
                },
                o4 = function(e, t, n) {
                    var r;
                    return (r = function() {
                        var r, o, i, a;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return l.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (r = l.sent(), void 0 !== n) return [2, oq(n(r.data))];
                                    return [2, oq(r.data)];
                                case 2:
                                    return i = o1(o = l.sent()), a = o2(o), [2, oJ(null == t ? null : Object.values(t).includes(i) ? i : null, o, a)];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                oZ(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                oZ(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                o3 = t_().authApi,
                o6 = ((W = {})[W.UNKNOWN = 0] = "UNKNOWN", W[W.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", W[W.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", W[W.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", W),
                o5 = {
                    withCredentials: !0,
                    url: "".concat(o3, "/v1/passkey/StartRegistration"),
                    timeout: 1e4
                },
                o8 = {
                    withCredentials: !0,
                    url: "".concat(o3, "/v1/passkey/start-preauth-registration"),
                    timeout: 1e4
                },
                o7 = {
                    withCredentials: !0,
                    url: "".concat(o3, "/v1/passkey/FinishRegistration"),
                    timeout: 1e4
                },
                o9 = {
                    withCredentials: !0,
                    url: "".concat(o3, "/v1/passkey/finish-ar-preauth-registration"),
                    timeout: 1e4
                },
                ie = {
                    withCredentials: !0,
                    url: "".concat(o3, "/v1/passkey/DeleteCredentialBatch"),
                    timeout: 1e4
                },
                it = {
                    AccountRecoveryPasskeyOnly: "accountRecoveryPasskeyOnly",
                    AccountRecoveryPasswordAndPasskey: "accountRecoveryPasswordAndPasskey"
                },
                ir = function() {
                    return o4((0, tP.post)(o5, {}), o6, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                io = function(e) {
                    return o4((0, tP.post)(o8, {
                        username: e
                    }), o6, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                ii = function(e, t, n, r) {
                    return o4((0, tP.post)(o7, function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        sessionId: e,
                        credentialNickname: t,
                        attestationResponse: n
                    }, r ? {
                        source: r
                    } : {})), o6)
                },
                ia = function(e, t, n, r, o, i) {
                    return o4((0, tP.post)(o9, {
                        recoverySession: e,
                        passkeySessionId: n,
                        passkeyRegistrationResponse: r,
                        userId: t,
                        isPostRecovery: o,
                        source: i
                    }), o6)
                },
                il = function(e, t) {
                    return o4((0, tP.post)(ie, {
                        credentialNicknames: e,
                        passkeyCount: t
                    }), o6)
                },
                iu = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                        all: !0
                    };
                    return tb(ti.httpService.post(oX, e), oY)
                },
                ic = function(e, t, n, r, o, i, a, l, u, c, s, f) {
                    return tb(ti.httpService.post(o$, {
                        targetType: e,
                        ticket: t,
                        userId: n,
                        password: r,
                        passwordRepeated: o,
                        twoStepVerificationChallengeId: i,
                        twoStepVerificationToken: a,
                        accountBlob: l,
                        secureAuthenticationIntent: u,
                        passkeySessionId: c,
                        passkeyRegistrationResponse: s,
                        newEmail: f
                    }), oG)
                },
                is = function() {
                    return tb(ti.httpService.post(oQ, {}), oY)
                },
                id = ((F = {})[F.UNKNOWN = 0] = "UNKNOWN", F[F.CANCELLATION_ERROR = 1] = "CANCELLATION_ERROR", F[F.INTERRUPTED_ERROR = 2] = "INTERRUPTED_ERROR", F[F.INVALID_REQUEST = 3] = "INVALID_REQUEST", F[F.JSON_EXCEPTION = 4] = "JSON_EXCEPTION", F[F.CREDENTIALS_PROTOCOL_NOT_SUPPORTED = 5] = "CREDENTIALS_PROTOCOL_NOT_SUPPORTED", F[F.NO_CREDENTIALS_FOUND = 6] = "NO_CREDENTIALS_FOUND", F[F.INVALID_STATE_ERROR = 11] = "INVALID_STATE_ERROR", F),
                ip = function(e) {
                    return e.code
                },
                iy = function(e, t, n) {
                    return th(rx.hybridResponseService.getNativeResponse(e, t, n), id, ip, function(e) {
                        if (null === e) return null;
                        var t = JSON.parse(e);
                        if (void 0 !== t.errorCode) throw {
                            name: "getNativeResponse Error",
                            message: t.errorMsg,
                            code: t.errorCode
                        };
                        return tr.DeviceMeta && (0, tr.DeviceMeta)().isInApp && (0, tr.DeviceMeta)().isAndroidApp ? e : rx.fido2Util.formatCredentialAuthenticationResponseApp(e)
                    })
                },
                iv = function(e) {
                    return th(navigator.credentials.get(e), id).then(function(e) {
                        return tu(e, function(e) {
                            return null === e ? null : rx.fido2Util.formatCredentialAuthenticationResponseWeb(e)
                        })
                    })
                },
                im = null != (eI = tr.EnvironmentUrls.apiGatewayUrl) ? eI : "URL_NOT_FOUND",
                ib = "".concat(im, "/account-recovery-service"),
                ih = ((V = {})[V.UNKNOWN = 1] = "UNKNOWN", V[V.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", V[V.IDENTIFIER_INVALID = 3] = "IDENTIFIER_INVALID", V[V.TOO_MANY_REQUESTS = 4] = "TOO_MANY_REQUESTS", V[V.ACCOUNT_NOT_VERIFIED = 5] = "ACCOUNT_NOT_VERIFIED", V[V.INVALID_CODE = 6] = "INVALID_CODE", V[V.INVALID_USER = 7] = "INVALID_USER", V[V.TWO_STEP_VERIFICATION_REQUIRED = 8] = "TWO_STEP_VERIFICATION_REQUIRED", V[V.TRY_A_DIFFERENT_CONTACT_METHOD = 9] = "TRY_A_DIFFERENT_CONTACT_METHOD", V),
                ig = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/request-recovery"),
                    timeout: 1e4
                },
                iO = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/send-code"),
                    timeout: 1e4
                },
                iS = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/resend-code"),
                    timeout: 1e4
                },
                iw = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/verify-code"),
                    timeout: 1e4
                },
                iE = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/verify-backup-code"),
                    timeout: 1e4
                },
                iA = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/continue-recovery"),
                    timeout: 1e4
                },
                iN = {
                    url: "".concat(ib, "/v1/recovery-session-metadata"),
                    timeout: 1e4
                },
                ij = {
                    url: "".concat(ib, "/v1/set-email"),
                    timeout: 1e4
                },
                ix = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/get-current-two-step-method"),
                    timeout: 1e4
                },
                iI = {
                    withCredentials: !0,
                    url: "".concat(ib, "/v1/disable-two-step-method"),
                    timeout: 1e4
                },
                iT = function(e, t, n, r) {
                    return tb(ti.httpService.post(ig, {
                        identifier: e,
                        identifierType: t,
                        recoverySessionId: r,
                        requestedRecoveryTypes: n
                    }), ih)
                },
                iP = function(e, t, n, r) {
                    return tb(ti.httpService.post(iO, {
                        contactMethod: e,
                        contactMethodType: t,
                        recoverySessionId: n,
                        contactMethodNumber: r
                    }), ih)
                },
                iD = function(e, t) {
                    return tb(ti.httpService.post(iS, {
                        recoverySessionId: e,
                        contactMethodNumber: t
                    }), ih)
                },
                i_ = function(e, t, n) {
                    return tb(ti.httpService.post(iw, {
                        recoverySessionId: e,
                        code: t,
                        contactMethodNumber: n
                    }), ih)
                },
                iC = function(e, t) {
                    return tb(ti.httpService.post(iE, {
                        recoverySessionId: e,
                        backupCode: t
                    }), ih)
                },
                iL = function(e, t, n, r, o) {
                    return tb(ti.httpService.post(iA, {
                        recoverySessionId: e,
                        userId: t,
                        recover2sv: n,
                        twoStepVerificationToken: r,
                        twoStepVerificationChallengeId: o
                    }), ih)
                },
                iR = function(e) {
                    return tb(ti.httpService.post(iN, {
                        recoverySessionId: e
                    }), ih)
                },
                iU = function(e) {
                    return tb(ti.httpService.post(ij, {
                        recoverySessionId: e
                    }), ih)
                },
                ik = function(e) {
                    return tb(ti.httpService.get(ix, {
                        recoverySessionId: e
                    }), ih)
                },
                iM = function(e, t) {
                    return tb(ti.httpService.post(iI, {
                        recoverySessionId: e,
                        twoStepMethod: t
                    }), ih)
                },
                iW = {
                    url: "/my/settings/json",
                    withCredentials: !0
                },
                iF = ((K = {})[K.UNKNOWN = 0] = "UNKNOWN", K),
                iV = function() {
                    return tb(ti.httpService.get(iW), iF)
                },
                iK = ((B = {})[B.UNKNOWN = 0] = "UNKNOWN", B[B.FLAG_OFF = 1] = "FLAG_OFF", B),
                iB = {
                    withCredentials: !0,
                    url: "".concat(null === tr.EnvironmentUrls || void 0 === tr.EnvironmentUrls ? void 0 : tr.EnvironmentUrls.userSettingsApi, "/v1/user-settings"),
                    timeout: 1e4
                },
                iz = function() {
                    return tb(ti.httpService.get(iB), iK)
                },
                iH = function(e, t) {
                    return !1 === t ? Promise.resolve(tl(iK.FLAG_OFF, null, null)) : tb(ti.httpService.post(iB, {
                        eppEnrollmentStatus: e
                    }), iK)
                },
                iY = null != (eT = tr.EnvironmentUrls.usersApi) ? eT : "URL_NOT_FOUND",
                iG = ((z = {})[z.UNKNOWN = 0] = "UNKNOWN", z),
                iX = {
                    withCredentials: !0,
                    url: "".concat(iY, "/v1/usernames/users"),
                    timeout: 1e4
                },
                i$ = {
                    withCredentials: !0,
                    url: "".concat(iY, "/v1/users"),
                    timeout: 1e4
                },
                iQ = function(e) {
                    return tb(ti.httpService.get({
                        withCredentials: !0,
                        url: "".concat(iY, "/v1/users/").concat(e),
                        timeout: 1e4
                    }), iG)
                },
                iq = function(e) {
                    return tb(ti.httpService.post(iX, {
                        usernames: [e],
                        excludeBannedUsers: !0
                    }), iG)
                },
                iJ = function(e) {
                    return tb(ti.httpService.post(i$, {
                        userIds: e,
                        excludeBannedUsers: !1
                    }), iG)
                };

            function iZ(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            n(890);
            var i0 = window.TanstackQuery,
                i1 = window.ReactUtilities,
                i2 = "sessionManagementEvent",
                i4 = "signedOutOfAllSessions",
                i3 = "signedOutOfSession",
                i6 = "openedSessionDetails",
                i5 = function() {
                    for (var e, t, n = 0, r = "", o = arguments.length; n < o; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (o && (o += " "), o += r)
                            } else
                                for (r in t) t[r] && (o && (o += " "), o += r);
                        return o
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                i8 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                i7 = function(e) {
                    var t = e.className;
                    return te().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: i5("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                };

            function i9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }
            var ae = (0, e9.createContext)(null),
                at = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                an = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                ar = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ao = (0, e9.forwardRef)(function(e, t) {
                    var n = e.isContained,
                        r = e.size,
                        o = e.divider,
                        i = e.alignment,
                        a = e.title,
                        l = e.isTitleBold,
                        u = e.text,
                        c = e.isMultiline,
                        s = e.metadata,
                        f = e.description,
                        d = e.leading,
                        p = e.trailing,
                        y = e.onSelect,
                        v = e.className,
                        m = void 0 === s && void 0 === f && void 0 === i && void 0 === r;
                    if ((void 0 !== u || void 0 !== c) && !m) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var b = null != r ? r : "Large",
                        h = void 0 !== y,
                        g = h ? "button" : "div",
                        O = !!m && c,
                        S = "Top" === i ? "justify-start" : "justify-center";
                    O && (S = "justify-start");
                    var w = te().createElement(g, i9({
                            className: i5("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", n ? "padding-x-medium" : "padding-x-xlarge", "Full" === o && "foundation-web-list-item-bottom-divider", h && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", h && "cursor-pointer", v)
                        }, h && {
                            onClick: function() {
                                return y()
                            }
                        }), h && te().createElement(i7, null), d && te().createElement("div", {
                            className: i5("flex flex-col padding-y-large", S)
                        }, d), te().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, te().createElement("div", {
                            className: i5("flex flex-col fill clip-x justify-center", O && "gap-xsmall")
                        }, a && te().createElement("div", {
                            className: i5("content-emphasis text-align-x-start", void 0 === l || l ? an[b] : ar[b])
                        }, a), m && u && te().createElement("div", {
                            className: i5("content-default text-align-x-start", at[b], !c && "text-truncate-split text-no-wrap")
                        }, u), !m && s && te().createElement("div", {
                            className: i5("content-default text-align-x-start text-truncate-split text-no-wrap", at[b])
                        }, s), !m && f && te().createElement("div", {
                            className: i5("content-default text-align-x-start padding-top-xsmall", at[b])
                        }, f)), p && te().createElement("div", {
                            className: i5("flex flex-col", S)
                        }, p), "Inset" === o && te().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        E = (0, e9.useMemo)(function() {
                            return {
                                size: b
                            }
                        }, [b]);
                    return te().createElement("li", {
                        ref: t,
                        style: {
                            listStyle: "none"
                        }
                    }, te().createElement(ae.Provider, {
                        value: E
                    }, w))
                });
            ao.displayName = "ListItem";
            var ai = (0, e9.forwardRef)(function(e, t) {
                var n = e.children,
                    r = e.className,
                    o = e.as,
                    i = function(e, t) {
                        if (null == e) return {};
                        var n, r, o = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = {},
                                i = Object.keys(e);
                            for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                        }
                        return o
                    }(e, ["children", "className", "as"]);
                return te().createElement(void 0 === o ? "ul" : o, i9({
                    ref: t,
                    className: i5("foundation-web-list", r)
                }, i), n)
            });

            function aa(e) {
                var t = e.className;
                return te().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: i5("block", t),
                    style: {
                        marginTop: -1
                    }
                }, te().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function al(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    o = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === o || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function au(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ac(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function as() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = ac(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : ac(t[e], null)
                        }
                    }
                }
            }

            function af() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return e9.useCallback(as.apply(void 0, function(e) {
                    if (Array.isArray(e)) return au(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return au(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return au(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function ad(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ap(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ay(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        ap(e, t, n[t])
                    })
                }
                return e
            }

            function av(e) {
                return function(e) {
                    if (Array.isArray(e)) return ad(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ad(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ad(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function am(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = [],
                    r = function() {
                        var t = n.map(function(e) {
                            return e9.createContext(e)
                        });
                        return function(n) {
                            var r = (null == n ? void 0 : n[e]) || t;
                            return e9.useMemo(function() {
                                var t, o;
                                return ap({}, "__scope".concat(e), (t = ay({}, n), o = null != (o = ap({}, e, r)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                                    var n = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        n.push.apply(n, r)
                                    }
                                    return n
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [n, r])
                        }
                    };
                return r.scopeName = e, [function(t, r) {
                    var o = e9.createContext(r),
                        i = n.length;
                    n = av(n).concat([r]);
                    var a = function(t) {
                        var n, r = t.scope,
                            a = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = {},
                                        i = Object.keys(e);
                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                }
                                return o
                            }(t, ["scope", "children"]),
                            u = (null == r || null == (n = r[e]) ? void 0 : n[i]) || o,
                            c = e9.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, e7.jsx)(u.Provider, {
                            value: c,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(n, a) {
                        var l, u = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                            c = e9.useContext(u);
                        if (c) return c;
                        if (void 0 !== r) return r;
                        throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                    }]
                }, ab.apply(void 0, [r].concat(av(t)))]
            }

            function ab() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                o = n.scopeName;
                            return ay({}, e, r(t)["__scope".concat(o)])
                        }, {});
                        return e9.useMemo(function() {
                            return ap({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return o.scopeName = r.scopeName, o
            }
            ai.displayName = "List";
            var ah = window.RadixUI["react-dismissable-layer"],
                ag = (null == (eP = globalThis) ? void 0 : eP.document) ? e9.useLayoutEffect : function() {};

            function aO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var aS = e9["useId".toString()] || function() {},
                aw = 0,
                aE = ["top", "right", "bottom", "left"],
                aA = Math.min,
                aN = Math.max,
                aj = Math.round,
                ax = Math.floor,
                aI = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                aT = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                aP = {
                    start: "end",
                    end: "start"
                };

            function aD(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function a_(e) {
                return e.split("-")[0]
            }

            function aC(e) {
                return e.split("-")[1]
            }

            function aL(e) {
                return "x" === e ? "y" : "x"
            }

            function aR(e) {
                return "y" === e ? "height" : "width"
            }
            var aU = new Set(["top", "bottom"]);

            function ak(e) {
                return aU.has(a_(e)) ? "y" : "x"
            }

            function aM(e) {
                return e.replace(/start|end/g, function(e) {
                    return aP[e]
                })
            }
            var aW = ["left", "right"],
                aF = ["right", "left"],
                aV = ["top", "bottom"],
                aK = ["bottom", "top"];

            function aB(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return aT[e]
                })
            }

            function az(e) {
                return "number" != typeof e ? function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                }, e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function aH(e) {
                var t = e.x,
                    n = e.y,
                    r = e.width,
                    o = e.height;
                return {
                    width: r,
                    height: o,
                    top: n,
                    left: t,
                    right: t + r,
                    bottom: n + o,
                    x: t,
                    y: n
                }
            }

            function aY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function aG(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function aX(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            aG(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            aG(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function a$(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function aQ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        a$(e, t, n[t])
                    })
                }
                return e
            }

            function aq(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function aJ(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function aZ(e) {
                return function(e) {
                    if (Array.isArray(e)) return aY(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aY(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aY(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a0(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(u) {
                        var c = [l, u];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                            switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
                        } catch (e) {
                            c = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function a1(e, t, n) {
                var r, o = e.reference,
                    i = e.floating,
                    a = ak(t),
                    l = aL(ak(t)),
                    u = aR(l),
                    c = a_(t),
                    s = "y" === a,
                    f = o.x + o.width / 2 - i.width / 2,
                    d = o.y + o.height / 2 - i.height / 2,
                    p = o[u] / 2 - i[u] / 2;
                switch (c) {
                    case "top":
                        r = {
                            x: f,
                            y: o.y - i.height
                        };
                        break;
                    case "bottom":
                        r = {
                            x: f,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        r = {
                            x: o.x + o.width,
                            y: d
                        };
                        break;
                    case "left":
                        r = {
                            x: o.x - i.width,
                            y: d
                        };
                        break;
                    default:
                        r = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (aC(t)) {
                    case "start":
                        r[l] -= p * (n && s ? -1 : 1);
                        break;
                    case "end":
                        r[l] += p * (n && s ? -1 : 1)
                }
                return r
            }

            function a2(e, t) {
                return aX(function() {
                    var n, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I, T, P, D, _;
                    return a0(this, function(C) {
                        switch (C.label) {
                            case 0:
                                return void 0 === t && (t = {}), r = e.x, o = e.y, i = e.platform, a = e.rects, l = e.elements, u = e.strategy, f = void 0 === (s = (c = aD(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (d = c.rootBoundary) ? "viewport" : d, v = void 0 === (y = c.elementContext) ? "floating" : y, b = void 0 !== (m = c.altBoundary) && m, g = az(void 0 === (h = c.padding) ? 0 : h), O = "floating" === v ? "reference" : "floating", S = l[b ? O : v], E = i.getClippingRect, A = {}, [4, null == i.isElement ? void 0 : i.isElement(S)];
                            case 1:
                                if (!(null == (n = C.sent()) || n)) return [3, 2];
                                return N = S, [3, 5];
                            case 2:
                                if (j = S.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(l.floating)];
                            case 3:
                                j = C.sent(), C.label = 4;
                            case 4:
                                N = j, C.label = 5;
                            case 5:
                                return [4, E.apply(i, [(A.element = N, A.boundary = f, A.rootBoundary = p, A.strategy = u, A)])];
                            case 6:
                                return w = aH.apply(void 0, [C.sent()]), x = "floating" === v ? {
                                    x: r,
                                    y: o,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(l.floating)];
                            case 7:
                                return I = C.sent(), [4, null == i.isElement ? void 0 : i.isElement(I)];
                            case 8:
                                if (!C.sent()) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(I)];
                            case 9:
                                return P = C.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                P = {
                                    x: 1,
                                    y: 1
                                }, C.label = 11;
                            case 11:
                                if (T = P, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: x,
                                    offsetParent: I,
                                    strategy: u
                                })];
                            case 12:
                                return _ = C.sent(), [3, 14];
                            case 13:
                                _ = x, C.label = 14;
                            case 14:
                                return D = aH.apply(void 0, [_]), [2, {
                                    top: (w.top - D.top + g.top) / T.y,
                                    bottom: (D.bottom - w.bottom + g.bottom) / T.y,
                                    left: (w.left - D.left + g.left) / T.x,
                                    right: (D.right - w.right + g.right) / T.x
                                }]
                        }
                    })
                })()
            }

            function a4(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function a3(e) {
                return aE.some(function(t) {
                    return e[t] >= 0
                })
            }
            var a6 = new Set(["left", "top"]);

            function a5(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function a8() {
                return "undefined" != typeof window
            }

            function a7(e) {
                return lt(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function a9(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function le(e) {
                var t;
                return null == (t = (lt(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function lt(e) {
                return !!a8() && (a5(e, Node) || a5(e, a9(e).Node))
            }

            function ln(e) {
                return !!a8() && (a5(e, Element) || a5(e, a9(e).Element))
            }

            function lr(e) {
                return !!a8() && (a5(e, HTMLElement) || a5(e, a9(e).HTMLElement))
            }

            function lo(e) {
                return !!a8() && "undefined" != typeof ShadowRoot && (a5(e, ShadowRoot) || a5(e, a9(e).ShadowRoot))
            }
            var li = new Set(["inline", "contents"]);

            function la(e) {
                var t = lb(e),
                    n = t.overflow,
                    r = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(n + o + r) && !li.has(i)
            }
            var ll = new Set(["table", "td", "th"]),
                lu = [":popover-open", ":modal"];

            function lc(e) {
                return lu.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var ls = ["transform", "translate", "scale", "rotate", "perspective"],
                lf = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                ld = ["paint", "layout", "strict", "content"];

            function lp(e) {
                var t = ly(),
                    n = ln(e) ? lb(e) : e;
                return ls.some(function(e) {
                    return !!n[e] && "none" !== n[e]
                }) || !!n.containerType && "normal" !== n.containerType || !t && !!n.backdropFilter && "none" !== n.backdropFilter || !t && !!n.filter && "none" !== n.filter || lf.some(function(e) {
                    return (n.willChange || "").includes(e)
                }) || ld.some(function(e) {
                    return (n.contain || "").includes(e)
                })
            }

            function ly() {
                return "undefined" != typeof CSS && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var lv = new Set(["html", "body", "#document"]);

            function lm(e) {
                return lv.has(a7(e))
            }

            function lb(e) {
                return a9(e).getComputedStyle(e)
            }

            function lh(e) {
                return ln(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function lg(e) {
                if ("html" === a7(e)) return e;
                var t = e.assignedSlot || e.parentNode || lo(e) && e.host || le(e);
                return lo(t) ? t.host : t
            }

            function lO(e, t, n) {
                void 0 === t && (t = []), void 0 === n && (n = !0);
                var r, o = function e(t) {
                        var n = lg(t);
                        return lm(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : lr(n) && la(n) ? n : e(n)
                    }(e),
                    i = o === (null == (r = e.ownerDocument) ? void 0 : r.body),
                    a = a9(o);
                if (i) {
                    var l = lS(a);
                    return t.concat(a, a.visualViewport || [], la(o) ? o : [], l && n ? lO(l) : [])
                }
                return t.concat(o, lO(o, [], n))
            }

            function lS(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function lw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function lE(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function lA(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function lN(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function lj(e) {
                return function(e) {
                    if (Array.isArray(e)) return lw(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || lx(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lx(e, t) {
                if (e) {
                    if ("string" == typeof e) return lw(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lw(e, t)
                }
            }

            function lI(e) {
                var t = lb(e),
                    n = parseFloat(t.width) || 0,
                    r = parseFloat(t.height) || 0,
                    o = lr(e),
                    i = o ? e.offsetWidth : n,
                    a = o ? e.offsetHeight : r,
                    l = aj(n) !== i || aj(r) !== a;
                return l && (n = i, r = a), {
                    width: n,
                    height: r,
                    $: l
                }
            }

            function lT(e) {
                return ln(e) ? e : e.contextElement
            }

            function lP(e) {
                var t = lT(e);
                if (!lr(t)) return aI(1);
                var n = t.getBoundingClientRect(),
                    r = lI(t),
                    o = r.width,
                    i = r.height,
                    a = r.$,
                    l = (a ? aj(n.width) : n.width) / o,
                    u = (a ? aj(n.height) : n.height) / i;
                return l && Number.isFinite(l) || (l = 1), u && Number.isFinite(u) || (u = 1), {
                    x: l,
                    y: u
                }
            }
            var lD = aI(0);

            function l_(e) {
                var t = a9(e);
                return ly() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : lD
            }

            function lC(e, t, n, r) {
                void 0 === t && (t = !1), void 0 === n && (n = !1);
                var o, i = e.getBoundingClientRect(),
                    a = lT(e),
                    l = aI(1);
                t && (r ? ln(r) && (l = lP(r)) : l = lP(e));
                var u = (void 0 === (o = n) && (o = !1), r && (!o || r === a9(a)) && o) ? l_(a) : aI(0),
                    c = (i.left + u.x) / l.x,
                    s = (i.top + u.y) / l.y,
                    f = i.width / l.x,
                    d = i.height / l.y;
                if (a)
                    for (var p = a9(a), y = r && ln(r) ? a9(r) : r, v = p, m = lS(v); m && r && y !== v;) {
                        var b = lP(m),
                            h = m.getBoundingClientRect(),
                            g = lb(m),
                            O = h.left + (m.clientLeft + parseFloat(g.paddingLeft)) * b.x,
                            S = h.top + (m.clientTop + parseFloat(g.paddingTop)) * b.y;
                        c *= b.x, s *= b.y, f *= b.x, d *= b.y, c += O, s += S, m = lS(v = a9(m))
                    }
                return aH({
                    width: f,
                    height: d,
                    x: c,
                    y: s
                })
            }

            function lL(e, t) {
                var n = lh(e).scrollLeft;
                return t ? t.left + n : lC(le(e)).left + n
            }

            function lR(e, t) {
                var n = e.getBoundingClientRect();
                return {
                    x: n.left + t.scrollLeft - lL(e, n),
                    y: n.top + t.scrollTop
                }
            }
            var lU = new Set(["absolute", "fixed"]);

            function lk(e, t, n) {
                if ("viewport" === t) r = function(e, t) {
                    var n = a9(e),
                        r = le(e),
                        o = n.visualViewport,
                        i = r.clientWidth,
                        a = r.clientHeight,
                        l = 0,
                        u = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var c = ly();
                        (!c || c && "fixed" === t) && (l = o.offsetLeft, u = o.offsetTop)
                    }
                    var s = lL(r);
                    if (s <= 0) {
                        var f = r.ownerDocument,
                            d = f.body,
                            p = getComputedStyle(d),
                            y = "CSS1Compat" === f.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            v = Math.abs(r.clientWidth - d.clientWidth - y);
                        v <= 25 && (i -= v)
                    } else s <= 25 && (i += s);
                    return {
                        width: i,
                        height: a,
                        x: l,
                        y: u
                    }
                }(e, n);
                else if ("document" === t) o = le(e), i = le(o), a = lh(o), l = o.ownerDocument.body, u = aN(i.scrollWidth, i.clientWidth, l.scrollWidth, l.clientWidth), c = aN(i.scrollHeight, i.clientHeight, l.scrollHeight, l.clientHeight), s = -a.scrollLeft + lL(o), f = -a.scrollTop, "rtl" === lb(l).direction && (s += aN(i.clientWidth, l.clientWidth) - u), r = {
                    width: u,
                    height: c,
                    x: s,
                    y: f
                };
                else if (ln(t)) p = (d = lC(t, !0, "fixed" === n)).top + t.clientTop, y = d.left + t.clientLeft, v = lr(t) ? lP(t) : aI(1), r = {
                    width: t.clientWidth * v.x,
                    height: t.clientHeight * v.y,
                    x: y * v.x,
                    y: p * v.y
                };
                else {
                    var r, o, i, a, l, u, c, s, f, d, p, y, v, m = l_(e);
                    r = {
                        x: t.x - m.x,
                        y: t.y - m.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return aH(r)
            }

            function lM(e, t, n) {
                var r = lr(t),
                    o = le(t),
                    i = "fixed" === n,
                    a = lC(e, !0, i, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = aI(0);
                if (r || !r && !i)
                    if (("body" !== a7(t) || la(o)) && (l = lh(t)), r) {
                        var c = lC(t, !0, i, t);
                        u.x = c.x + t.clientLeft, u.y = c.y + t.clientTop
                    } else o && (u.x = lL(o));
                i && !r && o && (u.x = lL(o));
                var s = !o || r || i ? aI(0) : lR(o, l);
                return {
                    x: a.left + l.scrollLeft - u.x - s.x,
                    y: a.top + l.scrollTop - u.y - s.y,
                    width: a.width,
                    height: a.height
                }
            }

            function lW(e) {
                return "static" === lb(e).position
            }

            function lF(e, t) {
                if (!lr(e) || "fixed" === lb(e).position) return null;
                if (t) return t(e);
                var n = e.offsetParent;
                return le(e) === n && (n = n.ownerDocument.body), n
            }

            function lV(e, t) {
                var n, r = a9(e);
                if (lc(e)) return r;
                if (!lr(e)) {
                    for (var o = lg(e); o && !lm(o);) {
                        if (ln(o) && !lW(o)) return o;
                        o = lg(o)
                    }
                    return r
                }
                for (var i = lF(e, t); i && (n = i, ll.has(a7(n))) && lW(i);) i = lF(i, t);
                return i && lm(i) && lW(i) && !lp(i) ? r : i || function(e) {
                    for (var t = lg(e); lr(t) && !lm(t);) {
                        if (lp(t)) return t;
                        if (lc(t)) break;
                        t = lg(t)
                    }
                    return null
                }(e) || r
            }
            var lK = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        n = e.rect,
                        r = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = le(r),
                        a = !!t && lc(t.floating);
                    if (r === i || a && o) return n;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = aI(1),
                        c = aI(0),
                        s = lr(r);
                    if ((s || !s && !o) && (("body" !== a7(r) || la(i)) && (l = lh(r)), lr(r))) {
                        var f = lC(r);
                        u = lP(r), c.x = f.x + r.clientLeft, c.y = f.y + r.clientTop
                    }
                    var d = !i || s || o ? aI(0) : lR(i, l);
                    return {
                        width: n.width * u.x,
                        height: n.height * u.y,
                        x: n.x * u.x - l.scrollLeft * u.x + c.x + d.x,
                        y: n.y * u.y - l.scrollTop * u.y + c.y + d.y
                    }
                },
                getDocumentElement: le,
                getClippingRect: function(e) {
                    var t = e.element,
                        n = e.boundary,
                        r = e.rootBoundary,
                        o = e.strategy,
                        i = lj("clippingAncestors" === n ? lc(t) ? [] : function(e, t) {
                            var n = t.get(e);
                            if (n) return n;
                            for (var r = lO(e, [], !1).filter(function(e) {
                                    return ln(e) && "body" !== a7(e)
                                }), o = null, i = "fixed" === lb(e).position, a = i ? lg(e) : e; ln(a) && !lm(a);) {
                                var l = lb(a),
                                    u = lp(a);
                                u || "fixed" !== l.position || (o = null), (i ? !u && !o : !u && "static" === l.position && !!o && lU.has(o.position) || la(a) && !u && function e(t, n) {
                                    var r = lg(t);
                                    return !(r === n || !ln(r) || lm(r)) && ("fixed" === lb(r).position || e(r, n))
                                }(e, a)) ? r = r.filter(function(e) {
                                    return e !== a
                                }) : o = l, a = lg(a)
                            }
                            return t.set(e, r), r
                        }(t, this._c) : [].concat(n)).concat([r]),
                        a = i[0],
                        l = i.reduce(function(e, n) {
                            var r = lk(t, n, o);
                            return e.top = aN(r.top, e.top), e.right = aA(r.right, e.right), e.bottom = aA(r.bottom, e.bottom), e.left = aN(r.left, e.left), e
                        }, lk(t, a, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: lV,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, n, r, o;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return t = this.getOffsetParent || lV, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return n = i.sent(), r = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (r.reference = lM.apply(void 0, o.concat([i.sent(), e.strategy])), r.floating = {
                                        x: 0,
                                        y: 0,
                                        width: n.width,
                                        height: n.height
                                    }, r)]
                            }
                        })
                    }, function() {
                        var e = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = t.apply(e, n);

                            function a(e) {
                                lE(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                lE(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = lI(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: lP,
                isElement: ln,
                isRTL: function(e) {
                    return "rtl" === lb(e).direction
                }
            };

            function lB(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function lz(e, t, n, r) {
                void 0 === r && (r = {});
                var o, i = r.ancestorScroll,
                    a = void 0 === i || i,
                    l = r.ancestorResize,
                    u = void 0 === l || l,
                    c = r.elementResize,
                    s = void 0 === c ? "function" == typeof ResizeObserver : c,
                    f = r.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = r.animationFrame,
                    y = void 0 !== p && p,
                    v = lT(e),
                    m = a || u ? lj(v ? lO(v) : []).concat(lj(lO(t))) : [];
                m.forEach(function(e) {
                    a && e.addEventListener("scroll", n, {
                        passive: !0
                    }), u && e.addEventListener("resize", n)
                });
                var b = v && d ? function(e, t) {
                        var n, r = null,
                            o = le(e);

                        function i() {
                            var e;
                            clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                        }
                        return ! function a(l, u) {
                            void 0 === l && (l = !1), void 0 === u && (u = 1), i();
                            var c = e.getBoundingClientRect(),
                                s = c.left,
                                f = c.top,
                                d = c.width,
                                p = c.height;
                            if (l || t(), d && p) {
                                var y = {
                                        rootMargin: -ax(f) + "px " + -ax(o.clientWidth - (s + d)) + "px " + -ax(o.clientHeight - (f + p)) + "px " + -ax(s) + "px",
                                        threshold: aN(0, aA(1, u)) || 1
                                    },
                                    v = !0;
                                try {
                                    r = new IntersectionObserver(m, lN(lA({}, y), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    r = new IntersectionObserver(m, y)
                                }
                                r.observe(e)
                            }

                            function m(t) {
                                var r = t[0].intersectionRatio;
                                if (r !== u) {
                                    if (!v) return a();
                                    r ? a(!1, r) : n = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== r || lB(c, e.getBoundingClientRect()) || a(), v = !1
                            }
                        }(!0), i
                    }(v, n) : null,
                    h = -1,
                    g = null;
                s && (g = new ResizeObserver(function(e) {
                    var r = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(e, 1) || lx(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    r && r.target === v && g && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), n()
                }), v && !y && g.observe(v), g.observe(t));
                var O = y ? lC(e) : null;
                return y && function t() {
                        var r = lC(e);
                        O && !lB(O, r) && n(), O = r, o = requestAnimationFrame(t)
                    }(), n(),
                    function() {
                        var e;
                        m.forEach(function(e) {
                            a && e.removeEventListener("scroll", n), u && e.removeEventListener("resize", n)
                        }), null == b || b(), null == (e = g) || e.disconnect(), g = null, y && cancelAnimationFrame(o)
                    }
            }
            var lH = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return aX(function() {
                                var n, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I, T, P, D, _, C, L, R, U, k, M;
                                return a0(this, function(W) {
                                    switch (W.label) {
                                        case 0:
                                            if (n = t.x, r = t.y, o = t.placement, i = t.rects, a = t.platform, l = t.elements, u = t.middlewareData, s = (c = aD(e, t) || {}).element, d = void 0 === (f = c.padding) ? 0 : f, null == s) return [2, {}];
                                            return p = az(d), y = {
                                                x: n,
                                                y: r
                                            }, m = aR(v = aL(ak(o))), [4, a.getDimensions(s)];
                                        case 1:
                                            return b = W.sent(), g = (h = "y" === v) ? "top" : "left", O = h ? "bottom" : "right", S = h ? "clientHeight" : "clientWidth", w = i.reference[m] + i.reference[v] - y[v] - i.floating[m], E = y[v] - i.reference[v], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(s)];
                                        case 2:
                                            if (j = !(N = (A = W.sent()) ? A[S] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(A)];
                                        case 3:
                                            j = !W.sent(), W.label = 4;
                                        case 4:
                                            return j && (N = l.floating[S] || i.floating[m]), x = w / 2 - E / 2, I = N / 2 - b[m] / 2 - 1, T = aA(p[g], I), P = aA(p[O], I), D = T, _ = N - b[m] - P, L = aN(D, aA(C = N / 2 - b[m] / 2 + x, _)), U = (R = !u.arrow && null != aC(o) && C !== L && i.reference[m] / 2 - (C < D ? T : P) - b[m] / 2 < 0) ? C < D ? C - D : C - _ : 0, [2, (a$(M = {}, v, y[v] + U), a$(M, "data", aQ((a$(k = {}, v, L), a$(k, "centerOffset", C - L - U), k), R && {
                                                alignmentOffset: U
                                            })), a$(M, "reset", R), M)]
                                    }
                                })
                            })()
                        }
                    }
                },
                lY = function(e, t, n) {
                    var r, o = new Map,
                        i = lA({
                            platform: lK
                        }, n),
                        a = lN(lA({}, i.platform), {
                            _c: o
                        });
                    return r = lN(lA({}, i), {
                        platform: a
                    }), aX(function() {
                        var n, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I;
                        return a0(this, function(T) {
                            switch (T.label) {
                                case 0:
                                    return o = void 0 === (n = r.placement) ? "bottom" : n, a = void 0 === (i = r.strategy) ? "absolute" : i, u = void 0 === (l = r.middleware) ? [] : l, c = r.platform, s = u.filter(Boolean), [4, null == c.isRTL ? void 0 : c.isRTL(t)];
                                case 1:
                                    return f = T.sent(), [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    y = (p = a1(d = T.sent(), o, f)).x, v = p.y, m = o, b = {}, h = 0, g = 0, T.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return S = (O = s[g]).name, [4, (0, O.fn)({
                                        x: y,
                                        y: v,
                                        initialPlacement: o,
                                        placement: m,
                                        strategy: a,
                                        middlewareData: b,
                                        rects: d,
                                        platform: c,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var P;
                                    if (E = (w = T.sent()).x, A = w.y, N = w.data, j = w.reset, y = null != E ? E : y, v = null != A ? A : v, b = aq(aQ({}, b), a$({}, S, aQ({}, b[S], N))), !(j && h <= 50)) return [3, 10];
                                    if (h++, (void 0 === j ? "undefined" : (P = j) && "undefined" != typeof Symbol && P.constructor === Symbol ? "symbol" : typeof P) != "object") return [3, 9];
                                    if (j.placement && (m = j.placement), !j.rects) return [3, 8];
                                    if (!0 !== j.rects) return [3, 6];
                                    return [4, c.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return x = T.sent(), [3, 7];
                                case 6:
                                    x = j.rects, T.label = 7;
                                case 7:
                                    d = x, T.label = 8;
                                case 8:
                                    y = (I = a1(d, m, f)).x, v = I.y, T.label = 9;
                                case 9:
                                    g = -1, T.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: y,
                                        y: v,
                                        placement: m,
                                        strategy: a,
                                        middlewareData: b
                                    }]
                            }
                        })
                    })()
                };

            function lG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function lX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function l$(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function lQ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return lG(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lq(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var lJ = "undefined" != typeof document ? e9.useLayoutEffect : function() {};

            function lZ(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : lq(e)) !== (void 0 === t ? "undefined" : lq(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : lq(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((n = e.length) !== t.length) return !1;
                        for (r = n; 0 != r--;)
                            if (!lZ(e[r], t[r])) return !1;
                        return !0
                    }
                    if ((n = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (r = n; 0 != r--;)
                        if (!({}).hasOwnProperty.call(t, o[r])) return !1;
                    for (r = n; 0 != r--;) {
                        var n, r, o, i = o[r];
                        if (("_owner" !== i || !e.$$typeof) && !lZ(e[i], t[i])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function l0(e) {
                return "undefined" == typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function l1(e, t) {
                var n = l0(e);
                return Math.round(t * n) / n
            }

            function l2(e) {
                var t = e9.useRef(e);
                return lJ(function() {
                    t.current = e
                }), t
            }
            var l4 = function(e, t) {
                    var n;
                    return l$(lX({}, (void 0 === (n = e) && (n = 0), {
                        name: "offset",
                        options: n,
                        fn: function(e) {
                            return aX(function() {
                                var t, r, o, i, a, l, u;
                                return a0(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, i = e.y, a = e.placement, l = e.middlewareData, [4, (s = n, aX(function() {
                                                var t, n, r, o, i, a, l, u, c, f, d, p, y, v;
                                                return a0(this, function(m) {
                                                    switch (m.label) {
                                                        case 0:
                                                            return t = e.placement, n = e.platform, r = e.elements, [4, null == n.isRTL ? void 0 : n.isRTL(r.floating)];
                                                        case 1:
                                                            return o = m.sent(), i = a_(t), a = aC(t), l = "y" === ak(t), u = a6.has(i) ? -1 : 1, c = o && l ? -1 : 1, p = (d = "number" == typeof(f = aD(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, y = d.crossAxis, v = d.alignmentAxis, a && "number" == typeof v && (y = "end" === a ? -1 * v : v), [2, l ? {
                                                                x: y * c,
                                                                y: p * u
                                                            } : {
                                                                x: p * u,
                                                                y: y * c
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (u = c.sent(), a === (null == (t = l.offset) ? void 0 : t.placement) && null != (r = l.arrow) && r.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + u.x,
                                                y: i + u.y,
                                                data: aq(aQ({}, u), {
                                                    placement: a
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                l3 = function(e, t) {
                    var n;
                    return l$(lX({}, (void 0 === (n = e) && (n = {}), {
                        name: "shift",
                        options: n,
                        fn: function(e) {
                            return aX(function() {
                                var t, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I, T;
                                return a0(this, function(P) {
                                    switch (P.label) {
                                        case 0:
                                            return t = e.x, r = e.y, o = e.placement, l = void 0 === (a = (i = aD(n, e)).mainAxis) || a, c = void 0 !== (u = i.crossAxis) && u, f = void 0 === (s = i.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, d = aJ(i, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: r
                                            }, [4, a2(e, d)];
                                        case 1:
                                            return y = P.sent(), b = p[m = aL(v = ak(a_(o)))], h = p[v], l && (g = "y" === m ? "top" : "left", O = "y" === m ? "bottom" : "right", S = b + y[g], w = b - y[O], b = aN(S, aA(b, w))), c && (E = "y" === v ? "top" : "left", A = "y" === v ? "bottom" : "right", N = h + y[E], j = h - y[A], h = aN(N, aA(h, j))), I = f.fn(aq(aQ({}, e), (a$(x = {}, m, b), a$(x, v, h), x))), [2, aq(aQ({}, I), {
                                                data: {
                                                    x: I.x - t,
                                                    y: I.y - r,
                                                    enabled: (a$(T = {}, m, l), a$(T, v, c), T)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                l6 = function(e, t) {
                    var n;
                    return l$(lX({}, (void 0 === (n = e) && (n = {}), {
                        options: n,
                        fn: function(e) {
                            var t, r = e.x,
                                o = e.y,
                                i = e.placement,
                                a = e.rects,
                                l = e.middlewareData,
                                u = aD(n, e),
                                c = u.offset,
                                s = u.mainAxis,
                                f = u.crossAxis,
                                d = {
                                    x: r,
                                    y: o
                                },
                                p = ak(i),
                                y = aL(p),
                                v = d[y],
                                m = d[p],
                                b = aD(void 0 === c ? 0 : c, e),
                                h = "number" == typeof b ? {
                                    mainAxis: b,
                                    crossAxis: 0
                                } : aQ({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, b);
                            if (void 0 === s || s) {
                                var g = "y" === y ? "height" : "width",
                                    O = a.reference[y] - a.floating[g] + h.mainAxis,
                                    S = a.reference[y] + a.reference[g] - h.mainAxis;
                                v < O ? v = O : v > S && (v = S)
                            }
                            if (void 0 === f || f) {
                                var w, E, A = "y" === y ? "width" : "height",
                                    N = a6.has(a_(i)),
                                    j = a.reference[p] - a.floating[A] + (N && (null == (w = l.offset) ? void 0 : w[p]) || 0) + (N ? 0 : h.crossAxis),
                                    x = a.reference[p] + a.reference[A] + (N ? 0 : (null == (E = l.offset) ? void 0 : E[p]) || 0) - (N ? h.crossAxis : 0);
                                m < j ? m = j : m > x && (m = x)
                            }
                            return a$(t = {}, y, v), a$(t, p, m), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                l5 = function(e, t) {
                    var n;
                    return l$(lX({}, (void 0 === (n = e) && (n = {}), {
                        name: "flip",
                        options: n,
                        fn: function(e) {
                            return aX(function() {
                                var t, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I, T, P, D, _, C, L, R, U, k, M, W, F, V;
                                return a0(this, function(K) {
                                    var B, z, H, Y, G, X, $, Q, q, J, Z, ee, et, en, er;
                                    switch (K.label) {
                                        case 0:
                                            if (o = e.placement, i = e.middlewareData, a = e.rects, l = e.initialPlacement, u = e.platform, c = e.elements, d = void 0 === (f = (s = aD(n, e)).mainAxis) || f, y = void 0 === (p = s.crossAxis) || p, v = s.fallbackPlacements, b = void 0 === (m = s.fallbackStrategy) ? "bestFit" : m, g = void 0 === (h = s.fallbackAxisSideDirection) ? "none" : h, S = void 0 === (O = s.flipAlignment) || O, w = aJ(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = i.arrow) && t.alignmentOffset) return [2, {}];
                                            return E = a_(o), A = ak(l), N = a_(l) === l, [4, null == u.isRTL ? void 0 : u.isRTL(c.floating)];
                                        case 1:
                                            return j = K.sent(), x = v || (N || !S ? [aB(l)] : (z = aB(B = l), [aM(B), z, aM(z)])), I = "none" !== g, !v && I && (T = x).push.apply(T, aZ((H = l, Y = S, G = g, X = j, $ = aC(H), Q = function(e, t, n) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (n) return t ? aF : aW;
                                                        return t ? aW : aF;
                                                    case "left":
                                                    case "right":
                                                        return t ? aV : aK;
                                                    default:
                                                        return []
                                                }
                                            }(a_(H), "start" === G, X), $ && (Q = Q.map(function(e) {
                                                return e + "-" + $
                                            }), Y && (Q = Q.concat(Q.map(aM)))), Q))), P = [l].concat(aZ(x)), [4, a2(e, w)];
                                        case 2:
                                            if (D = K.sent(), _ = [], C = (null == (r = i.flip) ? void 0 : r.overflows) || [], d && _.push(D[E]), y && (q = o, J = a, void 0 === (Z = j) && (Z = !1), ee = aC(q), en = aR(et = aL(ak(q))), er = "x" === et ? ee === (Z ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", J.reference[en] > J.floating[en] && (er = aB(er)), L = [er, aB(er)], _.push(D[L[0]], D[L[1]])), C = aZ(C).concat([{
                                                    placement: o,
                                                    overflows: _
                                                }]), !_.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((M = P[k = ((null == (R = i.flip) ? void 0 : R.index) || 0) + 1]) && ("alignment" !== y || A === ak(M) || C.every(function(e) {
                                                        return ak(e.placement) !== A || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: k,
                                                        overflows: C
                                                    },
                                                    reset: {
                                                        placement: M
                                                    }
                                                }];
                                                if (!(W = null == (U = C.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : U.placement)) switch (b) {
                                                    case "bestFit":
                                                        (V = null == (F = C.filter(function(e) {
                                                            if (I) {
                                                                var t = ak(e.placement);
                                                                return t === A || "y" === t
                                                            }
                                                            return !0
                                                        }).map(function(e) {
                                                            return [e.placement, e.overflows.filter(function(e) {
                                                                return e > 0
                                                            }).reduce(function(e, t) {
                                                                return e + t
                                                            }, 0)]
                                                        }).sort(function(e, t) {
                                                            return e[1] - t[1]
                                                        })[0]) ? void 0 : F[0]) && (W = V);
                                                        break;
                                                    case "initialPlacement":
                                                        W = l
                                                }
                                                if (o !== W) return [2, {
                                                    reset: {
                                                        placement: W
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                l8 = function(e, t) {
                    var n;
                    return l$(lX({}, (void 0 === (n = e) && (n = {}), {
                        name: "size",
                        options: n,
                        fn: function(e) {
                            return aX(function() {
                                var t, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I, T, P, D;
                                return a0(this, function(_) {
                                    switch (_.label) {
                                        case 0:
                                            return o = e.placement, i = e.rects, a = e.platform, l = e.elements, s = void 0 === (c = (u = aD(n, e)).apply) ? function() {} : c, [4, a2(e, aJ(u, ["apply"]))];
                                        case 1:
                                            if (f = _.sent(), d = a_(o), p = aC(o), y = "y" === ak(o), m = (v = i.floating).width, b = v.height, "top" !== d && "bottom" !== d) return [3, 3];
                                            return h = d, [4, null == a.isRTL ? void 0 : a.isRTL(l.floating)];
                                        case 2:
                                            return g = p === (_.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = d, h = "end" === p ? "top" : "bottom", _.label = 4;
                                        case 4:
                                            return O = b - f.top - f.bottom, S = m - f.left - f.right, w = aA(b - f[h], O), E = aA(m - f[g], S), A = !e.middlewareData.shift, N = w, j = E, null != (t = e.middlewareData.shift) && t.enabled.x && (j = S), null != (r = e.middlewareData.shift) && r.enabled.y && (N = O), A && !p && (x = aN(f.left, 0), I = aN(f.right, 0), T = aN(f.top, 0), P = aN(f.bottom, 0), y ? j = m - 2 * (0 !== x || 0 !== I ? x + I : aN(f.left, f.right)) : N = b - 2 * (0 !== T || 0 !== P ? T + P : aN(f.top, f.bottom))), [4, s(aq(aQ({}, e), {
                                                availableWidth: j,
                                                availableHeight: N
                                            }))];
                                        case 5:
                                            return _.sent(), [4, a.getDimensions(l.floating)];
                                        case 6:
                                            if (D = _.sent(), m !== D.width || b !== D.height) return [2, {
                                                reset: {
                                                    rects: !0
                                                }
                                            }];
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                l7 = function(e, t) {
                    var n;
                    return l$(lX({}, (void 0 === (n = e) && (n = {}), {
                        name: "hide",
                        options: n,
                        fn: function(e) {
                            return aX(function() {
                                var t, r, o, i, a, l, u;
                                return a0(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            switch (t = e.rects, i = void 0 === (o = (r = aD(n, e)).strategy) ? "referenceHidden" : o, a = aJ(r, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, a2(e, aq(aQ({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = a4(c.sent(), t.reference),
                                                    referenceHidden: a3(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, a2(e, aq(aQ({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: u = a4(c.sent(), t.floating),
                                                    escaped: a3(u)
                                                }
                                            }];
                                        case 5:
                                            return [2, {}];
                                        case 6:
                                            return [2]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                l9 = function(e, t) {
                    return l$(lX({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var n = "function" == typeof e ? e(t) : e,
                                r = n.element,
                                o = n.padding;
                            return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? lH({
                                element: r.current,
                                padding: o
                            }).fn(t) : {} : r ? lH({
                                element: r,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function ue(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ut(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function un(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function ur(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function uo(e) {
                return function(e) {
                    if (Array.isArray(e)) return ue(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ue(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ue(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ui = e9.forwardRef(function(e, t) {
                var n = e.children,
                    r = ur(e, ["children"]),
                    o = e9.Children.toArray(n),
                    i = o.find(uu);
                if (i) {
                    var a = i.props.children,
                        l = o.map(function(e) {
                            return e !== i ? e : e9.Children.count(a) > 1 ? e9.Children.only(null) : e9.isValidElement(a) ? a.props.children : null
                        });
                    return (0, e7.jsx)(ua, un(ut({}, r), {
                        ref: t,
                        children: e9.isValidElement(a) ? e9.cloneElement(a, void 0, l) : null
                    }))
                }
                return (0, e7.jsx)(ua, un(ut({}, r), {
                    ref: t,
                    children: n
                }))
            });
            ui.displayName = "Slot";
            var ua = e9.forwardRef(function(e, t) {
                var n = e.children,
                    r = ur(e, ["children"]);
                if (e9.isValidElement(n)) {
                    var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return e9.cloneElement(n, un(ut({}, function(e, t) {
                        var n = ut({}, t);
                        for (var r in t) ! function(r) {
                            var o = e[r],
                                i = t[r];
                            /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                i.apply(void 0, uo(t)), o.apply(void 0, uo(t))
                            } : o && (n[r] = o) : "style" === r ? n[r] = ut({}, o, i) : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                        }(r);
                        return ut({}, e, n)
                    }(r, n.props)), {
                        ref: t ? as(t, c) : c
                    }))
                }
                return e9.Children.count(n) > 1 ? e9.Children.only(null) : null
            });
            ua.displayName = "SlotClone";
            var ul = function(e) {
                var t = e.children;
                return (0, e7.jsx)(e7.Fragment, {
                    children: t
                })
            };

            function uu(e) {
                return e9.isValidElement(e) && e.type === ul
            }

            function uc(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function us(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        uc(e, t, n[t])
                    })
                }
                return e
            }

            function uf(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var ud = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = e9.forwardRef(function(e, n) {
                        var r = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = {},
                                        i = Object.keys(e);
                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                }
                                return o
                            }(e, ["asChild"]),
                            i = r ? ui : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, e7.jsx)(i, uf(us({}, o), {
                            ref: n
                        }))
                    });
                    return n.displayName = "Primitive.".concat(t), uf(us({}, e), uc({}, t, n))
                }, {}),
                up = e9.forwardRef(function(e, t) {
                    var n, r, o = e.children,
                        i = e.width,
                        a = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = {},
                                    i = Object.keys(e);
                                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                            }
                            return o
                        }(e, ["children", "width", "height"]);
                    return (0, e7.jsx)(ud.svg, (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, l), r = r = {
                        ref: t,
                        width: void 0 === i ? 10 : i,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, e7.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n))
                });

            function uy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uv(e) {
                var t = e9.useRef(e);
                return e9.useEffect(function() {
                    t.current = e
                }), e9.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return uy(e)
                        }(r) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return uy(e, void 0);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uy(e, t)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function um(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ub(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uh(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ug(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        uh(e, t, n[t])
                    })
                }
                return e
            }

            function uO(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function uS(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function uw(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || uE(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uE(e, t) {
                if (e) {
                    if ("string" == typeof e) return ub(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ub(e, t)
                }
            }
            up.displayName = "Arrow";
            var uA = "Popper",
                uN = uw(am(uA), 2),
                uj = uN[0],
                ux = uN[1],
                uI = uw(uj(uA), 2),
                uT = uI[0],
                uP = uI[1],
                uD = function(e) {
                    var t = e.__scopePopper,
                        n = e.children,
                        r = uw(e9.useState(null), 2),
                        o = r[0],
                        i = r[1];
                    return (0, e7.jsx)(uT, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: n
                    })
                };
            uD.displayName = uA;
            var u_ = "PopperAnchor",
                uC = e9.forwardRef(function(e, t) {
                    var n = e.__scopePopper,
                        r = e.virtualRef,
                        o = uS(e, ["__scopePopper", "virtualRef"]),
                        i = uP(u_, n),
                        a = e9.useRef(null),
                        l = af(t, a);
                    return e9.useEffect(function() {
                        i.onAnchorChange((null == r ? void 0 : r.current) || a.current)
                    }), r ? null : (0, e7.jsx)(ud.div, uO(ug({}, o), {
                        ref: l
                    }))
                });
            uC.displayName = u_;
            var uL = "PopperContent",
                uR = uw(uj(uL), 2),
                uU = uR[0],
                uk = uR[1],
                uM = e9.forwardRef(function(e, t) {
                    var n, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E, A, N, j, x, I, T, P, D, _, C, L, R, U, k, M, W, F, V, K, B, z, H, Y, G, X, $, Q, q, J, Z, ee, et, en, er, eo = e.__scopePopper,
                        ei = e.side,
                        ea = e.sideOffset,
                        el = e.align,
                        eu = void 0 === el ? "center" : el,
                        ec = e.alignOffset,
                        es = e.arrowPadding,
                        ef = e.avoidCollisions,
                        ed = void 0 === ef || ef,
                        ep = e.collisionBoundary,
                        ey = void 0 === ep ? [] : ep,
                        ev = e.collisionPadding,
                        em = void 0 === ev ? 0 : ev,
                        eb = e.sticky,
                        eh = e.hideWhenDetached,
                        eg = e.updatePositionStrategy,
                        eO = void 0 === eg ? "optimized" : eg,
                        eS = e.onPlaced,
                        ew = uS(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        eE = uP(uL, eo),
                        eA = uw(e9.useState(null), 2),
                        eN = eA[0],
                        ej = eA[1],
                        ex = af(t, function(e) {
                            return ej(e)
                        }),
                        eI = uw(e9.useState(null), 2),
                        eT = eI[0],
                        eP = eI[1],
                        eD = (o = (n = e9.useState(void 0), r = function(e) {
                            if (Array.isArray(e)) return e
                        }(n) || function(e, t) {
                            var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return um(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return um(e, t)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], i = r[1], ag(function() {
                            if (eT) {
                                i({
                                    width: eT.offsetWidth,
                                    height: eT.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, n, r = e[0];
                                        if ("borderBoxSize" in r) {
                                            var o = r.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, n = a.blockSize
                                        } else t = eT.offsetWidth, n = eT.offsetHeight;
                                        i({
                                            width: t,
                                            height: n
                                        })
                                    }
                                });
                                return e.observe(eT, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(eT)
                                    }
                            }
                            i(void 0)
                        }, [eT]), o),
                        e_ = null != (en = null == eD ? void 0 : eD.width) ? en : 0,
                        eC = null != (er = null == eD ? void 0 : eD.height) ? er : 0,
                        eL = "number" == typeof em ? em : ug({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, em),
                        eR = Array.isArray(ey) ? ey : [ey],
                        eU = eR.length > 0,
                        ek = {
                            padding: eL,
                            boundary: eR.filter(uK),
                            altBoundary: eU
                        },
                        eM = (u = void 0 === (l = (a = {
                            strategy: "fixed",
                            placement: (void 0 === ei ? "bottom" : ei) + ("center" !== eu ? "-" + eu : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return lz.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return ub(e)
                                })(t) || function(e) {
                                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || uE(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === eO
                                }]))
                            },
                            elements: {
                                reference: eE.anchor
                            },
                            middleware: [l4({
                                mainAxis: (void 0 === ea ? 0 : ea) + eC,
                                alignmentAxis: void 0 === ec ? 0 : ec
                            }), ed && l3(ug({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eb ? "partial" : eb) ? l6() : void 0
                            }, ek)), ed && l5(ug({}, ek)), l8(uO(ug({}, ek), {
                                apply: function(e) {
                                    var t = e.elements,
                                        n = e.rects,
                                        r = e.availableWidth,
                                        o = e.availableHeight,
                                        i = n.reference,
                                        a = i.width,
                                        l = i.height,
                                        u = t.floating.style;
                                    u.setProperty("--radix-popper-available-width", "".concat(r, "px")), u.setProperty("--radix-popper-available-height", "".concat(o, "px")), u.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), u.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), eT && l9({
                                element: eT,
                                padding: void 0 === es ? 0 : es
                            }), uB({
                                arrowWidth: e_,
                                arrowHeight: eC
                            }), void 0 !== eh && eh && l7(ug({
                                strategy: "referenceHidden"
                            }, ek))]
                        }).placement) ? "bottom" : l, s = void 0 === (c = a.strategy) ? "absolute" : c, d = void 0 === (f = a.middleware) ? [] : f, p = a.platform, m = (v = void 0 === (y = a.elements) ? {} : y).reference, b = v.floating, g = void 0 === (h = a.transform) || h, O = a.whileElementsMounted, S = a.open, E = (w = lQ(e9.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: u,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], A = w[1], j = (N = lQ(e9.useState(d), 2))[0], x = N[1], lZ(j, d) || x(d), T = (I = lQ(e9.useState(null), 2))[0], P = I[1], _ = (D = lQ(e9.useState(null), 2))[0], C = D[1], L = e9.useCallback(function(e) {
                            e !== M.current && (M.current = e, P(e))
                        }, []), R = e9.useCallback(function(e) {
                            e !== W.current && (W.current = e, C(e))
                        }, []), U = m || T, k = b || _, M = e9.useRef(null), W = e9.useRef(null), F = e9.useRef(E), V = null != O, K = l2(O), B = l2(p), z = l2(S), H = e9.useCallback(function() {
                            if (M.current && W.current) {
                                var e = {
                                    placement: u,
                                    strategy: s,
                                    middleware: j
                                };
                                B.current && (e.platform = B.current), lY(M.current, W.current, e).then(function(e) {
                                    var t = l$(lX({}, e), {
                                        isPositioned: !1 !== z.current
                                    });
                                    Y.current && !lZ(F.current, t) && (F.current = t, tt.flushSync(function() {
                                        A(t)
                                    }))
                                })
                            }
                        }, [j, u, s, B, z]), lJ(function() {
                            !1 === S && F.current.isPositioned && (F.current.isPositioned = !1, A(function(e) {
                                return l$(lX({}, e), {
                                    isPositioned: !1
                                })
                            }))
                        }, [S]), Y = e9.useRef(!1), lJ(function() {
                            return Y.current = !0,
                                function() {
                                    Y.current = !1
                                }
                        }, []), lJ(function() {
                            if (U && (M.current = U), k && (W.current = k), U && k) {
                                if (K.current) return K.current(U, k, H);
                                H()
                            }
                        }, [U, k, H, K, V]), G = e9.useMemo(function() {
                            return {
                                reference: M,
                                floating: W,
                                setReference: L,
                                setFloating: R
                            }
                        }, [L, R]), X = e9.useMemo(function() {
                            return {
                                reference: U,
                                floating: k
                            }
                        }, [U, k]), $ = e9.useMemo(function() {
                            var e = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!X.floating) return e;
                            var t = l1(X.floating, E.x),
                                n = l1(X.floating, E.y);
                            return g ? lX(l$(lX({}, e), {
                                transform: "translate(" + t + "px, " + n + "px)"
                            }), l0(X.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: t,
                                top: n
                            }
                        }, [s, g, X.floating, E.x, E.y]), e9.useMemo(function() {
                            return l$(lX({}, E), {
                                update: H,
                                refs: G,
                                elements: X,
                                floatingStyles: $
                            })
                        }, [E, H, G, X, $])),
                        eW = eM.refs,
                        eF = eM.floatingStyles,
                        eV = eM.placement,
                        eK = eM.isPositioned,
                        eB = eM.middlewareData,
                        ez = uw(uz(eV), 2),
                        eH = ez[0],
                        eY = ez[1],
                        eG = uv(eS);
                    ag(function() {
                        eK && (null == eG || eG())
                    }, [eK, eG]);
                    var eX = null == (Q = eB.arrow) ? void 0 : Q.x,
                        e$ = null == (q = eB.arrow) ? void 0 : q.y,
                        eQ = (null == (J = eB.arrow) ? void 0 : J.centerOffset) !== 0,
                        eq = uw(e9.useState(), 2),
                        eJ = eq[0],
                        eZ = eq[1];
                    return ag(function() {
                        eN && eZ(window.getComputedStyle(eN).zIndex)
                    }, [eN]), (0, e7.jsx)("div", {
                        ref: eW.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: ug(uO(ug({}, eF), uh({
                            transform: eK ? eF.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: eJ
                        }, "--radix-popper-transform-origin", [null == (Z = eB.transformOrigin) ? void 0 : Z.x, null == (ee = eB.transformOrigin) ? void 0 : ee.y].join(" "))), (null == (et = eB.hide) ? void 0 : et.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, e7.jsx)(uU, {
                            scope: eo,
                            placedSide: eH,
                            onArrowChange: eP,
                            arrowX: eX,
                            arrowY: e$,
                            shouldHideArrow: eQ,
                            children: (0, e7.jsx)(ud.div, uO(ug({
                                "data-side": eH,
                                "data-align": eY
                            }, ew), {
                                ref: ex,
                                style: uO(ug({}, ew.style), {
                                    animation: eK ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            uM.displayName = uL;
            var uW = "PopperArrow",
                uF = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                uV = e9.forwardRef(function(e, t) {
                    var n, r = e.__scopePopper,
                        o = uS(e, ["__scopePopper"]),
                        i = uk(uW, r),
                        a = uF[i.placedSide];
                    return (0, e7.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (uh(n = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), uh(n, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), uh(n, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), uh(n, "visibility", i.shouldHideArrow ? "hidden" : void 0), n),
                        children: (0, e7.jsx)(up, uO(ug({}, o), {
                            ref: t,
                            style: uO(ug({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function uK(e) {
                return null !== e
            }
            uV.displayName = uW;
            var uB = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var n, r, o, i, a, l = t.placement,
                            u = t.rects,
                            c = t.middlewareData,
                            s = (null == (n = c.arrow) ? void 0 : n.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            d = s ? 0 : e.arrowHeight,
                            p = uw(uz(l), 2),
                            y = p[0],
                            v = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            m = (null != (i = null == (r = c.arrow) ? void 0 : r.x) ? i : 0) + f / 2,
                            b = (null != (a = null == (o = c.arrow) ? void 0 : o.y) ? a : 0) + d / 2,
                            h = "",
                            g = "";
                        return "bottom" === y ? (h = s ? v : "".concat(m, "px"), g = "".concat(-d, "px")) : "top" === y ? (h = s ? v : "".concat(m, "px"), g = "".concat(u.floating.height + d, "px")) : "right" === y ? (h = "".concat(-d, "px"), g = s ? v : "".concat(b, "px")) : "left" === y && (h = "".concat(u.floating.width + d, "px"), g = s ? v : "".concat(b, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function uz(e) {
                var t = uw(e.split("-"), 2),
                    n = t[0],
                    r = t[1];
                return [n, void 0 === r ? "center" : r]
            }

            function uH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var uY = e9.forwardRef(function(e, t) {
                var n, r, o, i, a, l = e.container,
                    u = function(e, t) {
                        if (null == e) return {};
                        var n, r, o = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = {},
                                i = Object.keys(e);
                            for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                        }
                        return o
                    }(e, ["container"]),
                    c = (n = e9.useState(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(n) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return uH(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uH(e, t)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    s = c[0],
                    f = c[1];
                ag(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return d ? tn().createPortal((0, e7.jsx)(ud.div, (r = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({}, u), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(o, e))
                }), r)), d) : null
            });

            function uG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uX(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uG(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            uY.displayName = "Portal";
            var u$ = function(e) {
                var t, n, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h = e.present,
                    g = e.children,
                    O = (t = h, i = (o = uX(e9.useState(), 2))[0], a = o[1], l = e9.useRef({}), u = e9.useRef(t), c = e9.useRef("none"), f = (s = uX((n = t ? "mounted" : "unmounted", r = {
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
                    }, e9.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], d = s[1], e9.useEffect(function() {
                        var e = uQ(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), ag(function() {
                        var e = l.current,
                            n = u.current;
                        if (n !== t) {
                            var r = c.current,
                                o = uQ(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : n && r !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), u.current = t
                        }
                    }, [t, d]), ag(function() {
                        if (i) {
                            var e, t, n = null != (t = i.ownerDocument.defaultView) ? t : window,
                                r = function(t) {
                                    var r = uQ(l.current).includes(t.animationName);
                                    if (t.target === i && r && (d("ANIMATION_END"), !u.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", e = n.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (c.current = uQ(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(e), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                                }
                        }
                        d("ANIMATION_END")
                    }, [i, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: e9.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    S = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : e9.Children.only(g),
                    w = af(O.ref, (b = (m = null == (y = Object.getOwnPropertyDescriptor((p = S).props, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? p.ref : (b = (m = null == (v = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? e9.cloneElement(S, {
                    ref: w
                }) : null
            };

            function uQ(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function uq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uJ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uq(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return uq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uZ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }
            u$.displayName = "Presence";
            var u0 = e9.forwardRef(function(e, t) {
                var n, r;
                return (0, e7.jsx)(ud.span, (n = uZ({}, e), r = r = {
                    ref: t,
                    style: uZ({
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
                    }, e.style)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(r)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                }), n))
            });

            function u1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function u2(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function u4(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function u3(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function u6(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || u8(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u5(e) {
                return function(e) {
                    if (Array.isArray(e)) return u1(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || u8(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u8(e, t) {
                if (e) {
                    if ("string" == typeof e) return u1(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return u1(e, t)
                }
            }
            u0.displayName = "VisuallyHidden";
            var u7 = u6(am("Tooltip", [ux]), 2),
                u9 = u7[0];
            u7[1];
            var ce = ux(),
                ct = "TooltipProvider",
                cn = "tooltip.open",
                cr = u6(u9(ct), 2),
                co = cr[0],
                ci = cr[1],
                ca = function(e) {
                    var t = e.__scopeTooltip,
                        n = e.delayDuration,
                        r = e.skipDelayDuration,
                        o = void 0 === r ? 300 : r,
                        i = e.disableHoverableContent,
                        a = e.children,
                        l = u6(e9.useState(!0), 2),
                        u = l[0],
                        c = l[1],
                        s = e9.useRef(!1),
                        f = e9.useRef(0);
                    return e9.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, e7.jsx)(co, {
                        scope: t,
                        isOpenDelayed: u,
                        delayDuration: void 0 === n ? 700 : n,
                        onOpen: e9.useCallback(function() {
                            window.clearTimeout(f.current), c(!1)
                        }, []),
                        onClose: e9.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return c(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: e9.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== i && i,
                        children: a
                    })
                };
            ca.displayName = ct;
            var cl = "Tooltip",
                cu = u6(u9(cl), 2),
                cc = cu[0],
                cs = cu[1],
                cf = function(e) {
                    var t, n, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h, g, O, S, w, E = e.__scopeTooltip,
                        A = e.children,
                        N = e.open,
                        j = e.defaultOpen,
                        x = e.onOpenChange,
                        I = e.disableHoverableContent,
                        T = e.delayDuration,
                        P = ci(cl, e.__scopeTooltip),
                        D = ce(E),
                        _ = u6(e9.useState(null), 2),
                        C = _[0],
                        L = _[1],
                        R = (f = (c = e9.useState(aS()), s = function(e) {
                            if (Array.isArray(e)) return e
                        }(c) || function(e, t) {
                            var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    l = !1;
                                try {
                                    for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                                } catch (e) {
                                    l = !0, r = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (l) throw r
                                    }
                                }
                                return i
                            }
                        }(c, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aO(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aO(e, t)
                            }
                        }(c, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], d = s[1], ag(function() {
                            d(function(e) {
                                return null != e ? e : String(aw++)
                            })
                        }, [u]), u || (f ? "radix-".concat(f) : "")),
                        U = e9.useRef(0),
                        k = null != I ? I : P.disableHoverableContent,
                        M = null != T ? T : P.delayDuration,
                        W = e9.useRef(!1),
                        F = u6((y = (p = {
                            prop: N,
                            defaultProp: void 0 !== j && j,
                            onChange: function(e) {
                                e ? (P.onOpen(), document.dispatchEvent(new CustomEvent(cn))) : P.onClose(), null == x || x(e)
                            }
                        }).prop, h = (b = uJ((n = (t = {
                            defaultProp: p.defaultProp,
                            onChange: m = void 0 === (v = p.onChange) ? function() {} : v
                        }).defaultProp, r = t.onChange, i = uJ(o = e9.useState(n), 1)[0], a = e9.useRef(i), l = uv(r), e9.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], g = b[1], S = (O = void 0 !== y) ? y : h, w = uv(m), [S, e9.useCallback(function(e) {
                            if (O) {
                                var t = "function" == typeof e ? e(y) : e;
                                t !== y && w(t)
                            } else g(e)
                        }, [O, y, g, w])]), 2),
                        V = F[0],
                        K = void 0 !== V && V,
                        B = F[1],
                        z = e9.useMemo(function() {
                            return K ? W.current ? "delayed-open" : "instant-open" : "closed"
                        }, [K]),
                        H = e9.useCallback(function() {
                            window.clearTimeout(U.current), U.current = 0, W.current = !1, B(!0)
                        }, [B]),
                        Y = e9.useCallback(function() {
                            window.clearTimeout(U.current), U.current = 0, B(!1)
                        }, [B]),
                        G = e9.useCallback(function() {
                            window.clearTimeout(U.current), U.current = window.setTimeout(function() {
                                W.current = !0, B(!0), U.current = 0
                            }, M)
                        }, [M, B]);
                    return e9.useEffect(function() {
                        return function() {
                            U.current && (window.clearTimeout(U.current), U.current = 0)
                        }
                    }, []), (0, e7.jsx)(uD, u4(u2({}, D), {
                        children: (0, e7.jsx)(cc, {
                            scope: E,
                            contentId: R,
                            open: K,
                            stateAttribute: z,
                            trigger: C,
                            onTriggerChange: L,
                            onTriggerEnter: e9.useCallback(function() {
                                P.isOpenDelayed ? G() : H()
                            }, [P.isOpenDelayed, G, H]),
                            onTriggerLeave: e9.useCallback(function() {
                                k ? Y() : (window.clearTimeout(U.current), U.current = 0)
                            }, [Y, k]),
                            onOpen: H,
                            onClose: Y,
                            disableHoverableContent: k,
                            children: A
                        })
                    }))
                };
            cf.displayName = cl;
            var cd = "TooltipTrigger",
                cp = e9.forwardRef(function(e, t) {
                    var n = e.__scopeTooltip,
                        r = u3(e, ["__scopeTooltip"]),
                        o = cs(cd, n),
                        i = ci(cd, n),
                        a = ce(n),
                        l = af(t, e9.useRef(null), o.onTriggerChange),
                        u = e9.useRef(!1),
                        c = e9.useRef(!1),
                        s = e9.useCallback(function() {
                            return u.current = !1
                        }, []);
                    return e9.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, e7.jsx)(uC, u4(u2({
                        asChild: !0
                    }, a), {
                        children: (0, e7.jsx)(ud.button, u4(u2({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, r), {
                            ref: l,
                            onPointerMove: al(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (c.current || i.isPointerInTransitRef.current || (o.onTriggerEnter(), c.current = !0))
                            }),
                            onPointerLeave: al(e.onPointerLeave, function() {
                                o.onTriggerLeave(), c.current = !1
                            }),
                            onPointerDown: al(e.onPointerDown, function() {
                                u.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: al(e.onFocus, function() {
                                u.current || o.onOpen()
                            }),
                            onBlur: al(e.onBlur, o.onClose),
                            onClick: al(e.onClick, o.onClose)
                        }))
                    }))
                });
            cp.displayName = cd;
            var cy = "TooltipPortal",
                cv = u6(u9(cy, {
                    forceMount: void 0
                }), 2),
                cm = cv[0],
                cb = cv[1],
                ch = function(e) {
                    var t = e.__scopeTooltip,
                        n = e.forceMount,
                        r = e.children,
                        o = e.container,
                        i = cs(cy, t);
                    return (0, e7.jsx)(cm, {
                        scope: t,
                        forceMount: n,
                        children: (0, e7.jsx)(u$, {
                            present: n || i.open,
                            children: (0, e7.jsx)(uY, {
                                asChild: !0,
                                container: o,
                                children: r
                            })
                        })
                    })
                };
            ch.displayName = cy;
            var cg = "TooltipContent",
                cO = e9.forwardRef(function(e, t) {
                    var n = cb(cg, e.__scopeTooltip),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = e.side,
                        a = void 0 === i ? "top" : i,
                        l = u3(e, ["forceMount", "side"]),
                        u = cs(cg, e.__scopeTooltip);
                    return (0, e7.jsx)(u$, {
                        present: o || u.open,
                        children: u.disableHoverableContent ? (0, e7.jsx)(cN, u4(u2({
                            side: a
                        }, l), {
                            ref: t
                        })) : (0, e7.jsx)(cS, u4(u2({
                            side: a
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                cS = e9.forwardRef(function(e, t) {
                    var n = cs(cg, e.__scopeTooltip),
                        r = ci(cg, e.__scopeTooltip),
                        o = e9.useRef(null),
                        i = af(t, o),
                        a = u6(e9.useState(null), 2),
                        l = a[0],
                        u = a[1],
                        c = n.trigger,
                        s = n.onClose,
                        f = o.current,
                        d = r.onPointerInTransitChange,
                        p = e9.useCallback(function() {
                            u(null), d(!1)
                        }, [d]),
                        y = e9.useCallback(function(e, t) {
                            var n, r, o, i, a, l, c = e.currentTarget,
                                s = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                f = function(e, t) {
                                    var n = Math.abs(t.top - e.y),
                                        r = Math.abs(t.bottom - e.y),
                                        o = Math.abs(t.right - e.x),
                                        i = Math.abs(t.left - e.x);
                                    switch (Math.min(n, r, o, i)) {
                                        case i:
                                            return "left";
                                        case o:
                                            return "right";
                                        case n:
                                            return "top";
                                        case r:
                                            return "bottom";
                                        default:
                                            throw Error("unreachable")
                                    }
                                }(s, c.getBoundingClientRect()),
                                p = function(e, t) {
                                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                        r = [];
                                    switch (t) {
                                        case "top":
                                            r.push({
                                                x: e.x - n,
                                                y: e.y + n
                                            }, {
                                                x: e.x + n,
                                                y: e.y + n
                                            });
                                            break;
                                        case "bottom":
                                            r.push({
                                                x: e.x - n,
                                                y: e.y - n
                                            }, {
                                                x: e.x + n,
                                                y: e.y - n
                                            });
                                            break;
                                        case "left":
                                            r.push({
                                                x: e.x + n,
                                                y: e.y - n
                                            }, {
                                                x: e.x + n,
                                                y: e.y + n
                                            });
                                            break;
                                        case "right":
                                            r.push({
                                                x: e.x - n,
                                                y: e.y - n
                                            }, {
                                                x: e.x - n,
                                                y: e.y + n
                                            })
                                    }
                                    return r
                                }(s, f),
                                y = (r = (n = t.getBoundingClientRect()).top, o = n.right, i = n.bottom, [{
                                    x: a = n.left,
                                    y: r
                                }, {
                                    x: o,
                                    y: r
                                }, {
                                    x: o,
                                    y: i
                                }, {
                                    x: a,
                                    y: i
                                }]);
                            u(((l = u5(p).concat(u5(y)).slice()).sort(function(e, t) {
                                return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)
                            }), function(e) {
                                if (e.length <= 1) return e.slice();
                                for (var t = [], n = 0; n < e.length; n++) {
                                    for (var r = e[n]; t.length >= 2;) {
                                        var o = t[t.length - 1],
                                            i = t[t.length - 2];
                                        if ((o.x - i.x) * (r.y - i.y) >= (o.y - i.y) * (r.x - i.x)) t.pop();
                                        else break
                                    }
                                    t.push(r)
                                }
                                t.pop();
                                for (var a = [], l = e.length - 1; l >= 0; l--) {
                                    for (var u = e[l]; a.length >= 2;) {
                                        var c = a[a.length - 1],
                                            s = a[a.length - 2];
                                        if ((c.x - s.x) * (u.y - s.y) >= (c.y - s.y) * (u.x - s.x)) a.pop();
                                        else break
                                    }
                                    a.push(u)
                                }
                                return (a.pop(), 1 === t.length && 1 === a.length && t[0].x === a[0].x && t[0].y === a[0].y) ? t : t.concat(a)
                            }(l))), d(!0)
                        }, [d]);
                    return e9.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), e9.useEffect(function() {
                        if (c && f) {
                            var e = function(e) {
                                    return y(e, f)
                                },
                                t = function(e) {
                                    return y(e, c)
                                };
                            return c.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t),
                                function() {
                                    c.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [c, f, y, p]), e9.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    n = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    r = (null == c ? void 0 : c.contains(t)) || (null == f ? void 0 : f.contains(t)),
                                    o = ! function(e, t) {
                                        for (var n = e.x, r = e.y, o = !1, i = 0, a = t.length - 1; i < t.length; a = i++) {
                                            var l = t[i].x,
                                                u = t[i].y,
                                                c = t[a].x,
                                                s = t[a].y;
                                            u > r != s > r && n < (c - l) * (r - u) / (s - u) + l && (o = !o)
                                        }
                                        return o
                                    }(n, l);
                                r ? p() : o && (p(), s())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }, [c, f, l, s, p]), (0, e7.jsx)(cN, u4(u2({}, e), {
                        ref: i
                    }))
                }),
                cw = u6(u9(cl, {
                    isInside: !1
                }), 2),
                cE = cw[0],
                cA = cw[1],
                cN = e9.forwardRef(function(e, t) {
                    var n = e.__scopeTooltip,
                        r = e.children,
                        o = e["aria-label"],
                        i = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        l = u3(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        u = cs(cg, n),
                        c = ce(n),
                        s = u.onClose;
                    return e9.useEffect(function() {
                        return document.addEventListener(cn, s),
                            function() {
                                return document.removeEventListener(cn, s)
                            }
                    }, [s]), e9.useEffect(function() {
                        if (u.trigger) {
                            var e = function(e) {
                                var t = e.target;
                                (null == t ? void 0 : t.contains(u.trigger)) && s()
                            };
                            return window.addEventListener("scroll", e, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", e, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [u.trigger, s]), (0, e7.jsx)(ah.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: i,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, e7.jsxs)(uM, u4(u2({
                            "data-state": u.stateAttribute
                        }, c, l), {
                            ref: t,
                            style: u2({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, e7.jsx)(ul, {
                                children: r
                            }), (0, e7.jsx)(cE, {
                                scope: n,
                                isInside: !0,
                                children: (0, e7.jsx)(u0, {
                                    id: u.contentId,
                                    role: "tooltip",
                                    children: o || r
                                })
                            })]
                        }))
                    })
                });
            cO.displayName = cg;
            var cj = "TooltipArrow",
                cx = e9.forwardRef(function(e, t) {
                    var n = e.__scopeTooltip,
                        r = u3(e, ["__scopeTooltip"]),
                        o = ce(n);
                    return cA(cj, n).isInside ? null : (0, e7.jsx)(uV, u4(u2({}, o, r), {
                        ref: t
                    }))
                });

            function cI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function cT(e) {
                var t, n = e.position,
                    r = e.hasBeak,
                    o = e.title,
                    i = e.description,
                    a = e.ariaLabel,
                    l = e.delayDurationMs,
                    u = e.children,
                    c = e.open,
                    s = e.onOpenChange,
                    f = e.contentClassName,
                    d = (t = n.split("-"), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return cI(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return cI(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    p = d[0],
                    y = d[1],
                    v = null != a ? a : "string" == typeof o && null == i ? o : void 0;
                return e9.createElement(ca, {
                    delayDuration: void 0 === l ? 500 : l
                }, e9.createElement(cf, {
                    open: c,
                    onOpenChange: s
                }, u, e9.createElement(ch, null, e9.createElement(cO, {
                    side: p,
                    align: y,
                    "aria-label": v,
                    className: i5("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === r || r) && e9.createElement(cx, {
                    asChild: !0
                }, e9.createElement(aa, {
                    className: "content-[var(--inverse-surface-0)]"
                })), e9.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, e9.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), i && e9.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, i))))))
            }

            function cP(e) {
                var t = e.children,
                    n = e.asChild,
                    r = e.className;
                return e9.createElement(cp, {
                    asChild: n,
                    className: r
                }, t)
            }
            cx.displayName = cj;
            var cD = "opacity-[0.5]";

            function c_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function cC(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function cL() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = cC(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : cC(t[e], null)
                        }
                    }
                }
            }

            function cR() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return e9.useCallback(cL.apply(void 0, function(e) {
                    if (Array.isArray(e)) return c_(e)
                }(t) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return c_(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return c_(e, t)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function cU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ck(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function cM(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function cW(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function cF(e) {
                return function(e) {
                    if (Array.isArray(e)) return cU(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return cU(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return cU(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cV(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var cK = Symbol.for("react.lazy"),
                cB = e9[" use ".trim().toString()];

            function cz(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : cV(e)) === "object" && "$$typeof" in e && e.$$typeof === cK && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : cV(t)) === "object" && null !== t && "then" in t
            }
            var cH = ((e = e9.forwardRef(function(e, t) {
                    var n = e.children,
                        r = cW(e, ["children"]);
                    if (cz(n) && "function" == typeof cB && (n = cB(n._payload)), e9.isValidElement(n)) {
                        var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var n = ck({}, t);
                                for (var r in t) ! function(r) {
                                    var o = e[r],
                                        i = t[r];
                                    /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = i.apply(void 0, cF(t));
                                        return o.apply(void 0, cF(t)), r
                                    } : o && (n[r] = o) : "style" === r ? n[r] = ck({}, o, i) : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                                }(r);
                                return ck({}, e, n)
                            }(r, n.props);
                        return n.type !== e9.Fragment && (s.ref = t ? cL(t, c) : c), e9.cloneElement(n, s)
                    }
                    return e9.Children.count(n) > 1 ? e9.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), H = e, (Y = e9.forwardRef(function(e, t) {
                    var n = e.children,
                        r = cW(e, ["children"]);
                    cz(n) && "function" == typeof cB && (n = cB(n._payload));
                    var o = e9.Children.toArray(n),
                        i = o.find(cG);
                    if (i) {
                        var a = i.props.children,
                            l = o.map(function(e) {
                                return e !== i ? e : e9.Children.count(a) > 1 ? e9.Children.only(null) : e9.isValidElement(a) ? a.props.children : null
                            });
                        return (0, e7.jsx)(H, cM(ck({}, r), {
                            ref: t,
                            children: e9.isValidElement(a) ? e9.cloneElement(a, void 0, l) : null
                        }))
                    }
                    return (0, e7.jsx)(H, cM(ck({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), Y),
                cY = Symbol("radix.slottable");

            function cG(e) {
                return e9.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === cY
            }

            function cX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function c$(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function cQ(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }
            var cq = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                cJ = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                cZ = {
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
                c0 = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                c1 = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                c2 = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                c4 = {
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
                c3 = {
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
                c6 = (0, e9.forwardRef)(function(e, t) {
                    var n, r = e.className,
                        o = e.icon,
                        i = e.ariaLabel,
                        a = e.isDisabled,
                        l = void 0 !== a && a,
                        u = e.isCircular,
                        c = e.isSelected,
                        s = e.size,
                        f = void 0 === s ? "Large" : s,
                        d = e.variant,
                        p = void 0 === d ? "Emphasis" : d,
                        y = e.iconColor,
                        v = void 0 === y ? "Default" : y,
                        m = e.asChild,
                        b = e.children,
                        h = cQ(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    n = l ? c1[p] : void 0 !== c && c ? c2[p] : c0[p];
                    var g = i5("foundation-web-icon-button", l ? cD : [i8, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", cq[f], cZ[f][void 0 !== u && u ? "circular" : "square"], n, r),
                        O = te().createElement(te().Fragment, null, te().createElement(i7, null), te().createElement("span", {
                            className: i5("icon", o, cJ[f], l ? c3[v][p] : c4[v][p])
                        }));
                    if (m) {
                        h.as;
                        var S = cQ(h, ["as"]),
                            w = te().Children.only(b);
                        return te().createElement(cH, c$(cX({
                            ref: t
                        }, S), {
                            className: g,
                            "aria-label": i,
                            "aria-disabled": l || void 0
                        }), te().cloneElement(w, {}, O))
                    }
                    if ("a" === h.as) {
                        h.as;
                        var E = h.href,
                            A = cQ(h, ["as", "href"]);
                        return te().createElement("a", c$(cX({
                            ref: t
                        }, A), {
                            "aria-label": i,
                            "aria-disabled": l,
                            href: l ? void 0 : E,
                            className: g
                        }), O)
                    }
                    h.as;
                    var N = cQ(h, ["as"]);
                    return te().createElement("button", c$(cX({
                        ref: t,
                        type: "button"
                    }, N), {
                        "aria-label": i,
                        disabled: l,
                        className: g
                    }), O)
                }),
                c5 = function(e) {
                    var t = e.width,
                        n = e.height;
                    return te().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, te().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                c8 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                c7 = te().forwardRef(function(e, t) {
                    var n = e.name,
                        r = e.size,
                        o = e.className,
                        i = (e.children, function(e, t) {
                            if (null == e) return {};
                            var n, r, o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = {},
                                    i = Object.keys(e);
                                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                            }
                            return o
                        }(e, ["name", "size", "className", "children"]));
                    return te().createElement("span", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        ref: t,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: i5("grow-0 shrink-0 basis-auto icon", n, c8[void 0 === r ? "Medium" : r], o)
                    }, i))
                });

            function c9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function se(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function st(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }
            c7.displayName = "Icon";
            var sn = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                sr = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                so = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                si = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                sa = (0, e9.forwardRef)(function(e, t) {
                    var n = e.children,
                        r = e.className,
                        o = e.style,
                        i = e.isDisabled,
                        a = void 0 !== i && i,
                        l = e.isLoading,
                        u = void 0 !== l && l,
                        c = e.icon,
                        s = e.size,
                        f = void 0 === s ? "Large" : s,
                        d = e.variant,
                        p = void 0 === d ? "Emphasis" : d,
                        y = e.asChild,
                        v = st(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        m = i5("foundation-web-button", a ? cD : [i8, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", sr[f], a ? si[p] : so[p], r),
                        b = c9({
                            textDecoration: "none"
                        }, o),
                        h = function(e) {
                            return te().createElement(te().Fragment, null, te().createElement(i7, null), u && te().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, te().createElement(c5, {
                                width: sn[f],
                                height: sn[f]
                            })), te().createElement("span", {
                                className: i5("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", u && "invisible")
                            }, c && te().createElement(c7, {
                                name: c,
                                size: f
                            }), te().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (y) {
                        v.as;
                        var g = st(v, ["as"]),
                            O = te().Children.only(n);
                        return te().createElement(cH, se(c9({
                            ref: t
                        }, g), {
                            className: m,
                            style: b,
                            "aria-disabled": a || void 0
                        }), te().cloneElement(O, {}, h(O.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var S = v.href,
                            w = st(v, ["as", "href"]);
                        return te().createElement("a", se(c9({
                            ref: t
                        }, w), {
                            "aria-disabled": a,
                            href: a ? void 0 : S,
                            className: m,
                            style: b
                        }), h(n))
                    }
                    v.as;
                    var E = st(v, ["as"]);
                    return te().createElement("button", se(c9({
                        ref: t,
                        type: "button"
                    }, E), {
                        disabled: a,
                        className: m,
                        style: b
                    }), h(n))
                }),
                sl = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                su = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                sc = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        o = e.className,
                        i = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = {},
                                    i = Object.keys(e);
                                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                            }
                            return o
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return te().createElement("button", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        type: "button",
                        className: i5("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", i8, su[t], sl[n], r && "radius-circle", o)
                    }, i), te().createElement(i7, null), te().createElement(c7, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function ss(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    o = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === o || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function sf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sd(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function sp(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        sd(e, t, n[t])
                    })
                }
                return e
            }

            function sy(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function sv(e) {
                return function(e) {
                    if (Array.isArray(e)) return sf(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sf(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sf(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sm() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                o = n.scopeName;
                            return sp({}, e, r(t)["__scope".concat(o)])
                        }, {});
                        return e9.useMemo(function() {
                            return sd({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return o.scopeName = r.scopeName, o
            }
            var sb = (null == (eD = globalThis) ? void 0 : eD.document) ? e9.useLayoutEffect : function() {};

            function sh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var sg = e9[" useId ".trim().toString()] || function() {},
                sO = 0;

            function sS(e) {
                var t, n = (t = e9.useState(sg()), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return sh(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sh(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    r = n[0],
                    o = n[1];
                return sb(function() {
                    e || o(function(e) {
                        return null != e ? e : String(sO++)
                    })
                }, [e]), e || (r ? "radix-".concat(r) : "")
            }

            function sw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sE(e) {
                var t = e9.useRef(e);
                return e9.useEffect(function() {
                    t.current = e
                }), e9.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return sw(e)
                        }(r) || function(e) {
                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return sw(e, void 0);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sw(e, t)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function sA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sN(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sA(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sA(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sx(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function sI(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function sT(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function sP(e) {
                return function(e) {
                    if (Array.isArray(e)) return sj(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sj(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sj(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sD(e) {
                var t, n, r = (t = e, (n = e9.forwardRef(function(e, t) {
                        var n = e.children,
                            r = sT(e, ["children"]);
                        if (e9.isValidElement(n)) {
                            var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var n = sx({}, t);
                                    for (var r in t) ! function(r) {
                                        var o = e[r],
                                            i = t[r];
                                        /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            i.apply(void 0, sP(t)), o.apply(void 0, sP(t))
                                        } : o && (n[r] = o) : "style" === r ? n[r] = sx({}, o, i) : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                                    }(r);
                                    return sx({}, e, n)
                                }(r, n.props);
                            return n.type !== e9.Fragment && (s.ref = t ? cL(t, c) : c), e9.cloneElement(n, s)
                        }
                        return e9.Children.count(n) > 1 ? e9.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    o = e9.forwardRef(function(e, t) {
                        var n = e.children,
                            o = sT(e, ["children"]),
                            i = e9.Children.toArray(n),
                            a = i.find(sC);
                        if (a) {
                            var l = a.props.children,
                                u = i.map(function(e) {
                                    return e !== a ? e : e9.Children.count(l) > 1 ? e9.Children.only(null) : e9.isValidElement(l) ? l.props.children : null
                                });
                            return (0, e7.jsx)(r, sI(sx({}, o), {
                                ref: t,
                                children: e9.isValidElement(l) ? e9.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, e7.jsx)(r, sI(sx({}, o), {
                            ref: t,
                            children: n
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var s_ = Symbol("radix.slottable");

            function sC(e) {
                return e9.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === s_
            }

            function sL(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function sR(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        sL(e, t, n[t])
                    })
                }
                return e
            }

            function sU(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var sk = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var n = sD("Primitive.".concat(t)),
                    r = e9.forwardRef(function(e, r) {
                        var o = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = {},
                                        i = Object.keys(e);
                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                }
                                return o
                            }(e, ["asChild"]),
                            a = o ? n : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, e7.jsx)(a, sU(sR({}, i), {
                            ref: r
                        }))
                    });
                return r.displayName = "Primitive.".concat(t), sU(sR({}, e), sL({}, t, r))
            }, {});

            function sM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sW(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || sF(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sF(e, t) {
                if (e) {
                    if ("string" == typeof e) return sM(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sM(e, t)
                }
            }
            var sV = "focusScope.autoFocusOnMount",
                sK = "focusScope.autoFocusOnUnmount",
                sB = {
                    bubbles: !1,
                    cancelable: !0
                },
                sz = e9.forwardRef(function(e, t) {
                    var n, r, o = e.loop,
                        i = void 0 !== o && o,
                        a = e.trapped,
                        l = void 0 !== a && a,
                        u = e.onMountAutoFocus,
                        c = e.onUnmountAutoFocus,
                        s = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = {},
                                    i = Object.keys(e);
                                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                return o
                            }(e, t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(e);
                                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                            }
                            return o
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = sW(e9.useState(null), 2),
                        d = f[0],
                        p = f[1],
                        y = sE(u),
                        v = sE(c),
                        m = e9.useRef(null),
                        b = cR(t, function(e) {
                            return p(e)
                        }),
                        h = e9.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    e9.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!h.paused && d) {
                                        var t = e.target;
                                        d.contains(t) ? m.current = t : sG(m.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!h.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || sG(m.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var n = new MutationObserver(function(e) {
                                if (document.activeElement === document.body) {
                                    var t = !0,
                                        n = !1,
                                        r = void 0;
                                    try {
                                        for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) o.value.removedNodes.length > 0 && sG(d)
                                    } catch (e) {
                                        n = !0, r = e
                                    } finally {
                                        try {
                                            t || null == i.return || i.return()
                                        } finally {
                                            if (n) throw r
                                        }
                                    }
                                }
                            });
                            return d && n.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                                }
                        }
                    }, [l, d, h.paused]), e9.useEffect(function() {
                        if (d) {
                            sX.add(h);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(sV, sB);
                                d.addEventListener(sV, y), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        n = t.select,
                                        r = void 0 !== n && n,
                                        o = document.activeElement,
                                        i = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var u, c = e[Symbol.iterator](); !(i = (u = c.next()).done); i = !0) {
                                            var s = u.value;
                                            if (sG(s, {
                                                    select: r
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        a = !0, l = e
                                    } finally {
                                        try {
                                            i || null == c.return || c.return()
                                        } finally {
                                            if (a) throw l
                                        }
                                    }
                                }(sH(d).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && sG(d))
                            }
                            return function() {
                                d.removeEventListener(sV, y), setTimeout(function() {
                                    var t = new CustomEvent(sK, sB);
                                    d.addEventListener(sK, v), d.dispatchEvent(t), t.defaultPrevented || sG(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(sK, v), sX.remove(h)
                                }, 0)
                            }
                        }
                    }, [d, y, v, h]);
                    var g = e9.useCallback(function(e) {
                        if ((i || l) && !h.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                n = document.activeElement;
                            if (t && n) {
                                var r, o, a = e.currentTarget,
                                    u = sW([sY(o = sH(r = a), r), sY(o.reverse(), r)], 2),
                                    c = u[0],
                                    s = u[1];
                                c && s ? e.shiftKey || n !== s ? e.shiftKey && n === c && (e.preventDefault(), i && sG(s, {
                                    select: !0
                                })) : (e.preventDefault(), i && sG(c, {
                                    select: !0
                                })) : n === a && e.preventDefault()
                            }
                        }
                    }, [i, l, h.paused]);
                    return (0, e7.jsx)(sk.div, (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({
                        tabIndex: -1
                    }, s), r = r = {
                        ref: b,
                        onKeyDown: g
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n))
                });

            function sH(e) {
                for (var t = [], n = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); n.nextNode();) t.push(n.currentNode);
                return t
            }

            function sY(e, t) {
                var n = !0,
                    r = !1,
                    o = void 0;
                try {
                    for (var i, a = e[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                        var l = i.value;
                        if (! function(e, t) {
                                var n = t.upTo;
                                if ("hidden" === getComputedStyle(e).visibility) return !0;
                                for (; e && (void 0 === n || e !== n);) {
                                    if ("none" === getComputedStyle(e).display) return !0;
                                    e = e.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: t
                            })) return l
                    }
                } catch (e) {
                    r = !0, o = e
                } finally {
                    try {
                        n || null == a.return || a.return()
                    } finally {
                        if (r) throw o
                    }
                }
            }

            function sG(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = t.select;
                if (e && e.focus) {
                    var r, o, i, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (o = r = e, null != (i = HTMLInputElement) && "undefined" != typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) && "select" in r && void 0 !== n && n && e.select()
                }
            }
            sz.displayName = "FocusScope";
            var sX = (t = [], {
                add: function(e) {
                    var n = t[0];
                    e !== n && (null == n || n.pause()), (t = s$(t, e)).unshift(e)
                },
                remove: function(e) {
                    var n;
                    null == (n = (t = s$(t, e))[0]) || n.resume()
                }
            });

            function s$(e, t) {
                var n = function(e) {
                        if (Array.isArray(e)) return sM(e)
                    }(e) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || sF(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = n.indexOf(t);
                return -1 !== r && n.splice(r, 1), n
            }

            function sQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var sq = e9.forwardRef(function(e, t) {
                var n, r, o, i, a, l = e.container,
                    u = function(e, t) {
                        if (null == e) return {};
                        var n, r, o = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = {},
                                i = Object.keys(e);
                            for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                            return o
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                        }
                        return o
                    }(e, ["container"]),
                    c = (n = e9.useState(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(n) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                l = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                l = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (l) throw r
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return sQ(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sQ(e, t)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    s = c[0],
                    f = c[1];
                sb(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return d ? tn().createPortal((0, e7.jsx)(sk.div, (r = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }({}, u), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(o, e))
                }), r)), d) : null
            });

            function sJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sJ(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sJ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            sq.displayName = "Portal";
            var s0 = function(e) {
                var t, n, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h = e.present,
                    g = e.children,
                    O = (t = h, i = (o = sZ(e9.useState(), 2))[0], a = o[1], l = e9.useRef({}), u = e9.useRef(t), c = e9.useRef("none"), f = (s = sZ((n = t ? "mounted" : "unmounted", r = {
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
                    }, e9.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], d = s[1], e9.useEffect(function() {
                        var e = s1(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), sb(function() {
                        var e = l.current,
                            n = u.current;
                        if (n !== t) {
                            var r = c.current,
                                o = s1(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : n && r !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), u.current = t
                        }
                    }, [t, d]), sb(function() {
                        if (i) {
                            var e, t, n = null != (t = i.ownerDocument.defaultView) ? t : window,
                                r = function(t) {
                                    var r = s1(l.current).includes(t.animationName);
                                    if (t.target === i && r && (d("ANIMATION_END"), !u.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", e = n.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (c.current = s1(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(e), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                                }
                        }
                        d("ANIMATION_END")
                    }, [i, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: e9.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    S = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : e9.Children.only(g),
                    w = cR(O.ref, (b = (m = null == (y = Object.getOwnPropertyDescriptor((p = S).props, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? p.ref : (b = (m = null == (v = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? e9.cloneElement(S, {
                    ref: w
                }) : null
            };

            function s1(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            s0.displayName = "Presence";
            var s2 = window.RadixUI["react-focus-guards"],
                s4 = function() {
                    return (s4 = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function s3(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) 0 > t.indexOf(r[o]) && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]]);
                return n
            }
            var s6 = "right-scroll-bar-position",
                s5 = "width-before-scroll-bar";

            function s8(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var s7 = "undefined" != typeof window ? e9.useLayoutEffect : e9.useEffect,
                s9 = new WeakMap,
                fe = (void 0 === G && (G = {}), (void 0 === X && (X = function(e) {
                    return e
                }), $ = [], Q = !1, q = {
                    read: function() {
                        if (Q) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return $.length ? $[$.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = X(e, Q);
                        return $.push(t),
                            function() {
                                $ = $.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (Q = !0; $.length;) {
                            var t = $;
                            $ = [], t.forEach(e)
                        }
                        $ = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return $
                            }
                        }
                    },
                    assignMedium: function(e) {
                        Q = !0;
                        var t = [];
                        if ($.length) {
                            var n = $;
                            $ = [], n.forEach(e), t = $
                        }
                        var r = function() {
                                var n = t;
                                t = [], n.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(r)
                            };
                        o(), $ = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), $
                            }
                        }
                    }
                }).options = s4({
                    async: !0,
                    ssr: !1
                }, G), q),
                ft = function() {},
                fn = e9.forwardRef(function(e, t) {
                    var n, r, o, i, a = e9.useRef(null),
                        l = e9.useState({
                            onScrollCapture: ft,
                            onWheelCapture: ft,
                            onTouchMoveCapture: ft
                        }),
                        u = l[0],
                        c = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        d = e.className,
                        p = e.removeScrollBar,
                        y = e.enabled,
                        v = e.shards,
                        m = e.sideCar,
                        b = e.noRelative,
                        h = e.noIsolation,
                        g = e.inert,
                        O = e.allowPinchZoom,
                        S = e.as,
                        w = e.gapMode,
                        E = s3(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        A = (n = [a, t], r = function(e) {
                            return n.forEach(function(t) {
                                return s8(t, e)
                            })
                        }, (o = (0, e9.useState)(function() {
                            return {
                                value: null,
                                callback: r,
                                facade: {
                                    get current() {
                                        return o.value
                                    },
                                    set current(value) {
                                        var e = o.value;
                                        e !== value && (o.value = value, o.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = r, i = o.facade, s7(function() {
                            var e = s9.get(i);
                            if (e) {
                                var t = new Set(e),
                                    r = new Set(n),
                                    o = i.current;
                                t.forEach(function(e) {
                                    r.has(e) || s8(e, null)
                                }), r.forEach(function(e) {
                                    t.has(e) || s8(e, o)
                                })
                            }
                            s9.set(i, n)
                        }, [n]), i),
                        N = s4(s4({}, E), u);
                    return e9.createElement(e9.Fragment, null, y && e9.createElement(m, {
                        sideCar: fe,
                        removeScrollBar: p,
                        shards: v,
                        noRelative: b,
                        noIsolation: h,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!O,
                        lockRef: a,
                        gapMode: w
                    }), s ? e9.cloneElement(e9.Children.only(f), s4(s4({}, N), {
                        ref: A
                    })) : e9.createElement(void 0 === S ? "div" : S, s4({}, N, {
                        className: d,
                        ref: A
                    }), f))
                });
            fn.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, fn.classNames = {
                fullWidth: s5,
                zeroRight: s6
            };
            var fr = function(e) {
                var t = e.sideCar,
                    n = s3(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var r = t.read();
                if (!r) throw Error("Sidecar medium not found");
                return e9.createElement(r, s4({}, n))
            };
            fr.isSideCarExport = !0;
            var fo = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = e_ || n.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, i;
                                (o = t).styleSheet ? o.styleSheet.cssText = r : o.appendChild(document.createTextNode(r)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                fi = function() {
                    var e = fo();
                    return function(t, n) {
                        e9.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && n])
                    }
                },
                fa = function() {
                    var e = fi();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                fl = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                fu = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                fc = function(e) {
                    var t = window.getComputedStyle(document.body),
                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [fu(n), fu(r), fu(o)]
                },
                fs = function(e) {
                    if (void 0 === e && (e = "margin"), "undefined" == typeof window) return fl;
                    var t = fc(e),
                        n = document.documentElement.clientWidth,
                        r = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, r - n + t[2] - t[0])
                    }
                },
                ff = fa(),
                fd = "data-scroll-locked",
                fp = function(e, t, n, r) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(l, "px ").concat(r, ";\n  }\n  body[").concat(fd, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(s6, " {\n    right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(s5, " {\n    margin-right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(s6, " .").concat(s6, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(s5, " .").concat(s5, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(fd, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                fy = function() {
                    var e = parseInt(document.body.getAttribute(fd) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                fv = function() {
                    e9.useEffect(function() {
                        return document.body.setAttribute(fd, (fy() + 1).toString()),
                            function() {
                                var e = fy() - 1;
                                e <= 0 ? document.body.removeAttribute(fd) : document.body.setAttribute(fd, e.toString())
                            }
                    }, [])
                },
                fm = function(e) {
                    var t = e.noRelative,
                        n = e.noImportant,
                        r = e.gapMode,
                        o = void 0 === r ? "margin" : r;
                    fv();
                    var i = e9.useMemo(function() {
                        return fs(o)
                    }, [o]);
                    return e9.createElement(ff, {
                        styles: fp(i, !t, o, n ? "" : "!important")
                    })
                },
                fb = !1;
            if ("undefined" != typeof window) try {
                var fh = Object.defineProperty({}, "passive", {
                    get: function() {
                        return fb = !0, !0
                    }
                });
                window.addEventListener("test", fh, fh), window.removeEventListener("test", fh, fh)
            } catch (e) {
                fb = !1
            }
            var fg = !!fb && {
                passive: !1
            };

            function fO(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var fS = function(e, t) {
                    if (!fO(e, Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
                },
                fw = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && fO(r, ShadowRoot) && (r = r.host), fE(e, r)) {
                            var o = fA(e, r);
                            if (o[1] > o[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                fE = function(e, t) {
                    return "v" === e ? fS(t, "overflowY") : fS(t, "overflowX")
                },
                fA = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                fN = function(e, t, n, r, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * r,
                        u = n.target,
                        c = t.contains(u),
                        s = !1,
                        f = l > 0,
                        d = 0,
                        p = 0;
                    do {
                        if (!u) break;
                        var y = fA(e, u),
                            v = y[0],
                            m = y[1] - y[2] - a * v;
                        (v || m) && fE(e, u) && (d += m, p += v);
                        var b = u.parentNode;
                        u = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return f && (o && 1 > Math.abs(d) || !o && l > d) ? s = !0 : !f && (o && 1 > Math.abs(p) || !o && -l > p) && (s = !0), s
                },
                fj = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                fx = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                fI = function(e) {
                    return e && "current" in e ? e.current : e
                },
                fT = 0,
                fP = [],
                fD = (J = function(e) {
                    var t = e9.useRef([]),
                        n = e9.useRef([0, 0]),
                        r = e9.useRef(),
                        o = e9.useState(fT++)[0],
                        i = e9.useState(fa)[0],
                        a = e9.useRef(e);
                    e9.useEffect(function() {
                        a.current = e
                    }, [e]), e9.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, n) {
                                if (n || 2 == arguments.length)
                                    for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(fI), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(o))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(o))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = e9.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = fj(e),
                                l = n.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                s = e.target,
                                f = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = fw(f, s);
                            if (!d) return !0;
                            if (d ? o = f : (o = "v" === f ? "h" : "v", d = fw(f, s)), !d) return !1;
                            if (!r.current && "changedTouches" in e && (u || c) && (r.current = o), !o) return !0;
                            var p = r.current || o;
                            return fN(p, t, e, "h" === p ? u : c, !0)
                        }, []),
                        u = e9.useCallback(function(e) {
                            if (fP.length && fP[fP.length - 1] === i) {
                                var n = "deltaY" in e ? fx(e) : fj(e),
                                    r = t.current.filter(function(t) {
                                        var r;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                                    })[0];
                                if (r && r.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!r) {
                                    var o = (a.current.shards || []).map(fI).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = e9.useCallback(function(e, n, r, o) {
                            var i = {
                                name: e,
                                delta: n,
                                target: r,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, n, r = null; null !== e;) t = e, (null != (n = ShadowRoot) && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n) && (r = e.host, e = e.host), e = e.parentNode;
                                    return r
                                }(r)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        s = e9.useCallback(function(e) {
                            n.current = fj(e), r.current = void 0
                        }, []),
                        f = e9.useCallback(function(t) {
                            c(t.type, fx(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        d = e9.useCallback(function(t) {
                            c(t.type, fj(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    e9.useEffect(function() {
                        return fP.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: d
                            }), document.addEventListener("wheel", u, fg), document.addEventListener("touchmove", u, fg), document.addEventListener("touchstart", s, fg),
                            function() {
                                fP = fP.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", u, fg), document.removeEventListener("touchmove", u, fg), document.removeEventListener("touchstart", s, fg)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        y = e.inert;
                    return e9.createElement(e9.Fragment, null, y ? e9.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, p ? e9.createElement(fm, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, fe.useMedium(J), fr),
                f_ = e9.forwardRef(function(e, t) {
                    return e9.createElement(fn, s4({}, e, {
                        ref: t,
                        sideCar: fD
                    }))
                });
            f_.classNames = fn.classNames;
            var fC = new WeakMap,
                fL = new WeakMap,
                fR = {},
                fU = 0,
                fk = function(e) {
                    return e && (e.host || fk(e.parentNode))
                },
                fM = function(e, t, n, r) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var n = fk(e);
                        return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    fR[n] || (fR[n] = new WeakMap);
                    var i = fR[n],
                        a = [],
                        l = new Set,
                        u = new Set(o),
                        c = function(e) {
                            !e || l.has(e) || (l.add(e), c(e.parentNode))
                        };
                    o.forEach(c);
                    var s = function(e) {
                        !e || u.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(r),
                                    o = null !== t && "false" !== t,
                                    u = (fC.get(e) || 0) + 1,
                                    c = (i.get(e) || 0) + 1;
                                fC.set(e, u), i.set(e, c), a.push(e), 1 === u && o && fL.set(e, !0), 1 === c && e.setAttribute(n, "true"), o || e.setAttribute(r, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), fU++,
                        function() {
                            a.forEach(function(e) {
                                var t = fC.get(e) - 1,
                                    o = i.get(e) - 1;
                                fC.set(e, t), i.set(e, o), t || (fL.has(e) || e.removeAttribute(r), fL.delete(e)), o || e.removeAttribute(n)
                            }), --fU || (fC = new WeakMap, fC = new WeakMap, fL = new WeakMap, fR = {})
                        }
                },
                fW = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live], script"))), fM(r, o, n, "aria-hidden")) : function() {
                        return null
                    }
                };

            function fF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function fV(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function fK(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function fB(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function fz(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return fF(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return fF(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var fH = "Dialog",
                fY = fz(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        r = function() {
                            var t = n.map(function(e) {
                                return e9.createContext(e)
                            });
                            return function(n) {
                                var r = (null == n ? void 0 : n[e]) || t;
                                return e9.useMemo(function() {
                                    var t, o;
                                    return sd({}, "__scope".concat(e), (t = sp({}, n), o = null != (o = sd({}, e, r)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                                        var n = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var r = Object.getOwnPropertySymbols(e);
                                            n.push.apply(n, r)
                                        }
                                        return n
                                    })(Object(o)).forEach(function(e) {
                                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                    }), t))
                                }, [n, r])
                            }
                        };
                    return r.scopeName = e, [function(t, r) {
                        var o = e9.createContext(r),
                            i = n.length;
                        n = sv(n).concat([r]);
                        var a = function(t) {
                            var n, r = t.scope,
                                a = t.children,
                                l = sy(t, ["scope", "children"]),
                                u = (null == r || null == (n = r[e]) ? void 0 : n[i]) || o,
                                c = e9.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, e7.jsx)(u.Provider, {
                                value: c,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(n, a) {
                            var l, u = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                                c = e9.useContext(u);
                            if (c) return c;
                            if (void 0 !== r) return r;
                            throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                        }]
                    }, sm.apply(void 0, [r].concat(sv(t)))]
                }(fH), 2),
                fG = fY[0];
            fY[1];
            var fX = fz(fG(fH), 2),
                f$ = fX[0],
                fQ = fX[1],
                fq = function(e) {
                    var t, n, r, o, i, a, l, u, c, s, f, d, p, y, v, m, b, h = e.__scopeDialog,
                        g = e.children,
                        O = e.open,
                        S = e.defaultOpen,
                        w = e.onOpenChange,
                        E = e.modal,
                        A = e9.useRef(null),
                        N = e9.useRef(null),
                        j = fz((c = (u = {
                            prop: O,
                            defaultProp: S,
                            onChange: w
                        }).prop, p = (d = sN((n = (t = {
                            defaultProp: u.defaultProp,
                            onChange: f = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, r = t.onChange, i = sN(o = e9.useState(n), 1)[0], a = e9.useRef(i), l = sE(r), e9.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], y = d[1], m = (v = void 0 !== c) ? c : p, b = sE(f), [m, e9.useCallback(function(e) {
                            if (v) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && b(t)
                            } else y(e)
                        }, [v, c, y, b])]), 2),
                        x = j[0],
                        I = j[1];
                    return (0, e7.jsx)(f$, {
                        scope: h,
                        triggerRef: A,
                        contentRef: N,
                        contentId: sS(),
                        titleId: sS(),
                        descriptionId: sS(),
                        open: void 0 !== x && x,
                        onOpenChange: I,
                        onOpenToggle: e9.useCallback(function() {
                            return I(function(e) {
                                return !e
                            })
                        }, [I]),
                        modal: void 0 === E || E,
                        children: g
                    })
                };
            fq.displayName = fH;
            var fJ = "DialogTrigger";
            e9.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = fB(e, ["__scopeDialog"]),
                    o = fQ(fJ, n),
                    i = cR(t, o.triggerRef);
                return (0, e7.jsx)(sk.button, fK(fV({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": dc(o.open)
                }, r), {
                    ref: i,
                    onClick: ss(e.onClick, o.onOpenToggle)
                }))
            }).displayName = fJ;
            var fZ = "DialogPortal",
                f0 = fz(fG(fZ, {
                    forceMount: void 0
                }), 2),
                f1 = f0[0],
                f2 = f0[1],
                f4 = function(e) {
                    var t = e.__scopeDialog,
                        n = e.forceMount,
                        r = e.children,
                        o = e.container,
                        i = fQ(fZ, t);
                    return (0, e7.jsx)(f1, {
                        scope: t,
                        forceMount: n,
                        children: e9.Children.map(r, function(e) {
                            return (0, e7.jsx)(s0, {
                                present: n || i.open,
                                children: (0, e7.jsx)(sq, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            f4.displayName = fZ;
            var f3 = "DialogOverlay",
                f6 = e9.forwardRef(function(e, t) {
                    var n = f2(f3, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = fB(e, ["forceMount"]),
                        a = fQ(f3, e.__scopeDialog);
                    return a.modal ? (0, e7.jsx)(s0, {
                        present: o || a.open,
                        children: (0, e7.jsx)(f8, fK(fV({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            f6.displayName = f3;
            var f5 = sD("DialogOverlay.RemoveScroll"),
                f8 = e9.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = fB(e, ["__scopeDialog"]),
                        o = fQ(f3, n);
                    return (0, e7.jsx)(f_, {
                        as: f5,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, e7.jsx)(sk.div, fK(fV({
                            "data-state": dc(o.open)
                        }, r), {
                            ref: t,
                            style: fV({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                }),
                f7 = "DialogContent",
                f9 = e9.forwardRef(function(e, t) {
                    var n = f2(f7, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = fB(e, ["forceMount"]),
                        a = fQ(f7, e.__scopeDialog);
                    return (0, e7.jsx)(s0, {
                        present: o || a.open,
                        children: a.modal ? (0, e7.jsx)(de, fK(fV({}, i), {
                            ref: t
                        })) : (0, e7.jsx)(dt, fK(fV({}, i), {
                            ref: t
                        }))
                    })
                });
            f9.displayName = f7;
            var de = e9.forwardRef(function(e, t) {
                    var n = fQ(f7, e.__scopeDialog),
                        r = e9.useRef(null),
                        o = cR(t, n.contentRef, r);
                    return e9.useEffect(function() {
                        var e = r.current;
                        if (e) return fW(e)
                    }, []), (0, e7.jsx)(dn, fK(fV({}, e), {
                        ref: o,
                        trapFocus: n.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: ss(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: ss(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        }),
                        onFocusOutside: ss(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                dt = e9.forwardRef(function(e, t) {
                    var n = fQ(f7, e.__scopeDialog),
                        r = e9.useRef(!1),
                        o = e9.useRef(!1);
                    return (0, e7.jsx)(dn, fK(fV({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (r.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), r.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, l = t.target;
                            (null == (a = n.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                dn = e9.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = fB(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = fQ(f7, n),
                        u = e9.useRef(null),
                        c = cR(t, u);
                    return (0, s2.useFocusGuards)(), (0, e7.jsxs)(e7.Fragment, {
                        children: [(0, e7.jsx)(sz, {
                            asChild: !0,
                            loop: !0,
                            trapped: r,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, e7.jsx)(ah.DismissableLayer, fK(fV({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": dc(l.open)
                            }, a), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, e7.jsxs)(e7.Fragment, {
                            children: [(0, e7.jsx)(dp, {
                                titleId: l.titleId
                            }), (0, e7.jsx)(dy, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                dr = "DialogTitle",
                di = e9.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = fB(e, ["__scopeDialog"]),
                        o = fQ(dr, n);
                    return (0, e7.jsx)(sk.h2, fK(fV({
                        id: o.titleId
                    }, r), {
                        ref: t
                    }))
                });
            di.displayName = dr;
            var da = "DialogDescription";
            e9.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = fB(e, ["__scopeDialog"]),
                    o = fQ(da, n);
                return (0, e7.jsx)(sk.p, fK(fV({
                    id: o.descriptionId
                }, r), {
                    ref: t
                }))
            }).displayName = da;
            var dl = "DialogClose",
                du = e9.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = fB(e, ["__scopeDialog"]),
                        o = fQ(dl, n);
                    return (0, e7.jsx)(sk.button, fK(fV({
                        type: "button"
                    }, r), {
                        ref: t,
                        onClick: ss(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function dc(e) {
                return e ? "open" : "closed"
            }
            du.displayName = dl;
            var ds = "DialogTitleWarning",
                df = fz((Z = {
                    contentName: f7,
                    titleName: dr,
                    docsSlug: "dialog"
                }, ee = e9.createContext(Z), (et = function(e) {
                    var t = e.children,
                        n = sy(e, ["children"]),
                        r = e9.useMemo(function() {
                            return n
                        }, Object.values(n));
                    return (0, e7.jsx)(ee.Provider, {
                        value: r,
                        children: t
                    })
                }).displayName = ds + "Provider", [et, function(e) {
                    var t = e9.useContext(ee);
                    if (t) return t;
                    if (void 0 !== Z) return Z;
                    throw Error("`".concat(e, "` must be used within `").concat(ds, "`"))
                }]), 2),
                dd = (df[0], df[1]),
                dp = function(e) {
                    var t = e.titleId,
                        n = dd(ds),
                        r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
                    return e9.useEffect(function() {
                        t && (document.getElementById(t) || console.error(r))
                    }, [r, t]), null
                },
                dy = function(e) {
                    var t = e.contentRef,
                        n = e.descriptionId,
                        r = dd("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
                    return e9.useEffect(function() {
                        var e, r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        n && r && (document.getElementById(n) || console.warn(o))
                    }, [o, t, n]), null
                };

            function dv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function dm(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function db(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function dh(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function dg(e) {
                return function(e) {
                    if (Array.isArray(e)) return dv(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return dv(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return dv(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dO = Symbol("radix.slottable");

            function dS(e) {
                return e9.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === dO
            }

            function dw(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function dE(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        dw(e, t, n[t])
                    })
                }
                return e
            }

            function dA(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }
            var dN = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var n, r, o, i, a, l = (n = o = "Primitive.".concat(t), (r = e9.forwardRef(function(e, t) {
                        var n = e.children,
                            r = dh(e, ["children"]);
                        if (e9.isValidElement(n)) {
                            var o, i, a, l, u, c = (u = (l = null == (i = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var n = dm({}, t);
                                    for (var r in t) ! function(r) {
                                        var o = e[r],
                                            i = t[r];
                                        /^on[A-Z]/.test(r) ? o && i ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            var r = i.apply(void 0, dg(t));
                                            return o.apply(void 0, dg(t)), r
                                        } : o && (n[r] = o) : "style" === r ? n[r] = dm({}, o, i) : "className" === r && (n[r] = [o, i].filter(Boolean).join(" "))
                                    }(r);
                                    return dm({}, e, n)
                                }(r, n.props);
                            return n.type !== e9.Fragment && (s.ref = t ? cL(t, c) : c), e9.cloneElement(n, s)
                        }
                        return e9.Children.count(n) > 1 ? e9.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), i = r, (a = e9.forwardRef(function(e, t) {
                        var n = e.children,
                            r = dh(e, ["children"]),
                            o = e9.Children.toArray(n),
                            a = o.find(dS);
                        if (a) {
                            var l = a.props.children,
                                u = o.map(function(e) {
                                    return e !== a ? e : e9.Children.count(l) > 1 ? e9.Children.only(null) : e9.isValidElement(l) ? l.props.children : null
                                });
                            return (0, e7.jsx)(i, db(dm({}, r), {
                                ref: t,
                                children: e9.isValidElement(l) ? e9.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, e7.jsx)(i, db(dm({}, r), {
                            ref: t,
                            children: n
                        }))
                    })).displayName = "".concat(o, ".Slot"), a),
                    u = e9.forwardRef(function(e, n) {
                        var r = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = {},
                                        i = Object.keys(e);
                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                }
                                return o
                            }(e, ["asChild"]),
                            i = r ? l : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, e7.jsx)(i, dA(dE({}, o), {
                            ref: n
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), dA(dE({}, e), dw({}, t, u))
            }, {});

            function dj(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }
            var dx = Object.freeze({
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
                dI = e9.forwardRef(function(e, t) {
                    var n, r;
                    return (0, e7.jsx)(dN.span, (n = dj({}, e), r = r = {
                        ref: t,
                        style: dj({}, dx, e.style)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                    }), n))
                });

            function dT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function dP(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }
            dI.displayName = "VisuallyHidden";
            var dD = (0, e9.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                d_ = function() {
                    var e = (0, e9.useContext)(dD);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                dC = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                dL = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                dR = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                dU = function(e) {
                    var t = e.open,
                        n = e.onOpenChange,
                        r = e.children,
                        o = e.size,
                        i = e.type,
                        a = void 0 === i ? "Default" : i,
                        l = e.isModal,
                        u = e.hasCloseAffordance,
                        c = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        d = e.hasMarginBottom,
                        p = void 0 === d || d,
                        y = e.hasDescription,
                        v = void 0 !== y && y,
                        m = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== m && m,
                        h = (0, e9.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: u,
                                closeLabel: c,
                                hasMarginTop: f,
                                hasMarginBottom: p,
                                hasDescription: v
                            }
                        }, [o, l, a, u, c, f, p, v]);
                    return (0, e9.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), te().createElement(dD.Provider, {
                        value: h
                    }, te().createElement(fq, {
                        open: t,
                        onOpenChange: n
                    }, r))
                };
            dU.displayName = "Dialog";
            var dk = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.style,
                    o = e.overlayClassName,
                    i = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = dP(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = d_(),
                    c = u.size,
                    s = u.isModal,
                    f = u.hasCloseAffordance,
                    d = u.closeLabel,
                    p = u.hasDescription,
                    y = i5("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    v = i5("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
                return te().createElement(f4, null, te().createElement(f6, {
                    className: y,
                    style: i
                }, te().createElement(f9, dT({
                    className: v,
                    "data-size": c,
                    style: r,
                    onOpenAutoFocus: a
                }, !p && {
                    "aria-describedby": void 0
                }, l), f && te().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, te().createElement(du, {
                    asChild: !0
                }, te().createElement(sc, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": d
                }))), t)))
            };
            dk.displayName = "DialogContent";
            var dM = function(e) {
                var t = e.children,
                    n = e.className,
                    r = dP(e, ["children", "className"]),
                    o = d_(),
                    i = o.size,
                    a = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    u = i5(dC[i], a && dL[i], l && dR[i], n);
                return te().createElement("div", dT({
                    className: u
                }, r), t)
            };
            dM.displayName = "DialogBody";
            var dW = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.hidden,
                    o = dP(e, ["children", "className", "hidden"]),
                    i = te().createElement(di, dT({
                        className: n
                    }, o), t);
                return r ? te().createElement(dI, null, i) : i
            };
            dW.displayName = "DialogTitle";
            var dF = function(e) {
                var t = e.children,
                    n = e.className,
                    r = dP(e, ["children", "className"]),
                    o = d_().size,
                    i = i5(dC[o], dR[o], n);
                return te().createElement("div", dT({
                    className: i
                }, r), t)
            };

            function dV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function dK(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function dB(e) {
                return function(e) {
                    if (Array.isArray(e)) return dV(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return dV(e, void 0);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return dV(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            dF.displayName = "DialogFooter";
            var dz = function(e, t) {
                    var n = dB(e),
                        r = [];
                    if (t) {
                        var o = e.findIndex(function(e) {
                            return e.isCurrentSession
                        });
                        r.push(e[o]), n.splice(o, 1)
                    }
                    return n = n.sort(function(e, t) {
                        return null === e.lastAccessedTimestampEpochMilliseconds ? 1 : null === t.lastAccessedTimestampEpochMilliseconds ? -1 : parseInt(t.lastAccessedTimestampEpochMilliseconds, 10) - parseInt(e.lastAccessedTimestampEpochMilliseconds, 10)
                    }), r.concat(n)
                },
                dH = function(e) {
                    for (var t = dB(e), n = e.reduce(function(e, t) {
                            return e.set(t.token, t), e
                        }, new Map), r = new Set, o = 0; o < e.length; o++) {
                        var i = e[o].parentSessionToken;
                        if (null !== i && (null == (a = e[o]) ? void 0 : a.parent) == null) {
                            var a, l, u, c, s, f, d = n.get(i);
                            null != d && d.lastAccessedIp === (null == (l = e[o]) ? void 0 : l.lastAccessedIp) && (null !== d.lastAccessedIp || (null == (u = e[o]) ? void 0 : u.lastAccessedIp) !== null) && (null === d.agent || (null == (c = e[o]) ? void 0 : c.agent) === null || d.agent.type === (null == (f = e[o]) || null == (s = f.agent) ? void 0 : s.type)) && (t[o].parent = d, r.add(d.token))
                        }
                    }
                    return t.filter(function(e) {
                        return !r.has(e.token)
                    })
                },
                dY = function(e) {
                    var t = e.findIndex(function(e) {
                        return null === e.lastAccessedTimestampEpochMilliseconds && !e.isCurrentSession
                    });
                    return -1 === t ? {
                        knownSessions: e,
                        unknownSessions: []
                    } : {
                        knownSessions: e.slice(0, t),
                        unknownSessions: e.slice(t)
                    }
                },
                dG = function(e, t) {
                    var n;
                    return (n = function() {
                        var n, r, o, i, a;
                        return function(e, t) {
                            var n, r, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function l(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, r = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    i.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && i.label < o[1]) {
                                                    i.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(c);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, i)
                                    } catch (e) {
                                        c = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    n = 0, r = [], o = !0, i = t, l.label = 1;
                                case 1:
                                    if (!(r.length < 25 && n < 5 && o)) return [3, 3];
                                    return [4, e.sessionManagement.getSessions(i, (25 - r.length).toString())];
                                case 2:
                                    if ((a = l.sent()).isError) return [2, {
                                        isError: !0,
                                        error: a.error
                                    }];
                                    return r = r.concat(a.value.sessions), o = a.value.hasMore, i = a.value.nextCursor, n += 1, [3, 1];
                                case 3:
                                    return [2, {
                                        isError: !1,
                                        sessions: r,
                                        hasMore: o,
                                        nextCursor: i
                                    }]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                dK(i, r, o, a, l, "next", e)
                            }

                            function l(e) {
                                dK(i, r, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                };

            function dX(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var d$ = ["sessions"];

            function dQ() {
                var e;
                return (e = function() {
                    var e, t, n, r, o, i, a;
                    return function(e, t) {
                        var n, r, o, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                            return this
                        }), a;

                        function l(l) {
                            return function(u) {
                                var c = [l, u];
                                if (n) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                    if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                    switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            o = c;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                i.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && i.label < o[1]) {
                                                i.label = o[1], o = c;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(c);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, i)
                                } catch (e) {
                                    c = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & c[0]) throw c[1];
                                return {
                                    value: c[0] ? c[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(l) {
                        switch (l.label) {
                            case 0:
                                e = [], t = !0, n = "", r = 0, l.label = 1;
                            case 1:
                                if (!(e.length < 25 && r < 5 && t)) return [3, 3];
                                return o = (25 - e.length).toString(), [4, rm(n || void 0, o)];
                            case 2:
                                if ((i = l.sent()).isError) throw Error(String(null != (a = i.error) ? a : "Unknown session fetch error"));
                                return e = e.concat(i.value.sessions), t = i.value.hasMore, n = i.value.nextCursor, r += 1, [3, 1];
                            case 3:
                                return [2, {
                                    sessions: e,
                                    hasMore: t,
                                    nextCursor: n
                                }]
                        }
                    })
                }, function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            dX(i, r, o, a, l, "next", e)
                        }

                        function l(e) {
                            dX(i, r, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()
            }
            var dq = function(e, t) {
                    if (null === t) return e.Label.Value.UnknownDevice;
                    switch (t.type) {
                        case rc.UNKNOWN:
                            if (null !== t.os) return e.Label.Value.RobloxApp(t.os);
                            return e.Label.Value.UnknownDevice;
                        case rc.APP:
                            if (null === t.os) return e.Label.Value.RobloxAppOSUnknown;
                            return e.Label.Value.RobloxApp(t.os);
                        case rc.BROWSER:
                            if (null == t.value || null == t.os) {
                                if (null !== t.os) return e.Label.Value.BrowserWithOSInfo(t.os);
                                if (null !== t.value) return t.value;
                                return e.Label.Value.Browser
                            }
                            return e.Label.Value.BrowserWithOSandBrowserInfo(t.value, t.os);
                        case rc.STUDIO:
                            if (null === t.os) return e.Label.Value.Studio;
                            return e.Label.Value.StudioWithOS(t.os);
                        default:
                            return e.Label.Value.UnknownDevice
                    }
                },
                dJ = function(e, t) {
                    if (null === t) return e.Label.Value.UnknownTime;
                    var n = new tr.Intl().getRobloxLocale().replace("_", "-");
                    return new Date(Number(t)).toLocaleString(n, {
                        month: "short",
                        day: "numeric",
                        year: "numeric",
                        hour: "numeric",
                        minute: "numeric"
                    })
                },
                dZ = function(e, t) {
                    return null === t ? e.Label.Value.UnknownLocation : null != t.city && null != t.subdivision && null != t.country ? e.Label.Value.Location(t.city, t.subdivision, t.country) : null != t.city && null != t.subdivision ? e.Label.Value.LocationMissingOne(t.city, t.subdivision) : null != t.city && null != t.country ? e.Label.Value.LocationMissingOne(t.city, t.country) : null != t.city ? e.Label.Value.LocationMissingTwo(t.city) : null != t.subdivision && null != t.country ? e.Label.Value.LocationMissingOne(t.subdivision, t.country) : null != t.subdivision ? e.Label.Value.LocationMissingTwo(t.subdivision) : null != t.country ? e.Label.Value.LocationMissingTwo(t.country) : e.Label.Value.UnknownLocation
                },
                d0 = ((en = {})[en.SET_SESSIONS = 0] = "SET_SESSIONS", en[en.SHOW_MORE = 1] = "SHOW_MORE", en[en.SET_MODAL_STATE = 2] = "SET_MODAL_STATE", en[en.REMOVE_SESSION = 3] = "REMOVE_SESSION", en[en.REMOVE_ALL_OTHER_SESSIONS = 4] = "REMOVE_ALL_OTHER_SESSIONS", en[en.REMOVE_UNKNOWN_SESSIONS = 5] = "REMOVE_UNKNOWN_SESSIONS", en[en.SET_CONSOLE_SESSION_STATUS = 6] = "SET_CONSOLE_SESSION_STATUS", en),
                d1 = function(e, t) {
                    var n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {},
                                r = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(n, e).enumerable
                            }))), r.forEach(function(t) {
                                var r;
                                r = n[t], t in e ? Object.defineProperty(e, t, {
                                    value: r,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = r
                            })
                        }
                        return e
                    }({}, e);
                    switch (t.type) {
                        case d0.SET_SESSIONS:
                            return n.sessions = t.sessions, n.unknownSessions = t.unknownSessions, n.hasMore = t.hasMore, n.nextCursor = t.nextCursor, n.delaySummaries = t.delaySummaries, n;
                        case d0.SHOW_MORE:
                            if (n.numSessionsToDisplay = e.numSessionsToDisplay + t.amountToShowMore, null != t.sessionsToAdd) {
                                var r = dY(dz(dH(t.sessionsToAdd), !1));
                                n.sessions = n.sessions.concat(r.knownSessions), n.unknownSessions = n.unknownSessions.concat(r.unknownSessions)
                            }
                            return n.nextCursor = t.nextCursor, n.hasMore = t.hasMore, n;
                        case d0.SET_MODAL_STATE:
                            return n.modalState = t.modalState, n.selectedSession = t.session, n;
                        case d0.REMOVE_SESSION:
                            var o = n.sessions.indexOf(t.session);
                            return n.sessions = n.sessions.slice(0, o).concat(n.sessions.slice(o + 1)), n;
                        case d0.REMOVE_ALL_OTHER_SESSIONS:
                            return n.sessions = n.sessions.filter(function(e) {
                                return e.isCurrentSession
                            }), n.unknownSessions = [], n;
                        case d0.REMOVE_UNKNOWN_SESSIONS:
                            return n.unknownSessions = n.unknownSessions.filter(function(e) {
                                return !t.tokensToRemove.has(e.token)
                            }), n;
                        case d0.SET_CONSOLE_SESSION_STATUS:
                            return n.userHasConsoleSession = t.userHasConsoleSession, n;
                        default:
                            return n
                    }
                },
                d2 = ((er = d2 || {}).NONE = "NONE", er.SESSION_INFO = "SESSION_INFO", er.LOG_OUT_CONFIRMATION = "LOG_OUT_CONFIRMATION", er.LOG_OUT_OF_ALL_SESSIONS = "LOG_OUT_OF_ALL_SESSIONS", er.LOG_OUT_OF_UNKNOWN_SESSIONS = "LOG_OUT_OF_UNKNOWN_SESSIONS", er.SECURITY_DELAYS = "SECURITY_DELAYS", er);

            function d4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function d3(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || d6(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function d6(e, t) {
                if (e) {
                    if ("string" == typeof e) return d4(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return d4(e, t)
                }
            }
            var d5 = [
                    [/^grouppayouts/i, "GroupPayouts"],
                    [/^grouptransfers/i, "GroupOwnershipTransfer"],
                    [/^experiencetransfers/i, "ExperienceOwnershipTransfer"],
                    [/^grouprolesorpermissions/i, "GroupRolesOrPermissions"],
                    [/^forgetuser/i, "ForgetUser"]
                ],
                d8 = function(e, t) {
                    var n = d5.find(function(e) {
                        return d3(e, 1)[0].test(t)
                    });
                    return n ? e.Label.Delay.Subject[n[1]] : e.Label.Delay.Subject.Unknown
                },
                d7 = function(e, t, n) {
                    var r = Number(null != t ? t : n);
                    if (Number.isNaN(r)) return e.Label.Delay.UnknownTime;
                    var o = new Date(r),
                        i = o.toLocaleDateString(void 0, {
                            month: "short",
                            day: "numeric",
                            year: "numeric"
                        }),
                        a = o.toLocaleTimeString(void 0, {
                            hour: "numeric",
                            minute: "2-digit",
                            hour12: !0
                        });
                    return e.Label.Delay.StartedAt(i, a)
                },
                d9 = function(e, t, n) {
                    var r = Number(n) - Date.now();
                    if ("LOCK_STATE_UNLOCKED" === t && r > 0) {
                        var o = Math.max(0, Math.ceil(r / 6e4)),
                            i = Math.floor(o / 1440);
                        if (i > 0) return e.Label.Delay.Status.TimeLeft(e.Label.Delay.Status.DaysLeft(i));
                        var a = String(Math.floor(o % 1440 / 60)).padStart(2, "0"),
                            l = String(o % 60).padStart(2, "0");
                        return e.Label.Delay.Status.TimeLeft("".concat(a, ":").concat(l))
                    }
                    return e.Label.Delay.Status.Completed
                },
                pe = function(e, t) {
                    return {
                        label: d8(e, t.subject),
                        startedAt: d7(e, t.updatedAt, t.delayUntil),
                        status: d9(e, t.state, t.delayUntil)
                    }
                },
                pt = function(e, t) {
                    var n, r = new Map,
                        o = !0,
                        i = !1,
                        a = void 0;
                    try {
                        for (var l, u = t[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) {
                            var c = l.value,
                                s = pe(e, c),
                                f = r.get(s.label);
                            f ? (f.count += 1, f.entries.push(s)) : r.set(s.label, {
                                label: s.label,
                                count: 1,
                                entries: [s]
                            })
                        }
                    } catch (e) {
                        i = !0, a = e
                    } finally {
                        try {
                            o || null == u.return || u.return()
                        } finally {
                            if (i) throw a
                        }
                    }
                    return function(e) {
                        if (Array.isArray(e)) return d4(e)
                    }(n = r.values()) || function(e) {
                        if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(n) || d6(n) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()
                },
                pn = function(e, t) {
                    if (0 === t.length) return e.Label.Value.NoActiveDelays;
                    var n = Date.now();
                    return Object.entries(Object.groupBy(t, function(t) {
                        var r = t.state,
                            o = t.delayUntil;
                        return "LOCK_STATE_UNLOCKED" === r && n <= Number(o) ? e.Label.Delay.Status.PendingLower : e.Label.Delay.Status.CompletedLower
                    })).filter(function(e) {
                        var t = d3(e, 2);
                        return void 0 !== (t[0], t[1])
                    }).map(function(e) {
                        var t = d3(e, 2),
                            n = t[0],
                            r = t[1];
                        return "".concat(r.length, " ").concat(n)
                    }).join(", ")
                };

            function pr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function po(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return pr(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return pr(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var pi = (0, e9.createContext)(null),
                pa = function(e) {
                    var t = e.eventService,
                        n = e.requestService,
                        r = e.numSessionsToDisplay,
                        o = e.userHasConsoleSession,
                        i = e.translate,
                        a = e.children,
                        l = d2.NONE,
                        u = po((0, e9.useState)(function() {
                            return {
                                Action: {
                                    Cancel: i("Action.Cancel"),
                                    LogOut: i("Action.LogOut"),
                                    LogOutAllSessions: i("Action.LogOutAllSessions"),
                                    LogOutOfSession: i("Action.LogOutOfSession"),
                                    LogOutOfUnknownSessions: i("Action.LogOutOfUnknownSessions"),
                                    PleaseTryAgain: i("Action.PleaseTryAgain"),
                                    ShowMore: i("Action.ShowMore")
                                },
                                Description: {
                                    ConfidenceTrusted: i("Description.ConfidenceTrusted") || "When we have higher confidence that you’re the user, we trust that device.",
                                    ConsoleLogoutDisclaimer: i("Description.ConsoleLogoutDisclaimer"),
                                    CurrentlyLoggedIn: i("Description.CurrentlyLoggedIn"),
                                    OldSessionsWithUnknownData: i("Description.OldSessionsWithUnknownData"),
                                    YouWillBeLoggedOut: i("Description.YouWillBeLoggedOut"),
                                    YouWillBeLoggedOutAllSessions: i("Description.YouWillBeLoggedOutAllSessions")
                                },
                                Header: {
                                    LogOutAllSessions: i("Header.LogOutAllSessions"),
                                    LogOutOfSession: i("Header.LogOutOfSession"),
                                    UnknownInfo: i("Header.UnknownInfo"),
                                    WhereYoureLoggedIn: i("Header.WhereYoureLoggedIn"),
                                    ThisDevice: i("Header.ThisDevice") || "This device",
                                    YourSession: i("Header.YourSession"),
                                    DevicesWhereYouAreLoggedIn: i("Header.DevicesWhereYouAreLoggedIn") || "Devices where you're logged in"
                                },
                                Label: {
                                    ApproximateLocationAndTimestamp: i("Label.ApproximateLocationAndTimestamp"),
                                    DeviceDetails: i("Label.DeviceDetails"),
                                    LastActive: i("Label.LastActive"),
                                    Location: i("Label.Location"),
                                    TooltipTitle: i("Label.TooltipTitle") || "Time & Location Are Approximate",
                                    Value: {
                                        Browser: i("Label.Value.Browser"),
                                        BrowserWithOSandBrowserInfo: function(e, t) {
                                            return i("Label.Value.BrowserWithOSandBrowserInfo", {
                                                Browser: e,
                                                OS: t
                                            })
                                        },
                                        BrowserWithOSInfo: function(e) {
                                            return i("Label.Value.BrowserWithOSInfo", {
                                                OS: e
                                            })
                                        },
                                        JustNow: i("Label.Value.JustNow") || "Just Now",
                                        Location: function(e, t, n) {
                                            return i("Label.Value.Location", {
                                                city: e,
                                                subdivision: t,
                                                country: n
                                            })
                                        },
                                        LocationMissingOne: function(e, t) {
                                            return i("Label.Value.LocationMissingOne", {
                                                cityOrSubdivision: e,
                                                subdivisionOrCountry: t
                                            })
                                        },
                                        LocationMissingTwo: function(e) {
                                            return i("Label.Value.LocationMissingTwo", {
                                                cityOrSubdivisionOrCountry: e
                                            })
                                        },
                                        RobloxApp: function(e) {
                                            return i("Label.Value.RobloxApp", {
                                                OS: e
                                            })
                                        },
                                        RobloxAppOSUnknown: i("Label.Value.RobloxAppOSUnknown"),
                                        Studio: i("Label.Value.Studio"),
                                        StudioWithOS: function(e) {
                                            return i("Label.Value.StudioWithOS", {
                                                OS: e
                                            })
                                        },
                                        ThisSession: i("Label.Value.ThisSession"),
                                        UnknownDevice: i("Label.Value.UnknownDevice"),
                                        UnknownLocation: i("Label.Value.UnknownLocation"),
                                        UnknownTime: i("Label.Value.UnknownTime"),
                                        Trusted: i("Label.Value.Trusted") || "Trusted",
                                        NoActiveDelays: i("Label.Value.NoActiveDelays") || "No active delays",
                                        ActiveDelayCount: function(e) {
                                            return i("Label.Value.ActiveDelayCount", {
                                                count: e
                                            }) || "".concat(e, " active delay").concat(1 === e ? "" : "s")
                                        },
                                        UnknownWithCount: function(e) {
                                            return i("Label.Value.UnknownWithCount", {
                                                Count: e
                                            })
                                        }
                                    },
                                    SecurityDelays: i("Label.SecurityDelays") || "SECURITY DELAYS",
                                    Delay: {
                                        Subject: {
                                            ExperienceOwnershipTransfer: i("Label.Delay.Subject.Experience.OwnershipTransfer") || "Experience Ownership Transfer",
                                            GroupPayouts: i("Label.Delay.Subject.Group.Payouts") || "Group Payouts",
                                            GroupOwnershipTransfer: i("Label.Delay.Subject.Group.OwnershipTransfer") || "Group Ownership Transfer",
                                            GroupRolesOrPermissions: i("Label.Delay.Subject.Group.RolesOrPermissions") || "Group Roles / Permissions",
                                            ForgetUser: i("Label.Delay.Subject.ForgetUser") || "Account Deletion",
                                            Unknown: i("Label.Delay.Subject.Unknown") || "Unknown"
                                        },
                                        Status: {
                                            Completed: i("Label.Delay.Status.Completed") || "Completed",
                                            CompletedLower: i("Label.Delay.Status.CompletedLower") || "completed",
                                            PendingLower: i("Label.Delay.Status.PendingLower") || "pending",
                                            Abandoned: i("Label.Delay.Status.Abandoned") || "Abandoned",
                                            AbandonedLower: i("Label.Delay.Status.AbandonedLower") || "abandoned",
                                            TimeLeft: function(e) {
                                                return i("Label.Delay.Status.TimeLeft", {
                                                    timeLeft: e
                                                }) || "".concat(e, " left")
                                            },
                                            DaysLeft: function(e) {
                                                return i("Label.Delay.Status.DaysLeft", {
                                                    days: e
                                                }) || "".concat(e, " days left")
                                            }
                                        },
                                        StartedAt: function(e, t) {
                                            return i("Label.Delay.StartedAt", {
                                                date: e,
                                                time: t
                                            }) || "Started ".concat(e, " at ").concat(t)
                                        },
                                        UnknownTime: i("Label.Delay.UnknownTime") || "Unknown"
                                    },
                                    DelayLowercase: i("Label.DelayLowercase") || "delay(s)"
                                },
                                Message: {
                                    Error: {
                                        Default: i("Message.Error.Default")
                                    }
                                }
                            }
                        }), 1)[0],
                        c = po((0, e9.useState)(function() {
                            return {
                                resources: u,
                                eventService: t,
                                requestService: n,
                                sessions: [],
                                unknownSessions: [],
                                hasMore: !1,
                                nextCursor: "",
                                numSessionsToDisplay: r,
                                userHasConsoleSession: o,
                                modalState: l,
                                selectedSession: null,
                                delaySummaries: []
                            }
                        }), 1)[0],
                        s = po((0, e9.useReducer)(d1, c), 2),
                        f = s[0],
                        d = s[1],
                        p = (0, i0.useQuery)({
                            queryKey: d$,
                            queryFn: dQ
                        }).data;
                    return (0, e9.useEffect)(function() {
                        if (p) {
                            var e = dY(dz(dH(p.sessions), !0)),
                                t = pt(u, p.sessions.flatMap(function(e) {
                                    var t;
                                    return null != (t = e.delayLabels) ? t : []
                                }));
                            d({
                                type: d0.SET_SESSIONS,
                                sessions: e.knownSessions,
                                unknownSessions: e.unknownSessions,
                                hasMore: p.hasMore,
                                nextCursor: p.nextCursor,
                                delaySummaries: t
                            })
                        }
                    }, [p]), (0, e9.useEffect)(function() {
                        d({
                            type: d0.SET_CONSOLE_SESSION_STATUS,
                            userHasConsoleSession: o
                        })
                    }, [o]), (0, e7.jsx)(pi.Provider, {
                        value: {
                            state: f,
                            dispatch: d
                        },
                        children: a
                    })
                },
                pl = function() {
                    var e = (0, e9.useContext)(pi);
                    if (null === e) throw Error("SessionManagementContext was not provided in the current scope");
                    return e
                };

            function pu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function pc(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function ps(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return pu(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return pu(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var pf = function(e) {
                var t = e.closeModal,
                    n = pl(),
                    r = n.state,
                    o = r.resources,
                    i = r.eventService,
                    a = r.requestService,
                    l = r.selectedSession,
                    u = r.hasMore,
                    c = r.nextCursor,
                    s = n.dispatch,
                    f = ps((0, e9.useState)(!1), 2),
                    d = f[0],
                    p = f[1],
                    y = ps((0, e9.useState)(null), 2),
                    v = y[0],
                    m = y[1];
                return (0, e7.jsxs)(te().Fragment, {
                    children: [(0, e7.jsxs)(dM, {
                        children: [(0, e7.jsx)(dW, {
                            children: o.Header.LogOutOfSession
                        }), (0, e7.jsx)("p", {
                            className: "text-center modal-margin-bottom",
                            children: o.Description.YouWillBeLoggedOut
                        }), (0, e7.jsx)("p", {
                            className: "text-error xsmall",
                            children: v
                        })]
                    }), (0, e7.jsxs)(dF, {
                        className: "flex gap-medium justify-center",
                        children: [(0, e7.jsx)(sa, {
                            variant: "Standard",
                            onClick: t,
                            isDisabled: d,
                            isLoading: d,
                            size: "Large",
                            className: "flex-col fill",
                            children: o.Action.Cancel
                        }), (0, e7.jsx)(sa, {
                            variant: "Alert",
                            onClick: function() {
                                var e;
                                return (e = function() {
                                    return function(e, t) {
                                        var n, r, o, i = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                            return this
                                        }), a;

                                        function l(l) {
                                            return function(u) {
                                                var c = [l, u];
                                                if (n) throw TypeError("Generator is already executing.");
                                                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                                    if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                                    switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = c;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: c[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, r = c[1], c = [0];
                                                            continue;
                                                        case 7:
                                                            c = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                i.label = c[1];
                                                                break
                                                            }
                                                            if (6 === c[0] && i.label < o[1]) {
                                                                i.label = o[1], o = c;
                                                                break
                                                            }
                                                            if (o && i.label < o[2]) {
                                                                i.label = o[2], i.ops.push(c);
                                                                break
                                                            }
                                                            o[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    c = t.call(e, i)
                                                } catch (e) {
                                                    c = [6, e], r = 0
                                                } finally {
                                                    n = o = 0
                                                }
                                                if (5 & c[0]) throw c[1];
                                                return {
                                                    value: c[0] ? c[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                if (p(!0), null === l) return p(!1), m("".concat(o.Message.Error.Default, " ").concat(o.Action.PleaseTryAgain)), [2];
                                                return [4, a.sessionManagement.logoutSession(l.token)];
                                            case 1:
                                                if (e.sent().isError) return p(!1), m("".concat(o.Message.Error.Default, " ").concat(o.Action.PleaseTryAgain)), [2];
                                                if (i.sendSignedOutOfSessionEvent(l.token), s({
                                                        type: d0.REMOVE_SESSION,
                                                        session: l
                                                    }), null == l.parent) return [3, 3];
                                                return [4, a.sessionManagement.logoutSession(l.parent.token)];
                                            case 2:
                                                e.sent().isError ? s({
                                                    type: d0.SHOW_MORE,
                                                    hasMore: u,
                                                    nextCursor: c,
                                                    sessionsToAdd: [l.parent],
                                                    amountToShowMore: 0
                                                }) : i.sendSignedOutOfSessionEvent(l.parent.token), e.label = 3;
                                            case 3:
                                                return m(null), t(), [2]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        n = arguments;
                                    return new Promise(function(r, o) {
                                        var i = e.apply(t, n);

                                        function a(e) {
                                            pc(i, r, o, a, l, "next", e)
                                        }

                                        function l(e) {
                                            pc(i, r, o, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            },
                            isDisabled: d,
                            isLoading: d,
                            size: "Large",
                            className: "flex-col fill",
                            children: d ? (0, e7.jsx)("span", {
                                className: "spinner spinner-xs spinner-no-margin"
                            }) : o.Action.LogOut
                        })]
                    })]
                })
            };

            function pd(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function pp(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function py(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return pd(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return pd(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var pv = rx.cryptoUtil.generateSecureAuthIntentV2,
                pm = function(e) {
                    var t = e.closeModal,
                        n = pl(),
                        r = n.state,
                        o = r.resources,
                        i = r.eventService,
                        a = r.requestService,
                        l = n.dispatch,
                        u = py((0, e9.useState)(!1), 2),
                        c = u[0],
                        s = u[1],
                        f = py((0, e9.useState)(null), 2),
                        d = f[0],
                        p = f[1];
                    return (0, e7.jsxs)(te().Fragment, {
                        children: [(0, e7.jsxs)(dM, {
                            children: [(0, e7.jsx)(dW, {
                                children: o.Header.LogOutAllSessions
                            }), (0, e7.jsx)("p", {
                                className: "modal-margin-bottom",
                                children: o.Description.YouWillBeLoggedOutAllSessions
                            }), (0, e7.jsx)("p", {
                                className: "text-error xsmall",
                                children: d
                            })]
                        }), (0, e7.jsxs)(dF, {
                            className: "flex gap-medium",
                            children: [(0, e7.jsx)(sa, {
                                variant: "Standard",
                                onClick: t,
                                isDisabled: c,
                                isLoading: c,
                                size: "Large",
                                className: "flex-col fill",
                                children: o.Action.Cancel
                            }), (0, e7.jsx)(sa, {
                                variant: "Alert",
                                onClick: function() {
                                    var e;
                                    return (e = function() {
                                        var e, n;
                                        return function(e, t) {
                                            var n, r, o, i = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & o[0]) throw o[1];
                                                        return o[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                            return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                                return this
                                            }), a;

                                            function l(l) {
                                                return function(u) {
                                                    var c = [l, u];
                                                    if (n) throw TypeError("Generator is already executing.");
                                                    for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                                        if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                                        switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                            case 0:
                                                            case 1:
                                                                o = c;
                                                                break;
                                                            case 4:
                                                                return i.label++, {
                                                                    value: c[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                i.label++, r = c[1], c = [0];
                                                                continue;
                                                            case 7:
                                                                c = i.ops.pop(), i.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                    i = 0;
                                                                    continue
                                                                }
                                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                    i.label = c[1];
                                                                    break
                                                                }
                                                                if (6 === c[0] && i.label < o[1]) {
                                                                    i.label = o[1], o = c;
                                                                    break
                                                                }
                                                                if (o && i.label < o[2]) {
                                                                    i.label = o[2], i.ops.push(c);
                                                                    break
                                                                }
                                                                o[2] && i.ops.pop(), i.trys.pop();
                                                                continue
                                                        }
                                                        c = t.call(e, i)
                                                    } catch (e) {
                                                        c = [6, e], r = 0
                                                    } finally {
                                                        n = o = 0
                                                    }
                                                    if (5 & c[0]) throw c[1];
                                                    return {
                                                        value: c[0] ? c[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return s(!0), n = (e = a.sessionManagement).logoutFromAllSessionsAndReauthenticate, [4, pv()];
                                                case 1:
                                                    return [4, n.apply(e, [r.sent()])];
                                                case 2:
                                                    return r.sent().isError ? (s(!1), p("".concat(o.Message.Error.Default, " ").concat(o.Action.PleaseTryAgain))) : (i.sendSignedOutOfAllSessionsEvent(), p(null), l({
                                                        type: d0.REMOVE_ALL_OTHER_SESSIONS
                                                    })), t(), [2]
                                            }
                                        })
                                    }, function() {
                                        var t = this,
                                            n = arguments;
                                        return new Promise(function(r, o) {
                                            var i = e.apply(t, n);

                                            function a(e) {
                                                pp(i, r, o, a, l, "next", e)
                                            }

                                            function l(e) {
                                                pp(i, r, o, a, l, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    })()
                                },
                                isDisabled: c,
                                isLoading: c,
                                size: "Large",
                                className: "flex-col fill",
                                children: c ? (0, e7.jsx)("span", {
                                    className: "spinner spinner-xs spinner-no-margin"
                                }) : o.Action.LogOut
                            })]
                        })]
                    })
                };

            function pb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ph(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function pg(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return pb(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return pb(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var pO = function(e) {
                var t = e.closeModal,
                    n = pl(),
                    r = n.state,
                    o = r.resources,
                    i = r.eventService,
                    a = r.requestService,
                    l = r.unknownSessions,
                    u = n.dispatch,
                    c = pg((0, e9.useState)(!1), 2),
                    s = c[0],
                    f = c[1],
                    d = pg((0, e9.useState)(null), 2),
                    p = d[0],
                    y = d[1];
                return (0, e7.jsxs)(te().Fragment, {
                    children: [(0, e7.jsxs)(dM, {
                        children: [(0, e7.jsx)(dW, {
                            children: o.Header.UnknownInfo
                        }), (0, e7.jsx)("p", {
                            className: "text-center modal-margin-bottom",
                            children: o.Description.OldSessionsWithUnknownData
                        }), (0, e7.jsx)("p", {
                            className: "text-error xsmall",
                            children: p
                        })]
                    }), (0, e7.jsx)(dF, {
                        children: (0, e7.jsx)(sa, {
                            variant: "Alert",
                            onClick: function() {
                                var e;
                                return (e = function() {
                                    var e;
                                    return function(e, t) {
                                        var n, r, o, i = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                            return this
                                        }), a;

                                        function l(l) {
                                            return function(u) {
                                                var c = [l, u];
                                                if (n) throw TypeError("Generator is already executing.");
                                                for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                                    if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                                    switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = c;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: c[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, r = c[1], c = [0];
                                                            continue;
                                                        case 7:
                                                            c = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                i.label = c[1];
                                                                break
                                                            }
                                                            if (6 === c[0] && i.label < o[1]) {
                                                                i.label = o[1], o = c;
                                                                break
                                                            }
                                                            if (o && i.label < o[2]) {
                                                                i.label = o[2], i.ops.push(c);
                                                                break
                                                            }
                                                            o[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    c = t.call(e, i)
                                                } catch (e) {
                                                    c = [6, e], r = 0
                                                } finally {
                                                    n = o = 0
                                                }
                                                if (5 & c[0]) throw c[1];
                                                return {
                                                    value: c[0] ? c[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return f(!0), [4, Promise.all(l.map(function(e) {
                                                    return a.sessionManagement.logoutSession(e.token)
                                                }))];
                                            case 1:
                                                if (e = n.sent().reduce(function(e, t, n) {
                                                        return t.isError || (i.sendSignedOutOfSessionEvent(l[n].token), e.add(l[n].token)), e
                                                    }, new Set), u({
                                                        type: d0.REMOVE_UNKNOWN_SESSIONS,
                                                        tokensToRemove: e
                                                    }), e.size < l.length) return f(!1), y("".concat(o.Message.Error.Default, " ").concat(o.Action.PleaseTryAgain)), [2];
                                                return y(null), t(), [2]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        n = arguments;
                                    return new Promise(function(r, o) {
                                        var i = e.apply(t, n);

                                        function a(e) {
                                            ph(i, r, o, a, l, "next", e)
                                        }

                                        function l(e) {
                                            ph(i, r, o, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            },
                            isDisabled: s,
                            isLoading: s,
                            children: s ? (0, e7.jsx)("span", {
                                className: "spinner spinner-xs spinner-no-margin"
                            }) : o.Action.LogOutOfUnknownSessions
                        })
                    })]
                })
            };

            function pS(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function pw(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function pE(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        i = Object.keys(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }
            var pA = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                pN = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                pj = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                px = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                pI = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                pT = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                pP = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                pD = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                p_ = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                pC = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                pL = function(e) {
                    var t = e.iconName,
                        n = e.node,
                        r = e.size;
                    return null != t ? te().createElement(c7, {
                        name: t,
                        size: pA[r]
                    }) : null != n ? te().createElement("span", {
                        className: i5("inline-flex items-center justify-center shrink-0", pC[r])
                    }, n) : null
                },
                pR = (0, e9.forwardRef)(function(e, t) {
                    var n = e.className,
                        r = e.style,
                        o = e.text,
                        i = e.isDisabled,
                        a = void 0 !== i && i,
                        l = e.size,
                        u = void 0 === l ? "Medium" : l,
                        c = e.variant,
                        s = void 0 === c ? "Standard" : c,
                        f = e.leadingIconName,
                        d = e.leadingIconNode,
                        p = e.trailingIconName,
                        y = e.trailingIconNode,
                        v = pE(e, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        m = null != f || null != d,
                        b = null != p || null != y,
                        h = i5(a ? cD : [i8, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", m ? px[u] : pj[u], b ? pT[u] : pI[u], pN[u], n),
                        g = te().createElement(te().Fragment, null, te().createElement(i7, null), te().createElement(pL, {
                            iconName: f,
                            node: d,
                            size: u
                        }), te().createElement("span", {
                            className: i5("padding-y-xsmall text-no-wrap text-truncate-end", m && pP[u], b && pD[u])
                        }, o), te().createElement(pL, {
                            iconName: p,
                            node: y,
                            size: u
                        })),
                        O = pS({
                            textDecoration: "none"
                        }, r);
                    if ("a" === v.as) {
                        v.as;
                        var S = v.href,
                            w = pE(v, ["as", "href"]);
                        return te().createElement("a", pw(pS({
                            ref: t
                        }, w), {
                            "aria-disabled": a,
                            href: a ? void 0 : S,
                            className: i5(h, p_[s], "content-action-utility"),
                            style: O
                        }), g)
                    }
                    v.as;
                    var E = v.isChecked,
                        A = v.onCheckedChange,
                        N = pE(v, ["as", "isChecked", "onCheckedChange"]);
                    return te().createElement("button", pw(pS({
                        ref: t,
                        type: "button"
                    }, N), {
                        className: i5(E ? "bg-inverse-surface-0" : p_[s], E ? "content-inverse-emphasis" : "content-action-utility", h),
                        style: O,
                        "aria-pressed": E,
                        disabled: a,
                        onClick: null == A ? void 0 : function() {
                            return A(!E)
                        }
                    }), g)
                }),
                pU = function() {
                    var e, t = pl().state,
                        n = t.selectedSession,
                        r = t.resources,
                        o = (null != (e = null == n ? void 0 : n.delayLabels) ? e : []).map(function(e) {
                            return pe(r, e)
                        }),
                        i = function(e) {
                            if (e !== r.Label.Delay.Status.Completed) return "icon-filled-clock"
                        };
                    return (0, e7.jsxs)(dM, {
                        children: [(0, e7.jsx)(dW, {
                            children: r.Label.SecurityDelays
                        }), (0, e7.jsx)(ai, {
                            children: o.map(function(e, t) {
                                return (0, e7.jsx)(ao, {
                                    title: e.label,
                                    description: e.startedAt,
                                    divider: t < o.length - 1 ? "Full" : "None",
                                    isContained: !0,
                                    trailing: (0, e7.jsx)(pR, {
                                        leadingIconName: i(e.status),
                                        as: "button",
                                        isChecked: !1,
                                        size: "Small",
                                        text: e.status,
                                        variant: "Standard"
                                    })
                                }, e.label)
                            })
                        })]
                    })
                },
                pk = function(e) {
                    e.closeModal;
                    var t, n, r = pl(),
                        o = r.state,
                        i = o.selectedSession,
                        a = o.resources,
                        l = r.dispatch,
                        u = "".concat(a.Message.Error.Default, " ").concat(a.Action.PleaseTryAgain),
                        c = null !== i && null !== i.agent && null !== i.agent.os && (i.agent.os.includes("Xbox") || i.agent.os.includes("PlayStation")),
                        s = (null == i ? void 0 : i.delayLabels) !== null && (null == i || null == (t = i.delayLabels) ? void 0 : t.length) && i.delayLabels.length > 0,
                        f = s ? (0, e7.jsx)(c7, {
                            name: "icon-regular-chevron-large-right",
                            size: "Medium"
                        }) : void 0,
                        d = s ? function() {
                            l({
                                type: d0.SET_MODAL_STATE,
                                modalState: d2.SECURITY_DELAYS,
                                session: i
                            })
                        } : void 0;
                    return (0, e7.jsxs)(te().Fragment, {
                        children: [(0, e7.jsxs)(dM, {
                            children: [(0, e7.jsx)(dW, {
                                children: a.Header.ThisDevice
                            }), null === i ? (0, e7.jsx)("div", {
                                className: "session-info-section",
                                children: (0, e7.jsx)("div", {
                                    className: "no-footer",
                                    children: u
                                })
                            }) : (0, e7.jsxs)(ai, {
                                children: [(0, e7.jsx)(ao, {
                                    title: a.Label.DeviceDetails,
                                    description: dq(a, i.agent),
                                    divider: "Full",
                                    isContained: !0
                                }), (0, e7.jsx)(ao, {
                                    title: a.Label.Location,
                                    description: dZ(a, i.location),
                                    divider: "Full",
                                    isContained: !0
                                }), (0, e7.jsx)(ao, {
                                    title: a.Label.LastActive,
                                    description: dJ(a, i.lastAccessedTimestampEpochMilliseconds),
                                    divider: "Full",
                                    isContained: !0
                                }), (0, e7.jsx)(ao, {
                                    title: a.Label.SecurityDelays,
                                    description: pn(a, null != (n = null == i ? void 0 : i.delayLabels) ? n : []),
                                    divider: "None",
                                    trailing: f,
                                    onSelect: d,
                                    isContained: !0
                                })]
                            })]
                        }), null !== i && !i.isCurrentSession && (0, e7.jsxs)(dF, {
                            className: "flex flex-col gap-medium",
                            children: [c && (0, e7.jsx)("div", {
                                className: "small",
                                children: a.Description.ConsoleLogoutDisclaimer
                            }), (0, e7.jsx)(sa, {
                                variant: "Alert",
                                onClick: function() {
                                    l({
                                        type: d0.SET_MODAL_STATE,
                                        modalState: d2.LOG_OUT_CONFIRMATION,
                                        session: i
                                    })
                                },
                                children: a.Action.LogOutOfSession
                            })]
                        })]
                    })
                },
                pM = function(e) {
                    var t = e.session,
                        n = pl(),
                        r = n.state,
                        o = r.resources,
                        i = r.eventService,
                        a = n.dispatch;
                    return (0, e7.jsx)(ao, {
                        title: dq(o, t.agent),
                        metadata: t.isCurrentSession ? o.Label.Value.ThisSession : dZ(o, t.location),
                        description: t.isCurrentSession ? o.Label.Value.JustNow : dJ(o, t.lastAccessedTimestampEpochMilliseconds),
                        divider: "Full",
                        isContained: !0,
                        onSelect: function() {
                            i.sendOpenedSessionDetailsEvent(t.token), a({
                                type: d0.SET_MODAL_STATE,
                                modalState: d2.SESSION_INFO,
                                session: t
                            })
                        },
                        trailing: (0, e7.jsxs)("span", {
                            className: "flex items-center gap-small",
                            children: [t.isTrustedSession && (0, e7.jsx)(pR, {
                                as: "button",
                                isChecked: !1,
                                size: "Small",
                                text: o.Label.Value.Trusted,
                                variant: "Standard"
                            }), t.delayLabels && t.delayLabels.length > 0 && (0, e7.jsx)(pR, {
                                as: "button",
                                isChecked: !1,
                                size: "Small",
                                text: "".concat(t.delayLabels.length, " ").concat(o.Label.DelayLowercase),
                                variant: "Standard"
                            }), (0, e7.jsx)(c7, {
                                name: "icon-regular-chevron-large-right",
                                size: "Medium"
                            })]
                        }),
                        className: "padding-y-large"
                    })
                },
                pW = n(942),
                pF = n.n(pW),
                pV = function(e) {
                    var t = e.isLastSessionToDisplay,
                        n = pl(),
                        r = n.state,
                        o = r.resources,
                        i = r.unknownSessions,
                        a = n.dispatch,
                        l = function() {
                            a({
                                type: d0.SET_MODAL_STATE,
                                modalState: d2.LOG_OUT_OF_UNKNOWN_SESSIONS,
                                session: null
                            })
                        },
                        u = function(e) {
                            "Enter" === e.key && l()
                        },
                        c = pF()("rbx-divider text-new-line", {
                            "last-divider": t
                        }),
                        s = function() {
                            return (0, e7.jsxs)(te().Fragment, {
                                children: [(0, e7.jsx)("div", {
                                    className: "text-description location-description",
                                    children: (0, e7.jsx)("div", {
                                        children: "\xa0"
                                    })
                                }), (0, e7.jsx)("span", {
                                    className: "unknown-sessions icon-moreinfo",
                                    role: "button",
                                    onClick: l,
                                    onKeyDown: u,
                                    tabIndex: 0,
                                    children: ""
                                }), (0, e7.jsx)("div", {
                                    children: o.Label.Value.UnknownWithCount(i.length)
                                }), (0, e7.jsx)("div", {
                                    className: "text-description text-new-line",
                                    children: (0, e7.jsx)("div", {
                                        children: "\xa0"
                                    })
                                }), (0, e7.jsx)("div", {
                                    className: c
                                })]
                            })
                        };
                    return (0, e7.jsxs)(te().Fragment, {
                        children: [(0, e7.jsx)("div", {
                            className: "session-row-narrow",
                            role: "button",
                            onClick: l,
                            onKeyDown: u,
                            tabIndex: 0,
                            children: s()
                        }), (0, e7.jsx)("div", {
                            className: "session-row-wide",
                            children: s()
                        })]
                    })
                };

            function pK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function pB(e, t, n, r, o, i, a) {
                try {
                    var l = e[i](a),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function pz(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return pK(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return pK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var pH = function(e) {
                    switch (e) {
                        case d2.SESSION_INFO:
                            return {
                                innerFragment: pk, size: "Large", hasCloseAffordance: !0
                            };
                        case d2.LOG_OUT_CONFIRMATION:
                            return {
                                innerFragment: pf, size: "Large", hasCloseAffordance: !1
                            };
                        case d2.LOG_OUT_OF_ALL_SESSIONS:
                            return {
                                innerFragment: pm, size: "Large", hasCloseAffordance: !1
                            };
                        case d2.LOG_OUT_OF_UNKNOWN_SESSIONS:
                            return {
                                innerFragment: pO, size: "Large", hasCloseAffordance: !1
                            };
                        case d2.SECURITY_DELAYS:
                            return {
                                innerFragment: pU, size: "Large", hasCloseAffordance: !0
                            };
                        default:
                            return null
                    }
                },
                pY = function() {
                    var e, t, n = pl(),
                        r = n.state,
                        o = r.resources,
                        i = r.requestService,
                        a = r.sessions,
                        l = r.unknownSessions,
                        u = r.hasMore,
                        c = r.nextCursor,
                        s = r.numSessionsToDisplay,
                        f = (r.userHasConsoleSession, r.modalState),
                        d = n.dispatch,
                        p = pz((0, e9.useState)(null), 2),
                        y = p[0],
                        v = p[1],
                        m = pz((0, e9.useState)(!1), 2),
                        b = m[0],
                        h = m[1],
                        g = pz((0, e9.useState)(!1), 2),
                        O = g[0],
                        S = g[1],
                        w = pz((0, e9.useState)(!1), 2),
                        E = w[0],
                        A = w[1],
                        N = (0, e9.useRef)(null),
                        j = function() {
                            d({
                                type: d0.SET_MODAL_STATE,
                                modalState: d2.NONE,
                                session: null
                            })
                        },
                        x = function() {
                            var e;
                            return (e = function() {
                                var e, t, n, r, l;
                                return function(e, t) {
                                    var n, r, o, i = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                        return this
                                    }), a;

                                    function l(l) {
                                        return function(u) {
                                            var c = [l, u];
                                            if (n) throw TypeError("Generator is already executing.");
                                            for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                                if (n = 1, r && (o = 2 & c[0] ? r.return : c[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, c[1])).done) return o;
                                                switch (r = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = c;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: c[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, r = c[1], c = [0];
                                                        continue;
                                                    case 7:
                                                        c = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                            i.label = c[1];
                                                            break
                                                        }
                                                        if (6 === c[0] && i.label < o[1]) {
                                                            i.label = o[1], o = c;
                                                            break
                                                        }
                                                        if (o && i.label < o[2]) {
                                                            i.label = o[2], i.ops.push(c);
                                                            break
                                                        }
                                                        o[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                c = t.call(e, i)
                                            } catch (e) {
                                                c = [6, e], r = 0
                                            } finally {
                                                n = o = 0
                                            }
                                            if (5 & c[0]) throw c[1];
                                            return {
                                                value: c[0] ? c[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(f) {
                                    switch (f.label) {
                                        case 0:
                                            if (e = c, t = u, n = null, r = 10, !(u && a.length < s + r)) return [3, 2];
                                            return h(!0), [4, dG(i, c)];
                                        case 1:
                                            if ((l = f.sent()).isError) return h(!1), v("".concat(o.Message.Error.Default, " ").concat(o.Action.PleaseTryAgain)), [2];
                                            n = l.sessions, e = l.nextCursor, t = l.hasMore, f.label = 2;
                                        case 2:
                                            return h(!1), v(null), d({
                                                type: d0.SHOW_MORE,
                                                sessionsToAdd: n,
                                                nextCursor: e,
                                                hasMore: t,
                                                amountToShowMore: r
                                            }), [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    n = arguments;
                                return new Promise(function(r, o) {
                                    var i = e.apply(t, n);

                                    function a(e) {
                                        pB(i, r, o, a, l, "next", e)
                                    }

                                    function l(e) {
                                        pB(i, r, o, a, l, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        };
                    (0, e9.useEffect)(function() {
                        var e = N.current;
                        null !== e && !O && window.location.search.includes("scroll-to-session-management") && (S(!0), setTimeout(function() {
                            return e.scrollIntoView({
                                behavior: "smooth",
                                block: "start"
                            })
                        }, 1750))
                    }, [O]);
                    var I = a.slice(0, s),
                        T = I.map(function(e, t) {
                            return (0, e7.jsx)(pM, {
                                session: e,
                                isLastSessionToDisplay: t === a.length - 1 && !u && 0 === l.length
                            }, e.token)
                        }),
                        P = a.length > I.length || u;
                    l.length > 0 && T.push((0, e7.jsx)(pV, {
                        isLastSessionToDisplay: !P
                    }));
                    var D = pH(f);
                    return (0, e7.jsxs)(ai, {
                        className: "flex flex-col padding-large",
                        ref: N,
                        children: [(0, e7.jsx)(ao, {
                            title: o.Header.DevicesWhereYouAreLoggedIn,
                            description: o.Description.ConfidenceTrusted,
                            trailing: (0, e7.jsx)(cT, {
                                position: "top-start",
                                title: o.Label.TooltipTitle,
                                description: o.Label.ApproximateLocationAndTimestamp,
                                open: E,
                                onOpenChange: A,
                                children: (0, e7.jsx)(cP, {
                                    asChild: !0,
                                    children: (0, e7.jsx)(c6, {
                                        icon: "icon-regular-circle-question",
                                        size: "Small",
                                        variant: "Utility",
                                        ariaLabel: o.Label.ApproximateLocationAndTimestamp,
                                        isCircular: !0,
                                        onClick: function() {
                                            return A(function(e) {
                                                return !e
                                            })
                                        }
                                    })
                                })
                            }),
                            isContained: !0,
                            divider: "Full",
                            className: "padding-y-large"
                        }), 0 === a.length ? (0, e7.jsx)("span", {
                            className: "spinner spinner-default spinner-no-margin modal-margin-bottom-large"
                        }) : (0, e7.jsxs)(te().Fragment, {
                            children: [T, P && (b ? (0, e7.jsx)("span", {
                                className: "spinner spinner-xs spinner-no-margin"
                            }) : (0, e7.jsxs)("div", {
                                children: [(0, e7.jsx)("div", {
                                    className: "show-more text-new-line modal-margin-bottom",
                                    role: "button",
                                    onClick: x,
                                    onKeyDown: function(e) {
                                        "Enter" === e.key && x()
                                    },
                                    tabIndex: 0,
                                    children: o.Action.ShowMore
                                }), (0, e7.jsx)("p", {
                                    className: "text-error xsmall",
                                    children: y
                                }), y && (0, e7.jsx)("div", {
                                    className: "text-new-line"
                                })]
                            })), (0, e7.jsx)(sa, {
                                className: "margin-y-medium",
                                onClick: function() {
                                    d({
                                        type: d0.SET_MODAL_STATE,
                                        modalState: d2.LOG_OUT_OF_ALL_SESSIONS,
                                        session: null
                                    })
                                },
                                size: "Large",
                                variant: "Standard",
                                isDisabled: b,
                                children: o.Action.LogOutAllSessions
                            })]
                        }), D && (0, e7.jsx)(dU, (e = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {},
                                    r = Object.keys(n);
                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                }))), r.forEach(function(t) {
                                    var r;
                                    r = n[t], t in e ? Object.defineProperty(e, t, {
                                        value: r,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = r
                                })
                            }
                            return e
                        }({
                            open: !0,
                            onOpenChange: function(e) {
                                e || j()
                            },
                            size: D.size,
                            isModal: !0
                        }, D.hasCloseAffordance ? {
                            hasCloseAffordance: !0,
                            closeLabel: o.Action.Cancel
                        } : {
                            hasCloseAffordance: !1
                        }), t = t = {
                            children: (0, e7.jsx)(dk, {
                                className: "width-full",
                                children: (0, e7.jsx)(dM, {
                                    children: (0, e7.jsx)(D.innerFragment, {
                                        closeModal: j
                                    })
                                })
                            })
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                            var n = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                n.push.apply(n, r)
                            }
                            return n
                        })(Object(t)).forEach(function(n) {
                            Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                        }), e))]
                    })
                },
                pG = (0, i1.withTranslations)(function(e) {
                    var t = e.eventService,
                        n = e.requestService,
                        r = e.numSessionsToDisplay,
                        o = e.userHasConsoleSession,
                        i = e.translate;
                    return (0, e7.jsx)(i0.QueryClientProvider, {
                        client: i1.queryClient,
                        children: (0, e7.jsx)(pa, {
                            eventService: t,
                            requestService: n,
                            numSessionsToDisplay: r,
                            userHasConsoleSession: o,
                            translate: i,
                            children: (0, e7.jsx)(pY, {})
                        })
                    })
                }, {
                    common: [],
                    feature: "Feature.SessionManagement"
                }),
                pX = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function")
                    }
                    return e = [{
                            key: "sendSignedOutOfAllSessionsEvent",
                            value: function() {
                                to().EventStream.SendEventWithTarget(i2, i4, {}, to().EventStream.TargetTypes.WWW)
                            }
                        }, {
                            key: "sendSignedOutOfSessionEvent",
                            value: function(e) {
                                to().EventStream.SendEventWithTarget(i2, i3, {
                                    sessionId: e
                                }, to().EventStream.TargetTypes.WWW)
                            }
                        }, {
                            key: "sendOpenedSessionDetailsEvent",
                            value: function(e) {
                                to().EventStream.SendEventWithTarget(i2, i6, {
                                    sessionId: e
                                }, to().EventStream.TargetTypes.WWW)
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }(),
                p$ = new function e() {
                    if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                    iZ(this, "captcha", eC), iZ(this, "captchaV2", eR), iZ(this, "email", eL), iZ(this, "fido2", e4), iZ(this, "games", eU), iZ(this, "metrics", eZ), iZ(this, "myAccount", ek), iZ(this, "otp", eM), iZ(this, "password", eW), iZ(this, "phone", eF), iZ(this, "playstation", eV), iZ(this, "promptAssignments", eK), iZ(this, "securityQuestions", eY), iZ(this, "sessionManagement", eG), iZ(this, "rostile", eH), iZ(this, "thumbnails", eX), iZ(this, "turnstile", e$), iZ(this, "twoStepVerification", eQ), iZ(this, "universalAppConfiguration", eq), iZ(this, "proofOfSpace", eB), iZ(this, "proofOfWork", ez), iZ(this, "xbox", eJ), iZ(this, "privateAccessToken", e0), iZ(this, "genericChallenge", e1), iZ(this, "authApi", e2), iZ(this, "accountRecoveryApi", e3), iZ(this, "legacyAccountInfoApi", e6), iZ(this, "userSettingsApi", e5), iZ(this, "usersApi", e8)
                };
            Object.assign(to(), {
                SessionManagement: {
                    renderComponent: function(e) {
                        var t = document.getElementById(e.containerId);
                        if (null !== t) {
                            (0, tt.unmountComponentAtNode)(t);
                            var n = new pX,
                                r = e.userHasConsoleSession || !1;
                            return (0, tt.render)((0, e7.jsx)(pG, {
                                eventService: n,
                                requestService: p$,
                                numSessionsToDisplay: 10,
                                userHasConsoleSession: r
                            }), t), !0
                        }
                        return !1
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SessionManagement");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/sessionManagement-c037e3b48f20116d.js.map