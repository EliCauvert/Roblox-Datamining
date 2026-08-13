! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "efae49a10806570f8c2719631f8ca58f72863884"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "a91fcd1d-0ec4-4b5c-89e5-940e76329950", e._sentryDebugIdIdentifier = "sentry-dbid-a91fcd1d-0ec4-4b5c-89e5-940e76329950")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {
            206: function(e, t, r) {
                e.exports = {}
            },
            530: function(e, t, r) {
                e.exports = {}
            },
            237: function(e, t, r) {
                e.exports = {}
            },
            969: function(e, t, r) {
                e.exports = {}
            },
            970: function(e, t, r) {
                e.exports = {}
            },
            183: function(e, t, r) {
                e.exports = {}
            },
            712: function(e, t, r) {
                e.exports = {}
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
    }
    r.m = e, r.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return r.d(t, {
            a: t
        }), t
    }, r.d = function(e, t) {
        for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, r.k = function(e) {
        return "" + e + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, r.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (n = r.g.location + "");
    var n, o = r.g.document;
    if (!n && o && (o.currentScript && "SCRIPT" === o.currentScript.tagName.toUpperCase() && (n = o.currentScript.src), !n)) {
        var i = o.getElementsByTagName("script");
        if (i.length)
            for (var a = i.length - 1; a > -1 && (!n || !/^http(s?):/.test(n));) n = i[a--].src
    }
    if (!n) throw Error("Automatic publicPath is not supported in this browser");
    r.p = n.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            var e, t, n, o, i, a, s, c, u, l, p, f, d, h, S, v, E, m, A, y, b, N, _, O, T, I, w, g, R, C, D, P, U, L, M, x, j, k, F, V, W, B, H, Y, G, K, Q, X, q, z, $, J, Z, ee, et, er, en, eo, ei, ea, es, ec, eu, el, ep, ef, ed, eh, eS, ev, eE, em, eA, ey = {};
            r.r(ey), r.d(ey, {
                getMetadata: function() {
                    return tc
                }
            });
            var eb = {};
            r.r(eb), r.d(eb, {
                getEmailConfiguration: function() {
                    return tS
                },
                updateForCurrentUser: function() {
                    return td
                },
                updateForCurrentUserWithVerification: function() {
                    return th
                }
            });
            var eN = {};
            r.r(eN), r.d(eN, {
                submitCaptcha: function() {
                    return tN
                }
            });
            var e_ = {};
            r.r(e_), r.d(e_, {
                getDetailsForUniverseIds: function() {
                    return tI
                }
            });
            var eO = {};
            r.r(eO), r.d(eO, {
                getMySettingsInfo: function() {
                    return tR
                }
            });
            var eT = {};
            r.r(eT), r.d(eT, {
                getMetadata: function() {
                    return tB
                },
                resendCode: function() {
                    return tV
                },
                sendCodeForUser: function() {
                    return tF
                },
                validateCode: function() {
                    return tW
                }
            });
            var eI = {};
            r.r(eI), r.d(eI, {
                changeForCurrentUser: function() {
                    return t$
                },
                resetSendPrompted: function() {
                    return tJ
                },
                validate: function() {
                    return tZ
                }
            });
            var ew = {};
            r.r(ew), r.d(ew, {
                getPhoneConfiguration: function() {
                    return ri
                },
                getPhonePrefixList: function() {
                    return rs
                },
                prioritizeDefaultPrefix: function() {
                    return ra
                },
                resendCode: function() {
                    return rl
                },
                updatePhone: function() {
                    return rc
                },
                verifyCode: function() {
                    return ru
                }
            });
            var eg = {};
            r.r(eg), r.d(eg, {
                disconnectPlaystation: function() {
                    return rE
                },
                getPlaystationConnection: function() {
                    return rv
                }
            });
            var eR = {};
            r.r(eR), r.d(eR, {
                getAllForCurrentUser: function() {
                    return rg
                },
                updateForCurrentUser: function() {
                    return rR
                }
            });
            var eC = {};
            r.r(eC), r.d(eC, {
                verifyPuzzle: function() {
                    return rL
                }
            });
            var eD = {};
            r.r(eD), r.d(eD, {
                getPuzzle: function() {
                    return rW
                },
                verifyPuzzle: function() {
                    return rB
                }
            });
            var eP = {};
            r.r(eP), r.d(eP, {
                verifyPuzzle: function() {
                    return rQ
                }
            });
            var eU = {};
            r.r(eU), r.d(eU, {
                answerQuestion: function() {
                    return r0
                },
                getQuestion: function() {
                    return rZ
                }
            });
            var eL = {};
            r.r(eL), r.d(eL, {
                getSessions: function() {
                    return nn
                },
                logoutFromAllSessionsAndReauthenticate: function() {
                    return ni
                },
                logoutSession: function() {
                    return no
                }
            });
            var eM = {};
            r.r(eM), r.d(eM, {
                getIconsForUniverseIds: function() {
                    return nu
                }
            });
            var ex = {};
            r.r(ex), r.d(ex, {
                getMetadata: function() {
                    return nd
                }
            });
            var ej = {};
            r.r(ej), r.d(ej, {
                clearRecoveryCodes: function() {
                    return nK
                },
                deleteSecurityKey: function() {
                    return n2
                },
                disableAuthenticator: function() {
                    return nH
                },
                disableEmailTwoStepVerification: function() {
                    return nF
                },
                disableSmsTwoStepVerification: function() {
                    return n$
                },
                enableAuthenticator: function() {
                    return nV
                },
                enableEmailTwoStepVerification: function() {
                    return nx
                },
                enableSecurityKey: function() {
                    return nJ
                },
                enableSmsTwoStepVerification: function() {
                    return nX
                },
                enableVerifyAuthenticator: function() {
                    return nW
                },
                enableVerifySecurityKey: function() {
                    return nZ
                },
                generateRecoveryCodes: function() {
                    return nQ
                },
                generateResaleFrictionChallenge: function() {
                    return ot
                },
                generateSpendFrictionChallenge: function() {
                    return n9
                },
                generateTradeFrictionChallenge: function() {
                    return oe
                },
                getMetadata: function() {
                    return nL
                },
                getPasskeyOptions: function() {
                    return n3
                },
                getRecoveryCodesStatus: function() {
                    return nG
                },
                getResaleFrictionStatus: function() {
                    return n8
                },
                getSecurityKeyOptions: function() {
                    return n0
                },
                getSpendFrictionStatus: function() {
                    return n5
                },
                getTradeFrictionStatus: function() {
                    return n7
                },
                getUserConfiguration: function() {
                    return nM
                },
                listSecurityKey: function() {
                    return n4
                },
                redeemResaleFrictionChallenge: function() {
                    return oo
                },
                redeemSpendFrictionChallenge: function() {
                    return or
                },
                redeemTradeFrictionChallenge: function() {
                    return on
                },
                retractCrossDevice: function() {
                    return os
                },
                retryCrossDevice: function() {
                    return oi
                },
                sendEmailCode: function() {
                    return nj
                },
                sendSmsCode: function() {
                    return nq
                },
                verifyAuthenticatorCode: function() {
                    return nB
                },
                verifyCrossDevice: function() {
                    return oa
                },
                verifyEmailCode: function() {
                    return nk
                },
                verifyPasskeyCredential: function() {
                    return n6
                },
                verifyPasswordCode: function() {
                    return oc
                },
                verifyRecoveryCode: function() {
                    return nY
                },
                verifySecurityKeyCredential: function() {
                    return n1
                },
                verifySmsCode: function() {
                    return nz
                }
            });
            var ek = {};
            r.r(ek), r.d(ek, {
                getSettingsUiPolicy: function() {
                    return op
                }
            });
            var eF = {};
            r.r(eF), r.d(eF, {
                disconnectXbox: function() {
                    return oE
                },
                getXboxConnection: function() {
                    return ov
                }
            });
            var eV = {};
            r.r(eV), r.d(eV, {
                recordMetric: function() {
                    return ob
                }
            });
            var eW = {};
            r.r(eW), r.d(eW, {
                getPatToken: function() {
                    return oI
                }
            });
            var eB = {};
            r.r(eB), r.d(eB, {
                continueChallenge: function() {
                    return oD
                }
            });
            var eH = {};
            r.r(eH), r.d(eH, {
                PasswordDeletionSource: function() {
                    return oJ
                },
                deletePasskeyBatch: function() {
                    return o4
                },
                finishARPreAuthPasskeyRegistration: function() {
                    return o2
                },
                finishPasskeyRegistration: function() {
                    return o1
                },
                invalidateTicketsForEppEnrollment: function() {
                    return o5
                },
                listAllCredentials: function() {
                    return o3
                },
                resetPassword: function() {
                    return o6
                },
                startPasskeyRegistration: function() {
                    return oZ
                },
                startPreAuthPasskeyRegistration: function() {
                    return o0
                }
            });
            var eY = {};
            r.r(eY), r.d(eY, {
                getNativeResponse: function() {
                    return o9
                },
                getNavigatorCredentials: function() {
                    return ie
                }
            });
            var eG = {};
            r.r(eG), r.d(eG, {
                continueRecovery: function() {
                    return ib
                },
                disableTwoStepMethod: function() {
                    return iT
                },
                getCurrentTwoStepMethod: function() {
                    return iO
                },
                recoverySessionMetadata: function() {
                    return iN
                },
                requestRecovery: function() {
                    return iv
                },
                resendCode: function() {
                    return im
                },
                sendCode: function() {
                    return iE
                },
                setEmail: function() {
                    return i_
                },
                verifyBackupCode: function() {
                    return iy
                },
                verifyCode: function() {
                    return iA
                }
            });
            var eK = {};
            r.r(eK), r.d(eK, {
                getAccountInfo: function() {
                    return ig
                }
            });
            var eQ = {};
            r.r(eQ), r.d(eQ, {
                changeEppStatus: function() {
                    return iP
                },
                userSettings: function() {
                    return iD
                }
            });
            var eX = {};
            r.r(eX), r.d(eX, {
                getUserById: function() {
                    return ij
                },
                getUserByUsername: function() {
                    return ik
                },
                getUsersByIds: function() {
                    return iF
                }
            }), r(206);
            var eq = window.ReactJSX,
                ez = window.Roblox,
                e$ = r.n(ez),
                eJ = window.React,
                eZ = r.n(eJ),
                e0 = window.ReactDOM;
            r(530), r(237), r(969), r(183), r(712);
            var e1 = window.CoreUtilities,
                e2 = function(e) {
                    return {
                        isError: !1,
                        value: e
                    }
                },
                e4 = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: e,
                        errorRaw: t,
                        errorStatusCode: r
                    }
                },
                e3 = function(e, t) {
                    return e.isError ? e : e2(t(e.value))
                };

            function e6(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function e5(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            e6(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            e6(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function e7(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function e8(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var e9 = function(e) {
                    var t, r = [];
                    if (!e || (void 0 === e ? "undefined" : e7(e)) !== "object") return [];
                    var n = e.errors;
                    return (null != (t = Array) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? t[Symbol.hasInstance](n) : n instanceof t) ? (n.forEach(function(e) {
                        if (e && (void 0 === e ? "undefined" : e7(e)) === "object") {
                            var t = e.code;
                            "number" == typeof t && r.push(t)
                        }
                    }), r) : []
                },
                te = function(e) {
                    return (void 0 === e ? "undefined" : e7(e)) !== "object" ? null : e9(e.data)[0] || null
                },
                tt = function(e, t) {
                    return null == e ? null : Object.values(e).includes(t) ? t : null
                },
                tr = function(e) {
                    if ((void 0 === e ? "undefined" : e7(e)) !== "object" || null === e) return null;
                    var t = e.status || null;
                    return "number" != typeof t ? null : t
                },
                tn = function(e, t, r) {
                    return e5(function() {
                        var n, o, i, a;
                        return e8(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    return s.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (n = s.sent(), void 0 !== r) return [2, e2(r(n.data))];
                                    return [2, e2(n.data)];
                                case 2:
                                    return i = te(o = s.sent()), a = tr(o), [2, e4(tt(t, i), o, a)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                to = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : te,
                        n = arguments.length > 3 ? arguments[3] : void 0;
                    return e5(function() {
                        var o, i;
                        return e8(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return a.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (o = a.sent(), void 0 !== n) return [2, e2(n(o))];
                                    return [2, e2(o)];
                                case 2:
                                    return [2, e4(tt(t, r(i = a.sent())), i, 0)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                ti = null != (X = ez.EnvironmentUrls.apiGatewayCdnUrl) ? X : "URL_NOT_FOUND",
                ta = ((e = {})[e.UNKNOWN = 0] = "UNKNOWN", e),
                ts = {
                    url: "".concat("".concat(ti, "/captcha"), "/v1/metadata"),
                    timeout: 6e4
                },
                tc = function() {
                    return tn(e1.httpService.get(ts, {}), ta)
                },
                tu = null != (q = ez.EnvironmentUrls.accountSettingsApi) ? q : "URL_NOT_FOUND",
                tl = ((t = {})[t.UNKNOWN = 0] = "UNKNOWN", t[t.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", t[t.TOO_MANY_ACCOUNTS_ON_EMAIL = 3] = "TOO_MANY_ACCOUNTS_ON_EMAIL", t[t.UPDATED_EMAIL_IS_EXISTING_EMAIL = 4] = "UPDATED_EMAIL_IS_EXISTING_EMAIL", t[t.TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL = 6] = "TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL", t[t.INVALID_EMAIL_ADDRESS = 9] = "INVALID_EMAIL_ADDRESS", t),
                tp = {
                    withCredentials: !0,
                    url: "".concat(tu, "/v1/email"),
                    timeout: 1e4
                },
                tf = {
                    withCredentials: !0,
                    url: "".concat(tu, "/v1/email"),
                    timeout: 1e4
                },
                td = function(e) {
                    return tn(e1.httpService.post(tp, {
                        emailAddress: e,
                        skipVerificationEmail: !0
                    }), tl)
                },
                th = function(e) {
                    return tn(e1.httpService.post(tp, {
                        emailAddress: e,
                        skipVerificationEmail: !1
                    }), tl)
                },
                tS = function() {
                    return tn(e1.httpService.get(tf), tl)
                },
                tv = window.Roblox["core-scripts"].http.http,
                tE = window.Roblox["core-scripts"].environmentUrls,
                tm = r.n(tE),
                tA = tm().apiGatewayUrl,
                ty = ((n = {})[n.UNKNOWN = 0] = "UNKNOWN", n[n.INVALID_REQUEST = 1] = "INVALID_REQUEST", n[n.SESSION_NOT_FOUND = 2] = "SESSION_NOT_FOUND", n[n.INTERNAL_ERROR = 3] = "INTERNAL_ERROR", n),
                tb = {
                    withCredentials: !0,
                    url: "".concat(tA, "/v2/captcha"),
                    timeout: 1e4,
                    headers: {
                        Accept: "application/json"
                    }
                },
                tN = function(e) {
                    return tn(tv.post(tb, {
                        challenge_id: e
                    }), ty)
                },
                t_ = null != (z = ez.EnvironmentUrls.gamesApi) ? z : "URL_NOT_FOUND",
                tO = ((o = {})[o.UNKNOWN = 0] = "UNKNOWN", o),
                tT = {
                    url: "".concat(t_, "/v1/games"),
                    timeout: 1e4
                },
                tI = function(e) {
                    return tn(e1.httpService.get(tT, {
                        universeIds: e
                    }), tO)
                },
                tw = ((i = {})[i.UNKNOWN = 0] = "UNKNOWN", i),
                tg = {
                    withCredentials: !0,
                    url: "/my/settings/json",
                    timeout: 1e4
                },
                tR = function() {
                    return tn(e1.httpService.get(tg, {}), tw)
                },
                tC = null != ($ = ez.EnvironmentUrls.apiGatewayUrl) ? $ : "URL_NOT_FOUND",
                tD = "".concat(tC, "/otp-service"),
                tP = ((a = {})[a.NO_ERROR = 0] = "NO_ERROR", a[a.UNKNOWN = 1] = "UNKNOWN", a[a.INVALID_CODE = 2] = "INVALID_CODE", a[a.INVALID_SESSION_TOKEN = 3] = "INVALID_SESSION_TOKEN", a[a.CODE_EXPIRED = 4] = "CODE_EXPIRED", a[a.UNVALIDATED_SESSION_TOKEN = 5] = "UNVALIDATED_SESSION_TOKEN", a[a.TOO_MANY_REQUESTS = 6] = "TOO_MANY_REQUESTS", a[a.CONTACT_MALFORMED = 7] = "CONTACT_MALFORMED", a[a.VPN_REQUIRED = 8] = "VPN_REQUIRED", a[a.UNAUTHENTICATED = 9] = "UNAUTHENTICATED", a[a.METHOD_UNAVAILABLE = 10] = "METHOD_UNAVAILABLE", a),
                tU = {
                    withCredentials: !0,
                    url: "".concat(tD, "/v1/sendCodeForUser"),
                    timeout: 1e4
                },
                tL = {
                    withCredentials: !0,
                    url: "".concat(tD, "/v1/resendCode"),
                    timeout: 1e4
                },
                tM = {
                    withCredentials: !0,
                    url: "".concat(tD, "/v1/validateCode"),
                    timeout: 1e4
                },
                tx = {
                    withCredentials: !0,
                    url: "".concat(tD, "/v1/metadata"),
                    timeout: 1e4
                },
                tj = ((s = {}).Reauth = "Reauth", s.Challenge = "Challenge", s),
                tk = ((c = {}).Default = "Default", c),
                tF = function(e) {
                    return tn(e1.httpService.post(tU, {
                        contactType: e,
                        origin: tj.Reauth,
                        messageVariant: tk.Default
                    }), tP)
                },
                tV = function(e, t) {
                    return tn(e1.httpService.post(tL, {
                        contactType: e,
                        origin: tj.Reauth,
                        otpSessionToken: t
                    }), tP)
                },
                tW = function(e, t, r) {
                    return tn(e1.httpService.post(tM, {
                        contactType: e,
                        origin: tj.Reauth,
                        passCode: r,
                        otpSessionToken: t
                    }), tP)
                },
                tB = function(e) {
                    return tn(e1.httpService.get(tx, {
                        Origin: e
                    }), tP)
                },
                tH = null != (J = ez.EnvironmentUrls.authApi) ? J : "URL_NOT_FOUND",
                tY = ((u = {})[u.FLOODED = 2] = "FLOODED", u[u.INVALID_PASSWORD = 7] = "INVALID_PASSWORD", u[u.INVALID_CURRENT_PASSWORD = 8] = "INVALID_CURRENT_PASSWORD", u),
                tG = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v2/user/passwords/change"),
                    timeout: 1e4
                },
                tK = ((l = {})[l.USER_DOES_NOT_HAVE_EMAIL = 22] = "USER_DOES_NOT_HAVE_EMAIL", l),
                tQ = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v2/passwords/reset/send-prompted"),
                    timeout: 1e4
                },
                tX = ((p = {})[p.VALID_PASSWORD = 0] = "VALID_PASSWORD", p[p.WEAK_PASSWORD = 1] = "WEAK_PASSWORD", p[p.SHORT_PASSWORD = 2] = "SHORT_PASSWORD", p[p.PASSWORD_SAME_AS_USERNAME = 3] = "PASSWORD_SAME_AS_USERNAME", p[p.FORBIDDEN_PASSWORD = 4] = "FORBIDDEN_PASSWORD", p[p.DUMB_STRINGS = 5] = "DUMB_STRINGS", p),
                tq = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v2/passwords/validate"),
                    timeout: 1e4
                };

            function tz(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var t$ = function(e, t) {
                    return tn(e1.httpService.post(tG, {
                        currentPassword: e,
                        newPassword: t
                    }), tY)
                },
                tJ = function() {
                    return tn(e1.httpService.post(tQ), tK)
                },
                tZ = function(e, t) {
                    var r;
                    return (r = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, tn(e1.httpService.post(tq, {
                                username: e,
                                password: t
                            }), null).then(function(e) {
                                return e3(e, function(e) {
                                    return tt(tX, e.code)
                                })
                            })]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                tz(i, n, o, a, s, "next", e)
                            }

                            function s(e) {
                                tz(i, n, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                t0 = "URL_NOT_FOUND",
                t1 = null != (Z = ez.EnvironmentUrls.accountInformationApi) ? Z : t0,
                t2 = null != (ee = ez.EnvironmentUrls.apiGatewayUrl) ? ee : t0,
                t4 = ((f = {})[f.UNKNOWN = 0] = "UNKNOWN", f),
                t3 = {
                    withCredentials: !0,
                    url: "".concat(t1, "/v1/phone"),
                    timeout: 1e4
                },
                t6 = {
                    withCredentials: !0,
                    url: "".concat(t1, "/v1/phone"),
                    timeout: 1e4
                },
                t5 = {
                    withCredentials: !0,
                    url: "".concat(t1, "/v1/phone/verify"),
                    timeout: 1e4
                },
                t7 = {
                    withCredentials: !0,
                    url: "".concat(t1, "/v1/phone/resend"),
                    timeout: 1e4
                },
                t8 = ((d = {})[d.UNKNOWN = 0] = "UNKNOWN", d[d.INVALID = 2] = "INVALID", d),
                t9 = ((h = {})[h.UNKNOWN = 0] = "UNKNOWN", h[h.INVALID = 7] = "INVALID", h),
                re = ((S = {})[S.UNKNOWN = 0] = "UNKNOWN", S),
                rt = {
                    withCredentials: !0,
                    url: "".concat(t2, "/phone-number-api/v1/phone-prefix-list"),
                    timeout: 1e4
                };

            function rr(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function rn(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            rr(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            rr(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ro(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ri = function() {
                    return rn(function() {
                        return ro(this, function(e) {
                            return [2, tn(e1.httpService.get(t3, {}), t4)]
                        })
                    })()
                },
                ra = function(e) {
                    var t = e.find(function(e) {
                            return e.isDefault
                        }),
                        r = e;
                    return void 0 !== t && (r = e.filter(function(e) {
                        return e.code !== t.code
                    })).unshift(t), r
                },
                rs = function() {
                    return rn(function() {
                        return ro(this, function(e) {
                            return [2, tn(e1.httpService.get(rt, {}), t4, ra)]
                        })
                    })()
                },
                rc = function(e) {
                    return rn(function() {
                        return ro(this, function(t) {
                            return [2, tn(e1.httpService.post(t6, e), t8)]
                        })
                    })()
                },
                ru = function(e) {
                    return rn(function() {
                        return ro(this, function(t) {
                            return [2, tn(e1.httpService.post(t5, e), t9)]
                        })
                    })()
                },
                rl = function(e) {
                    return rn(function() {
                        return ro(this, function(t) {
                            return [2, tn(e1.httpService.post(t7, e), re)]
                        })
                    })()
                },
                rp = null != (et = ez.EnvironmentUrls.authApi) ? et : "URL_NOT_FOUND",
                rf = "palisades-live",
                rd = ((v = {})[v.UNKNOWN = 0] = "UNKNOWN", v),
                rh = {
                    withCredentials: !0,
                    url: "".concat(rp, "/v1/").concat(rf, "/is-live"),
                    timeout: 1e4
                },
                rS = {
                    withCredentials: !0,
                    url: "".concat(rp, "/v1/").concat(rf, "/disconnect"),
                    timeout: 1e4
                },
                rv = function() {
                    return tn(e1.httpService.get(rh, {}), rd)
                },
                rE = function() {
                    return tn(e1.httpService.post(rS, {}), rd)
                },
                rm = null != (er = ez.EnvironmentUrls.apiGatewayUrl) ? er : "URL_NOT_FOUND",
                rA = "".concat(rm, "/account-security-service"),
                ry = ((E = {})[E.UNKNOWN = 1] = "UNKNOWN", E[E.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", E[E.PROMPT_ASSIGNMENT_WAS_NOT_UPDATED = 3] = "PROMPT_ASSIGNMENT_WAS_NOT_UPDATED", E[E.UNKNOWN_PROMPT_TYPE = 4] = "UNKNOWN_PROMPT_TYPE", E),
                rb = ((m = {}).TEXT_ONLY_BANNER = "DISPLAY_TYPE_TEXT_ONLY_BANNER", m),
                rN = ((A = {}).GLOBAL = "PAGE_RESTRICTION_GLOBAL", A.HOME_PAGE_ONLY = "PAGE_RESTRICTION_HOME_PAGE", A),
                r_ = ((y = {}).CHANGE_PASSWORD__SUSPECTED_COMPROMISE = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", y.CHANGE_PASSWORD__BREACHED_CREDENTIAL = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", y.AUTHENTICATOR_UPSELL = "PROMPT_TYPE_AUTHENTICATOR_UPSELL", y.ACCOUNT_RESTORES_POLICY_UPDATE = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", y.ACCOUNT_RESTORES_POLICY_UPDATE_V2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", y.ACCOUNT_RESTORES_POLICY_UPDATE_V3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", y.ACCOUNT_RESTORES_POLICY_UPSELL = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL", y.BROADER_AUTHENTICATOR_UPSELL = "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL", y.EMAIL_2SV_UPSELL = "PROMPT_TYPE_EMAIL_2SV_UPSELL", y),
                rO = {
                    withCredentials: !0,
                    url: "".concat(rA, "/v1/prompt-assignments"),
                    timeout: 1e4
                },
                rT = ((b = {}).DISMISS_PROMPT = "DISMISS_PROMPT", b.DISABLE_PROMPT = "DISABLE_PROMPT", b),
                rI = {
                    withCredentials: !0,
                    url: "".concat(rA, "/v1/prompt-assignments"),
                    timeout: 1e4
                };

            function rw(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var rg = function() {
                    var e;
                    return (e = function() {
                        var e;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, tn(e1.httpService.get(rO, {
                                        shouldReturnMetadata: !0
                                    }), ry)];
                                case 1:
                                    var r, n;
                                    if ((e = t.sent()).isError) return [2, e];
                                    return r = function(e) {
                                        for (var t = 1; t < arguments.length; t++) {
                                            var r = null != arguments[t] ? arguments[t] : {},
                                                n = Object.keys(r);
                                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                                            }))), n.forEach(function(t) {
                                                var n;
                                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                                    value: n,
                                                    enumerable: !0,
                                                    configurable: !0,
                                                    writable: !0
                                                }) : e[t] = n
                                            })
                                        }
                                        return e
                                    }({}, e), n = n = {
                                        value: e.value.filter(function(e) {
                                            return e.isGeneric ? Object.values(rb).includes(e.metadata.displayType) : Object.values(r_).includes(e.promptType)
                                        })
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                                        var r = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var n = Object.getOwnPropertySymbols(e);
                                            r.push.apply(r, n)
                                        }
                                        return r
                                    })(Object(n)).forEach(function(e) {
                                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                                    }), [2, e = r]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = e.apply(t, r);

                            function a(e) {
                                rw(i, n, o, a, s, "next", e)
                            }

                            function s(e) {
                                rw(i, n, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                rR = function(e, t) {
                    return tn(e1.httpService.post(rI, {
                        action: e,
                        promptType: t
                    }), ry)
                },
                rC = null != (en = ez.EnvironmentUrls.apiGatewayUrl) ? en : "URL_NOT_FOUND",
                rD = ((N = {})[N.UNKNOWN = 0] = "UNKNOWN", N[N.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", N[N.INVALID_REQUEST = 2] = "INVALID_REQUEST", N[N.INVALID_SESSION = 3] = "INVALID_SESSION", N),
                rP = {
                    withCredentials: !0,
                    url: "".concat("".concat(rC, "/proof-of-space"), "/v1/verify"),
                    timeout: 1e4
                };

            function rU(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var rL = function(e, t) {
                    var r;
                    return (r = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, tn(e1.httpService.post(rP, {
                                challengeId: e,
                                solution: t
                            }), rD)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                rU(i, n, o, a, s, "next", e)
                            }

                            function s(e) {
                                rU(i, n, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                rM = null != (eo = ez.EnvironmentUrls.apiGatewayUrl) ? eo : "URL_NOT_FOUND",
                rx = "".concat(rM, "/proof-of-work-service"),
                rj = ((_ = {})[_.UNKNOWN = 0] = "UNKNOWN", _[_.REQUEST_INVALID = 1] = "REQUEST_INVALID", _[_.SESSION_INACTIVE = 2] = "SESSION_INACTIVE", _),
                rk = {
                    withCredentials: !0,
                    url: "".concat(rx, "/v1/pow-puzzle"),
                    timeout: 1e4
                },
                rF = {
                    withCredentials: !0,
                    url: "".concat(rx, "/v1/pow-puzzle"),
                    timeout: 1e4
                };

            function rV(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var rW = function(e) {
                    return tn(e1.httpService.get(rk, {
                        sessionID: e
                    }), rj)
                },
                rB = function(e, t) {
                    var r;
                    return (r = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, tn(e1.httpService.post(rF, {
                                sessionID: e,
                                solution: t
                            }), rj)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                rV(i, n, o, a, s, "next", e)
                            }

                            function s(e) {
                                rV(i, n, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                rH = null != (ei = ez.EnvironmentUrls.apiGatewayUrl) ? ei : "URL_NOT_FOUND",
                rY = ((O = {})[O.UNKNOWN = 0] = "UNKNOWN", O[O.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", O[O.INVALID_REQUEST = 2] = "INVALID_REQUEST", O[O.INVALID_SESSION = 3] = "INVALID_SESSION", O),
                rG = {
                    withCredentials: !0,
                    url: "".concat("".concat(rH, "/rostile"), "/v1/verify"),
                    timeout: 1e4
                };

            function rK(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var rQ = function(e, t) {
                    var r;
                    return (r = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, tn(e1.httpService.post(rG, {
                                challengeId: e,
                                solution: t
                            }), rY)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                rK(i, n, o, a, s, "next", e)
                            }

                            function s(e) {
                                rK(i, n, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                rX = null != (ea = ez.EnvironmentUrls.apiGatewayUrl) ? ea : "URL_NOT_FOUND",
                rq = "".concat(rX, "/account-security-service"),
                rz = ((T = {})[T.UNKNOWN = 1] = "UNKNOWN", T[T.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", T[T.SECURITY_QUESTIONS_DISABLED = 3] = "SECURITY_QUESTIONS_DISABLED", T[T.SESSION_INACTIVE = 4] = "SESSION_INACTIVE", T[T.QUESTION_NOT_FOUND = 5] = "QUESTION_NOT_FOUND", T[T.ANSWER_WRONG_FORMAT = 6] = "ANSWER_WRONG_FORMAT", T),
                r$ = {
                    withCredentials: !0,
                    url: "".concat(rq, "/v1/security-question"),
                    timeout: 1e4
                },
                rJ = {
                    withCredentials: !0,
                    url: "".concat(rq, "/v1/security-question"),
                    timeout: 1e4
                },
                rZ = function(e, t) {
                    return tn(e1.httpService.get(r$, {
                        userId: e,
                        sessionId: t
                    }), rz)
                },
                r0 = function(e, t, r) {
                    return tn(e1.httpService.post(rJ, {
                        userId: e,
                        answer: t,
                        sessionId: r
                    }), rz)
                },
                r1 = "URL_NOT_FOUND",
                r2 = null != (es = ez.EnvironmentUrls.apiGatewayUrl) ? es : r1,
                r4 = null != (ec = ez.EnvironmentUrls.authApi) ? ec : r1,
                r3 = "".concat(r2, "/token-metadata-service"),
                r6 = ((I = {})[I.UNKNOWN = 1] = "UNKNOWN", I[I.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", I[I.ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN = 3] = "ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN", I),
                r5 = ((w = {})[w.UNKNOWN = 1] = "UNKNOWN", w),
                r7 = {
                    withCredentials: !0,
                    url: "".concat(r3, "/v1/sessions"),
                    timeout: 1e4
                },
                r8 = {
                    withCredentials: !0,
                    url: "".concat(r3, "/v1/logout"),
                    timeout: 1e4
                },
                r9 = {
                    withCredentials: !0,
                    url: "".concat(r4, "/v1/logoutfromallsessionsandreauthenticate"),
                    timeout: 1e4
                };

            function ne(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function nt(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            ne(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            ne(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nr(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nn = function(e, t) {
                    return nt(function() {
                        return nr(this, function(r) {
                            return [2, tn(e1.httpService.get(r7, {
                                nextCursor: e,
                                desiredLimit: t
                            }), r6)]
                        })
                    })()
                },
                no = function(e) {
                    return nt(function() {
                        return nr(this, function(t) {
                            return [2, tn(e1.httpService.post(r8, {
                                token: e
                            }), r6)]
                        })
                    })()
                },
                ni = function(e) {
                    return nt(function() {
                        return nr(this, function(t) {
                            return [2, tn(e1.httpService.post(r9, {
                                secureAuthenticationIntent: e
                            }), r5)]
                        })
                    })()
                },
                na = null != (eu = ez.EnvironmentUrls.thumbnailsApi) ? eu : "URL_NOT_FOUND",
                ns = ((g = {})[g.UNKNOWN = 0] = "UNKNOWN", g),
                nc = {
                    url: "".concat(na, "/v1/games/icons"),
                    timeout: 1e4
                },
                nu = function(e, t, r, n) {
                    return tn(e1.httpService.get(nc, {
                        universeIds: e,
                        size: t,
                        format: r,
                        isCircular: n
                    }), ns)
                },
                nl = tm().apiGatewayUrl,
                np = ((R = {})[R.UNKNOWN = 0] = "UNKNOWN", R),
                nf = {
                    url: "".concat(nl, "/turnstile-service/v1/metadata"),
                    timeout: 1e4
                },
                nd = function(e) {
                    return tn(tv.get(nf, {
                        challenge_id: e
                    }), np)
                },
                nh = window.CoreRobloxUtilities,
                nS = "URL_NOT_FOUND",
                nv = null != (el = ez.EnvironmentUrls.twoStepVerificationApi) ? el : nS,
                nE = null != (ep = ez.EnvironmentUrls.economyApi) ? ep : nS,
                nm = null != (ef = ez.EnvironmentUrls.tradesApi) ? ef : nS,
                nA = ((C = {})[C.UNKNOWN = 0] = "UNKNOWN", C[C.INVALID_CHALLENGE_ID = 1] = "INVALID_CHALLENGE_ID", C[C.INVALID_USER_ID = 2] = "INVALID_USER_ID", C[C.INVALID_EMAIL = 3] = "INVALID_EMAIL", C[C.INVALID_PASSWORD = 4] = "INVALID_PASSWORD", C[C.TOO_MANY_REQUESTS = 5] = "TOO_MANY_REQUESTS", C[C.PIN_LOCKED = 6] = "PIN_LOCKED", C[C.FEATURE_DISABLED = 7] = "FEATURE_DISABLED", C[C.NOT_ALLOWED = 8] = "NOT_ALLOWED", C[C.INVALID_CONFIGURATION = 9] = "INVALID_CONFIGURATION", C[C.INVALID_CODE = 10] = "INVALID_CODE", C[C.CONFIGURATION_ALREADY_ENABLED = 11] = "CONFIGURATION_ALREADY_ENABLED", C[C.INVALID_SETUP_TOKEN = 12] = "INVALID_SETUP_TOKEN", C[C.REAUTHENTICATION_REQUIRED = 13] = "REAUTHENTICATION_REQUIRED", C[C.INVALID_PHONE_NUMBER = 15] = "INVALID_PHONE_NUMBER", C[C.EXCEEDED_REGISTERED_KEYS_LIMIT = 16] = "EXCEEDED_REGISTERED_KEYS_LIMIT", C[C.INVALID_CREDENTIAL_NICKNAME = 17] = "INVALID_CREDENTIAL_NICKNAME", C[C.AUTHENTICATOR_CODE_ALREADY_USED = 18] = "AUTHENTICATOR_CODE_ALREADY_USED", C[C.CHALLENGE_DENIED = 19] = "CHALLENGE_DENIED", C[C.CROSS_DEVICE_DIALOG_EXPIRED = 20] = "CROSS_DEVICE_DIALOG_EXPIRED", C),
                ny = {
                    url: "".concat(nv, "/v1/metadata"),
                    withCredentials: !0,
                    timeout: 1e4
                },
                nb = {
                    withCredentials: !0,
                    url: "".concat(nE, "/v2/spend-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                nN = {
                    withCredentials: !0,
                    url: "".concat(nm, "/v1/trade-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                n_ = {
                    withCredentials: !0,
                    url: "".concat(nE, "/v2/resale-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                nO = {
                    withCredentials: !0,
                    url: "".concat(nE, "/v2/spend-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                nT = {
                    withCredentials: !0,
                    url: "".concat(nm, "/v1/trade-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                nI = {
                    withCredentials: !0,
                    url: "".concat(nE, "/v2/resale-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                nw = {
                    withCredentials: !0,
                    url: "".concat(nE, "/v2/spend-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                ng = {
                    withCredentials: !0,
                    url: "".concat(nm, "/v1/trade-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                nR = {
                    withCredentials: !0,
                    url: "".concat(nE, "/v2/resale-friction/two-step-verification/redeem"),
                    timeout: 1e4
                };

            function nC(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function nD(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            nC(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            nC(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nP(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nU = nh.cryptoUtil.generateSecureAuthIntentV2,
                nL = function(e) {
                    return tn(e1.httpService.get(ny, e || {}), nA)
                },
                nM = function(e, t) {
                    return tn(e1.httpService.get({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration"),
                        timeout: 1e4
                    }, t || {}), nA)
                },
                nx = function(e) {
                    return nD(function() {
                        var t, r, n;
                        return nP(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = e1.httpService.post, r = [{
                                        withCredentials: !0,
                                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/email/enable"),
                                        timeout: 1e4
                                    }], n = {}, [4, nU()];
                                case 1:
                                    return [2, tn.apply(void 0, [t.apply(e1.httpService, r.concat([(n.secureAuthenticationIntent = o.sent(), n)])), nA])]
                            }
                        })
                    })()
                },
                nj = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/email/send-code"),
                        timeout: 1e4
                    }, t), nA)
                },
                nk = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/email/verify"),
                        timeout: 1e4
                    }, t), nA)
                },
                nF = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/email/disable"),
                        timeout: 1e4
                    }, {}), nA)
                },
                nV = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/authenticator/enable"),
                        timeout: 1e4
                    }, {}), nA)
                },
                nW = function(e, t, r) {
                    return nD(function() {
                        var n, o, i;
                        return nP(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return n = e1.httpService.post, o = [{
                                        withCredentials: !0,
                                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/authenticator/enable-verify"),
                                        timeout: 1e4
                                    }], i = {
                                        setupToken: t,
                                        code: r
                                    }, [4, nU()];
                                case 1:
                                    return [2, tn.apply(void 0, [n.apply(e1.httpService, o.concat([(i.secureAuthenticationIntent = a.sent(), i)])), nA])]
                            }
                        })
                    })()
                },
                nB = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/authenticator/verify"),
                        timeout: 1e4
                    }, t), nA)
                },
                nH = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/authenticator/disable"),
                        timeout: 1e4
                    }, {}), nA)
                },
                nY = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/recovery-codes/verify"),
                        timeout: 1e4
                    }, t), nA)
                },
                nG = function(e) {
                    return tn(e1.httpService.get({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/recovery-codes"),
                        timeout: 1e4
                    }), nA)
                },
                nK = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/recovery-codes/clear"),
                        timeout: 1e4
                    }, {}), nA)
                },
                nQ = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/recovery-codes/regenerate"),
                        timeout: 1e4
                    }, {
                        password: "password"
                    }), nA)
                },
                nX = function(e) {
                    return nD(function() {
                        var t, r, n;
                        return nP(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = e1.httpService.post, r = [{
                                        withCredentials: !0,
                                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/sms/enable"),
                                        timeout: 1e4
                                    }], n = {}, [4, nU()];
                                case 1:
                                    return [2, tn.apply(void 0, [t.apply(e1.httpService, r.concat([(n.secureAuthenticationIntent = o.sent(), n)])), nA])]
                            }
                        })
                    })()
                },
                nq = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/sms/send-code"),
                        timeout: 1e4
                    }, t), nA)
                },
                nz = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/sms/verify"),
                        timeout: 1e4
                    }, t), nA)
                },
                n$ = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/sms/disable"),
                        timeout: 1e4
                    }, {}), nA)
                },
                nJ = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/security-key/enable"),
                        timeout: 1e4
                    }, {}), nA, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                nZ = function(e, t, r, n) {
                    return nD(function() {
                        var o, i, a;
                        return nP(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    return o = e1.httpService.post, i = [{
                                        withCredentials: !0,
                                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/security-key/enable-verify"),
                                        timeout: 1e4
                                    }], a = {
                                        sessionId: t,
                                        credentialNickname: r,
                                        attestationResponse: n
                                    }, [4, nU()];
                                case 1:
                                    return [2, tn.apply(void 0, [o.apply(e1.httpService, i.concat([(a.secureAuthenticationIntent = s.sent(), a)])), nA])]
                            }
                        })
                    })()
                },
                n0 = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/security-key/verify-start"),
                        timeout: 1e4
                    }, t), nA)
                },
                n1 = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/security-key/verify-finish"),
                        timeout: 1e4
                    }, t), nA)
                },
                n2 = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/security-key/disable"),
                        timeout: 1e4
                    }, {
                        credentialNicknames: t
                    }), nA)
                },
                n4 = function(e) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/configuration/security-key/list"),
                        timeout: 1e4
                    }, {}), nA)
                },
                n3 = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/passkey/verify-start"),
                        timeout: 1e4
                    }, t), nA)
                },
                n6 = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/passkey/verify-finish"),
                        timeout: 1e4
                    }, t), nA)
                },
                n5 = function() {
                    return tn(e1.httpService.get(nb, {}), nA)
                },
                n7 = function() {
                    return tn(e1.httpService.get(nN, {}), nA)
                },
                n8 = function() {
                    return tn(e1.httpService.get(n_, {}), nA)
                },
                n9 = function() {
                    return tn(e1.httpService.post(nO, {}), nA)
                },
                oe = function() {
                    return tn(e1.httpService.post(nT, {}), nA)
                },
                ot = function() {
                    return tn(e1.httpService.post(nI, {}), nA)
                },
                or = function(e, t) {
                    return tn(e1.httpService.post(nw, {
                        challengeToken: e,
                        verificationToken: t
                    }), nA)
                },
                on = function(e, t) {
                    return tn(e1.httpService.post(ng, {
                        challengeToken: e,
                        verificationToken: t
                    }), nA)
                },
                oo = function(e, t) {
                    return tn(e1.httpService.post(nR, {
                        challengeToken: e,
                        verificationToken: t
                    }), nA)
                },
                oi = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/cross-device/retry"),
                        timeout: 1e4
                    }, t), nA)
                },
                oa = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/cross-device/verify"),
                        timeout: 1e4
                    }, t), nA)
                },
                os = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/cross-device/retract"),
                        timeout: 1e4
                    }, t), nA)
                },
                oc = function(e, t) {
                    return tn(e1.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nv, "/v1/users/").concat(e, "/challenges/password/verify"),
                        timeout: 1e4
                    }, t), nA)
                },
                ou = ((D = {})[D.INTERNAL_ERROR = 9] = "INTERNAL_ERROR", D);

            function ol(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var op = function() {
                    var e;
                    return (e = function() {
                        var e;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return t.trys.push([0, 2, , 3]), [4, ez.Guac.callBehaviour("account-settings-ui")];
                                case 1:
                                    return [2, {
                                        isError: !1,
                                        value: t.sent()
                                    }];
                                case 2:
                                    return e = t.sent(), [2, {
                                        isError: !0,
                                        error: ou.INTERNAL_ERROR,
                                        errorRaw: e,
                                        errorStatusCode: null
                                    }];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = e.apply(t, r);

                            function a(e) {
                                ol(i, n, o, a, s, "next", e)
                            }

                            function s(e) {
                                ol(i, n, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                of = null != (ed = ez.EnvironmentUrls.authApi) ? ed : "URL_NOT_FOUND",
                od = ((P = {})[P.UNKNOWN = 0] = "UNKNOWN", P),
                oh = {
                    withCredentials: !0,
                    url: "".concat(of, "/v1/xbox/connection"),
                    timeout: 1e4
                },
                oS = {
                    withCredentials: !0,
                    url: "".concat(of, "/v1/xbox/disconnect"),
                    timeout: 1e4
                },
                ov = function() {
                    return tn(e1.httpService.get(oh, {}), od)
                },
                oE = function() {
                    return tn(e1.httpService.post(oS, {}), od)
                },
                om = null != (eh = ez.EnvironmentUrls.apiGatewayUrl) ? eh : "URL_NOT_FOUND",
                oA = ((U = {})[U.UNKNOWN = 1] = "UNKNOWN", U[U.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", U[U.INVAID_METRIC_NAME = 3] = "INVAID_METRIC_NAME", U[U.INVALID_METRIC_LABELS = 4] = "INVALID_METRIC_LABELS", U),
                oy = {
                    withCredentials: !0,
                    url: "".concat("".concat(om, "/account-security-service"), "/v1/metrics/record"),
                    timeout: 1e4
                },
                ob = function(e) {
                    return tn(e1.httpService.post(oy, e), oA)
                },
                oN = null != (eS = ez.EnvironmentUrls.apiGatewayUrl) ? eS : "URL_NOT_FOUND",
                o_ = ((L = {})[L.UNKNOWN = 0] = "UNKNOWN", L),
                oO = {
                    withCredentials: !0,
                    url: "".concat("".concat(oN, "/private-access-token"), "/v1/getPATToken"),
                    timeout: 1e4
                };

            function oT(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var oI = function(e) {
                    var t;
                    return (t = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            return [2, tn(e1.httpService.post(oO, {
                                challengeId: e
                            }), o_)]
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = t.apply(e, r);

                            function a(e) {
                                oT(i, n, o, a, s, "next", e)
                            }

                            function s(e) {
                                oT(i, n, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                ow = null != (ev = ez.EnvironmentUrls.apiGatewayUrl) ? ev : "URL_NOT_FOUND",
                og = ((M = {})[M.UNKNOWN = 1] = "UNKNOWN", M),
                oR = {
                    withCredentials: !0,
                    url: "".concat("".concat(ow, "/challenge"), "/v1/continue"),
                    timeout: 1e4
                };

            function oC(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var oD = function(e, t, r) {
                    var n;
                    return (n = function() {
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, tn(e1.httpService.post(oR, {
                                challengeId: e,
                                challengeType: t,
                                challengeMetadata: r
                            }), og)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                oC(i, r, o, a, s, "next", e)
                            }

                            function s(e) {
                                oC(i, r, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                oP = null != (eE = ez.EnvironmentUrls.authApi) ? eE : "URL_NOT_FOUND",
                oU = ((x = {})[x.UNKNOWN = 0] = "UNKNOWN", x[x.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", x[x.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", x[x.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", x),
                oL = ((j = {})[j.UNKNOWN = 0] = "UNKNOWN", j[j.FEATURE_DISABLED = 1] = "FEATURE_DISABLED", j[j.FLOODED = 2] = "FLOODED", j[j.INVALID_PASSWORD = 20] = "INVALID_PASSWORD", j[j.PASSWORDS_DO_NOT_MATCH = 21] = "PASSWORDS_DO_NOT_MATCH", j[j.TWO_STEP_VERIFICATION_REQUIRED = 24] = "TWO_STEP_VERIFICATION_REQUIRED", j),
                oM = {
                    withCredentials: !0,
                    url: "".concat(oP, "/v1/passkey/ListCredentials"),
                    timeout: 1e4
                },
                ox = {
                    withCredentials: !0,
                    url: "".concat(oP, "/v2/passwords/reset"),
                    timeout: 1e4
                },
                oj = {
                    withCredentials: !0,
                    url: "".concat(oP, "/v1/revert/invalidate-tickets"),
                    timeout: 1e4
                },
                ok = function(e) {
                    return {
                        isError: !1,
                        value: e
                    }
                },
                oF = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: e,
                        errorRaw: t,
                        errorStatusCode: r
                    }
                };

            function oV(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function oW(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var oB = function(e) {
                    var t;
                    return (void 0 === e ? "undefined" : oW(e)) === "object" && null !== e && "data" in e && null != (t = (0, tv.getApiErrorCodes)(e.data)[0]) ? t : null
                },
                oH = function(e) {
                    if ((void 0 === e ? "undefined" : oW(e)) !== "object" || null === e || !("status" in e)) return null;
                    var t, r = null != (t = e.status) ? t : null;
                    return "number" != typeof r ? null : r
                },
                oY = function(e, t, r) {
                    var n;
                    return (n = function() {
                        var n, o, i, a;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    i.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && i.label < o[1]) {
                                                    i.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(u);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, i)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    return s.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (n = s.sent(), void 0 !== r) return [2, ok(r(n.data))];
                                    return [2, ok(n.data)];
                                case 2:
                                    return i = oB(o = s.sent()), a = oH(o), [2, oF(null == t ? null : Object.values(t).includes(i) ? i : null, o, a)];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                oV(i, r, o, a, s, "next", e)
                            }

                            function s(e) {
                                oV(i, r, o, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                oG = tm().authApi,
                oK = ((k = {})[k.UNKNOWN = 0] = "UNKNOWN", k[k.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", k[k.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", k[k.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", k),
                oQ = {
                    withCredentials: !0,
                    url: "".concat(oG, "/v1/passkey/StartRegistration"),
                    timeout: 1e4
                },
                oX = {
                    withCredentials: !0,
                    url: "".concat(oG, "/v1/passkey/start-preauth-registration"),
                    timeout: 1e4
                },
                oq = {
                    withCredentials: !0,
                    url: "".concat(oG, "/v1/passkey/FinishRegistration"),
                    timeout: 1e4
                },
                oz = {
                    withCredentials: !0,
                    url: "".concat(oG, "/v1/passkey/finish-ar-preauth-registration"),
                    timeout: 1e4
                },
                o$ = {
                    withCredentials: !0,
                    url: "".concat(oG, "/v1/passkey/DeleteCredentialBatch"),
                    timeout: 1e4
                },
                oJ = {
                    AccountRecoveryPasskeyOnly: "accountRecoveryPasskeyOnly",
                    AccountRecoveryPasswordAndPasskey: "accountRecoveryPasswordAndPasskey"
                },
                oZ = function() {
                    return oY((0, tv.post)(oQ, {}), oK, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                o0 = function(e) {
                    return oY((0, tv.post)(oX, {
                        username: e
                    }), oK, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                o1 = function(e, t, r, n) {
                    return oY((0, tv.post)(oq, function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        sessionId: e,
                        credentialNickname: t,
                        attestationResponse: r
                    }, n ? {
                        source: n
                    } : {})), oK)
                },
                o2 = function(e, t, r, n, o, i) {
                    return oY((0, tv.post)(oz, {
                        recoverySession: e,
                        passkeySessionId: r,
                        passkeyRegistrationResponse: n,
                        userId: t,
                        isPostRecovery: o,
                        source: i
                    }), oK)
                },
                o4 = function(e, t) {
                    return oY((0, tv.post)(o$, {
                        credentialNicknames: e,
                        passkeyCount: t
                    }), oK)
                },
                o3 = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                        all: !0
                    };
                    return tn(e1.httpService.post(oM, e), oU)
                },
                o6 = function(e, t, r, n, o, i, a, s, c, u, l, p) {
                    return tn(e1.httpService.post(ox, {
                        targetType: e,
                        ticket: t,
                        userId: r,
                        password: n,
                        passwordRepeated: o,
                        twoStepVerificationChallengeId: i,
                        twoStepVerificationToken: a,
                        accountBlob: s,
                        secureAuthenticationIntent: c,
                        passkeySessionId: u,
                        passkeyRegistrationResponse: l,
                        newEmail: p
                    }), oL)
                },
                o5 = function() {
                    return tn(e1.httpService.post(oj, {}), oU)
                },
                o7 = ((F = {})[F.UNKNOWN = 0] = "UNKNOWN", F[F.CANCELLATION_ERROR = 1] = "CANCELLATION_ERROR", F[F.INTERRUPTED_ERROR = 2] = "INTERRUPTED_ERROR", F[F.INVALID_REQUEST = 3] = "INVALID_REQUEST", F[F.JSON_EXCEPTION = 4] = "JSON_EXCEPTION", F[F.CREDENTIALS_PROTOCOL_NOT_SUPPORTED = 5] = "CREDENTIALS_PROTOCOL_NOT_SUPPORTED", F[F.NO_CREDENTIALS_FOUND = 6] = "NO_CREDENTIALS_FOUND", F[F.INVALID_STATE_ERROR = 11] = "INVALID_STATE_ERROR", F),
                o8 = function(e) {
                    return e.code
                },
                o9 = function(e, t, r) {
                    return to(nh.hybridResponseService.getNativeResponse(e, t, r), o7, o8, function(e) {
                        if (null === e) return null;
                        var t = JSON.parse(e);
                        if (void 0 !== t.errorCode) throw {
                            name: "getNativeResponse Error",
                            message: t.errorMsg,
                            code: t.errorCode
                        };
                        return ez.DeviceMeta && (0, ez.DeviceMeta)().isInApp && (0, ez.DeviceMeta)().isAndroidApp ? e : nh.fido2Util.formatCredentialAuthenticationResponseApp(e)
                    })
                },
                ie = function(e) {
                    return to(navigator.credentials.get(e), o7).then(function(e) {
                        return e3(e, function(e) {
                            return null === e ? null : nh.fido2Util.formatCredentialAuthenticationResponseWeb(e)
                        })
                    })
                },
                it = null != (em = ez.EnvironmentUrls.apiGatewayUrl) ? em : "URL_NOT_FOUND",
                ir = "".concat(it, "/account-recovery-service"),
                io = ((V = {})[V.UNKNOWN = 1] = "UNKNOWN", V[V.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", V[V.IDENTIFIER_INVALID = 3] = "IDENTIFIER_INVALID", V[V.TOO_MANY_REQUESTS = 4] = "TOO_MANY_REQUESTS", V[V.ACCOUNT_NOT_VERIFIED = 5] = "ACCOUNT_NOT_VERIFIED", V[V.INVALID_CODE = 6] = "INVALID_CODE", V[V.INVALID_USER = 7] = "INVALID_USER", V[V.TWO_STEP_VERIFICATION_REQUIRED = 8] = "TWO_STEP_VERIFICATION_REQUIRED", V[V.TRY_A_DIFFERENT_CONTACT_METHOD = 9] = "TRY_A_DIFFERENT_CONTACT_METHOD", V),
                ii = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/request-recovery"),
                    timeout: 1e4
                },
                ia = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/send-code"),
                    timeout: 1e4
                },
                is = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/resend-code"),
                    timeout: 1e4
                },
                ic = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/verify-code"),
                    timeout: 1e4
                },
                iu = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/verify-backup-code"),
                    timeout: 1e4
                },
                il = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/continue-recovery"),
                    timeout: 1e4
                },
                ip = {
                    url: "".concat(ir, "/v1/recovery-session-metadata"),
                    timeout: 1e4
                },
                id = {
                    url: "".concat(ir, "/v1/set-email"),
                    timeout: 1e4
                },
                ih = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/get-current-two-step-method"),
                    timeout: 1e4
                },
                iS = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/disable-two-step-method"),
                    timeout: 1e4
                },
                iv = function(e, t, r, n) {
                    return tn(e1.httpService.post(ii, {
                        identifier: e,
                        identifierType: t,
                        recoverySessionId: n,
                        requestedRecoveryTypes: r
                    }), io)
                },
                iE = function(e, t, r, n) {
                    return tn(e1.httpService.post(ia, {
                        contactMethod: e,
                        contactMethodType: t,
                        recoverySessionId: r,
                        contactMethodNumber: n
                    }), io)
                },
                im = function(e, t) {
                    return tn(e1.httpService.post(is, {
                        recoverySessionId: e,
                        contactMethodNumber: t
                    }), io)
                },
                iA = function(e, t, r) {
                    return tn(e1.httpService.post(ic, {
                        recoverySessionId: e,
                        code: t,
                        contactMethodNumber: r
                    }), io)
                },
                iy = function(e, t) {
                    return tn(e1.httpService.post(iu, {
                        recoverySessionId: e,
                        backupCode: t
                    }), io)
                },
                ib = function(e, t, r, n, o) {
                    return tn(e1.httpService.post(il, {
                        recoverySessionId: e,
                        userId: t,
                        recover2sv: r,
                        twoStepVerificationToken: n,
                        twoStepVerificationChallengeId: o
                    }), io)
                },
                iN = function(e) {
                    return tn(e1.httpService.post(ip, {
                        recoverySessionId: e
                    }), io)
                },
                i_ = function(e) {
                    return tn(e1.httpService.post(id, {
                        recoverySessionId: e
                    }), io)
                },
                iO = function(e) {
                    return tn(e1.httpService.get(ih, {
                        recoverySessionId: e
                    }), io)
                },
                iT = function(e, t) {
                    return tn(e1.httpService.post(iS, {
                        recoverySessionId: e,
                        twoStepMethod: t
                    }), io)
                },
                iI = {
                    url: "/my/settings/json",
                    withCredentials: !0
                },
                iw = ((W = {})[W.UNKNOWN = 0] = "UNKNOWN", W),
                ig = function() {
                    return tn(e1.httpService.get(iI), iw)
                },
                iR = ((B = {})[B.UNKNOWN = 0] = "UNKNOWN", B[B.FLAG_OFF = 1] = "FLAG_OFF", B),
                iC = {
                    withCredentials: !0,
                    url: "".concat(null === ez.EnvironmentUrls || void 0 === ez.EnvironmentUrls ? void 0 : ez.EnvironmentUrls.userSettingsApi, "/v1/user-settings"),
                    timeout: 1e4
                },
                iD = function() {
                    return tn(e1.httpService.get(iC), iR)
                },
                iP = function(e, t) {
                    return !1 === t ? Promise.resolve(e4(iR.FLAG_OFF, null, null)) : tn(e1.httpService.post(iC, {
                        eppEnrollmentStatus: e
                    }), iR)
                },
                iU = null != (eA = ez.EnvironmentUrls.usersApi) ? eA : "URL_NOT_FOUND",
                iL = ((H = {})[H.UNKNOWN = 0] = "UNKNOWN", H),
                iM = {
                    withCredentials: !0,
                    url: "".concat(iU, "/v1/usernames/users"),
                    timeout: 1e4
                },
                ix = {
                    withCredentials: !0,
                    url: "".concat(iU, "/v1/users"),
                    timeout: 1e4
                },
                ij = function(e) {
                    return tn(e1.httpService.get({
                        withCredentials: !0,
                        url: "".concat(iU, "/v1/users/").concat(e),
                        timeout: 1e4
                    }), iL)
                },
                ik = function(e) {
                    return tn(e1.httpService.post(iM, {
                        usernames: [e],
                        excludeBannedUsers: !0
                    }), iL)
                },
                iF = function(e) {
                    return tn(e1.httpService.post(ix, {
                        userIds: e,
                        excludeBannedUsers: !1
                    }), iL)
                };

            function iV(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var iW = window.ReactUtilities,
                iB = "Account Security Prompt:",
                iH = "authpopup",
                iY = "emailhighlight",
                iG = "/my/account#!/security?src=",
                iK = "https://en.help.roblox.com/hc/articles/212459863-Add-2-Step-Verification-to-Your-Account",
                iQ = "modalStateViewed",
                iX = window.ReactStyleGuide,
                iq = function(e, t) {
                    switch (t) {
                        case tY.FLOODED:
                            return e.Message.Error.Passwords.Flooded;
                        case tY.INVALID_PASSWORD:
                            return e.Message.Error.Passwords.InvalidPassword;
                        case tY.INVALID_CURRENT_PASSWORD:
                            return e.Message.Error.Passwords.InvalidCurrentPassword;
                        default:
                            return e.Message.Error.Passwords.Default
                    }
                },
                iz = function(e, t) {
                    switch (t) {
                        case tX.VALID_PASSWORD:
                            return null;
                        case tX.WEAK_PASSWORD:
                            return e.Message.Error.PasswordValidation.WeakPassword;
                        case tX.SHORT_PASSWORD:
                            return e.Message.Error.PasswordValidation.ShortPassword;
                        case tX.PASSWORD_SAME_AS_USERNAME:
                            return e.Message.Error.PasswordValidation.PasswordSameAsUsername;
                        case tX.FORBIDDEN_PASSWORD:
                            return e.Message.Error.PasswordValidation.ForbiddenPassword;
                        case tX.DUMB_STRINGS:
                            return e.Message.Error.PasswordValidation.DumbStrings;
                        default:
                            return e.Message.Error.PasswordValidation.Default
                    }
                },
                i$ = ((Y = i$ || {}).NONE = "NONE", Y.CHANGE_PASSWORD_INTRO = "CHANGE_PASSWORD_INTRO", Y.CHANGE_PASSWORD_FORM = "CHANGE_PASSWORD_FORM", Y.CHANGE_PASSWORD_CONFIRMATION = "CHANGE_PASSWORD_CONFIRMATION", Y.CHANGE_PASSWORD_DISMISS_CONFIRMATION = "CHANGE_PASSWORD_DISMISS_CONFIRMATION", Y.AUTHENTICATOR_UPSELL_OPENING = "AUTHENTICATOR_UPSELL_OPENING", Y.AUTHENTICATOR_UPSELL_DOWNLOAD_APPS = "AUTHENTICATOR_UPSELL_DOWNLOAD_APPS", Y.ACCOUNT_RESTORE_POLICY_UPSELL = "ACCOUNT_RESTORE_POLICY_UPSELL", Y.EMAIL_2SV_UPSELL = "EMAIL_2SV_UPSELL", Y),
                iJ = function(e, t, r) {
                    t !== r && e.sendModalStateViewedEvent(t)
                },
                iZ = ((G = {})[G.DISMISS_TEMPORARY = 0] = "DISMISS_TEMPORARY", G[G.DISMISS_FOREVER = 1] = "DISMISS_FOREVER", G[G.SET_FLOW_COMPLETE = 2] = "SET_FLOW_COMPLETE", G[G.SET_MODAL_STATE = 3] = "SET_MODAL_STATE", G[G.SET_EMAIL_ADDRESS = 4] = "SET_EMAIL_ADDRESS", G),
                i0 = function(e, t) {
                    var r = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({}, e);
                    switch (t.type) {
                        case iZ.DISMISS_TEMPORARY:
                        case iZ.DISMISS_FOREVER:
                            return r.isFlowComplete = !0, r;
                        case iZ.SET_MODAL_STATE:
                            return r.lastModalState = e.modalState, r.modalState = t.modalState, r.modalState === i$.CHANGE_PASSWORD_CONFIRMATION && (r.isFlowComplete = !0), r;
                        case iZ.SET_EMAIL_ADDRESS:
                            return r.emailAddress = t.emailAddress, r;
                        default:
                            return e
                    }
                };

            function i1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i2(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return i1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var i4 = (0, eJ.createContext)(null),
                i3 = function(e) {
                    var t = e.promptAssignment,
                        r = e.username,
                        n = e.isUserUnder13,
                        o = e.eventService,
                        i = e.requestService,
                        a = e.translate,
                        s = e.children,
                        c = i$.NONE,
                        u = t.promptType === r_.BROADER_AUTHENTICATOR_UPSELL && !0 !== t.isGeneric && !t.metadata.showBanner,
                        l = t.promptType === r_.EMAIL_2SV_UPSELL && !0 !== t.isGeneric && !t.metadata.showBanner;
                    t.promptType === r_.AUTHENTICATOR_UPSELL || u ? c = i$.AUTHENTICATOR_UPSELL_OPENING : t.promptType === r_.ACCOUNT_RESTORES_POLICY_UPSELL ? c = i$.ACCOUNT_RESTORE_POLICY_UPSELL : t.promptType === r_.EMAIL_2SV_UPSELL && l && (c = i$.EMAIL_2SV_UPSELL);
                    var p = i2((0, eJ.useState)(function() {
                            return {
                                Action: {
                                    AbortDismissForeverAddEmail: a("Action.AbortDismissForeverAddEmail"),
                                    AbortDismissForeverChangePassword: a("Action.AbortDismissForeverChangePassword"),
                                    AccountRestoreOpenSettings: a("Action.OpenSettings"),
                                    AuthenticatorUpsellSetupAuthenticatorButtonMessage: a("Label.AuthenticatorUpsellSetupAuthenticatorButtonMessage"),
                                    AuthenticatorUpsellNextButtonMessage: a("Action.AuthenticatorUpsellNextButtonMessage"),
                                    ChangeEmail: a("Action.ChangeEmail"),
                                    ConfirmDismissForeverAddEmail: a("Action.ConfirmDismissForeverAddEmail"),
                                    ConfirmDismissForeverChangePassword: a("Action.ConfirmDismissForeverChangePassword"),
                                    ContinueAddEmail: a("Action.ContinueAddEmail"),
                                    ContinueChangePassword: a("Action.ContinueChangePassword"),
                                    DismissForever: a("Action.DismissForever"),
                                    RemindMeLater: a("Action.RemindMeLater"),
                                    ResendPasswordResetEmail: a("Action.ResendPasswordResetEmail"),
                                    SecureAccount: a("Action.SecureAccount"),
                                    SetUpAuthenticatorInBanner: a("Action.SetUpAuthenticatorInBanner"),
                                    SetUpAuthenticatorAccountRestoresPolicyUpsell: a("Action.SetUpAuthenticatorAccountRestoresPolicyUpsell"),
                                    SetUpEmail2SV: a("Action.SetUpEmail2SV"),
                                    SubmitChangePassword: a("Action.SubmitChangePassword")
                                },
                                Message: {
                                    Error: {
                                        Email: {
                                            FeatureDisabled: a("Message.Error.Email.FeatureDisabled"),
                                            TooManyAccountsOnEmail: a("Message.Error.Email.TooManyAccountsOnEmail"),
                                            TooManyAttemptsToUpdateEmail: a("Message.Error.Email.TooManyAttemptsToUpdateEmail"),
                                            InvalidEmailAddress: a("Message.Error.Email.InvalidEmailAddress"),
                                            Default: a("Message.Error.Email.Default")
                                        },
                                        Input: {
                                            InvalidEmail: a("Message.Error.Input.InvalidEmail"),
                                            PasswordsDoNotMatch: a("Message.Error.Input.PasswordsDoNotMatch")
                                        },
                                        Passwords: {
                                            Flooded: a("Message.Error.Password.Flooded"),
                                            InvalidPassword: a("Message.Error.Password.InvalidPassword"),
                                            InvalidCurrentPassword: a("Message.Error.Password.InvalidCurrentPassword"),
                                            Default: a("Message.Error.Password.Default")
                                        },
                                        PasswordReset: {
                                            UserDoesNotHaveEmail: a("Message.Error.PasswordReset.UserDoesNotHaveEmail"),
                                            Default: a("Message.Error.PasswordReset.Default")
                                        },
                                        PasswordValidation: {
                                            WeakPassword: a("Message.Error.PasswordValidation.WeakPassword"),
                                            ShortPassword: a("Message.Error.PasswordValidation.ShortPassword"),
                                            PasswordSameAsUsername: a("Message.Error.PasswordValidation.PasswordSameAsUsername"),
                                            ForbiddenPassword: a("Message.Error.PasswordValidation.ForbiddenPassword"),
                                            DumbStrings: a("Message.Error.PasswordValidation.DumbStrings"),
                                            Default: a("Message.Error.PasswordValidation.Default")
                                        },
                                        PromptAssignments: {
                                            Default: a("Message.Error.PromptAssignments.Default")
                                        }
                                    }
                                },
                                Description: {
                                    AccountRestoresPolicyUpdateV3: function(e) {
                                        return a("Description.AccountRestoresPolicyUpdateV3", {
                                            linkStart: '<a href="'.concat(e, '" class="text-link" target="_blank">'),
                                            linkEnd: "</a>"
                                        })
                                    },
                                    AccountRestoresPolicyUpsellMessageBody: function(e) {
                                        return a("Description.AccountRestoresPolicyUpsellMessageBody", {
                                            linkStartSettings: '<a href="'.concat(e, '" class="text-link" target="_blank">'),
                                            linkEndSettings: "</a>"
                                        })
                                    },
                                    AccountRestoresPolicyWithDate: function(e) {
                                        return a("Description.AccountRestoresPolicyWithDate", {
                                            date: e
                                        })
                                    },
                                    AddYourEmail: a(n ? "Description.AddYourEmailUnder13" : "Description.AddYourEmail"),
                                    AreYouSureDismissForeverAddEmail: a(n ? "Description.AreYouSureDismissForeverAddEmailUnder13" : "Description.AreYouSureDismissForeverAddEmail"),
                                    AreYouSureDismissForeverChangePassword: a("Description.AreYouSureDismissForeverChangePassword"),
                                    AuthenticatorSetupPrompt: function(e) {
                                        return a("Description.AuthenticatorSetupPrompt", {
                                            linkStart: '<a href="'.concat(e, '" class="text-link" target="_blank">'),
                                            linkEnd: "</a>"
                                        })
                                    },
                                    AuthenticatorSetupPromptNew: function(e) {
                                        return a("Description.AuthenticatorSetupPromptNew", {
                                            linkStart: '<a href="'.concat(e, '" class="text-link" target="_blank">'),
                                            linkEnd: "</a>"
                                        })
                                    },
                                    ChangeYourPassword: a("Description.ChangeYourPassword"),
                                    ChangeYourPasswordImmediately: a("Description.ChangeYourPasswordImmediately"),
                                    ChangeYourPasswordSuccess: a("Description.ChangeYourPasswordSuccess"),
                                    CheckYourEmail: function(e) {
                                        return a(n ? "Description.CheckYourEmailUnder13" : "Description.CheckYourEmail", {
                                            emailAddress: "<b>".concat(e, "</b>")
                                        })
                                    },
                                    Email2SVUpsellMessageBody: function(e) {
                                        return a("Description.Email2SVUpsellMessageBody", {
                                            linkStart: '<a href="'.concat(e, '" class="text-link" target="_blank">'),
                                            linkEnd: "</a>"
                                        })
                                    },
                                    GenericTextOnlyBanner: function(e) {
                                        return a(e)
                                    },
                                    LearnMoreHere: function(e) {
                                        return a("Description.LearnMoreHere", {
                                            linkStart: '<a href="'.concat(e, '" class="text-link" target="_blank">'),
                                            linkEnd: "</a>"
                                        })
                                    },
                                    NoChangeForceReset: function(e) {
                                        return a(e <= 1 ? "Description.NoChangeForceResetSingular" : "Description.NoChangeForceReset", {
                                            days: e,
                                            boldStart: "<b>",
                                            boldEnd: "</b>"
                                        }).replace("1", e < 1 ? "< 1" : "1")
                                    },
                                    ReceiveSecurityCodesMessage: a("Description.ReceiveSecurityCodesMessage"),
                                    UnusualActivity: a("Description.UnusualActivity")
                                },
                                Header: {
                                    AccountRestoresPolicyUpdate: a("Header.AccountRestoresPolicyUpdate"),
                                    AccountRestoresPolicyUpdateV3: a("Header.AccountRestoresPolicyUpdateV3"),
                                    AccountRestoresPolicyUpsell: a("Header.AccountRestoresPolicyUpsell"),
                                    AddYourEmail: a(n ? "Header.AddYourEmailUnder13" : "Header.AddYourEmail"),
                                    AreYouSure: a("Header.AreYouSure"),
                                    AuthenticatorUpsellDownloadAuthenticator: a("Header.AuthenticatorUpsellDownloadAuthenticator"),
                                    AuthenticatorUpsellWelcomeMessage: a("Header.AuthenticatorUpsellWelcomeMessage"),
                                    BoostYourAccountSecurity: a("Header.BoostYourAccountSecurity"),
                                    ChangeYourPassword: a("Header.ChangeYourPassword"),
                                    CheckYourEmail: a(n ? "Header.CheckYourEmailUnder13" : "Header.CheckYourEmail"),
                                    CreateAStrongPassword: a("Header.CreateAStrongPassword"),
                                    GenericTextOnlyBanner: function(e) {
                                        return a(e)
                                    },
                                    Email2SVUpsell: a("Header.Email2SVUpsell"),
                                    KeepYourAccountSafeLong: a("Header.KeepYourAccountSafeLong"),
                                    Success: a("Header.Success"),
                                    UnusualActivityDetected: a("Header.UnusualActivityDetected"),
                                    YourPasswordMightBeStolen: a("Header.YourPasswordMightBeStolen")
                                },
                                Label: {
                                    AtLeastCharacters: function(e) {
                                        return a("Label.AtLeastCharacters", {
                                            count: e
                                        })
                                    },
                                    AuthenticatorUpsellBadActorHeadline: a("Label.AuthenticatorUpsellBadActorHeadline"),
                                    AuthenticatorUpsellBadActorMessage: a("Label.AuthenticatorUpsellBadActorMessage"),
                                    AuthenticatorUpsellDownloadInstruction: a("Label.AuthenticatorUpsellDownloadInstruction"),
                                    AuthenticatorUpsellGoogleOption: a("Label.AuthenticatorUpsellGoogleOption"),
                                    AuthenticatorUpsellMicrosoftOption: a("Label.AuthenticatorUpsellMicrosoftOption"),
                                    AuthenticatorUpsellProtectRobuxHeadline: a("Label.AuthenticatorUpsellProtectRobuxHeadline"),
                                    AuthenticatorUpsellProtectRobuxMessage: a("Label.AuthenticatorUpsellProtectRobuxMessage"),
                                    AuthenticatorUpsellTwilioOption: a("Label.AuthenticatorUpsellTwilioOption"),
                                    AuthenticatorUpsellTwoFactorHeadline: a("Label.AuthenticatorUpsellTwoFactorHeadline"),
                                    AuthenticatorUpsellTwoFactorMessage: a("Label.AuthenticatorUpsellTwoFactorMessage"),
                                    ConfirmNewPassword: a("Label.ConfirmNewPassword"),
                                    CurrentPassword: a("Label.CurrentPassword"),
                                    IForgotMyPassword: a("Label.IForgotMyPassword"),
                                    MinutesSeconds: function(e, t) {
                                        return a("Label.MinutesSeconds", {
                                            minutes: e,
                                            seconds: t
                                        })
                                    },
                                    NewPassword: a("Label.NewPassword"),
                                    TimeRemaining: a("Label.TimeRemaining"),
                                    UseAUniquePassword: a("Label.UseAUniquePassword"),
                                    YourEmail: a(n ? "Label.YourEmailUnder13" : "Label.YourEmail")
                                }
                            }
                        }), 1)[0],
                        f = i2((0, eJ.useState)(function() {
                            return {
                                promptAssignment: t,
                                username: r,
                                resources: p,
                                requestService: i,
                                isFlowComplete: !1,
                                modalState: c,
                                lastModalState: null,
                                emailAddress: ""
                            }
                        }), 1)[0],
                        d = i2((0, eJ.useReducer)(i0, f), 2),
                        h = d[0],
                        S = d[1];
                    return (0, eJ.useEffect)(function() {
                        return iJ(o, h.modalState, h.lastModalState)
                    }, [o, h.modalState, h.lastModalState]), (0, eq.jsx)(i4.Provider, {
                        value: {
                            state: h,
                            dispatch: S
                        },
                        children: s
                    })
                },
                i6 = function() {
                    var e = (0, eJ.useContext)(i4);
                    if (null === e) throw Error("AccountSecurityPromptContext was not provided in the current scope");
                    return e
                },
                i5 = function(e) {
                    var t = parseInt(e, 10);
                    return Number.isNaN(t) || !Number.isSafeInteger(t) ? 14 : Math.floor(Math.max(0, t - Date.now()) / 864e5)
                };

            function i7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i8(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function i9(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            i8(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            i8(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ae(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var at = function() {
                    var e, t, r, n = i6(),
                        o = n.state,
                        i = o.promptAssignment,
                        a = o.resources,
                        s = o.requestService,
                        c = n.dispatch,
                        u = (e = (0, eJ.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(e) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    s = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return i
                            }
                        }(e, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return i7(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i7(e, t)
                            }
                        }(e, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        l = u[0],
                        p = u[1],
                        f = function() {
                            return i9(function() {
                                var e;
                                return ae(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return p(!0), [4, s.promptAssignments.updateForCurrentUser(rT.DISABLE_PROMPT, i.promptType)];
                                        case 1:
                                            return (e = t.sent()).isError && (p(!1), console.warn(iB, "Disabling prompt failed with error", e.error && ry[e.error])), c({
                                                type: iZ.DISMISS_FOREVER
                                            }), [2]
                                    }
                                })
                            })()
                        },
                        d = function() {
                            return i9(function() {
                                var e;
                                return ae(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return p(!0), [4, s.promptAssignments.updateForCurrentUser(rT.DISMISS_PROMPT, i.promptType)];
                                        case 1:
                                            return (e = t.sent()).isError && (p(!1), console.warn(iB, "Dismissing prompt failed with error", e.error && ry[e.error])), c({
                                                type: iZ.DISMISS_TEMPORARY
                                            }), [2]
                                    }
                                })
                            })()
                        },
                        h = [r_.BROADER_AUTHENTICATOR_UPSELL.toString(), r_.ACCOUNT_RESTORES_POLICY_UPDATE_V3.toString(), r_.EMAIL_2SV_UPSELL.toString()].includes(i.promptType.toString()),
                        S = !h,
                        v = r_.ACCOUNT_RESTORES_POLICY_UPDATE_V3 !== i.promptType,
                        E = r_.CHANGE_PASSWORD__SUSPECTED_COMPROMISE === i.promptType,
                        m = [r_.CHANGE_PASSWORD__SUSPECTED_COMPROMISE.toString(), r_.ACCOUNT_RESTORES_POLICY_UPDATE.toString(), r_.ACCOUNT_RESTORES_POLICY_UPDATE_V2.toString(), r_.ACCOUNT_RESTORES_POLICY_UPDATE_V3.toString(), r_.BROADER_AUTHENTICATOR_UPSELL.toString(), r_.EMAIL_2SV_UPSELL.toString()].includes(i.promptType.toString());
                    i.isGeneric && (S = i.metadata.showAlertIcon, v = !1, E = !1, m = i.metadata.showXButtonForDisable);
                    var A = a.Action.SubmitChangePassword;
                    if (i.promptType === r_.ACCOUNT_RESTORES_POLICY_UPDATE || i.promptType === r_.ACCOUNT_RESTORES_POLICY_UPDATE_V2 ? A = a.Action.AccountRestoreOpenSettings : i.promptType === r_.BROADER_AUTHENTICATOR_UPSELL ? A = a.Action.SetUpAuthenticatorInBanner : i.promptType === r_.EMAIL_2SV_UPSELL && (A = a.Action.SetUpEmail2SV), i.isGeneric) t = i.metadata.displayType === rb.TEXT_ONLY_BANNER ? a.Description.GenericTextOnlyBanner(i.metadata.headerResource) : "";
                    else switch (i.promptType) {
                        case r_.CHANGE_PASSWORD__SUSPECTED_COMPROMISE:
                            t = a.Header.UnusualActivityDetected;
                            break;
                        case r_.CHANGE_PASSWORD__BREACHED_CREDENTIAL:
                            t = a.Header.YourPasswordMightBeStolen;
                            break;
                        case r_.ACCOUNT_RESTORES_POLICY_UPDATE:
                            t = a.Header.AccountRestoresPolicyUpdate;
                            break;
                        case r_.ACCOUNT_RESTORES_POLICY_UPDATE_V2:
                            t = a.Header.KeepYourAccountSafeLong;
                            break;
                        case r_.ACCOUNT_RESTORES_POLICY_UPDATE_V3:
                            t = a.Header.AccountRestoresPolicyUpdateV3;
                            break;
                        case r_.BROADER_AUTHENTICATOR_UPSELL:
                            t = a.Header.BoostYourAccountSecurity;
                            break;
                        case r_.EMAIL_2SV_UPSELL:
                            t = a.Header.Email2SVUpsell;
                            break;
                        default:
                            t = ""
                    }
                    if (i.isGeneric) r = i.metadata.displayType === rb.TEXT_ONLY_BANNER ? a.Header.GenericTextOnlyBanner(i.metadata.bodyResource) : "";
                    else switch (i.promptType) {
                        case r_.ACCOUNT_RESTORES_POLICY_UPDATE:
                            var y = new Date(i.metadata.accountRestoresPolicyEffectiveTimestamp).toLocaleDateString(void 0, {
                                year: "numeric",
                                month: "short",
                                day: "numeric"
                            });
                            r = "".concat(a.Description.AccountRestoresPolicyWithDate(y), " ").concat(a.Description.AuthenticatorSetupPrompt(iK));
                            break;
                        case r_.ACCOUNT_RESTORES_POLICY_UPDATE_V2:
                            r = a.Description.AuthenticatorSetupPromptNew(iK);
                            break;
                        case r_.ACCOUNT_RESTORES_POLICY_UPDATE_V3:
                            r = a.Description.AccountRestoresPolicyUpdateV3(iG);
                            break;
                        case r_.CHANGE_PASSWORD__SUSPECTED_COMPROMISE:
                            r = "".concat(a.Description.UnusualActivity, " ").concat(a.Description.ChangeYourPassword);
                            break;
                        case r_.CHANGE_PASSWORD__BREACHED_CREDENTIAL:
                            r = "".concat(a.Description.ChangeYourPasswordImmediately, " ").concat(a.Description.NoChangeForceReset(i5(i.metadata.forceResetTimestamp)), " ").concat(a.Description.LearnMoreHere("https://en.help.roblox.com/hc/articles/4416940180500-Why-am-I-seeing-a-banner-asking-me-to-change-my-password-"));
                            break;
                        case r_.BROADER_AUTHENTICATOR_UPSELL:
                            r = a.Description.ReceiveSecurityCodesMessage;
                            break;
                        case r_.EMAIL_2SV_UPSELL:
                            r = a.Description.Email2SVUpsellMessageBody(iG);
                            break;
                        default:
                            r = ""
                    }
                    return "" === t || "" === r ? (0, eq.jsx)(eZ().Fragment, {}) : (0, eq.jsx)("div", {
                        className: "security-banner-wrapper",
                        children: (0, eq.jsxs)("div", {
                            className: "security-banner",
                            children: [(0, eq.jsxs)("div", {
                                className: "banner-start",
                                children: [S && (0, eq.jsx)("div", {
                                    className: "banner-icon",
                                    children: (0, eq.jsx)("div", {
                                        className: "icon-warning"
                                    })
                                }), h && (0, eq.jsx)("div", {
                                    className: "banner-icon-lock"
                                }), (0, eq.jsxs)("div", {
                                    className: "banner-content",
                                    children: [(0, eq.jsx)("h2", {
                                        className: "banner-header",
                                        children: t
                                    }), (0, eq.jsx)("div", {
                                        className: "banner-description",
                                        dangerouslySetInnerHTML: {
                                            __html: r
                                        }
                                    })]
                                }), m && (0, eq.jsx)("button", {
                                    type: "button",
                                    className: "close banner-close",
                                    "aria-label": a.Action.RemindMeLater,
                                    onClick: d,
                                    children: (0, eq.jsx)("span", {
                                        className: "icon-close"
                                    })
                                })]
                            }), (0, eq.jsxs)("div", {
                                className: "banner-buttons",
                                children: [E && (0, eq.jsx)("span", {
                                    className: "banner-button",
                                    children: (0, eq.jsx)("button", {
                                        type: "button",
                                        className: "btn-secondary-md",
                                        "aria-label": a.Action.DismissForever,
                                        onClick: function() {
                                            c({
                                                type: iZ.SET_MODAL_STATE,
                                                modalState: i$.CHANGE_PASSWORD_DISMISS_CONFIRMATION
                                            })
                                        },
                                        disabled: l,
                                        children: a.Action.DismissForever
                                    })
                                }), v && (0, eq.jsx)("span", {
                                    className: "banner-button banner-button-last",
                                    children: (0, eq.jsx)("button", {
                                        type: "button",
                                        className: "btn-cta-md",
                                        "aria-label": A,
                                        onClick: function() {
                                            return i9(function() {
                                                return ae(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            if (i.promptType !== r_.ACCOUNT_RESTORES_POLICY_UPDATE && i.promptType !== r_.ACCOUNT_RESTORES_POLICY_UPDATE_V2) return [3, 2];
                                                            return [4, f()];
                                                        case 1:
                                                            return e.sent(), window.open(iG + iH, "_self"), [3, 3];
                                                        case 2:
                                                            i.promptType === r_.BROADER_AUTHENTICATOR_UPSELL ? c({
                                                                type: iZ.SET_MODAL_STATE,
                                                                modalState: i$.AUTHENTICATOR_UPSELL_OPENING
                                                            }) : i.promptType === r_.EMAIL_2SV_UPSELL ? window.open(iG + iY, "_self") : c({
                                                                type: iZ.SET_MODAL_STATE,
                                                                modalState: i$.CHANGE_PASSWORD_INTRO
                                                            }), e.label = 3;
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()
                                        },
                                        disabled: l,
                                        children: A
                                    })
                                }), m && (0, eq.jsx)(eJ.Fragment, {
                                    children: l ? (0, eq.jsx)("span", {
                                        className: "banner-close icon-close spinner-circle"
                                    }) : (0, eq.jsx)("button", {
                                        type: "button",
                                        className: "close banner-close",
                                        "aria-label": a.Action.RemindMeLater,
                                        onClick: function() {
                                            return i9(function() {
                                                return ae(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            if (!(i.promptType === r_.ACCOUNT_RESTORES_POLICY_UPDATE || i.promptType === r_.ACCOUNT_RESTORES_POLICY_UPDATE_V2 || i.promptType === r_.ACCOUNT_RESTORES_POLICY_UPDATE_V3 || i.isGeneric && i.metadata.displayType === rb.TEXT_ONLY_BANNER)) return [3, 2];
                                                            return [4, f()];
                                                        case 1:
                                                            return e.sent(), [3, 4];
                                                        case 2:
                                                            return [4, d()];
                                                        case 3:
                                                            e.sent(), e.label = 4;
                                                        case 4:
                                                            return [2]
                                                    }
                                                })
                                            })()
                                        },
                                        children: (0, eq.jsx)("span", {
                                            className: "icon-close"
                                        })
                                    })
                                })]
                            })]
                        })
                    })
                },
                ar = function(e) {
                    var t = e.positiveButton,
                        r = e.negativeButton,
                        n = e.children;
                    return (0, eq.jsxs)(iX.Modal.Footer, {
                        children: [(0, eq.jsxs)("div", {
                            className: "modal-modern-footer-buttons",
                            children: [null !== r && (0, eq.jsx)("button", {
                                type: "button",
                                className: "btn-secondary-md modal-modern-footer-button focus-visible:outline-focus",
                                "aria-label": r.label,
                                disabled: !r.enabled,
                                onClick: r.action,
                                children: r.content
                            }), (0, eq.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md modal-modern-footer-button focus-visible:outline-focus",
                                "aria-label": t.label,
                                disabled: !t.enabled,
                                onClick: t.action,
                                children: t.content
                            })]
                        }), n]
                    })
                },
                an = ((K = {}).BACK = "BACK", K.CLOSE = "CLOSE", K.HIDDEN = "HIDDEN", K),
                ao = function(e, t, r) {
                    switch (e) {
                        case "BACK":
                            return (0, eq.jsx)("button", {
                                type: "button",
                                className: "modal-modern-header-button",
                                onClick: t,
                                disabled: !r,
                                children: (0, eq.jsx)("span", {
                                    className: "icon-back"
                                })
                            });
                        case "CLOSE":
                            return (0, eq.jsx)("button", {
                                type: "button",
                                className: "modal-modern-header-button",
                                onClick: t,
                                disabled: !r,
                                children: (0, eq.jsx)("span", {
                                    className: "icon-close"
                                })
                            });
                        default:
                            return (0, eq.jsx)("div", {})
                    }
                },
                ai = function(e) {
                    var t = e.headerText,
                        r = e.buttonType,
                        n = e.buttonAction,
                        o = e.buttonEnabled,
                        i = e.headerInfo;
                    return (0, eq.jsxs)(iX.Modal.Header, {
                        useBaseBootstrapComponent: !0,
                        children: [ao(r, n, o), (0, eq.jsx)(iX.Modal.Title, {
                            children: t
                        }), (0, eq.jsx)("div", {
                            className: "modal-modern-header-info",
                            children: i
                        })]
                    })
                };

            function aa(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function as(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function ac(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            as(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            as(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function au(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aa(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aa(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function al(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ap = function(e) {
                var t = e.closeModal,
                    r = i6().state,
                    n = r.resources,
                    o = r.requestService,
                    i = r.promptAssignment,
                    a = au((0, eJ.useState)(null), 2),
                    s = a[0],
                    c = a[1],
                    u = au((0, eJ.useState)(!1), 2),
                    l = u[0],
                    p = u[1],
                    f = function() {
                        return ac(function() {
                            var e;
                            return al(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, o.promptAssignments.updateForCurrentUser(rT.DISMISS_PROMPT, i.promptType)];
                                    case 1:
                                        return (e = t.sent()).isError && console.warn(iB, "Dismissing Account Restores Policy Upsell prompt failed with error", e.error && ry[e.error]), [2]
                                }
                            })
                        })()
                    },
                    d = {
                        content: l ? (0, eq.jsx)("span", {
                            className: "spinner spinner-xs spinner-no-margin"
                        }) : n.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell,
                        label: n.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell,
                        enabled: !l,
                        action: function() {
                            return ac(function() {
                                return al(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return c(null), p(!0), [4, f()];
                                        case 1:
                                            return e.sent(), window.open(iG + iH, "_self"), [2]
                                    }
                                })
                            })()
                        }
                    };
                return (0, eq.jsxs)(eZ().Fragment, {
                    children: [(0, eq.jsx)(ai, {
                        headerText: n.Header.AccountRestoresPolicyUpsell,
                        buttonType: an.CLOSE,
                        buttonAction: function() {
                            return ac(function() {
                                return al(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t(), [4, f()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        buttonEnabled: !0,
                        headerInfo: null
                    }), (0, eq.jsxs)(iX.Modal.Body, {
                        children: [(0, eq.jsx)("div", {
                            className: "modal-lock-icon"
                        }), (0, eq.jsx)("p", {
                            className: "modal-margin-bottom-sm",
                            dangerouslySetInnerHTML: {
                                __html: n.Description.AccountRestoresPolicyUpsellMessageBody(iG)
                            }
                        }), (0, eq.jsx)("p", {
                            className: "text-error xsmall",
                            children: s
                        })]
                    }), (0, eq.jsx)(ar, {
                        positiveButton: d,
                        negativeButton: null
                    })]
                })
            };

            function af(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ad(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function ah(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            ad(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            ad(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aS(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return af(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return af(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function av(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var aE = function(e) {
                var t = e.closeModal,
                    r = i6().state,
                    n = r.resources,
                    o = r.requestService,
                    i = r.promptAssignment,
                    a = aS((0, eJ.useState)(null), 2),
                    s = a[0],
                    c = a[1],
                    u = aS((0, eJ.useState)(!1), 2),
                    l = u[0],
                    p = u[1],
                    f = function() {
                        return ah(function() {
                            var e;
                            return av(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, o.promptAssignments.updateForCurrentUser(rT.DISMISS_PROMPT, i.promptType)];
                                    case 1:
                                        return (e = t.sent()).isError && console.warn(iB, "Dismissing Authenticator Upsell prompt failed with error", e.error && ry[e.error]), [2]
                                }
                            })
                        })()
                    },
                    d = {
                        content: l ? (0, eq.jsx)("span", {
                            className: "spinner spinner-xs spinner-no-margin"
                        }) : n.Action.AuthenticatorUpsellNextButtonMessage,
                        label: n.Action.AuthenticatorUpsellNextButtonMessage,
                        enabled: !l,
                        action: function() {
                            return ah(function() {
                                return av(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return c(null), p(!0), [4, f()];
                                        case 1:
                                            return e.sent(), window.open(iG + iH, "_self"), [2]
                                    }
                                })
                            })()
                        }
                    };
                return (0, eq.jsxs)(eZ().Fragment, {
                    children: [(0, eq.jsx)(ai, {
                        headerText: n.Header.AuthenticatorUpsellDownloadAuthenticator,
                        buttonType: an.CLOSE,
                        buttonAction: function() {
                            return ah(function() {
                                return av(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t(), [4, f()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        buttonEnabled: !l,
                        headerInfo: null
                    }), (0, eq.jsxs)(iX.Modal.Body, {
                        children: [(0, eq.jsx)("div", {
                            children: (0, eq.jsx)("p", {
                                children: n.Label.AuthenticatorUpsellDownloadInstruction
                            })
                        }), (0, eq.jsx)("div", {
                            className: "authenticator-upsell-download-grid",
                            children: (0, eq.jsxs)("div", {
                                className: "grid-container",
                                children: [(0, eq.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, eq.jsx)("div", {
                                        className: "modal-checkmark-icon"
                                    })
                                }), (0, eq.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, eq.jsx)("div", {
                                        children: n.Label.AuthenticatorUpsellMicrosoftOption
                                    })
                                }), (0, eq.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, eq.jsx)("div", {
                                        className: "modal-checkmark-icon"
                                    })
                                }), (0, eq.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, eq.jsx)("div", {
                                        children: n.Label.AuthenticatorUpsellGoogleOption
                                    })
                                }), (0, eq.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, eq.jsx)("div", {
                                        className: "modal-checkmark-icon"
                                    })
                                }), (0, eq.jsx)("div", {
                                    className: "grid-item",
                                    children: (0, eq.jsx)("div", {
                                        children: n.Label.AuthenticatorUpsellTwilioOption
                                    })
                                })]
                            })
                        }), (0, eq.jsx)("p", {
                            className: "text-error xsmall",
                            children: s
                        })]
                    }), (0, eq.jsx)(ar, {
                        positiveButton: d,
                        negativeButton: null
                    })]
                })
            };

            function am(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aA(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function ay(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aA(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            aA(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ab(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return am(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return am(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aN(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var a_ = function(e) {
                    var t = e.closeModal,
                        r = i6(),
                        n = r.state,
                        o = n.resources,
                        i = n.requestService,
                        a = n.promptAssignment,
                        s = r.dispatch,
                        c = ab((0, eJ.useState)(null), 2),
                        u = c[0],
                        l = c[1],
                        p = ab((0, eJ.useState)(!1), 2),
                        f = p[0],
                        d = p[1],
                        h = {
                            content: f ? (0, eq.jsx)("span", {
                                className: "spinner spinner-xs spinner-no-margin"
                            }) : o.Action.AuthenticatorUpsellSetupAuthenticatorButtonMessage,
                            label: o.Action.AuthenticatorUpsellSetupAuthenticatorButtonMessage,
                            enabled: !f,
                            action: function() {
                                l(null), d(!0), s({
                                    type: iZ.SET_MODAL_STATE,
                                    modalState: i$.AUTHENTICATOR_UPSELL_DOWNLOAD_APPS
                                })
                            }
                        };
                    return (0, eq.jsxs)(eZ().Fragment, {
                        children: [(0, eq.jsx)(ai, {
                            headerText: o.Header.AuthenticatorUpsellWelcomeMessage,
                            buttonType: an.CLOSE,
                            buttonAction: function() {
                                return ay(function() {
                                    return aN(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return t(), [4, ay(function() {
                                                    var e;
                                                    return aN(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, i.promptAssignments.updateForCurrentUser(rT.DISMISS_PROMPT, a.promptType)];
                                                            case 1:
                                                                return (e = t.sent()).isError && console.warn(iB, "Dismissing Authenticator Upsell prompt failed with error", e.error && ry[e.error]), [2]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return e.sent(), [2]
                                        }
                                    })
                                })()
                            },
                            buttonEnabled: !f,
                            headerInfo: null
                        }), (0, eq.jsxs)(iX.Modal.Body, {
                            children: [(0, eq.jsx)("div", {
                                className: "authenticator-upsell-intro-grid",
                                children: (0, eq.jsxs)("div", {
                                    className: "grid-container",
                                    children: [(0, eq.jsx)("div", {
                                        className: "grid-item",
                                        children: (0, eq.jsx)("div", {
                                            className: "modal-two-factors-icon"
                                        })
                                    }), (0, eq.jsxs)("div", {
                                        className: "grid-item",
                                        children: [(0, eq.jsx)("b", {
                                            children: o.Label.AuthenticatorUpsellTwoFactorHeadline
                                        }), (0, eq.jsx)("div", {
                                            children: o.Label.AuthenticatorUpsellTwoFactorMessage
                                        })]
                                    }), (0, eq.jsx)("div", {
                                        className: "grid-item",
                                        children: (0, eq.jsx)("div", {
                                            className: "modal-protect-icon"
                                        })
                                    }), (0, eq.jsxs)("div", {
                                        className: "grid-item",
                                        children: [(0, eq.jsx)("b", {
                                            children: o.Label.AuthenticatorUpsellProtectRobuxHeadline
                                        }), (0, eq.jsx)("div", {
                                            children: o.Label.AuthenticatorUpsellProtectRobuxMessage
                                        })]
                                    }), (0, eq.jsx)("div", {
                                        className: "grid-item",
                                        children: (0, eq.jsx)("div", {
                                            className: "modal-keep-bad-icon"
                                        })
                                    }), (0, eq.jsxs)("div", {
                                        className: "grid-item",
                                        children: [(0, eq.jsx)("b", {
                                            children: o.Label.AuthenticatorUpsellBadActorHeadline
                                        }), (0, eq.jsx)("div", {
                                            children: o.Label.AuthenticatorUpsellBadActorMessage
                                        })]
                                    })]
                                })
                            }), (0, eq.jsx)("p", {
                                className: "text-error xsmall",
                                children: u
                            })]
                        }), (0, eq.jsx)(ar, {
                            positiveButton: h,
                            negativeButton: null
                        })]
                    })
                },
                aO = function(e) {
                    var t = e.closeModal,
                        r = i6().state.resources;
                    return (0, eq.jsxs)(eZ().Fragment, {
                        children: [(0, eq.jsx)(ai, {
                            headerText: r.Header.Success,
                            buttonType: an.CLOSE,
                            buttonAction: t,
                            buttonEnabled: !0,
                            headerInfo: null
                        }), (0, eq.jsxs)(iX.Modal.Body, {
                            children: [(0, eq.jsx)("div", {
                                className: "modal-lock-icon"
                            }), (0, eq.jsx)("p", {
                                className: "modal-margin-bottom-large",
                                children: r.Description.ChangeYourPasswordSuccess
                            })]
                        })]
                    })
                };

            function aT(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function aI(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aT(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            aT(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aw(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            r(970);
            var ag = function() {
                    return Promise.resolve(null)
                },
                aR = function(e, t, r, n) {
                    return function(o) {
                        return aI(function() {
                            var i;
                            return aw(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, e.password.validate(r, o)];
                                    case 1:
                                        if ((i = a.sent()).isError) return [2, n];
                                        return [2, iz(t, i.value)]
                                }
                            })
                        })()
                    }
                },
                aC = function(e, t) {
                    return function(r) {
                        return aI(function() {
                            return aw(this, function(n) {
                                return r === t ? [2, Promise.resolve(null)] : [2, Promise.resolve(e)]
                            })
                        })()
                    }
                },
                aD = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return function(e) {
                        return aI(function() {
                            var r, n;
                            return aw(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        r = 0, o.label = 1;
                                    case 1:
                                        if (!(r < t.length)) return [3, 4];
                                        return [4, t[r](e)];
                                    case 2:
                                        if (null !== (n = o.sent())) return [2, n];
                                        o.label = 3;
                                    case 3:
                                        return r += 1, [3, 1];
                                    case 4:
                                        return [2, null]
                                }
                            })
                        })()
                    }
                },
                aP = function(e) {
                    var t = e.id,
                        r = e.inputType,
                        n = e.placeholder,
                        o = e.disabled,
                        i = e.value,
                        a = e.error,
                        s = e.canSubmit,
                        c = e.validate,
                        u = e.setValue,
                        l = e.setError,
                        p = e.handleSubmit,
                        f = e.onChange,
                        d = e.label,
                        h = e.bottomLabel,
                        S = e.inputMode,
                        v = e.autoComplete,
                        E = e.maxLength,
                        m = e.validCharactersRegEx,
                        A = e.hideFeedback,
                        y = e.concealInput,
                        b = e.autoFocus,
                        N = "" !== i && null === a,
                        _ = "" !== i && null !== a,
                        O = N || _;
                    return (0, eq.jsxs)("div", {
                        className: "input-control-wrapper",
                        children: [d && (0, eq.jsx)("label", {
                            className: "text-label xsmall",
                            htmlFor: t,
                            children: d
                        }), (0, eq.jsxs)(iX.FormGroup, {
                            controlId: t,
                            className: "".concat(O ? "form-has-feedback" : "", " ").concat(N ? "form-has-success" : "", " ").concat(_ ? "form-has-error" : ""),
                            children: [(0, eq.jsx)(iX.FormControl, {
                                as: "input",
                                className: "input-field".concat(y && i.length > 0 ? " input-field-concealed" : ""),
                                type: r,
                                inputMode: S,
                                autoComplete: v,
                                maxLength: E,
                                disabled: o,
                                value: i,
                                placeholder: n,
                                onChange: function(e) {
                                    return aI(function() {
                                        var t;
                                        return aw(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return t = e.currentTarget.value, void 0 === m || m.test(t) || (t = i), void 0 !== f && f(t), u(t), [4, c(t)];
                                                case 1:
                                                    return l.apply(void 0, [r.sent()]), [2]
                                            }
                                        })
                                    })()
                                },
                                onKeyDown: function(e) {
                                    return aI(function() {
                                        return aw(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    if (!("Enter" === e.key && s)) return [3, 2];
                                                    return e.preventDefault(), e.stopPropagation(), [4, p()];
                                                case 1:
                                                    t.sent(), t.label = 2;
                                                case 2:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                autoFocus: b
                            }), !o && !A && N && (0, eq.jsx)("span", {
                                className: "icon-checkmark-on"
                            }), !o && !A && _ && (0, eq.jsx)("span", {
                                className: "icon-close"
                            }), (0, eq.jsx)("div", {
                                className: "form-control-label bottom-label xsmall",
                                children: !o && _ ? a : h || "\xa0"
                            })]
                        })]
                    })
                };

            function aU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aL(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function aM(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aU(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ax = function() {
                var e = i6(),
                    t = e.state,
                    r = t.username,
                    n = t.resources,
                    o = t.requestService,
                    i = e.dispatch,
                    a = aM((0, eJ.useState)(""), 2),
                    s = a[0],
                    c = a[1],
                    u = aM((0, eJ.useState)(null), 2),
                    l = u[0],
                    p = u[1],
                    f = aM((0, eJ.useState)(""), 2),
                    d = f[0],
                    h = f[1],
                    S = aM((0, eJ.useState)(null), 2),
                    v = S[0],
                    E = S[1],
                    m = aM((0, eJ.useState)(""), 2),
                    A = m[0],
                    y = m[1],
                    b = aM((0, eJ.useState)(null), 2),
                    N = b[0],
                    _ = b[1],
                    O = aM((0, eJ.useState)(null), 2),
                    T = O[0],
                    I = O[1],
                    w = aM((0, eJ.useState)(!1), 2),
                    g = w[0],
                    R = w[1],
                    C = aM((0, eJ.useState)(!1), 2),
                    D = C[0],
                    P = C[1],
                    U = function() {
                        return I(null)
                    },
                    L = function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return function(e) {
                            t.forEach(function(t) {
                                return t(e)
                            })
                        }
                    },
                    M = function() {
                        var e;
                        return (e = function() {
                            var e;
                            return function(e, t) {
                                var r, n, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                    return this
                                }), a;

                                function s(s) {
                                    return function(c) {
                                        var u = [s, c];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                case 0:
                                                case 1:
                                                    o = u;
                                                    break;
                                                case 4:
                                                    return i.label++, {
                                                        value: u[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    i.label++, n = u[1], u = [0];
                                                    continue;
                                                case 7:
                                                    u = i.ops.pop(), i.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                        i = 0;
                                                        continue
                                                    }
                                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                        i.label = u[1];
                                                        break
                                                    }
                                                    if (6 === u[0] && i.label < o[1]) {
                                                        i.label = o[1], o = u;
                                                        break
                                                    }
                                                    if (o && i.label < o[2]) {
                                                        i.label = o[2], i.ops.push(u);
                                                        break
                                                    }
                                                    o[2] && i.ops.pop(), i.trys.pop();
                                                    continue
                                            }
                                            u = t.call(e, i)
                                        } catch (e) {
                                            u = [6, e], n = 0
                                        } finally {
                                            r = o = 0
                                        }
                                        if (5 & u[0]) throw u[1];
                                        return {
                                            value: u[0] ? u[1] : void 0,
                                            done: !0
                                        }
                                    }
                                }
                            }(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return I(null), P(!0), [4, o.password.changeForCurrentUser(s, d)];
                                    case 1:
                                        if ((e = t.sent()).isError) return P(!1), e.error === tY.INVALID_CURRENT_PASSWORD ? R(!0) : R(!1), I(iq(n, e.error)), [2];
                                        return i({
                                            type: iZ.SET_MODAL_STATE,
                                            modalState: i$.CHANGE_PASSWORD_CONFIRMATION
                                        }), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(n, o) {
                                var i = e.apply(t, r);

                                function a(e) {
                                    aL(i, n, o, a, s, "next", e)
                                }

                                function s(e) {
                                    aL(i, n, o, a, s, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    },
                    x = "" !== s && null === l && "" !== d && null === v && "" !== A && null === N,
                    j = {
                        content: D ? (0, eq.jsx)("span", {
                            className: "spinner spinner-xs spinner-no-margin"
                        }) : n.Action.SubmitChangePassword,
                        label: n.Action.SubmitChangePassword,
                        enabled: !D && x,
                        action: M
                    },
                    k = (0, eq.jsx)("a", {
                        href: "https://en.help.roblox.com/hc/articles/203313070-I-Forgot-My-Password",
                        className: "bottom-label-link",
                        target: "_blank",
                        rel: "noreferrer",
                        children: n.Label.IForgotMyPassword
                    }),
                    F = (0, eq.jsxs)(eJ.Fragment, {
                        children: [(0, eq.jsx)("div", {
                            className: "shield-check-icon xsmall"
                        }), (0, eq.jsx)("div", {
                            className: "bottom-label-text-with-start-margin text-label xsmall",
                            children: n.Label.UseAUniquePassword
                        })]
                    });
                return (0, eq.jsxs)(eZ().Fragment, {
                    children: [(0, eq.jsx)(ai, {
                        headerText: n.Header.CreateAStrongPassword,
                        buttonType: an.BACK,
                        buttonAction: function() {
                            return i({
                                type: iZ.SET_MODAL_STATE,
                                modalState: i$.CHANGE_PASSWORD_INTRO
                            })
                        },
                        buttonEnabled: !D,
                        headerInfo: null
                    }), (0, eq.jsxs)(iX.Modal.Body, {
                        children: [(0, eq.jsx)(aP, {
                            id: "inputCurrentPassword",
                            label: n.Label.CurrentPassword,
                            bottomLabel: k,
                            inputType: "password",
                            autoComplete: "current-password",
                            placeholder: "",
                            disabled: D,
                            value: s,
                            setValue: c,
                            error: l || g && T || null,
                            setError: p,
                            validate: ag,
                            canSubmit: x,
                            handleSubmit: M,
                            onChange: U
                        }), (0, eq.jsx)(aP, {
                            id: "inputNewPassword",
                            label: n.Label.NewPassword,
                            bottomLabel: F,
                            inputType: "password",
                            autoComplete: "new-password",
                            placeholder: n.Label.AtLeastCharacters(8),
                            disabled: D,
                            value: d,
                            setValue: h,
                            error: v,
                            setError: L(function() {
                                return _(null)
                            }, E),
                            validate: aD(aR(o, n, r, n.Message.Error.PasswordValidation.Default), "" !== A ? aC(n.Message.Error.Input.PasswordsDoNotMatch, A) : ag),
                            canSubmit: x,
                            handleSubmit: M,
                            onChange: U
                        }), (0, eq.jsx)(aP, {
                            id: "inputNewPasswordAgain",
                            label: n.Label.ConfirmNewPassword,
                            inputType: "password",
                            autoComplete: "new-password",
                            placeholder: "",
                            disabled: D,
                            value: A,
                            setValue: y,
                            error: N || !g && T || null,
                            setError: L(function() {
                                return E(null)
                            }, _),
                            validate: aD(aC(n.Message.Error.Input.PasswordsDoNotMatch, d), aR(o, n, r, n.Message.Error.PasswordValidation.Default)),
                            canSubmit: x,
                            handleSubmit: M,
                            onChange: U
                        })]
                    }), (0, eq.jsx)(ar, {
                        positiveButton: j,
                        negativeButton: null
                    })]
                })
            };

            function aj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ak(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aj(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aj(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aF = function(e) {
                var t = e.closeModal,
                    r = i6(),
                    n = r.state,
                    o = n.promptAssignment,
                    i = n.resources,
                    a = (n.requestService, r.dispatch),
                    s = ak((0, eJ.useState)(null), 2),
                    c = s[0],
                    u = s[1],
                    l = ak((0, eJ.useState)(!1), 2),
                    p = l[0],
                    f = l[1],
                    d = "An unexpected issue occurred while displaying this text.";
                o.isGeneric || (d = o.promptType !== r_.CHANGE_PASSWORD__BREACHED_CREDENTIAL ? "".concat(i.Description.UnusualActivity, " ").concat(i.Description.ChangeYourPassword) : "".concat(i.Description.ChangeYourPasswordImmediately, " ").concat(i.Description.NoChangeForceReset(i5(o.metadata.forceResetTimestamp))));
                var h = {
                    content: p ? (0, eq.jsx)("span", {
                        className: "spinner spinner-xs spinner-no-margin"
                    }) : i.Action.ContinueChangePassword,
                    label: i.Action.ContinueChangePassword,
                    enabled: !p,
                    action: function() {
                        u(null), f(!0), a({
                            type: iZ.SET_MODAL_STATE,
                            modalState: i$.CHANGE_PASSWORD_FORM
                        })
                    }
                };
                return (0, eq.jsxs)(eZ().Fragment, {
                    children: [(0, eq.jsx)(ai, {
                        headerText: i.Header.ChangeYourPassword,
                        buttonType: an.CLOSE,
                        buttonAction: t,
                        buttonEnabled: !p,
                        headerInfo: null
                    }), (0, eq.jsxs)(iX.Modal.Body, {
                        children: [(0, eq.jsx)("div", {
                            className: "modal-lock-icon"
                        }), (0, eq.jsx)("p", {
                            className: "modal-margin-bottom",
                            dangerouslySetInnerHTML: {
                                __html: d
                            }
                        }), (0, eq.jsx)("p", {
                            className: "text-error xsmall",
                            children: c
                        })]
                    }), (0, eq.jsx)(ar, {
                        positiveButton: h,
                        negativeButton: null
                    })]
                })
            };

            function aV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aW(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var aB = function(e) {
                var t, r = e.closeModal,
                    n = i6(),
                    o = n.state,
                    i = o.promptAssignment,
                    a = o.resources,
                    s = o.requestService,
                    c = n.dispatch,
                    u = (t = (0, eJ.useState)(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                s = !1;
                            try {
                                for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                            } catch (e) {
                                s = !0, n = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (s) throw n
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return aV(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aV(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    l = u[0],
                    p = u[1],
                    f = a.Description.AreYouSureDismissForeverChangePassword,
                    d = a.Action.ConfirmDismissForeverChangePassword,
                    h = a.Action.AbortDismissForeverChangePassword,
                    S = {
                        content: l ? (0, eq.jsx)("span", {
                            className: "spinner spinner-xs spinner-no-margin"
                        }) : d,
                        label: d,
                        enabled: !l,
                        action: function() {
                            var e;
                            return (e = function() {
                                var e;
                                return function(e, t) {
                                    var r, n, o, i = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                        return this
                                    }), a;

                                    function s(s) {
                                        return function(c) {
                                            var u = [s, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                                if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                                switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = u;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: u[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, n = u[1], u = [0];
                                                        continue;
                                                    case 7:
                                                        u = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                            i.label = u[1];
                                                            break
                                                        }
                                                        if (6 === u[0] && i.label < o[1]) {
                                                            i.label = o[1], o = u;
                                                            break
                                                        }
                                                        if (o && i.label < o[2]) {
                                                            i.label = o[2], i.ops.push(u);
                                                            break
                                                        }
                                                        o[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                u = t.call(e, i)
                                            } catch (e) {
                                                u = [6, e], n = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & u[0]) throw u[1];
                                            return {
                                                value: u[0] ? u[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return p(!0), [4, s.promptAssignments.updateForCurrentUser(rT.DISABLE_PROMPT, i.promptType)];
                                        case 1:
                                            if ((e = t.sent()).isError) return p(!1), console.warn(iB, "Disabling prompt failed with error", e.error && ry[e.error]), [2];
                                            return c({
                                                type: iZ.DISMISS_FOREVER
                                            }), r(), [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var i = e.apply(t, r);

                                    function a(e) {
                                        aW(i, n, o, a, s, "next", e)
                                    }

                                    function s(e) {
                                        aW(i, n, o, a, s, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        }
                    };
                return (0, eq.jsxs)(eZ().Fragment, {
                    children: [(0, eq.jsx)(ai, {
                        headerText: a.Header.AreYouSure,
                        buttonType: an.HIDDEN,
                        buttonAction: r,
                        buttonEnabled: !0,
                        headerInfo: null
                    }), (0, eq.jsxs)(iX.Modal.Body, {
                        children: [(0, eq.jsx)("div", {
                            className: "modal-lock-icon"
                        }), (0, eq.jsx)("p", {
                            children: f
                        })]
                    }), (0, eq.jsx)(ar, {
                        positiveButton: {
                            content: h,
                            label: h,
                            enabled: !l,
                            action: function() {
                                c({
                                    type: iZ.SET_MODAL_STATE,
                                    modalState: i$.CHANGE_PASSWORD_INTRO
                                })
                            }
                        },
                        negativeButton: S
                    })]
                })
            };

            function aH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aY(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function aG(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            aY(i, n, o, a, s, "next", e)
                        }

                        function s(e) {
                            aY(i, n, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aK(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aH(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aH(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aQ(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < o[1]) {
                                        i.label = o[1], o = u;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(u);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = t.call(e, i)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var aX = function(e) {
                var t = e.closeModal,
                    r = i6().state,
                    n = r.resources,
                    o = r.requestService,
                    i = r.promptAssignment,
                    a = aK((0, eJ.useState)(null), 2),
                    s = a[0],
                    c = a[1],
                    u = aK((0, eJ.useState)(!1), 2),
                    l = u[0],
                    p = u[1],
                    f = function() {
                        return aG(function() {
                            var e;
                            return aQ(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, o.promptAssignments.updateForCurrentUser(rT.DISMISS_PROMPT, i.promptType)];
                                    case 1:
                                        return (e = t.sent()).isError && console.warn(iB, "Dismissing Account Restores Policy Upsell prompt failed with error", e.error && ry[e.error]), [2]
                                }
                            })
                        })()
                    },
                    d = {
                        content: l ? (0, eq.jsx)("span", {
                            className: "spinner spinner-xs spinner-no-margin"
                        }) : n.Action.SetUpEmail2SV,
                        label: n.Action.SetUpEmail2SV,
                        enabled: !l,
                        action: function() {
                            return aG(function() {
                                return aQ(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return c(null), p(!0), [4, f()];
                                        case 1:
                                            return e.sent(), window.open(iG + iY, "_self"), [2]
                                    }
                                })
                            })()
                        }
                    };
                return (0, eq.jsxs)(eZ().Fragment, {
                    children: [(0, eq.jsx)(ai, {
                        headerText: n.Header.Email2SVUpsell,
                        buttonType: an.CLOSE,
                        buttonAction: function() {
                            return aG(function() {
                                return aQ(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t(), [4, f()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        buttonEnabled: !0,
                        headerInfo: null
                    }), (0, eq.jsxs)(iX.Modal.Body, {
                        children: [(0, eq.jsx)("div", {
                            className: "modal-lock-icon"
                        }), (0, eq.jsx)("p", {
                            className: "modal-margin-bottom-sm",
                            dangerouslySetInnerHTML: {
                                __html: n.Description.Email2SVUpsellMessageBody(iG)
                            }
                        }), (0, eq.jsx)("p", {
                            className: "text-error xsmall",
                            children: s
                        })]
                    }), (0, eq.jsx)(ar, {
                        positiveButton: d,
                        negativeButton: null
                    })]
                })
            };

            function aq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var az = function(e) {
                    switch (e) {
                        case i$.CHANGE_PASSWORD_INTRO:
                            return {
                                innerFragment: aF, canClickBackdropToClose: !0
                            };
                        case i$.CHANGE_PASSWORD_FORM:
                            return {
                                innerFragment: ax, canClickBackdropToClose: !1
                            };
                        case i$.CHANGE_PASSWORD_CONFIRMATION:
                            return {
                                innerFragment: aO, canClickBackdropToClose: !0
                            };
                        case i$.CHANGE_PASSWORD_DISMISS_CONFIRMATION:
                            return {
                                innerFragment: aB, canClickBackdropToClose: !1
                            };
                        case i$.AUTHENTICATOR_UPSELL_OPENING:
                            return {
                                innerFragment: a_, canClickBackdropToClose: !1
                            };
                        case i$.AUTHENTICATOR_UPSELL_DOWNLOAD_APPS:
                            return {
                                innerFragment: aE, canClickBackdropToClose: !1
                            };
                        case i$.ACCOUNT_RESTORE_POLICY_UPSELL:
                            return {
                                innerFragment: ap, canClickBackdropToClose: !1
                            };
                        case i$.EMAIL_2SV_UPSELL:
                            return {
                                innerFragment: aX, canClickBackdropToClose: !1
                            };
                        default:
                            return null
                    }
                },
                a$ = function() {
                    var e, t = i6(),
                        r = t.state,
                        n = r.isFlowComplete,
                        o = r.modalState,
                        i = r.promptAssignment,
                        a = t.dispatch,
                        s = (e = (0, eJ.useState)(!0), function(e) {
                            if (Array.isArray(e)) return e
                        }(e) || function(e, t) {
                            var r, n, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    s = !1;
                                try {
                                    for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), i.length !== t); a = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return i
                            }
                        }(e, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return aq(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aq(e, t)
                            }
                        }(e, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        c = s[0],
                        u = s[1],
                        l = function() {
                            return u(!1)
                        },
                        p = az(o),
                        f = i.promptType === r_.AUTHENTICATOR_UPSELL || i.promptType === r_.ACCOUNT_RESTORES_POLICY_UPSELL || i.promptType === r_.BROADER_AUTHENTICATOR_UPSELL && !0 !== i.isGeneric && !i.metadata.showBanner || i.promptType === r_.EMAIL_2SV_UPSELL && !0 !== i.isGeneric && !i.metadata.showBanner;
                    return (0, eq.jsxs)(eZ().Fragment, {
                        children: [!n && !f && (0, eq.jsx)(at, {}), p && (0, eq.jsx)(iX.Modal, {
                            className: "modal-modern modal-modern-security-prompt",
                            show: c,
                            onHide: l,
                            onExited: function() {
                                a({
                                    type: iZ.SET_MODAL_STATE,
                                    modalState: i$.NONE
                                }), u(!0)
                            },
                            backdrop: p.canClickBackdropToClose ? void 0 : "static",
                            children: (0, eq.jsx)(p.innerFragment, {
                                closeModal: l
                            })
                        })]
                    })
                },
                aJ = (0, iW.withTranslations)(function(e) {
                    var t = e.promptAssignment,
                        r = e.username,
                        n = e.isUserUnder13,
                        o = e.eventService,
                        i = e.requestService,
                        a = e.translate;
                    return (0, eq.jsx)(i3, {
                        promptAssignment: t,
                        username: r,
                        isUserUnder13: n,
                        eventService: o,
                        requestService: i,
                        translate: a,
                        children: (0, eq.jsx)(a$, {})
                    })
                }, {
                    common: [],
                    feature: "Feature.AccountSecurityPrompt"
                }),
                aZ = function() {
                    var e;

                    function t(e) {
                        var r, n;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        n = void 0, (r = "promptType") in this ? Object.defineProperty(this, r, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : this[r] = n, this.promptType = e
                    }
                    return e = [{
                            key: "sendModalStateViewedEvent",
                            value: function(e) {
                                e$().EventStream.SendEventWithTarget("accountSecurityPromptEvent", iQ, {
                                    promptType: this.promptType,
                                    state: e
                                }, e$().EventStream.TargetTypes.WWW)
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }();

            function a0(e, t, r, n, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, o)
            }
            var a1 = new function e() {
                    if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                    iV(this, "captcha", ey), iV(this, "captchaV2", eN), iV(this, "email", eb), iV(this, "fido2", eY), iV(this, "games", e_), iV(this, "metrics", eV), iV(this, "myAccount", eO), iV(this, "otp", eT), iV(this, "password", eI), iV(this, "phone", ew), iV(this, "playstation", eg), iV(this, "promptAssignments", eR), iV(this, "securityQuestions", eU), iV(this, "sessionManagement", eL), iV(this, "rostile", eP), iV(this, "thumbnails", eM), iV(this, "turnstile", ex), iV(this, "twoStepVerification", ej), iV(this, "universalAppConfiguration", ek), iV(this, "proofOfSpace", eC), iV(this, "proofOfWork", eD), iV(this, "xbox", eF), iV(this, "privateAccessToken", eW), iV(this, "genericChallenge", eB), iV(this, "authApi", eH), iV(this, "accountRecoveryApi", eG), iV(this, "legacyAccountInfoApi", eK), iV(this, "userSettingsApi", eQ), iV(this, "usersApi", eX)
                },
                a2 = function(e, t, r) {
                    var n = document.getElementById("account-security-prompt-container");
                    if (null !== n) {
                        (0, e0.unmountComponentAtNode)(n);
                        var o = new aZ(e.promptType);
                        (0, e0.render)((0, eq.jsx)(aJ, {
                            promptAssignment: e,
                            username: t,
                            isUserUnder13: r,
                            eventService: o,
                            requestService: a1
                        }), n)
                    }
                };
            ez.CurrentUser && ez.CurrentUser.isAuthenticated && "unknown" === (0, ez.DeviceMeta)().appType && (Object.assign(e$(), {
                AccountSecurityPrompt: {
                    render: a2,
                    PromptType: r_
                }
            }), (Q = function() {
                var e, t, r, n, o;
                return function(e, t) {
                    var r, n, o, i = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                    return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function s(s) {
                        return function(c) {
                            var u = [s, c];
                            if (r) throw TypeError("Generator is already executing.");
                            for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                    case 0:
                                    case 1:
                                        o = u;
                                        break;
                                    case 4:
                                        return i.label++, {
                                            value: u[1],
                                            done: !1
                                        };
                                    case 5:
                                        i.label++, n = u[1], u = [0];
                                        continue;
                                    case 7:
                                        u = i.ops.pop(), i.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                            i = 0;
                                            continue
                                        }
                                        if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                            i.label = u[1];
                                            break
                                        }
                                        if (6 === u[0] && i.label < o[1]) {
                                            i.label = o[1], o = u;
                                            break
                                        }
                                        if (o && i.label < o[2]) {
                                            i.label = o[2], i.ops.push(u);
                                            break
                                        }
                                        o[2] && i.ops.pop(), i.trys.pop();
                                        continue
                                }
                                u = t.call(e, i)
                            } catch (e) {
                                u = [6, e], n = 0
                            } finally {
                                r = o = 0
                            }
                            if (5 & u[0]) throw u[1];
                            return {
                                value: u[0] ? u[1] : void 0,
                                done: !0
                            }
                        }
                    }
                }(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, a1.promptAssignments.getAllForCurrentUser()];
                        case 1:
                            if ((e = i.sent()).isError) return console.warn(iB, "Retrieving prompt assignments failed with error", e.error && ry[e.error]), [2];
                            if (0 === (t = e.value).length) return console.log(iB, "No assignments were retrieved"), [2];
                            if (window.location.href.includes(iH) || window.location.href.includes(".com/my/account")) return [2];
                            for (n = 0, r = null; n < t.length; n++) {
                                if ((o = t[n]).promptType !== r_.BROADER_AUTHENTICATOR_UPSELL && o.promptType !== r_.EMAIL_2SV_UPSELL || !1 !== o.isGeneric || o.metadata.pageRestriction !== rN.HOME_PAGE_ONLY || window.location.href.includes(".com/home")) {
                                    r = o;
                                    break
                                }
                                r = null
                            }
                            if (null === r) return [2];
                            return a2(r, ez.CurrentUser.name, ez.CurrentUser.isUnder13), [2]
                    }
                })
            }, function() {
                var e = this,
                    t = arguments;
                return new Promise(function(r, n) {
                    var o = Q.apply(e, t);

                    function i(e) {
                        a0(o, r, n, i, a, "next", e)
                    }

                    function a(e) {
                        a0(o, r, n, i, a, "throw", e)
                    }
                    i(void 0)
                })
            })())
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AccountSecurityPrompt");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/accountSecurityPrompt-3433ed0cc5828724.js.map