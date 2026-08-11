! function() {
    var t = {
            942: function(t) {
                function n(t) {
                    return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function o() {
                        for (var t = "", a = 0; a < arguments.length; a++) {
                            var u = arguments[a];
                            u && (t = i(t, function(t) {
                                if ("string" == typeof t || "number" == typeof t) return t;
                                if ((void 0 === t ? "undefined" : n(t)) !== "object") return "";
                                if (Array.isArray(t)) return o.apply(null, t);
                                if (t.toString !== Object.prototype.toString && !t.toString.toString().includes("[native code]")) return t.toString();
                                var a = "";
                                for (var u in t) r.call(t, u) && t[u] && (a = i(a, u));
                                return a
                            }(u)))
                        }
                        return t
                    }

                    function i(t, n) {
                        return n ? t ? t + " " + n : t + n : t
                    }
                    t.exports ? (o.default = o, t.exports = o) : "function" == typeof define && "object" === n(define.amd) && define.amd ? define("classnames", [], function() {
                        return o
                    }) : window.classNames = o
                }()
            },
            258: function(t, n, r) {
                "use strict";
                t.exports = {}
            },
            773: function(t, n, r) {
                "use strict";
                t.exports = {}
            }
        },
        n = {};

    function r(o) {
        var i = n[o];
        if (void 0 !== i) return i.exports;
        var a = n[o] = {
            exports: {}
        };
        return t[o](a, a.exports, r), a.exports
    }
    r.m = t, r.n = function(t) {
        var n = t && t.__esModule ? function() {
            return t.default
        } : function() {
            return t
        };
        return r.d(n, {
            a: n
        }), n
    }, r.d = function(t, n) {
        for (var o in n) r.o(n, o) && !r.o(t, o) && Object.defineProperty(t, o, {
            enumerable: !0,
            get: n[o]
        })
    }, r.k = function(t) {
        return "" + t + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (t) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(t, n) {
        return Object.prototype.hasOwnProperty.call(t, n)
    }, r.r = function(t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, r.nc = void 0, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (o = r.g.location + "");
    var o, i = r.g.document;
    if (!o && i && (i.currentScript && "SCRIPT" === i.currentScript.tagName.toUpperCase() && (o = i.currentScript.src), !o)) {
        var a = i.getElementsByTagName("script");
        if (a.length)
            for (var u = a.length - 1; u > -1 && (!o || !/^http(s?):/.test(o));) o = a[u--].src
    }
    if (!o) throw Error("Automatic publicPath is not supported in this browser");
    r.p = o.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var t, n, o, i, a, u, l = {};
            r.r(l), r.d(l, {
                getMetadata: function() {
                    return ei
                }
            });
            var c = {};
            r.r(c), r.d(c, {
                getEmailConfiguration: function() {
                    return ed
                },
                updateForCurrentUser: function() {
                    return es
                },
                updateForCurrentUserWithVerification: function() {
                    return ef
                }
            });
            var s = {};
            r.r(s), r.d(s, {
                getDetailsForUniverseIds: function() {
                    return em
                }
            });
            var f = {};
            r.r(f), r.d(f, {
                getMySettingsInfo: function() {
                    return eg
                }
            });
            var d = {};
            r.r(d), r.d(d, {
                getMetadata: function() {
                    return eL
                },
                resendCode: function() {
                    return eI
                },
                sendCodeForUser: function() {
                    return e_
                },
                validateCode: function() {
                    return eD
                }
            });
            var p = {};
            r.r(p), r.d(p, {
                changeForCurrentUser: function() {
                    return eV
                },
                resetSendPrompted: function() {
                    return ez
                },
                validate: function() {
                    return eK
                }
            });
            var v = {};
            r.r(v), r.d(v, {
                getPhoneConfiguration: function() {
                    return e5
                },
                getPhonePrefixList: function() {
                    return e8
                },
                prioritizeDefaultPrefix: function() {
                    return e6
                },
                resendCode: function() {
                    return te
                },
                updatePhone: function() {
                    return e7
                },
                verifyCode: function() {
                    return e9
                }
            });
            var h = {};
            r.r(h), r.d(h, {
                disconnectPlaystation: function() {
                    return tu
                },
                getPlaystationConnection: function() {
                    return ta
                }
            });
            var m = {};
            r.r(m), r.d(m, {
                getAllForCurrentUser: function() {
                    return tm
                },
                updateForCurrentUser: function() {
                    return ty
                }
            });
            var y = {};
            r.r(y), r.d(y, {
                verifyPuzzle: function() {
                    return tO
                }
            });
            var b = {};
            r.r(b), r.d(b, {
                getPuzzle: function() {
                    return t_
                },
                verifyPuzzle: function() {
                    return tI
                }
            });
            var g = {};
            r.r(g), r.d(g, {
                verifyPuzzle: function() {
                    return tj
                }
            });
            var S = {};
            r.r(S), r.d(S, {
                answerQuestion: function() {
                    return tz
                },
                getQuestion: function() {
                    return tV
                }
            });
            var w = {};
            r.r(w), r.d(w, {
                getSessions: function() {
                    return t2
                },
                logoutFromAllSessionsAndReauthenticate: function() {
                    return t3
                },
                logoutSession: function() {
                    return t4
                }
            });
            var O = {};
            r.r(O), r.d(O, {
                getIconsForUniverseIds: function() {
                    return t7
                }
            });
            var E = {};
            r.r(E), r.d(E, {
                clearRecoveryCodes: function() {
                    return nD
                },
                deleteSecurityKey: function() {
                    return nV
                },
                disableAuthenticator: function() {
                    return nC
                },
                disableEmailTwoStepVerification: function() {
                    return nN
                },
                disableSmsTwoStepVerification: function() {
                    return nU
                },
                enableAuthenticator: function() {
                    return nA
                },
                enableEmailTwoStepVerification: function() {
                    return nw
                },
                enableSecurityKey: function() {
                    return nk
                },
                enableSmsTwoStepVerification: function() {
                    return nR
                },
                enableVerifyAuthenticator: function() {
                    return nx
                },
                enableVerifySecurityKey: function() {
                    return nM
                },
                generateRecoveryCodes: function() {
                    return nL
                },
                generateResaleFrictionChallenge: function() {
                    return nq
                },
                generateSpendFrictionChallenge: function() {
                    return nX
                },
                generateTradeFrictionChallenge: function() {
                    return nQ
                },
                getMetadata: function() {
                    return ng
                },
                getPasskeyOptions: function() {
                    return nK
                },
                getRecoveryCodesStatus: function() {
                    return nI
                },
                getResaleFrictionStatus: function() {
                    return nG
                },
                getSecurityKeyOptions: function() {
                    return nW
                },
                getSpendFrictionStatus: function() {
                    return nH
                },
                getTradeFrictionStatus: function() {
                    return nY
                },
                getUserConfiguration: function() {
                    return nS
                },
                listSecurityKey: function() {
                    return nz
                },
                redeemResaleFrictionChallenge: function() {
                    return nJ
                },
                redeemSpendFrictionChallenge: function() {
                    return n$
                },
                redeemTradeFrictionChallenge: function() {
                    return nZ
                },
                retractCrossDevice: function() {
                    return n2
                },
                retryCrossDevice: function() {
                    return n0
                },
                sendEmailCode: function() {
                    return nO
                },
                sendSmsCode: function() {
                    return nP
                },
                verifyAuthenticatorCode: function() {
                    return nT
                },
                verifyCrossDevice: function() {
                    return n1
                },
                verifyEmailCode: function() {
                    return nE
                },
                verifyPasskeyCredential: function() {
                    return nB
                },
                verifyPasswordCode: function() {
                    return n4
                },
                verifyRecoveryCode: function() {
                    return n_
                },
                verifySecurityKeyCredential: function() {
                    return nF
                },
                verifySmsCode: function() {
                    return nj
                }
            });
            var N = {};
            r.r(N), r.d(N, {
                getSettingsUiPolicy: function() {
                    return n6
                }
            });
            var A = {};
            r.r(A), r.d(A, {
                disconnectXbox: function() {
                    return rn
                },
                getXboxConnection: function() {
                    return rt
                }
            });
            var x = {};
            r.r(x), r.d(x, {
                recordMetric: function() {
                    return ra
                }
            });
            var T = {};
            r.r(T), r.d(T, {
                getPatToken: function() {
                    return rf
                }
            });
            var C = {};
            r.r(C), r.d(C, {
                continueChallenge: function() {
                    return rm
                }
            });
            var _ = {};
            r.r(_), r.d(_, {
                deletePasskeyBatch: function() {
                    return rK
                },
                finishARPreAuthPasskeyRegistration: function() {
                    return rz
                },
                finishPasskeyRegistration: function() {
                    return rV
                },
                invalidateTicketsForEppEnrollment: function() {
                    return rY
                },
                listAllCredentials: function() {
                    return rB
                },
                resetPassword: function() {
                    return rH
                },
                startPasskeyRegistration: function() {
                    return rW
                },
                startPreAuthPasskeyRegistration: function() {
                    return rF
                }
            });
            var I = {};
            r.r(I), r.d(I, {
                getNativeResponse: function() {
                    return rQ
                },
                getNavigatorCredentials: function() {
                    return rq
                }
            });
            var D = {};
            r.r(D), r.d(D, {
                continueRecovery: function() {
                    return or
                },
                disableTwoStepMethod: function() {
                    return ou
                },
                getCurrentTwoStepMethod: function() {
                    return oa
                },
                recoverySessionMetadata: function() {
                    return oo
                },
                requestRecovery: function() {
                    return r9
                },
                resendCode: function() {
                    return ot
                },
                sendCode: function() {
                    return oe
                },
                setEmail: function() {
                    return oi
                },
                verifyCode: function() {
                    return on
                }
            });
            var L = {};
            r.r(L), r.d(L, {
                getAccountInfo: function() {
                    return os
                }
            });
            var R = {};
            r.r(R), r.d(R, {
                changeEppStatus: function() {
                    return ov
                },
                userSettings: function() {
                    return op
                }
            });
            var P = {};
            r.r(P), r.d(P, {
                getUserById: function() {
                    return ob
                },
                getUserByUsername: function() {
                    return og
                }
            }), r(258);
            var j = window.ReactJSX,
                U = window.React,
                k = r.n(U),
                M = window.ReactDOM,
                W = r.n(M),
                F = window.Roblox,
                V = r.n(F),
                z = window.CoreUtilities,
                K = function(t) {
                    return {
                        isError: !1,
                        value: t
                    }
                },
                B = function(t, n) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: t,
                        errorRaw: n,
                        errorStatusCode: r
                    }
                },
                H = function(t, n) {
                    return t.isError ? t : K(n(t.value))
                };

            function Y(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function G(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function u(t) {
                            Y(a, o, i, u, l, "next", t)
                        }

                        function l(t) {
                            Y(a, o, i, u, l, "throw", t)
                        }
                        u(void 0)
                    })
                }
            }

            function X(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function Q(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                    return this
                }), u;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                            switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        a.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && a.label < i[1]) {
                                        a.label = i[1], i = s;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(s);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            s = n.call(t, a)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var q = function(t) {
                    var n, r = [];
                    if (!t || (void 0 === t ? "undefined" : X(t)) !== "object") return [];
                    var o = t.errors;
                    return (null != (n = Array) && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? n[Symbol.hasInstance](o) : o instanceof n) ? (o.forEach(function(t) {
                        if (t && (void 0 === t ? "undefined" : X(t)) === "object") {
                            var n = t.code;
                            "number" == typeof n && r.push(n)
                        }
                    }), r) : []
                },
                $ = function(t) {
                    return (void 0 === t ? "undefined" : X(t)) !== "object" ? null : q(t.data)[0] || null
                },
                Z = function(t, n) {
                    return null == t ? null : Object.values(t).includes(n) ? n : null
                },
                J = function(t) {
                    if ((void 0 === t ? "undefined" : X(t)) !== "object" || null === t) return null;
                    var n = t.status || null;
                    return "number" != typeof n ? null : n
                },
                ee = function(t, n, r) {
                    return G(function() {
                        var o, i, a, u;
                        return Q(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return l.trys.push([0, 2, , 3]), [4, t];
                                case 1:
                                    if (o = l.sent(), void 0 !== r) return [2, K(r(o.data))];
                                    return [2, K(o.data)];
                                case 2:
                                    return a = $(i = l.sent()), u = J(i), [2, B(Z(n, a), i, u)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                et = function(t, n) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : $,
                        o = arguments.length > 3 ? arguments[3] : void 0;
                    return G(function() {
                        var i, a;
                        return Q(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    return u.trys.push([0, 2, , 3]), [4, t];
                                case 1:
                                    if (i = u.sent(), void 0 !== o) return [2, K(o(i))];
                                    return [2, K(i)];
                                case 2:
                                    return [2, B(Z(n, r(a = u.sent())), a, 0)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                en = null != (uh = F.EnvironmentUrls.apiGatewayCdnUrl) ? uh : "URL_NOT_FOUND",
                er = ((aW = {})[aW.UNKNOWN = 0] = "UNKNOWN", aW),
                eo = {
                    url: "".concat("".concat(en, "/captcha"), "/v1/metadata"),
                    timeout: 6e4
                },
                ei = function() {
                    return ee(z.httpService.get(eo, {}), er)
                },
                ea = null != (um = F.EnvironmentUrls.accountSettingsApi) ? um : "URL_NOT_FOUND",
                eu = ((aF = {})[aF.UNKNOWN = 0] = "UNKNOWN", aF[aF.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", aF[aF.TOO_MANY_ACCOUNTS_ON_EMAIL = 3] = "TOO_MANY_ACCOUNTS_ON_EMAIL", aF[aF.UPDATED_EMAIL_IS_EXISTING_EMAIL = 4] = "UPDATED_EMAIL_IS_EXISTING_EMAIL", aF[aF.TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL = 6] = "TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL", aF[aF.INVALID_EMAIL_ADDRESS = 9] = "INVALID_EMAIL_ADDRESS", aF),
                el = {
                    withCredentials: !0,
                    url: "".concat(ea, "/v1/email"),
                    timeout: 1e4
                },
                ec = {
                    withCredentials: !0,
                    url: "".concat(ea, "/v1/email"),
                    timeout: 1e4
                },
                es = function(t) {
                    return ee(z.httpService.post(el, {
                        emailAddress: t,
                        skipVerificationEmail: !0
                    }), eu)
                },
                ef = function(t) {
                    return ee(z.httpService.post(el, {
                        emailAddress: t,
                        skipVerificationEmail: !1
                    }), eu)
                },
                ed = function() {
                    return ee(z.httpService.get(ec), eu)
                },
                ep = null != (uy = F.EnvironmentUrls.gamesApi) ? uy : "URL_NOT_FOUND",
                ev = ((aV = {})[aV.UNKNOWN = 0] = "UNKNOWN", aV),
                eh = {
                    url: "".concat(ep, "/v1/games"),
                    timeout: 1e4
                },
                em = function(t) {
                    return ee(z.httpService.get(eh, {
                        universeIds: t
                    }), ev)
                },
                ey = ((az = {})[az.UNKNOWN = 0] = "UNKNOWN", az),
                eb = {
                    withCredentials: !0,
                    url: "/my/settings/json",
                    timeout: 1e4
                },
                eg = function() {
                    return ee(z.httpService.get(eb, {}), ey)
                },
                eS = null != (ub = F.EnvironmentUrls.apiGatewayUrl) ? ub : "URL_NOT_FOUND",
                ew = "".concat(eS, "/otp-service"),
                eO = ((aK = {})[aK.NO_ERROR = 0] = "NO_ERROR", aK[aK.UNKNOWN = 1] = "UNKNOWN", aK[aK.INVALID_CODE = 2] = "INVALID_CODE", aK[aK.INVALID_SESSION_TOKEN = 3] = "INVALID_SESSION_TOKEN", aK[aK.CODE_EXPIRED = 4] = "CODE_EXPIRED", aK[aK.UNVALIDATED_SESSION_TOKEN = 5] = "UNVALIDATED_SESSION_TOKEN", aK[aK.TOO_MANY_REQUESTS = 6] = "TOO_MANY_REQUESTS", aK[aK.CONTACT_MALFORMED = 7] = "CONTACT_MALFORMED", aK[aK.VPN_REQUIRED = 8] = "VPN_REQUIRED", aK[aK.UNAUTHENTICATED = 9] = "UNAUTHENTICATED", aK[aK.METHOD_UNAVAILABLE = 10] = "METHOD_UNAVAILABLE", aK),
                eE = {
                    withCredentials: !0,
                    url: "".concat(ew, "/v1/sendCodeForUser"),
                    timeout: 1e4
                },
                eN = {
                    withCredentials: !0,
                    url: "".concat(ew, "/v1/resendCode"),
                    timeout: 1e4
                },
                eA = {
                    withCredentials: !0,
                    url: "".concat(ew, "/v1/validateCode"),
                    timeout: 1e4
                },
                ex = {
                    withCredentials: !0,
                    url: "".concat(ew, "/v1/metadata"),
                    timeout: 1e4
                },
                eT = ((aB = {}).Reauth = "Reauth", aB.Challenge = "Challenge", aB),
                eC = ((aH = {}).Default = "Default", aH),
                e_ = function(t) {
                    return ee(z.httpService.post(eE, {
                        contactType: t,
                        origin: eT.Reauth,
                        messageVariant: eC.Default
                    }), eO)
                },
                eI = function(t, n) {
                    return ee(z.httpService.post(eN, {
                        contactType: t,
                        origin: eT.Reauth,
                        otpSessionToken: n
                    }), eO)
                },
                eD = function(t, n, r) {
                    return ee(z.httpService.post(eA, {
                        contactType: t,
                        origin: eT.Reauth,
                        passCode: r,
                        otpSessionToken: n
                    }), eO)
                },
                eL = function(t) {
                    return ee(z.httpService.get(ex, {
                        Origin: t
                    }), eO)
                },
                eR = null != (ug = F.EnvironmentUrls.authApi) ? ug : "URL_NOT_FOUND",
                eP = ((aY = {})[aY.FLOODED = 2] = "FLOODED", aY[aY.INVALID_PASSWORD = 7] = "INVALID_PASSWORD", aY[aY.INVALID_CURRENT_PASSWORD = 8] = "INVALID_CURRENT_PASSWORD", aY),
                ej = {
                    withCredentials: !0,
                    url: "".concat(eR, "/v2/user/passwords/change"),
                    timeout: 1e4
                },
                eU = ((aG = {})[aG.USER_DOES_NOT_HAVE_EMAIL = 22] = "USER_DOES_NOT_HAVE_EMAIL", aG),
                ek = {
                    withCredentials: !0,
                    url: "".concat(eR, "/v2/passwords/reset/send-prompted"),
                    timeout: 1e4
                },
                eM = ((aX = {})[aX.VALID_PASSWORD = 0] = "VALID_PASSWORD", aX[aX.WEAK_PASSWORD = 1] = "WEAK_PASSWORD", aX[aX.SHORT_PASSWORD = 2] = "SHORT_PASSWORD", aX[aX.PASSWORD_SAME_AS_USERNAME = 3] = "PASSWORD_SAME_AS_USERNAME", aX[aX.FORBIDDEN_PASSWORD = 4] = "FORBIDDEN_PASSWORD", aX[aX.DUMB_STRINGS = 5] = "DUMB_STRINGS", aX),
                eW = {
                    withCredentials: !0,
                    url: "".concat(eR, "/v2/passwords/validate"),
                    timeout: 1e4
                };

            function eF(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var eV = function(t, n) {
                    return ee(z.httpService.post(ej, {
                        currentPassword: t,
                        newPassword: n
                    }), eP)
                },
                ez = function() {
                    return ee(z.httpService.post(ek), eU)
                },
                eK = function(t, n) {
                    var r;
                    return (r = function() {
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, ee(z.httpService.post(eW, {
                                username: t,
                                password: n
                            }), null).then(function(t) {
                                return H(t, function(t) {
                                    return Z(eM, t.code)
                                })
                            })]
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(o, i) {
                            var a = r.apply(t, n);

                            function u(t) {
                                eF(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                eF(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                eB = "URL_NOT_FOUND",
                eH = null != (uS = F.EnvironmentUrls.accountInformationApi) ? uS : eB,
                eY = null != (uw = F.EnvironmentUrls.apiGatewayUrl) ? uw : eB,
                eG = ((aQ = {})[aQ.UNKNOWN = 0] = "UNKNOWN", aQ),
                eX = {
                    withCredentials: !0,
                    url: "".concat(eH, "/v1/phone"),
                    timeout: 1e4
                },
                eQ = {
                    withCredentials: !0,
                    url: "".concat(eH, "/v1/phone"),
                    timeout: 1e4
                },
                eq = {
                    withCredentials: !0,
                    url: "".concat(eH, "/v1/phone/verify"),
                    timeout: 1e4
                },
                e$ = {
                    withCredentials: !0,
                    url: "".concat(eH, "/v1/phone/resend"),
                    timeout: 1e4
                },
                eZ = ((aq = {})[aq.UNKNOWN = 0] = "UNKNOWN", aq[aq.INVALID = 2] = "INVALID", aq),
                eJ = ((a$ = {})[a$.UNKNOWN = 0] = "UNKNOWN", a$[a$.INVALID = 7] = "INVALID", a$),
                e0 = ((aZ = {})[aZ.UNKNOWN = 0] = "UNKNOWN", aZ),
                e1 = {
                    withCredentials: !0,
                    url: "".concat(eY, "/phone-number-api/v1/phone-prefix-list"),
                    timeout: 1e4
                };

            function e2(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function e4(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function u(t) {
                            e2(a, o, i, u, l, "next", t)
                        }

                        function l(t) {
                            e2(a, o, i, u, l, "throw", t)
                        }
                        u(void 0)
                    })
                }
            }

            function e3(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                    return this
                }), u;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                            switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        a.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && a.label < i[1]) {
                                        a.label = i[1], i = s;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(s);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            s = n.call(t, a)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var e5 = function() {
                    return e4(function() {
                        return e3(this, function(t) {
                            return [2, ee(z.httpService.get(eX, {}), eG)]
                        })
                    })()
                },
                e6 = function(t) {
                    var n = t.find(function(t) {
                            return t.isDefault
                        }),
                        r = t;
                    return void 0 !== n && (r = t.filter(function(t) {
                        return t.code !== n.code
                    })).unshift(n), r
                },
                e8 = function() {
                    return e4(function() {
                        return e3(this, function(t) {
                            return [2, ee(z.httpService.get(e1, {}), eG, e6)]
                        })
                    })()
                },
                e7 = function(t) {
                    return e4(function() {
                        return e3(this, function(n) {
                            return [2, ee(z.httpService.post(eQ, t), eZ)]
                        })
                    })()
                },
                e9 = function(t) {
                    return e4(function() {
                        return e3(this, function(n) {
                            return [2, ee(z.httpService.post(eq, t), eJ)]
                        })
                    })()
                },
                te = function(t) {
                    return e4(function() {
                        return e3(this, function(n) {
                            return [2, ee(z.httpService.post(e$, t), e0)]
                        })
                    })()
                },
                tt = null != (uO = F.EnvironmentUrls.authApi) ? uO : "URL_NOT_FOUND",
                tn = "palisades-live",
                tr = ((aJ = {})[aJ.UNKNOWN = 0] = "UNKNOWN", aJ),
                to = {
                    withCredentials: !0,
                    url: "".concat(tt, "/v1/").concat(tn, "/is-live"),
                    timeout: 1e4
                },
                ti = {
                    withCredentials: !0,
                    url: "".concat(tt, "/v1/").concat(tn, "/disconnect"),
                    timeout: 1e4
                },
                ta = function() {
                    return ee(z.httpService.get(to, {}), tr)
                },
                tu = function() {
                    return ee(z.httpService.post(ti, {}), tr)
                },
                tl = null != (uE = F.EnvironmentUrls.apiGatewayUrl) ? uE : "URL_NOT_FOUND",
                tc = "".concat(tl, "/account-security-service"),
                ts = ((a0 = {})[a0.UNKNOWN = 1] = "UNKNOWN", a0[a0.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", a0[a0.PROMPT_ASSIGNMENT_WAS_NOT_UPDATED = 3] = "PROMPT_ASSIGNMENT_WAS_NOT_UPDATED", a0[a0.UNKNOWN_PROMPT_TYPE = 4] = "UNKNOWN_PROMPT_TYPE", a0),
                tf = ((a1 = {}).TEXT_ONLY_BANNER = "DISPLAY_TYPE_TEXT_ONLY_BANNER", a1),
                td = ((a2 = {}).CHANGE_PASSWORD__SUSPECTED_COMPROMISE = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", a2.CHANGE_PASSWORD__BREACHED_CREDENTIAL = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", a2.AUTHENTICATOR_UPSELL = "PROMPT_TYPE_AUTHENTICATOR_UPSELL", a2.ACCOUNT_RESTORES_POLICY_UPDATE = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", a2.ACCOUNT_RESTORES_POLICY_UPDATE_V2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", a2.ACCOUNT_RESTORES_POLICY_UPDATE_V3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", a2.ACCOUNT_RESTORES_POLICY_UPSELL = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL", a2.BROADER_AUTHENTICATOR_UPSELL = "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL", a2.EMAIL_2SV_UPSELL = "PROMPT_TYPE_EMAIL_2SV_UPSELL", a2),
                tp = {
                    withCredentials: !0,
                    url: "".concat(tc, "/v1/prompt-assignments"),
                    timeout: 1e4
                },
                tv = {
                    withCredentials: !0,
                    url: "".concat(tc, "/v1/prompt-assignments"),
                    timeout: 1e4
                };

            function th(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var tm = function() {
                    var t;
                    return (t = function() {
                        var t;
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, ee(z.httpService.get(tp, {
                                        shouldReturnMetadata: !0
                                    }), ts)];
                                case 1:
                                    var r, o;
                                    if ((t = n.sent()).isError) return [2, t];
                                    return r = function(t) {
                                        for (var n = 1; n < arguments.length; n++) {
                                            var r = null != arguments[n] ? arguments[n] : {},
                                                o = Object.keys(r);
                                            "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                                return Object.getOwnPropertyDescriptor(r, t).enumerable
                                            }))), o.forEach(function(n) {
                                                var o;
                                                o = r[n], n in t ? Object.defineProperty(t, n, {
                                                    value: o,
                                                    enumerable: !0,
                                                    configurable: !0,
                                                    writable: !0
                                                }) : t[n] = o
                                            })
                                        }
                                        return t
                                    }({}, t), o = o = {
                                        value: t.value.filter(function(t) {
                                            return t.isGeneric ? Object.values(tf).includes(t.metadata.displayType) : Object.values(td).includes(t.promptType)
                                        })
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(o)) : (function(t, n) {
                                        var r = Object.keys(t);
                                        if (Object.getOwnPropertySymbols) {
                                            var o = Object.getOwnPropertySymbols(t);
                                            r.push.apply(r, o)
                                        }
                                        return r
                                    })(Object(o)).forEach(function(t) {
                                        Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(o, t))
                                    }), [2, t = r]
                            }
                        })
                    }, function() {
                        var n = this,
                            r = arguments;
                        return new Promise(function(o, i) {
                            var a = t.apply(n, r);

                            function u(t) {
                                th(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                th(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                ty = function(t, n) {
                    return ee(z.httpService.post(tv, {
                        action: t,
                        promptType: n
                    }), ts)
                },
                tb = null != (uN = F.EnvironmentUrls.apiGatewayUrl) ? uN : "URL_NOT_FOUND",
                tg = ((a4 = {})[a4.UNKNOWN = 0] = "UNKNOWN", a4[a4.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", a4[a4.INVALID_REQUEST = 2] = "INVALID_REQUEST", a4[a4.INVALID_SESSION = 3] = "INVALID_SESSION", a4),
                tS = {
                    withCredentials: !0,
                    url: "".concat("".concat(tb, "/proof-of-space"), "/v1/verify"),
                    timeout: 1e4
                };

            function tw(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var tO = function(t, n) {
                    var r;
                    return (r = function() {
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, ee(z.httpService.post(tS, {
                                challengeId: t,
                                solution: n
                            }), tg)]
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(o, i) {
                            var a = r.apply(t, n);

                            function u(t) {
                                tw(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                tw(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                tE = null != (uA = F.EnvironmentUrls.apiGatewayUrl) ? uA : "URL_NOT_FOUND",
                tN = "".concat(tE, "/proof-of-work-service"),
                tA = ((a3 = {})[a3.UNKNOWN = 0] = "UNKNOWN", a3[a3.REQUEST_INVALID = 1] = "REQUEST_INVALID", a3[a3.SESSION_INACTIVE = 2] = "SESSION_INACTIVE", a3),
                tx = {
                    withCredentials: !0,
                    url: "".concat(tN, "/v1/pow-puzzle"),
                    timeout: 1e4
                },
                tT = {
                    withCredentials: !0,
                    url: "".concat(tN, "/v1/pow-puzzle"),
                    timeout: 1e4
                };

            function tC(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var t_ = function(t) {
                    return ee(z.httpService.get(tx, {
                        sessionID: t
                    }), tA)
                },
                tI = function(t, n) {
                    var r;
                    return (r = function() {
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, ee(z.httpService.post(tT, {
                                sessionID: t,
                                solution: n
                            }), tA)]
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(o, i) {
                            var a = r.apply(t, n);

                            function u(t) {
                                tC(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                tC(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                tD = null != (ux = F.EnvironmentUrls.apiGatewayUrl) ? ux : "URL_NOT_FOUND",
                tL = ((a5 = {})[a5.UNKNOWN = 0] = "UNKNOWN", a5[a5.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", a5[a5.INVALID_REQUEST = 2] = "INVALID_REQUEST", a5[a5.INVALID_SESSION = 3] = "INVALID_SESSION", a5),
                tR = {
                    withCredentials: !0,
                    url: "".concat("".concat(tD, "/rostile"), "/v1/verify"),
                    timeout: 1e4
                };

            function tP(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var tj = function(t, n) {
                    var r;
                    return (r = function() {
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, ee(z.httpService.post(tR, {
                                challengeId: t,
                                solution: n
                            }), tL)]
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(o, i) {
                            var a = r.apply(t, n);

                            function u(t) {
                                tP(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                tP(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                tU = null != (uT = F.EnvironmentUrls.apiGatewayUrl) ? uT : "URL_NOT_FOUND",
                tk = "".concat(tU, "/account-security-service"),
                tM = ((a6 = {})[a6.UNKNOWN = 1] = "UNKNOWN", a6[a6.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", a6[a6.SECURITY_QUESTIONS_DISABLED = 3] = "SECURITY_QUESTIONS_DISABLED", a6[a6.SESSION_INACTIVE = 4] = "SESSION_INACTIVE", a6[a6.QUESTION_NOT_FOUND = 5] = "QUESTION_NOT_FOUND", a6[a6.ANSWER_WRONG_FORMAT = 6] = "ANSWER_WRONG_FORMAT", a6),
                tW = {
                    withCredentials: !0,
                    url: "".concat(tk, "/v1/security-question"),
                    timeout: 1e4
                },
                tF = {
                    withCredentials: !0,
                    url: "".concat(tk, "/v1/security-question"),
                    timeout: 1e4
                },
                tV = function(t, n) {
                    return ee(z.httpService.get(tW, {
                        userId: t,
                        sessionId: n
                    }), tM)
                },
                tz = function(t, n, r) {
                    return ee(z.httpService.post(tF, {
                        userId: t,
                        answer: n,
                        sessionId: r
                    }), tM)
                },
                tK = "URL_NOT_FOUND",
                tB = null != (uC = F.EnvironmentUrls.apiGatewayUrl) ? uC : tK,
                tH = null != (u_ = F.EnvironmentUrls.authApi) ? u_ : tK,
                tY = "".concat(tB, "/token-metadata-service"),
                tG = ((a8 = {})[a8.UNKNOWN = 1] = "UNKNOWN", a8[a8.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", a8[a8.ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN = 3] = "ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN", a8),
                tX = ((a7 = {})[a7.UNKNOWN = 1] = "UNKNOWN", a7),
                tQ = ((a9 = {}).UNKNOWN = "Unknown", a9.APP = "App", a9.BROWSER = "Browser", a9.STUDIO = "Studio", a9),
                tq = {
                    withCredentials: !0,
                    url: "".concat(tY, "/v1/sessions"),
                    timeout: 1e4
                },
                t$ = {
                    withCredentials: !0,
                    url: "".concat(tY, "/v1/logout"),
                    timeout: 1e4
                },
                tZ = {
                    withCredentials: !0,
                    url: "".concat(tH, "/v1/logoutfromallsessionsandreauthenticate"),
                    timeout: 1e4
                };

            function tJ(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function t0(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function u(t) {
                            tJ(a, o, i, u, l, "next", t)
                        }

                        function l(t) {
                            tJ(a, o, i, u, l, "throw", t)
                        }
                        u(void 0)
                    })
                }
            }

            function t1(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                    return this
                }), u;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                            switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        a.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && a.label < i[1]) {
                                        a.label = i[1], i = s;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(s);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            s = n.call(t, a)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var t2 = function(t, n) {
                    return t0(function() {
                        return t1(this, function(r) {
                            return [2, ee(z.httpService.get(tq, {
                                nextCursor: t,
                                desiredLimit: n
                            }), tG)]
                        })
                    })()
                },
                t4 = function(t) {
                    return t0(function() {
                        return t1(this, function(n) {
                            return [2, ee(z.httpService.post(t$, {
                                token: t
                            }), tG)]
                        })
                    })()
                },
                t3 = function(t) {
                    return t0(function() {
                        return t1(this, function(n) {
                            return [2, ee(z.httpService.post(tZ, {
                                secureAuthenticationIntent: t
                            }), tX)]
                        })
                    })()
                },
                t5 = null != (uI = F.EnvironmentUrls.thumbnailsApi) ? uI : "URL_NOT_FOUND",
                t6 = ((ue = {})[ue.UNKNOWN = 0] = "UNKNOWN", ue),
                t8 = {
                    url: "".concat(t5, "/v1/games/icons"),
                    timeout: 1e4
                },
                t7 = function(t, n, r, o) {
                    return ee(z.httpService.get(t8, {
                        universeIds: t,
                        size: n,
                        format: r,
                        isCircular: o
                    }), t6)
                },
                t9 = window.CoreRobloxUtilities,
                ne = "URL_NOT_FOUND",
                nt = null != (uD = F.EnvironmentUrls.twoStepVerificationApi) ? uD : ne,
                nn = null != (uL = F.EnvironmentUrls.economyApi) ? uL : ne,
                nr = null != (uR = F.EnvironmentUrls.tradesApi) ? uR : ne,
                no = ((ut = {})[ut.UNKNOWN = 0] = "UNKNOWN", ut[ut.INVALID_CHALLENGE_ID = 1] = "INVALID_CHALLENGE_ID", ut[ut.INVALID_USER_ID = 2] = "INVALID_USER_ID", ut[ut.INVALID_EMAIL = 3] = "INVALID_EMAIL", ut[ut.INVALID_PASSWORD = 4] = "INVALID_PASSWORD", ut[ut.TOO_MANY_REQUESTS = 5] = "TOO_MANY_REQUESTS", ut[ut.PIN_LOCKED = 6] = "PIN_LOCKED", ut[ut.FEATURE_DISABLED = 7] = "FEATURE_DISABLED", ut[ut.NOT_ALLOWED = 8] = "NOT_ALLOWED", ut[ut.INVALID_CONFIGURATION = 9] = "INVALID_CONFIGURATION", ut[ut.INVALID_CODE = 10] = "INVALID_CODE", ut[ut.CONFIGURATION_ALREADY_ENABLED = 11] = "CONFIGURATION_ALREADY_ENABLED", ut[ut.INVALID_SETUP_TOKEN = 12] = "INVALID_SETUP_TOKEN", ut[ut.REAUTHENTICATION_REQUIRED = 13] = "REAUTHENTICATION_REQUIRED", ut[ut.INVALID_PHONE_NUMBER = 15] = "INVALID_PHONE_NUMBER", ut[ut.EXCEEDED_REGISTERED_KEYS_LIMIT = 16] = "EXCEEDED_REGISTERED_KEYS_LIMIT", ut[ut.INVALID_CREDENTIAL_NICKNAME = 17] = "INVALID_CREDENTIAL_NICKNAME", ut[ut.AUTHENTICATOR_CODE_ALREADY_USED = 18] = "AUTHENTICATOR_CODE_ALREADY_USED", ut[ut.CHALLENGE_DENIED = 19] = "CHALLENGE_DENIED", ut[ut.CROSS_DEVICE_DIALOG_EXPIRED = 20] = "CROSS_DEVICE_DIALOG_EXPIRED", ut),
                ni = {
                    url: "".concat(nt, "/v1/metadata"),
                    withCredentials: !0,
                    timeout: 1e4
                },
                na = {
                    withCredentials: !0,
                    url: "".concat(nn, "/v2/spend-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                nu = {
                    withCredentials: !0,
                    url: "".concat(nr, "/v1/trade-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                nl = {
                    withCredentials: !0,
                    url: "".concat(nn, "/v2/resale-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                nc = {
                    withCredentials: !0,
                    url: "".concat(nn, "/v2/spend-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                ns = {
                    withCredentials: !0,
                    url: "".concat(nr, "/v1/trade-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                nf = {
                    withCredentials: !0,
                    url: "".concat(nn, "/v2/resale-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                nd = {
                    withCredentials: !0,
                    url: "".concat(nn, "/v2/spend-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                np = {
                    withCredentials: !0,
                    url: "".concat(nr, "/v1/trade-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                nv = {
                    withCredentials: !0,
                    url: "".concat(nn, "/v2/resale-friction/two-step-verification/redeem"),
                    timeout: 1e4
                };

            function nh(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function nm(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function u(t) {
                            nh(a, o, i, u, l, "next", t)
                        }

                        function l(t) {
                            nh(a, o, i, u, l, "throw", t)
                        }
                        u(void 0)
                    })
                }
            }

            function ny(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                    return this
                }), u;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                            switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        a.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && a.label < i[1]) {
                                        a.label = i[1], i = s;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(s);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            s = n.call(t, a)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nb = t9.cryptoUtil.generateSecureAuthIntentV2,
                ng = function(t) {
                    return ee(z.httpService.get(ni, t || {}), no)
                },
                nS = function(t, n) {
                    return ee(z.httpService.get({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration"),
                        timeout: 1e4
                    }, n || {}), no)
                },
                nw = function(t) {
                    return nm(function() {
                        var n, r, o;
                        return ny(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return n = z.httpService.post, r = [{
                                        withCredentials: !0,
                                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/email/enable"),
                                        timeout: 1e4
                                    }], o = {}, [4, nb()];
                                case 1:
                                    return [2, ee.apply(void 0, [n.apply(z.httpService, r.concat([(o.secureAuthenticationIntent = i.sent(), o)])), no])]
                            }
                        })
                    })()
                },
                nO = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/email/send-code"),
                        timeout: 1e4
                    }, n), no)
                },
                nE = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/email/verify"),
                        timeout: 1e4
                    }, n), no)
                },
                nN = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/email/disable"),
                        timeout: 1e4
                    }, {}), no)
                },
                nA = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/authenticator/enable"),
                        timeout: 1e4
                    }, {}), no)
                },
                nx = function(t, n, r) {
                    return nm(function() {
                        var o, i, a;
                        return ny(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    return o = z.httpService.post, i = [{
                                        withCredentials: !0,
                                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/authenticator/enable-verify"),
                                        timeout: 1e4
                                    }], a = {
                                        setupToken: n,
                                        code: r
                                    }, [4, nb()];
                                case 1:
                                    return [2, ee.apply(void 0, [o.apply(z.httpService, i.concat([(a.secureAuthenticationIntent = u.sent(), a)])), no])]
                            }
                        })
                    })()
                },
                nT = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/authenticator/verify"),
                        timeout: 1e4
                    }, n), no)
                },
                nC = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/authenticator/disable"),
                        timeout: 1e4
                    }, {}), no)
                },
                n_ = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/recovery-codes/verify"),
                        timeout: 1e4
                    }, n), no)
                },
                nI = function(t) {
                    return ee(z.httpService.get({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/recovery-codes"),
                        timeout: 1e4
                    }), no)
                },
                nD = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/recovery-codes/clear"),
                        timeout: 1e4
                    }, {}), no)
                },
                nL = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/recovery-codes/regenerate"),
                        timeout: 1e4
                    }, {
                        password: "password"
                    }), no)
                },
                nR = function(t) {
                    return nm(function() {
                        var n, r, o;
                        return ny(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return n = z.httpService.post, r = [{
                                        withCredentials: !0,
                                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/sms/enable"),
                                        timeout: 1e4
                                    }], o = {}, [4, nb()];
                                case 1:
                                    return [2, ee.apply(void 0, [n.apply(z.httpService, r.concat([(o.secureAuthenticationIntent = i.sent(), o)])), no])]
                            }
                        })
                    })()
                },
                nP = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/sms/send-code"),
                        timeout: 1e4
                    }, n), no)
                },
                nj = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/sms/verify"),
                        timeout: 1e4
                    }, n), no)
                },
                nU = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/sms/disable"),
                        timeout: 1e4
                    }, {}), no)
                },
                nk = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/security-key/enable"),
                        timeout: 1e4
                    }, {}), no, function(t) {
                        return {
                            creationOptions: JSON.parse(t.creationOptions),
                            sessionId: t.sessionId
                        }
                    })
                },
                nM = function(t, n, r, o) {
                    return nm(function() {
                        var i, a, u;
                        return ny(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return i = z.httpService.post, a = [{
                                        withCredentials: !0,
                                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/security-key/enable-verify"),
                                        timeout: 1e4
                                    }], u = {
                                        sessionId: n,
                                        credentialNickname: r,
                                        attestationResponse: o
                                    }, [4, nb()];
                                case 1:
                                    return [2, ee.apply(void 0, [i.apply(z.httpService, a.concat([(u.secureAuthenticationIntent = l.sent(), u)])), no])]
                            }
                        })
                    })()
                },
                nW = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/security-key/verify-start"),
                        timeout: 1e4
                    }, n), no)
                },
                nF = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/security-key/verify-finish"),
                        timeout: 1e4
                    }, n), no)
                },
                nV = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/security-key/disable"),
                        timeout: 1e4
                    }, {
                        credentialNicknames: n
                    }), no)
                },
                nz = function(t) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/configuration/security-key/list"),
                        timeout: 1e4
                    }, {}), no)
                },
                nK = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/passkey/verify-start"),
                        timeout: 1e4
                    }, n), no)
                },
                nB = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/passkey/verify-finish"),
                        timeout: 1e4
                    }, n), no)
                },
                nH = function() {
                    return ee(z.httpService.get(na, {}), no)
                },
                nY = function() {
                    return ee(z.httpService.get(nu, {}), no)
                },
                nG = function() {
                    return ee(z.httpService.get(nl, {}), no)
                },
                nX = function() {
                    return ee(z.httpService.post(nc, {}), no)
                },
                nQ = function() {
                    return ee(z.httpService.post(ns, {}), no)
                },
                nq = function() {
                    return ee(z.httpService.post(nf, {}), no)
                },
                n$ = function(t, n) {
                    return ee(z.httpService.post(nd, {
                        challengeToken: t,
                        verificationToken: n
                    }), no)
                },
                nZ = function(t, n) {
                    return ee(z.httpService.post(np, {
                        challengeToken: t,
                        verificationToken: n
                    }), no)
                },
                nJ = function(t, n) {
                    return ee(z.httpService.post(nv, {
                        challengeToken: t,
                        verificationToken: n
                    }), no)
                },
                n0 = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/cross-device/retry"),
                        timeout: 1e4
                    }, n), no)
                },
                n1 = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/cross-device/verify"),
                        timeout: 1e4
                    }, n), no)
                },
                n2 = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/cross-device/retract"),
                        timeout: 1e4
                    }, n), no)
                },
                n4 = function(t, n) {
                    return ee(z.httpService.post({
                        withCredentials: !0,
                        url: "".concat(nt, "/v1/users/").concat(t, "/challenges/password/verify"),
                        timeout: 1e4
                    }, n), no)
                },
                n3 = ((un = {})[un.INTERNAL_ERROR = 9] = "INTERNAL_ERROR", un);

            function n5(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var n6 = function() {
                    var t;
                    return (t = function() {
                        var t;
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), [4, F.Guac.callBehaviour("account-settings-ui")];
                                case 1:
                                    return [2, {
                                        isError: !1,
                                        value: n.sent()
                                    }];
                                case 2:
                                    return t = n.sent(), [2, {
                                        isError: !0,
                                        error: n3.INTERNAL_ERROR,
                                        errorRaw: t,
                                        errorStatusCode: null
                                    }];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var n = this,
                            r = arguments;
                        return new Promise(function(o, i) {
                            var a = t.apply(n, r);

                            function u(t) {
                                n5(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                n5(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                n8 = null != (uP = F.EnvironmentUrls.authApi) ? uP : "URL_NOT_FOUND",
                n7 = ((ur = {})[ur.UNKNOWN = 0] = "UNKNOWN", ur),
                n9 = {
                    withCredentials: !0,
                    url: "".concat(n8, "/v1/xbox/connection"),
                    timeout: 1e4
                },
                re = {
                    withCredentials: !0,
                    url: "".concat(n8, "/v1/xbox/disconnect"),
                    timeout: 1e4
                },
                rt = function() {
                    return ee(z.httpService.get(n9, {}), n7)
                },
                rn = function() {
                    return ee(z.httpService.post(re, {}), n7)
                },
                rr = null != (uj = F.EnvironmentUrls.apiGatewayUrl) ? uj : "URL_NOT_FOUND",
                ro = ((uo = {})[uo.UNKNOWN = 1] = "UNKNOWN", uo[uo.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", uo[uo.INVAID_METRIC_NAME = 3] = "INVAID_METRIC_NAME", uo[uo.INVALID_METRIC_LABELS = 4] = "INVALID_METRIC_LABELS", uo),
                ri = {
                    withCredentials: !0,
                    url: "".concat("".concat(rr, "/account-security-service"), "/v1/metrics/record"),
                    timeout: 1e4
                },
                ra = function(t) {
                    return ee(z.httpService.post(ri, t), ro)
                },
                ru = null != (uU = F.EnvironmentUrls.apiGatewayUrl) ? uU : "URL_NOT_FOUND",
                rl = ((ui = {})[ui.UNKNOWN = 0] = "UNKNOWN", ui),
                rc = {
                    withCredentials: !0,
                    url: "".concat("".concat(ru, "/private-access-token"), "/v1/getPATToken"),
                    timeout: 1e4
                };

            function rs(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var rf = function(t) {
                    var n;
                    return (n = function() {
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, ee(z.httpService.post(rc, {
                                challengeId: t
                            }), rl)]
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(o, i) {
                            var a = n.apply(t, r);

                            function u(t) {
                                rs(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                rs(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                rd = null != (uk = F.EnvironmentUrls.apiGatewayUrl) ? uk : "URL_NOT_FOUND",
                rp = ((ua = {})[ua.UNKNOWN = 1] = "UNKNOWN", ua),
                rv = {
                    withCredentials: !0,
                    url: "".concat("".concat(rd, "/challenge"), "/v1/continue"),
                    timeout: 1e4
                };

            function rh(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var rm = function(t, n, r) {
                    var o;
                    return (o = function() {
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(o) {
                            return [2, ee(z.httpService.post(rv, {
                                challengeId: t,
                                challengeType: n,
                                challengeMetadata: r
                            }), rp)]
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, i) {
                            var a = o.apply(t, n);

                            function u(t) {
                                rh(a, r, i, u, l, "next", t)
                            }

                            function l(t) {
                                rh(a, r, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                ry = null != (uM = F.EnvironmentUrls.authApi) ? uM : "URL_NOT_FOUND",
                rb = ((uu = {})[uu.UNKNOWN = 0] = "UNKNOWN", uu[uu.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", uu[uu.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", uu[uu.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", uu),
                rg = ((ul = {})[ul.UNKNOWN = 0] = "UNKNOWN", ul[ul.FEATURE_DISABLED = 1] = "FEATURE_DISABLED", ul[ul.FLOODED = 2] = "FLOODED", ul[ul.INVALID_PASSWORD = 20] = "INVALID_PASSWORD", ul[ul.PASSWORDS_DO_NOT_MATCH = 21] = "PASSWORDS_DO_NOT_MATCH", ul[ul.TWO_STEP_VERIFICATION_REQUIRED = 24] = "TWO_STEP_VERIFICATION_REQUIRED", ul),
                rS = {
                    withCredentials: !0,
                    url: "".concat(ry, "/v1/passkey/ListCredentials"),
                    timeout: 1e4
                },
                rw = {
                    withCredentials: !0,
                    url: "".concat(ry, "/v2/passwords/reset"),
                    timeout: 1e4
                },
                rO = {
                    withCredentials: !0,
                    url: "".concat(ry, "/v1/revert/invalidate-tickets"),
                    timeout: 1e4
                },
                rE = window.Roblox["core-scripts"].http.http,
                rN = function(t) {
                    return {
                        isError: !1,
                        value: t
                    }
                },
                rA = function(t, n) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: t,
                        errorRaw: n,
                        errorStatusCode: r
                    }
                };

            function rx(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function rT(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }
            var rC = function(t) {
                    var n;
                    return (void 0 === t ? "undefined" : rT(t)) === "object" && null !== t && "data" in t && null != (n = (0, rE.getApiErrorCodes)(t.data)[0]) ? n : null
                },
                r_ = function(t) {
                    if ((void 0 === t ? "undefined" : rT(t)) !== "object" || null === t || !("status" in t)) return null;
                    var n, r = null != (n = t.status) ? n : null;
                    return "number" != typeof r ? null : r
                },
                rI = function(t, n, r) {
                    var o;
                    return (o = function() {
                        var o, i, a, u;
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return l.trys.push([0, 2, , 3]), [4, t];
                                case 1:
                                    if (o = l.sent(), void 0 !== r) return [2, rN(r(o.data))];
                                    return [2, rN(o.data)];
                                case 2:
                                    return a = rC(i = l.sent()), u = r_(i), [2, rA(null == n ? null : Object.values(n).includes(a) ? a : null, i, u)];
                                case 3:
                                    return [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, i) {
                            var a = o.apply(t, n);

                            function u(t) {
                                rx(a, r, i, u, l, "next", t)
                            }

                            function l(t) {
                                rx(a, r, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                },
                rD = window.Roblox["core-scripts"].environmentUrls,
                rL = r.n(rD)().authApi,
                rR = ((uc = {})[uc.UNKNOWN = 0] = "UNKNOWN", uc[uc.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", uc[uc.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", uc[uc.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", uc),
                rP = {
                    withCredentials: !0,
                    url: "".concat(rL, "/v1/passkey/StartRegistration"),
                    timeout: 1e4
                },
                rj = {
                    withCredentials: !0,
                    url: "".concat(rL, "/v1/passkey/start-preauth-registration"),
                    timeout: 1e4
                },
                rU = {
                    withCredentials: !0,
                    url: "".concat(rL, "/v1/passkey/FinishRegistration"),
                    timeout: 1e4
                },
                rk = {
                    withCredentials: !0,
                    url: "".concat(rL, "/v1/passkey/finish-ar-preauth-registration"),
                    timeout: 1e4
                },
                rM = {
                    withCredentials: !0,
                    url: "".concat(rL, "/v1/passkey/DeleteCredentialBatch"),
                    timeout: 1e4
                },
                rW = function() {
                    return rI((0, rE.post)(rP, {}), rR, function(t) {
                        return {
                            creationOptions: JSON.parse(t.creationOptions),
                            sessionId: t.sessionId
                        }
                    })
                },
                rF = function(t) {
                    return rI((0, rE.post)(rj, {
                        username: t
                    }), rR, function(t) {
                        return {
                            creationOptions: JSON.parse(t.creationOptions),
                            sessionId: t.sessionId
                        }
                    })
                },
                rV = function(t, n, r) {
                    return rI((0, rE.post)(rU, {
                        sessionId: t,
                        credentialNickname: n,
                        attestationResponse: r
                    }), rR)
                },
                rz = function(t, n, r, o, i) {
                    return rI((0, rE.post)(rk, {
                        recoverySession: t,
                        passkeySessionId: r,
                        passkeyRegistrationResponse: o,
                        userId: n,
                        isPostRecovery: i
                    }), rR)
                },
                rK = function(t, n) {
                    return rI((0, rE.post)(rM, {
                        credentialNicknames: t,
                        passkeyCount: n
                    }), rR)
                },
                rB = function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                        all: !0
                    };
                    return ee(z.httpService.post(rS, t), rb)
                },
                rH = function(t, n, r, o, i, a, u, l, c, s, f, d) {
                    return ee(z.httpService.post(rw, {
                        targetType: t,
                        ticket: n,
                        userId: r,
                        password: o,
                        passwordRepeated: i,
                        twoStepVerificationChallengeId: a,
                        twoStepVerificationToken: u,
                        accountBlob: l,
                        secureAuthenticationIntent: c,
                        passkeySessionId: s,
                        passkeyRegistrationResponse: f,
                        newEmail: d
                    }), rg)
                },
                rY = function() {
                    return ee(z.httpService.post(rO, {}), rb)
                },
                rG = ((us = {})[us.UNKNOWN = 0] = "UNKNOWN", us[us.CANCELLATION_ERROR = 1] = "CANCELLATION_ERROR", us[us.INTERRUPTED_ERROR = 2] = "INTERRUPTED_ERROR", us[us.INVALID_REQUEST = 3] = "INVALID_REQUEST", us[us.JSON_EXCEPTION = 4] = "JSON_EXCEPTION", us[us.CREDENTIALS_PROTOCOL_NOT_SUPPORTED = 5] = "CREDENTIALS_PROTOCOL_NOT_SUPPORTED", us[us.NO_CREDENTIALS_FOUND = 6] = "NO_CREDENTIALS_FOUND", us[us.INVALID_STATE_ERROR = 11] = "INVALID_STATE_ERROR", us),
                rX = function(t) {
                    return t.code
                },
                rQ = function(t, n, r) {
                    return et(t9.hybridResponseService.getNativeResponse(t, n, r), rG, rX, function(t) {
                        if (null === t) return null;
                        var n = JSON.parse(t);
                        if (void 0 !== n.errorCode) throw {
                            name: "getNativeResponse Error",
                            message: n.errorMsg,
                            code: n.errorCode
                        };
                        return F.DeviceMeta && (0, F.DeviceMeta)().isInApp && (0, F.DeviceMeta)().isAndroidApp ? t : t9.fido2Util.formatCredentialAuthenticationResponseApp(t)
                    })
                },
                rq = function(t) {
                    return et(navigator.credentials.get(t), rG).then(function(t) {
                        return H(t, function(t) {
                            return null === t ? null : t9.fido2Util.formatCredentialAuthenticationResponseWeb(t)
                        })
                    })
                },
                r$ = null != (uW = F.EnvironmentUrls.apiGatewayUrl) ? uW : "URL_NOT_FOUND",
                rZ = "".concat(r$, "/account-recovery-service"),
                rJ = ((uf = {})[uf.UNKNOWN = 1] = "UNKNOWN", uf[uf.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", uf[uf.IDENTIFIER_INVALID = 3] = "IDENTIFIER_INVALID", uf[uf.TOO_MANY_REQUESTS = 4] = "TOO_MANY_REQUESTS", uf[uf.ACCOUNT_NOT_VERIFIED = 5] = "ACCOUNT_NOT_VERIFIED", uf[uf.INVALID_CODE = 6] = "INVALID_CODE", uf[uf.INVALID_USER = 7] = "INVALID_USER", uf[uf.TWO_STEP_VERIFICATION_REQUIRED = 8] = "TWO_STEP_VERIFICATION_REQUIRED", uf[uf.TRY_A_DIFFERENT_CONTACT_METHOD = 9] = "TRY_A_DIFFERENT_CONTACT_METHOD", uf),
                r0 = {
                    withCredentials: !0,
                    url: "".concat(rZ, "/v1/request-recovery"),
                    timeout: 1e4
                },
                r1 = {
                    withCredentials: !0,
                    url: "".concat(rZ, "/v1/send-code"),
                    timeout: 1e4
                },
                r2 = {
                    withCredentials: !0,
                    url: "".concat(rZ, "/v1/resend-code"),
                    timeout: 1e4
                },
                r4 = {
                    withCredentials: !0,
                    url: "".concat(rZ, "/v1/verify-code"),
                    timeout: 1e4
                },
                r3 = {
                    withCredentials: !0,
                    url: "".concat(rZ, "/v1/continue-recovery"),
                    timeout: 1e4
                },
                r5 = {
                    url: "".concat(rZ, "/v1/recovery-session-metadata"),
                    timeout: 1e4
                },
                r6 = {
                    url: "".concat(rZ, "/v1/set-email"),
                    timeout: 1e4
                },
                r8 = {
                    withCredentials: !0,
                    url: "".concat(rZ, "/v1/get-current-two-step-method"),
                    timeout: 1e4
                },
                r7 = {
                    withCredentials: !0,
                    url: "".concat(rZ, "/v1/disable-two-step-method"),
                    timeout: 1e4
                },
                r9 = function(t, n, r, o) {
                    return ee(z.httpService.post(r0, {
                        identifier: t,
                        identifierType: n,
                        recoverySessionId: o,
                        requestedRecoveryTypes: r
                    }), rJ)
                },
                oe = function(t, n, r, o) {
                    return ee(z.httpService.post(r1, {
                        contactMethod: t,
                        contactMethodType: n,
                        recoverySessionId: r,
                        contactMethodNumber: o
                    }), rJ)
                },
                ot = function(t, n) {
                    return ee(z.httpService.post(r2, {
                        recoverySessionId: t,
                        contactMethodNumber: n
                    }), rJ)
                },
                on = function(t, n, r) {
                    return ee(z.httpService.post(r4, {
                        recoverySessionId: t,
                        code: n,
                        contactMethodNumber: r
                    }), rJ)
                },
                or = function(t, n, r, o, i) {
                    return ee(z.httpService.post(r3, {
                        recoverySessionId: t,
                        userId: n,
                        recover2sv: r,
                        twoStepVerificationToken: o,
                        twoStepVerificationChallengeId: i
                    }), rJ)
                },
                oo = function(t) {
                    return ee(z.httpService.post(r5, {
                        recoverySessionId: t
                    }), rJ)
                },
                oi = function(t) {
                    return ee(z.httpService.post(r6, {
                        recoverySessionId: t
                    }), rJ)
                },
                oa = function(t) {
                    return ee(z.httpService.get(r8, {
                        recoverySessionId: t
                    }), rJ)
                },
                ou = function(t, n) {
                    return ee(z.httpService.post(r7, {
                        recoverySessionId: t,
                        twoStepMethod: n
                    }), rJ)
                },
                ol = {
                    url: "/my/settings/json",
                    withCredentials: !0
                },
                oc = ((ud = {})[ud.UNKNOWN = 0] = "UNKNOWN", ud),
                os = function() {
                    return ee(z.httpService.get(ol), oc)
                },
                of = ((up = {})[up.UNKNOWN = 0] = "UNKNOWN", up[up.FLAG_OFF = 1] = "FLAG_OFF", up),
                od = {
                    withCredentials: !0,
                    url: "".concat(null === F.EnvironmentUrls || void 0 === F.EnvironmentUrls ? void 0 : F.EnvironmentUrls.userSettingsApi, "/v1/user-settings"),
                    timeout: 1e4
                },
                op = function() {
                    return ee(z.httpService.get(od), of)
                },
                ov = function(t, n) {
                    return !1 === n ? Promise.resolve(B(of.FLAG_OFF, null, null)) : ee(z.httpService.post(od, {
                        eppEnrollmentStatus: t
                    }), of)
                },
                oh = null != (uF = F.EnvironmentUrls.usersApi) ? uF : "URL_NOT_FOUND",
                om = ((uv = {})[uv.UNKNOWN = 0] = "UNKNOWN", uv),
                oy = {
                    withCredentials: !0,
                    url: "".concat(oh, "/v1/usernames/users"),
                    timeout: 1e4
                },
                ob = function(t) {
                    return ee(z.httpService.get({
                        withCredentials: !0,
                        url: "".concat(oh, "/v1/users/").concat(t),
                        timeout: 1e4
                    }), om)
                },
                og = function(t) {
                    return ee(z.httpService.post(oy, {
                        usernames: [t],
                        excludeBannedUsers: !0
                    }), om)
                };

            function oS(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }
            r(773);
            var ow = window.TanstackQuery,
                oO = window.ReactUtilities,
                oE = "sessionManagementEvent",
                oN = "signedOutOfAllSessions",
                oA = "signedOutOfSession",
                ox = "openedSessionDetails",
                oT = function() {
                    return (oT = Object.assign || function(t) {
                        for (var n, r = 1, o = arguments.length; r < o; r++)
                            for (var i in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, i) && (t[i] = n[i]);
                        return t
                    }).apply(this, arguments)
                };

            function oC(t, n) {
                var r = {};
                for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && 0 > n.indexOf(o) && (r[o] = t[o]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var i = 0;
                    for (o = Object.getOwnPropertySymbols(t); i < o.length; i++) 0 > n.indexOf(o[i]) && Object.prototype.propertyIsEnumerable.call(t, o[i]) && (r[o[i]] = t[o[i]])
                }
                return r
            }
            var o_ = function() {
                    for (var t, n, r = 0, o = "", i = arguments.length; r < i; r++)(t = arguments[r]) && (n = function t(n) {
                        var r, o, i = "";
                        if ("string" == typeof n || "number" == typeof n) i += n;
                        else if ("object" == (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n))
                            if (Array.isArray(n)) {
                                var a = n.length;
                                for (r = 0; r < a; r++) n[r] && (o = t(n[r])) && (i && (i += " "), i += o)
                            } else
                                for (o in n) n[o] && (i && (i += " "), i += o);
                        return i
                    }(t)) && (o && (o += " "), o += n);
                    return o
                },
                oI = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                oD = function() {
                    return k().createElement("div", {
                        role: "presentation",
                        className: "absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none"
                    })
                };

            function oL(t, n) {
                void 0 === n && (n = {});
                var r = n.insertAt;
                if (t && "undefined" != typeof document) {
                    var o = document.head || document.getElementsByTagName("head")[0],
                        i = document.createElement("style");
                    i.type = "text/css", "top" === r && o.firstChild ? o.insertBefore(i, o.firstChild) : o.appendChild(i), i.styleSheet ? i.styleSheet.cssText = t : i.appendChild(document.createTextNode(t))
                }
            }
            oL(".foundation-web-list-item-bottom-divider,.foundation-web-list-item-inset-divider{border-bottom:1px solid var(--color-stroke-default)}.foundation-web-list-item-inset-divider{bottom:0;height:1px;position:absolute;width:100%}.foundation-web-list-item:focus-visible{outline-offset:calc(var(--stroke-thicker)*-1)}.foundation-web-list{list-style:none;margin:0;padding:0}");
            var oR = (0, U.createContext)(null),
                oP = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-medium"
                },
                oj = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                oU = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ok = (0, U.forwardRef)(function(t, n) {
                    var r = t.isContained,
                        o = t.size,
                        i = t.divider,
                        a = t.alignment,
                        u = t.title,
                        l = t.isTitleBold,
                        c = t.text,
                        s = t.isMultiline,
                        f = t.metadata,
                        d = t.description,
                        p = t.leading,
                        v = t.trailing,
                        h = t.onSelect,
                        m = t.className,
                        y = void 0 === f && void 0 === d && void 0 === a && void 0 === o;
                    if ((void 0 !== c || void 0 !== s) && !y) throw Error('ListItem: Cannot use deprecated "text" or "isMultiline" props with "metadata", "description", "alignment", or "size".');
                    var b = null != o ? o : "Large",
                        g = void 0 !== h,
                        S = g ? "button" : "div",
                        w = !!y && s,
                        O = "Top" === a ? "justify-start" : "justify-center";
                    w && (O = "justify-start");
                    var E = k().createElement(S, Object.assign({
                            className: o_("bg-none width-full flex gap-medium stroke-none foundation-web-list-item padding-y-none", r ? "padding-x-medium" : "padding-x-xlarge", "Full" === i && "foundation-web-list-item-bottom-divider", g && oI, g && "cursor-pointer", m)
                        }, g && {
                            onClick: function() {
                                return h()
                            }
                        }), g && k().createElement(oD, null), p && k().createElement("div", {
                            className: o_("flex flex-col padding-y-large", O)
                        }, p), k().createElement("div", {
                            className: "flex fill clip-x padding-y-large gap-x-medium relative "
                        }, k().createElement("div", {
                            className: o_("flex flex-col fill clip-x justify-center", w && "gap-xsmall")
                        }, u && k().createElement("div", {
                            className: o_("content-emphasis text-align-x-start", void 0 === l || l ? oj[b] : oU[b])
                        }, u), y && c && k().createElement("div", {
                            className: o_("content-default text-align-x-start", oP[b], !s && "text-truncate-split text-no-wrap")
                        }, c), !y && f && k().createElement("div", {
                            className: o_("content-default text-align-x-start text-truncate-split text-no-wrap", oP[b])
                        }, f), !y && d && k().createElement("div", {
                            className: o_("content-default text-align-x-start padding-top-xsmall", oP[b])
                        }, d)), v && k().createElement("div", {
                            className: o_("flex flex-col", O)
                        }, v), "Inset" === i && k().createElement("div", {
                            className: "foundation-web-list-item-inset-divider"
                        }))),
                        N = (0, U.useMemo)(function() {
                            return {
                                size: b
                            }
                        }, [b]);
                    return k().createElement("li", {
                        ref: n,
                        style: {
                            listStyle: "none"
                        }
                    }, k().createElement(oR.Provider, {
                        value: N
                    }, E))
                });
            ok.displayName = "ListItem";
            var oM = (0, U.forwardRef)(function(t, n) {
                var r = t.children,
                    o = t.className,
                    i = t.as,
                    a = oC(t, ["children", "className", "as"]);
                return k().createElement(void 0 === i ? "ul" : i, Object.assign({
                    ref: n,
                    className: o_("foundation-web-list", o)
                }, a), r)
            });

            function oW(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function oF(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function oV(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        oF(t, n, r[n])
                    })
                }
                return t
            }

            function oz(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || oB(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oK(t) {
                return function(t) {
                    if (Array.isArray(t)) return oW(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || oB(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oB(t, n) {
                if (t) {
                    if ("string" == typeof t) return oW(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oW(t, n)
                }
            }

            function oH(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function oY() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = oH(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : oH(n[t], null)
                        }
                    }
                }
            }

            function oG() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return U.useCallback(oY.apply(void 0, oK(n)), n)
            }

            function oX(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    o = function() {
                        var n = r.map(function(t) {
                            return U.createContext(t)
                        });
                        return function(r) {
                            var o = (null == r ? void 0 : r[t]) || n;
                            return U.useMemo(function() {
                                var n, i;
                                return oF({}, "__scope".concat(t), (n = oV({}, r), i = null != (i = oF({}, t, o)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(t, n) {
                                    var r = Object.keys(t);
                                    if (Object.getOwnPropertySymbols) {
                                        var o = Object.getOwnPropertySymbols(t);
                                        r.push.apply(r, o)
                                    }
                                    return r
                                })(Object(i)).forEach(function(t) {
                                    Object.defineProperty(n, t, Object.getOwnPropertyDescriptor(i, t))
                                }), n))
                            }, [r, o])
                        }
                    };
                return o.scopeName = t, [function(n, o) {
                    var i = U.createContext(o),
                        a = r.length;
                    r = oK(r).concat([o]);
                    var u = function(n) {
                        var r, o = n.scope,
                            u = n.children,
                            l = function(t, n) {
                                if (null == t) return {};
                                var r, o, i = function(t, n) {
                                    if (null == t) return {};
                                    var r, o, i = {},
                                        a = Object.keys(t);
                                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                                    return i
                                }(t, n);
                                if (Object.getOwnPropertySymbols) {
                                    var a = Object.getOwnPropertySymbols(t);
                                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                                }
                                return i
                            }(n, ["scope", "children"]),
                            c = (null == o || null == (r = o[t]) ? void 0 : r[a]) || i,
                            s = U.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, j.jsx)(c.Provider, {
                            value: s,
                            children: u
                        })
                    };
                    return u.displayName = n + "Provider", [u, function(r, u) {
                        var l, c = (null == u || null == (l = u[t]) ? void 0 : l[a]) || i,
                            s = U.useContext(c);
                        if (s) return s;
                        if (void 0 !== o) return o;
                        throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                    }]
                }, oQ.apply(void 0, [o].concat(oK(n)))]
            }

            function oQ() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var i = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                i = r.scopeName;
                            return oV({}, t, o(n)["__scope".concat(i)])
                        }, {});
                        return U.useMemo(function() {
                            return oF({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function oq(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    i = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === i || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function o$(t) {
                var n = U.useRef(t);
                return U.useEffect(function() {
                    n.current = t
                }), U.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(oK(o)))
                    }
                }, [])
            }
            oM.displayName = "List";
            var oZ = (null == (uV = globalThis) ? void 0 : uV.document) ? U.useLayoutEffect : function() {},
                oJ = function(t) {
                    var n, r, o, i, a, u, l, c, s, f, d, p, v, h, m = t.present,
                        y = t.children,
                        b = (i = (o = oz(U.useState(), 2))[0], a = o[1], u = U.useRef({}), l = U.useRef(m), c = U.useRef("none"), f = (s = oz((n = m ? "mounted" : "unmounted", r = {
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
                        }, U.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], d = s[1], U.useEffect(function() {
                            var t = o0(u.current);
                            c.current = "mounted" === f ? t : "none"
                        }, [f]), oZ(function() {
                            var t = u.current,
                                n = l.current;
                            if (n !== m) {
                                var r = c.current,
                                    o = o0(t);
                                m ? d("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), l.current = m
                            }
                        }, [m, d]), oZ(function() {
                            if (i) {
                                var t, n, r = null != (n = i.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = o0(u.current).includes(n.animationName);
                                        if (n.target === i && o && (d("ANIMATION_END"), !l.current)) {
                                            var a = i.style.animationFillMode;
                                            i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                            })
                                        }
                                    },
                                    a = function(t) {
                                        t.target === i && (c.current = o0(u.current))
                                    };
                                return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", o), i.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", o), i.removeEventListener("animationend", o)
                                    }
                            }
                            d("ANIMATION_END")
                        }, [i, d]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(f),
                            ref: U.useCallback(function(t) {
                                t && (u.current = getComputedStyle(t)), a(t)
                            }, [])
                        }),
                        g = "function" == typeof y ? y({
                            present: b.isPresent
                        }) : U.Children.only(y),
                        S = oG(b.ref, (h = null == (p = Object.getOwnPropertyDescriptor(g.props, "ref")) ? void 0 : p.get) && "isReactWarning" in h && h.isReactWarning ? g.ref : (h = null == (v = Object.getOwnPropertyDescriptor(g, "ref")) ? void 0 : v.get) && "isReactWarning" in h && h.isReactWarning ? g.props.ref : g.props.ref || g.ref);
                    return "function" == typeof y || b.isPresent ? U.cloneElement(g, {
                        ref: S
                    }) : null
                };

            function o0(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function o1(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function o2(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function o4(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function u(t) {
                            o2(a, o, i, u, l, "next", t)
                        }

                        function l(t) {
                            o2(a, o, i, u, l, "throw", t)
                        }
                        u(void 0)
                    })
                }
            }

            function o3(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function o5(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function o6(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        o3(t, n, r[n])
                    })
                }
                return t
            }

            function o8(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function o7(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function o9(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || ir(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ie(t) {
                return function(t) {
                    if (Array.isArray(t)) return o1(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || ir(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function it(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function ir(t, n) {
                if (t) {
                    if ("string" == typeof t) return o1(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o1(t, n)
                }
            }

            function io(t, n) {
                var r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                    return this
                }), u;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                            if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                            switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        a.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && a.label < i[1]) {
                                        a.label = i[1], i = s;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(s);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            s = n.call(t, a)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            oJ.displayName = "Presence";
            var ii = ["top", "right", "bottom", "left"],
                ia = Math.min,
                iu = Math.max,
                il = Math.round,
                ic = Math.floor,
                is = function(t) {
                    return {
                        x: t,
                        y: t
                    }
                },
                id = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                ip = {
                    start: "end",
                    end: "start"
                };

            function iv(t, n) {
                return "function" == typeof t ? t(n) : t
            }

            function ih(t) {
                return t.split("-")[0]
            }

            function im(t) {
                return t.split("-")[1]
            }

            function iy(t) {
                return "x" === t ? "y" : "x"
            }

            function ib(t) {
                return "y" === t ? "height" : "width"
            }
            var ig = new Set(["top", "bottom"]);

            function iS(t) {
                return ig.has(ih(t)) ? "y" : "x"
            }

            function iw(t) {
                return t.replace(/start|end/g, function(t) {
                    return ip[t]
                })
            }
            var iO = ["left", "right"],
                iE = ["right", "left"],
                iN = ["top", "bottom"],
                iA = ["bottom", "top"];

            function ix(t) {
                return t.replace(/left|right|bottom|top/g, function(t) {
                    return id[t]
                })
            }

            function iT(t) {
                return "number" != typeof t ? o6({
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                }, t) : {
                    top: t,
                    right: t,
                    bottom: t,
                    left: t
                }
            }

            function iC(t) {
                var n = t.x,
                    r = t.y,
                    o = t.width,
                    i = t.height;
                return {
                    width: o,
                    height: i,
                    top: r,
                    left: n,
                    right: n + o,
                    bottom: r + i,
                    x: n,
                    y: r
                }
            }

            function i_(t, n, r) {
                var o, i = t.reference,
                    a = t.floating,
                    u = iS(n),
                    l = iy(iS(n)),
                    c = ib(l),
                    s = ih(n),
                    f = "y" === u,
                    d = i.x + i.width / 2 - a.width / 2,
                    p = i.y + i.height / 2 - a.height / 2,
                    v = i[c] / 2 - a[c] / 2;
                switch (s) {
                    case "top":
                        o = {
                            x: d,
                            y: i.y - a.height
                        };
                        break;
                    case "bottom":
                        o = {
                            x: d,
                            y: i.y + i.height
                        };
                        break;
                    case "right":
                        o = {
                            x: i.x + i.width,
                            y: p
                        };
                        break;
                    case "left":
                        o = {
                            x: i.x - a.width,
                            y: p
                        };
                        break;
                    default:
                        o = {
                            x: i.x,
                            y: i.y
                        }
                }
                switch (im(n)) {
                    case "start":
                        o[l] -= v * (r && f ? -1 : 1);
                        break;
                    case "end":
                        o[l] += v * (r && f ? -1 : 1)
                }
                return o
            }

            function iI(t, n) {
                return o4(function() {
                    var r, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E, N, A, x, T, C, _, I, D, L, R;
                    return io(this, function(P) {
                        switch (P.label) {
                            case 0:
                                return void 0 === n && (n = {}), o = t.x, i = t.y, a = t.platform, u = t.rects, l = t.elements, c = t.strategy, d = void 0 === (f = (s = iv(n, t)).boundary) ? "clippingAncestors" : f, v = void 0 === (p = s.rootBoundary) ? "viewport" : p, m = void 0 === (h = s.elementContext) ? "floating" : h, b = void 0 !== (y = s.altBoundary) && y, S = iT(void 0 === (g = s.padding) ? 0 : g), w = l[b ? "floating" === m ? "reference" : "floating" : m], T = a.getClippingRect, C = {}, I = null, [4, null == a.isElement ? void 0 : a.isElement(w)];
                            case 1:
                                if (!(I == (r = P.sent()) || r)) return [3, 2];
                                return _ = w, [3, 5];
                            case 2:
                                if (D = w.contextElement) return [3, 4];
                                return [4, null == a.getDocumentElement ? void 0 : a.getDocumentElement(l.floating)];
                            case 3:
                                D = P.sent(), P.label = 4;
                            case 4:
                                _ = D, P.label = 5;
                            case 5:
                                return [4, T.apply(a, [(C.element = _, C.boundary = d, C.rootBoundary = v, C.strategy = c, C)])];
                            case 6:
                                return O = iC.apply(void 0, [P.sent()]), E = "floating" === m ? {
                                    x: o,
                                    y: i,
                                    width: u.floating.width,
                                    height: u.floating.height
                                } : u.reference, [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(l.floating)];
                            case 7:
                                return N = P.sent(), [4, null == a.isElement ? void 0 : a.isElement(N)];
                            case 8:
                                if (!(L = P.sent())) return [3, 10];
                                return [4, null == a.getScale ? void 0 : a.getScale(N)];
                            case 9:
                                L = P.sent(), P.label = 10;
                            case 10:
                                if (A = L || {
                                        x: 1,
                                        y: 1
                                    }, !a.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 12];
                                return [4, a.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: E,
                                    offsetParent: N,
                                    strategy: c
                                })];
                            case 11:
                                return R = P.sent(), [3, 13];
                            case 12:
                                R = E, P.label = 13;
                            case 13:
                                return x = iC.apply(void 0, [R]), [2, {
                                    top: (O.top - x.top + S.top) / A.y,
                                    bottom: (x.bottom - O.bottom + S.bottom) / A.y,
                                    left: (O.left - x.left + S.left) / A.x,
                                    right: (x.right - O.right + S.right) / A.x
                                }]
                        }
                    })
                })()
            }

            function iD(t, n) {
                return {
                    top: t.top - n.height,
                    right: t.right - n.width,
                    bottom: t.bottom - n.height,
                    left: t.left - n.width
                }
            }

            function iL(t) {
                return ii.some(function(n) {
                    return t[n] >= 0
                })
            }
            var iR = new Set(["left", "top"]);

            function iP() {
                return "undefined" != typeof window
            }

            function ij(t) {
                return iM(t) ? (t.nodeName || "").toLowerCase() : "#document"
            }

            function iU(t) {
                var n;
                return (null == t || null == (n = t.ownerDocument) ? void 0 : n.defaultView) || window
            }

            function ik(t) {
                var n;
                return null == (n = (iM(t) ? t.ownerDocument : t.document) || window.document) ? void 0 : n.documentElement
            }

            function iM(t) {
                return !!iP() && (o5(t, Node) || o5(t, iU(t).Node))
            }

            function iW(t) {
                return !!iP() && (o5(t, Element) || o5(t, iU(t).Element))
            }

            function iF(t) {
                return !!iP() && (o5(t, HTMLElement) || o5(t, iU(t).HTMLElement))
            }

            function iV(t) {
                return !(!iP() || "undefined" == typeof ShadowRoot) && (o5(t, ShadowRoot) || o5(t, iU(t).ShadowRoot))
            }
            var iz = new Set(["inline", "contents"]);

            function iK(t) {
                var n = i0(t),
                    r = n.overflow,
                    o = n.overflowX,
                    i = n.overflowY,
                    a = n.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + i + o) && !iz.has(a)
            }
            var iB = new Set(["table", "td", "th"]),
                iH = [":popover-open", ":modal"];

            function iY(t) {
                return iH.some(function(n) {
                    try {
                        return t.matches(n)
                    } catch (t) {
                        return !1
                    }
                })
            }
            var iG = ["transform", "translate", "scale", "rotate", "perspective"],
                iX = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                iQ = ["paint", "layout", "strict", "content"];

            function iq(t) {
                var n = i$(),
                    r = iW(t) ? i0(t) : t;
                return iG.some(function(t) {
                    return !!r[t] && "none" !== r[t]
                }) || !!r.containerType && "normal" !== r.containerType || !n && !!r.backdropFilter && "none" !== r.backdropFilter || !n && !!r.filter && "none" !== r.filter || iX.some(function(t) {
                    return (r.willChange || "").includes(t)
                }) || iQ.some(function(t) {
                    return (r.contain || "").includes(t)
                })
            }

            function i$() {
                return !("undefined" == typeof CSS || !CSS.supports) && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var iZ = new Set(["html", "body", "#document"]);

            function iJ(t) {
                return iZ.has(ij(t))
            }

            function i0(t) {
                return iU(t).getComputedStyle(t)
            }

            function i1(t) {
                return iW(t) ? {
                    scrollLeft: t.scrollLeft,
                    scrollTop: t.scrollTop
                } : {
                    scrollLeft: t.scrollX,
                    scrollTop: t.scrollY
                }
            }

            function i2(t) {
                if ("html" === ij(t)) return t;
                var n = t.assignedSlot || t.parentNode || iV(t) && t.host || ik(t);
                return iV(n) ? n.host : n
            }

            function i4(t, n, r) {
                void 0 === n && (n = []), void 0 === r && (r = !0);
                var o, i = function t(n) {
                        var r = i2(n);
                        return iJ(r) ? n.ownerDocument ? n.ownerDocument.body : n.body : iF(r) && iK(r) ? r : t(r)
                    }(t),
                    a = i === (null == (o = t.ownerDocument) ? void 0 : o.body),
                    u = iU(i);
                if (a) {
                    var l = i3(u);
                    return n.concat(u, u.visualViewport || [], iK(i) ? i : [], l && r ? i4(l) : [])
                }
                return n.concat(i, i4(i, [], r))
            }

            function i3(t) {
                return t.parent && Object.getPrototypeOf(t.parent) ? t.frameElement : null
            }

            function i5(t) {
                var n = i0(t),
                    r = parseFloat(n.width) || 0,
                    o = parseFloat(n.height) || 0,
                    i = iF(t),
                    a = i ? t.offsetWidth : r,
                    u = i ? t.offsetHeight : o,
                    l = il(r) !== a || il(o) !== u;
                return l && (r = a, o = u), {
                    width: r,
                    height: o,
                    $: l
                }
            }

            function i6(t) {
                return iW(t) ? t : t.contextElement
            }

            function i8(t) {
                var n = i6(t);
                if (!iF(n)) return is(1);
                var r = n.getBoundingClientRect(),
                    o = i5(n),
                    i = o.width,
                    a = o.height,
                    u = o.$,
                    l = (u ? il(r.width) : r.width) / i,
                    c = (u ? il(r.height) : r.height) / a;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var i7 = is(0);

            function i9(t) {
                var n = iU(t);
                return i$() && n.visualViewport ? {
                    x: n.visualViewport.offsetLeft,
                    y: n.visualViewport.offsetTop
                } : i7
            }

            function ae(t, n, r, o) {
                void 0 === n && (n = !1), void 0 === r && (r = !1);
                var i, a = t.getBoundingClientRect(),
                    u = i6(t),
                    l = is(1);
                n && (o ? iW(o) && (l = i8(o)) : l = i8(t));
                var c = (void 0 === (i = r) && (i = !1), !(!o || i && o !== iU(u)) && i) ? i9(u) : is(0),
                    s = (a.left + c.x) / l.x,
                    f = (a.top + c.y) / l.y,
                    d = a.width / l.x,
                    p = a.height / l.y;
                if (u)
                    for (var v = iU(u), h = o && iW(o) ? iU(o) : o, m = v, y = i3(m); y && o && h !== m;) {
                        var b = i8(y),
                            g = y.getBoundingClientRect(),
                            S = i0(y),
                            w = g.left + (y.clientLeft + parseFloat(S.paddingLeft)) * b.x,
                            O = g.top + (y.clientTop + parseFloat(S.paddingTop)) * b.y;
                        s *= b.x, f *= b.y, d *= b.x, p *= b.y, s += w, f += O, y = i3(m = iU(y))
                    }
                return iC({
                    width: d,
                    height: p,
                    x: s,
                    y: f
                })
            }

            function at(t, n) {
                var r = i1(t).scrollLeft;
                return n ? n.left + r : ae(ik(t)).left + r
            }

            function an(t, n, r) {
                void 0 === r && (r = !1);
                var o = t.getBoundingClientRect();
                return {
                    x: o.left + n.scrollLeft - (r ? 0 : at(t, o)),
                    y: o.top + n.scrollTop
                }
            }
            var ar = new Set(["absolute", "fixed"]);

            function ao(t, n, r) {
                if ("viewport" === n) o = function(t, n) {
                    var r = iU(t),
                        o = ik(t),
                        i = r.visualViewport,
                        a = o.clientWidth,
                        u = o.clientHeight,
                        l = 0,
                        c = 0;
                    if (i) {
                        a = i.width, u = i.height;
                        var s = i$();
                        (!s || s && "fixed" === n) && (l = i.offsetLeft, c = i.offsetTop)
                    }
                    return {
                        width: a,
                        height: u,
                        x: l,
                        y: c
                    }
                }(t, r);
                else if ("document" === n) i = ik(t), a = ik(i), u = i1(i), l = i.ownerDocument.body, c = iu(a.scrollWidth, a.clientWidth, l.scrollWidth, l.clientWidth), s = iu(a.scrollHeight, a.clientHeight, l.scrollHeight, l.clientHeight), f = -u.scrollLeft + at(i), d = -u.scrollTop, "rtl" === i0(l).direction && (f += iu(a.clientWidth, l.clientWidth) - c), o = {
                    width: c,
                    height: s,
                    x: f,
                    y: d
                };
                else if (iW(n)) v = (p = ae(n, !0, "fixed" === r)).top + n.clientTop, h = p.left + n.clientLeft, m = iF(n) ? i8(n) : is(1), o = {
                    width: n.clientWidth * m.x,
                    height: n.clientHeight * m.y,
                    x: h * m.x,
                    y: v * m.y
                };
                else {
                    var o, i, a, u, l, c, s, f, d, p, v, h, m, y = i9(t);
                    o = {
                        x: n.x - y.x,
                        y: n.y - y.y,
                        width: n.width,
                        height: n.height
                    }
                }
                return iC(o)
            }

            function ai(t, n, r) {
                var o = iF(n),
                    i = ik(n),
                    a = "fixed" === r,
                    u = ae(t, !0, a, n),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = is(0);
                if (o || !o && !a)
                    if (("body" !== ij(n) || iK(i)) && (l = i1(n)), o) {
                        var s = ae(n, !0, a, n);
                        c.x = s.x + n.clientLeft, c.y = s.y + n.clientTop
                    } else i && (c.x = at(i));
                a && !o && i && (c.x = at(i));
                var f = !i || o || a ? is(0) : an(i, l);
                return {
                    x: u.left + l.scrollLeft - c.x - f.x,
                    y: u.top + l.scrollTop - c.y - f.y,
                    width: u.width,
                    height: u.height
                }
            }

            function aa(t) {
                return "static" === i0(t).position
            }

            function au(t, n) {
                if (!iF(t) || "fixed" === i0(t).position) return null;
                if (n) return n(t);
                var r = t.offsetParent;
                return ik(t) === r && (r = r.ownerDocument.body), r
            }

            function al(t, n) {
                var r, o = iU(t);
                if (iY(t)) return o;
                if (!iF(t)) {
                    for (var i = i2(t); i && !iJ(i);) {
                        if (iW(i) && !aa(i)) return i;
                        i = i2(i)
                    }
                    return o
                }
                for (var a = au(t, n); a && (r = a, iB.has(ij(r))) && aa(a);) a = au(a, n);
                return a && iJ(a) && aa(a) && !iq(a) ? o : a || function(t) {
                    for (var n = i2(t); iF(n) && !iJ(n);) {
                        if (iq(n)) return n;
                        if (iY(n)) break;
                        n = i2(n)
                    }
                    return null
                }(t) || o
            }
            var ac = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(t) {
                    var n = t.elements,
                        r = t.rect,
                        o = t.offsetParent,
                        i = "fixed" === t.strategy,
                        a = ik(o),
                        u = !!n && iY(n.floating);
                    if (o === a || u && i) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = is(1),
                        s = is(0),
                        f = iF(o);
                    if ((f || !f && !i) && (("body" !== ij(o) || iK(a)) && (l = i1(o)), iF(o))) {
                        var d = ae(o);
                        c = i8(o), s.x = d.x + o.clientLeft, s.y = d.y + o.clientTop
                    }
                    var p = !a || f || i ? is(0) : an(a, l, !0);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + s.x + p.x,
                        y: r.y * c.y - l.scrollTop * c.y + s.y + p.y
                    }
                },
                getDocumentElement: ik,
                getClippingRect: function(t) {
                    var n = t.element,
                        r = t.boundary,
                        o = t.rootBoundary,
                        i = t.strategy,
                        a = ie("clippingAncestors" === r ? iY(n) ? [] : function(t, n) {
                            var r = n.get(t);
                            if (r) return r;
                            for (var o = i4(t, [], !1).filter(function(t) {
                                    return iW(t) && "body" !== ij(t)
                                }), i = null, a = "fixed" === i0(t).position, u = a ? i2(t) : t; iW(u) && !iJ(u);) {
                                var l = i0(u),
                                    c = iq(u);
                                c || "fixed" !== l.position || (i = null), (a ? !c && !i : !c && "static" === l.position && i && ar.has(i.position) || iK(u) && !c && function t(n, r) {
                                    var o = i2(n);
                                    return !(o === r || !iW(o) || iJ(o)) && ("fixed" === i0(o).position || t(o, r))
                                }(t, u)) ? o = o.filter(function(t) {
                                    return t !== u
                                }) : i = l, u = i2(u)
                            }
                            return n.set(t, o), o
                        }(n, this._c) : [].concat(r)).concat([o]),
                        u = a[0],
                        l = a.reduce(function(t, r) {
                            var o = ao(n, r, i);
                            return t.top = iu(o.top, t.top), t.right = ia(o.right, t.right), t.bottom = ia(o.bottom, t.bottom), t.left = iu(o.left, t.left), t
                        }, ao(n, u, i));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: al,
                getElementRects: function(t) {
                    return o4(function() {
                        var n, r, o, i;
                        return io(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return n = this.getOffsetParent || al, [4, (0, this.getDimensions)(t.floating)];
                                case 1:
                                    return r = a.sent(), o = {}, i = [t.reference], [4, n(t.floating)];
                                case 2:
                                    return [2, (o.reference = ai.apply(void 0, i.concat([a.sent(), t.strategy])), o.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, o)]
                            }
                        })
                    }).call(this)
                },
                getClientRects: function(t) {
                    return Array.from(t.getClientRects())
                },
                getDimensions: function(t) {
                    var n = i5(t);
                    return {
                        width: n.width,
                        height: n.height
                    }
                },
                getScale: i8,
                isElement: iW,
                isRTL: function(t) {
                    return "rtl" === i0(t).direction
                }
            };

            function as(t, n) {
                return t.x === n.x && t.y === n.y && t.width === n.width && t.height === n.height
            }

            function af(t, n, r, o) {
                void 0 === o && (o = {});
                var i = o.ancestorScroll,
                    a = void 0 === i || i,
                    u = o.ancestorResize,
                    l = void 0 === u || u,
                    c = o.elementResize,
                    s = void 0 === c ? "function" == typeof ResizeObserver : c,
                    f = o.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = o.animationFrame,
                    v = void 0 !== p && p,
                    h = i6(t),
                    m = a || l ? ie(h ? i4(h) : []).concat(ie(i4(n))) : [];
                m.forEach(function(t) {
                    a && t.addEventListener("scroll", r, {
                        passive: !0
                    }), l && t.addEventListener("resize", r)
                });
                var y, b = h && d ? function(t, n) {
                        var r, o = null,
                            i = ik(t);

                        function a() {
                            var t;
                            clearTimeout(r), null == (t = o) || t.disconnect(), o = null
                        }
                        return function u(l, c) {
                            void 0 === l && (l = !1), void 0 === c && (c = 1), a();
                            var s = t.getBoundingClientRect(),
                                f = s.left,
                                d = s.top,
                                p = s.width,
                                v = s.height;
                            if (l || n(), p && v) {
                                var h = {
                                        rootMargin: -ic(d) + "px " + -ic(i.clientWidth - (f + p)) + "px " + -ic(i.clientHeight - (d + v)) + "px " + -ic(f) + "px",
                                        threshold: iu(0, ia(1, c)) || 1
                                    },
                                    m = !0;
                                try {
                                    o = new IntersectionObserver(y, o8(o6({}, h), {
                                        root: i.ownerDocument
                                    }))
                                } catch (t) {
                                    o = new IntersectionObserver(y, h)
                                }
                                o.observe(t)
                            }

                            function y(n) {
                                var o = n[0].intersectionRatio;
                                if (o !== c) {
                                    if (!m) return u();
                                    o ? u(!1, o) : r = setTimeout(function() {
                                        u(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== o || as(s, t.getBoundingClientRect()) || u(), m = !1
                            }
                        }(!0), a
                    }(h, r) : null,
                    g = -1,
                    S = null;
                s && (S = new ResizeObserver(function(t) {
                    var o = o9(t, 1)[0];
                    o && o.target === h && S && (S.unobserve(n), cancelAnimationFrame(g), g = requestAnimationFrame(function() {
                        var t;
                        null == (t = S) || t.observe(n)
                    })), r()
                }), h && !v && S.observe(h), S.observe(n));
                var w = v ? ae(t) : null;
                return v && function n() {
                        var o = ae(t);
                        w && !as(w, o) && r(), w = o, y = requestAnimationFrame(n)
                    }(), r(),
                    function() {
                        var t;
                        m.forEach(function(t) {
                            a && t.removeEventListener("scroll", r), l && t.removeEventListener("resize", r)
                        }), null == b || b(), null == (t = S) || t.disconnect(), S = null, v && cancelAnimationFrame(y)
                    }
            }
            var ad = function(t) {
                    return {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            return o4(function() {
                                var r, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E, N, A, x, T, C, _, I, D, L, R, P, j, U, k, M, W;
                                return io(this, function(F) {
                                    switch (F.label) {
                                        case 0:
                                            if (r = n.x, o = n.y, i = n.placement, a = n.rects, u = n.platform, l = n.elements, c = n.middlewareData, f = (s = iv(t, n) || {}).element, p = void 0 === (d = s.padding) ? 0 : d, null == f) return [2, {}];
                                            return v = iT(p), h = {
                                                x: r,
                                                y: o
                                            }, y = ib(m = iy(iS(i))), [4, u.getDimensions(f)];
                                        case 1:
                                            return b = F.sent(), S = (g = "y" === m) ? "top" : "left", w = g ? "bottom" : "right", O = g ? "clientHeight" : "clientWidth", E = a.reference[y] + a.reference[m] - h[m] - a.floating[y], N = h[m] - a.reference[m], [4, null == u.getOffsetParent ? void 0 : u.getOffsetParent(f)];
                                        case 2:
                                            if (!(T = x = (A = F.sent()) ? A[O] : 0)) return [3, 4];
                                            return [4, null == u.isElement ? void 0 : u.isElement(A)];
                                        case 3:
                                            T = F.sent(), F.label = 4;
                                        case 4:
                                            return T || (x = l.floating[O] || a.floating[y]), C = E / 2 - N / 2, _ = x / 2 - b[y] / 2 - 1, I = ia(v[S], _), D = ia(v[w], _), L = I, R = x - b[y] - D, j = iu(L, ia(P = x / 2 - b[y] / 2 + C, R)), k = (U = !c.arrow && null != im(i) && P !== j && a.reference[y] / 2 - (P < L ? I : D) - b[y] / 2 < 0) ? P < L ? P - L : P - R : 0, [2, (o3(W = {}, m, h[m] + k), o3(W, "data", o6((o3(M = {}, m, j), o3(M, "centerOffset", P - j - k), M), U && {
                                                alignmentOffset: k
                                            })), o3(W, "reset", U), W)]
                                    }
                                })
                            })()
                        }
                    }
                },
                ap = function(t, n, r) {
                    var o, i = new Map,
                        a = o6({
                            platform: ac
                        }, r),
                        u = o8(o6({}, a.platform), {
                            _c: i
                        });
                    return o = o8(o6({}, a), {
                        platform: u
                    }), o4(function() {
                        var r, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E, N, A, x, T, C, _;
                        return io(this, function(I) {
                            switch (I.label) {
                                case 0:
                                    return i = void 0 === (r = o.placement) ? "bottom" : r, u = void 0 === (a = o.strategy) ? "absolute" : a, c = void 0 === (l = o.middleware) ? [] : l, s = o.platform, f = c.filter(Boolean), [4, null == s.isRTL ? void 0 : s.isRTL(n)];
                                case 1:
                                    return d = I.sent(), [4, s.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: u
                                    })];
                                case 2:
                                    h = (v = i_(p = I.sent(), i, d)).x, m = v.y, y = i, b = {}, g = 0, S = 0, I.label = 3;
                                case 3:
                                    if (!(S < f.length)) return [3, 12];
                                    return O = (w = f[S]).name, [4, (0, w.fn)({
                                        x: h,
                                        y: m,
                                        initialPlacement: i,
                                        placement: y,
                                        strategy: u,
                                        middlewareData: b,
                                        rects: p,
                                        platform: s,
                                        elements: {
                                            reference: t,
                                            floating: n
                                        }
                                    })];
                                case 4:
                                    if (N = (E = I.sent()).x, A = E.y, x = E.data, T = E.reset, h = null != N ? N : h, m = null != A ? A : m, b = o8(o6({}, b), o3({}, O, o6({}, b[O], x))), !(T && g <= 50)) return [3, 10];
                                    if (g++, "object" != (void 0 === T ? "undefined" : it(T))) return [3, 9];
                                    if (T.placement && (y = T.placement), !T.rects) return [3, 8];
                                    if (!0 !== T.rects) return [3, 6];
                                    return [4, s.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: u
                                    })];
                                case 5:
                                    return _ = I.sent(), [3, 7];
                                case 6:
                                    _ = T.rects, I.label = 7;
                                case 7:
                                    p = _, I.label = 8;
                                case 8:
                                    h = (C = i_(p, y, d)).x, m = C.y, I.label = 9;
                                case 9:
                                    S = -1, I.label = 10;
                                case 10:
                                    I.label = 11;
                                case 11:
                                    return S++, [3, 3];
                                case 12:
                                    return [2, {
                                        x: h,
                                        y: m,
                                        placement: y,
                                        strategy: u,
                                        middlewareData: b
                                    }]
                            }
                        })
                    })()
                },
                av = "undefined" != typeof document ? U.useLayoutEffect : function() {};

            function ah(t, n) {
                if (t === n) return !0;
                if ((void 0 === t ? "undefined" : it(t)) != (void 0 === n ? "undefined" : it(n))) return !1;
                if ("function" == typeof t && t.toString() === n.toString()) return !0;
                if (t && n && "object" == (void 0 === t ? "undefined" : it(t))) {
                    if (Array.isArray(t)) {
                        if ((r = t.length) !== n.length) return !1;
                        for (o = r; 0 != o--;)
                            if (!ah(t[o], n[o])) return !1;
                        return !0
                    }
                    if ((r = (i = Object.keys(t)).length) !== Object.keys(n).length) return !1;
                    for (o = r; 0 != o--;)
                        if (!({}).hasOwnProperty.call(n, i[o])) return !1;
                    for (o = r; 0 != o--;) {
                        var r, o, i, a = i[o];
                        if (("_owner" !== a || !t.$$typeof) && !ah(t[a], n[a])) return !1
                    }
                    return !0
                }
                return t != t && n != n
            }

            function am(t) {
                return "undefined" == typeof window ? 1 : (t.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function ay(t, n) {
                var r = am(t);
                return Math.round(n * r) / r
            }

            function ab(t) {
                var n = U.useRef(t);
                return av(function() {
                    n.current = t
                }), n
            }
            var ag = function(t, n) {
                    var r;
                    return o8(o6({}, (void 0 === (r = t) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(t) {
                            return o4(function() {
                                var n, o, i, a, u, l, c;
                                return io(this, function(s) {
                                    switch (s.label) {
                                        case 0:
                                            var f;
                                            return i = t.x, a = t.y, u = t.placement, l = t.middlewareData, [4, (f = r, o4(function() {
                                                var n, r, o, i, a, u, l, c, s, d, p, v, h, m;
                                                return io(this, function(y) {
                                                    switch (y.label) {
                                                        case 0:
                                                            return n = t.placement, r = t.platform, o = t.elements, [4, null == r.isRTL ? void 0 : r.isRTL(o.floating)];
                                                        case 1:
                                                            return i = y.sent(), a = ih(n), u = im(n), l = "y" === iS(n), c = iR.has(a) ? -1 : 1, s = i && l ? -1 : 1, v = (p = "number" == typeof(d = iv(f, t)) ? {
                                                                mainAxis: d,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: d.mainAxis || 0,
                                                                crossAxis: d.crossAxis || 0,
                                                                alignmentAxis: d.alignmentAxis
                                                            }).mainAxis, h = p.crossAxis, m = p.alignmentAxis, [2, (u && "number" == typeof m && (h = "end" === u ? -1 * m : m), l ? {
                                                                x: h * s,
                                                                y: v * c
                                                            } : {
                                                                x: v * c,
                                                                y: h * s
                                                            })]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return c = s.sent(), [2, u === (null == (n = l.offset) ? void 0 : n.placement) && null != (o = l.arrow) && o.alignmentOffset ? {} : {
                                                x: i + c.x,
                                                y: a + c.y,
                                                data: o8(o6({}, c), {
                                                    placement: u
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                aS = function(t, n) {
                    var r;
                    return o8(o6({}, (void 0 === (r = t) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(t) {
                            return o4(function() {
                                var n, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E, N;
                                return io(this, function(A) {
                                    switch (A.label) {
                                        case 0:
                                            return n = t.x, o = t.y, i = t.placement, l = void 0 === (u = (a = iv(r, t)).mainAxis) || u, s = void 0 !== (c = a.crossAxis) && c, d = void 0 === (f = a.limiter) ? {
                                                fn: function(t) {
                                                    return {
                                                        x: t.x,
                                                        y: t.y
                                                    }
                                                }
                                            } : f, p = o7(a, ["mainAxis", "crossAxis", "limiter"]), v = {
                                                x: n,
                                                y: o
                                            }, [4, iI(t, p)];
                                        case 1:
                                            return h = A.sent(), b = v[y = iy(m = iS(ih(i)))], g = v[m], l && (S = "y" === y ? "bottom" : "right", b = iu(b + h["y" === y ? "top" : "left"], ia(b, b - h[S]))), s && (w = "y" === m ? "bottom" : "right", g = iu(g + h["y" === m ? "top" : "left"], ia(g, g - h[w]))), E = d.fn(o8(o6({}, t), (o3(O = {}, y, b), o3(O, m, g), O))), [2, o8(o6({}, E), {
                                                data: {
                                                    x: E.x - n,
                                                    y: E.y - o,
                                                    enabled: (o3(N = {}, y, l), o3(N, m, s), N)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                aw = function(t, n) {
                    var r;
                    return o8(o6({}, (void 0 === (r = t) && (r = {}), {
                        options: r,
                        fn: function(t) {
                            var n, o = t.x,
                                i = t.y,
                                a = t.placement,
                                u = t.rects,
                                l = t.middlewareData,
                                c = iv(r, t),
                                s = c.offset,
                                f = c.mainAxis,
                                d = c.crossAxis,
                                p = {
                                    x: o,
                                    y: i
                                },
                                v = iS(a),
                                h = iy(v),
                                m = p[h],
                                y = p[v],
                                b = iv(void 0 === s ? 0 : s, t),
                                g = "number" == typeof b ? {
                                    mainAxis: b,
                                    crossAxis: 0
                                } : o6({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, b);
                            if (void 0 === f || f) {
                                var S = "y" === h ? "height" : "width",
                                    w = u.reference[h] - u.floating[S] + g.mainAxis,
                                    O = u.reference[h] + u.reference[S] - g.mainAxis;
                                m < w ? m = w : m > O && (m = O)
                            }
                            if (void 0 === d || d) {
                                var E, N, A = "y" === h ? "width" : "height",
                                    x = iR.has(ih(a)),
                                    T = u.reference[v] - u.floating[A] + (x && (null == (E = l.offset) ? void 0 : E[v]) || 0) + (x ? 0 : g.crossAxis),
                                    C = u.reference[v] + u.reference[A] + (x ? 0 : (null == (N = l.offset) ? void 0 : N[v]) || 0) - (x ? g.crossAxis : 0);
                                y < T ? y = T : y > C && (y = C)
                            }
                            return o3(n = {}, h, m), o3(n, v, y), n
                        }
                    })), {
                        options: [t, n]
                    })
                },
                aO = function(t, n) {
                    var r;
                    return o8(o6({}, (void 0 === (r = t) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(t) {
                            return o4(function() {
                                var n, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E, N, A, x, T, C, _, I, D, L, R, P, j, U, k, M, W, F, V, z;
                                return io(this, function(K) {
                                    var B, H, Y, G, X, Q, q, $, Z, J, ee, et, en, er, eo;
                                    switch (K.label) {
                                        case 0:
                                            if (a = t.placement, u = t.middlewareData, l = t.rects, c = t.initialPlacement, s = t.platform, f = t.elements, v = void 0 === (p = (d = iv(r, t)).mainAxis) || p, m = void 0 === (h = d.crossAxis) || h, y = d.fallbackPlacements, g = void 0 === (b = d.fallbackStrategy) ? "bestFit" : b, w = void 0 === (S = d.fallbackAxisSideDirection) ? "none" : S, E = void 0 === (O = d.flipAlignment) || O, N = o7(d, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (o = u.arrow) && o.alignmentOffset) return [2, {}];
                                            return A = ih(a), x = iS(c), T = ih(c) === c, [4, null == s.isRTL ? void 0 : s.isRTL(f.floating)];
                                        case 1:
                                            return C = K.sent(), _ = y || (T || !E ? [ix(c)] : (H = ix(B = c), [iw(B), H, iw(H)])), I = "none" !== w, !y && I && (n = _).push.apply(n, ie((Y = c, G = E, X = w, Q = C, q = im(Y), $ = function(t, n, r) {
                                                switch (t) {
                                                    case "top":
                                                    case "bottom":
                                                        return r ? n ? iE : iO : n ? iO : iE;
                                                    case "left":
                                                    case "right":
                                                        return n ? iN : iA;
                                                    default:
                                                        return []
                                                }
                                            }(ih(Y), "start" === X, Q), q && ($ = $.map(function(t) {
                                                return t + "-" + q
                                            }), G && ($ = $.concat($.map(iw)))), $))), D = [c].concat(ie(_)), [4, iI(t, N)];
                                        case 2:
                                            if (L = K.sent(), R = [], P = (null == (i = u.flip) ? void 0 : i.overflows) || [], v && R.push(L[A]), m && (Z = a, J = l, void 0 === (ee = C) && (ee = !1), et = im(Z), er = ib(en = iy(iS(Z))), eo = "x" === en ? et === (ee ? "end" : "start") ? "right" : "left" : "start" === et ? "bottom" : "top", J.reference[er] > J.floating[er] && (eo = ix(eo)), j = [eo, ix(eo)], R.push(L[j[0]], L[j[1]])), P = ie(P).concat([{
                                                    placement: a,
                                                    overflows: R
                                                }]), !R.every(function(t) {
                                                    return t <= 0
                                                })) {
                                                if ((W = D[M = ((null == (U = u.flip) ? void 0 : U.index) || 0) + 1]) && ("alignment" !== m || x === iS(W) || P.every(function(t) {
                                                        return iS(t.placement) !== x || t.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: M,
                                                        overflows: P
                                                    },
                                                    reset: {
                                                        placement: W
                                                    }
                                                }];
                                                if (!(F = null == (k = P.filter(function(t) {
                                                        return t.overflows[0] <= 0
                                                    }).sort(function(t, n) {
                                                        return t.overflows[1] - n.overflows[1]
                                                    })[0]) ? void 0 : k.placement)) switch (g) {
                                                    case "bestFit":
                                                        (z = null == (V = P.filter(function(t) {
                                                            if (I) {
                                                                var n = iS(t.placement);
                                                                return n === x || "y" === n
                                                            }
                                                            return !0
                                                        }).map(function(t) {
                                                            return [t.placement, t.overflows.filter(function(t) {
                                                                return t > 0
                                                            }).reduce(function(t, n) {
                                                                return t + n
                                                            }, 0)]
                                                        }).sort(function(t, n) {
                                                            return t[1] - n[1]
                                                        })[0]) ? void 0 : V[0]) && (F = z);
                                                        break;
                                                    case "initialPlacement":
                                                        F = c
                                                }
                                                if (a !== F) return [2, {
                                                    reset: {
                                                        placement: F
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                aE = function(t, n) {
                    var r;
                    return o8(o6({}, (void 0 === (r = t) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(t) {
                            return o4(function() {
                                var n, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E, N, A, x, T, C, _, I, D, L;
                                return io(this, function(R) {
                                    switch (R.label) {
                                        case 0:
                                            return i = t.placement, a = t.rects, u = t.platform, l = t.elements, f = void 0 === (s = (c = iv(r, t)).apply) ? function() {} : s, [4, iI(t, o7(c, ["apply"]))];
                                        case 1:
                                            if (d = R.sent(), p = ih(i), v = im(i), h = "y" === iS(i), y = (m = a.floating).width, b = m.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return g = p, [4, null == u.isRTL ? void 0 : u.isRTL(l.floating)];
                                        case 2:
                                            return S = v === (R.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            S = p, g = "end" === v ? "top" : "bottom", R.label = 4;
                                        case 4:
                                            return w = b - d.top - d.bottom, O = y - d.left - d.right, E = ia(b - d[g], w), N = ia(y - d[S], O), A = !t.middlewareData.shift, x = E, T = N, null != (n = t.middlewareData.shift) && n.enabled.x && (T = O), null != (o = t.middlewareData.shift) && o.enabled.y && (x = w), A && !v && (C = iu(d.left, 0), _ = iu(d.right, 0), I = iu(d.top, 0), D = iu(d.bottom, 0), h ? T = y - 2 * (0 !== C || 0 !== _ ? C + _ : iu(d.left, d.right)) : x = b - 2 * (0 !== I || 0 !== D ? I + D : iu(d.top, d.bottom))), [4, f(o8(o6({}, t), {
                                                availableWidth: T,
                                                availableHeight: x
                                            }))];
                                        case 5:
                                            return R.sent(), [4, u.getDimensions(l.floating)];
                                        case 6:
                                            return L = R.sent(), [2, y !== L.width || b !== L.height ? {
                                                reset: {
                                                    rects: !0
                                                }
                                            } : {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                aN = function(t, n) {
                    var r;
                    return o8(o6({}, (void 0 === (r = t) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(t) {
                            return o4(function() {
                                var n, o, i, a, u, l, c;
                                return io(this, function(s) {
                                    switch (s.label) {
                                        case 0:
                                            switch (n = t.rects, a = void 0 === (i = (o = iv(r, t)).strategy) ? "referenceHidden" : i, u = o7(o, ["strategy"]), a) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, iI(t, o8(o6({}, u), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = iD.apply(void 0, [s.sent(), n.reference]),
                                                    referenceHidden: iL(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, iI(t, o8(o6({}, u), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = iD.apply(void 0, [s.sent(), n.floating]),
                                                    escaped: iL(c)
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
                        options: [t, n]
                    })
                },
                aA = function(t, n) {
                    return o8(o6({}, {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            var r = "function" == typeof t ? t(n) : t,
                                o = r.element,
                                i = r.padding;
                            return o && ({}).hasOwnProperty.call(o, "current") ? null != o.current ? ad({
                                element: o.current,
                                padding: i
                            }).fn(n) : {} : o ? ad({
                                element: o,
                                padding: i
                            }).fn(n) : {}
                        }
                    }), {
                        options: [t, n]
                    })
                };

            function ax(t) {
                var n = t.className;
                return k().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: o_("block", n),
                    style: {
                        marginTop: -1
                    }
                }, k().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function aT(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function aC(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function a_(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        aC(t, n, r[n])
                    })
                }
                return t
            }

            function aI(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function aD(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function aL(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || aP(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aR(t) {
                return function(t) {
                    if (Array.isArray(t)) return aT(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || aP(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aP(t, n) {
                if (t) {
                    if ("string" == typeof t) return aT(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aT(t, n)
                }
            }
            oL(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}.light-theme,.system-theme,:root{--alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-system-progress:#335fff}.dark-theme{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}@media (prefers-color-scheme:dark){:is(:root,.system-theme){--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}:is(:root,.light-theme,.system-theme) .stroke-contrast-alpha{border-color:rgba(27,37,75,.5)}.dark-theme .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}@media (prefers-color-scheme:dark){:is(:root,.system-theme) .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}}.foundation-web-input.stroke-contrast-alpha:focus,.foundation-web-input.stroke-contrast-alpha:focus-within{border-color:var(--color-system-emphasis);border-width:2px}.foundation-web-input.stroke-system-alert:focus,.foundation-web-input.stroke-system-alert:focus-within{border-width:2px}");
            var aj = U.forwardRef(function(t, n) {
                var r = t.children,
                    o = aD(t, ["children"]),
                    i = U.Children.toArray(r),
                    a = i.find(aM);
                if (a) {
                    var u = a.props.children,
                        l = i.map(function(t) {
                            return t === a ? U.Children.count(u) > 1 ? U.Children.only(null) : U.isValidElement(u) ? u.props.children : null : t
                        });
                    return (0, j.jsx)(aU, aI(a_({}, o), {
                        ref: n,
                        children: U.isValidElement(u) ? U.cloneElement(u, void 0, l) : null
                    }))
                }
                return (0, j.jsx)(aU, aI(a_({}, o), {
                    ref: n,
                    children: r
                }))
            });
            aj.displayName = "Slot";
            var aU = U.forwardRef(function(t, n) {
                var r = t.children,
                    o = aD(t, ["children"]);
                if (U.isValidElement(r)) {
                    var i, a, u, l = (u = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? r.ref : (u = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning ? r.props.ref : r.props.ref || r.ref;
                    return U.cloneElement(r, aI(a_({}, function(t, n) {
                        var r = a_({}, n);
                        for (var o in n) ! function(o) {
                            var i = t[o],
                                a = n[o];
                            /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                a.apply(void 0, aR(n)), i.apply(void 0, aR(n))
                            } : i && (r[o] = i) : "style" === o ? r[o] = a_({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                        }(o);
                        return a_({}, t, r)
                    }(o, r.props)), {
                        ref: n ? oY(n, l) : l
                    }))
                }
                return U.Children.count(r) > 1 ? U.Children.only(null) : null
            });
            aU.displayName = "SlotClone";
            var ak = function(t) {
                var n = t.children;
                return (0, j.jsx)(j.Fragment, {
                    children: n
                })
            };

            function aM(t) {
                return U.isValidElement(t) && t.type === ak
            }
            var aW, aF, aV, az, aK, aB, aH, aY, aG, aX, aQ, aq, a$, aZ, aJ, a0, a1, a2, a4, a3, a5, a6, a8, a7, a9, ue, ut, un, ur, uo, ui, ua, uu, ul, uc, us, uf, ud, up, uv, uh, um, uy, ub, ug, uS, uw, uO, uE, uN, uA, ux, uT, uC, u_, uI, uD, uL, uR, uP, uj, uU, uk, uM, uW, uF, uV, uz, uK = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = U.forwardRef(function(t, r) {
                        var o = t.asChild,
                            i = aD(t, ["asChild"]),
                            a = o ? aj : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(a, aI(a_({}, i), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(n), aI(a_({}, t), aC({}, n, r))
                }, {}),
                uB = "dismissableLayer.update",
                uH = U.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                uY = U.forwardRef(function(t, n) {
                    var r, o, i = t.disableOutsidePointerEvents,
                        a = void 0 !== i && i,
                        u = t.onEscapeKeyDown,
                        l = t.onPointerDownOutside,
                        c = t.onFocusOutside,
                        s = t.onInteractOutside,
                        f = t.onDismiss,
                        d = aD(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = U.useContext(uH),
                        v = aL(U.useState(null), 2),
                        h = v[0],
                        m = v[1],
                        y = null != (o = null == h ? void 0 : h.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        b = aL(U.useState({}), 2)[1],
                        g = oG(n, function(t) {
                            return m(t)
                        }),
                        S = Array.from(p.layers),
                        w = aL(aR(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        O = S.indexOf(w),
                        E = h ? S.indexOf(h) : -1,
                        N = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        A = E >= O,
                        x = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = o$(t),
                                i = U.useRef(!1),
                                a = U.useRef(function() {});
                            return U.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !i.current) {
                                            var n = function() {
                                                    uX("dismissableLayer.pointerDownOutside", o, u, {
                                                        discrete: !0
                                                    })
                                                },
                                                u = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", a.current), a.current = n, r.addEventListener("click", a.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", a.current);
                                        i.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", a.current)
                                }
                            }, [r, o]), {
                                onPointerDownCapture: function() {
                                    return i.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = aR(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            A && !r && (null == l || l(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y),
                        T = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = o$(t),
                                i = U.useRef(!1);
                            return U.useEffect(function() {
                                var t = function(t) {
                                    t.target && !i.current && uX("dismissableLayer.focusOutside", o, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, o]), {
                                onFocusCapture: function() {
                                    return i.current = !0
                                },
                                onBlurCapture: function() {
                                    return i.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            aR(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == c || c(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y);
                    return function(t) {
                        var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            o = o$(t);
                        U.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && o(t)
                            };
                            return r.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return r.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [o, r])
                    }(function(t) {
                        E === p.layers.size - 1 && (null == u || u(t), !t.defaultPrevented && f && (t.preventDefault(), f()))
                    }, y), U.useEffect(function() {
                        if (h) return a && (0 === p.layersWithOutsidePointerEventsDisabled.size && (uz = y.body.style.pointerEvents, y.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(h)), p.layers.add(h), uG(),
                            function() {
                                a && 1 === p.layersWithOutsidePointerEventsDisabled.size && (y.body.style.pointerEvents = uz)
                            }
                    }, [h, y, a, p]), U.useEffect(function() {
                        return function() {
                            h && (p.layers.delete(h), p.layersWithOutsidePointerEventsDisabled.delete(h), uG())
                        }
                    }, [h, p]), U.useEffect(function() {
                        var t = function() {
                            return b({})
                        };
                        return document.addEventListener(uB, t),
                            function() {
                                return document.removeEventListener(uB, t)
                            }
                    }, []), (0, j.jsx)(uK.div, aI(a_({}, d), {
                        ref: g,
                        style: a_({
                            pointerEvents: N ? A ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: oq(t.onFocusCapture, T.onFocusCapture),
                        onBlurCapture: oq(t.onBlurCapture, T.onBlurCapture),
                        onPointerDownCapture: oq(t.onPointerDownCapture, x.onPointerDownCapture)
                    }))
                });

            function uG() {
                var t = new CustomEvent(uB);
                document.dispatchEvent(t)
            }

            function uX(t, n, r, o) {
                var i = o.discrete,
                    a = r.originalEvent.target,
                    u = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && a.addEventListener(t, n, {
                    once: !0
                }), i ? a && M.flushSync(function() {
                    return a.dispatchEvent(u)
                }) : a.dispatchEvent(u)
            }
            uY.displayName = "DismissableLayer", U.forwardRef(function(t, n) {
                var r = U.useContext(uH),
                    o = U.useRef(null),
                    i = oG(n, o);
                return U.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, j.jsx)(uK.div, aI(a_({}, t), {
                    ref: i
                }))
            }).displayName = "DismissableLayerBranch";
            var uQ = U["useId".toString()] || function() {},
                uq = 0,
                u$ = U.forwardRef(function(t, n) {
                    var r = t.children,
                        o = t.width,
                        i = t.height,
                        a = aD(t, ["children", "width", "height"]);
                    return (0, j.jsx)(uK.svg, aI(a_({}, a), {
                        ref: n,
                        width: void 0 === o ? 10 : o,
                        height: void 0 === i ? 5 : i,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: t.asChild ? r : (0, j.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                });
            u$.displayName = "Arrow";
            var uZ = "Popper",
                uJ = aL(oX(uZ), 2),
                u0 = uJ[0],
                u1 = uJ[1],
                u2 = aL(u0(uZ), 2),
                u4 = u2[0],
                u3 = u2[1],
                u5 = function(t) {
                    var n = t.__scopePopper,
                        r = t.children,
                        o = aL(U.useState(null), 2),
                        i = o[0],
                        a = o[1];
                    return (0, j.jsx)(u4, {
                        scope: n,
                        anchor: i,
                        onAnchorChange: a,
                        children: r
                    })
                };
            u5.displayName = uZ;
            var u6 = "PopperAnchor",
                u8 = U.forwardRef(function(t, n) {
                    var r = t.__scopePopper,
                        o = t.virtualRef,
                        i = aD(t, ["__scopePopper", "virtualRef"]),
                        a = u3(u6, r),
                        u = U.useRef(null),
                        l = oG(n, u);
                    return U.useEffect(function() {
                        a.onAnchorChange((null == o ? void 0 : o.current) || u.current)
                    }), o ? null : (0, j.jsx)(uK.div, aI(a_({}, i), {
                        ref: l
                    }))
                });
            u8.displayName = u6;
            var u7 = "PopperContent",
                u9 = aL(u0(u7), 2),
                le = u9[0],
                lt = u9[1],
                ln = U.forwardRef(function(t, n) {
                    var r, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E, N, A, x, T, C, _, I, D, L, R, P, k, W, F, V, z, K, B, H, Y, G, X, Q, q, $, Z, J, ee, et, en, er, eo, ei, ea, eu = t.__scopePopper,
                        el = t.side,
                        ec = t.sideOffset,
                        es = t.align,
                        ef = void 0 === es ? "center" : es,
                        ed = t.alignOffset,
                        ep = t.arrowPadding,
                        ev = t.avoidCollisions,
                        eh = void 0 === ev || ev,
                        em = t.collisionBoundary,
                        ey = void 0 === em ? [] : em,
                        eb = t.collisionPadding,
                        eg = void 0 === eb ? 0 : eb,
                        eS = t.sticky,
                        ew = t.hideWhenDetached,
                        eO = t.updatePositionStrategy,
                        eE = void 0 === eO ? "optimized" : eO,
                        eN = t.onPlaced,
                        eA = aD(t, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        ex = u3(u7, eu),
                        eT = aL(U.useState(null), 2),
                        eC = eT[0],
                        e_ = eT[1],
                        eI = oG(n, function(t) {
                            return e_(t)
                        }),
                        eD = aL(U.useState(null), 2),
                        eL = eD[0],
                        eR = eD[1],
                        eP = (o = (r = oz(U.useState(void 0), 2))[0], i = r[1], oZ(function() {
                            if (eL) {
                                i({
                                    width: eL.offsetWidth,
                                    height: eL.offsetHeight
                                });
                                var t = new ResizeObserver(function(t) {
                                    if (Array.isArray(t) && t.length) {
                                        var n, r, o = t[0];
                                        if ("borderBoxSize" in o) {
                                            var a = o.borderBoxSize,
                                                u = Array.isArray(a) ? a[0] : a;
                                            n = u.inlineSize, r = u.blockSize
                                        } else n = eL.offsetWidth, r = eL.offsetHeight;
                                        i({
                                            width: n,
                                            height: r
                                        })
                                    }
                                });
                                return t.observe(eL, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return t.unobserve(eL)
                                    }
                            }
                            i(void 0)
                        }, [eL]), o),
                        ej = null != (ei = null == eP ? void 0 : eP.width) ? ei : 0,
                        eU = null != (ea = null == eP ? void 0 : eP.height) ? ea : 0,
                        ek = "number" == typeof eg ? eg : a_({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, eg),
                        eM = Array.isArray(ey) ? ey : [ey],
                        eW = eM.length > 0,
                        eF = {
                            padding: ek,
                            boundary: eM.filter(la),
                            altBoundary: eW
                        },
                        eV = (l = void 0 === (u = (a = {
                            strategy: "fixed",
                            placement: (void 0 === el ? "bottom" : el) + ("center" !== ef ? "-" + ef : ""),
                            whileElementsMounted: function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                return af.apply(void 0, aR(n).concat([{
                                    animationFrame: "always" === eE
                                }]))
                            },
                            elements: {
                                reference: ex.anchor
                            },
                            middleware: [ag({
                                mainAxis: (void 0 === ec ? 0 : ec) + eU,
                                alignmentAxis: void 0 === ed ? 0 : ed
                            }), eh && aS(a_({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === eS ? "partial" : eS) ? aw() : void 0
                            }, eF)), eh && aO(a_({}, eF)), aE(aI(a_({}, eF), {
                                apply: function(t) {
                                    var n = t.elements,
                                        r = t.rects,
                                        o = t.availableWidth,
                                        i = t.availableHeight,
                                        a = r.reference,
                                        u = a.width,
                                        l = a.height,
                                        c = n.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(o, "px")), c.setProperty("--radix-popper-available-height", "".concat(i, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(u, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), eL && aA({
                                element: eL,
                                padding: void 0 === ep ? 0 : ep
                            }), lu({
                                arrowWidth: ej,
                                arrowHeight: eU
                            }), void 0 !== ew && ew && aN(a_({
                                strategy: "referenceHidden"
                            }, eF))]
                        }).placement) ? "bottom" : u, s = void 0 === (c = a.strategy) ? "absolute" : c, d = void 0 === (f = a.middleware) ? [] : f, p = a.platform, m = (h = void 0 === (v = a.elements) ? {} : v).reference, y = h.floating, g = void 0 === (b = a.transform) || b, S = a.whileElementsMounted, w = a.open, E = (O = o9(U.useState({
                            x: 0,
                            y: 0,
                            strategy: s,
                            placement: l,
                            middlewareData: {},
                            isPositioned: !1
                        }), 2))[0], N = O[1], x = (A = o9(U.useState(d), 2))[0], T = A[1], ah(x, d) || T(d), _ = (C = o9(U.useState(null), 2))[0], I = C[1], L = (D = o9(U.useState(null), 2))[0], R = D[1], P = U.useCallback(function(t) {
                            t !== V.current && (V.current = t, I(t))
                        }, []), k = U.useCallback(function(t) {
                            t !== z.current && (z.current = t, R(t))
                        }, []), W = m || _, F = y || L, V = U.useRef(null), z = U.useRef(null), K = U.useRef(E), B = null != S, H = ab(S), Y = ab(p), G = ab(w), X = U.useCallback(function() {
                            if (V.current && z.current) {
                                var t = {
                                    placement: l,
                                    strategy: s,
                                    middleware: x
                                };
                                Y.current && (t.platform = Y.current), ap(V.current, z.current, t).then(function(t) {
                                    var n = o8(o6({}, t), {
                                        isPositioned: !1 !== G.current
                                    });
                                    Q.current && !ah(K.current, n) && (K.current = n, M.flushSync(function() {
                                        N(n)
                                    }))
                                })
                            }
                        }, [x, l, s, Y, G]), av(function() {
                            !1 === w && K.current.isPositioned && (K.current.isPositioned = !1, N(function(t) {
                                return o8(o6({}, t), {
                                    isPositioned: !1
                                })
                            }))
                        }, [w]), Q = U.useRef(!1), av(function() {
                            return Q.current = !0,
                                function() {
                                    Q.current = !1
                                }
                        }, []), av(function() {
                            if (W && (V.current = W), F && (z.current = F), W && F) {
                                if (H.current) return H.current(W, F, X);
                                X()
                            }
                        }, [W, F, X, H, B]), q = U.useMemo(function() {
                            return {
                                reference: V,
                                floating: z,
                                setReference: P,
                                setFloating: k
                            }
                        }, [P, k]), $ = U.useMemo(function() {
                            return {
                                reference: W,
                                floating: F
                            }
                        }, [W, F]), Z = U.useMemo(function() {
                            var t = {
                                position: s,
                                left: 0,
                                top: 0
                            };
                            if (!$.floating) return t;
                            var n = ay($.floating, E.x),
                                r = ay($.floating, E.y);
                            return g ? o6(o8(o6({}, t), {
                                transform: "translate(" + n + "px, " + r + "px)"
                            }), am($.floating) >= 1.5 && {
                                willChange: "transform"
                            }) : {
                                position: s,
                                left: n,
                                top: r
                            }
                        }, [s, g, $.floating, E.x, E.y]), U.useMemo(function() {
                            return o8(o6({}, E), {
                                update: X,
                                refs: q,
                                elements: $,
                                floatingStyles: Z
                            })
                        }, [E, X, q, $, Z])),
                        ez = eV.refs,
                        eK = eV.floatingStyles,
                        eB = eV.placement,
                        eH = eV.isPositioned,
                        eY = eV.middlewareData,
                        eG = aL(ll(eB), 2),
                        eX = eG[0],
                        eQ = eG[1],
                        eq = o$(eN);
                    oZ(function() {
                        eH && (null == eq || eq())
                    }, [eH, eq]);
                    var e$ = null == (J = eY.arrow) ? void 0 : J.x,
                        eZ = null == (ee = eY.arrow) ? void 0 : ee.y,
                        eJ = 0 !== (null == (et = eY.arrow) ? void 0 : et.centerOffset),
                        e0 = aL(U.useState(), 2),
                        e1 = e0[0],
                        e2 = e0[1];
                    return oZ(function() {
                        eC && e2(window.getComputedStyle(eC).zIndex)
                    }, [eC]), (0, j.jsx)("div", {
                        ref: ez.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: a_(aI(a_({}, eK), {
                            transform: eH ? eK.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: e1,
                            "--radix-popper-transform-origin": [null == (en = eY.transformOrigin) ? void 0 : en.x, null == (er = eY.transformOrigin) ? void 0 : er.y].join(" ")
                        }), (null == (eo = eY.hide) ? void 0 : eo.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: t.dir,
                        children: (0, j.jsx)(le, {
                            scope: eu,
                            placedSide: eX,
                            onArrowChange: eR,
                            arrowX: e$,
                            arrowY: eZ,
                            shouldHideArrow: eJ,
                            children: (0, j.jsx)(uK.div, aI(a_({
                                "data-side": eX,
                                "data-align": eQ
                            }, eA), {
                                ref: eI,
                                style: aI(a_({}, eA.style), {
                                    animation: eH ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            ln.displayName = u7;
            var lr = "PopperArrow",
                lo = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                li = U.forwardRef(function(t, n) {
                    var r, o = t.__scopePopper,
                        i = aD(t, ["__scopePopper"]),
                        a = lt(lr, o),
                        u = lo[a.placedSide];
                    return (0, j.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (aC(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, u, 0), aC(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), aC(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), aC(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, j.jsx)(u$, aI(a_({}, i), {
                            ref: n,
                            style: aI(a_({}, i.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function la(t) {
                return null !== t
            }
            li.displayName = lr;
            var lu = function(t) {
                return {
                    name: "transformOrigin",
                    options: t,
                    fn: function(n) {
                        var r, o, i, a, u, l = n.placement,
                            c = n.rects,
                            s = n.middlewareData,
                            f = 0 !== (null == (r = s.arrow) ? void 0 : r.centerOffset),
                            d = f ? 0 : t.arrowWidth,
                            p = f ? 0 : t.arrowHeight,
                            v = aL(ll(l), 2),
                            h = v[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [v[1]],
                            y = (null != (a = null == (o = s.arrow) ? void 0 : o.x) ? a : 0) + d / 2,
                            b = (null != (u = null == (i = s.arrow) ? void 0 : i.y) ? u : 0) + p / 2,
                            g = "",
                            S = "";
                        return "bottom" === h ? (g = f ? m : "".concat(y, "px"), S = -p + "px") : "top" === h ? (g = f ? m : "".concat(y, "px"), S = "".concat(c.floating.height + p, "px")) : "right" === h ? (g = -p + "px", S = f ? m : "".concat(b, "px")) : "left" === h && (g = "".concat(c.floating.width + p, "px"), S = f ? m : "".concat(b, "px")), {
                            data: {
                                x: g,
                                y: S
                            }
                        }
                    }
                }
            };

            function ll(t) {
                var n = aL(t.split("-"), 2),
                    r = n[0],
                    o = n[1];
                return [r, void 0 === o ? "center" : o]
            }
            var lc = U.forwardRef(function(t, n) {
                return (0, j.jsx)(uK.span, aI(a_({}, t), {
                    ref: n,
                    style: a_({
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
                    }, t.style)
                }))
            });
            lc.displayName = "VisuallyHidden";
            var ls = aL(oX("Tooltip", [u1]), 2),
                lf = ls[0],
                ld = (ls[1], u1()),
                lp = "TooltipProvider",
                lv = "tooltip.open",
                lh = aL(lf(lp), 2),
                lm = lh[0],
                ly = lh[1],
                lb = function(t) {
                    var n = t.__scopeTooltip,
                        r = t.delayDuration,
                        o = t.skipDelayDuration,
                        i = void 0 === o ? 300 : o,
                        a = t.disableHoverableContent,
                        u = t.children,
                        l = aL(U.useState(!0), 2),
                        c = l[0],
                        s = l[1],
                        f = U.useRef(!1),
                        d = U.useRef(0);
                    return U.useEffect(function() {
                        var t = d.current;
                        return function() {
                            return window.clearTimeout(t)
                        }
                    }, []), (0, j.jsx)(lm, {
                        scope: n,
                        isOpenDelayed: c,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: U.useCallback(function() {
                            window.clearTimeout(d.current), s(!1)
                        }, []),
                        onClose: U.useCallback(function() {
                            window.clearTimeout(d.current), d.current = window.setTimeout(function() {
                                return s(!0)
                            }, i)
                        }, [i]),
                        isPointerInTransitRef: f,
                        onPointerInTransitChange: U.useCallback(function(t) {
                            f.current = t
                        }, []),
                        disableHoverableContent: void 0 !== a && a,
                        children: u
                    })
                };
            lb.displayName = lp;
            var lg = "Tooltip",
                lS = aL(lf(lg), 2),
                lw = lS[0],
                lO = lS[1],
                lE = function(t) {
                    var n, r, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g, S, w, O, E = t.__scopeTooltip,
                        N = t.children,
                        A = t.open,
                        x = t.defaultOpen,
                        T = t.onOpenChange,
                        C = t.disableHoverableContent,
                        _ = t.delayDuration,
                        I = ly(lg, t.__scopeTooltip),
                        D = ld(E),
                        L = aL(U.useState(null), 2),
                        R = L[0],
                        P = L[1],
                        k = (o = (r = aL(U.useState(uQ()), 2))[0], i = r[1], oZ(function() {
                            i(function(t) {
                                return null != t ? t : String(uq++)
                            })
                        }, [n]), n || (o ? "radix-".concat(o) : "")),
                        M = U.useRef(0),
                        W = null != C ? C : I.disableHoverableContent,
                        F = null != _ ? _ : I.delayDuration,
                        V = U.useRef(!1),
                        z = aL((u = (a = {
                            prop: A,
                            defaultProp: void 0 !== x && x,
                            onChange: function(t) {
                                t ? (I.onOpen(), document.dispatchEvent(new CustomEvent(lv))) : I.onClose(), null == T || T(t)
                            }
                        }).prop, b = (y = oz((f = (s = {
                            defaultProp: a.defaultProp,
                            onChange: c = void 0 === (l = a.onChange) ? function() {} : l
                        }).defaultProp, d = s.onChange, v = oz(p = U.useState(f), 1)[0], h = U.useRef(v), m = o$(d), U.useEffect(function() {
                            h.current !== v && (m(v), h.current = v)
                        }, [v, h, m]), p), 2))[0], g = y[1], w = (S = void 0 !== u) ? u : b, O = o$(c), [w, U.useCallback(function(t) {
                            if (S) {
                                var n = "function" == typeof t ? t(u) : t;
                                n !== u && O(n)
                            } else g(t)
                        }, [S, u, g, O])]), 2),
                        K = z[0],
                        B = void 0 !== K && K,
                        H = z[1],
                        Y = U.useMemo(function() {
                            return B ? V.current ? "delayed-open" : "instant-open" : "closed"
                        }, [B]),
                        G = U.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, V.current = !1, H(!0)
                        }, [H]),
                        X = U.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, H(!1)
                        }, [H]),
                        Q = U.useCallback(function() {
                            window.clearTimeout(M.current), M.current = window.setTimeout(function() {
                                V.current = !0, H(!0), M.current = 0
                            }, F)
                        }, [F, H]);
                    return U.useEffect(function() {
                        return function() {
                            M.current && (window.clearTimeout(M.current), M.current = 0)
                        }
                    }, []), (0, j.jsx)(u5, aI(a_({}, D), {
                        children: (0, j.jsx)(lw, {
                            scope: E,
                            contentId: k,
                            open: B,
                            stateAttribute: Y,
                            trigger: R,
                            onTriggerChange: P,
                            onTriggerEnter: U.useCallback(function() {
                                I.isOpenDelayed ? Q() : G()
                            }, [I.isOpenDelayed, Q, G]),
                            onTriggerLeave: U.useCallback(function() {
                                W ? X() : (window.clearTimeout(M.current), M.current = 0)
                            }, [X, W]),
                            onOpen: G,
                            onClose: X,
                            disableHoverableContent: W,
                            children: N
                        })
                    }))
                };
            lE.displayName = lg;
            var lN = "TooltipTrigger",
                lA = U.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = aD(t, ["__scopeTooltip"]),
                        i = lO(lN, r),
                        a = ly(lN, r),
                        u = ld(r),
                        l = oG(n, U.useRef(null), i.onTriggerChange),
                        c = U.useRef(!1),
                        s = U.useRef(!1),
                        f = U.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return U.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", f)
                        }
                    }, [f]), (0, j.jsx)(u8, aI(a_({
                        asChild: !0
                    }, u), {
                        children: (0, j.jsx)(uK.button, aI(a_({
                            "aria-describedby": i.open ? i.contentId : void 0,
                            "data-state": i.stateAttribute
                        }, o), {
                            ref: l,
                            onPointerMove: oq(t.onPointerMove, function(t) {
                                "touch" !== t.pointerType && (s.current || a.isPointerInTransitRef.current || (i.onTriggerEnter(), s.current = !0))
                            }),
                            onPointerLeave: oq(t.onPointerLeave, function() {
                                i.onTriggerLeave(), s.current = !1
                            }),
                            onPointerDown: oq(t.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", f, {
                                    once: !0
                                })
                            }),
                            onFocus: oq(t.onFocus, function() {
                                c.current || i.onOpen()
                            }),
                            onBlur: oq(t.onBlur, i.onClose),
                            onClick: oq(t.onClick, i.onClose)
                        }))
                    }))
                });
            lA.displayName = lN;
            var lx = aL(lf("TooltipPortal", {
                    forceMount: void 0
                }), 2),
                lT = (lx[0], lx[1]),
                lC = "TooltipContent",
                l_ = U.forwardRef(function(t, n) {
                    var r = lT(lC, t.__scopeTooltip),
                        o = t.forceMount,
                        i = void 0 === o ? r.forceMount : o,
                        a = t.side,
                        u = void 0 === a ? "top" : a,
                        l = aD(t, ["forceMount", "side"]),
                        c = lO(lC, t.__scopeTooltip);
                    return (0, j.jsx)(oJ, {
                        present: i || c.open,
                        children: c.disableHoverableContent ? (0, j.jsx)(lP, aI(a_({
                            side: u
                        }, l), {
                            ref: n
                        })) : (0, j.jsx)(lI, aI(a_({
                            side: u
                        }, l), {
                            ref: n
                        }))
                    })
                }),
                lI = U.forwardRef(function(t, n) {
                    var r = lO(lC, t.__scopeTooltip),
                        o = ly(lC, t.__scopeTooltip),
                        i = U.useRef(null),
                        a = oG(n, i),
                        u = aL(U.useState(null), 2),
                        l = u[0],
                        c = u[1],
                        s = r.trigger,
                        f = r.onClose,
                        d = i.current,
                        p = o.onPointerInTransitChange,
                        v = U.useCallback(function() {
                            c(null), p(!1)
                        }, [p]),
                        h = U.useCallback(function(t, n) {
                            var r, o, i, a, u, l, s = t.currentTarget,
                                f = {
                                    x: t.clientX,
                                    y: t.clientY
                                };
                            c(((l = aR(function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                    o = [];
                                switch (n) {
                                    case "top":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y + r
                                        }, {
                                            x: t.x + r,
                                            y: t.y + r
                                        });
                                        break;
                                    case "bottom":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y - r
                                        }, {
                                            x: t.x + r,
                                            y: t.y - r
                                        });
                                        break;
                                    case "left":
                                        o.push({
                                            x: t.x + r,
                                            y: t.y - r
                                        }, {
                                            x: t.x + r,
                                            y: t.y + r
                                        });
                                        break;
                                    case "right":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y - r
                                        }, {
                                            x: t.x - r,
                                            y: t.y + r
                                        })
                                }
                                return o
                            }(f, function(t, n) {
                                var r = Math.abs(n.top - t.y),
                                    o = Math.abs(n.bottom - t.y),
                                    i = Math.abs(n.right - t.x),
                                    a = Math.abs(n.left - t.x);
                                switch (Math.min(r, o, i, a)) {
                                    case a:
                                        return "left";
                                    case i:
                                        return "right";
                                    case r:
                                        return "top";
                                    case o:
                                        return "bottom";
                                    default:
                                        throw Error("unreachable")
                                }
                            }(f, s.getBoundingClientRect()))).concat(aR((o = (r = n.getBoundingClientRect()).top, i = r.right, a = r.bottom, [{
                                x: u = r.left,
                                y: o
                            }, {
                                x: i,
                                y: o
                            }, {
                                x: i,
                                y: a
                            }, {
                                x: u,
                                y: a
                            }]))).slice()).sort(function(t, n) {
                                return t.x < n.x ? -1 : t.x > n.x ? 1 : t.y < n.y ? -1 : +(t.y > n.y)
                            }), function(t) {
                                if (t.length <= 1) return t.slice();
                                for (var n = [], r = 0; r < t.length; r++) {
                                    for (var o = t[r]; n.length >= 2;) {
                                        var i = n[n.length - 1],
                                            a = n[n.length - 2];
                                        if (!((i.x - a.x) * (o.y - a.y) >= (i.y - a.y) * (o.x - a.x))) break;
                                        n.pop()
                                    }
                                    n.push(o)
                                }
                                n.pop();
                                for (var u = [], l = t.length - 1; l >= 0; l--) {
                                    for (var c = t[l]; u.length >= 2;) {
                                        var s = u[u.length - 1],
                                            f = u[u.length - 2];
                                        if (!((s.x - f.x) * (c.y - f.y) >= (s.y - f.y) * (c.x - f.x))) break;
                                        u.pop()
                                    }
                                    u.push(c)
                                }
                                return u.pop(), 1 === n.length && 1 === u.length && n[0].x === u[0].x && n[0].y === u[0].y ? n : n.concat(u)
                            }(l))), p(!0)
                        }, [p]);
                    return U.useEffect(function() {
                        return function() {
                            return v()
                        }
                    }, [v]), U.useEffect(function() {
                        if (s && d) {
                            var t = function(t) {
                                    return h(t, d)
                                },
                                n = function(t) {
                                    return h(t, s)
                                };
                            return s.addEventListener("pointerleave", t), d.addEventListener("pointerleave", n),
                                function() {
                                    s.removeEventListener("pointerleave", t), d.removeEventListener("pointerleave", n)
                                }
                        }
                    }, [s, d, h, v]), U.useEffect(function() {
                        if (l) {
                            var t = function(t) {
                                var n = t.target,
                                    r = {
                                        x: t.clientX,
                                        y: t.clientY
                                    },
                                    o = (null == s ? void 0 : s.contains(n)) || (null == d ? void 0 : d.contains(n)),
                                    i = ! function(t, n) {
                                        for (var r = t.x, o = t.y, i = !1, a = 0, u = n.length - 1; a < n.length; u = a++) {
                                            var l = n[a].x,
                                                c = n[a].y,
                                                s = n[u].x,
                                                f = n[u].y;
                                            c > o != f > o && r < (s - l) * (o - c) / (f - c) + l && (i = !i)
                                        }
                                        return i
                                    }(r, l);
                                o ? v() : i && (v(), f())
                            };
                            return document.addEventListener("pointermove", t),
                                function() {
                                    return document.removeEventListener("pointermove", t)
                                }
                        }
                    }, [s, d, l, f, v]), (0, j.jsx)(lP, aI(a_({}, t), {
                        ref: a
                    }))
                }),
                lD = aL(lf(lg, {
                    isInside: !1
                }), 2),
                lL = lD[0],
                lR = lD[1],
                lP = U.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = t.children,
                        i = t["aria-label"],
                        a = t.onEscapeKeyDown,
                        u = t.onPointerDownOutside,
                        l = aD(t, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = lO(lC, r),
                        s = ld(r),
                        f = c.onClose;
                    return U.useEffect(function() {
                        return document.addEventListener(lv, f),
                            function() {
                                return document.removeEventListener(lv, f)
                            }
                    }, [f]), U.useEffect(function() {
                        if (c.trigger) {
                            var t = function(t) {
                                var n;
                                (null == (n = t.target) ? void 0 : n.contains(c.trigger)) && f()
                            };
                            return window.addEventListener("scroll", t, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", t, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [c.trigger, f]), (0, j.jsx)(uY, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: a,
                        onPointerDownOutside: u,
                        onFocusOutside: function(t) {
                            return t.preventDefault()
                        },
                        onDismiss: f,
                        children: (0, j.jsxs)(ln, aI(a_({
                            "data-state": c.stateAttribute
                        }, s, l), {
                            ref: n,
                            style: aI(a_({}, l.style), {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, j.jsx)(ak, {
                                children: o
                            }), (0, j.jsx)(lL, {
                                scope: r,
                                isInside: !0,
                                children: (0, j.jsx)(lc, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: i || o
                                })
                            })]
                        }))
                    })
                });
            l_.displayName = lC;
            var lj = "TooltipArrow",
                lU = U.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = aD(t, ["__scopeTooltip"]),
                        i = ld(r);
                    return lR(lj, r).isInside ? null : (0, j.jsx)(li, aI(a_({}, i, o), {
                        ref: n
                    }))
                });

            function lk(t) {
                var n = t.position,
                    r = t.hasBeak,
                    o = t.title,
                    i = t.description,
                    a = t.delayDurationMs,
                    u = t.children,
                    l = t.open,
                    c = t.onOpenChange,
                    s = t.contentClassName,
                    f = aL(n.split("-"), 2),
                    d = f[0],
                    p = f[1];
                return U.createElement(lb, {
                    delayDuration: void 0 === a ? 500 : a
                }, U.createElement(lE, {
                    open: l,
                    onOpenChange: c
                }, u, U.createElement(l_, {
                    side: d,
                    align: p,
                    className: o_("bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", s),
                    sideOffset: 5,
                    style: {
                        zIndex: 1
                    }
                }, (void 0 === r || r) && U.createElement(lU, {
                    asChild: !0
                }, U.createElement("div", {
                    className: "block"
                }, U.createElement(ax, {
                    className: "color-inverse-default"
                }))), U.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, U.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), i && U.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, i)))))
            }

            function lM(t) {
                var n = t.children,
                    r = t.asChild,
                    o = t.className;
                return U.createElement(lA, {
                    asChild: r,
                    className: o
                }, n)
            }

            function lW(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function lF(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function lV(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function lz(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function lK(t) {
                return function(t) {
                    if (Array.isArray(t)) return lW(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return lW(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lW(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lB(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function lH(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            lU.displayName = lj;
            var lY = Symbol.for("react.lazy"),
                lG = U[" use ".trim().toString()];

            function lX(t) {
                var n;
                return null != t && "object" == (void 0 === t ? "undefined" : lB(t)) && "$$typeof" in t && t.$$typeof === lY && "_payload" in t && "object" == lB(n = t._payload) && null !== n && "then" in n
            }
            var lQ = ((cT = U.forwardRef(function(t, n) {
                    var r = t.children,
                        o = lz(t, ["children"]);
                    if (lX(r) && "function" == typeof lG && (r = lG(r._payload)), U.isValidElement(r)) {
                        var i, a, u, l, c = (l = null == (a = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? i.ref : (l = null == (u = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : u.get) && "isReactWarning" in l && l.isReactWarning ? i.props.ref : i.props.ref || i.ref,
                            s = function(t, n) {
                                var r = lF({}, n);
                                for (var o in n) ! function(o) {
                                    var i = t[o],
                                        a = n[o];
                                    /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        var o = a.apply(void 0, lK(n));
                                        return i.apply(void 0, lK(n)), o
                                    } : i && (r[o] = i) : "style" === o ? r[o] = lF({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                }(o);
                                return lF({}, t, r)
                            }(o, r.props);
                        return r.type !== U.Fragment && (s.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return function(t) {
                                var r = !1,
                                    o = n.map(function(n) {
                                        var o = lH(n, t);
                                        return r || "function" != typeof o || (r = !0), o
                                    });
                                if (r) return function() {
                                    for (var t = 0; t < o.length; t++) {
                                        var r = o[t];
                                        "function" == typeof r ? r() : lH(n[t], null)
                                    }
                                }
                            }
                        }(n, c) : c), U.cloneElement(r, s)
                    }
                    return U.Children.count(r) > 1 ? U.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), cC = cT, (c_ = U.forwardRef(function(t, n) {
                    var r = t.children,
                        o = lz(t, ["children"]);
                    lX(r) && "function" == typeof lG && (r = lG(r._payload));
                    var i = U.Children.toArray(r),
                        a = i.find(l$);
                    if (a) {
                        var u = a.props.children,
                            l = i.map(function(t) {
                                return t === a ? U.Children.count(u) > 1 ? U.Children.only(null) : U.isValidElement(u) ? u.props.children : null : t
                            });
                        return (0, j.jsx)(cC, lV(lF({}, o), {
                            ref: n,
                            children: U.isValidElement(u) ? U.cloneElement(u, void 0, l) : null
                        }))
                    }
                    return (0, j.jsx)(cC, lV(lF({}, o), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), c_),
                lq = Symbol("radix.slottable");

            function l$(t) {
                return U.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === lq
            }
            var lZ = "opacity-[0.5]",
                lJ = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                l0 = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-500"
                },
                l1 = {
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
                l2 = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                l4 = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                l3 = {
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
                l5 = {
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
                l6 = (0, U.forwardRef)(function(t, n) {
                    var r = t.className,
                        o = t.icon,
                        i = t.ariaLabel,
                        a = t.isDisabled,
                        u = void 0 !== a && a,
                        l = t.isCircular,
                        c = t.size,
                        s = void 0 === c ? "Large" : c,
                        f = t.variant,
                        d = void 0 === f ? "Emphasis" : f,
                        p = t.iconColor,
                        v = void 0 === p ? "Default" : p,
                        h = t.asChild,
                        m = t.children,
                        y = oC(t, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "size", "variant", "iconColor", "asChild", "children"]),
                        b = o_("foundation-web-icon-button", u ? lZ : [oI, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", lJ[s], l1[s][void 0 !== l && l ? "circular" : "square"], u ? l4[d] : l2[d], r),
                        g = k().createElement(k().Fragment, null, k().createElement(oD, null), k().createElement("span", {
                            className: o_("icon", o, l0[s], u ? l5[v][d] : l3[v][d])
                        }));
                    if (h) {
                        var S = oC(y, ["as"]),
                            w = k().Children.only(m);
                        return k().createElement(lQ, Object.assign({
                            ref: n
                        }, S, {
                            className: b,
                            "aria-label": i,
                            "aria-disabled": u || void 0
                        }), k().cloneElement(w, {}, g))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var O = y.href,
                            E = oC(y, ["as", "href"]);
                        return k().createElement("a", Object.assign({
                            ref: n
                        }, E, {
                            "aria-label": i,
                            "aria-disabled": u,
                            href: u ? void 0 : O,
                            className: b
                        }), g)
                    }
                    var N = oC(y, ["as"]);
                    return k().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, N, {
                        "aria-label": i,
                        disabled: u,
                        className: b
                    }), g)
                });
            oL("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var l8 = function(t) {
                    var n = t.width,
                        r = t.height;
                    return k().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, k().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                l7 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                l9 = k().forwardRef(function(t, n) {
                    var r = t.name,
                        o = t.size,
                        i = t.className,
                        a = (t.children, oC(t, ["name", "size", "className", "children"]));
                    return k().createElement("span", Object.assign({
                        ref: n,
                        role: "presentation",
                        className: o_("grow-0 shrink-0 basis-auto icon", r, l7[void 0 === o ? "Medium" : o], i)
                    }, a))
                });
            l9.displayName = "Icon";
            var ce = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ct = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                cn = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                cr = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                co = (0, U.forwardRef)(function(t, n) {
                    var r = t.children,
                        o = t.className,
                        i = t.style,
                        a = t.isDisabled,
                        u = void 0 !== a && a,
                        l = t.isLoading,
                        c = void 0 !== l && l,
                        s = t.icon,
                        f = t.size,
                        d = void 0 === f ? "Large" : f,
                        p = t.variant,
                        v = void 0 === p ? "Emphasis" : p,
                        h = t.asChild,
                        m = oC(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        y = o_("foundation-web-button", u ? lZ : [oI, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ct[d], u ? cr[v] : cn[v], o),
                        b = Object.assign({
                            textDecoration: "none"
                        }, i),
                        g = function(t) {
                            return k().createElement(k().Fragment, null, k().createElement(oD, null), c && k().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, k().createElement(l8, {
                                width: ce[d],
                                height: ce[d]
                            })), k().createElement("span", {
                                className: o_("flex items-center min-width-0", "Large" === d || "Medium" === d ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, s && k().createElement(l9, {
                                name: s,
                                size: d
                            }), k().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (h) {
                        var S = oC(m, ["as"]),
                            w = k().Children.only(r);
                        return k().createElement(lQ, Object.assign({
                            ref: n
                        }, S, {
                            className: y,
                            style: b,
                            "aria-disabled": u || void 0
                        }), k().cloneElement(w, {}, g(w.props.children)))
                    }
                    if ("a" === m.as) {
                        m.as;
                        var O = m.href,
                            E = oC(m, ["as", "href"]);
                        return k().createElement("a", Object.assign({
                            ref: n
                        }, E, {
                            "aria-disabled": u,
                            href: u ? void 0 : O,
                            className: y,
                            style: b
                        }), g(r))
                    }
                    var N = oC(m, ["as"]);
                    return k().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, N, {
                        disabled: u,
                        className: y,
                        style: b
                    }), g(r))
                });

            function ci(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var ca = (null == (cI = globalThis) ? void 0 : cI.document) ? U.useLayoutEffect : function() {},
                cu = U[" useId ".trim().toString()] || function() {},
                cl = 0;

            function cc(t) {
                var n, r = (n = U.useState(cu()), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != i) {
                            var a = [],
                                u = !0,
                                l = !1;
                            try {
                                for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), a.length !== n); u = !0);
                            } catch (t) {
                                l = !0, o = t
                            } finally {
                                try {
                                    u || null == i.return || i.return()
                                } finally {
                                    if (l) throw o
                                }
                            }
                            return a
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return ci(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ci(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    o = r[0],
                    i = r[1];
                return ca(function() {
                    t || i(function(t) {
                        return null != t ? t : String(cl++)
                    })
                }, [t]), t || (o ? "radix-".concat(o) : "")
            }

            function cs(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function cf(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function cd(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function cp(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        cf(t, n, r[n])
                    })
                }
                return t
            }

            function cv(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function ch(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function cm(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || cb(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cy(t) {
                return function(t) {
                    if (Array.isArray(t)) return cs(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || cb(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cb(t, n) {
                if (t) {
                    if ("string" == typeof t) return cs(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cs(t, n)
                }
            }

            function cg(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    i = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === i || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function cS(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function cw() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = cS(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : cS(n[t], null)
                        }
                    }
                }
            }

            function cO() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return U.useCallback(cw.apply(void 0, cy(n)), n)
            }
            var cE = Symbol("radix.slottable");

            function cN(t) {
                return U.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === cE
            }
            var cA = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, i, a, u, l = (o = r = "Primitive.".concat(n), (i = U.forwardRef(function(t, n) {
                        var r = t.children,
                            o = ch(t, ["children"]);
                        if (U.isValidElement(r)) {
                            var i, a, u, l = (u = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? r.ref : (u = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = cp({}, n);
                                    for (var o in n) ! function(o) {
                                        var i = t[o],
                                            a = n[o];
                                        /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            a.apply(void 0, cy(n)), i.apply(void 0, cy(n))
                                        } : i && (r[o] = i) : "style" === o ? r[o] = cp({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                    }(o);
                                    return cp({}, t, r)
                                }(o, r.props);
                            return r.type !== U.Fragment && (c.ref = n ? cw(n, l) : l), U.cloneElement(r, c)
                        }
                        return U.Children.count(r) > 1 ? U.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), a = i, (u = U.forwardRef(function(t, n) {
                        var r = t.children,
                            o = ch(t, ["children"]),
                            i = U.Children.toArray(r),
                            u = i.find(cN);
                        if (u) {
                            var l = u.props.children,
                                c = i.map(function(t) {
                                    return t === u ? U.Children.count(l) > 1 ? U.Children.only(null) : U.isValidElement(l) ? l.props.children : null : t
                                });
                            return (0, j.jsx)(a, cv(cp({}, o), {
                                ref: n,
                                children: U.isValidElement(l) ? U.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, j.jsx)(a, cv(cp({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), u),
                    c = U.forwardRef(function(t, r) {
                        var o = t.asChild,
                            i = ch(t, ["asChild"]),
                            a = o ? l : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(a, cv(cp({}, i), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(n), cv(cp({}, t), cf({}, n, c))
            }, {});

            function cx(t) {
                var n = U.useRef(t);
                return U.useEffect(function() {
                    n.current = t
                }), U.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(cy(o)))
                    }
                }, [])
            }
            var cT, cC, c_, cI, cD, cL, cR = "dismissableLayer.update",
                cP = U.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                cj = U.forwardRef(function(t, n) {
                    var r, o, i = t.disableOutsidePointerEvents,
                        a = void 0 !== i && i,
                        u = t.onEscapeKeyDown,
                        l = t.onPointerDownOutside,
                        c = t.onFocusOutside,
                        s = t.onInteractOutside,
                        f = t.onDismiss,
                        d = ch(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = U.useContext(cP),
                        v = cm(U.useState(null), 2),
                        h = v[0],
                        m = v[1],
                        y = null != (o = null == h ? void 0 : h.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        b = cm(U.useState({}), 2)[1],
                        g = cO(n, function(t) {
                            return m(t)
                        }),
                        S = Array.from(p.layers),
                        w = cm(cy(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        O = S.indexOf(w),
                        E = h ? S.indexOf(h) : -1,
                        N = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        A = E >= O,
                        x = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = cx(t),
                                i = U.useRef(!1),
                                a = U.useRef(function() {});
                            return U.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !i.current) {
                                            var n = function() {
                                                    ck("dismissableLayer.pointerDownOutside", o, u, {
                                                        discrete: !0
                                                    })
                                                },
                                                u = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", a.current), a.current = n, r.addEventListener("click", a.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", a.current);
                                        i.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", a.current)
                                }
                            }, [r, o]), {
                                onPointerDownCapture: function() {
                                    return i.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = cy(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            A && !r && (null == l || l(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y),
                        T = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = cx(t),
                                i = U.useRef(!1);
                            return U.useEffect(function() {
                                var t = function(t) {
                                    t.target && !i.current && ck("dismissableLayer.focusOutside", o, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, o]), {
                                onFocusCapture: function() {
                                    return i.current = !0
                                },
                                onBlurCapture: function() {
                                    return i.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            cy(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == c || c(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y);
                    return function(t) {
                        var n, r, o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            i = (r = U.useRef(t), U.useEffect(function() {
                                r.current = t
                            }), U.useMemo(function() {
                                return function() {
                                    for (var t, n = arguments.length, o = Array(n), i = 0; i < n; i++) o[i] = arguments[i];
                                    return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(cy(o)))
                                }
                            }, []));
                        U.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && i(t)
                            };
                            return o.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return o.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [i, o])
                    }(function(t) {
                        E === p.layers.size - 1 && (null == u || u(t), !t.defaultPrevented && f && (t.preventDefault(), f()))
                    }, y), U.useEffect(function() {
                        if (h) return a && (0 === p.layersWithOutsidePointerEventsDisabled.size && (cL = y.body.style.pointerEvents, y.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(h)), p.layers.add(h), cU(),
                            function() {
                                a && 1 === p.layersWithOutsidePointerEventsDisabled.size && (y.body.style.pointerEvents = cL)
                            }
                    }, [h, y, a, p]), U.useEffect(function() {
                        return function() {
                            h && (p.layers.delete(h), p.layersWithOutsidePointerEventsDisabled.delete(h), cU())
                        }
                    }, [h, p]), U.useEffect(function() {
                        var t = function() {
                            return b({})
                        };
                        return document.addEventListener(cR, t),
                            function() {
                                return document.removeEventListener(cR, t)
                            }
                    }, []), (0, j.jsx)(cA.div, cv(cp({}, d), {
                        ref: g,
                        style: cp({
                            pointerEvents: N ? A ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: cg(t.onFocusCapture, T.onFocusCapture),
                        onBlurCapture: cg(t.onBlurCapture, T.onBlurCapture),
                        onPointerDownCapture: cg(t.onPointerDownCapture, x.onPointerDownCapture)
                    }))
                });

            function cU() {
                var t = new CustomEvent(cR);
                document.dispatchEvent(t)
            }

            function ck(t, n, r, o) {
                var i = o.discrete,
                    a = r.originalEvent.target,
                    u = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && a.addEventListener(t, n, {
                    once: !0
                }), i ? a && M.flushSync(function() {
                    return a.dispatchEvent(u)
                }) : a.dispatchEvent(u)
            }

            function cM(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function cW() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = cM(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : cM(n[t], null)
                        }
                    }
                }
            }
            cj.displayName = "DismissableLayer", U.forwardRef(function(t, n) {
                var r = U.useContext(cP),
                    o = U.useRef(null),
                    i = cO(n, o);
                return U.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, j.jsx)(cA.div, cv(cp({}, t), {
                    ref: i
                }))
            }).displayName = "DismissableLayerBranch";
            var cF = Symbol("radix.slottable");

            function cV(t) {
                return U.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === cF
            }
            var cz = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, i, a, u, l = (o = r = "Primitive.".concat(n), (i = U.forwardRef(function(t, n) {
                        var r = t.children,
                            o = ch(t, ["children"]);
                        if (U.isValidElement(r)) {
                            var i, a, u, l = (u = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? r.ref : (u = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = cp({}, n);
                                    for (var o in n) ! function(o) {
                                        var i = t[o],
                                            a = n[o];
                                        /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            a.apply(void 0, cy(n)), i.apply(void 0, cy(n))
                                        } : i && (r[o] = i) : "style" === o ? r[o] = cp({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                    }(o);
                                    return cp({}, t, r)
                                }(o, r.props);
                            return r.type !== U.Fragment && (c.ref = n ? cW(n, l) : l), U.cloneElement(r, c)
                        }
                        return U.Children.count(r) > 1 ? U.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), a = i, (u = U.forwardRef(function(t, n) {
                        var r = t.children,
                            o = ch(t, ["children"]),
                            i = U.Children.toArray(r),
                            u = i.find(cV);
                        if (u) {
                            var l = u.props.children,
                                c = i.map(function(t) {
                                    return t === u ? U.Children.count(l) > 1 ? U.Children.only(null) : U.isValidElement(l) ? l.props.children : null : t
                                });
                            return (0, j.jsx)(a, cv(cp({}, o), {
                                ref: n,
                                children: U.isValidElement(l) ? U.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, j.jsx)(a, cv(cp({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), u),
                    c = U.forwardRef(function(t, r) {
                        var o = t.asChild,
                            i = ch(t, ["asChild"]),
                            a = o ? l : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(a, cv(cp({}, i), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(n), cv(cp({}, t), cf({}, n, c))
            }, {});

            function cK(t) {
                var n = U.useRef(t);
                return U.useEffect(function() {
                    n.current = t
                }), U.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(cy(o)))
                    }
                }, [])
            }
            var cB = "focusScope.autoFocusOnMount",
                cH = "focusScope.autoFocusOnUnmount",
                cY = {
                    bubbles: !1,
                    cancelable: !0
                },
                cG = U.forwardRef(function(t, n) {
                    var r = t.loop,
                        o = void 0 !== r && r,
                        i = t.trapped,
                        a = void 0 !== i && i,
                        u = t.onMountAutoFocus,
                        l = t.onUnmountAutoFocus,
                        c = ch(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        s = cm(U.useState(null), 2),
                        f = s[0],
                        d = s[1],
                        p = cK(u),
                        v = cK(l),
                        h = U.useRef(null),
                        m = function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return U.useCallback(cW.apply(void 0, cy(n)), n)
                        }(n, function(t) {
                            return d(t)
                        }),
                        y = U.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    U.useEffect(function() {
                        if (a) {
                            var t = function(t) {
                                    if (!y.paused && f) {
                                        var n = t.target;
                                        f.contains(n) ? h.current = n : cq(h.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(t) {
                                    if (!y.paused && f) {
                                        var n = t.relatedTarget;
                                        null !== n && (f.contains(n) || cq(h.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                            var r = new MutationObserver(function(t) {
                                var n = !0,
                                    r = !1,
                                    o = void 0;
                                if (document.activeElement === document.body) try {
                                    for (var i, a = t[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) i.value.removedNodes.length > 0 && cq(f)
                                } catch (t) {
                                    r = !0, o = t
                                } finally {
                                    try {
                                        n || null == a.return || a.return()
                                    } finally {
                                        if (r) throw o
                                    }
                                }
                            });
                            return f && r.observe(f, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), r.disconnect()
                                }
                        }
                    }, [a, f, y.paused]), U.useEffect(function() {
                        if (f) {
                            c$.add(y);
                            var t = document.activeElement;
                            if (!f.contains(t)) {
                                var n = new CustomEvent(cB, cY);
                                f.addEventListener(cB, p), f.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = n.select,
                                        o = void 0 !== r && r,
                                        i = document.activeElement,
                                        a = !0,
                                        u = !1,
                                        l = void 0;
                                    try {
                                        for (var c, s = t[Symbol.iterator](); !(a = (c = s.next()).done); a = !0) {
                                            var f = c.value;
                                            if (cq(f, {
                                                    select: o
                                                }), document.activeElement !== i) return
                                        }
                                    } catch (t) {
                                        u = !0, l = t
                                    } finally {
                                        try {
                                            a || null == s.return || s.return()
                                        } finally {
                                            if (u) throw l
                                        }
                                    }
                                }(cX(f).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && cq(f))
                            }
                            return function() {
                                f.removeEventListener(cB, p), setTimeout(function() {
                                    var n = new CustomEvent(cH, cY);
                                    f.addEventListener(cH, v), f.dispatchEvent(n), n.defaultPrevented || cq(null != t ? t : document.body, {
                                        select: !0
                                    }), f.removeEventListener(cH, v), c$.remove(y)
                                }, 0)
                            }
                        }
                    }, [f, p, v, y]);
                    var b = U.useCallback(function(t) {
                        if ((o || a) && !y.paused) {
                            var n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                r = document.activeElement;
                            if (n && r) {
                                var i, u = t.currentTarget,
                                    l = cm([cQ(i = cX(u), u), cQ(i.reverse(), u)], 2),
                                    c = l[0],
                                    s = l[1];
                                c && s ? t.shiftKey || r !== s ? t.shiftKey && r === c && (t.preventDefault(), o && cq(s, {
                                    select: !0
                                })) : (t.preventDefault(), o && cq(c, {
                                    select: !0
                                })) : r === u && t.preventDefault()
                            }
                        }
                    }, [o, a, y.paused]);
                    return (0, j.jsx)(cz.div, cv(cp({
                        tabIndex: -1
                    }, c), {
                        ref: m,
                        onKeyDown: b
                    }))
                });

            function cX(t) {
                for (var n = [], r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var n = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) n.push(r.currentNode);
                return n
            }

            function cQ(t, n) {
                var r = !0,
                    o = !1,
                    i = void 0;
                try {
                    for (var a, u = t[Symbol.iterator](); !(r = (a = u.next()).done); r = !0) {
                        var l = a.value;
                        if (! function(t, n) {
                                var r = n.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === r || t !== r);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: n
                            })) return l
                    }
                } catch (t) {
                    o = !0, i = t
                } finally {
                    try {
                        r || null == u.return || u.return()
                    } finally {
                        if (o) throw i
                    }
                }
            }

            function cq(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.select;
                if (t && t.focus) {
                    var o, i = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== i && cd(o = t, HTMLInputElement) && "select" in o && void 0 !== r && r && t.select()
                }
            }
            cG.displayName = "FocusScope";
            var c$ = (sb = [], {
                add: function(t) {
                    var n = sb[0];
                    t !== n && (null == n || n.pause()), (sb = cZ(sb, t)).unshift(t)
                },
                remove: function(t) {
                    var n;
                    null == (n = (sb = cZ(sb, t))[0]) || n.resume()
                }
            });

            function cZ(t, n) {
                var r = cy(t),
                    o = r.indexOf(n);
                return -1 !== o && r.splice(o, 1), r
            }

            function cJ(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var c0 = Symbol("radix.slottable");

            function c1(t) {
                return U.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === c0
            }
            var c2 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, i, a, u, l = (o = r = "Primitive.".concat(n), (i = U.forwardRef(function(t, n) {
                            var r = t.children,
                                o = ch(t, ["children"]);
                            if (U.isValidElement(r)) {
                                var i, a, u, l = (u = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? r.ref : (u = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = cp({}, n);
                                        for (var o in n) ! function(o) {
                                            var i = t[o],
                                                a = n[o];
                                            /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                a.apply(void 0, cy(n)), i.apply(void 0, cy(n))
                                            } : i && (r[o] = i) : "style" === o ? r[o] = cp({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                        }(o);
                                        return cp({}, t, r)
                                    }(o, r.props);
                                return r.type !== U.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = cJ(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : cJ(n[t], null)
                                            }
                                        }
                                    }
                                }(n, l) : l), U.cloneElement(r, c)
                            }
                            return U.Children.count(r) > 1 ? U.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), a = i, (u = U.forwardRef(function(t, n) {
                            var r = t.children,
                                o = ch(t, ["children"]),
                                i = U.Children.toArray(r),
                                u = i.find(c1);
                            if (u) {
                                var l = u.props.children,
                                    c = i.map(function(t) {
                                        return t === u ? U.Children.count(l) > 1 ? U.Children.only(null) : U.isValidElement(l) ? l.props.children : null : t
                                    });
                                return (0, j.jsx)(a, cv(cp({}, o), {
                                    ref: n,
                                    children: U.isValidElement(l) ? U.cloneElement(l, void 0, c) : null
                                }))
                            }
                            return (0, j.jsx)(a, cv(cp({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), u),
                        c = U.forwardRef(function(t, r) {
                            var o = t.asChild,
                                i = ch(t, ["asChild"]),
                                a = o ? l : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(a, cv(cp({}, i), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), cv(cp({}, t), cf({}, n, c))
                }, {}),
                c4 = (null == (cD = globalThis) ? void 0 : cD.document) ? U.useLayoutEffect : function() {},
                c3 = U.forwardRef(function(t, n) {
                    var r, o, i = t.container,
                        a = ch(t, ["container"]),
                        u = cm(U.useState(!1), 2),
                        l = u[0],
                        c = u[1];
                    c4(function() {
                        return c(!0)
                    }, []);
                    var s = i || l && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
                    return s ? W().createPortal((0, j.jsx)(c2.div, cv(cp({}, a), {
                        ref: n
                    })), s) : null
                });
            c3.displayName = "Portal";
            var c5 = 0;

            function c6() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }
            var c8 = "right-scroll-bar-position",
                c7 = "width-before-scroll-bar";

            function c9(t, n) {
                return "function" == typeof t ? t(n) : t && (t.current = n), t
            }
            var se = "undefined" != typeof window ? U.useLayoutEffect : U.useEffect,
                st = new WeakMap,
                sn = function(t) {
                    var n = t.sideCar,
                        r = oC(t, ["sideCar"]);
                    if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var o = n.read();
                    if (!o) throw Error("Sidecar medium not found");
                    return U.createElement(o, oT({}, r))
                };
            sn.isSideCarExport = !0;
            var sr = (void 0 === sg && (sg = {}), (void 0 === sS && (sS = function(t) {
                    return t
                }), sw = [], sO = !1, sE = {
                    read: function() {
                        if (sO) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return sw.length ? sw[sw.length - 1] : null
                    },
                    useMedium: function(t) {
                        var n = sS(t, sO);
                        return sw.push(n),
                            function() {
                                sw = sw.filter(function(t) {
                                    return t !== n
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (sO = !0; sw.length;) {
                            var n = sw;
                            sw = [], n.forEach(t)
                        }
                        sw = {
                            push: function(n) {
                                return t(n)
                            },
                            filter: function() {
                                return sw
                            }
                        }
                    },
                    assignMedium: function(t) {
                        sO = !0;
                        var n = [];
                        if (sw.length) {
                            var r = sw;
                            sw = [], r.forEach(t), n = sw
                        }
                        var o = function() {
                                var r = n;
                                n = [], r.forEach(t)
                            },
                            i = function() {
                                return Promise.resolve().then(o)
                            };
                        i(), sw = {
                            push: function(t) {
                                n.push(t), i()
                            },
                            filter: function(t) {
                                return n = n.filter(t), sw
                            }
                        }
                    }
                }).options = oT({
                    async: !0,
                    ssr: !1
                }, sg), sE),
                so = function() {},
                si = U.forwardRef(function(t, n) {
                    var r, o, i, a, u = U.useRef(null),
                        l = U.useState({
                            onScrollCapture: so,
                            onWheelCapture: so,
                            onTouchMoveCapture: so
                        }),
                        c = l[0],
                        s = l[1],
                        f = t.forwardProps,
                        d = t.children,
                        p = t.className,
                        v = t.removeScrollBar,
                        h = t.enabled,
                        m = t.shards,
                        y = t.sideCar,
                        b = t.noIsolation,
                        g = t.inert,
                        S = t.allowPinchZoom,
                        w = t.as,
                        O = t.gapMode,
                        E = oC(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        N = (r = [u, n], o = function(t) {
                            return r.forEach(function(n) {
                                return c9(n, t)
                            })
                        }, (i = (0, U.useState)(function() {
                            return {
                                value: null,
                                callback: o,
                                facade: {
                                    get current() {
                                        return i.value
                                    },
                                    set current(e) {
                                        var t = i.value;
                                        t !== e && (i.value = e, i.callback(e, t))
                                    }
                                }
                            }
                        })[0]).callback = o, a = i.facade, se(function() {
                            var t = st.get(a);
                            if (t) {
                                var n = new Set(t),
                                    o = new Set(r),
                                    i = a.current;
                                n.forEach(function(t) {
                                    o.has(t) || c9(t, null)
                                }), o.forEach(function(t) {
                                    n.has(t) || c9(t, i)
                                })
                            }
                            st.set(a, r)
                        }, [r]), a),
                        A = oT(oT({}, E), c);
                    return U.createElement(U.Fragment, null, h && U.createElement(y, {
                        sideCar: sr,
                        removeScrollBar: v,
                        shards: m,
                        noIsolation: b,
                        inert: g,
                        setCallbacks: s,
                        allowPinchZoom: !!S,
                        lockRef: u,
                        gapMode: O
                    }), f ? U.cloneElement(U.Children.only(d), oT(oT({}, A), {
                        ref: N
                    })) : U.createElement(void 0 === w ? "div" : w, oT({}, A, {
                        className: p,
                        ref: N
                    }), d))
                });
            si.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, si.classNames = {
                fullWidth: c7,
                zeroRight: c8
            };
            var sa = function() {
                    var t = 0,
                        n = null;
                    return {
                        add: function(o) {
                            var i, a;
                            0 == t && (n = function() {
                                if (!document) return null;
                                var t = document.createElement("style");
                                t.type = "text/css";
                                var n = r.nc;
                                return n && t.setAttribute("nonce", n), t
                            }()) && ((i = n).styleSheet ? i.styleSheet.cssText = o : i.appendChild(document.createTextNode(o)), a = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(a)), t++
                        },
                        remove: function() {
                            --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                        }
                    }
                },
                su = function() {
                    var t, n = (t = sa(), function(n, r) {
                        U.useEffect(function() {
                            return t.add(n),
                                function() {
                                    t.remove()
                                }
                        }, [n && r])
                    });
                    return function(t) {
                        return n(t.styles, t.dynamic), null
                    }
                },
                sl = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                sc = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                ss = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return sl;
                    var n, r, o, i, a, u = (n = t, o = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], i = r["padding" === n ? "paddingTop" : "marginTop"], a = r["padding" === n ? "paddingRight" : "marginRight"], [sc(o), sc(i), sc(a)]),
                        l = document.documentElement.clientWidth,
                        c = window.innerWidth;
                    return {
                        left: u[0],
                        top: u[1],
                        right: u[2],
                        gap: Math.max(0, c - l + u[2] - u[0])
                    }
                },
                sf = su(),
                sd = "data-scroll-locked",
                sp = function(t, n, r, o) {
                    var i = t.left,
                        a = t.top,
                        u = t.right,
                        l = t.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(o, ";\n   padding-right: ").concat(l, "px ").concat(o, ";\n  }\n  body[").concat(sd, "] {\n    overflow: hidden ").concat(o, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(o, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(u, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(o, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(o, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(c8, " {\n    right: ").concat(l, "px ").concat(o, ";\n  }\n  \n  .").concat(c7, " {\n    margin-right: ").concat(l, "px ").concat(o, ";\n  }\n  \n  .").concat(c8, " .").concat(c8, " {\n    right: 0 ").concat(o, ";\n  }\n  \n  .").concat(c7, " .").concat(c7, " {\n    margin-right: 0 ").concat(o, ";\n  }\n  \n  body[").concat(sd, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                sv = function() {
                    var t = parseInt(document.body.getAttribute(sd) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                sh = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        o = t.gapMode,
                        i = void 0 === o ? "margin" : o;
                    U.useEffect(function() {
                        return document.body.setAttribute(sd, (sv() + 1).toString()),
                            function() {
                                var t = sv() - 1;
                                t <= 0 ? document.body.removeAttribute(sd) : document.body.setAttribute(sd, t.toString())
                            }
                    }, []);
                    var a = U.useMemo(function() {
                        return ss(i)
                    }, [i]);
                    return U.createElement(sf, {
                        styles: sp(a, !n, i, r ? "" : "!important")
                    })
                },
                sm = !1;
            if ("undefined" != typeof window) try {
                var sy = Object.defineProperty({}, "passive", {
                    get: function() {
                        return sm = !0, !0
                    }
                });
                window.addEventListener("test", sy, sy), window.removeEventListener("test", sy, sy)
            } catch (t) {
                sm = !1
            }
            var sb, sg, sS, sw, sO, sE, sN, sA = !!sm && {
                    passive: !1
                },
                sx = function(t, n) {
                    if (!cd(t, Element)) return !1;
                    var r = window.getComputedStyle(t);
                    return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
                },
                sT = function(t, n) {
                    var r = n.ownerDocument,
                        o = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && cd(o, ShadowRoot) && (o = o.host), sC(t, o)) {
                            var i = s_(t, o);
                            if (i[1] > i[2]) return !0
                        }
                        o = o.parentNode
                    } while (o && o !== r.body);
                    return !1
                },
                sC = function(t, n) {
                    return "v" === t ? sx(n, "overflowY") : sx(n, "overflowX")
                },
                s_ = function(t, n) {
                    return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
                },
                sI = function(t, n, r, o, i) {
                    var a, u = (a = window.getComputedStyle(n).direction, "h" === t && "rtl" === a ? -1 : 1),
                        l = u * o,
                        c = r.target,
                        s = n.contains(c),
                        f = !1,
                        d = l > 0,
                        p = 0,
                        v = 0;
                    do {
                        var h = s_(t, c),
                            m = h[0],
                            y = h[1] - h[2] - u * m;
                        (m || y) && sC(t, c) && (p += y, v += m), c = cd(c, ShadowRoot) ? c.host : c.parentNode
                    } while (!s && c !== document.body || s && (n.contains(c) || n === c));
                    return (d && (i && 1 > Math.abs(p) || !i && l > p) || !d && (i && 1 > Math.abs(v) || !i && -l > v)) && (f = !0), f
                },
                sD = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                sL = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                sR = function(t) {
                    return t && "current" in t ? t.current : t
                },
                sP = 0,
                sj = [],
                sU = (sN = function(t) {
                    var n = U.useRef([]),
                        r = U.useRef([0, 0]),
                        o = U.useRef(),
                        i = U.useState(sP++)[0],
                        a = U.useState(su)[0],
                        u = U.useRef(t);
                    U.useEffect(function() {
                        u.current = t
                    }, [t]), U.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var n = (function(t, n, r) {
                                if (r || 2 == arguments.length)
                                    for (var o, i = 0, a = n.length; i < a; i++) !o && i in n || (o || (o = Array.prototype.slice.call(n, 0, i)), o[i] = n[i]);
                                return t.concat(o || Array.prototype.slice.call(n))
                            })([t.lockRef.current], (t.shards || []).map(sR), !0).filter(Boolean);
                            return n.forEach(function(t) {
                                    return t.classList.add("allow-interactivity-".concat(i))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(i)), n.forEach(function(t) {
                                        return t.classList.remove("allow-interactivity-".concat(i))
                                    })
                                }
                        }
                    }, [t.inert, t.lockRef.current, t.shards]);
                    var l = U.useCallback(function(t, n) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !u.current.allowPinchZoom;
                            var i, a = sD(t),
                                l = r.current,
                                c = "deltaX" in t ? t.deltaX : l[0] - a[0],
                                s = "deltaY" in t ? t.deltaY : l[1] - a[1],
                                f = t.target,
                                d = Math.abs(c) > Math.abs(s) ? "h" : "v";
                            if ("touches" in t && "h" === d && "range" === f.type) return !1;
                            var p = sT(d, f);
                            if (!p) return !0;
                            if (p ? i = d : (i = "v" === d ? "h" : "v", p = sT(d, f)), !p) return !1;
                            if (!o.current && "changedTouches" in t && (c || s) && (o.current = i), !i) return !0;
                            var v = o.current || i;
                            return sI(v, n, t, "h" === v ? c : s, !0)
                        }, []),
                        c = U.useCallback(function(t) {
                            if (sj.length && sj[sj.length - 1] === a) {
                                var r = "deltaY" in t ? sL(t) : sD(t),
                                    o = n.current.filter(function(n) {
                                        var o;
                                        return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (o = n.delta, o[0] === r[0] && o[1] === r[1])
                                    })[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var i = (u.current.shards || []).map(sR).filter(Boolean).filter(function(n) {
                                        return n.contains(t.target)
                                    });
                                    (i.length > 0 ? l(t, i[0]) : !u.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        s = U.useCallback(function(t, r, o, i) {
                            var a = {
                                name: t,
                                delta: r,
                                target: o,
                                should: i,
                                shadowParent: function(t) {
                                    for (var n = null; null !== t;) cd(t, ShadowRoot) && (n = t.host, t = t.host), t = t.parentNode;
                                    return n
                                }(o)
                            };
                            n.current.push(a), setTimeout(function() {
                                n.current = n.current.filter(function(t) {
                                    return t !== a
                                })
                            }, 1)
                        }, []),
                        f = U.useCallback(function(t) {
                            r.current = sD(t), o.current = void 0
                        }, []),
                        d = U.useCallback(function(n) {
                            s(n.type, sL(n), n.target, l(n, t.lockRef.current))
                        }, []),
                        p = U.useCallback(function(n) {
                            s(n.type, sD(n), n.target, l(n, t.lockRef.current))
                        }, []);
                    U.useEffect(function() {
                        return sj.push(a), t.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, sA), document.addEventListener("touchmove", c, sA), document.addEventListener("touchstart", f, sA),
                            function() {
                                sj = sj.filter(function(t) {
                                    return t !== a
                                }), document.removeEventListener("wheel", c, sA), document.removeEventListener("touchmove", c, sA), document.removeEventListener("touchstart", f, sA)
                            }
                    }, []);
                    var v = t.removeScrollBar,
                        h = t.inert;
                    return U.createElement(U.Fragment, null, h ? U.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, v ? U.createElement(sh, {
                        gapMode: t.gapMode
                    }) : null)
                }, sr.useMedium(sN), sn),
                sk = U.forwardRef(function(t, n) {
                    return U.createElement(si, oT({}, t, {
                        ref: n,
                        sideCar: sU
                    }))
                });
            sk.classNames = si.classNames;
            var sM = new WeakMap,
                sW = new WeakMap,
                sF = {},
                sV = 0,
                sz = function(t) {
                    return t && (t.host || sz(t.parentNode))
                },
                sK = function(t, n, r, o) {
                    var i = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (n.contains(t)) return t;
                        var r = sz(t);
                        return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    sF[r] || (sF[r] = new WeakMap);
                    var a = sF[r],
                        u = [],
                        l = new Set,
                        c = new Set(i),
                        s = function(t) {
                            t && !l.has(t) && (l.add(t), s(t.parentNode))
                        };
                    i.forEach(s);
                    var f = function(t) {
                        t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (l.has(t)) f(t);
                            else try {
                                var n = t.getAttribute(o),
                                    i = null !== n && "false" !== n,
                                    c = (sM.get(t) || 0) + 1,
                                    s = (a.get(t) || 0) + 1;
                                sM.set(t, c), a.set(t, s), u.push(t), 1 === c && i && sW.set(t, !0), 1 === s && t.setAttribute(r, "true"), i || t.setAttribute(o, "true")
                            } catch (n) {
                                console.error("aria-hidden: cannot operate on ", t, n)
                            }
                        })
                    };
                    return f(n), l.clear(), sV++,
                        function() {
                            u.forEach(function(t) {
                                var n = sM.get(t) - 1,
                                    i = a.get(t) - 1;
                                sM.set(t, n), a.set(t, i), n || (sW.has(t) || t.removeAttribute(o), sW.delete(t)), i || t.removeAttribute(r)
                            }), --sV || (sM = new WeakMap, sM = new WeakMap, sW = new WeakMap, sF = {})
                        }
                },
                sB = function(t, n, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var o = Array.from(Array.isArray(t) ? t : [t]),
                        i = n || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return i ? (o.push.apply(o, Array.from(i.querySelectorAll("[aria-live]"))), sK(o, i, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function sH(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function sY(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function sG(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        sY(t, n, r[n])
                    })
                }
                return t
            }

            function sX(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function sQ(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function sq(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || sZ(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function s$(t) {
                return function(t) {
                    if (Array.isArray(t)) return sH(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || sZ(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sZ(t, n) {
                if (t) {
                    if ("string" == typeof t) return sH(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sH(t, n)
                }
            }

            function sJ(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    i = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === i || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function s0(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function s1() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = s0(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : s0(n[t], null)
                        }
                    }
                }
            }

            function s2() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return U.useCallback(s1.apply(void 0, s$(n)), n)
            }

            function s4() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var i = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                i = r.scopeName;
                            return sG({}, t, o(n)["__scope".concat(i)])
                        }, {});
                        return U.useMemo(function() {
                            return sY({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function s3(t) {
                var n = U.useRef(t);
                return U.useEffect(function() {
                    n.current = t
                }), U.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(s$(o)))
                    }
                }, [])
            }
            var s5 = (null == (u = globalThis) ? void 0 : u.document) ? U.useLayoutEffect : function() {},
                s6 = function(t) {
                    var n, r, o, i, a, u, l, c, s, f, d, p, v, h, m = t.present,
                        y = t.children,
                        b = (i = (o = sq(U.useState(), 2))[0], a = o[1], u = U.useRef({}), l = U.useRef(m), c = U.useRef("none"), f = (s = sq((n = m ? "mounted" : "unmounted", r = {
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
                        }, U.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], d = s[1], U.useEffect(function() {
                            var t = s8(u.current);
                            c.current = "mounted" === f ? t : "none"
                        }, [f]), s5(function() {
                            var t = u.current,
                                n = l.current;
                            if (n !== m) {
                                var r = c.current,
                                    o = s8(t);
                                m ? d("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), l.current = m
                            }
                        }, [m, d]), s5(function() {
                            if (i) {
                                var t, n, r = null != (n = i.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = s8(u.current).includes(n.animationName);
                                        if (n.target === i && o && (d("ANIMATION_END"), !l.current)) {
                                            var a = i.style.animationFillMode;
                                            i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                            })
                                        }
                                    },
                                    a = function(t) {
                                        t.target === i && (c.current = s8(u.current))
                                    };
                                return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", o), i.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", o), i.removeEventListener("animationend", o)
                                    }
                            }
                            d("ANIMATION_END")
                        }, [i, d]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(f),
                            ref: U.useCallback(function(t) {
                                t && (u.current = getComputedStyle(t)), a(t)
                            }, [])
                        }),
                        g = "function" == typeof y ? y({
                            present: b.isPresent
                        }) : U.Children.only(y),
                        S = s2(b.ref, (h = null == (p = Object.getOwnPropertyDescriptor(g.props, "ref")) ? void 0 : p.get) && "isReactWarning" in h && h.isReactWarning ? g.ref : (h = null == (v = Object.getOwnPropertyDescriptor(g, "ref")) ? void 0 : v.get) && "isReactWarning" in h && h.isReactWarning ? g.props.ref : g.props.ref || g.ref);
                    return "function" == typeof y || b.isPresent ? U.cloneElement(g, {
                        ref: S
                    }) : null
                };

            function s8(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function s7(t) {
                var n, r, o = (n = t, (r = U.forwardRef(function(t, n) {
                        var r = t.children,
                            o = sQ(t, ["children"]);
                        if (U.isValidElement(r)) {
                            var i, a, u, l = (u = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? r.ref : (u = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = sG({}, n);
                                    for (var o in n) ! function(o) {
                                        var i = t[o],
                                            a = n[o];
                                        /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            a.apply(void 0, s$(n)), i.apply(void 0, s$(n))
                                        } : i && (r[o] = i) : "style" === o ? r[o] = sG({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                    }(o);
                                    return sG({}, t, r)
                                }(o, r.props);
                            return r.type !== U.Fragment && (c.ref = n ? s1(n, l) : l), U.cloneElement(r, c)
                        }
                        return U.Children.count(r) > 1 ? U.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    i = U.forwardRef(function(t, n) {
                        var r = t.children,
                            i = sQ(t, ["children"]),
                            a = U.Children.toArray(r),
                            u = a.find(fe);
                        if (u) {
                            var l = u.props.children,
                                c = a.map(function(t) {
                                    return t === u ? U.Children.count(l) > 1 ? U.Children.only(null) : U.isValidElement(l) ? l.props.children : null : t
                                });
                            return (0, j.jsx)(o, sX(sG({}, i), {
                                ref: n,
                                children: U.isValidElement(l) ? U.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, j.jsx)(o, sX(sG({}, i), {
                            ref: n,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(t, ".Slot"), i
            }
            s6.displayName = "Presence";
            var s9 = Symbol("radix.slottable");

            function fe(t) {
                return U.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === s9
            }
            var ft = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = s7("Primitive.".concat(n)),
                        o = U.forwardRef(function(t, o) {
                            var i = t.asChild,
                                a = sQ(t, ["asChild"]),
                                u = i ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(u, sX(sG({}, a), {
                                ref: o
                            }))
                        });
                    return o.displayName = "Primitive.".concat(n), sX(sG({}, t), sY({}, n, o))
                }, {}),
                fn = "Dialog",
                fr = sq(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return U.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return U.useMemo(function() {
                                    return sY({}, "__scope".concat(t), sX(sG({}, r), sY({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var i = U.createContext(o),
                            a = r.length;
                        r = s$(r).concat([o]);
                        var u = function(n) {
                            var r, o = n.scope,
                                u = n.children,
                                l = sQ(n, ["scope", "children"]),
                                c = (null == o || null == (r = o[t]) ? void 0 : r[a]) || i,
                                s = U.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, j.jsx)(c.Provider, {
                                value: s,
                                children: u
                            })
                        };
                        return u.displayName = n + "Provider", [u, function(r, u) {
                            var l, c = (null == u || null == (l = u[t]) ? void 0 : l[a]) || i,
                                s = U.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, s4.apply(void 0, [o].concat(s$(n)))]
                }(fn), 2),
                fo = fr[0],
                fi = (fr[1], sq(fo(fn), 2)),
                fa = fi[0],
                fu = fi[1],
                fl = function(t) {
                    var n, r, o, i, a, u, l, c, s, f, d, p, v, h, m, y, b, g = t.__scopeDialog,
                        S = t.children,
                        w = t.open,
                        O = t.defaultOpen,
                        E = t.onOpenChange,
                        N = t.modal,
                        A = U.useRef(null),
                        x = U.useRef(null),
                        T = sq((r = (n = {
                            prop: w,
                            defaultProp: O,
                            onChange: E
                        }).prop, v = (p = sq((u = (a = {
                            defaultProp: n.defaultProp,
                            onChange: i = void 0 === (o = n.onChange) ? function() {} : o
                        }).defaultProp, l = a.onChange, s = sq(c = U.useState(u), 1)[0], f = U.useRef(s), d = s3(l), U.useEffect(function() {
                            f.current !== s && (d(s), f.current = s)
                        }, [s, f, d]), c), 2))[0], h = p[1], y = (m = void 0 !== r) ? r : v, b = s3(i), [y, U.useCallback(function(t) {
                            if (m) {
                                var n = "function" == typeof t ? t(r) : t;
                                n !== r && b(n)
                            } else h(t)
                        }, [m, r, h, b])]), 2),
                        C = T[0],
                        _ = T[1];
                    return (0, j.jsx)(fa, {
                        scope: g,
                        triggerRef: A,
                        contentRef: x,
                        contentId: cc(),
                        titleId: cc(),
                        descriptionId: cc(),
                        open: void 0 !== C && C,
                        onOpenChange: _,
                        onOpenToggle: U.useCallback(function() {
                            return _(function(t) {
                                return !t
                            })
                        }, [_]),
                        modal: void 0 === N || N,
                        children: S
                    })
                };
            fl.displayName = fn;
            var fc = "DialogTrigger";
            U.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = sQ(t, ["__scopeDialog"]),
                    i = fu(fc, r),
                    a = s2(n, i.triggerRef);
                return (0, j.jsx)(ft.button, sX(sG({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": f_(i.open)
                }, o), {
                    ref: a,
                    onClick: sJ(t.onClick, i.onOpenToggle)
                }))
            }).displayName = fc;
            var fs = "DialogPortal",
                ff = sq(fo(fs, {
                    forceMount: void 0
                }), 2),
                fd = ff[0],
                fp = ff[1],
                fv = function(t) {
                    var n = t.__scopeDialog,
                        r = t.forceMount,
                        o = t.children,
                        i = t.container,
                        a = fu(fs, n);
                    return (0, j.jsx)(fd, {
                        scope: n,
                        forceMount: r,
                        children: U.Children.map(o, function(t) {
                            return (0, j.jsx)(s6, {
                                present: r || a.open,
                                children: (0, j.jsx)(c3, {
                                    asChild: !0,
                                    container: i,
                                    children: t
                                })
                            })
                        })
                    })
                };
            fv.displayName = fs;
            var fh = "DialogOverlay",
                fm = U.forwardRef(function(t, n) {
                    var r = fp(fh, t.__scopeDialog),
                        o = t.forceMount,
                        i = void 0 === o ? r.forceMount : o,
                        a = sQ(t, ["forceMount"]),
                        u = fu(fh, t.__scopeDialog);
                    return u.modal ? (0, j.jsx)(s6, {
                        present: i || u.open,
                        children: (0, j.jsx)(fb, sX(sG({}, a), {
                            ref: n
                        }))
                    }) : null
                });
            fm.displayName = fh;
            var fy = s7("DialogOverlay.RemoveScroll"),
                fb = U.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = sQ(t, ["__scopeDialog"]),
                        i = fu(fh, r);
                    return (0, j.jsx)(sk, {
                        as: fy,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, j.jsx)(ft.div, sX(sG({
                            "data-state": f_(i.open)
                        }, o), {
                            ref: n,
                            style: sG({
                                pointerEvents: "auto"
                            }, o.style)
                        }))
                    })
                }),
                fg = "DialogContent",
                fS = U.forwardRef(function(t, n) {
                    var r = fp(fg, t.__scopeDialog),
                        o = t.forceMount,
                        i = void 0 === o ? r.forceMount : o,
                        a = sQ(t, ["forceMount"]),
                        u = fu(fg, t.__scopeDialog);
                    return (0, j.jsx)(s6, {
                        present: i || u.open,
                        children: u.modal ? (0, j.jsx)(fw, sX(sG({}, a), {
                            ref: n
                        })) : (0, j.jsx)(fO, sX(sG({}, a), {
                            ref: n
                        }))
                    })
                });
            fS.displayName = fg;
            var fw = U.forwardRef(function(t, n) {
                    var r = fu(fg, t.__scopeDialog),
                        o = U.useRef(null),
                        i = s2(n, r.contentRef, o);
                    return U.useEffect(function() {
                        var t = o.current;
                        if (t) return sB(t)
                    }, []), (0, j.jsx)(fE, sX(sG({}, t), {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: sJ(t.onCloseAutoFocus, function(t) {
                            var n;
                            t.preventDefault(), null == (n = r.triggerRef.current) || n.focus()
                        }),
                        onPointerDownOutside: sJ(t.onPointerDownOutside, function(t) {
                            var n = t.detail.originalEvent,
                                r = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || r) && t.preventDefault()
                        }),
                        onFocusOutside: sJ(t.onFocusOutside, function(t) {
                            return t.preventDefault()
                        })
                    }))
                }),
                fO = U.forwardRef(function(t, n) {
                    var r = fu(fg, t.__scopeDialog),
                        o = U.useRef(!1),
                        i = U.useRef(!1);
                    return (0, j.jsx)(fE, sX(sG({}, t), {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var a, u;
                            null == (a = t.onCloseAutoFocus) || a.call(t, n), n.defaultPrevented || (o.current || null == (u = r.triggerRef.current) || u.focus(), n.preventDefault()), o.current = !1, i.current = !1
                        },
                        onInteractOutside: function(n) {
                            null == (a = t.onInteractOutside) || a.call(t, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (i.current = !0));
                            var a, u, l = n.target;
                            (null == (u = r.triggerRef.current) ? void 0 : u.contains(l)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && i.current && n.preventDefault()
                        }
                    }))
                }),
                fE = U.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = t.trapFocus,
                        i = t.onOpenAutoFocus,
                        a = t.onCloseAutoFocus,
                        u = sQ(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = fu(fg, r),
                        c = U.useRef(null),
                        s = s2(n, c);
                    return U.useEffect(function() {
                        var t, n, r = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : c6()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : c6()), c5++,
                            function() {
                                1 === c5 && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                    return t.remove()
                                }), c5--
                            }
                    }, []), (0, j.jsxs)(j.Fragment, {
                        children: [(0, j.jsx)(cG, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: a,
                            children: (0, j.jsx)(cj, sX(sG({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": f_(l.open)
                            }, u), {
                                ref: s,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, j.jsxs)(j.Fragment, {
                            children: [(0, j.jsx)(fR, {
                                titleId: l.titleId
                            }), (0, j.jsx)(fP, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                fN = "DialogTitle",
                fA = U.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = sQ(t, ["__scopeDialog"]),
                        i = fu(fN, r);
                    return (0, j.jsx)(ft.h2, sX(sG({
                        id: i.titleId
                    }, o), {
                        ref: n
                    }))
                });
            fA.displayName = fN;
            var fx = "DialogDescription";
            U.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = sQ(t, ["__scopeDialog"]),
                    i = fu(fx, r);
                return (0, j.jsx)(ft.p, sX(sG({
                    id: i.descriptionId
                }, o), {
                    ref: n
                }))
            }).displayName = fx;
            var fT = "DialogClose",
                fC = U.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = sQ(t, ["__scopeDialog"]),
                        i = fu(fT, r);
                    return (0, j.jsx)(ft.button, sX(sG({
                        type: "button"
                    }, o), {
                        ref: n,
                        onClick: sJ(t.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function f_(t) {
                return t ? "open" : "closed"
            }
            fC.displayName = fT;
            var fI = "DialogTitleWarning",
                fD = sq((t = {
                    contentName: fg,
                    titleName: fN,
                    docsSlug: "dialog"
                }, n = U.createContext(t), (o = function(t) {
                    var r = t.children,
                        o = sQ(t, ["children"]),
                        i = U.useMemo(function() {
                            return o
                        }, Object.values(o));
                    return (0, j.jsx)(n.Provider, {
                        value: i,
                        children: r
                    })
                }).displayName = fI + "Provider", [o, function(r) {
                    var o = U.useContext(n);
                    if (o) return o;
                    if (void 0 !== t) return t;
                    throw Error("`".concat(r, "` must be used within `").concat(fI, "`"))
                }]), 2),
                fL = (fD[0], fD[1]),
                fR = function(t) {
                    var n = t.titleId,
                        r = fL(fI),
                        o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return U.useEffect(function() {
                        n && (document.getElementById(n) || console.error(o))
                    }, [o, n]), null
                },
                fP = function(t) {
                    var n = t.contentRef,
                        r = t.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(fL("DialogDescriptionWarning").contentName, "}.");
                    return U.useEffect(function() {
                        var t, i = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                        r && i && (document.getElementById(r) || console.warn(o))
                    }, [o, n, r]), null
                };

            function fj(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function fU(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function fk(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        fU(t, n, r[n])
                    })
                }
                return t
            }

            function fM(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function fW(t, n) {
                if (null == t) return {};
                var r, o, i = function(t, n) {
                    if (null == t) return {};
                    var r, o, i = {},
                        a = Object.keys(t);
                    for (o = 0; o < a.length; o++) r = a[o], n.indexOf(r) >= 0 || (i[r] = t[r]);
                    return i
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < a.length; o++) r = a[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (i[r] = t[r])
                }
                return i
            }

            function fF(t) {
                return function(t) {
                    if (Array.isArray(t)) return fj(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return fj(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fj(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fV(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var fz = Symbol("radix.slottable");

            function fK(t) {
                return U.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === fz
            }
            var fB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, i, a, u, l = (o = r = "Primitive.".concat(n), (i = U.forwardRef(function(t, n) {
                            var r = t.children,
                                o = fW(t, ["children"]);
                            if (U.isValidElement(r)) {
                                var i, a, u, l = (u = null == (i = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? r.ref : (u = null == (a = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = fk({}, n);
                                        for (var o in n) ! function(o) {
                                            var i = t[o],
                                                a = n[o];
                                            /^on[A-Z]/.test(o) ? i && a ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                var o = a.apply(void 0, fF(n));
                                                return i.apply(void 0, fF(n)), o
                                            } : i && (r[o] = i) : "style" === o ? r[o] = fk({}, i, a) : "className" === o && (r[o] = [i, a].filter(Boolean).join(" "))
                                        }(o);
                                        return fk({}, t, r)
                                    }(o, r.props);
                                return r.type !== U.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = fV(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : fV(n[t], null)
                                            }
                                        }
                                    }
                                }(n, l) : l), U.cloneElement(r, c)
                            }
                            return U.Children.count(r) > 1 ? U.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), a = i, (u = U.forwardRef(function(t, n) {
                            var r = t.children,
                                o = fW(t, ["children"]),
                                i = U.Children.toArray(r),
                                u = i.find(fK);
                            if (u) {
                                var l = u.props.children,
                                    c = i.map(function(t) {
                                        return t === u ? U.Children.count(l) > 1 ? U.Children.only(null) : U.isValidElement(l) ? l.props.children : null : t
                                    });
                                return (0, j.jsx)(a, fM(fk({}, o), {
                                    ref: n,
                                    children: U.isValidElement(l) ? U.cloneElement(l, void 0, c) : null
                                }))
                            }
                            return (0, j.jsx)(a, fM(fk({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), u),
                        c = U.forwardRef(function(t, r) {
                            var o = t.asChild,
                                i = fW(t, ["asChild"]),
                                a = o ? l : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, j.jsx)(a, fM(fk({}, i), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), fM(fk({}, t), fU({}, n, c))
                }, {}),
                fH = Object.freeze({
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
                fY = U.forwardRef(function(t, n) {
                    return (0, j.jsx)(fB.span, fM(fk({}, t), {
                        ref: n,
                        style: fk({}, fH, t.style)
                    }))
                });
            fY.displayName = "VisuallyHidden";
            var fG = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                fX = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                fQ = function(t) {
                    var n = t.variant,
                        r = t.size,
                        o = t.isCircular,
                        i = t.className,
                        a = oC(t, ["variant", "size", "isCircular", "className"]);
                    return k().createElement("button", Object.assign({
                        type: "button",
                        className: o_("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", oI, fX[n], fG[r], o && "radius-circle", i)
                    }, a), k().createElement(oD, null), k().createElement(l9, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };
            oL(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}");
            var fq = (0, U.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                f$ = function() {
                    var t = (0, U.useContext)(fq);
                    if (!t) throw Error("Dialog components must be used within a Dialog");
                    return t
                },
                fZ = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                fJ = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                f0 = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                f1 = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        o = t.children,
                        i = t.size,
                        a = t.type,
                        u = void 0 === a ? "Default" : a,
                        l = t.isModal,
                        c = t.hasCloseAffordance,
                        s = t.closeLabel,
                        f = t.hasMarginTop,
                        d = void 0 === f || f,
                        p = t.hasMarginBottom,
                        v = void 0 === p || p,
                        h = t.hasDescription,
                        m = void 0 !== h && h,
                        y = t.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== y && y,
                        g = (0, U.useMemo)(function() {
                            return {
                                size: i,
                                isModal: l,
                                type: u,
                                hasCloseAffordance: c,
                                closeLabel: s,
                                hasMarginTop: d,
                                hasMarginBottom: v,
                                hasDescription: m
                            }
                        }, [i, l, u, c, s, d, v, m]);
                    return (0, U.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, n]), k().createElement(fq.Provider, {
                        value: g
                    }, k().createElement(fl, {
                        open: n,
                        onOpenChange: r
                    }, o))
                };
            f1.displayName = "Dialog";
            var f2 = function(t) {
                var n = t.children,
                    r = t.className,
                    o = t.style,
                    i = t.overlayClassName,
                    a = t.overlayStyle,
                    u = t.onOpenAutoFocus,
                    l = oC(t, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = f$(),
                    s = c.size,
                    f = c.isModal,
                    d = c.hasCloseAffordance,
                    p = c.closeLabel,
                    v = c.hasDescription,
                    h = o_("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", f && "bg-common-backdrop", i),
                    m = o_("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return k().createElement(fv, null, k().createElement(fm, {
                    className: h,
                    style: a
                }, k().createElement(fS, Object.assign({
                    className: m,
                    "data-size": s,
                    style: o,
                    onOpenAutoFocus: u
                }, !v && {
                    "aria-describedby": void 0
                }, l), d && k().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, k().createElement(fC, {
                    asChild: !0
                }, k().createElement(fQ, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": p
                }))), n)))
            };
            f2.displayName = "DialogContent";
            var f4 = function(t) {
                var n = t.children,
                    r = t.className,
                    o = oC(t, ["children", "className"]),
                    i = f$(),
                    a = i.size,
                    u = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    c = o_(fZ[a], u && fJ[a], l && f0[a], r);
                return k().createElement("div", Object.assign({
                    className: c
                }, o), n)
            };
            f4.displayName = "DialogBody";
            var f3 = function(t) {
                var n = t.children,
                    r = t.className,
                    o = t.hidden,
                    i = oC(t, ["children", "className", "hidden"]),
                    a = k().createElement(fA, Object.assign({
                        className: r
                    }, i), n);
                return o ? k().createElement(fY, null, a) : a
            };
            f3.displayName = "DialogTitle";
            var f5 = function(t) {
                var n = t.children,
                    r = t.className,
                    o = oC(t, ["children", "className"]),
                    i = f$().size,
                    a = o_(fZ[i], f0[i], r);
                return k().createElement("div", Object.assign({
                    className: a
                }, o), n)
            };

            function f6(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function f8(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function f7(t) {
                return function(t) {
                    if (Array.isArray(t)) return f6(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return f6(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return f6(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            f5.displayName = "DialogFooter";
            var f9 = function(t, n) {
                    var r = f7(t),
                        o = [];
                    if (n) {
                        var i = t.findIndex(function(t) {
                            return t.isCurrentSession
                        });
                        o.push(t[i]), r.splice(i, 1)
                    }
                    return r = r.sort(function(t, n) {
                        return null === t.lastAccessedTimestampEpochMilliseconds ? 1 : null === n.lastAccessedTimestampEpochMilliseconds ? -1 : parseInt(n.lastAccessedTimestampEpochMilliseconds, 10) - parseInt(t.lastAccessedTimestampEpochMilliseconds, 10)
                    }), o.concat(r)
                },
                de = function(t) {
                    for (var n = f7(t), r = t.reduce(function(t, n) {
                            return t.set(n.token, n), t
                        }, new Map), o = new Set, i = 0; i < t.length; i++) {
                        var a = t[i].parentSessionToken;
                        if (null !== a && (null == (u = t[i]) ? void 0 : u.parent) == null) {
                            var u, l, c, s, f, d, p = r.get(a);
                            null != p && p.lastAccessedIp === (null == (l = t[i]) ? void 0 : l.lastAccessedIp) && (null !== p.lastAccessedIp || (null == (c = t[i]) ? void 0 : c.lastAccessedIp) !== null) && (null === p.agent || (null == (s = t[i]) ? void 0 : s.agent) === null || p.agent.type === (null == (d = t[i]) || null == (f = d.agent) ? void 0 : f.type)) && (n[i].parent = p, o.add(p.token))
                        }
                    }
                    return n.filter(function(t) {
                        return !o.has(t.token)
                    })
                },
                dt = function(t) {
                    var n = t.findIndex(function(t) {
                        return null === t.lastAccessedTimestampEpochMilliseconds && !t.isCurrentSession
                    });
                    return -1 === n ? {
                        knownSessions: t,
                        unknownSessions: []
                    } : {
                        knownSessions: t.slice(0, n),
                        unknownSessions: t.slice(n)
                    }
                },
                dn = function(t, n) {
                    var r;
                    return (r = function() {
                        var r, o, i, a, u;
                        return function(t, n) {
                            var r, o, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                return this
                            }), u;

                            function l(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    a.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && a.label < i[1]) {
                                                    a.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(s);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, a)
                                    } catch (t) {
                                        s = [6, t], o = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    r = 0, o = [], i = !0, a = n, l.label = 1;
                                case 1:
                                    if (!(o.length < 25 && r < 5 && i)) return [3, 3];
                                    return [4, t.sessionManagement.getSessions(a, (25 - o.length).toString())];
                                case 2:
                                    if ((u = l.sent()).isError) return [2, {
                                        isError: !0,
                                        error: u.error
                                    }];
                                    return o = o.concat(u.value.sessions), i = u.value.hasMore, a = u.value.nextCursor, r += 1, [3, 1];
                                case 3:
                                    return [2, {
                                        isError: !1,
                                        sessions: o,
                                        hasMore: i,
                                        nextCursor: a
                                    }]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(o, i) {
                            var a = r.apply(t, n);

                            function u(t) {
                                f8(a, o, i, u, l, "next", t)
                            }

                            function l(t) {
                                f8(a, o, i, u, l, "throw", t)
                            }
                            u(void 0)
                        })
                    })()
                };

            function dr(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }
            var di = ["sessions"];

            function da() {
                var t;
                return (t = function() {
                    var t, n, r, o, i, a, u;
                    return function(t, n) {
                        var r, o, i, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & i[0]) throw i[1];
                                    return i[1]
                                },
                                trys: [],
                                ops: []
                            },
                            u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                            return this
                        }), u;

                        function l(l) {
                            return function(c) {
                                var s = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                    if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                    switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            i = s;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, o = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                a.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && a.label < i[1]) {
                                                a.label = i[1], i = s;
                                                break
                                            }
                                            if (i && a.label < i[2]) {
                                                a.label = i[2], a.ops.push(s);
                                                break
                                            }
                                            i[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    s = n.call(t, a)
                                } catch (t) {
                                    s = [6, t], o = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & s[0]) throw s[1];
                                return {
                                    value: s[0] ? s[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(l) {
                        switch (l.label) {
                            case 0:
                                t = [], n = !0, r = "", o = 0, l.label = 1;
                            case 1:
                                if (!(t.length < 25 && o < 5 && n)) return [3, 3];
                                return i = (25 - t.length).toString(), [4, t2(r || void 0, i)];
                            case 2:
                                if ((a = l.sent()).isError) throw Error(String(null != (u = a.error) ? u : "Unknown session fetch error"));
                                return t = t.concat(a.value.sessions), n = a.value.hasMore, r = a.value.nextCursor, o += 1, [3, 1];
                            case 3:
                                return [2, {
                                    sessions: t,
                                    hasMore: n,
                                    nextCursor: r
                                }]
                        }
                    })
                }, function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, i) {
                        var a = t.apply(n, r);

                        function u(t) {
                            dr(a, o, i, u, l, "next", t)
                        }

                        function l(t) {
                            dr(a, o, i, u, l, "throw", t)
                        }
                        u(void 0)
                    })
                })()
            }
            var du = function(t, n) {
                    if (null === n) return t.Label.Value.UnknownDevice;
                    switch (n.type) {
                        case tQ.UNKNOWN:
                            if (null !== n.os) return t.Label.Value.RobloxApp(n.os);
                            return t.Label.Value.UnknownDevice;
                        case tQ.APP:
                            if (null === n.os) return t.Label.Value.RobloxAppOSUnknown;
                            return t.Label.Value.RobloxApp(n.os);
                        case tQ.BROWSER:
                            if (null == n.value || null == n.os) {
                                if (null !== n.os) return t.Label.Value.BrowserWithOSInfo(n.os);
                                if (null !== n.value) return n.value;
                                return t.Label.Value.Browser
                            }
                            return t.Label.Value.BrowserWithOSandBrowserInfo(n.value, n.os);
                        case tQ.STUDIO:
                            if (null === n.os) return t.Label.Value.Studio;
                            return t.Label.Value.StudioWithOS(n.os);
                        default:
                            return t.Label.Value.UnknownDevice
                    }
                },
                dl = function(t, n) {
                    if (null === n) return t.Label.Value.UnknownTime;
                    var r = new F.Intl().getRobloxLocale().replace("_", "-");
                    return new Date(Number(n)).toLocaleString(r, {
                        month: "short",
                        day: "numeric",
                        year: "numeric",
                        hour: "numeric",
                        minute: "numeric"
                    })
                },
                dc = function(t, n) {
                    return null === n ? t.Label.Value.UnknownLocation : null != n.city && null != n.subdivision && null != n.country ? t.Label.Value.Location(n.city, n.subdivision, n.country) : null != n.city && null != n.subdivision ? t.Label.Value.LocationMissingOne(n.city, n.subdivision) : null != n.city && null != n.country ? t.Label.Value.LocationMissingOne(n.city, n.country) : null != n.city ? t.Label.Value.LocationMissingTwo(n.city) : null != n.subdivision && null != n.country ? t.Label.Value.LocationMissingOne(n.subdivision, n.country) : null != n.subdivision ? t.Label.Value.LocationMissingTwo(n.subdivision) : null != n.country ? t.Label.Value.LocationMissingTwo(n.country) : t.Label.Value.UnknownLocation
                },
                ds = ((i = {})[i.SET_SESSIONS = 0] = "SET_SESSIONS", i[i.SHOW_MORE = 1] = "SHOW_MORE", i[i.SET_MODAL_STATE = 2] = "SET_MODAL_STATE", i[i.REMOVE_SESSION = 3] = "REMOVE_SESSION", i[i.REMOVE_ALL_OTHER_SESSIONS = 4] = "REMOVE_ALL_OTHER_SESSIONS", i[i.REMOVE_UNKNOWN_SESSIONS = 5] = "REMOVE_UNKNOWN_SESSIONS", i[i.SET_CONSOLE_SESSION_STATUS = 6] = "SET_CONSOLE_SESSION_STATUS", i),
                df = function(t, n) {
                    var r = function(t) {
                        for (var n = 1; n < arguments.length; n++) {
                            var r = null != arguments[n] ? arguments[n] : {},
                                o = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                return Object.getOwnPropertyDescriptor(r, t).enumerable
                            }))), o.forEach(function(n) {
                                var o;
                                o = r[n], n in t ? Object.defineProperty(t, n, {
                                    value: o,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : t[n] = o
                            })
                        }
                        return t
                    }({}, t);
                    switch (n.type) {
                        case ds.SET_SESSIONS:
                            return r.sessions = n.sessions, r.unknownSessions = n.unknownSessions, r.hasMore = n.hasMore, r.nextCursor = n.nextCursor, r.delaySummaries = n.delaySummaries, r;
                        case ds.SHOW_MORE:
                            if (r.numSessionsToDisplay = t.numSessionsToDisplay + n.amountToShowMore, null != n.sessionsToAdd) {
                                var o = dt(f9(de(n.sessionsToAdd), !1));
                                r.sessions = r.sessions.concat(o.knownSessions), r.unknownSessions = r.unknownSessions.concat(o.unknownSessions)
                            }
                            return r.nextCursor = n.nextCursor, r.hasMore = n.hasMore, r;
                        case ds.SET_MODAL_STATE:
                            return r.modalState = n.modalState, r.selectedSession = n.session, r;
                        case ds.REMOVE_SESSION:
                            var i = r.sessions.indexOf(n.session);
                            return r.sessions = r.sessions.slice(0, i).concat(r.sessions.slice(i + 1)), r;
                        case ds.REMOVE_ALL_OTHER_SESSIONS:
                            return r.sessions = r.sessions.filter(function(t) {
                                return t.isCurrentSession
                            }), r.unknownSessions = [], r;
                        case ds.REMOVE_UNKNOWN_SESSIONS:
                            return r.unknownSessions = r.unknownSessions.filter(function(t) {
                                return !n.tokensToRemove.has(t.token)
                            }), r;
                        case ds.SET_CONSOLE_SESSION_STATUS:
                            return r.userHasConsoleSession = n.userHasConsoleSession, r;
                        default:
                            return r
                    }
                },
                dd = ((a = dd || {}).NONE = "NONE", a.SESSION_INFO = "SESSION_INFO", a.LOG_OUT_CONFIRMATION = "LOG_OUT_CONFIRMATION", a.LOG_OUT_OF_ALL_SESSIONS = "LOG_OUT_OF_ALL_SESSIONS", a.LOG_OUT_OF_UNKNOWN_SESSIONS = "LOG_OUT_OF_UNKNOWN_SESSIONS", a.SECURITY_DELAYS = "SECURITY_DELAYS", a);

            function dp(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dv(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || dh(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dh(t, n) {
                if (t) {
                    if ("string" == typeof t) return dp(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dp(t, n)
                }
            }
            var dm = [
                    [/^grouppayouts/i, "GroupPayouts"],
                    [/^grouptransfers/i, "GroupOwnershipTransfer"],
                    [/^experiencetransfers/i, "ExperienceOwnershipTransfer"],
                    [/^grouprolesorpermissions/i, "GroupRolesOrPermissions"]
                ],
                dy = function(t, n) {
                    var r = dm.find(function(t) {
                        return dv(t, 1)[0].test(n)
                    });
                    return r ? t.Label.Delay.Subject[r[1]] : t.Label.Delay.Subject.Unknown
                },
                db = function(t, n, r) {
                    var o = Number(null != n ? n : r);
                    if (Number.isNaN(o)) return t.Label.Delay.UnknownTime;
                    var i = new Date(o),
                        a = i.toLocaleDateString(void 0, {
                            month: "short",
                            day: "numeric",
                            year: "numeric"
                        }),
                        u = i.toLocaleTimeString(void 0, {
                            hour: "numeric",
                            minute: "2-digit",
                            hour12: !0
                        });
                    return t.Label.Delay.StartedAt(a, u)
                },
                dg = function(t, n, r) {
                    var o = Number(r) - Date.now();
                    if ("LOCK_STATE_UNLOCKED" === n && o > 0) {
                        var i = Math.max(0, Math.ceil(o / 6e4)),
                            a = Math.floor(i / 1440);
                        if (a > 0) return t.Label.Delay.Status.TimeLeft(t.Label.Delay.Status.DaysLeft(a));
                        var u = String(Math.floor(i % 1440 / 60)).padStart(2, "0"),
                            l = String(i % 60).padStart(2, "0");
                        return t.Label.Delay.Status.TimeLeft("".concat(u, ":").concat(l))
                    }
                    return t.Label.Delay.Status.Completed
                },
                dS = function(t, n) {
                    return {
                        label: dy(t, n.subject),
                        startedAt: db(t, n.updatedAt, n.delayUntil),
                        status: dg(t, n.state, n.delayUntil)
                    }
                },
                dw = function(t, n) {
                    var r, o = new Map,
                        i = !0,
                        a = !1,
                        u = void 0;
                    try {
                        for (var l, c = n[Symbol.iterator](); !(i = (l = c.next()).done); i = !0) {
                            var s = l.value,
                                f = dS(t, s),
                                d = o.get(f.label);
                            d ? (d.count += 1, d.entries.push(f)) : o.set(f.label, {
                                label: f.label,
                                count: 1,
                                entries: [f]
                            })
                        }
                    } catch (t) {
                        a = !0, u = t
                    } finally {
                        try {
                            i || null == c.return || c.return()
                        } finally {
                            if (a) throw u
                        }
                    }
                    return function(t) {
                        if (Array.isArray(t)) return dp(t)
                    }(r = o.values()) || function(t) {
                        if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                    }(r) || dh(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()
                },
                dO = function(t, n) {
                    if (0 === n.length) return t.Label.Value.NoActiveDelays;
                    var r = Date.now();
                    return Object.entries(Object.groupBy(n, function(n) {
                        var o = n.state,
                            i = n.delayUntil;
                        return "LOCK_STATE_UNLOCKED" === o && r <= Number(i) ? t.Label.Delay.Status.PendingLower : t.Label.Delay.Status.CompletedLower
                    })).filter(function(t) {
                        var n = dv(t, 2);
                        return void 0 !== (n[0], n[1])
                    }).map(function(t) {
                        var n = dv(t, 2),
                            r = n[0],
                            o = n[1];
                        return "".concat(o.length, " ").concat(r)
                    }).join(", ")
                };

            function dE(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dN(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return dE(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dE(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dA = (0, U.createContext)(null),
                dx = function(t) {
                    var n = t.eventService,
                        r = t.requestService,
                        o = t.numSessionsToDisplay,
                        i = t.userHasConsoleSession,
                        a = t.translate,
                        u = t.children,
                        l = dd.NONE,
                        c = dN((0, U.useState)(function() {
                            return {
                                Action: {
                                    Cancel: a("Action.Cancel"),
                                    LogOut: a("Action.LogOut"),
                                    LogOutAllSessions: a("Action.LogOutAllSessions"),
                                    LogOutOfSession: a("Action.LogOutOfSession"),
                                    LogOutOfUnknownSessions: a("Action.LogOutOfUnknownSessions"),
                                    PleaseTryAgain: a("Action.PleaseTryAgain"),
                                    ShowMore: a("Action.ShowMore")
                                },
                                Description: {
                                    ConfidenceTrusted: a("Description.ConfidenceTrusted") || "When we have higher confidence that you’re the user, we trust that device.",
                                    ConsoleLogoutDisclaimer: a("Description.ConsoleLogoutDisclaimer"),
                                    CurrentlyLoggedIn: a("Description.CurrentlyLoggedIn"),
                                    OldSessionsWithUnknownData: a("Description.OldSessionsWithUnknownData"),
                                    YouWillBeLoggedOut: a("Description.YouWillBeLoggedOut"),
                                    YouWillBeLoggedOutAllSessions: a("Description.YouWillBeLoggedOutAllSessions")
                                },
                                Header: {
                                    LogOutAllSessions: a("Header.LogOutAllSessions"),
                                    LogOutOfSession: a("Header.LogOutOfSession"),
                                    UnknownInfo: a("Header.UnknownInfo"),
                                    WhereYoureLoggedIn: a("Header.WhereYoureLoggedIn"),
                                    ThisDevice: a("Header.ThisDevice") || "This device",
                                    YourSession: a("Header.YourSession"),
                                    DevicesWhereYouAreLoggedIn: a("Header.DevicesWhereYouAreLoggedIn") || "Devices where you're logged in"
                                },
                                Label: {
                                    ApproximateLocationAndTimestamp: a("Label.ApproximateLocationAndTimestamp"),
                                    DeviceDetails: a("Label.DeviceDetails"),
                                    LastActive: a("Label.LastActive"),
                                    Location: a("Label.Location"),
                                    TooltipTitle: a("Label.TooltipTitle") || "Time & Location Are Approximate",
                                    Value: {
                                        Browser: a("Label.Value.Browser"),
                                        BrowserWithOSandBrowserInfo: function(t, n) {
                                            return a("Label.Value.BrowserWithOSandBrowserInfo", {
                                                Browser: t,
                                                OS: n
                                            })
                                        },
                                        BrowserWithOSInfo: function(t) {
                                            return a("Label.Value.BrowserWithOSInfo", {
                                                OS: t
                                            })
                                        },
                                        JustNow: a("Label.Value.JustNow") || "Just Now",
                                        Location: function(t, n, r) {
                                            return a("Label.Value.Location", {
                                                city: t,
                                                subdivision: n,
                                                country: r
                                            })
                                        },
                                        LocationMissingOne: function(t, n) {
                                            return a("Label.Value.LocationMissingOne", {
                                                cityOrSubdivision: t,
                                                subdivisionOrCountry: n
                                            })
                                        },
                                        LocationMissingTwo: function(t) {
                                            return a("Label.Value.LocationMissingTwo", {
                                                cityOrSubdivisionOrCountry: t
                                            })
                                        },
                                        RobloxApp: function(t) {
                                            return a("Label.Value.RobloxApp", {
                                                OS: t
                                            })
                                        },
                                        RobloxAppOSUnknown: a("Label.Value.RobloxAppOSUnknown"),
                                        Studio: a("Label.Value.Studio"),
                                        StudioWithOS: function(t) {
                                            return a("Label.Value.StudioWithOS", {
                                                OS: t
                                            })
                                        },
                                        ThisSession: a("Label.Value.ThisSession"),
                                        UnknownDevice: a("Label.Value.UnknownDevice"),
                                        UnknownLocation: a("Label.Value.UnknownLocation"),
                                        UnknownTime: a("Label.Value.UnknownTime"),
                                        Trusted: a("Label.Value.Trusted") || "Trusted",
                                        NoActiveDelays: a("Label.Value.NoActiveDelays") || "No active delays",
                                        ActiveDelayCount: function(t) {
                                            return a("Label.Value.ActiveDelayCount", {
                                                count: t
                                            }) || "".concat(t, " active delay").concat(1 === t ? "" : "s")
                                        },
                                        UnknownWithCount: function(t) {
                                            return a("Label.Value.UnknownWithCount", {
                                                Count: t
                                            })
                                        }
                                    },
                                    SecurityDelays: a("Label.SecurityDelays") || "SECURITY DELAYS",
                                    Delay: {
                                        Subject: {
                                            ExperienceOwnershipTransfer: a("Label.Delay.Subject.Experience.OwnershipTransfer") || "Experience Ownership Transfer",
                                            GroupPayouts: a("Label.Delay.Subject.Group.Payouts") || "Group Payouts",
                                            GroupOwnershipTransfer: a("Label.Delay.Subject.Group.OwnershipTransfer") || "Group Ownership Transfer",
                                            GroupRolesOrPermissions: a("Label.Delay.Subject.Group.RolesOrPermissions") || "Group Roles / Permissions",
                                            Unknown: a("Label.Delay.Subject.Unknown") || "Unknown"
                                        },
                                        Status: {
                                            Completed: a("Label.Delay.Status.Completed") || "Completed",
                                            CompletedLower: a("Label.Delay.Status.CompletedLower") || "completed",
                                            PendingLower: a("Label.Delay.Status.PendingLower") || "pending",
                                            Abandoned: a("Label.Delay.Status.Abandoned") || "Abandoned",
                                            AbandonedLower: a("Label.Delay.Status.AbandonedLower") || "abandoned",
                                            TimeLeft: function(t) {
                                                return a("Label.Delay.Status.TimeLeft", {
                                                    timeLeft: t
                                                }) || "".concat(t, " left")
                                            },
                                            DaysLeft: function(t) {
                                                return a("Label.Delay.Status.DaysLeft", {
                                                    days: t
                                                }) || "".concat(t, " days left")
                                            }
                                        },
                                        StartedAt: function(t, n) {
                                            return a("Label.Delay.StartedAt", {
                                                date: t,
                                                time: n
                                            }) || "Started ".concat(t, " at ").concat(n)
                                        },
                                        UnknownTime: a("Label.Delay.UnknownTime") || "Unknown"
                                    },
                                    DelayLowercase: a("Label.DelayLowercase") || "delay(s)"
                                },
                                Message: {
                                    Error: {
                                        Default: a("Message.Error.Default")
                                    }
                                }
                            }
                        }), 1)[0],
                        s = dN((0, U.useState)(function() {
                            return {
                                resources: c,
                                eventService: n,
                                requestService: r,
                                sessions: [],
                                unknownSessions: [],
                                hasMore: !1,
                                nextCursor: "",
                                numSessionsToDisplay: o,
                                userHasConsoleSession: i,
                                modalState: l,
                                selectedSession: null,
                                delaySummaries: []
                            }
                        }), 1)[0],
                        f = dN((0, U.useReducer)(df, s), 2),
                        d = f[0],
                        p = f[1],
                        v = (0, ow.useQuery)({
                            queryKey: di,
                            queryFn: da
                        }).data;
                    return (0, U.useEffect)(function() {
                        if (v) {
                            var t = dt(f9(de(v.sessions), !0)),
                                n = dw(c, v.sessions.flatMap(function(t) {
                                    var n;
                                    return null != (n = t.delayLabels) ? n : []
                                }));
                            p({
                                type: ds.SET_SESSIONS,
                                sessions: t.knownSessions,
                                unknownSessions: t.unknownSessions,
                                hasMore: v.hasMore,
                                nextCursor: v.nextCursor,
                                delaySummaries: n
                            })
                        }
                    }, [v]), (0, U.useEffect)(function() {
                        p({
                            type: ds.SET_CONSOLE_SESSION_STATUS,
                            userHasConsoleSession: i
                        })
                    }, [i]), (0, j.jsx)(dA.Provider, {
                        value: {
                            state: d,
                            dispatch: p
                        },
                        children: u
                    })
                },
                dT = function() {
                    var t = (0, U.useContext)(dA);
                    if (null === t) throw Error("SessionManagementContext was not provided in the current scope");
                    return t
                };

            function dC(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function d_(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function dI(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return dC(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dC(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dD = function(t) {
                var n = t.closeModal,
                    r = dT(),
                    o = r.state,
                    i = o.resources,
                    a = o.eventService,
                    u = o.requestService,
                    l = o.selectedSession,
                    c = o.hasMore,
                    s = o.nextCursor,
                    f = r.dispatch,
                    d = dI((0, U.useState)(!1), 2),
                    p = d[0],
                    v = d[1],
                    h = dI((0, U.useState)(null), 2),
                    m = h[0],
                    y = h[1];
                return (0, j.jsxs)(k().Fragment, {
                    children: [(0, j.jsxs)(f4, {
                        children: [(0, j.jsx)(f3, {
                            children: i.Header.LogOutOfSession
                        }), (0, j.jsx)("p", {
                            className: "text-center modal-margin-bottom",
                            children: i.Description.YouWillBeLoggedOut
                        }), (0, j.jsx)("p", {
                            className: "text-error xsmall",
                            children: m
                        })]
                    }), (0, j.jsxs)(f5, {
                        className: "flex gap-medium justify-center",
                        children: [(0, j.jsx)(co, {
                            variant: "Standard",
                            onClick: n,
                            isDisabled: p,
                            isLoading: p,
                            size: "Large",
                            className: "flex-col fill",
                            children: i.Action.Cancel
                        }), (0, j.jsx)(co, {
                            variant: "Alert",
                            onClick: function() {
                                var t;
                                return (t = function() {
                                    return function(t, n) {
                                        var r, o, i, a = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & i[0]) throw i[1];
                                                    return i[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                            return this
                                        }), u;

                                        function l(l) {
                                            return function(c) {
                                                var s = [l, c];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                                    if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                                    switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                        case 0:
                                                        case 1:
                                                            i = s;
                                                            break;
                                                        case 4:
                                                            return a.label++, {
                                                                value: s[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            a.label++, o = s[1], s = [0];
                                                            continue;
                                                        case 7:
                                                            s = a.ops.pop(), a.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                a = 0;
                                                                continue
                                                            }
                                                            if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                                a.label = s[1];
                                                                break
                                                            }
                                                            if (6 === s[0] && a.label < i[1]) {
                                                                a.label = i[1], i = s;
                                                                break
                                                            }
                                                            if (i && a.label < i[2]) {
                                                                a.label = i[2], a.ops.push(s);
                                                                break
                                                            }
                                                            i[2] && a.ops.pop(), a.trys.pop();
                                                            continue
                                                    }
                                                    s = n.call(t, a)
                                                } catch (t) {
                                                    s = [6, t], o = 0
                                                } finally {
                                                    r = i = 0
                                                }
                                                if (5 & s[0]) throw s[1];
                                                return {
                                                    value: s[0] ? s[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                if (v(!0), null === l) return v(!1), y("".concat(i.Message.Error.Default, " ").concat(i.Action.PleaseTryAgain)), [2];
                                                return [4, u.sessionManagement.logoutSession(l.token)];
                                            case 1:
                                                if (t.sent().isError) return v(!1), y("".concat(i.Message.Error.Default, " ").concat(i.Action.PleaseTryAgain)), [2];
                                                if (a.sendSignedOutOfSessionEvent(l.token), f({
                                                        type: ds.REMOVE_SESSION,
                                                        session: l
                                                    }), null == l.parent) return [3, 3];
                                                return [4, u.sessionManagement.logoutSession(l.parent.token)];
                                            case 2:
                                                t.sent().isError ? f({
                                                    type: ds.SHOW_MORE,
                                                    hasMore: c,
                                                    nextCursor: s,
                                                    sessionsToAdd: [l.parent],
                                                    amountToShowMore: 0
                                                }) : a.sendSignedOutOfSessionEvent(l.parent.token), t.label = 3;
                                            case 3:
                                                return y(null), n(), [2]
                                        }
                                    })
                                }, function() {
                                    var n = this,
                                        r = arguments;
                                    return new Promise(function(o, i) {
                                        var a = t.apply(n, r);

                                        function u(t) {
                                            d_(a, o, i, u, l, "next", t)
                                        }

                                        function l(t) {
                                            d_(a, o, i, u, l, "throw", t)
                                        }
                                        u(void 0)
                                    })
                                })()
                            },
                            isDisabled: p,
                            isLoading: p,
                            size: "Large",
                            className: "flex-col fill",
                            children: p ? (0, j.jsx)("span", {
                                className: "spinner spinner-xs spinner-no-margin"
                            }) : i.Action.LogOut
                        })]
                    })]
                })
            };

            function dL(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dR(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function dP(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return dL(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dL(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dj = t9.cryptoUtil.generateSecureAuthIntentV2,
                dU = function(t) {
                    var n = t.closeModal,
                        r = dT(),
                        o = r.state,
                        i = o.resources,
                        a = o.eventService,
                        u = o.requestService,
                        l = r.dispatch,
                        c = dP((0, U.useState)(!1), 2),
                        s = c[0],
                        f = c[1],
                        d = dP((0, U.useState)(null), 2),
                        p = d[0],
                        v = d[1];
                    return (0, j.jsxs)(k().Fragment, {
                        children: [(0, j.jsxs)(f4, {
                            children: [(0, j.jsx)(f3, {
                                children: i.Header.LogOutAllSessions
                            }), (0, j.jsx)("p", {
                                className: "text-center modal-margin-bottom",
                                children: i.Description.YouWillBeLoggedOutAllSessions
                            }), (0, j.jsx)("p", {
                                className: "text-error xsmall",
                                children: p
                            })]
                        }), (0, j.jsxs)(f5, {
                            className: "flex gap-medium",
                            children: [(0, j.jsx)(co, {
                                variant: "Standard",
                                onClick: n,
                                isDisabled: s,
                                isLoading: s,
                                size: "Large",
                                className: "flex-col fill",
                                children: i.Action.Cancel
                            }), (0, j.jsx)(co, {
                                variant: "Alert",
                                onClick: function() {
                                    var t;
                                    return (t = function() {
                                        var t, r;
                                        return function(t, n) {
                                            var r, o, i, a = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & i[0]) throw i[1];
                                                        return i[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                                return this
                                            }), u;

                                            function l(l) {
                                                return function(c) {
                                                    var s = [l, c];
                                                    if (r) throw TypeError("Generator is already executing.");
                                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                            case 0:
                                                            case 1:
                                                                i = s;
                                                                break;
                                                            case 4:
                                                                return a.label++, {
                                                                    value: s[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                a.label++, o = s[1], s = [0];
                                                                continue;
                                                            case 7:
                                                                s = a.ops.pop(), a.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                    a = 0;
                                                                    continue
                                                                }
                                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                                    a.label = s[1];
                                                                    break
                                                                }
                                                                if (6 === s[0] && a.label < i[1]) {
                                                                    a.label = i[1], i = s;
                                                                    break
                                                                }
                                                                if (i && a.label < i[2]) {
                                                                    a.label = i[2], a.ops.push(s);
                                                                    break
                                                                }
                                                                i[2] && a.ops.pop(), a.trys.pop();
                                                                continue
                                                        }
                                                        s = n.call(t, a)
                                                    } catch (t) {
                                                        s = [6, t], o = 0
                                                    } finally {
                                                        r = i = 0
                                                    }
                                                    if (5 & s[0]) throw s[1];
                                                    return {
                                                        value: s[0] ? s[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(o) {
                                            switch (o.label) {
                                                case 0:
                                                    return f(!0), r = (t = u.sessionManagement).logoutFromAllSessionsAndReauthenticate, [4, dj()];
                                                case 1:
                                                    return [4, r.apply(t, [o.sent()])];
                                                case 2:
                                                    return o.sent().isError ? (f(!1), v("".concat(i.Message.Error.Default, " ").concat(i.Action.PleaseTryAgain))) : (a.sendSignedOutOfAllSessionsEvent(), v(null), l({
                                                        type: ds.REMOVE_ALL_OTHER_SESSIONS
                                                    })), n(), [2]
                                            }
                                        })
                                    }, function() {
                                        var n = this,
                                            r = arguments;
                                        return new Promise(function(o, i) {
                                            var a = t.apply(n, r);

                                            function u(t) {
                                                dR(a, o, i, u, l, "next", t)
                                            }

                                            function l(t) {
                                                dR(a, o, i, u, l, "throw", t)
                                            }
                                            u(void 0)
                                        })
                                    })()
                                },
                                isDisabled: s,
                                isLoading: s,
                                size: "Large",
                                className: "flex-col fill",
                                children: s ? (0, j.jsx)("span", {
                                    className: "spinner spinner-xs spinner-no-margin"
                                }) : i.Action.LogOut
                            })]
                        })]
                    })
                };

            function dk(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dM(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function dW(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return dk(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dk(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dF = function(t) {
                    var n = t.closeModal,
                        r = dT(),
                        o = r.state,
                        i = o.resources,
                        a = o.eventService,
                        u = o.requestService,
                        l = o.unknownSessions,
                        c = r.dispatch,
                        s = dW((0, U.useState)(!1), 2),
                        f = s[0],
                        d = s[1],
                        p = dW((0, U.useState)(null), 2),
                        v = p[0],
                        h = p[1];
                    return (0, j.jsxs)(k().Fragment, {
                        children: [(0, j.jsxs)(f4, {
                            children: [(0, j.jsx)(f3, {
                                children: i.Header.UnknownInfo
                            }), (0, j.jsx)("p", {
                                className: "text-center modal-margin-bottom",
                                children: i.Description.OldSessionsWithUnknownData
                            }), (0, j.jsx)("p", {
                                className: "text-error xsmall",
                                children: v
                            })]
                        }), (0, j.jsx)(f5, {
                            children: (0, j.jsx)(co, {
                                variant: "Alert",
                                onClick: function() {
                                    var t;
                                    return (t = function() {
                                        var t;
                                        return function(t, n) {
                                            var r, o, i, a = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & i[0]) throw i[1];
                                                        return i[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                            return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                                return this
                                            }), u;

                                            function l(l) {
                                                return function(c) {
                                                    var s = [l, c];
                                                    if (r) throw TypeError("Generator is already executing.");
                                                    for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                                        if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                                        switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                            case 0:
                                                            case 1:
                                                                i = s;
                                                                break;
                                                            case 4:
                                                                return a.label++, {
                                                                    value: s[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                a.label++, o = s[1], s = [0];
                                                                continue;
                                                            case 7:
                                                                s = a.ops.pop(), a.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                    a = 0;
                                                                    continue
                                                                }
                                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                                    a.label = s[1];
                                                                    break
                                                                }
                                                                if (6 === s[0] && a.label < i[1]) {
                                                                    a.label = i[1], i = s;
                                                                    break
                                                                }
                                                                if (i && a.label < i[2]) {
                                                                    a.label = i[2], a.ops.push(s);
                                                                    break
                                                                }
                                                                i[2] && a.ops.pop(), a.trys.pop();
                                                                continue
                                                        }
                                                        s = n.call(t, a)
                                                    } catch (t) {
                                                        s = [6, t], o = 0
                                                    } finally {
                                                        r = i = 0
                                                    }
                                                    if (5 & s[0]) throw s[1];
                                                    return {
                                                        value: s[0] ? s[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return d(!0), [4, Promise.all(l.map(function(t) {
                                                        return u.sessionManagement.logoutSession(t.token)
                                                    }))];
                                                case 1:
                                                    if (t = r.sent().reduce(function(t, n, r) {
                                                            return n.isError || (a.sendSignedOutOfSessionEvent(l[r].token), t.add(l[r].token)), t
                                                        }, new Set), c({
                                                            type: ds.REMOVE_UNKNOWN_SESSIONS,
                                                            tokensToRemove: t
                                                        }), t.size < l.length) return d(!1), h("".concat(i.Message.Error.Default, " ").concat(i.Action.PleaseTryAgain)), [2];
                                                    return h(null), n(), [2]
                                            }
                                        })
                                    }, function() {
                                        var n = this,
                                            r = arguments;
                                        return new Promise(function(o, i) {
                                            var a = t.apply(n, r);

                                            function u(t) {
                                                dM(a, o, i, u, l, "next", t)
                                            }

                                            function l(t) {
                                                dM(a, o, i, u, l, "throw", t)
                                            }
                                            u(void 0)
                                        })
                                    })()
                                },
                                isDisabled: f,
                                isLoading: f,
                                children: f ? (0, j.jsx)("span", {
                                    className: "spinner spinner-xs spinner-no-margin"
                                }) : i.Action.LogOutOfUnknownSessions
                            })
                        })]
                    })
                },
                dV = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                dz = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                dK = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                dB = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                dH = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                dY = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                dG = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                dX = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                dQ = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                dq = (0, U.forwardRef)(function(t, n) {
                    var r = t.className,
                        o = t.style,
                        i = t.text,
                        a = t.isDisabled,
                        u = void 0 !== a && a,
                        l = t.size,
                        c = void 0 === l ? "Medium" : l,
                        s = t.variant,
                        f = void 0 === s ? "Standard" : s,
                        d = t.leading,
                        p = t.trailing,
                        v = oC(t, ["className", "style", "text", "isDisabled", "size", "variant", "leading", "trailing"]),
                        h = o_(u ? lZ : [oI, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", null == d ? dK[c] : dB[c], null == p ? dH[c] : dY[c], dz[c], r),
                        m = k().createElement(k().Fragment, null, k().createElement(oD, null), d && k().createElement(l9, {
                            name: d,
                            size: dV[c]
                        }), k().createElement("span", {
                            className: o_("padding-y-xsmall text-no-wrap text-truncate-end", null != d && dG[c], null != p && dX[c])
                        }, i), p && k().createElement(l9, {
                            name: p,
                            size: dV[c]
                        })),
                        y = Object.assign({
                            textDecoration: "none"
                        }, o);
                    if ("a" === v.as) {
                        v.as;
                        var b = v.href,
                            g = oC(v, ["as", "href"]);
                        return k().createElement("a", Object.assign({
                            ref: n
                        }, g, {
                            "aria-disabled": u,
                            href: u ? void 0 : b,
                            className: o_(h, dQ[f], "content-action-utility"),
                            style: y
                        }), m)
                    }
                    v.as;
                    var S = v.isChecked,
                        w = v.onCheckedChange,
                        O = oC(v, ["as", "isChecked", "onCheckedChange"]);
                    return k().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, O, {
                        className: o_(S ? "bg-inverse-surface-0" : dQ[f], S ? "content-inverse-emphasis" : "content-action-utility", h),
                        style: y,
                        "aria-pressed": S,
                        disabled: u,
                        onClick: null == w ? void 0 : function() {
                            return w(!S)
                        }
                    }), m)
                }),
                d$ = function() {
                    var t, n = dT().state,
                        r = n.selectedSession,
                        o = n.resources,
                        i = (null != (t = null == r ? void 0 : r.delayLabels) ? t : []).map(function(t) {
                            return dS(o, t)
                        }),
                        a = function(t) {
                            if (t !== o.Label.Delay.Status.Completed) return "icon-filled-clock"
                        };
                    return (0, j.jsxs)(f4, {
                        children: [(0, j.jsx)(f3, {
                            children: o.Label.SecurityDelays
                        }), (0, j.jsx)(oM, {
                            children: i.map(function(t, n) {
                                return (0, j.jsx)(ok, {
                                    title: t.label,
                                    description: t.startedAt,
                                    divider: n < i.length - 1 ? "Full" : "None",
                                    isContained: !0,
                                    trailing: (0, j.jsx)(dq, {
                                        leading: a(t.status),
                                        as: "button",
                                        isChecked: !1,
                                        size: "Small",
                                        text: t.status,
                                        variant: "Standard"
                                    })
                                }, t.label)
                            })
                        })]
                    })
                },
                dZ = function(t) {
                    t.closeModal;
                    var n, r, o = dT(),
                        i = o.state,
                        a = i.selectedSession,
                        u = i.resources,
                        l = o.dispatch,
                        c = "".concat(u.Message.Error.Default, " ").concat(u.Action.PleaseTryAgain),
                        s = null !== a && null !== a.agent && null !== a.agent.os && (a.agent.os.includes("Xbox") || a.agent.os.includes("PlayStation")),
                        f = (null == a ? void 0 : a.delayLabels) !== null && (null == a || null == (n = a.delayLabels) ? void 0 : n.length) && a.delayLabels.length > 0,
                        d = f ? (0, j.jsx)(l9, {
                            name: "icon-regular-chevron-large-right",
                            size: "Medium"
                        }) : void 0,
                        p = f ? function() {
                            l({
                                type: ds.SET_MODAL_STATE,
                                modalState: dd.SECURITY_DELAYS,
                                session: a
                            })
                        } : void 0;
                    return (0, j.jsxs)(k().Fragment, {
                        children: [(0, j.jsxs)(f4, {
                            children: [(0, j.jsx)(f3, {
                                children: u.Header.ThisDevice
                            }), null === a ? (0, j.jsx)("div", {
                                className: "session-info-section",
                                children: (0, j.jsx)("div", {
                                    className: "no-footer",
                                    children: c
                                })
                            }) : (0, j.jsxs)(oM, {
                                children: [(0, j.jsx)(ok, {
                                    title: u.Label.DeviceDetails,
                                    description: du(u, a.agent),
                                    divider: "Full",
                                    isContained: !0
                                }), (0, j.jsx)(ok, {
                                    title: u.Label.Location,
                                    description: dc(u, a.location),
                                    divider: "Full",
                                    isContained: !0
                                }), (0, j.jsx)(ok, {
                                    title: u.Label.LastActive,
                                    description: dl(u, a.lastAccessedTimestampEpochMilliseconds),
                                    divider: "Full",
                                    isContained: !0
                                }), (0, j.jsx)(ok, {
                                    title: u.Label.SecurityDelays,
                                    description: dO(u, null != (r = null == a ? void 0 : a.delayLabels) ? r : []),
                                    divider: "None",
                                    trailing: d,
                                    onSelect: p,
                                    isContained: !0
                                })]
                            })]
                        }), null !== a && !a.isCurrentSession && (0, j.jsxs)(f5, {
                            className: "flex flex-col gap-medium",
                            children: [s && (0, j.jsx)("div", {
                                className: "small",
                                children: u.Description.ConsoleLogoutDisclaimer
                            }), (0, j.jsx)(co, {
                                variant: "Alert",
                                onClick: function() {
                                    l({
                                        type: ds.SET_MODAL_STATE,
                                        modalState: dd.LOG_OUT_CONFIRMATION,
                                        session: a
                                    })
                                },
                                children: u.Action.LogOutOfSession
                            })]
                        })]
                    })
                },
                dJ = function(t) {
                    var n = t.session,
                        r = dT(),
                        o = r.state,
                        i = o.resources,
                        a = o.eventService,
                        u = r.dispatch;
                    return (0, j.jsx)(ok, {
                        title: du(i, n.agent),
                        metadata: n.isCurrentSession ? i.Label.Value.ThisSession : dc(i, n.location),
                        description: n.isCurrentSession ? i.Label.Value.JustNow : dl(i, n.lastAccessedTimestampEpochMilliseconds),
                        divider: "Full",
                        isContained: !0,
                        onSelect: function() {
                            a.sendOpenedSessionDetailsEvent(n.token), u({
                                type: ds.SET_MODAL_STATE,
                                modalState: dd.SESSION_INFO,
                                session: n
                            })
                        },
                        trailing: (0, j.jsxs)("span", {
                            className: "flex items-center gap-small",
                            children: [n.isTrustedSession && (0, j.jsx)(dq, {
                                as: "button",
                                isChecked: !1,
                                size: "Small",
                                text: i.Label.Value.Trusted,
                                variant: "Standard"
                            }), n.delayLabels && n.delayLabels.length > 0 && (0, j.jsx)(dq, {
                                as: "button",
                                isChecked: !1,
                                size: "Small",
                                text: "".concat(n.delayLabels.length, " ").concat(i.Label.DelayLowercase),
                                variant: "Standard"
                            }), (0, j.jsx)(l9, {
                                name: "icon-regular-chevron-large-right",
                                size: "Medium"
                            })]
                        }),
                        className: "padding-y-large"
                    })
                },
                d0 = r(942),
                d1 = r.n(d0),
                d2 = function(t) {
                    var n = t.isLastSessionToDisplay,
                        r = dT(),
                        o = r.state,
                        i = o.resources,
                        a = o.unknownSessions,
                        u = r.dispatch,
                        l = function() {
                            u({
                                type: ds.SET_MODAL_STATE,
                                modalState: dd.LOG_OUT_OF_UNKNOWN_SESSIONS,
                                session: null
                            })
                        },
                        c = function(t) {
                            "Enter" === t.key && l()
                        },
                        s = d1()("rbx-divider text-new-line", {
                            "last-divider": n
                        }),
                        f = function() {
                            return (0, j.jsxs)(k().Fragment, {
                                children: [(0, j.jsx)("div", {
                                    className: "text-description location-description",
                                    children: (0, j.jsx)("div", {
                                        children: "\xa0"
                                    })
                                }), (0, j.jsx)("span", {
                                    className: "unknown-sessions icon-moreinfo",
                                    role: "button",
                                    onClick: l,
                                    onKeyDown: c,
                                    tabIndex: 0,
                                    children: ""
                                }), (0, j.jsx)("div", {
                                    children: i.Label.Value.UnknownWithCount(a.length)
                                }), (0, j.jsx)("div", {
                                    className: "text-description text-new-line",
                                    children: (0, j.jsx)("div", {
                                        children: "\xa0"
                                    })
                                }), (0, j.jsx)("div", {
                                    className: s
                                })]
                            })
                        };
                    return (0, j.jsxs)(k().Fragment, {
                        children: [(0, j.jsx)("div", {
                            className: "session-row-narrow",
                            role: "button",
                            onClick: l,
                            onKeyDown: c,
                            tabIndex: 0,
                            children: f()
                        }), (0, j.jsx)("div", {
                            className: "session-row-wide",
                            children: f()
                        })]
                    })
                };

            function d4(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function d3(t, n, r, o, i, a, u) {
                try {
                    var l = t[a](u),
                        c = l.value
                } catch (t) {
                    r(t);
                    return
                }
                l.done ? n(c) : Promise.resolve(c).then(o, i)
            }

            function d5(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, i = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != i) {
                        var a = [],
                            u = !0,
                            l = !1;
                        try {
                            for (i = i.call(t); !(u = (r = i.next()).done) && (a.push(r.value), !n || a.length !== n); u = !0);
                        } catch (t) {
                            l = !0, o = t
                        } finally {
                            try {
                                u || null == i.return || i.return()
                            } finally {
                                if (l) throw o
                            }
                        }
                        return a
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return d4(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return d4(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var d6 = function(t) {
                    switch (t) {
                        case dd.SESSION_INFO:
                            return {
                                innerFragment: dZ, size: "Large", hasCloseAffordance: !0
                            };
                        case dd.LOG_OUT_CONFIRMATION:
                            return {
                                innerFragment: dD, size: "Large", hasCloseAffordance: !1
                            };
                        case dd.LOG_OUT_OF_ALL_SESSIONS:
                            return {
                                innerFragment: dU, size: "Large", hasCloseAffordance: !1
                            };
                        case dd.LOG_OUT_OF_UNKNOWN_SESSIONS:
                            return {
                                innerFragment: dF, size: "Large", hasCloseAffordance: !1
                            };
                        case dd.SECURITY_DELAYS:
                            return {
                                innerFragment: d$, size: "Large", hasCloseAffordance: !0
                            };
                        default:
                            return null
                    }
                },
                d8 = function() {
                    var t, n, r = dT(),
                        o = r.state,
                        i = o.resources,
                        a = o.requestService,
                        u = o.sessions,
                        l = o.unknownSessions,
                        c = o.hasMore,
                        s = o.nextCursor,
                        f = o.numSessionsToDisplay,
                        d = (o.userHasConsoleSession, o.modalState),
                        p = r.dispatch,
                        v = d5((0, U.useState)(null), 2),
                        h = v[0],
                        m = v[1],
                        y = d5((0, U.useState)(!1), 2),
                        b = y[0],
                        g = y[1],
                        S = d5((0, U.useState)(!1), 2),
                        w = S[0],
                        O = S[1],
                        E = d5((0, U.useState)(!1), 2),
                        N = E[0],
                        A = E[1],
                        x = (0, U.useRef)(null),
                        T = function() {
                            p({
                                type: ds.SET_MODAL_STATE,
                                modalState: dd.NONE,
                                session: null
                            })
                        },
                        C = function() {
                            var t;
                            return (t = function() {
                                var t, n, r, o, l;
                                return function(t, n) {
                                    var r, o, i, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & i[0]) throw i[1];
                                                return i[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return u.next = l(0), u.throw = l(1), u.return = l(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
                                        return this
                                    }), u;

                                    function l(l) {
                                        return function(c) {
                                            var s = [l, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; u && (u = 0, s[0] && (a = 0)), a;) try {
                                                if (r = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, s[1])).done) return i;
                                                switch (o = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        i = s;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, o = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                            a.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && a.label < i[1]) {
                                                            a.label = i[1], i = s;
                                                            break
                                                        }
                                                        if (i && a.label < i[2]) {
                                                            a.label = i[2], a.ops.push(s);
                                                            break
                                                        }
                                                        i[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                s = n.call(t, a)
                                            } catch (t) {
                                                s = [6, t], o = 0
                                            } finally {
                                                r = i = 0
                                            }
                                            if (5 & s[0]) throw s[1];
                                            return {
                                                value: s[0] ? s[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            if (t = s, n = c, r = null, o = 10, !(c && u.length < f + o)) return [3, 2];
                                            return g(!0), [4, dn(a, s)];
                                        case 1:
                                            if ((l = d.sent()).isError) return g(!1), m("".concat(i.Message.Error.Default, " ").concat(i.Action.PleaseTryAgain)), [2];
                                            r = l.sessions, t = l.nextCursor, n = l.hasMore, d.label = 2;
                                        case 2:
                                            return g(!1), m(null), p({
                                                type: ds.SHOW_MORE,
                                                sessionsToAdd: r,
                                                nextCursor: t,
                                                hasMore: n,
                                                amountToShowMore: o
                                            }), [2]
                                    }
                                })
                            }, function() {
                                var n = this,
                                    r = arguments;
                                return new Promise(function(o, i) {
                                    var a = t.apply(n, r);

                                    function u(t) {
                                        d3(a, o, i, u, l, "next", t)
                                    }

                                    function l(t) {
                                        d3(a, o, i, u, l, "throw", t)
                                    }
                                    u(void 0)
                                })
                            })()
                        };
                    (0, U.useEffect)(function() {
                        var t = x.current;
                        null !== t && !w && window.location.search.includes("scroll-to-session-management") && (O(!0), setTimeout(function() {
                            return t.scrollIntoView({
                                behavior: "smooth",
                                block: "start"
                            })
                        }, 1750))
                    }, [w]);
                    var _ = u.slice(0, f),
                        I = _.map(function(t, n) {
                            return (0, j.jsx)(dJ, {
                                session: t,
                                isLastSessionToDisplay: n === u.length - 1 && !c && 0 === l.length
                            }, t.token)
                        }),
                        D = u.length > _.length || c;
                    l.length > 0 && I.push((0, j.jsx)(d2, {
                        isLastSessionToDisplay: !D
                    }));
                    var L = d6(d);
                    return (0, j.jsxs)(oM, {
                        className: "flex flex-col padding-large",
                        ref: x,
                        children: [(0, j.jsx)(ok, {
                            title: i.Header.DevicesWhereYouAreLoggedIn,
                            description: i.Description.ConfidenceTrusted,
                            trailing: (0, j.jsx)(lk, {
                                position: "top-start",
                                title: i.Label.TooltipTitle,
                                description: i.Label.ApproximateLocationAndTimestamp,
                                open: N,
                                onOpenChange: A,
                                children: (0, j.jsx)(lM, {
                                    asChild: !0,
                                    children: (0, j.jsx)(l6, {
                                        icon: "icon-regular-circle-question",
                                        size: "Small",
                                        variant: "Utility",
                                        ariaLabel: i.Label.ApproximateLocationAndTimestamp,
                                        isCircular: !0,
                                        onClick: function() {
                                            return A(function(t) {
                                                return !t
                                            })
                                        }
                                    })
                                })
                            }),
                            isContained: !0,
                            divider: "Full",
                            className: "padding-y-large"
                        }), 0 === u.length ? (0, j.jsx)("span", {
                            className: "spinner spinner-default spinner-no-margin modal-margin-bottom-large"
                        }) : (0, j.jsxs)(k().Fragment, {
                            children: [I, D && (b ? (0, j.jsx)("span", {
                                className: "spinner spinner-xs spinner-no-margin"
                            }) : (0, j.jsxs)("div", {
                                children: [(0, j.jsx)("div", {
                                    className: "show-more text-new-line modal-margin-bottom",
                                    role: "button",
                                    onClick: C,
                                    onKeyDown: function(t) {
                                        "Enter" === t.key && C()
                                    },
                                    tabIndex: 0,
                                    children: i.Action.ShowMore
                                }), (0, j.jsx)("p", {
                                    className: "text-error xsmall",
                                    children: h
                                }), h && (0, j.jsx)("div", {
                                    className: "text-new-line"
                                })]
                            })), (0, j.jsx)(co, {
                                className: "margin-y-medium",
                                onClick: function() {
                                    p({
                                        type: ds.SET_MODAL_STATE,
                                        modalState: dd.LOG_OUT_OF_ALL_SESSIONS,
                                        session: null
                                    })
                                },
                                size: "Large",
                                variant: "Standard",
                                isDisabled: b,
                                children: i.Action.LogOutAllSessions
                            })]
                        }), L && (0, j.jsx)(f1, (t = function(t) {
                            for (var n = 1; n < arguments.length; n++) {
                                var r = null != arguments[n] ? arguments[n] : {},
                                    o = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(r, t).enumerable
                                }))), o.forEach(function(n) {
                                    var o;
                                    o = r[n], n in t ? Object.defineProperty(t, n, {
                                        value: o,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : t[n] = o
                                })
                            }
                            return t
                        }({
                            open: !0,
                            onOpenChange: function(t) {
                                t || T()
                            },
                            size: L.size,
                            isModal: !0
                        }, L.hasCloseAffordance ? {
                            hasCloseAffordance: !0,
                            closeLabel: i.Action.Cancel
                        } : {
                            hasCloseAffordance: !1
                        }), n = n = {
                            children: (0, j.jsx)(f2, {
                                className: "width-full",
                                children: (0, j.jsx)(f4, {
                                    children: (0, j.jsx)(L.innerFragment, {
                                        closeModal: T
                                    })
                                })
                            })
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                            var r = Object.keys(t);
                            if (Object.getOwnPropertySymbols) {
                                var o = Object.getOwnPropertySymbols(t);
                                r.push.apply(r, o)
                            }
                            return r
                        })(Object(n)).forEach(function(r) {
                            Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                        }), t))]
                    })
                },
                d7 = (0, oO.withTranslations)(function(t) {
                    var n = t.eventService,
                        r = t.requestService,
                        o = t.numSessionsToDisplay,
                        i = t.userHasConsoleSession,
                        a = t.translate;
                    return (0, j.jsx)(ow.QueryClientProvider, {
                        client: oO.queryClient,
                        children: (0, j.jsx)(dx, {
                            eventService: n,
                            requestService: r,
                            numSessionsToDisplay: o,
                            userHasConsoleSession: i,
                            translate: a,
                            children: (0, j.jsx)(d8, {})
                        })
                    })
                }, {
                    common: [],
                    feature: "Feature.SessionManagement"
                }),
                d9 = function() {
                    var t;

                    function n() {
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function")
                    }
                    return t = [{
                            key: "sendSignedOutOfAllSessionsEvent",
                            value: function() {
                                V().EventStream.SendEventWithTarget(oE, oN, {}, V().EventStream.TargetTypes.WWW)
                            }
                        }, {
                            key: "sendSignedOutOfSessionEvent",
                            value: function(t) {
                                V().EventStream.SendEventWithTarget(oE, oA, {
                                    sessionId: t
                                }, V().EventStream.TargetTypes.WWW)
                            }
                        }, {
                            key: "sendOpenedSessionDetailsEvent",
                            value: function(t) {
                                V().EventStream.SendEventWithTarget(oE, ox, {
                                    sessionId: t
                                }, V().EventStream.TargetTypes.WWW)
                            }
                        }],
                        function(t, n) {
                            for (var r = 0; r < n.length; r++) {
                                var o = n[r];
                                o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(t, o.key, o)
                            }
                        }(n.prototype, t), n
                }(),
                pe = new function t() {
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    oS(this, "captcha", l), oS(this, "email", c), oS(this, "fido2", I), oS(this, "games", s), oS(this, "metrics", x), oS(this, "myAccount", f), oS(this, "otp", d), oS(this, "password", p), oS(this, "phone", v), oS(this, "playstation", h), oS(this, "promptAssignments", m), oS(this, "securityQuestions", S), oS(this, "sessionManagement", w), oS(this, "rostile", g), oS(this, "thumbnails", O), oS(this, "twoStepVerification", E), oS(this, "universalAppConfiguration", N), oS(this, "proofOfSpace", y), oS(this, "proofOfWork", b), oS(this, "xbox", A), oS(this, "privateAccessToken", T), oS(this, "genericChallenge", C), oS(this, "authApi", _), oS(this, "accountRecoveryApi", D), oS(this, "legacyAccountInfoApi", L), oS(this, "userSettingsApi", R), oS(this, "usersApi", P)
                };
            Object.assign(V(), {
                SessionManagement: {
                    renderComponent: function(t) {
                        var n = document.getElementById(t.containerId);
                        if (null !== n) {
                            (0, M.unmountComponentAtNode)(n);
                            var r = new d9,
                                o = t.userHasConsoleSession || !1;
                            return (0, M.render)((0, j.jsx)(d7, {
                                eventService: r,
                                requestService: pe,
                                numSessionsToDisplay: 10,
                                userHasConsoleSession: o
                            }), n), !0
                        }
                        return !1
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SessionManagement");
//# debugId=dfba56ef-50b9-4bd5-816b-69ddc3af47eb
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/sessionManagement-f47fee0e122b5f92.js.map