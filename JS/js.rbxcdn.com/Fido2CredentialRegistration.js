! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "cb4a70411757a53f06d54bfb058402bc3c345a7b"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "cc0c5228-51ad-45d8-8036-ac5c9913c3cf", e._sentryDebugIdIdentifier = "sentry-dbid-cc0c5228-51ad-45d8-8036-ac5c9913c3cf")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {
            919: function(e, t, n) {
                e.exports = {}
            },
            589: function(e, t, n) {
                e.exports = {}
            },
            722: function(e, t, n) {
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
    }, n.rv = function() {
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
            var e, t, r, o, i, a, c, s, u, l, d, f, p, h, v, E, y, N, S, m, b, A, _, I, O, T, D, g, R, C, w, L, U, P, x, k, j, M, F, K, V, W, G, B, Y, H, Q, X, q, z, J, $, Z, ee, et, en, er, eo, ei, ea, ec, es, eu, el, ed, ef, ep, eh, ev, eE, ey = {};
            n.r(ey), n.d(ey, {
                getMetadata: function() {
                    return nE
                }
            });
            var eN = {};
            n.r(eN), n.d(eN, {
                getEmailConfiguration: function() {
                    return n_
                },
                updateForCurrentUser: function() {
                    return nb
                },
                updateForCurrentUserWithVerification: function() {
                    return nA
                }
            });
            var eS = {};
            n.r(eS), n.d(eS, {
                submitCaptcha: function() {
                    return nC
                }
            });
            var em = {};
            n.r(em), n.d(em, {
                getDetailsForUniverseIds: function() {
                    return nP
                }
            });
            var eb = {};
            n.r(eb), n.d(eb, {
                getMySettingsInfo: function() {
                    return nj
                }
            });
            var eA = {};
            n.r(eA), n.d(eA, {
                getMetadata: function() {
                    return nz
                },
                resendCode: function() {
                    return nX
                },
                sendCodeForUser: function() {
                    return nQ
                },
                validateCode: function() {
                    return nq
                }
            });
            var e_ = {};
            n.r(e_), n.d(e_, {
                changeForCurrentUser: function() {
                    return n6
                },
                resetSendPrompted: function() {
                    return n5
                },
                validate: function() {
                    return n7
                }
            });
            var eI = {};
            n.r(eI), n.d(eI, {
                getPhoneConfiguration: function() {
                    return rp
                },
                getPhonePrefixList: function() {
                    return rv
                },
                prioritizeDefaultPrefix: function() {
                    return rh
                },
                resendCode: function() {
                    return rN
                },
                updatePhone: function() {
                    return rE
                },
                verifyCode: function() {
                    return ry
                }
            });
            var eO = {};
            n.r(eO), n.d(eO, {
                disconnectPlaystation: function() {
                    return rO
                },
                getPlaystationConnection: function() {
                    return rI
                }
            });
            var eT = {};
            n.r(eT), n.d(eT, {
                getAllForCurrentUser: function() {
                    return rP
                },
                updateForCurrentUser: function() {
                    return rx
                }
            });
            var eD = {};
            n.r(eD), n.d(eD, {
                verifyPuzzle: function() {
                    return rK
                }
            });
            var eg = {};
            n.r(eg), n.d(eg, {
                getPuzzle: function() {
                    return rQ
                },
                verifyPuzzle: function() {
                    return rX
                }
            });
            var eR = {};
            n.r(eR), n.d(eR, {
                verifyPuzzle: function() {
                    return rZ
                }
            });
            var eC = {};
            n.r(eC), n.d(eC, {
                answerQuestion: function() {
                    return r5
                },
                getQuestion: function() {
                    return r6
                }
            });
            var ew = {};
            n.r(ew), n.d(ew, {
                getSessions: function() {
                    return ou
                },
                logoutFromAllSessionsAndReauthenticate: function() {
                    return od
                },
                logoutSession: function() {
                    return ol
                }
            });
            var eL = {};
            n.r(eL), n.d(eL, {
                getIconsForUniverseIds: function() {
                    return ov
                }
            });
            var eU = {};
            n.r(eU), n.d(eU, {
                getMetadata: function() {
                    return oS
                }
            });
            var eP = {};
            n.r(eP), n.d(eP, {
                clearRecoveryCodes: function() {
                    return ok
                },
                deleteSecurityKey: function() {
                    return oH
                },
                disableAuthenticator: function() {
                    return oU
                },
                disableEmailTwoStepVerification: function() {
                    return oR
                },
                disableSmsTwoStepVerification: function() {
                    return oV
                },
                enableAuthenticator: function() {
                    return oC
                },
                enableEmailTwoStepVerification: function() {
                    return oT
                },
                enableSecurityKey: function() {
                    return oW
                },
                enableSmsTwoStepVerification: function() {
                    return oM
                },
                enableVerifyAuthenticator: function() {
                    return ow
                },
                enableVerifySecurityKey: function() {
                    return oG
                },
                generateRecoveryCodes: function() {
                    return oj
                },
                generateResaleFrictionChallenge: function() {
                    return o1
                },
                generateSpendFrictionChallenge: function() {
                    return oZ
                },
                generateTradeFrictionChallenge: function() {
                    return o0
                },
                getMetadata: function() {
                    return oI
                },
                getPasskeyOptions: function() {
                    return oX
                },
                getRecoveryCodesStatus: function() {
                    return ox
                },
                getResaleFrictionStatus: function() {
                    return o$
                },
                getSecurityKeyOptions: function() {
                    return oB
                },
                getSpendFrictionStatus: function() {
                    return oz
                },
                getTradeFrictionStatus: function() {
                    return oJ
                },
                getUserConfiguration: function() {
                    return oO
                },
                listSecurityKey: function() {
                    return oQ
                },
                redeemResaleFrictionChallenge: function() {
                    return o3
                },
                redeemSpendFrictionChallenge: function() {
                    return o2
                },
                redeemTradeFrictionChallenge: function() {
                    return o4
                },
                retractCrossDevice: function() {
                    return o7
                },
                retryCrossDevice: function() {
                    return o6
                },
                sendEmailCode: function() {
                    return oD
                },
                sendSmsCode: function() {
                    return oF
                },
                verifyAuthenticatorCode: function() {
                    return oL
                },
                verifyCrossDevice: function() {
                    return o5
                },
                verifyEmailCode: function() {
                    return og
                },
                verifyPasskeyCredential: function() {
                    return oq
                },
                verifyPasswordCode: function() {
                    return o8
                },
                verifyRecoveryCode: function() {
                    return oP
                },
                verifySecurityKeyCredential: function() {
                    return oY
                },
                verifySmsCode: function() {
                    return oK
                }
            });
            var ex = {};
            n.r(ex), n.d(ex, {
                getSettingsUiPolicy: function() {
                    return it
                }
            });
            var ek = {};
            n.r(ek), n.d(ek, {
                disconnectXbox: function() {
                    return is
                },
                getXboxConnection: function() {
                    return ic
                }
            });
            var ej = {};
            n.r(ej), n.d(ej, {
                recordMetric: function() {
                    return ip
                }
            });
            var eM = {};
            n.r(eM), n.d(eM, {
                getPatToken: function() {
                    return iN
                }
            });
            var eF = {};
            n.r(eF), n.d(eF, {
                continueChallenge: function() {
                    return i_
                }
            });
            var eK = {};
            n.r(eK), n.d(eK, {
                PasswordDeletionSource: function() {
                    return iB
                },
                deletePasskeyBatch: function() {
                    return iq
                },
                finishARPreAuthPasskeyRegistration: function() {
                    return iX
                },
                finishPasskeyRegistration: function() {
                    return iQ
                },
                invalidateTicketsForEppEnrollment: function() {
                    return i$
                },
                listAllCredentials: function() {
                    return iz
                },
                resetPassword: function() {
                    return iJ
                },
                startPasskeyRegistration: function() {
                    return iY
                },
                startPreAuthPasskeyRegistration: function() {
                    return iH
                }
            });
            var eV = {};
            n.r(eV), n.d(eV, {
                getNativeResponse: function() {
                    return i1
                },
                getNavigatorCredentials: function() {
                    return i2
                }
            });
            var eW = {};
            n.r(eW), n.d(eW, {
                continueRecovery: function() {
                    return ad
                },
                disableTwoStepMethod: function() {
                    return av
                },
                getCurrentTwoStepMethod: function() {
                    return ah
                },
                recoverySessionMetadata: function() {
                    return af
                },
                requestRecovery: function() {
                    return aa
                },
                resendCode: function() {
                    return as
                },
                sendCode: function() {
                    return ac
                },
                setEmail: function() {
                    return ap
                },
                verifyBackupCode: function() {
                    return al
                },
                verifyCode: function() {
                    return au
                }
            });
            var eG = {};
            n.r(eG), n.d(eG, {
                getAccountInfo: function() {
                    return aN
                }
            });
            var eB = {};
            n.r(eB), n.d(eB, {
                changeEppStatus: function() {
                    return aA
                },
                userSettings: function() {
                    return ab
                }
            });
            var eY = {};
            n.r(eY), n.d(eY, {
                getUserById: function() {
                    return aD
                },
                getUserByUsername: function() {
                    return ag
                },
                getUsersByIds: function() {
                    return aR
                }
            }), n(919);
            var eH = window.ReactJSX,
                eQ = window.Roblox,
                eX = n.n(eQ),
                eq = window.React,
                ez = n.n(eq),
                eJ = window.ReactDOM,
                e$ = window.ReactUtilities,
                eZ = window.ReactStyleGuide,
                e0 = ((e = e0 || {}).NONE = "NONE", e.GENERIC_TEXT_ERROR = "GENERIC_TEXT_ERROR", e.FIDO_CREDENTIAL_CONFIRM_TRUST = "FIDO_CREDENTIAL_CONFIRM_TRUST", e.FIDO_CREDENTIAL_DELETE = "FIDO_CREDENTIAL_DELETE", e.FIDO_CREDENTIAL_ENABLE = "FIDO_CREDENTIAL_ENABLE", e.FIDO_CREDENTIAL_ERROR = "FIDO_CREDENTIAL_ERROR", e.FIDO_CREDENTIAL_NAME = "FIDO_CREDENTIAL_NAME", e.FIDO_CREDENTIAL_MANAGE = "FIDO_CREDENTIAL_MANAGE", e),
                e1 = ((t = {})[t.SET_MODAL_STATE = 0] = "SET_MODAL_STATE", t),
                e2 = function(e, t) {
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
                    return t.type === e1.SET_MODAL_STATE && (n.modalStateAndProps = {
                        modalState: t.modalState,
                        additionalModalProps: t.additionalModalProps
                    }), n
                };

            function e4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function e3(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            c = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return e4(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return e4(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var e6 = (0, eq.createContext)(null),
                e5 = function(e) {
                    var t = e.translate,
                        n = e.eventService,
                        r = e.requestService,
                        o = e.onCreationSuccess,
                        i = e.onDuplicateCreated,
                        a = e.onDeleteSuccess,
                        c = e.onLastKeyDeleted,
                        s = e.onGenericError,
                        u = e.credentialPurpose,
                        l = e.registeredKeys,
                        d = e.fido2Supported,
                        f = e.deleteAllPasskeysAllowed,
                        p = e.registrationSource,
                        h = e.children,
                        v = e3((0, eq.useState)(function() {
                            return {
                                translate: t,
                                eventService: n,
                                requestService: r,
                                onCreationSuccess: o,
                                onDuplicateCreated: i,
                                onDeleteSuccess: a,
                                onLastKeyDeleted: c,
                                onGenericError: s,
                                credentialPurpose: u,
                                registeredKeys: l,
                                fido2Supported: d,
                                deleteAllPasskeysAllowed: f,
                                registrationSource: p,
                                modalStateAndProps: {
                                    modalState: e0.NONE,
                                    additionalModalProps: null
                                }
                            }
                        }), 1)[0],
                        E = e3((0, eq.useReducer)(e2, v), 2),
                        y = E[0],
                        N = E[1];
                    return (0, eH.jsx)(e6.Provider, {
                        value: {
                            state: y,
                            dispatch: N
                        },
                        children: h
                    })
                };
            e5.defaultProps = {
                fido2Supported: void 0,
                deleteAllPasskeysAllowed: !0,
                registrationSource: void 0
            };
            var e7 = function() {
                    var e = (0, eq.useContext)(e6);
                    if (null === e) throw Error("Fido2CredentialRegistrationContext was not provided in the current scope");
                    return e
                },
                e8 = ((r = {})[r.TwoStepVerification = 0] = "TwoStepVerification", r[r.Login = 1] = "Login", r),
                e9 = window.CoreRobloxUtilities,
                te = window.HeaderScripts,
                tt = "settingsPasskey",
                tn = "settingsPasskeyCreated",
                tr = "authButtonClick",
                to = "authModalShown",
                ti = "authClientError",
                ta = "cancel",
                tc = "continue",
                ts = "addPasskey",
                tu = "userOSDialogError",
                tl = "startRegistration",
                td = "finishRegistration",
                tf = "deletePasskey",
                tp = "registerCredentialsEmptyResponse",
                th = "registerCredentialsErrorCode",
                tv = "https://en.help.roblox.com/hc/en-us/articles/20669991483156";

            function tE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ty(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function tN(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            ty(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            ty(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function tS(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tm = function(e) {
                var t, n = e.closeModal,
                    r = e7(),
                    o = r.state,
                    i = o.translate,
                    a = o.eventService,
                    c = o.requestService,
                    s = o.onGenericError,
                    u = o.onDuplicateCreated,
                    l = o.credentialPurpose,
                    d = o.modalStateAndProps,
                    f = r.dispatch,
                    p = (t = (0, eq.useState)(!1), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                c = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                            } catch (e) {
                                c = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (c) throw r
                                }
                            }
                            return i
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return tE(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tE(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    h = p[0],
                    v = p[1];
                return ((0, eq.useEffect)(function() {
                    var e = function(e, t) {
                        d.modalState === e0.FIDO_CREDENTIAL_ENABLE && (null === e.credential ? f({
                            type: e1.SET_MODAL_STATE,
                            modalState: e0.FIDO_CREDENTIAL_ERROR,
                            additionalModalProps: null
                        }) : f({
                            type: e1.SET_MODAL_STATE,
                            modalState: e0.FIDO_CREDENTIAL_NAME,
                            additionalModalProps: {
                                credential: e.credential,
                                sessionId: t
                            }
                        }))
                    };
                    tN(function() {
                        var t, r, o, i, f, p, h, E, y, N;
                        return tS(this, function(S) {
                            switch (S.label) {
                                case 0:
                                    if (d.modalState !== e0.FIDO_CREDENTIAL_ENABLE) return [2];
                                    return t = {
                                        credential: null
                                    }, [4, tN(function() {
                                        return tS(this, function(e) {
                                            switch (l) {
                                                case e8.Login:
                                                    return [2, c.authApi.startPasskeyRegistration()];
                                                case e8.TwoStepVerification:
                                                    return [2, c.twoStepVerification.enableSecurityKey(te.authenticatedUser.id.toString())]
                                            }
                                            return [2]
                                        })
                                    })()];
                                case 1:
                                    if ((r = S.sent()).isError) return n(), eQ.AccountIntegrityChallengeService.Generic.ChallengeError.matchAbandoned(r.errorRaw) || (s(), a.sendPasskeyRegistrationErrorEvent(String(null != (o = r.error) ? o : ""), tl)), [2];
                                    v(!0), f = (i = !(eQ.DeviceMeta && (0, eQ.DeviceMeta)().isInApp && (0, eQ.DeviceMeta)().isAndroidApp)) ? e9.fido2Util.convertPublicKeyParametersToStandardBase64(JSON.stringify(r.value.creationOptions)) : r.value.creationOptions, S.label = 2;
                                case 2:
                                    if (S.trys.push([2, 7, , 8]), !(eQ.DeviceMeta && (0, eQ.DeviceMeta)().isInApp)) return [3, 4];
                                    switch (l) {
                                        case e8.Login:
                                            f.keyType = "platform";
                                            break;
                                        case e8.TwoStepVerification:
                                            f.keyType = "hardware"
                                    }
                                    return [4, e9.hybridResponseService.getNativeResponse(e9.hybridResponseService.FeatureTarget.REGISTER_CREDENTIALS, {
                                        creationOptionsJSON: JSON.stringify(f)
                                    }, 3e5)];
                                case 3:
                                    if (null !== (p = S.sent()))
                                        if (void 0 !== (h = JSON.parse(p)).errorCode) {
                                            if (11 === h.errorCode) return u(), n(), [2];
                                            a.sendPasskeyRegistrationErrorEvent(String(null != (E = h.errorMsg) ? E : ""), th)
                                        } else void 0 === h.id ? a.sendPasskeyRegistrationErrorEvent("", tp) : (eQ.DeviceMeta && (0, eQ.DeviceMeta)().isInApp && (0, eQ.DeviceMeta)().isAndroidApp && delete h.clientExtensionResults, t.credential = i ? e9.fido2Util.formatCredentialRegistrationResponseApp(p) : JSON.stringify(h));
                                    return [3, 6];
                                case 4:
                                    return [4, navigator.credentials.create({
                                        publicKey: e9.fido2Util.formatCredentialRequestWeb(JSON.stringify(f))
                                    })];
                                case 5:
                                    null !== (y = S.sent()) ? t.credential = e9.fido2Util.formatCredentialRegistrationResponseWeb(y) : a.sendPasskeyRegistrationErrorEvent("", tp), S.label = 6;
                                case 6:
                                    return [3, 8];
                                case 7:
                                    if (console.error(N = S.sent()), (null == N ? void 0 : N.code) === 11) return u(), n(), [2];
                                    return a.sendPasskeyRegistrationErrorEvent(String(null != N ? N : ""), th), [3, 8];
                                case 8:
                                    return e(t, r.value.sessionId), [2]
                            }
                        })
                    })()
                }, []), l === e8.Login) ? (0, eH.jsx)(ez().Fragment, {}) : (0, eH.jsx)(ez().Fragment, {
                    children: h && (0, eH.jsxs)("div", {
                        className: "enable-fido-credential-modal",
                        children: [(0, eH.jsxs)("div", {
                            className: "modal-header",
                            children: [(0, eH.jsx)("div", {
                                className: "modal-modern-header-button",
                                children: (0, eH.jsxs)("button", {
                                    type: "button",
                                    className: "close",
                                    onClick: n,
                                    children: [(0, eH.jsx)("span", {
                                        "aria-hidden": "true",
                                        children: (0, eH.jsx)("span", {
                                            className: "icon-close"
                                        })
                                    }), (0, eH.jsx)("span", {
                                        className: "sr-only",
                                        children: i("Action.Dialog.Close")
                                    })]
                                })
                            }), (0, eH.jsx)("div", {
                                className: "modal-title",
                                children: (0, eH.jsx)("h4", {
                                    children: (0, eH.jsx)("span", {
                                        children: i("Heading.RegisterSecurityKey")
                                    })
                                })
                            })]
                        }), (0, eH.jsxs)("div", {
                            className: "fido-credential-container",
                            children: [(0, eH.jsx)("div", {
                                className: "fido-credential-symbol",
                                children: (0, eH.jsx)("div", {
                                    className: "fido-credential-usb-icon"
                                })
                            }), (0, eH.jsx)("div", {
                                className: "fido-credential-text",
                                children: i("Label.SecurityKey.PhysicalKey")
                            })]
                        }), (0, eH.jsx)("div", {
                            className: "fido-credential-spinner",
                            children: (0, eH.jsx)("div", {
                                className: "spinner-donut"
                            })
                        })]
                    })
                })
            };

            function tb(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function tA(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            tb(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            tb(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function t_(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            n(589);
            var tI = function() {
                    return Promise.resolve(null)
                },
                tO = function(e) {
                    var t = e.id,
                        n = e.inputType,
                        r = e.placeholder,
                        o = e.disabled,
                        i = e.value,
                        a = e.error,
                        c = e.canSubmit,
                        s = e.validate,
                        u = e.setValue,
                        l = e.setError,
                        d = e.handleSubmit,
                        f = e.onChange,
                        p = e.label,
                        h = e.bottomLabel,
                        v = e.inputMode,
                        E = e.autoComplete,
                        y = e.maxLength,
                        N = e.validCharactersRegEx,
                        S = e.hideFeedback,
                        m = e.concealInput,
                        b = e.autoFocus,
                        A = "" !== i && null === a,
                        _ = "" !== i && null !== a,
                        I = A || _;
                    return (0, eH.jsxs)("div", {
                        className: "input-control-wrapper",
                        children: [p && (0, eH.jsx)("label", {
                            className: "text-label xsmall",
                            htmlFor: t,
                            children: p
                        }), (0, eH.jsxs)(eZ.FormGroup, {
                            controlId: t,
                            className: "".concat(I ? "form-has-feedback" : "", " ").concat(A ? "form-has-success" : "", " ").concat(_ ? "form-has-error" : ""),
                            children: [(0, eH.jsx)(eZ.FormControl, {
                                as: "input",
                                className: "input-field".concat(m && i.length > 0 ? " input-field-concealed" : ""),
                                type: n,
                                inputMode: v,
                                autoComplete: E,
                                maxLength: y,
                                disabled: o,
                                value: i,
                                placeholder: r,
                                onChange: function(e) {
                                    return tA(function() {
                                        var t;
                                        return t_(this, function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return t = e.currentTarget.value, void 0 === N || N.test(t) || (t = i), void 0 !== f && f(t), u(t), [4, s(t)];
                                                case 1:
                                                    return l.apply(void 0, [n.sent()]), [2]
                                            }
                                        })
                                    })()
                                },
                                onKeyDown: function(e) {
                                    return tA(function() {
                                        return t_(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    if (!("Enter" === e.key && c)) return [3, 2];
                                                    return e.preventDefault(), e.stopPropagation(), [4, d()];
                                                case 1:
                                                    t.sent(), t.label = 2;
                                                case 2:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                autoFocus: b
                            }), !o && !S && A && (0, eH.jsx)("span", {
                                className: "icon-checkmark-on"
                            }), !o && !S && _ && (0, eH.jsx)("span", {
                                className: "icon-close"
                            }), (0, eH.jsx)("div", {
                                className: "form-control-label bottom-label xsmall",
                                children: !o && _ ? a : h || "\xa0"
                            })]
                        })]
                    })
                },
                tT = function(e) {
                    var t = e.positiveButton,
                        n = e.negativeButton,
                        r = e.children;
                    return (0, eH.jsxs)(eZ.Modal.Footer, {
                        children: [(0, eH.jsxs)("div", {
                            className: "modal-modern-footer-buttons",
                            children: [null !== n && (0, eH.jsx)("button", {
                                type: "button",
                                className: "btn-secondary-md modal-modern-footer-button focus-visible:outline-focus",
                                "aria-label": n.label,
                                disabled: !n.enabled,
                                onClick: n.action,
                                children: n.content
                            }), (0, eH.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md modal-modern-footer-button focus-visible:outline-focus",
                                "aria-label": t.label,
                                disabled: !t.enabled,
                                onClick: t.action,
                                children: t.content
                            })]
                        }), r]
                    })
                },
                tD = "URL_NOT_FOUND",
                tg = null != (Y = eQ.EnvironmentUrls.twoStepVerificationApi) ? Y : tD,
                tR = null != (H = eQ.EnvironmentUrls.economyApi) ? H : tD,
                tC = null != (Q = eQ.EnvironmentUrls.tradesApi) ? Q : tD,
                tw = ((o = {})[o.UNKNOWN = 0] = "UNKNOWN", o[o.INVALID_CHALLENGE_ID = 1] = "INVALID_CHALLENGE_ID", o[o.INVALID_USER_ID = 2] = "INVALID_USER_ID", o[o.INVALID_EMAIL = 3] = "INVALID_EMAIL", o[o.INVALID_PASSWORD = 4] = "INVALID_PASSWORD", o[o.TOO_MANY_REQUESTS = 5] = "TOO_MANY_REQUESTS", o[o.PIN_LOCKED = 6] = "PIN_LOCKED", o[o.FEATURE_DISABLED = 7] = "FEATURE_DISABLED", o[o.NOT_ALLOWED = 8] = "NOT_ALLOWED", o[o.INVALID_CONFIGURATION = 9] = "INVALID_CONFIGURATION", o[o.INVALID_CODE = 10] = "INVALID_CODE", o[o.CONFIGURATION_ALREADY_ENABLED = 11] = "CONFIGURATION_ALREADY_ENABLED", o[o.INVALID_SETUP_TOKEN = 12] = "INVALID_SETUP_TOKEN", o[o.REAUTHENTICATION_REQUIRED = 13] = "REAUTHENTICATION_REQUIRED", o[o.INVALID_PHONE_NUMBER = 15] = "INVALID_PHONE_NUMBER", o[o.EXCEEDED_REGISTERED_KEYS_LIMIT = 16] = "EXCEEDED_REGISTERED_KEYS_LIMIT", o[o.INVALID_CREDENTIAL_NICKNAME = 17] = "INVALID_CREDENTIAL_NICKNAME", o[o.AUTHENTICATOR_CODE_ALREADY_USED = 18] = "AUTHENTICATOR_CODE_ALREADY_USED", o[o.CHALLENGE_DENIED = 19] = "CHALLENGE_DENIED", o[o.CROSS_DEVICE_DIALOG_EXPIRED = 20] = "CROSS_DEVICE_DIALOG_EXPIRED", o),
                tL = {
                    url: "".concat(tg, "/v1/metadata"),
                    withCredentials: !0,
                    timeout: 1e4
                },
                tU = {
                    withCredentials: !0,
                    url: "".concat(tR, "/v2/spend-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                tP = {
                    withCredentials: !0,
                    url: "".concat(tC, "/v1/trade-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                tx = {
                    withCredentials: !0,
                    url: "".concat(tR, "/v2/resale-friction/two-step-verification/status"),
                    timeout: 1e4
                },
                tk = {
                    withCredentials: !0,
                    url: "".concat(tR, "/v2/spend-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                tj = {
                    withCredentials: !0,
                    url: "".concat(tC, "/v1/trade-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                tM = {
                    withCredentials: !0,
                    url: "".concat(tR, "/v2/resale-friction/two-step-verification/generate"),
                    timeout: 1e4
                },
                tF = {
                    withCredentials: !0,
                    url: "".concat(tR, "/v2/spend-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                tK = {
                    withCredentials: !0,
                    url: "".concat(tC, "/v1/trade-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                tV = {
                    withCredentials: !0,
                    url: "".concat(tR, "/v2/resale-friction/two-step-verification/redeem"),
                    timeout: 1e4
                },
                tW = function(e, t) {
                    switch (t) {
                        case tw.INVALID_EMAIL:
                            return e("Message.Error.NoVerifiedEmail");
                        case tw.INVALID_PASSWORD:
                            return e("Message.Error.Email.IncorrectPassword");
                        case tw.TOO_MANY_REQUESTS:
                            return e("Message.Error.TooManyRequests");
                        case tw.PIN_LOCKED:
                            return e("Message.Error.Email.PinLocked");
                        case tw.FEATURE_DISABLED:
                            return e("Response.FeatureDisabled");
                        case tw.INVALID_CODE:
                            return e("Response.Dialog.InvalidCodeError");
                        case tw.CONFIGURATION_ALREADY_ENABLED:
                            return e("Message.Error.AlreadyEnabled");
                        case tw.INVALID_SETUP_TOKEN:
                            return e("Response.Dialog.AuthenticatorSessionExpired");
                        case tw.REAUTHENTICATION_REQUIRED:
                            return e("Message.Error.ReauthenticationRequired");
                        case tw.INVALID_PHONE_NUMBER:
                            return e("Message.Error.InvalidPhoneNumber");
                        case tw.EXCEEDED_REGISTERED_KEYS_LIMIT:
                            return e("Message.Error.ExceededRegisteredKeysLimit");
                        case tw.INVALID_CREDENTIAL_NICKNAME:
                            return e("Message.Error.InvalidCredentialNickname");
                        default:
                            return e("MessageUnknownError")
                    }
                };

            function tG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tB(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function tY(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            tB(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            tB(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function tH(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            c = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tG(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tQ(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tX = function(e) {
                    var t = e.closeModal,
                        n = e7().state,
                        r = n.translate,
                        o = n.eventService,
                        i = n.requestService,
                        a = n.onCreationSuccess,
                        c = n.onGenericError,
                        s = n.credentialPurpose,
                        u = n.modalStateAndProps,
                        l = n.registeredKeys,
                        d = n.registrationSource,
                        f = tH((0, eq.useState)(!1), 2),
                        p = f[0],
                        h = f[1],
                        v = tH((0, eq.useState)(null), 2),
                        E = v[0],
                        y = v[1],
                        N = tH((0, eq.useState)(""), 2),
                        S = N[0],
                        m = N[1],
                        b = function() {
                            return tY(function() {
                                var e, n;
                                return tQ(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            return h(!0), [4, tY(function() {
                                                return tQ(this, function(e) {
                                                    if (u.modalState !== e0.FIDO_CREDENTIAL_NAME) return [2, void 0];
                                                    switch (s) {
                                                        case e8.Login:
                                                            return [2, i.authApi.finishPasskeyRegistration(u.additionalModalProps.sessionId, S, u.additionalModalProps.credential, d)];
                                                        case e8.TwoStepVerification:
                                                            return [2, i.twoStepVerification.enableVerifySecurityKey(te.authenticatedUser.id.toString(), u.additionalModalProps.sessionId, S, u.additionalModalProps.credential)]
                                                    }
                                                    return [2]
                                                })
                                            })()];
                                        case 1:
                                            if (null == (e = l.sent()) ? void 0 : e.isError) {
                                                switch (h(!1), s) {
                                                    case e8.Login:
                                                        t(), c(), o.sendPasskeyRegistrationErrorEvent(String(null != (n = e.error) ? n : ""), td);
                                                        break;
                                                    case e8.TwoStepVerification:
                                                        y(tW(r, e.error))
                                                }
                                                return [2]
                                            }
                                            return t(), a(), [2]
                                    }
                                })
                            })()
                        },
                        A = {
                            content: p ? (0, eH.jsx)("span", {
                                className: "spinner spinner-xs spinner-no-margin"
                            }) : r("Action.Dialog.Success"),
                            label: r("Action.Dialog.Success"),
                            enabled: !p && S.length > 0,
                            action: b
                        };
                    return ((0, eq.useEffect)(function() {
                        s === e8.Login && (S ? b() : tY(function() {
                            var e, t, n, r, o, a, c, s;
                            return tQ(this, function(d) {
                                switch (d.label) {
                                    case 0:
                                        if (e = navigator.userAgent, u.modalState !== e0.FIDO_CREDENTIAL_NAME) return [2, void 0];
                                        if (t = [{
                                                name: "Windows Hello",
                                                condition: function() {
                                                    return /Windows/.test(e)
                                                }
                                            }, {
                                                name: "Chrome on OSX",
                                                condition: function() {
                                                    return /(?!.*(?:OPR|Opera)).*(?:Macintosh|Mac OS|MacOS|OS X).*Chrome.*/.test(e)
                                                }
                                            }, {
                                                name: "iCloud Keychain",
                                                condition: function() {
                                                    return eQ.DeviceMeta && (0, eQ.DeviceMeta)().isIosApp || /(?!.*(?:OPR|Opera)).*(?:Macintosh|Mac OS|MacOS|OS X).*Safari.*/.test(e)
                                                }
                                            }, {
                                                name: "Google Password Manager",
                                                condition: function() {
                                                    return eQ.DeviceMeta && (0, eQ.DeviceMeta)().isAndroidApp
                                                }
                                            }], n = "Passkey", "platform" === JSON.parse(u.additionalModalProps.credential).authenticatorAttachment) {
                                            for (r = 0; r < t.length; r++)
                                                if (t[r].condition()) {
                                                    n = t[r].name;
                                                    break
                                                }
                                        }
                                        return [4, i.authApi.listAllCredentials()];
                                    case 1:
                                        for (a = ((null == (o = d.sent()) ? void 0 : o.isError) ? l : o.value.credentials).map(function(e) {
                                                return e.nickname
                                            }), c = n, s = 1; a.includes(c);) s += 1, c = "".concat(n, " ").concat(s);
                                        return m(c), [2]
                                }
                            })
                        })())
                    }, [S]), s === e8.Login) ? (0, eH.jsx)(ez().Fragment, {}) : (0, eH.jsxs)(ez().Fragment, {
                        children: [(0, eH.jsxs)("div", {
                            className: "modal-header",
                            children: [(0, eH.jsx)("div", {
                                className: "modal-modern-header-button",
                                children: (0, eH.jsxs)("button", {
                                    type: "button",
                                    className: "close",
                                    onClick: t,
                                    children: [(0, eH.jsx)("span", {
                                        "aria-hidden": "true",
                                        children: (0, eH.jsx)("span", {
                                            className: "icon-close"
                                        })
                                    }), (0, eH.jsx)("span", {
                                        className: "sr-only",
                                        children: r("Action.Dialog.Close")
                                    })]
                                })
                            }), (0, eH.jsx)("div", {
                                className: "modal-title",
                                children: (0, eH.jsx)("h4", {
                                    children: (0, eH.jsx)("span", {
                                        children: r("Heading.NameSecurityKey")
                                    })
                                })
                            })]
                        }), (0, eH.jsxs)(eZ.Modal.Body, {
                            children: [(0, eH.jsx)("div", {
                                className: "result-security-key-modal modal-margin-bottom",
                                children: (0, eH.jsx)("div", {
                                    children: r("Description.SecurityKey.NameKey")
                                })
                            }), (0, eH.jsx)(tO, {
                                id: "securityKeyName",
                                inputType: "text",
                                disabled: p,
                                value: S,
                                setValue: m,
                                error: E,
                                setError: y,
                                validate: tI,
                                canSubmit: S.length > 0,
                                handleSubmit: b,
                                onChange: function() {
                                    return y(null)
                                },
                                autoComplete: "off",
                                placeholder: r("Label.SecurityKey.Name"),
                                maxLength: 40,
                                hideFeedback: !0
                            })]
                        }), (0, eH.jsx)(tT, {
                            positiveButton: A,
                            negativeButton: null
                        })]
                    })
                },
                tq = function(e) {
                    var t = e.closeModal,
                        n = e7(),
                        r = n.state,
                        o = r.eventService,
                        i = r.translate,
                        a = n.dispatch;
                    (0, eq.useEffect)(function() {
                        o.sendPasskeyRegistrationModalShownEvent()
                    }, []);
                    var c = function() {
                        o.sendPasskeyRegistrationButtonClickedEvent(ta), t()
                    };
                    return (0, eH.jsxs)("div", {
                        className: "result-fido-credential-modal",
                        children: [(0, eH.jsxs)("div", {
                            className: "modal-header",
                            children: [(0, eH.jsx)("div", {
                                className: "modal-modern-header-button",
                                children: (0, eH.jsxs)("button", {
                                    type: "button",
                                    className: "close",
                                    onClick: c,
                                    children: [(0, eH.jsx)("span", {
                                        "aria-hidden": "true",
                                        children: (0, eH.jsx)("span", {
                                            className: "icon-close"
                                        })
                                    }), (0, eH.jsx)("span", {
                                        className: "sr-only",
                                        children: i("Action.Dialog.Close")
                                    })]
                                })
                            }), (0, eH.jsx)("div", {
                                className: "modal-title",
                                children: (0, eH.jsx)("h4", {
                                    className: "fido-credential-header",
                                    children: i("Heading.AddAPasskey")
                                })
                            })]
                        }), (0, eH.jsx)(eZ.Modal.Body, {
                            children: (0, eH.jsx)("div", {
                                className: "fido-credential-description-centered",
                                children: (0, eH.jsxs)("p", {
                                    children: [i("Description.PasskeysSecurityWarning"), (0, eH.jsx)("a", {
                                        href: tv,
                                        target: "_blank",
                                        rel: "noreferrer",
                                        className: "text-link learn-more-link",
                                        children: i("Label.LearnMore")
                                    })]
                                })
                            })
                        }), (0, eH.jsx)(eZ.Modal.Footer, {
                            children: (0, eH.jsxs)("div", {
                                className: "fido-credential-dual-button-container",
                                children: [(0, eH.jsx)("button", {
                                    type: "submit",
                                    className: "btn-control-md btn-full-width",
                                    style: {
                                        display: "inline"
                                    },
                                    onClick: c,
                                    children: i("Action.Cancel")
                                }), (0, eH.jsx)("button", {
                                    type: "submit",
                                    className: "btn-growth-md btn-full-width",
                                    style: {
                                        display: "inline"
                                    },
                                    onClick: function() {
                                        o.sendPasskeyRegistrationButtonClickedEvent(tc), a({
                                            type: e1.SET_MODAL_STATE,
                                            modalState: e0.FIDO_CREDENTIAL_ENABLE,
                                            additionalModalProps: null
                                        })
                                    },
                                    children: i("Action.Dialog.Continue")
                                })]
                            })
                        })]
                    })
                };

            function tz(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function tJ(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            tz(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            tz(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function t$(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tZ = function(e) {
                var t, n, r, o = e.closeModal,
                    i = e7(),
                    a = i.state,
                    c = a.translate,
                    s = a.eventService,
                    u = a.requestService,
                    l = a.onDeleteSuccess,
                    d = a.onLastKeyDeleted,
                    f = a.onGenericError,
                    p = a.credentialPurpose,
                    h = a.modalStateAndProps,
                    v = a.registeredKeys,
                    E = i.dispatch;
                if (h.modalState !== e0.FIDO_CREDENTIAL_DELETE) return (0, eH.jsx)(ez().Fragment, {});
                switch (p) {
                    case e8.Login:
                        t = "Heading.RemovePasskey", n = "Description.PasskeyDeletionWarning", r = "Description.PasskeyMayStillAppear";
                        break;
                    case e8.TwoStepVerification:
                        t = "Heading.RemoveSecurityKey", n = "Description.SecurityKey.Deletion", r = "Description.SecurityKey.Warning"
                }
                return (0, eH.jsxs)("div", {
                    className: "result-fido-credential-modal",
                    children: [(0, eH.jsxs)("div", {
                        className: "modal-header",
                        children: [(0, eH.jsx)("div", {
                            className: "modal-modern-header-button",
                            children: (0, eH.jsxs)("button", {
                                type: "button",
                                className: "close",
                                onClick: o,
                                children: [(0, eH.jsx)("span", {
                                    "aria-hidden": "true",
                                    children: (0, eH.jsx)("span", {
                                        className: "icon-close"
                                    })
                                }), (0, eH.jsx)("span", {
                                    className: "sr-only",
                                    children: c("Action.Dialog.Close")
                                })]
                            })
                        }), (0, eH.jsx)("div", {
                            className: "modal-title",
                            children: (0, eH.jsx)("h4", {
                                children: (0, eH.jsx)("span", {
                                    children: c(t)
                                })
                            })
                        })]
                    }), (0, eH.jsxs)(eZ.Modal.Body, {
                        children: [(0, eH.jsx)("div", {
                            className: "fido-credential-description-centered",
                            children: (0, eH.jsx)("p", {
                                children: c(n)
                            })
                        }), (0, eH.jsx)("div", {
                            className: "fido-credential-description-centered",
                            children: (0, eH.jsxs)("p", {
                                children: [c(r), p === e8.Login && (0, eH.jsx)("a", {
                                    href: tv,
                                    target: "_blank",
                                    rel: "noreferrer",
                                    className: "text-link learn-more-link",
                                    children: c("Label.LearnMore")
                                })]
                            })
                        })]
                    }), (0, eH.jsx)("div", {
                        className: "modal-footer",
                        children: (0, eH.jsxs)("div", {
                            className: "fido-credential-dual-button-container",
                            children: [(0, eH.jsx)("button", {
                                type: "submit",
                                className: "btn-secondary-md btn-full-width",
                                style: {
                                    display: "inline"
                                },
                                onClick: function() {
                                    E({
                                        type: e1.SET_MODAL_STATE,
                                        modalState: e0.FIDO_CREDENTIAL_MANAGE,
                                        additionalModalProps: null
                                    })
                                },
                                children: c("Action.GoBack")
                            }), (0, eH.jsx)("button", {
                                type: "submit",
                                className: "btn-secondary-md btn-full-width",
                                style: {
                                    display: "inline"
                                },
                                onClick: function() {
                                    return tJ(function() {
                                        var e, t;
                                        return t$(this, function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return [4, tJ(function() {
                                                        return t$(this, function(e) {
                                                            switch (p) {
                                                                case e8.Login:
                                                                    return [2, u.authApi.deletePasskeyBatch(h.additionalModalProps.keysToDeleteNames, v.length)];
                                                                case e8.TwoStepVerification:
                                                                    return [2, u.twoStepVerification.deleteSecurityKey(te.authenticatedUser.id.toString(), h.additionalModalProps.keysToDeleteNames)]
                                                            }
                                                            return [2]
                                                        })
                                                    })()];
                                                case 1:
                                                    if ((e = n.sent()).isError) return o(), eQ.AccountIntegrityChallengeService.Generic.ChallengeError.matchAbandoned(e.errorRaw) || (f(), s.sendPasskeyRegistrationErrorEvent(String(null != (t = e.error) ? t : ""), tf)), [2];
                                                    return h.additionalModalProps.deletedAllKeys && d(), o(), l(), [2]
                                            }
                                        })
                                    })()
                                },
                                children: c("Action.DeleteSecurityKey")
                            })]
                        })
                    })]
                })
            };

            function t0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function t1(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var t2 = function(e) {
                    var t, n, r, o, i = e.closeModal,
                        a = e7(),
                        c = a.state,
                        s = c.translate,
                        u = c.credentialPurpose,
                        l = c.registeredKeys,
                        d = c.modalStateAndProps,
                        f = c.fido2Supported,
                        p = c.deleteAllPasskeysAllowed,
                        h = a.dispatch,
                        v = (t = (0, eq.useState)(f), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    c = !1;
                                try {
                                    for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                                } catch (e) {
                                    c = !0, r = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (c) throw r
                                    }
                                }
                                return i
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return t0(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return t0(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        E = v[0],
                        y = v[1];
                    if ((0, eq.useEffect)(function() {
                            var e;
                            void 0 === E && (e = function() {
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
                                    return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                        return this
                                    }), a;

                                    function c(c) {
                                        return function(s) {
                                            var u = [c, s];
                                            if (n) throw TypeError("Generator is already executing.");
                                            for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                                if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                                switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                        i.label++, r = u[1], u = [0];
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
                                                u = [6, e], r = 0
                                            } finally {
                                                n = o = 0
                                            }
                                            if (5 & u[0]) throw u[1];
                                            return {
                                                value: u[0] ? u[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!(eQ.DeviceMeta && (0, eQ.DeviceMeta)().isInApp)) return [3, 4];
                                            if (!((0, eQ.DeviceMeta)().isIosApp || (0, eQ.DeviceMeta)().isAndroidApp)) return [3, 2];
                                            return [4, e9.hybridResponseService.getNativeResponse(e9.hybridResponseService.FeatureTarget.CREDENTIALS_PROTOCOL_AVAILABLE, {}, 1e4)];
                                        case 1:
                                            return y("true" === e.sent()), [3, 3];
                                        case 2:
                                            y(!1), e.label = 3;
                                        case 3:
                                            return [3, 5];
                                        case 4:
                                            try {
                                                y(void 0 !== PublicKeyCredential)
                                            } catch (e) {
                                                y(!1)
                                            }
                                            e.label = 5;
                                        case 5:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    n = arguments;
                                return new Promise(function(r, o) {
                                    var i = e.apply(t, n);

                                    function a(e) {
                                        t1(i, r, o, a, c, "next", e)
                                    }

                                    function c(e) {
                                        t1(i, r, o, a, c, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        }, []), d.modalState !== e0.FIDO_CREDENTIAL_MANAGE) return (0, eH.jsx)(ez().Fragment, {});
                    var N = function(e) {
                            var t = [e],
                                n = t.length === l.length;
                            h({
                                type: e1.SET_MODAL_STATE,
                                modalState: e0.FIDO_CREDENTIAL_DELETE,
                                additionalModalProps: {
                                    keysToDeleteNames: t,
                                    deletedAllKeys: n
                                }
                            })
                        },
                        S = function() {
                            switch (u) {
                                case e8.Login:
                                    h({
                                        type: e1.SET_MODAL_STATE,
                                        modalState: e0.FIDO_CREDENTIAL_CONFIRM_TRUST,
                                        additionalModalProps: null
                                    });
                                    break;
                                case e8.TwoStepVerification:
                                    h({
                                        type: e1.SET_MODAL_STATE,
                                        modalState: e0.FIDO_CREDENTIAL_ENABLE,
                                        additionalModalProps: null
                                    })
                            }
                        };
                    switch (u) {
                        case e8.Login:
                            n = "Heading.ManageYourPasskeys", r = "Action.AddPasskey", o = "passkey-icon";
                            break;
                        case e8.TwoStepVerification:
                            n = "Heading.ManageYourSecurityKeys", r = "Action.ManageAddSecurityKey", o = "fido-credential-usb-icon-lg"
                    }
                    var m = p || l.length > 1,
                        b = l.map(function(e) {
                            return (0, eH.jsxs)(ez().Fragment, {
                                children: [(0, eH.jsxs)("div", {
                                    className: "fido-credential-checkbox-container",
                                    children: [(0, eH.jsx)("span", {
                                        className: o
                                    }), (0, eH.jsx)("div", {
                                        className: "fido-credential-name",
                                        children: e.nickname
                                    }), m && (0, eH.jsx)("button", {
                                        className: "fido-credential-delete-button",
                                        type: "button",
                                        onClick: function() {
                                            return N(e.nickname)
                                        },
                                        children: (0, eH.jsx)("span", {
                                            className: "icon-trash-bin"
                                        })
                                    })]
                                }), (0, eH.jsx)("div", {
                                    className: "rbx-divider"
                                })]
                            }, e.nickname)
                        }),
                        A = (0, eH.jsx)(ez().Fragment, {
                            children: (0, eH.jsxs)("div", {
                                className: "passkey-incompatible-warning",
                                children: [(0, eH.jsx)("span", {
                                    className: "icon-warning-orange passkey-incompatible-icon"
                                }), (0, eH.jsx)("span", {
                                    children: s("Description.DeviceNotCompatible")
                                })]
                            })
                        }),
                        _ = (0, eH.jsx)(ez().Fragment, {
                            children: (0, eH.jsxs)("div", {
                                className: "passkey-compatibility-check",
                                children: [(0, eH.jsx)("div", {
                                    className: "passkey-compatibility-spinner",
                                    children: (0, eH.jsx)("div", {
                                        className: "spinner spinner-sm"
                                    })
                                }), (0, eH.jsx)("span", {
                                    className: "passkey-compatibility-check-message",
                                    children: s("Description.CheckingPasskeyCompatibility")
                                })]
                            })
                        }),
                        I = (0, eH.jsx)(ez().Fragment, {
                            children: (0, eH.jsx)("div", {
                                className: "passkey-manage-warning",
                                children: (0, eH.jsx)("span", {
                                    children: s("Description.NumPasskeysAddedStatus", {
                                        registeredKeys: l.length,
                                        maxKeys: 5
                                    })
                                })
                            })
                        }),
                        O = (0, eH.jsx)(ez().Fragment, {
                            children: (0, eH.jsx)("div", {
                                className: "passkey-manage-warning",
                                children: (0, eH.jsx)("span", {
                                    children: s("Description.LastPasskeyWarning")
                                })
                            })
                        });
                    return (0, eH.jsxs)("div", {
                        className: "result-fido-credential-modal",
                        children: [(0, eH.jsxs)("div", {
                            className: "modal-header fido-credential-modal-header",
                            children: [(0, eH.jsx)("div", {
                                className: "modal-modern-header-button",
                                children: (0, eH.jsxs)("button", {
                                    type: "button",
                                    className: "close",
                                    onClick: i,
                                    children: [(0, eH.jsx)("span", {
                                        "aria-hidden": "true",
                                        children: (0, eH.jsx)("span", {
                                            className: "icon-close"
                                        })
                                    }), (0, eH.jsx)("span", {
                                        className: "sr-only",
                                        children: s("Action.Dialog.Close")
                                    })]
                                })
                            }), (0, eH.jsx)("div", {
                                className: "modal-title",
                                children: (0, eH.jsx)("h4", {
                                    className: "fido-credential-header",
                                    children: (0, eH.jsx)("span", {
                                        children: s(n)
                                    })
                                })
                            })]
                        }), (0, eH.jsxs)(eZ.Modal.Body, {
                            children: [u === e8.TwoStepVerification && (0, eH.jsx)("div", {
                                className: "fido-credential-description",
                                children: s("Label.SecurityKey.RegisteredKey", {
                                    registeredKeysCount: l.length,
                                    totalKeysCount: 5
                                })
                            }), b, l.length < 5 && E && (0, eH.jsxs)("div", {
                                role: "button",
                                onClick: S,
                                onKeyDown: S,
                                tabIndex: 0,
                                className: "fido-credential-add-button",
                                children: [(0, eH.jsx)("div", {
                                    className: "fido-credential-icon-add",
                                    children: (0, eH.jsx)("span", {
                                        className: "icon-plus"
                                    })
                                }), (0, eH.jsx)("p", {
                                    className: "passkey-add-account-text",
                                    children: s(r)
                                })]
                            }), void 0 === E && _, !1 === E && A, E && l.length >= 5 && I, !m && O]
                        })]
                    })
                },
                t4 = function(e) {
                    var t = e.closeModal,
                        n = e7(),
                        r = n.state,
                        o = r.eventService,
                        i = r.translate,
                        a = r.modalStateAndProps,
                        c = n.dispatch;
                    if ((0, eq.useEffect)(function() {
                            o.sendOSDialogErrorEvent()
                        }, []), a.modalState !== e0.FIDO_CREDENTIAL_ERROR) return (0, eH.jsx)(ez().Fragment, {});
                    var s = {
                        content: i("Action.TryAgain"),
                        label: i("Action.TryAgain"),
                        enabled: !0,
                        action: function() {
                            c({
                                type: e1.SET_MODAL_STATE,
                                modalState: e0.FIDO_CREDENTIAL_ENABLE,
                                additionalModalProps: null
                            })
                        }
                    };
                    return (0, eH.jsxs)("div", {
                        className: "result-fido-credential-modal",
                        children: [(0, eH.jsxs)("div", {
                            className: "modal-header",
                            children: [(0, eH.jsx)("div", {
                                className: "modal-modern-header-button",
                                children: (0, eH.jsxs)("button", {
                                    type: "button",
                                    className: "close",
                                    onClick: t,
                                    children: [(0, eH.jsx)("span", {
                                        "aria-hidden": "true",
                                        children: (0, eH.jsx)("span", {
                                            className: "icon-close"
                                        })
                                    }), (0, eH.jsx)("span", {
                                        className: "sr-only",
                                        children: i("Action.Dialog.Close")
                                    })]
                                })
                            }), (0, eH.jsx)("div", {
                                className: "modal-title",
                                children: (0, eH.jsx)("h4", {
                                    children: (0, eH.jsx)("span", {
                                        children: i("Heading.SomethingWentWrong")
                                    })
                                })
                            })]
                        }), (0, eH.jsx)(eZ.Modal.Body, {
                            children: (0, eH.jsx)("div", {
                                className: "fido-credential-description-centered",
                                children: i("Description.UnableToSaveChanges")
                            })
                        }), (0, eH.jsx)(tT, {
                            positiveButton: s,
                            negativeButton: null
                        })]
                    })
                };

            function t3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var t6 = function(e, t) {
                    return {
                        innerFragment: e,
                        canClickBackdropOrEscToClose: t
                    }
                },
                t5 = function(e) {
                    var t = new Map([
                        [e0.FIDO_CREDENTIAL_ENABLE, t6(tm, !1)],
                        [e0.FIDO_CREDENTIAL_NAME, t6(tX, !1)],
                        [e0.FIDO_CREDENTIAL_CONFIRM_TRUST, t6(tq, !0)],
                        [e0.FIDO_CREDENTIAL_ERROR, t6(t4, !0)],
                        [e0.FIDO_CREDENTIAL_DELETE, t6(tZ, !0)],
                        [e0.FIDO_CREDENTIAL_MANAGE, t6(t2, !0)]
                    ]).get(e);
                    return void 0 !== t ? t : null
                },
                t7 = function() {
                    var e, t = e7(),
                        n = t.state,
                        r = n.modalStateAndProps,
                        o = n.registeredKeys,
                        i = n.credentialPurpose,
                        a = t.dispatch,
                        c = (e = (0, eq.useState)(!0), function(e) {
                            if (Array.isArray(e)) return e
                        }(e) || function(e, t) {
                            var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    a = !0,
                                    c = !1;
                                try {
                                    for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
                                } catch (e) {
                                    c = !0, r = e
                                } finally {
                                    try {
                                        a || null == o.return || o.return()
                                    } finally {
                                        if (c) throw r
                                    }
                                }
                                return i
                            }
                        }(e, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return t3(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return t3(e, t)
                            }
                        }(e, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        s = c[0],
                        u = c[1],
                        l = function() {
                            return u(!1)
                        };
                    (0, eq.useEffect)(function() {
                        if (o.length > 0) a({
                            type: e1.SET_MODAL_STATE,
                            modalState: e0.FIDO_CREDENTIAL_MANAGE,
                            additionalModalProps: null
                        });
                        else switch (i) {
                            case e8.Login:
                                a({
                                    type: e1.SET_MODAL_STATE,
                                    modalState: e0.FIDO_CREDENTIAL_CONFIRM_TRUST,
                                    additionalModalProps: null
                                });
                                break;
                            case e8.TwoStepVerification:
                                a({
                                    type: e1.SET_MODAL_STATE,
                                    modalState: e0.FIDO_CREDENTIAL_ENABLE,
                                    additionalModalProps: null
                                })
                        }
                    }, []);
                    var d = t5(r.modalState),
                        f = (r.modalState === e0.FIDO_CREDENTIAL_ENABLE || r.modalState === e0.FIDO_CREDENTIAL_NAME) && i === e8.Login;
                    return (0, eH.jsxs)(ez().Fragment, {
                        children: [d && (0, eH.jsx)(eZ.Modal, {
                            className: "modal-modern",
                            show: s,
                            onHide: l,
                            onExited: function() {
                                a({
                                    type: e1.SET_MODAL_STATE,
                                    modalState: e0.NONE,
                                    additionalModalProps: null
                                }), u(!0)
                            },
                            backdrop: d.canClickBackdropOrEscToClose ? void 0 : "static",
                            keyboard: d.canClickBackdropOrEscToClose,
                            children: (0, eH.jsx)(d.innerFragment, {
                                closeModal: l
                            })
                        }), f && (0, eH.jsx)("div", {
                            className: "centered-spinner",
                            children: (0, eH.jsx)("div", {
                                className: "spinner-donut"
                            })
                        })]
                    })
                },
                t8 = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function")
                    }
                    return e = [{
                            key: "sendPasskeyRegistrationModalShownEvent",
                            value: function() {
                                e9.eventStreamService.sendEventWithTarget(to, tt, {
                                    state: ts
                                })
                            }
                        }, {
                            key: "sendPasskeyRegistrationButtonClickedEvent",
                            value: function(e) {
                                e9.eventStreamService.sendEventWithTarget(tr, tt, {
                                    btn: e
                                })
                            }
                        }, {
                            key: "sendOSDialogErrorEvent",
                            value: function() {
                                e9.eventStreamService.sendEventWithTarget(to, tn, {
                                    state: tu
                                })
                            }
                        }, {
                            key: "sendPasskeyRegistrationErrorEvent",
                            value: function(e, t) {
                                e9.eventStreamService.sendEventWithTarget(ti, tn, {
                                    state: e,
                                    origin: t
                                })
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }(),
                t9 = window.CoreUtilities,
                ne = function(e) {
                    return {
                        isError: !1,
                        value: e
                    }
                },
                nt = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: e,
                        errorRaw: t,
                        errorStatusCode: n
                    }
                },
                nn = function(e, t) {
                    return e.isError ? e : ne(t(e.value))
                };

            function nr(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function no(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            nr(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            nr(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ni(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function na(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nc = function(e) {
                    var t, n = [];
                    if (!e || (void 0 === e ? "undefined" : ni(e)) !== "object") return [];
                    var r = e.errors;
                    return (null != (t = Array) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? t[Symbol.hasInstance](r) : r instanceof t) ? (r.forEach(function(e) {
                        if (e && (void 0 === e ? "undefined" : ni(e)) === "object") {
                            var t = e.code;
                            "number" == typeof t && n.push(t)
                        }
                    }), n) : []
                },
                ns = function(e) {
                    return (void 0 === e ? "undefined" : ni(e)) !== "object" ? null : nc(e.data)[0] || null
                },
                nu = function(e, t) {
                    return null == e ? null : Object.values(e).includes(t) ? t : null
                },
                nl = function(e) {
                    if ((void 0 === e ? "undefined" : ni(e)) !== "object" || null === e) return null;
                    var t = e.status || null;
                    return "number" != typeof t ? null : t
                },
                nd = function(e, t, n) {
                    return no(function() {
                        var r, o, i, a;
                        return na(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    return c.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (r = c.sent(), void 0 !== n) return [2, ne(n(r.data))];
                                    return [2, ne(r.data)];
                                case 2:
                                    return i = ns(o = c.sent()), a = nl(o), [2, nt(nu(t, i), o, a)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                nf = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : ns,
                        r = arguments.length > 3 ? arguments[3] : void 0;
                    return no(function() {
                        var o, i;
                        return na(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return a.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (o = a.sent(), void 0 !== r) return [2, ne(r(o))];
                                    return [2, ne(o)];
                                case 2:
                                    return [2, nt(nu(t, n(i = a.sent())), i, 0)];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                np = null != (X = eQ.EnvironmentUrls.apiGatewayCdnUrl) ? X : "URL_NOT_FOUND",
                nh = ((i = {})[i.UNKNOWN = 0] = "UNKNOWN", i),
                nv = {
                    url: "".concat("".concat(np, "/captcha"), "/v1/metadata"),
                    timeout: 6e4
                },
                nE = function() {
                    return nd(t9.httpService.get(nv, {}), nh)
                },
                ny = null != (q = eQ.EnvironmentUrls.accountSettingsApi) ? q : "URL_NOT_FOUND",
                nN = ((a = {})[a.UNKNOWN = 0] = "UNKNOWN", a[a.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", a[a.TOO_MANY_ACCOUNTS_ON_EMAIL = 3] = "TOO_MANY_ACCOUNTS_ON_EMAIL", a[a.UPDATED_EMAIL_IS_EXISTING_EMAIL = 4] = "UPDATED_EMAIL_IS_EXISTING_EMAIL", a[a.TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL = 6] = "TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL", a[a.INVALID_EMAIL_ADDRESS = 9] = "INVALID_EMAIL_ADDRESS", a),
                nS = {
                    withCredentials: !0,
                    url: "".concat(ny, "/v1/email"),
                    timeout: 1e4
                },
                nm = {
                    withCredentials: !0,
                    url: "".concat(ny, "/v1/email"),
                    timeout: 1e4
                },
                nb = function(e) {
                    return nd(t9.httpService.post(nS, {
                        emailAddress: e,
                        skipVerificationEmail: !0
                    }), nN)
                },
                nA = function(e) {
                    return nd(t9.httpService.post(nS, {
                        emailAddress: e,
                        skipVerificationEmail: !1
                    }), nN)
                },
                n_ = function() {
                    return nd(t9.httpService.get(nm), nN)
                },
                nI = window.Roblox["core-scripts"].http.http,
                nO = window.Roblox["core-scripts"].environmentUrls,
                nT = n.n(nO),
                nD = nT().apiGatewayUrl,
                ng = ((c = {})[c.UNKNOWN = 0] = "UNKNOWN", c[c.INVALID_REQUEST = 1] = "INVALID_REQUEST", c[c.SESSION_NOT_FOUND = 2] = "SESSION_NOT_FOUND", c[c.INTERNAL_ERROR = 3] = "INTERNAL_ERROR", c),
                nR = {
                    withCredentials: !0,
                    url: "".concat(nD, "/v2/captcha"),
                    timeout: 1e4,
                    headers: {
                        Accept: "application/json"
                    }
                },
                nC = function(e) {
                    return nd(nI.post(nR, {
                        challenge_id: e
                    }), ng)
                },
                nw = null != (z = eQ.EnvironmentUrls.gamesApi) ? z : "URL_NOT_FOUND",
                nL = ((s = {})[s.UNKNOWN = 0] = "UNKNOWN", s),
                nU = {
                    url: "".concat(nw, "/v1/games"),
                    timeout: 1e4
                },
                nP = function(e) {
                    return nd(t9.httpService.get(nU, {
                        universeIds: e
                    }), nL)
                },
                nx = ((u = {})[u.UNKNOWN = 0] = "UNKNOWN", u),
                nk = {
                    withCredentials: !0,
                    url: "/my/settings/json",
                    timeout: 1e4
                },
                nj = function() {
                    return nd(t9.httpService.get(nk, {}), nx)
                },
                nM = null != (J = eQ.EnvironmentUrls.apiGatewayUrl) ? J : "URL_NOT_FOUND",
                nF = "".concat(nM, "/otp-service"),
                nK = ((l = {})[l.NO_ERROR = 0] = "NO_ERROR", l[l.UNKNOWN = 1] = "UNKNOWN", l[l.INVALID_CODE = 2] = "INVALID_CODE", l[l.INVALID_SESSION_TOKEN = 3] = "INVALID_SESSION_TOKEN", l[l.CODE_EXPIRED = 4] = "CODE_EXPIRED", l[l.UNVALIDATED_SESSION_TOKEN = 5] = "UNVALIDATED_SESSION_TOKEN", l[l.TOO_MANY_REQUESTS = 6] = "TOO_MANY_REQUESTS", l[l.CONTACT_MALFORMED = 7] = "CONTACT_MALFORMED", l[l.VPN_REQUIRED = 8] = "VPN_REQUIRED", l[l.UNAUTHENTICATED = 9] = "UNAUTHENTICATED", l[l.METHOD_UNAVAILABLE = 10] = "METHOD_UNAVAILABLE", l),
                nV = {
                    withCredentials: !0,
                    url: "".concat(nF, "/v1/sendCodeForUser"),
                    timeout: 1e4
                },
                nW = {
                    withCredentials: !0,
                    url: "".concat(nF, "/v1/resendCode"),
                    timeout: 1e4
                },
                nG = {
                    withCredentials: !0,
                    url: "".concat(nF, "/v1/validateCode"),
                    timeout: 1e4
                },
                nB = {
                    withCredentials: !0,
                    url: "".concat(nF, "/v1/metadata"),
                    timeout: 1e4
                },
                nY = ((d = {}).Reauth = "Reauth", d.Challenge = "Challenge", d),
                nH = ((f = {}).Default = "Default", f),
                nQ = function(e) {
                    return nd(t9.httpService.post(nV, {
                        contactType: e,
                        origin: nY.Reauth,
                        messageVariant: nH.Default
                    }), nK)
                },
                nX = function(e, t) {
                    return nd(t9.httpService.post(nW, {
                        contactType: e,
                        origin: nY.Reauth,
                        otpSessionToken: t
                    }), nK)
                },
                nq = function(e, t, n) {
                    return nd(t9.httpService.post(nG, {
                        contactType: e,
                        origin: nY.Reauth,
                        passCode: n,
                        otpSessionToken: t
                    }), nK)
                },
                nz = function(e) {
                    return nd(t9.httpService.get(nB, {
                        Origin: e
                    }), nK)
                },
                nJ = null != ($ = eQ.EnvironmentUrls.authApi) ? $ : "URL_NOT_FOUND",
                n$ = ((p = {})[p.FLOODED = 2] = "FLOODED", p[p.INVALID_PASSWORD = 7] = "INVALID_PASSWORD", p[p.INVALID_CURRENT_PASSWORD = 8] = "INVALID_CURRENT_PASSWORD", p),
                nZ = {
                    withCredentials: !0,
                    url: "".concat(nJ, "/v2/user/passwords/change"),
                    timeout: 1e4
                },
                n0 = ((h = {})[h.USER_DOES_NOT_HAVE_EMAIL = 22] = "USER_DOES_NOT_HAVE_EMAIL", h),
                n1 = {
                    withCredentials: !0,
                    url: "".concat(nJ, "/v2/passwords/reset/send-prompted"),
                    timeout: 1e4
                },
                n2 = ((v = {})[v.VALID_PASSWORD = 0] = "VALID_PASSWORD", v[v.WEAK_PASSWORD = 1] = "WEAK_PASSWORD", v[v.SHORT_PASSWORD = 2] = "SHORT_PASSWORD", v[v.PASSWORD_SAME_AS_USERNAME = 3] = "PASSWORD_SAME_AS_USERNAME", v[v.FORBIDDEN_PASSWORD = 4] = "FORBIDDEN_PASSWORD", v[v.DUMB_STRINGS = 5] = "DUMB_STRINGS", v),
                n4 = {
                    withCredentials: !0,
                    url: "".concat(nJ, "/v2/passwords/validate"),
                    timeout: 1e4
                };

            function n3(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var n6 = function(e, t) {
                    return nd(t9.httpService.post(nZ, {
                        currentPassword: e,
                        newPassword: t
                    }), n$)
                },
                n5 = function() {
                    return nd(t9.httpService.post(n1), n0)
                },
                n7 = function(e, t) {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, nd(t9.httpService.post(n4, {
                                username: e,
                                password: t
                            }), null).then(function(e) {
                                return nn(e, function(e) {
                                    return nu(n2, e.code)
                                })
                            })]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                n3(i, r, o, a, c, "next", e)
                            }

                            function c(e) {
                                n3(i, r, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                n8 = "URL_NOT_FOUND",
                n9 = null != (Z = eQ.EnvironmentUrls.accountInformationApi) ? Z : n8,
                re = null != (ee = eQ.EnvironmentUrls.apiGatewayUrl) ? ee : n8,
                rt = ((E = {})[E.UNKNOWN = 0] = "UNKNOWN", E),
                rn = {
                    withCredentials: !0,
                    url: "".concat(n9, "/v1/phone"),
                    timeout: 1e4
                },
                rr = {
                    withCredentials: !0,
                    url: "".concat(n9, "/v1/phone"),
                    timeout: 1e4
                },
                ro = {
                    withCredentials: !0,
                    url: "".concat(n9, "/v1/phone/verify"),
                    timeout: 1e4
                },
                ri = {
                    withCredentials: !0,
                    url: "".concat(n9, "/v1/phone/resend"),
                    timeout: 1e4
                },
                ra = ((y = {})[y.UNKNOWN = 0] = "UNKNOWN", y[y.INVALID = 2] = "INVALID", y),
                rc = ((N = {})[N.UNKNOWN = 0] = "UNKNOWN", N[N.INVALID = 7] = "INVALID", N),
                rs = ((S = {})[S.UNKNOWN = 0] = "UNKNOWN", S),
                ru = {
                    withCredentials: !0,
                    url: "".concat(re, "/phone-number-api/v1/phone-prefix-list"),
                    timeout: 1e4
                };

            function rl(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function rd(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            rl(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            rl(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rf(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rp = function() {
                    return rd(function() {
                        return rf(this, function(e) {
                            return [2, nd(t9.httpService.get(rn, {}), rt)]
                        })
                    })()
                },
                rh = function(e) {
                    var t = e.find(function(e) {
                            return e.isDefault
                        }),
                        n = e;
                    return void 0 !== t && (n = e.filter(function(e) {
                        return e.code !== t.code
                    })).unshift(t), n
                },
                rv = function() {
                    return rd(function() {
                        return rf(this, function(e) {
                            return [2, nd(t9.httpService.get(ru, {}), rt, rh)]
                        })
                    })()
                },
                rE = function(e) {
                    return rd(function() {
                        return rf(this, function(t) {
                            return [2, nd(t9.httpService.post(rr, e), ra)]
                        })
                    })()
                },
                ry = function(e) {
                    return rd(function() {
                        return rf(this, function(t) {
                            return [2, nd(t9.httpService.post(ro, e), rc)]
                        })
                    })()
                },
                rN = function(e) {
                    return rd(function() {
                        return rf(this, function(t) {
                            return [2, nd(t9.httpService.post(ri, e), rs)]
                        })
                    })()
                },
                rS = null != (et = eQ.EnvironmentUrls.authApi) ? et : "URL_NOT_FOUND",
                rm = "palisades-live",
                rb = ((m = {})[m.UNKNOWN = 0] = "UNKNOWN", m),
                rA = {
                    withCredentials: !0,
                    url: "".concat(rS, "/v1/").concat(rm, "/is-live"),
                    timeout: 1e4
                },
                r_ = {
                    withCredentials: !0,
                    url: "".concat(rS, "/v1/").concat(rm, "/disconnect"),
                    timeout: 1e4
                },
                rI = function() {
                    return nd(t9.httpService.get(rA, {}), rb)
                },
                rO = function() {
                    return nd(t9.httpService.post(r_, {}), rb)
                },
                rT = null != (en = eQ.EnvironmentUrls.apiGatewayUrl) ? en : "URL_NOT_FOUND",
                rD = "".concat(rT, "/account-security-service"),
                rg = ((b = {})[b.UNKNOWN = 1] = "UNKNOWN", b[b.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", b[b.PROMPT_ASSIGNMENT_WAS_NOT_UPDATED = 3] = "PROMPT_ASSIGNMENT_WAS_NOT_UPDATED", b[b.UNKNOWN_PROMPT_TYPE = 4] = "UNKNOWN_PROMPT_TYPE", b),
                rR = ((A = {}).TEXT_ONLY_BANNER = "DISPLAY_TYPE_TEXT_ONLY_BANNER", A),
                rC = ((_ = {}).CHANGE_PASSWORD__SUSPECTED_COMPROMISE = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", _.CHANGE_PASSWORD__BREACHED_CREDENTIAL = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", _.AUTHENTICATOR_UPSELL = "PROMPT_TYPE_AUTHENTICATOR_UPSELL", _.ACCOUNT_RESTORES_POLICY_UPDATE = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", _.ACCOUNT_RESTORES_POLICY_UPDATE_V2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", _.ACCOUNT_RESTORES_POLICY_UPDATE_V3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", _.ACCOUNT_RESTORES_POLICY_UPSELL = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL", _.BROADER_AUTHENTICATOR_UPSELL = "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL", _.EMAIL_2SV_UPSELL = "PROMPT_TYPE_EMAIL_2SV_UPSELL", _),
                rw = {
                    withCredentials: !0,
                    url: "".concat(rD, "/v1/prompt-assignments"),
                    timeout: 1e4
                },
                rL = {
                    withCredentials: !0,
                    url: "".concat(rD, "/v1/prompt-assignments"),
                    timeout: 1e4
                };

            function rU(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var rP = function() {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
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
                                    return [4, nd(t9.httpService.get(rw, {
                                        shouldReturnMetadata: !0
                                    }), rg)];
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
                                            return e.isGeneric ? Object.values(rR).includes(e.metadata.displayType) : Object.values(rC).includes(e.promptType)
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
                                rU(i, r, o, a, c, "next", e)
                            }

                            function c(e) {
                                rU(i, r, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                rx = function(e, t) {
                    return nd(t9.httpService.post(rL, {
                        action: e,
                        promptType: t
                    }), rg)
                },
                rk = null != (er = eQ.EnvironmentUrls.apiGatewayUrl) ? er : "URL_NOT_FOUND",
                rj = ((I = {})[I.UNKNOWN = 0] = "UNKNOWN", I[I.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", I[I.INVALID_REQUEST = 2] = "INVALID_REQUEST", I[I.INVALID_SESSION = 3] = "INVALID_SESSION", I),
                rM = {
                    withCredentials: !0,
                    url: "".concat("".concat(rk, "/proof-of-space"), "/v1/verify"),
                    timeout: 1e4
                };

            function rF(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var rK = function(e, t) {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, nd(t9.httpService.post(rM, {
                                challengeId: e,
                                solution: t
                            }), rj)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                rF(i, r, o, a, c, "next", e)
                            }

                            function c(e) {
                                rF(i, r, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                rV = null != (eo = eQ.EnvironmentUrls.apiGatewayUrl) ? eo : "URL_NOT_FOUND",
                rW = "".concat(rV, "/proof-of-work-service"),
                rG = ((O = {})[O.UNKNOWN = 0] = "UNKNOWN", O[O.REQUEST_INVALID = 1] = "REQUEST_INVALID", O[O.SESSION_INACTIVE = 2] = "SESSION_INACTIVE", O),
                rB = {
                    withCredentials: !0,
                    url: "".concat(rW, "/v1/pow-puzzle"),
                    timeout: 1e4
                },
                rY = {
                    withCredentials: !0,
                    url: "".concat(rW, "/v1/pow-puzzle"),
                    timeout: 1e4
                };

            function rH(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var rQ = function(e) {
                    return nd(t9.httpService.get(rB, {
                        sessionID: e
                    }), rG)
                },
                rX = function(e, t) {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, nd(t9.httpService.post(rY, {
                                sessionID: e,
                                solution: t
                            }), rG)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                rH(i, r, o, a, c, "next", e)
                            }

                            function c(e) {
                                rH(i, r, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                rq = null != (ei = eQ.EnvironmentUrls.apiGatewayUrl) ? ei : "URL_NOT_FOUND",
                rz = ((T = {})[T.UNKNOWN = 0] = "UNKNOWN", T[T.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", T[T.INVALID_REQUEST = 2] = "INVALID_REQUEST", T[T.INVALID_SESSION = 3] = "INVALID_SESSION", T),
                rJ = {
                    withCredentials: !0,
                    url: "".concat("".concat(rq, "/rostile"), "/v1/verify"),
                    timeout: 1e4
                };

            function r$(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var rZ = function(e, t) {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            return [2, nd(t9.httpService.post(rJ, {
                                challengeId: e,
                                solution: t
                            }), rz)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, o) {
                            var i = n.apply(e, t);

                            function a(e) {
                                r$(i, r, o, a, c, "next", e)
                            }

                            function c(e) {
                                r$(i, r, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                r0 = null != (ea = eQ.EnvironmentUrls.apiGatewayUrl) ? ea : "URL_NOT_FOUND",
                r1 = "".concat(r0, "/account-security-service"),
                r2 = ((D = {})[D.UNKNOWN = 1] = "UNKNOWN", D[D.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", D[D.SECURITY_QUESTIONS_DISABLED = 3] = "SECURITY_QUESTIONS_DISABLED", D[D.SESSION_INACTIVE = 4] = "SESSION_INACTIVE", D[D.QUESTION_NOT_FOUND = 5] = "QUESTION_NOT_FOUND", D[D.ANSWER_WRONG_FORMAT = 6] = "ANSWER_WRONG_FORMAT", D),
                r4 = {
                    withCredentials: !0,
                    url: "".concat(r1, "/v1/security-question"),
                    timeout: 1e4
                },
                r3 = {
                    withCredentials: !0,
                    url: "".concat(r1, "/v1/security-question"),
                    timeout: 1e4
                },
                r6 = function(e, t) {
                    return nd(t9.httpService.get(r4, {
                        userId: e,
                        sessionId: t
                    }), r2)
                },
                r5 = function(e, t, n) {
                    return nd(t9.httpService.post(r3, {
                        userId: e,
                        answer: t,
                        sessionId: n
                    }), r2)
                },
                r7 = "URL_NOT_FOUND",
                r8 = null != (ec = eQ.EnvironmentUrls.apiGatewayUrl) ? ec : r7,
                r9 = null != (es = eQ.EnvironmentUrls.authApi) ? es : r7,
                oe = "".concat(r8, "/token-metadata-service"),
                ot = ((g = {})[g.UNKNOWN = 1] = "UNKNOWN", g[g.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", g[g.ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN = 3] = "ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN", g),
                on = ((R = {})[R.UNKNOWN = 1] = "UNKNOWN", R),
                or = {
                    withCredentials: !0,
                    url: "".concat(oe, "/v1/sessions"),
                    timeout: 1e4
                },
                oo = {
                    withCredentials: !0,
                    url: "".concat(oe, "/v1/logout"),
                    timeout: 1e4
                },
                oi = {
                    withCredentials: !0,
                    url: "".concat(r9, "/v1/logoutfromallsessionsandreauthenticate"),
                    timeout: 1e4
                };

            function oa(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function oc(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            oa(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            oa(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function os(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ou = function(e, t) {
                    return oc(function() {
                        return os(this, function(n) {
                            return [2, nd(t9.httpService.get(or, {
                                nextCursor: e,
                                desiredLimit: t
                            }), ot)]
                        })
                    })()
                },
                ol = function(e) {
                    return oc(function() {
                        return os(this, function(t) {
                            return [2, nd(t9.httpService.post(oo, {
                                token: e
                            }), ot)]
                        })
                    })()
                },
                od = function(e) {
                    return oc(function() {
                        return os(this, function(t) {
                            return [2, nd(t9.httpService.post(oi, {
                                secureAuthenticationIntent: e
                            }), on)]
                        })
                    })()
                },
                of = null != (eu = eQ.EnvironmentUrls.thumbnailsApi) ? eu : "URL_NOT_FOUND",
                op = ((C = {})[C.UNKNOWN = 0] = "UNKNOWN", C),
                oh = {
                    url: "".concat(of, "/v1/games/icons"),
                    timeout: 1e4
                },
                ov = function(e, t, n, r) {
                    return nd(t9.httpService.get(oh, {
                        universeIds: e,
                        size: t,
                        format: n,
                        isCircular: r
                    }), op)
                },
                oE = nT().apiGatewayUrl,
                oy = ((w = {})[w.UNKNOWN = 0] = "UNKNOWN", w),
                oN = {
                    url: "".concat(oE, "/turnstile-service/v1/metadata"),
                    timeout: 1e4
                },
                oS = function(e) {
                    return nd(nI.get(oN, {
                        challenge_id: e
                    }), oy)
                };

            function om(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function ob(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            om(i, r, o, a, c, "next", e)
                        }

                        function c(e) {
                            om(i, r, o, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function oA(e, t) {
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
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var o_ = e9.cryptoUtil.generateSecureAuthIntentV2,
                oI = function(e) {
                    return nd(t9.httpService.get(tL, e || {}), tw)
                },
                oO = function(e, t) {
                    return nd(t9.httpService.get({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration"),
                        timeout: 1e4
                    }, t || {}), tw)
                },
                oT = function(e) {
                    return ob(function() {
                        var t, n, r;
                        return oA(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = t9.httpService.post, n = [{
                                        withCredentials: !0,
                                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/email/enable"),
                                        timeout: 1e4
                                    }], r = {}, [4, o_()];
                                case 1:
                                    return [2, nd.apply(void 0, [t.apply(t9.httpService, n.concat([(r.secureAuthenticationIntent = o.sent(), r)])), tw])]
                            }
                        })
                    })()
                },
                oD = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/email/send-code"),
                        timeout: 1e4
                    }, t), tw)
                },
                og = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/email/verify"),
                        timeout: 1e4
                    }, t), tw)
                },
                oR = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/email/disable"),
                        timeout: 1e4
                    }, {}), tw)
                },
                oC = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/authenticator/enable"),
                        timeout: 1e4
                    }, {}), tw)
                },
                ow = function(e, t, n) {
                    return ob(function() {
                        var r, o, i;
                        return oA(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return r = t9.httpService.post, o = [{
                                        withCredentials: !0,
                                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/authenticator/enable-verify"),
                                        timeout: 1e4
                                    }], i = {
                                        setupToken: t,
                                        code: n
                                    }, [4, o_()];
                                case 1:
                                    return [2, nd.apply(void 0, [r.apply(t9.httpService, o.concat([(i.secureAuthenticationIntent = a.sent(), i)])), tw])]
                            }
                        })
                    })()
                },
                oL = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/authenticator/verify"),
                        timeout: 1e4
                    }, t), tw)
                },
                oU = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/authenticator/disable"),
                        timeout: 1e4
                    }, {}), tw)
                },
                oP = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/recovery-codes/verify"),
                        timeout: 1e4
                    }, t), tw)
                },
                ox = function(e) {
                    return nd(t9.httpService.get({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/recovery-codes"),
                        timeout: 1e4
                    }), tw)
                },
                ok = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/recovery-codes/clear"),
                        timeout: 1e4
                    }, {}), tw)
                },
                oj = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/recovery-codes/regenerate"),
                        timeout: 1e4
                    }, {
                        password: "password"
                    }), tw)
                },
                oM = function(e) {
                    return ob(function() {
                        var t, n, r;
                        return oA(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = t9.httpService.post, n = [{
                                        withCredentials: !0,
                                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/sms/enable"),
                                        timeout: 1e4
                                    }], r = {}, [4, o_()];
                                case 1:
                                    return [2, nd.apply(void 0, [t.apply(t9.httpService, n.concat([(r.secureAuthenticationIntent = o.sent(), r)])), tw])]
                            }
                        })
                    })()
                },
                oF = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/sms/send-code"),
                        timeout: 1e4
                    }, t), tw)
                },
                oK = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/sms/verify"),
                        timeout: 1e4
                    }, t), tw)
                },
                oV = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/sms/disable"),
                        timeout: 1e4
                    }, {}), tw)
                },
                oW = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/security-key/enable"),
                        timeout: 1e4
                    }, {}), tw, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                oG = function(e, t, n, r) {
                    return ob(function() {
                        var o, i, a;
                        return oA(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    return o = t9.httpService.post, i = [{
                                        withCredentials: !0,
                                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/security-key/enable-verify"),
                                        timeout: 1e4
                                    }], a = {
                                        sessionId: t,
                                        credentialNickname: n,
                                        attestationResponse: r
                                    }, [4, o_()];
                                case 1:
                                    return [2, nd.apply(void 0, [o.apply(t9.httpService, i.concat([(a.secureAuthenticationIntent = c.sent(), a)])), tw])]
                            }
                        })
                    })()
                },
                oB = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/security-key/verify-start"),
                        timeout: 1e4
                    }, t), tw)
                },
                oY = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/security-key/verify-finish"),
                        timeout: 1e4
                    }, t), tw)
                },
                oH = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/security-key/disable"),
                        timeout: 1e4
                    }, {
                        credentialNicknames: t
                    }), tw)
                },
                oQ = function(e) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/configuration/security-key/list"),
                        timeout: 1e4
                    }, {}), tw)
                },
                oX = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/passkey/verify-start"),
                        timeout: 1e4
                    }, t), tw)
                },
                oq = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/passkey/verify-finish"),
                        timeout: 1e4
                    }, t), tw)
                },
                oz = function() {
                    return nd(t9.httpService.get(tU, {}), tw)
                },
                oJ = function() {
                    return nd(t9.httpService.get(tP, {}), tw)
                },
                o$ = function() {
                    return nd(t9.httpService.get(tx, {}), tw)
                },
                oZ = function() {
                    return nd(t9.httpService.post(tk, {}), tw)
                },
                o0 = function() {
                    return nd(t9.httpService.post(tj, {}), tw)
                },
                o1 = function() {
                    return nd(t9.httpService.post(tM, {}), tw)
                },
                o2 = function(e, t) {
                    return nd(t9.httpService.post(tF, {
                        challengeToken: e,
                        verificationToken: t
                    }), tw)
                },
                o4 = function(e, t) {
                    return nd(t9.httpService.post(tK, {
                        challengeToken: e,
                        verificationToken: t
                    }), tw)
                },
                o3 = function(e, t) {
                    return nd(t9.httpService.post(tV, {
                        challengeToken: e,
                        verificationToken: t
                    }), tw)
                },
                o6 = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/cross-device/retry"),
                        timeout: 1e4
                    }, t), tw)
                },
                o5 = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/cross-device/verify"),
                        timeout: 1e4
                    }, t), tw)
                },
                o7 = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/cross-device/retract"),
                        timeout: 1e4
                    }, t), tw)
                },
                o8 = function(e, t) {
                    return nd(t9.httpService.post({
                        withCredentials: !0,
                        url: "".concat(tg, "/v1/users/").concat(e, "/challenges/password/verify"),
                        timeout: 1e4
                    }, t), tw)
                },
                o9 = ((L = {})[L.INTERNAL_ERROR = 9] = "INTERNAL_ERROR", L);

            function ie(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var it = function() {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
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
                                    return t.trys.push([0, 2, , 3]), [4, eQ.Guac.callBehaviour("account-settings-ui")];
                                case 1:
                                    return [2, {
                                        isError: !1,
                                        value: t.sent()
                                    }];
                                case 2:
                                    return e = t.sent(), [2, {
                                        isError: !0,
                                        error: o9.INTERNAL_ERROR,
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
                                ie(i, r, o, a, c, "next", e)
                            }

                            function c(e) {
                                ie(i, r, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                ir = null != (el = eQ.EnvironmentUrls.authApi) ? el : "URL_NOT_FOUND",
                io = ((U = {})[U.UNKNOWN = 0] = "UNKNOWN", U),
                ii = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/xbox/connection"),
                    timeout: 1e4
                },
                ia = {
                    withCredentials: !0,
                    url: "".concat(ir, "/v1/xbox/disconnect"),
                    timeout: 1e4
                },
                ic = function() {
                    return nd(t9.httpService.get(ii, {}), io)
                },
                is = function() {
                    return nd(t9.httpService.post(ia, {}), io)
                },
                iu = null != (ed = eQ.EnvironmentUrls.apiGatewayUrl) ? ed : "URL_NOT_FOUND",
                il = ((P = {})[P.UNKNOWN = 1] = "UNKNOWN", P[P.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", P[P.INVAID_METRIC_NAME = 3] = "INVAID_METRIC_NAME", P[P.INVALID_METRIC_LABELS = 4] = "INVALID_METRIC_LABELS", P),
                id = {
                    withCredentials: !0,
                    url: "".concat("".concat(iu, "/account-security-service"), "/v1/metrics/record"),
                    timeout: 1e4
                },
                ip = function(e) {
                    return nd(t9.httpService.post(id, e), il)
                },
                ih = null != (ef = eQ.EnvironmentUrls.apiGatewayUrl) ? ef : "URL_NOT_FOUND",
                iv = ((x = {})[x.UNKNOWN = 0] = "UNKNOWN", x),
                iE = {
                    withCredentials: !0,
                    url: "".concat("".concat(ih, "/private-access-token"), "/v1/getPATToken"),
                    timeout: 1e4
                };

            function iy(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var iN = function(e) {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            return [2, nd(t9.httpService.post(iE, {
                                challengeId: e
                            }), iv)]
                        })
                    }, function() {
                        var e = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var i = t.apply(e, n);

                            function a(e) {
                                iy(i, r, o, a, c, "next", e)
                            }

                            function c(e) {
                                iy(i, r, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                iS = null != (ep = eQ.EnvironmentUrls.apiGatewayUrl) ? ep : "URL_NOT_FOUND",
                im = ((k = {})[k.UNKNOWN = 1] = "UNKNOWN", k),
                ib = {
                    withCredentials: !0,
                    url: "".concat("".concat(iS, "/challenge"), "/v1/continue"),
                    timeout: 1e4
                };

            function iA(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }
            var i_ = function(e, t, n) {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return [2, nd(t9.httpService.post(ib, {
                                challengeId: e,
                                challengeType: t,
                                challengeMetadata: n
                            }), im)]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, o) {
                            var i = r.apply(e, t);

                            function a(e) {
                                iA(i, n, o, a, c, "next", e)
                            }

                            function c(e) {
                                iA(i, n, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                iI = null != (eh = eQ.EnvironmentUrls.authApi) ? eh : "URL_NOT_FOUND",
                iO = ((j = {})[j.UNKNOWN = 0] = "UNKNOWN", j[j.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", j[j.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", j[j.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", j),
                iT = ((M = {})[M.UNKNOWN = 0] = "UNKNOWN", M[M.FEATURE_DISABLED = 1] = "FEATURE_DISABLED", M[M.FLOODED = 2] = "FLOODED", M[M.INVALID_PASSWORD = 20] = "INVALID_PASSWORD", M[M.PASSWORDS_DO_NOT_MATCH = 21] = "PASSWORDS_DO_NOT_MATCH", M[M.TWO_STEP_VERIFICATION_REQUIRED = 24] = "TWO_STEP_VERIFICATION_REQUIRED", M),
                iD = {
                    withCredentials: !0,
                    url: "".concat(iI, "/v1/passkey/ListCredentials"),
                    timeout: 1e4
                },
                ig = {
                    withCredentials: !0,
                    url: "".concat(iI, "/v2/passwords/reset"),
                    timeout: 1e4
                },
                iR = {
                    withCredentials: !0,
                    url: "".concat(iI, "/v1/revert/invalidate-tickets"),
                    timeout: 1e4
                },
                iC = function(e) {
                    return {
                        isError: !1,
                        value: e
                    }
                },
                iw = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        isError: !0,
                        error: e,
                        errorRaw: t,
                        errorStatusCode: n
                    }
                };

            function iL(e, t, n, r, o, i, a) {
                try {
                    var c = e[i](a),
                        s = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(s) : Promise.resolve(s).then(r, o)
            }

            function iU(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var iP = function(e) {
                    var t;
                    return (void 0 === e ? "undefined" : iU(e)) === "object" && null !== e && "data" in e && null != (t = (0, nI.getApiErrorCodes)(e.data)[0]) ? t : null
                },
                ix = function(e) {
                    if ((void 0 === e ? "undefined" : iU(e)) !== "object" || null === e || !("status" in e)) return null;
                    var t, n = null != (t = e.status) ? t : null;
                    return "number" != typeof n ? null : n
                },
                ik = function(e, t, n) {
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
                            return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function c(c) {
                                return function(s) {
                                    var u = [c, s];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                        if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                                        switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                                i.label++, r = u[1], u = [0];
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
                                        u = [6, e], r = 0
                                    } finally {
                                        n = o = 0
                                    }
                                    if (5 & u[0]) throw u[1];
                                    return {
                                        value: u[0] ? u[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    return c.trys.push([0, 2, , 3]), [4, e];
                                case 1:
                                    if (r = c.sent(), void 0 !== n) return [2, iC(n(r.data))];
                                    return [2, iC(r.data)];
                                case 2:
                                    return i = iP(o = c.sent()), a = ix(o), [2, iw(null == t ? null : Object.values(t).includes(i) ? i : null, o, a)];
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
                                iL(i, n, o, a, c, "next", e)
                            }

                            function c(e) {
                                iL(i, n, o, a, c, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                ij = nT().authApi,
                iM = ((F = {})[F.UNKNOWN = 0] = "UNKNOWN", F[F.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", F[F.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", F[F.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME", F),
                iF = {
                    withCredentials: !0,
                    url: "".concat(ij, "/v1/passkey/StartRegistration"),
                    timeout: 1e4
                },
                iK = {
                    withCredentials: !0,
                    url: "".concat(ij, "/v1/passkey/start-preauth-registration"),
                    timeout: 1e4
                },
                iV = {
                    withCredentials: !0,
                    url: "".concat(ij, "/v1/passkey/FinishRegistration"),
                    timeout: 1e4
                },
                iW = {
                    withCredentials: !0,
                    url: "".concat(ij, "/v1/passkey/finish-ar-preauth-registration"),
                    timeout: 1e4
                },
                iG = {
                    withCredentials: !0,
                    url: "".concat(ij, "/v1/passkey/DeleteCredentialBatch"),
                    timeout: 1e4
                },
                iB = {
                    AccountRecoveryPasskeyOnly: "accountRecoveryPasskeyOnly",
                    AccountRecoveryPasswordAndPasskey: "accountRecoveryPasswordAndPasskey"
                },
                iY = function() {
                    return ik((0, nI.post)(iF, {}), iM, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                iH = function(e) {
                    return ik((0, nI.post)(iK, {
                        username: e
                    }), iM, function(e) {
                        return {
                            creationOptions: JSON.parse(e.creationOptions),
                            sessionId: e.sessionId
                        }
                    })
                },
                iQ = function(e, t, n, r) {
                    return ik((0, nI.post)(iV, function(e) {
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
                    } : {})), iM)
                },
                iX = function(e, t, n, r, o, i) {
                    return ik((0, nI.post)(iW, {
                        recoverySession: e,
                        passkeySessionId: n,
                        passkeyRegistrationResponse: r,
                        userId: t,
                        isPostRecovery: o,
                        source: i
                    }), iM)
                },
                iq = function(e, t) {
                    return ik((0, nI.post)(iG, {
                        credentialNicknames: e,
                        passkeyCount: t
                    }), iM)
                },
                iz = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                        all: !0
                    };
                    return nd(t9.httpService.post(iD, e), iO)
                },
                iJ = function(e, t, n, r, o, i, a, c, s, u, l, d) {
                    return nd(t9.httpService.post(ig, {
                        targetType: e,
                        ticket: t,
                        userId: n,
                        password: r,
                        passwordRepeated: o,
                        twoStepVerificationChallengeId: i,
                        twoStepVerificationToken: a,
                        accountBlob: c,
                        secureAuthenticationIntent: s,
                        passkeySessionId: u,
                        passkeyRegistrationResponse: l,
                        newEmail: d
                    }), iT)
                },
                i$ = function() {
                    return nd(t9.httpService.post(iR, {}), iO)
                },
                iZ = ((K = {})[K.UNKNOWN = 0] = "UNKNOWN", K[K.CANCELLATION_ERROR = 1] = "CANCELLATION_ERROR", K[K.INTERRUPTED_ERROR = 2] = "INTERRUPTED_ERROR", K[K.INVALID_REQUEST = 3] = "INVALID_REQUEST", K[K.JSON_EXCEPTION = 4] = "JSON_EXCEPTION", K[K.CREDENTIALS_PROTOCOL_NOT_SUPPORTED = 5] = "CREDENTIALS_PROTOCOL_NOT_SUPPORTED", K[K.NO_CREDENTIALS_FOUND = 6] = "NO_CREDENTIALS_FOUND", K[K.INVALID_STATE_ERROR = 11] = "INVALID_STATE_ERROR", K),
                i0 = function(e) {
                    return e.code
                },
                i1 = function(e, t, n) {
                    return nf(e9.hybridResponseService.getNativeResponse(e, t, n), iZ, i0, function(e) {
                        if (null === e) return null;
                        var t = JSON.parse(e);
                        if (void 0 !== t.errorCode) throw {
                            name: "getNativeResponse Error",
                            message: t.errorMsg,
                            code: t.errorCode
                        };
                        return eQ.DeviceMeta && (0, eQ.DeviceMeta)().isInApp && (0, eQ.DeviceMeta)().isAndroidApp ? e : e9.fido2Util.formatCredentialAuthenticationResponseApp(e)
                    })
                },
                i2 = function(e) {
                    return nf(navigator.credentials.get(e), iZ).then(function(e) {
                        return nn(e, function(e) {
                            return null === e ? null : e9.fido2Util.formatCredentialAuthenticationResponseWeb(e)
                        })
                    })
                },
                i4 = null != (ev = eQ.EnvironmentUrls.apiGatewayUrl) ? ev : "URL_NOT_FOUND",
                i3 = "".concat(i4, "/account-recovery-service"),
                i6 = ((V = {})[V.UNKNOWN = 1] = "UNKNOWN", V[V.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", V[V.IDENTIFIER_INVALID = 3] = "IDENTIFIER_INVALID", V[V.TOO_MANY_REQUESTS = 4] = "TOO_MANY_REQUESTS", V[V.ACCOUNT_NOT_VERIFIED = 5] = "ACCOUNT_NOT_VERIFIED", V[V.INVALID_CODE = 6] = "INVALID_CODE", V[V.INVALID_USER = 7] = "INVALID_USER", V[V.TWO_STEP_VERIFICATION_REQUIRED = 8] = "TWO_STEP_VERIFICATION_REQUIRED", V[V.TRY_A_DIFFERENT_CONTACT_METHOD = 9] = "TRY_A_DIFFERENT_CONTACT_METHOD", V),
                i5 = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/request-recovery"),
                    timeout: 1e4
                },
                i7 = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/send-code"),
                    timeout: 1e4
                },
                i8 = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/resend-code"),
                    timeout: 1e4
                },
                i9 = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/verify-code"),
                    timeout: 1e4
                },
                ae = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/verify-backup-code"),
                    timeout: 1e4
                },
                at = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/continue-recovery"),
                    timeout: 1e4
                },
                an = {
                    url: "".concat(i3, "/v1/recovery-session-metadata"),
                    timeout: 1e4
                },
                ar = {
                    url: "".concat(i3, "/v1/set-email"),
                    timeout: 1e4
                },
                ao = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/get-current-two-step-method"),
                    timeout: 1e4
                },
                ai = {
                    withCredentials: !0,
                    url: "".concat(i3, "/v1/disable-two-step-method"),
                    timeout: 1e4
                },
                aa = function(e, t, n, r) {
                    return nd(t9.httpService.post(i5, {
                        identifier: e,
                        identifierType: t,
                        recoverySessionId: r,
                        requestedRecoveryTypes: n
                    }), i6)
                },
                ac = function(e, t, n, r) {
                    return nd(t9.httpService.post(i7, {
                        contactMethod: e,
                        contactMethodType: t,
                        recoverySessionId: n,
                        contactMethodNumber: r
                    }), i6)
                },
                as = function(e, t) {
                    return nd(t9.httpService.post(i8, {
                        recoverySessionId: e,
                        contactMethodNumber: t
                    }), i6)
                },
                au = function(e, t, n) {
                    return nd(t9.httpService.post(i9, {
                        recoverySessionId: e,
                        code: t,
                        contactMethodNumber: n
                    }), i6)
                },
                al = function(e, t) {
                    return nd(t9.httpService.post(ae, {
                        recoverySessionId: e,
                        backupCode: t
                    }), i6)
                },
                ad = function(e, t, n, r, o) {
                    return nd(t9.httpService.post(at, {
                        recoverySessionId: e,
                        userId: t,
                        recover2sv: n,
                        twoStepVerificationToken: r,
                        twoStepVerificationChallengeId: o
                    }), i6)
                },
                af = function(e) {
                    return nd(t9.httpService.post(an, {
                        recoverySessionId: e
                    }), i6)
                },
                ap = function(e) {
                    return nd(t9.httpService.post(ar, {
                        recoverySessionId: e
                    }), i6)
                },
                ah = function(e) {
                    return nd(t9.httpService.get(ao, {
                        recoverySessionId: e
                    }), i6)
                },
                av = function(e, t) {
                    return nd(t9.httpService.post(ai, {
                        recoverySessionId: e,
                        twoStepMethod: t
                    }), i6)
                },
                aE = {
                    url: "/my/settings/json",
                    withCredentials: !0
                },
                ay = ((W = {})[W.UNKNOWN = 0] = "UNKNOWN", W),
                aN = function() {
                    return nd(t9.httpService.get(aE), ay)
                },
                aS = ((G = {})[G.UNKNOWN = 0] = "UNKNOWN", G[G.FLAG_OFF = 1] = "FLAG_OFF", G),
                am = {
                    withCredentials: !0,
                    url: "".concat(null === eQ.EnvironmentUrls || void 0 === eQ.EnvironmentUrls ? void 0 : eQ.EnvironmentUrls.userSettingsApi, "/v1/user-settings"),
                    timeout: 1e4
                },
                ab = function() {
                    return nd(t9.httpService.get(am), aS)
                },
                aA = function(e, t) {
                    return !1 === t ? Promise.resolve(nt(aS.FLAG_OFF, null, null)) : nd(t9.httpService.post(am, {
                        eppEnrollmentStatus: e
                    }), aS)
                },
                a_ = null != (eE = eQ.EnvironmentUrls.usersApi) ? eE : "URL_NOT_FOUND",
                aI = ((B = {})[B.UNKNOWN = 0] = "UNKNOWN", B),
                aO = {
                    withCredentials: !0,
                    url: "".concat(a_, "/v1/usernames/users"),
                    timeout: 1e4
                },
                aT = {
                    withCredentials: !0,
                    url: "".concat(a_, "/v1/users"),
                    timeout: 1e4
                },
                aD = function(e) {
                    return nd(t9.httpService.get({
                        withCredentials: !0,
                        url: "".concat(a_, "/v1/users/").concat(e),
                        timeout: 1e4
                    }), aI)
                },
                ag = function(e) {
                    return nd(t9.httpService.post(aO, {
                        usernames: [e],
                        excludeBannedUsers: !0
                    }), aI)
                },
                aR = function(e) {
                    return nd(t9.httpService.post(aT, {
                        userIds: e,
                        excludeBannedUsers: !1
                    }), aI)
                };

            function aC(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var aw = new function e() {
                    if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                    aC(this, "captcha", ey), aC(this, "captchaV2", eS), aC(this, "email", eN), aC(this, "fido2", eV), aC(this, "games", em), aC(this, "metrics", ej), aC(this, "myAccount", eb), aC(this, "otp", eA), aC(this, "password", e_), aC(this, "phone", eI), aC(this, "playstation", eO), aC(this, "promptAssignments", eT), aC(this, "securityQuestions", eC), aC(this, "sessionManagement", ew), aC(this, "rostile", eR), aC(this, "thumbnails", eL), aC(this, "turnstile", eU), aC(this, "twoStepVerification", eP), aC(this, "universalAppConfiguration", ex), aC(this, "proofOfSpace", eD), aC(this, "proofOfWork", eg), aC(this, "xbox", ek), aC(this, "privateAccessToken", eM), aC(this, "genericChallenge", eF), aC(this, "authApi", eK), aC(this, "accountRecoveryApi", eW), aC(this, "legacyAccountInfoApi", eG), aC(this, "userSettingsApi", eB), aC(this, "usersApi", eY)
                },
                aL = new t8,
                aU = function() {},
                aP = function(e) {
                    var t = e.translate,
                        n = e.onCreationSuccess,
                        r = void 0 === n ? aU : n,
                        o = e.onDuplicateCreated,
                        i = void 0 === o ? aU : o,
                        a = e.onDeleteSuccess,
                        c = void 0 === a ? aU : a,
                        s = e.onLastKeyDeleted,
                        u = void 0 === s ? aU : s,
                        l = e.onGenericError,
                        d = void 0 === l ? aU : l,
                        f = e.registeredKeys,
                        p = e.fido2Supported,
                        h = e.credentialPurpose,
                        v = e.deleteAllPasskeysAllowed,
                        E = e.registrationSource;
                    return (0, eH.jsx)(e5, {
                        translate: t,
                        eventService: aL,
                        requestService: aw,
                        onCreationSuccess: r,
                        onDuplicateCreated: i,
                        onDeleteSuccess: c,
                        onLastKeyDeleted: u,
                        onGenericError: d,
                        credentialPurpose: h,
                        registeredKeys: void 0 === f ? [] : f,
                        fido2Supported: p,
                        deleteAllPasskeysAllowed: v,
                        registrationSource: E,
                        children: (0, eH.jsx)(t7, {})
                    })
                };
            aP.defaultProps = {
                onCreationSuccess: aU,
                onDuplicateCreated: aU,
                onDeleteSuccess: aU,
                onLastKeyDeleted: aU,
                onGenericError: aU,
                registeredKeys: [],
                fido2Supported: void 0,
                deleteAllPasskeysAllowed: !0,
                registrationSource: void 0
            };
            var ax = (0, e$.withTranslations)(aP, {
                common: [],
                feature: "Feature.AccountSettings"
            });
            n(722), Object.assign(eX(), {
                Fido2CredentialRegistrationService: {
                    renderFido2CredentialRegistration: function(e) {
                        var t = e.containerId,
                            n = e.onCreationSuccess,
                            r = e.onDuplicateCreated,
                            o = e.onDeleteSuccess,
                            i = e.onLastKeyDeleted,
                            a = e.onGenericError,
                            c = e.credentialPurpose,
                            s = e.registeredKeys,
                            u = e.fido2Supported,
                            l = e.deleteAllPasskeysAllowed,
                            d = e.registrationSource,
                            f = document.getElementById(t);
                        return null != f && ((0, eJ.unmountComponentAtNode)(f), (0, eJ.render)((0, eH.jsx)(ax, {
                            onCreationSuccess: n,
                            onDuplicateCreated: r,
                            onDeleteSuccess: o,
                            onLastKeyDeleted: i,
                            onGenericError: a,
                            credentialPurpose: c,
                            registeredKeys: s,
                            fido2Supported: u,
                            deleteAllPasskeysAllowed: l,
                            registrationSource: d
                        }), f), !0)
                    },
                    CredentialPurpose: e8
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Fido2CredentialRegistration");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/fido2CredentialRegistration-7eb7bae87e4e97a3.js.map