! function() {
    "use strict";
    var e = {
            n: function(t) {
                var n = t && t.__esModule ? function() {
                    return t.default
                } : function() {
                    return t
                };
                return e.d(n, {
                    a: n
                }), n
            },
            d: function(t, n) {
                for (var r in n) e.o(n, r) && !e.o(t, r) && Object.defineProperty(t, r, {
                    enumerable: !0,
                    get: n[r]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            },
            r: function(e) {
                "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                    value: "Module"
                }), Object.defineProperty(e, "__esModule", {
                    value: !0
                })
            }
        },
        t = {};
    e.r(t), e.d(t, {
        getMetadata: function() {
            return Nt
        }
    });
    var n = {};
    e.r(n), e.d(n, {
        getEmailConfiguration: function() {
            return _t
        },
        updateForCurrentUser: function() {
            return St
        }
    });
    var r = {};
    e.r(r), e.d(r, {
        getDetailsForUniverseIds: function() {
            return Ot
        }
    });
    var i = {};
    e.r(i), e.d(i, {
        getMySettingsInfo: function() {
            return Ct
        }
    });
    var o = {};
    e.r(o), e.d(o, {
        getMetadata: function() {
            return Gt
        },
        resendCode: function() {
            return xt
        },
        sendCodeForUser: function() {
            return Vt
        },
        validateCode: function() {
            return Wt
        }
    });
    var a = {};
    e.r(a), e.d(a, {
        changeForCurrentUser: function() {
            return Ht
        },
        resetSendPrompted: function() {
            return Qt
        },
        validate: function() {
            return zt
        }
    });
    var l = {};
    e.r(l), e.d(l, {
        getPhoneConfiguration: function() {
            return en
        }
    });
    var c = {};
    e.r(c), e.d(c, {
        disconnectPlaystation: function() {
            return fn
        },
        getPlaystationConnection: function() {
            return dn
        }
    });
    var u = {};
    e.r(u), e.d(u, {
        getAllForCurrentUser: function() {
            return An
        },
        updateForCurrentUser: function() {
            return Tn
        }
    });
    var s = {};
    e.r(s), e.d(s, {
        verifyPuzzle: function() {
            return wn
        }
    });
    var d = {};
    e.r(d), e.d(d, {
        getPuzzle: function() {
            return Vn
        },
        verifyPuzzle: function() {
            return xn
        }
    });
    var f = {};
    e.r(f), e.d(f, {
        generateToken: function() {
            return Hn
        }
    });
    var E = {};
    e.r(E), e.d(E, {
        verifyPuzzle: function() {
            return er
        }
    });
    var p = {};
    e.r(p), e.d(p, {
        answerQuestion: function() {
            return sr
        },
        getQuestion: function() {
            return ur
        }
    });
    var v = {};
    e.r(v), e.d(v, {
        getSessions: function() {
            return Or
        },
        logoutFromAllSessionsAndReauthenticate: function() {
            return Rr
        },
        logoutSession: function() {
            return Ir
        }
    });
    var h = {};
    e.r(h), e.d(h, {
        getIconsForUniverseIds: function() {
            return wr
        }
    });
    var m = {};
    e.r(m), e.d(m, {
        deleteSecurityKey: function() {
            return ni
        },
        disableAuthenticator: function() {
            return Yr
        },
        disableEmailTwoStepVerification: function() {
            return xr
        },
        disableSmsTwoStepVerification: function() {
            return qr
        },
        enableAuthenticator: function() {
            return Wr
        },
        enableEmailTwoStepVerification: function() {
            return Fr
        },
        enableSecurityKey: function() {
            return Zr
        },
        enableSmsTwoStepVerification: function() {
            return Xr
        },
        enableVerifyAuthenticator: function() {
            return Gr
        },
        enableVerifySecurityKey: function() {
            return $r
        },
        generateRecoveryCodes: function() {
            return zr
        },
        generateResaleFrictionChallenge: function() {
            return di
        },
        generateSpendFrictionChallenge: function() {
            return ui
        },
        generateTradeFrictionChallenge: function() {
            return si
        },
        getMetadata: function() {
            return kr
        },
        getPasskeyOptions: function() {
            return ii
        },
        getRecoveryCodesStatus: function() {
            return Qr
        },
        getResaleFrictionStatus: function() {
            return ci
        },
        getSecurityKeyOptions: function() {
            return ei
        },
        getSpendFrictionStatus: function() {
            return ai
        },
        getTradeFrictionStatus: function() {
            return li
        },
        getUserConfiguration: function() {
            return Mr
        },
        listSecurityKey: function() {
            return ri
        },
        redeemResaleFrictionChallenge: function() {
            return pi
        },
        redeemSpendFrictionChallenge: function() {
            return fi
        },
        redeemTradeFrictionChallenge: function() {
            return Ei
        },
        retractCrossDevice: function() {
            return mi
        },
        retryCrossDevice: function() {
            return vi
        },
        sendEmailCode: function() {
            return Kr
        },
        sendSmsCode: function() {
            return jr
        },
        verifyAuthenticatorCode: function() {
            return Br
        },
        verifyCrossDevice: function() {
            return hi
        },
        verifyEmailCode: function() {
            return Vr
        },
        verifyPasskeyCredential: function() {
            return oi
        },
        verifyRecoveryCode: function() {
            return Hr
        },
        verifySecurityKeyCredential: function() {
            return ti
        },
        verifySmsCode: function() {
            return Jr
        }
    });
    var N = {};
    e.r(N), e.d(N, {
        getSettingsUiPolicy: function() {
            return Oi
        }
    });
    var S = {};
    e.r(S), e.d(S, {
        disconnectXbox: function() {
            return Li
        },
        getXboxConnection: function() {
            return wi
        }
    });
    var _ = {};
    e.r(_), e.d(_, {
        recordMetric: function() {
            return Fi
        }
    });
    var y = {};
    e.r(y), e.d(y, {
        getPatToken: function() {
            return Yi
        }
    });
    var A = {};
    e.r(A), e.d(A, {
        continueChallenge: function() {
            return qi
        }
    });
    var T = {};
    e.r(T), e.d(T, {
        deletePasskeyBatch: function() {
            return lo
        },
        finishPasskeyRegistration: function() {
            return ao
        },
        listAllCredentials: function() {
            return co
        },
        startPasskeyRegistration: function() {
            return oo
        }
    });
    var O = {};
    e.r(O), e.d(O, {
        getNativeResponse: function() {
            return so
        },
        getNavigatorCredentials: function() {
            return fo
        }
    });
    var I, R = Roblox,
        D = e.n(R),
        C = React,
        b = e.n(C),
        g = ReactDOM,
        w = ReactUtilities,
        L = ReactStyleGuide;
    ! function(e) {
        e.NONE = "NONE", e.GENERIC_TEXT_ERROR = "GENERIC_TEXT_ERROR", e.FIDO_CREDENTIAL_CONFIRM_TRUST = "FIDO_CREDENTIAL_CONFIRM_TRUST", e.FIDO_CREDENTIAL_DELETE = "FIDO_CREDENTIAL_DELETE", e.FIDO_CREDENTIAL_ENABLE = "FIDO_CREDENTIAL_ENABLE", e.FIDO_CREDENTIAL_ERROR = "FIDO_CREDENTIAL_ERROR", e.FIDO_CREDENTIAL_NAME = "FIDO_CREDENTIAL_NAME", e.FIDO_CREDENTIAL_MANAGE = "FIDO_CREDENTIAL_MANAGE"
    }(I || (I = {}));
    var P, U = I;
    ! function(e) {
        e[e.SET_MODAL_STATE = 0] = "SET_MODAL_STATE"
    }(P || (P = {}));
    var k = function() {
            return k = Object.assign || function(e) {
                for (var t, n = 1, r = arguments.length; n < r; n++)
                    for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }, k.apply(this, arguments)
        },
        M = function(e, t) {
            var n = k({}, e);
            return t.type === P.SET_MODAL_STATE ? (n.modalStateAndProps = {
                modalState: t.modalState,
                additionalModalProps: t.additionalModalProps
            }, n) : n
        },
        F = (0, C.createContext)(null),
        K = function(e) {
            var t = e.translate,
                n = e.eventService,
                r = e.requestService,
                i = e.onCreationSuccess,
                o = e.onDuplicateCreated,
                a = e.onDeleteSuccess,
                l = e.onLastKeyDeleted,
                c = e.onGenericError,
                u = e.credentialPurpose,
                s = e.registeredKeys,
                d = e.fido2Supported,
                f = e.deleteAllPasskeysAllowed,
                E = e.children,
                p = (0, C.useState)((function() {
                    return {
                        translate: t,
                        eventService: n,
                        requestService: r,
                        onCreationSuccess: i,
                        onDuplicateCreated: o,
                        onDeleteSuccess: a,
                        onLastKeyDeleted: l,
                        onGenericError: c,
                        credentialPurpose: u,
                        registeredKeys: s,
                        fido2Supported: d,
                        deleteAllPasskeysAllowed: f,
                        modalStateAndProps: {
                            modalState: U.NONE,
                            additionalModalProps: null
                        }
                    }
                }))[0],
                v = (0, C.useReducer)(M, p),
                h = v[0],
                m = v[1];
            return b().createElement(F.Provider, {
                value: {
                    state: h,
                    dispatch: m
                }
            }, E)
        };
    K.defaultProps = {
        fido2Supported: void 0,
        deleteAllPasskeysAllowed: !0
    };
    var V, x = function() {
        var e = (0, C.useContext)(F);
        if (null === e) throw new Error("Fido2CredentialRegistrationContext was not provided in the current scope");
        return e
    };
    ! function(e) {
        e[e.TwoStepVerification = 0] = "TwoStepVerification", e[e.Login = 1] = "Login"
    }(V || (V = {}));
    var W, G, B = CoreRobloxUtilities,
        Y = HeaderScripts,
        H = {
            passkey: "settingsPasskey",
            passkeyCreated: "settingsPasskeyCreated"
        },
        Q = {
            authButtonClick: "authButtonClick",
            authModalShown: "authModalShown",
            authClientError: "authClientError"
        },
        z = {
            cancel: "cancel",
            continue: "continue"
        },
        X = {
            addPasskey: "addPasskey",
            userOSDialogError: "userOSDialogError"
        },
        j = {
            startStep: "startRegistration",
            finishStep: "finishRegistration",
            deletePasskey: "deletePasskey",
            registerCredentialsEmptyResponse: "registerCredentialsEmptyResponse",
            registerCredentialsErrorCode: "registerCredentialsErrorCode"
        },
        J = "https://en.help.roblox.com/hc/en-us/articles/20669991483156",
        q = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Z = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        $ = function(e) {
            var t = e.closeModal,
                n = x(),
                r = n.state,
                i = r.translate,
                o = r.eventService,
                a = r.requestService,
                l = r.onGenericError,
                c = r.onDuplicateCreated,
                u = r.credentialPurpose,
                s = r.modalStateAndProps,
                d = n.dispatch,
                f = (0, C.useState)(!1),
                E = f[0],
                p = f[1];
            return (0, C.useEffect)((function() {
                q(void 0, void 0, void 0, (function() {
                    var e, n, r, i, f, E, v, h, m, N;
                    return Z(this, (function(S) {
                        switch (S.label) {
                            case 0:
                                return s.modalState !== U.FIDO_CREDENTIAL_ENABLE ? [2] : (e = {
                                    credential: null
                                }, [4, q(void 0, void 0, void 0, (function() {
                                    return Z(this, (function(e) {
                                        switch (u) {
                                            case V.Login:
                                                return [2, a.authApi.startPasskeyRegistration()];
                                            case V.TwoStepVerification:
                                                return [2, a.twoStepVerification.enableSecurityKey(Y.authenticatedUser.id.toString())]
                                        }
                                        return [2]
                                    }))
                                }))]);
                            case 1:
                                if ((n = S.sent()).isError) return t(), R.AccountIntegrityChallengeService.Generic.ChallengeError.matchAbandoned(n.errorRaw) || (l(), o.sendPasskeyRegistrationErrorEvent(String(null !== (h = n.error) && void 0 !== h ? h : ""), j.startStep)), [2];
                                p(!0), r = !(R.DeviceMeta && (0, R.DeviceMeta)().isInApp && (0, R.DeviceMeta)().isAndroidApp), i = r ? B.fido2Util.convertPublicKeyParametersToStandardBase64(JSON.stringify(n.value.creationOptions)) : n.value.creationOptions, S.label = 2;
                            case 2:
                                if (S.trys.push([2, 7, , 8]), !R.DeviceMeta || !(0, R.DeviceMeta)().isInApp) return [3, 4];
                                switch (u) {
                                    case V.Login:
                                        i.keyType = "platform";
                                        break;
                                    case V.TwoStepVerification:
                                        i.keyType = "hardware"
                                }
                                return [4, B.hybridResponseService.getNativeResponse(B.hybridResponseService.FeatureTarget.REGISTER_CREDENTIALS, {
                                    creationOptionsJSON: JSON.stringify(i)
                                }, 3e5)];
                            case 3:
                                if (null !== (f = S.sent()))
                                    if (void 0 !== (E = JSON.parse(f)).errorCode) {
                                        if (11 === E.errorCode) return c(), t(), [2];
                                        o.sendPasskeyRegistrationErrorEvent(String(null !== (m = E.errorMsg) && void 0 !== m ? m : ""), j.registerCredentialsErrorCode)
                                    } else void 0 === E.id ? o.sendPasskeyRegistrationErrorEvent("", j.registerCredentialsEmptyResponse) : (R.DeviceMeta && (0, R.DeviceMeta)().isInApp && (0, R.DeviceMeta)().isAndroidApp && delete E.clientExtensionResults, e.credential = r ? B.fido2Util.formatCredentialRegistrationResponseApp(f) : JSON.stringify(E));
                                return [3, 6];
                            case 4:
                                return [4, navigator.credentials.create({
                                    publicKey: B.fido2Util.formatCredentialRequestWeb(JSON.stringify(i))
                                })];
                            case 5:
                                null !== (E = S.sent()) ? e.credential = B.fido2Util.formatCredentialRegistrationResponseWeb(E) : o.sendPasskeyRegistrationErrorEvent("", j.registerCredentialsEmptyResponse), S.label = 6;
                            case 6:
                                return [3, 8];
                            case 7:
                                return v = S.sent(), console.error(v), 11 === (null === (N = v) || void 0 === N ? void 0 : N.code) ? (c(), t(), [2]) : (o.sendPasskeyRegistrationErrorEvent(String(null != v ? v : ""), j.registerCredentialsErrorCode), [3, 8]);
                            case 8:
                                return function(e, t) {
                                    s.modalState === U.FIDO_CREDENTIAL_ENABLE && (null === e.credential ? d({
                                        type: P.SET_MODAL_STATE,
                                        modalState: U.FIDO_CREDENTIAL_ERROR,
                                        additionalModalProps: null
                                    }) : d({
                                        type: P.SET_MODAL_STATE,
                                        modalState: U.FIDO_CREDENTIAL_NAME,
                                        additionalModalProps: {
                                            credential: e.credential,
                                            sessionId: t
                                        }
                                    }))
                                }(e, n.value.sessionId), [2]
                        }
                    }))
                }))
            }), []), u === V.Login ? b().createElement(b().Fragment, null) : b().createElement(b().Fragment, null, E && b().createElement("div", {
                className: "enable-fido-credential-modal"
            }, b().createElement("div", {
                className: "modal-header"
            }, b().createElement("div", {
                className: "modal-modern-header-button"
            }, b().createElement("button", {
                type: "button",
                className: "close",
                onClick: t
            }, b().createElement("span", {
                "aria-hidden": "true"
            }, b().createElement("span", {
                className: "icon-close"
            })), b().createElement("span", {
                className: "sr-only"
            }, i("Action.Dialog.Close")))), b().createElement("div", {
                className: "modal-title"
            }, b().createElement("h4", null, b().createElement("span", null, i("Heading.RegisterSecurityKey"))))), b().createElement("div", {
                className: "fido-credential-container"
            }, b().createElement("div", {
                className: "fido-credential-symbol"
            }, b().createElement("div", {
                className: "fido-credential-usb-icon"
            })), b().createElement("div", {
                className: "fido-credential-text"
            }, i("Label.SecurityKey.PhysicalKey"))), b().createElement("div", {
                className: "fido-credential-spinner"
            }, b().createElement("div", {
                className: "spinner-donut"
            }))))
        },
        ee = null !== (W = R.EnvironmentUrls.accountSettingsApi) && void 0 !== W ? W : "URL_NOT_FOUND";
    ! function(e) {
        e[e.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", e[e.TOO_MANY_ACCOUNTS_ON_EMAIL = 3] = "TOO_MANY_ACCOUNTS_ON_EMAIL", e[e.TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL = 6] = "TOO_MANY_ATTEMPTS_TO_UPDATE_EMAIL", e[e.INVALID_EMAIL_ADDRESS = 9] = "INVALID_EMAIL_ADDRESS"
    }(G || (G = {}));
    var te, ne, re = {
            withCredentials: !0,
            url: ee + "/v1/email",
            timeout: 1e4
        },
        ie = {
            withCredentials: !0,
            url: ee + "/v1/email",
            timeout: 1e4
        },
        oe = null !== (te = R.EnvironmentUrls.authApi) && void 0 !== te ? te : "URL_NOT_FOUND";
    ! function(e) {
        e[e.FLOODED = 2] = "FLOODED", e[e.INVALID_PASSWORD = 7] = "INVALID_PASSWORD", e[e.INVALID_CURRENT_PASSWORD = 8] = "INVALID_CURRENT_PASSWORD"
    }(ne || (ne = {}));
    var ae, le = {
        withCredentials: !0,
        url: oe + "/v2/user/passwords/change",
        timeout: 1e4
    };
    ! function(e) {
        e[e.USER_DOES_NOT_HAVE_EMAIL = 22] = "USER_DOES_NOT_HAVE_EMAIL"
    }(ae || (ae = {}));
    var ce, ue = {
        withCredentials: !0,
        url: oe + "/v2/passwords/reset/send-prompted",
        timeout: 1e4
    };
    ! function(e) {
        e[e.VALID_PASSWORD = 0] = "VALID_PASSWORD", e[e.WEAK_PASSWORD = 1] = "WEAK_PASSWORD", e[e.SHORT_PASSWORD = 2] = "SHORT_PASSWORD", e[e.PASSWORD_SAME_AS_USERNAME = 3] = "PASSWORD_SAME_AS_USERNAME", e[e.FORBIDDEN_PASSWORD = 4] = "FORBIDDEN_PASSWORD", e[e.DUMB_STRINGS = 5] = "DUMB_STRINGS"
    }(ce || (ce = {}));
    var se, de, fe, Ee, pe = {
            withCredentials: !0,
            url: oe + "/v2/passwords/validate",
            timeout: 1e4
        },
        ve = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        he = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        me = function(e, t) {
            return function(n) {
                return ve(void 0, void 0, Promise, (function() {
                    return he(this, (function(r) {
                        switch (r.label) {
                            case 0:
                                return "Enter" === n.key && t ? (n.preventDefault(), n.stopPropagation(), [4, e()]) : [3, 2];
                            case 1:
                                r.sent(), r.label = 2;
                            case 2:
                                return [2]
                        }
                    }))
                }))
            }
        },
        Ne = function() {
            return Promise.resolve(null)
        },
        Se = function(e, t, n, r, i, o) {
            return function(a) {
                return ve(void 0, void 0, Promise, (function() {
                    var l, c;
                    return he(this, (function(u) {
                        switch (u.label) {
                            case 0:
                                return l = a.currentTarget.value, void 0 === t || t.test(l) || (l = e), void 0 !== o && o(l), r(l), c = i, [4, n(l)];
                            case 1:
                                return c.apply(void 0, [u.sent()]), [2]
                        }
                    }))
                }))
            }
        },
        _e = function(e) {
            var t = e.id,
                n = e.inputType,
                r = e.placeholder,
                i = e.disabled,
                o = e.value,
                a = e.error,
                l = e.canSubmit,
                c = e.validate,
                u = e.setValue,
                s = e.setError,
                d = e.handleSubmit,
                f = e.onChange,
                E = e.label,
                p = e.bottomLabel,
                v = e.inputMode,
                h = e.autoComplete,
                m = e.maxLength,
                N = e.validCharactersRegEx,
                S = e.hideFeedback,
                _ = e.concealInput,
                y = e.autoFocus,
                A = "" !== o && null === a,
                T = "" !== o && null !== a,
                O = A || T;
            return b().createElement("div", {
                className: "input-control-wrapper"
            }, E && b().createElement("label", {
                className: "text-label xsmall",
                htmlFor: t
            }, E), b().createElement(L.FormGroup, {
                controlId: t,
                className: (O ? "form-has-feedback" : "") + " " + (A ? "form-has-success" : "") + " " + (T ? "form-has-error" : "")
            }, b().createElement(L.FormControl, {
                as: "input",
                className: "input-field" + (_ && o.length > 0 ? " input-field-concealed" : ""),
                type: n,
                inputMode: v,
                autoComplete: h,
                maxLength: m,
                disabled: i,
                value: o,
                placeholder: r,
                onChange: Se(o, N, c, u, s, f),
                onKeyDown: me(d, l),
                autoFocus: y
            }), !i && !S && A && b().createElement("span", {
                className: "icon-checkmark-on"
            }), !i && !S && T && b().createElement("span", {
                className: "icon-close"
            }), b().createElement("div", {
                className: "form-control-label bottom-label xsmall"
            }, !i && T ? a : p || " ")))
        },
        ye = function(e) {
            var t = e.positiveButton,
                n = e.negativeButton,
                r = e.children;
            return b().createElement(L.Modal.Footer, null, b().createElement("div", {
                className: "modal-modern-footer-buttons"
            }, null !== n && b().createElement("button", {
                type: "button",
                className: "btn-secondary-md modal-modern-footer-button",
                "aria-label": n.label,
                disabled: !n.enabled,
                onClick: n.action
            }, n.content), b().createElement("button", {
                type: "button",
                className: "btn-cta-md modal-modern-footer-button",
                "aria-label": t.label,
                disabled: !t.enabled,
                onClick: t.action
            }, t.content)), r)
        },
        Ae = "URL_NOT_FOUND",
        Te = null !== (se = R.EnvironmentUrls.twoStepVerificationApi) && void 0 !== se ? se : Ae,
        Oe = null !== (de = R.EnvironmentUrls.economyApi) && void 0 !== de ? de : Ae,
        Ie = null !== (fe = R.EnvironmentUrls.tradesApi) && void 0 !== fe ? fe : Ae,
        Re = 1e4;
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN", e[e.INVALID_CHALLENGE_ID = 1] = "INVALID_CHALLENGE_ID", e[e.INVALID_USER_ID = 2] = "INVALID_USER_ID", e[e.INVALID_EMAIL = 3] = "INVALID_EMAIL", e[e.INVALID_PASSWORD = 4] = "INVALID_PASSWORD", e[e.TOO_MANY_REQUESTS = 5] = "TOO_MANY_REQUESTS", e[e.PIN_LOCKED = 6] = "PIN_LOCKED", e[e.FEATURE_DISABLED = 7] = "FEATURE_DISABLED", e[e.NOT_ALLOWED = 8] = "NOT_ALLOWED", e[e.INVALID_CONFIGURATION = 9] = "INVALID_CONFIGURATION", e[e.INVALID_CODE = 10] = "INVALID_CODE", e[e.CONFIGURATION_ALREADY_ENABLED = 11] = "CONFIGURATION_ALREADY_ENABLED", e[e.INVALID_SETUP_TOKEN = 12] = "INVALID_SETUP_TOKEN", e[e.REAUTHENTICATION_REQUIRED = 13] = "REAUTHENTICATION_REQUIRED", e[e.INVALID_PHONE_NUMBER = 15] = "INVALID_PHONE_NUMBER", e[e.EXCEEDED_REGISTERED_KEYS_LIMIT = 16] = "EXCEEDED_REGISTERED_KEYS_LIMIT", e[e.INVALID_CREDENTIAL_NICKNAME = 17] = "INVALID_CREDENTIAL_NICKNAME", e[e.AUTHENTICATOR_CODE_ALREADY_USED = 18] = "AUTHENTICATOR_CODE_ALREADY_USED", e[e.CHALLENGE_DENIED = 19] = "CHALLENGE_DENIED", e[e.CROSS_DEVICE_DIALOG_EXPIRED = 20] = "CROSS_DEVICE_DIALOG_EXPIRED"
    }(Ee || (Ee = {}));
    var De, Ce, be = {
            url: Te + "/v1/metadata",
            withCredentials: !0,
            timeout: Re
        },
        ge = function(e) {
            return {
                withCredentials: !0,
                url: Te + "/v1/users/" + e + "/configuration/email/enable",
                timeout: Re
            }
        },
        we = function(e) {
            return {
                withCredentials: !0,
                url: Te + "/v1/users/" + e + "/configuration/authenticator/enable-verify",
                timeout: Re
            }
        },
        Le = function(e) {
            return {
                withCredentials: !0,
                url: Te + "/v1/users/" + e + "/configuration/sms/enable",
                timeout: Re
            }
        },
        Pe = function(e) {
            return {
                withCredentials: !0,
                url: Te + "/v1/users/" + e + "/configuration/security-key/enable-verify",
                timeout: Re
            }
        },
        Ue = {
            withCredentials: !0,
            url: Oe + "/v2/spend-friction/two-step-verification/status",
            timeout: Re
        },
        ke = {
            withCredentials: !0,
            url: Ie + "/v1/trade-friction/two-step-verification/status",
            timeout: Re
        },
        Me = {
            withCredentials: !0,
            url: Oe + "/v2/resale-friction/two-step-verification/status",
            timeout: Re
        },
        Fe = {
            withCredentials: !0,
            url: Oe + "/v2/spend-friction/two-step-verification/generate",
            timeout: Re
        },
        Ke = {
            withCredentials: !0,
            url: Ie + "/v1/trade-friction/two-step-verification/generate",
            timeout: Re
        },
        Ve = {
            withCredentials: !0,
            url: Oe + "/v2/resale-friction/two-step-verification/generate",
            timeout: Re
        },
        xe = {
            withCredentials: !0,
            url: Oe + "/v2/spend-friction/two-step-verification/redeem",
            timeout: Re
        },
        We = {
            withCredentials: !0,
            url: Ie + "/v1/trade-friction/two-step-verification/redeem",
            timeout: Re
        },
        Ge = {
            withCredentials: !0,
            url: Oe + "/v2/resale-friction/two-step-verification/redeem",
            timeout: Re
        },
        Be = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Ye = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        He = function(e) {
            var t = e.closeModal,
                n = x().state,
                r = n.translate,
                i = n.eventService,
                o = n.requestService,
                a = n.onCreationSuccess,
                l = n.onGenericError,
                c = n.credentialPurpose,
                u = n.modalStateAndProps,
                s = n.registeredKeys,
                d = (0, C.useState)(!1),
                f = d[0],
                E = d[1],
                p = (0, C.useState)(null),
                v = p[0],
                h = p[1],
                m = (0, C.useState)(""),
                N = m[0],
                S = m[1],
                _ = function() {
                    return Be(void 0, void 0, void 0, (function() {
                        var e, n;
                        return Ye(this, (function(s) {
                            switch (s.label) {
                                case 0:
                                    return E(!0), [4, (d = N, Be(void 0, void 0, void 0, (function() {
                                        return Ye(this, (function(e) {
                                            if (u.modalState !== U.FIDO_CREDENTIAL_NAME) return [2, void 0];
                                            switch (c) {
                                                case V.Login:
                                                    return [2, o.authApi.finishPasskeyRegistration(u.additionalModalProps.sessionId, d, u.additionalModalProps.credential)];
                                                case V.TwoStepVerification:
                                                    return [2, o.twoStepVerification.enableVerifySecurityKey(Y.authenticatedUser.id.toString(), u.additionalModalProps.sessionId, d, u.additionalModalProps.credential)]
                                            }
                                            return [2]
                                        }))
                                    })))];
                                case 1:
                                    if (null == (e = s.sent()) ? void 0 : e.isError) {
                                        switch (E(!1), c) {
                                            case V.Login:
                                                t(), l(), i.sendPasskeyRegistrationErrorEvent(String(null !== (n = e.error) && void 0 !== n ? n : ""), j.finishStep);
                                                break;
                                            case V.TwoStepVerification:
                                                h(function(e, t) {
                                                    switch (t) {
                                                        case Ee.INVALID_EMAIL:
                                                            return e("Message.Error.NoVerifiedEmail");
                                                        case Ee.INVALID_PASSWORD:
                                                            return e("Message.Error.Email.IncorrectPassword");
                                                        case Ee.TOO_MANY_REQUESTS:
                                                            return e("Message.Error.TooManyRequests");
                                                        case Ee.PIN_LOCKED:
                                                            return e("Message.Error.Email.PinLocked");
                                                        case Ee.FEATURE_DISABLED:
                                                            return e("Response.FeatureDisabled");
                                                        case Ee.INVALID_CODE:
                                                            return e("Response.Dialog.InvalidCodeError");
                                                        case Ee.CONFIGURATION_ALREADY_ENABLED:
                                                            return e("Message.Error.AlreadyEnabled");
                                                        case Ee.INVALID_SETUP_TOKEN:
                                                            return e("Response.Dialog.AuthenticatorSessionExpired");
                                                        case Ee.REAUTHENTICATION_REQUIRED:
                                                            return e("Message.Error.ReauthenticationRequired");
                                                        case Ee.INVALID_PHONE_NUMBER:
                                                            return e("Message.Error.InvalidPhoneNumber");
                                                        case Ee.EXCEEDED_REGISTERED_KEYS_LIMIT:
                                                            return e("Message.Error.ExceededRegisteredKeysLimit");
                                                        case Ee.INVALID_CREDENTIAL_NICKNAME:
                                                            return e("Message.Error.InvalidCredentialNickname");
                                                        default:
                                                            return e("MessageUnknownError")
                                                    }
                                                }(r, e.error))
                                        }
                                        return [2]
                                    }
                                    return t(), a(), [2]
                            }
                            var d
                        }))
                    }))
                },
                y = {
                    content: f ? b().createElement("span", {
                        className: "spinner spinner-xs spinner-no-margin"
                    }) : r("Action.Dialog.Success"),
                    label: r("Action.Dialog.Success"),
                    enabled: !f && N.length > 0,
                    action: _
                };
            return (0, C.useEffect)((function() {
                c === V.Login && (N ? _() : Be(void 0, void 0, void 0, (function() {
                    var e, t, n, r, i, a, l, c, d;
                    return Ye(this, (function(f) {
                        switch (f.label) {
                            case 0:
                                if (e = navigator.userAgent, u.modalState !== U.FIDO_CREDENTIAL_NAME) return [2, void 0];
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
                                            return R.DeviceMeta && (0, R.DeviceMeta)().isIosApp || /(?!.*(?:OPR|Opera)).*(?:Macintosh|Mac OS|MacOS|OS X).*Safari.*/.test(e)
                                        }
                                    }, {
                                        name: "Google Password Manager",
                                        condition: function() {
                                            return R.DeviceMeta && (0, R.DeviceMeta)().isAndroidApp
                                        }
                                    }], n = "Passkey", "platform" === JSON.parse(u.additionalModalProps.credential).authenticatorAttachment)
                                    for (r = 0; r < t.length; r++)
                                        if (t[r].condition()) {
                                            n = t[r].name;
                                            break
                                        } return [4, o.authApi.listAllCredentials()];
                            case 1:
                                for (a = f.sent(), i = (null == a ? void 0 : a.isError) ? s : a.value.credentials, l = i.map((function(e) {
                                        return e.nickname
                                    })), c = n, d = 1; l.includes(c);) c = n + " " + (d += 1);
                                return S(c), [2]
                        }
                    }))
                })))
            }), [N]), c === V.Login ? b().createElement(b().Fragment, null) : b().createElement(b().Fragment, null, b().createElement("div", {
                className: "modal-header"
            }, b().createElement("div", {
                className: "modal-modern-header-button"
            }, b().createElement("button", {
                type: "button",
                className: "close",
                onClick: t
            }, b().createElement("span", {
                "aria-hidden": "true"
            }, b().createElement("span", {
                className: "icon-close"
            })), b().createElement("span", {
                className: "sr-only"
            }, r("Action.Dialog.Close")))), b().createElement("div", {
                className: "modal-title"
            }, b().createElement("h4", null, b().createElement("span", null, r("Heading.NameSecurityKey"))))), b().createElement(L.Modal.Body, null, b().createElement("div", {
                className: "result-security-key-modal modal-margin-bottom"
            }, b().createElement("div", null, r("Description.SecurityKey.NameKey"))), b().createElement(_e, {
                id: "securityKeyName",
                inputType: "text",
                disabled: f,
                value: N,
                setValue: S,
                error: v,
                setError: h,
                validate: Ne,
                canSubmit: N.length > 0,
                handleSubmit: _,
                onChange: function() {
                    return h(null)
                },
                autoComplete: "off",
                placeholder: r("Label.SecurityKey.Name"),
                maxLength: 40,
                hideFeedback: !0
            })), b().createElement(ye, {
                positiveButton: y,
                negativeButton: null
            }))
        },
        Qe = function(e) {
            var t = e.closeModal,
                n = x(),
                r = n.state,
                i = r.eventService,
                o = r.translate,
                a = n.dispatch;
            (0, C.useEffect)((function() {
                i.sendPasskeyRegistrationModalShownEvent()
            }), []);
            var l = function() {
                i.sendPasskeyRegistrationButtonClickedEvent(z.cancel), t()
            };
            return b().createElement("div", {
                className: "result-fido-credential-modal"
            }, b().createElement("div", {
                className: "modal-header"
            }, b().createElement("div", {
                className: "modal-modern-header-button"
            }, b().createElement("button", {
                type: "button",
                className: "close",
                onClick: l
            }, b().createElement("span", {
                "aria-hidden": "true"
            }, b().createElement("span", {
                className: "icon-close"
            })), b().createElement("span", {
                className: "sr-only"
            }, o("Action.Dialog.Close")))), b().createElement("div", {
                className: "modal-title"
            }, b().createElement("h4", {
                className: "fido-credential-header"
            }, o("Heading.AddAPasskey")))), b().createElement(L.Modal.Body, null, b().createElement("div", {
                className: "fido-credential-description-centered"
            }, b().createElement("p", null, o("Description.PasskeysSecurityWarning"), b().createElement("a", {
                href: J,
                target: "_blank",
                rel: "noreferrer",
                className: "text-link learn-more-link"
            }, o("Label.LearnMore"))))), b().createElement(L.Modal.Footer, null, b().createElement("div", {
                className: "fido-credential-dual-button-container"
            }, b().createElement("button", {
                type: "submit",
                className: "btn-secondary-md btn-full-width",
                style: {
                    display: "inline"
                },
                onClick: l
            }, o("Action.Cancel")), b().createElement("button", {
                type: "submit",
                className: "btn-primary-md btn-full-width",
                style: {
                    display: "inline"
                },
                onClick: function() {
                    i.sendPasskeyRegistrationButtonClickedEvent(z.continue), a({
                        type: P.SET_MODAL_STATE,
                        modalState: U.FIDO_CREDENTIAL_ENABLE,
                        additionalModalProps: null
                    })
                }
            }, o("Action.Dialog.Continue")))))
        },
        ze = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Xe = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        je = function(e) {
            var t = e.closeModal,
                n = x(),
                r = n.state,
                i = r.translate,
                o = r.eventService,
                a = r.requestService,
                l = r.onDeleteSuccess,
                c = r.onLastKeyDeleted,
                u = r.onGenericError,
                s = r.credentialPurpose,
                d = r.modalStateAndProps,
                f = n.dispatch;
            if (d.modalState !== U.FIDO_CREDENTIAL_DELETE) return b().createElement(b().Fragment, null);
            var E, p, v;
            switch (s) {
                case V.Login:
                    E = "Heading.RemovePasskey", p = "Description.PasskeyDeletionWarning", v = "Description.PasskeyMayStillAppear";
                    break;
                case V.TwoStepVerification:
                    E = "Heading.RemoveSecurityKey", p = "Description.SecurityKey.Deletion", v = "Description.SecurityKey.Warning"
            }
            return b().createElement("div", {
                className: "result-fido-credential-modal"
            }, b().createElement("div", {
                className: "modal-header"
            }, b().createElement("div", {
                className: "modal-modern-header-button"
            }, b().createElement("button", {
                type: "button",
                className: "close",
                onClick: t
            }, b().createElement("span", {
                "aria-hidden": "true"
            }, b().createElement("span", {
                className: "icon-close"
            })), b().createElement("span", {
                className: "sr-only"
            }, i("Action.Dialog.Close")))), b().createElement("div", {
                className: "modal-title"
            }, b().createElement("h4", null, b().createElement("span", null, i(E))))), b().createElement(L.Modal.Body, null, b().createElement("div", {
                className: "fido-credential-description-centered"
            }, b().createElement("p", null, i(p))), b().createElement("div", {
                className: "fido-credential-description-centered"
            }, b().createElement("p", null, i(v), s === V.Login && b().createElement("a", {
                href: J,
                target: "_blank",
                rel: "noreferrer",
                className: "text-link learn-more-link"
            }, i("Label.LearnMore"))))), b().createElement("div", {
                className: "modal-footer"
            }, b().createElement("div", {
                className: "fido-credential-dual-button-container"
            }, b().createElement("button", {
                type: "submit",
                className: "btn-secondary-md btn-full-width",
                style: {
                    display: "inline"
                },
                onClick: function() {
                    f({
                        type: P.SET_MODAL_STATE,
                        modalState: U.FIDO_CREDENTIAL_MANAGE,
                        additionalModalProps: null
                    })
                }
            }, i("Action.GoBack")), b().createElement("button", {
                type: "submit",
                className: "btn-secondary-md btn-full-width",
                style: {
                    display: "inline"
                },
                onClick: function() {
                    return ze(void 0, void 0, void 0, (function() {
                        var e, n;
                        return Xe(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, ze(void 0, void 0, void 0, (function() {
                                        return Xe(this, (function(e) {
                                            switch (s) {
                                                case V.Login:
                                                    return [2, a.authApi.deletePasskeyBatch(d.additionalModalProps.keysToDeleteNames)];
                                                case V.TwoStepVerification:
                                                    return [2, a.twoStepVerification.deleteSecurityKey(Y.authenticatedUser.id.toString(), d.additionalModalProps.keysToDeleteNames)]
                                            }
                                            return [2]
                                        }))
                                    }))];
                                case 1:
                                    return (e = r.sent()).isError ? (t(), R.AccountIntegrityChallengeService.Generic.ChallengeError.matchAbandoned(e.errorRaw) || (u(), o.sendPasskeyRegistrationErrorEvent(String(null !== (n = e.error) && void 0 !== n ? n : ""), j.deletePasskey)), [2]) : (d.additionalModalProps.deletedAllKeys && c(), t(), l(), [2])
                            }
                        }))
                    }))
                }
            }, i("Action.DeleteSecurityKey")))))
        },
        Je = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        qe = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        Ze = function(e) {
            var t = e.closeModal,
                n = x(),
                r = n.state,
                i = r.translate,
                o = r.credentialPurpose,
                a = r.registeredKeys,
                l = r.modalStateAndProps,
                c = r.fido2Supported,
                u = r.deleteAllPasskeysAllowed,
                s = n.dispatch,
                d = (0, C.useState)(c),
                f = d[0],
                E = d[1];
            if ((0, C.useEffect)((function() {
                    void 0 === f && Je(void 0, void 0, void 0, (function() {
                        var e;
                        return qe(this, (function(t) {
                            switch (t.label) {
                                case 0:
                                    return R.DeviceMeta && (0, R.DeviceMeta)().isInApp ? (0, R.DeviceMeta)().isIosApp || (0, R.DeviceMeta)().isAndroidApp ? [4, B.hybridResponseService.getNativeResponse(B.hybridResponseService.FeatureTarget.CREDENTIALS_PROTOCOL_AVAILABLE, {}, 1e4)] : [3, 2] : [3, 4];
                                case 1:
                                    return e = t.sent(), E("true" === e), [3, 3];
                                case 2:
                                    E(!1), t.label = 3;
                                case 3:
                                    return [3, 5];
                                case 4:
                                    try {
                                        E(void 0 !== PublicKeyCredential)
                                    } catch (e) {
                                        E(!1)
                                    }
                                    t.label = 5;
                                case 5:
                                    return [2]
                            }
                        }))
                    }))
                }), []), l.modalState !== U.FIDO_CREDENTIAL_MANAGE) return b().createElement(b().Fragment, null);
            var p, v, h, m = function() {
                switch (o) {
                    case V.Login:
                        s({
                            type: P.SET_MODAL_STATE,
                            modalState: U.FIDO_CREDENTIAL_CONFIRM_TRUST,
                            additionalModalProps: null
                        });
                        break;
                    case V.TwoStepVerification:
                        s({
                            type: P.SET_MODAL_STATE,
                            modalState: U.FIDO_CREDENTIAL_ENABLE,
                            additionalModalProps: null
                        })
                }
            };
            switch (o) {
                case V.Login:
                    p = "Heading.ManageYourPasskeys", v = "Action.AddPasskey", h = "passkey-icon";
                    break;
                case V.TwoStepVerification:
                    p = "Heading.ManageYourSecurityKeys", v = "Action.ManageAddSecurityKey", h = "fido-credential-usb-icon-lg"
            }
            var N = u || a.length > 1,
                S = a.map((function(e) {
                    return b().createElement(b().Fragment, {
                        key: e.nickname
                    }, b().createElement("div", {
                        className: "fido-credential-checkbox-container"
                    }, b().createElement("span", {
                        className: h
                    }), b().createElement("div", {
                        className: "fido-credential-name"
                    }, e.nickname), N && b().createElement("button", {
                        className: "fido-credential-delete-button",
                        type: "button",
                        onClick: function() {
                            return t = e.nickname, r = (n = [t]).length === a.length, void s({
                                type: P.SET_MODAL_STATE,
                                modalState: U.FIDO_CREDENTIAL_DELETE,
                                additionalModalProps: {
                                    keysToDeleteNames: n,
                                    deletedAllKeys: r
                                }
                            });
                            var t, n, r
                        }
                    }, b().createElement("span", {
                        className: "icon-trash-bin"
                    }))), b().createElement("div", {
                        className: "rbx-divider"
                    }))
                })),
                _ = b().createElement(b().Fragment, null, b().createElement("div", {
                    className: "passkey-incompatible-warning"
                }, b().createElement("span", {
                    className: "icon-warning-orange passkey-incompatible-icon"
                }), b().createElement("span", null, i("Description.DeviceNotCompatible")))),
                y = b().createElement(b().Fragment, null, b().createElement("div", {
                    className: "passkey-compatibility-check"
                }, b().createElement("div", {
                    className: "passkey-compatibility-spinner"
                }, b().createElement("div", {
                    className: "spinner spinner-sm"
                })), b().createElement("span", {
                    className: "passkey-compatibility-check-message"
                }, i("Description.CheckingPasskeyCompatibility")))),
                A = b().createElement(b().Fragment, null, b().createElement("div", {
                    className: "passkey-manage-warning"
                }, b().createElement("span", null, i("Description.NumPasskeysAddedStatus", {
                    registeredKeys: a.length,
                    maxKeys: 5
                })))),
                T = b().createElement(b().Fragment, null, b().createElement("div", {
                    className: "passkey-manage-warning"
                }, b().createElement("span", null, i("Description.LastPasskeyWarning"))));
            return b().createElement("div", {
                className: "result-fido-credential-modal"
            }, b().createElement("div", {
                className: "modal-header fido-credential-modal-header"
            }, b().createElement("div", {
                className: "modal-modern-header-button"
            }, b().createElement("button", {
                type: "button",
                className: "close",
                onClick: t
            }, b().createElement("span", {
                "aria-hidden": "true"
            }, b().createElement("span", {
                className: "icon-close"
            })), b().createElement("span", {
                className: "sr-only"
            }, i("Action.Dialog.Close")))), b().createElement("div", {
                className: "modal-title"
            }, b().createElement("h4", {
                className: "fido-credential-header"
            }, b().createElement("span", null, i(p))))), b().createElement(L.Modal.Body, null, o === V.TwoStepVerification && b().createElement("div", {
                className: "fido-credential-description"
            }, i("Label.SecurityKey.RegisteredKey", {
                registeredKeysCount: a.length,
                totalKeysCount: 5
            })), S, a.length < 5 && f && b().createElement("div", {
                role: "button",
                onClick: m,
                onKeyDown: m,
                tabIndex: 0,
                className: "fido-credential-add-button"
            }, b().createElement("div", {
                className: "fido-credential-icon-add"
            }, b().createElement("span", {
                className: "icon-plus"
            })), b().createElement("p", {
                className: "passkey-add-account-text"
            }, i(v))), void 0 === f && y, !1 === f && _, f && a.length >= 5 && A, !N && T))
        },
        $e = function(e) {
            var t = e.closeModal,
                n = x(),
                r = n.state,
                i = r.eventService,
                o = r.translate,
                a = r.modalStateAndProps,
                l = n.dispatch;
            if ((0, C.useEffect)((function() {
                    i.sendOSDialogErrorEvent()
                }), []), a.modalState !== U.FIDO_CREDENTIAL_ERROR) return b().createElement(b().Fragment, null);
            var c = {
                content: o("Action.TryAgain"),
                label: o("Action.TryAgain"),
                enabled: !0,
                action: function() {
                    l({
                        type: P.SET_MODAL_STATE,
                        modalState: U.FIDO_CREDENTIAL_ENABLE,
                        additionalModalProps: null
                    })
                }
            };
            return b().createElement("div", {
                className: "result-fido-credential-modal"
            }, b().createElement("div", {
                className: "modal-header"
            }, b().createElement("div", {
                className: "modal-modern-header-button"
            }, b().createElement("button", {
                type: "button",
                className: "close",
                onClick: t
            }, b().createElement("span", {
                "aria-hidden": "true"
            }, b().createElement("span", {
                className: "icon-close"
            })), b().createElement("span", {
                className: "sr-only"
            }, o("Action.Dialog.Close")))), b().createElement("div", {
                className: "modal-title"
            }, b().createElement("h4", null, b().createElement("span", null, o("Heading.SomethingWentWrong"))))), b().createElement(L.Modal.Body, null, b().createElement("div", {
                className: "fido-credential-description-centered"
            }, o("Description.UnableToSaveChanges"))), b().createElement(ye, {
                positiveButton: c,
                negativeButton: null
            }))
        },
        et = function(e, t) {
            return {
                innerFragment: e,
                canClickBackdropOrEscToClose: t
            }
        },
        tt = function() {
            var e = x(),
                t = e.state,
                n = t.modalStateAndProps,
                r = t.registeredKeys,
                i = t.credentialPurpose,
                o = e.dispatch,
                a = (0, C.useState)(!0),
                l = a[0],
                c = a[1],
                u = function() {
                    return c(!1)
                };
            (0, C.useEffect)((function() {
                if (r.length > 0) o({
                    type: P.SET_MODAL_STATE,
                    modalState: U.FIDO_CREDENTIAL_MANAGE,
                    additionalModalProps: null
                });
                else switch (i) {
                    case V.Login:
                        o({
                            type: P.SET_MODAL_STATE,
                            modalState: U.FIDO_CREDENTIAL_CONFIRM_TRUST,
                            additionalModalProps: null
                        });
                        break;
                    case V.TwoStepVerification:
                        o({
                            type: P.SET_MODAL_STATE,
                            modalState: U.FIDO_CREDENTIAL_ENABLE,
                            additionalModalProps: null
                        })
                }
            }), []);
            var s = function(e) {
                    var t = new Map([
                        [U.FIDO_CREDENTIAL_ENABLE, et($, !1)],
                        [U.FIDO_CREDENTIAL_NAME, et(He, !1)],
                        [U.FIDO_CREDENTIAL_CONFIRM_TRUST, et(Qe, !0)],
                        [U.FIDO_CREDENTIAL_ERROR, et($e, !0)],
                        [U.FIDO_CREDENTIAL_DELETE, et(je, !0)],
                        [U.FIDO_CREDENTIAL_MANAGE, et(Ze, !0)]
                    ]).get(e);
                    return void 0 !== t ? t : null
                }(n.modalState),
                d = (n.modalState === U.FIDO_CREDENTIAL_ENABLE || n.modalState === U.FIDO_CREDENTIAL_NAME) && i === V.Login;
            return b().createElement(b().Fragment, null, s && b().createElement(L.Modal, {
                className: "modal-modern",
                show: l,
                onHide: u,
                onExited: function() {
                    o({
                        type: P.SET_MODAL_STATE,
                        modalState: U.NONE,
                        additionalModalProps: null
                    }), c(!0)
                },
                backdrop: s.canClickBackdropOrEscToClose ? void 0 : "static",
                keyboard: s.canClickBackdropOrEscToClose
            }, b().createElement(s.innerFragment, {
                closeModal: u
            })), d && b().createElement("div", {
                className: "centered-spinner"
            }, b().createElement("div", {
                className: "spinner-donut"
            })))
        },
        nt = function() {
            function e() {}
            return e.prototype.sendPasskeyRegistrationModalShownEvent = function() {
                B.eventStreamService.sendEventWithTarget(Q.authModalShown, H.passkey, {
                    state: X.addPasskey
                })
            }, e.prototype.sendPasskeyRegistrationButtonClickedEvent = function(e) {
                B.eventStreamService.sendEventWithTarget(Q.authButtonClick, H.passkey, {
                    btn: e
                })
            }, e.prototype.sendOSDialogErrorEvent = function() {
                B.eventStreamService.sendEventWithTarget(Q.authModalShown, H.passkeyCreated, {
                    state: X.userOSDialogError
                })
            }, e.prototype.sendPasskeyRegistrationErrorEvent = function(e, t) {
                B.eventStreamService.sendEventWithTarget(Q.authClientError, H.passkeyCreated, {
                    state: e,
                    origin: t
                })
            }, e
        }(),
        rt = CoreUtilities,
        it = function(e) {
            return {
                isError: !1,
                value: e
            }
        },
        ot = it,
        at = function(e, t, n) {
            return void 0 === n && (n = null), {
                isError: !0,
                error: e,
                errorRaw: t,
                errorStatusCode: n
            }
        },
        lt = function(e, t) {
            return e.isError ? e : it(t(e.value))
        },
        ct = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        ut = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        st = function(e) {
            return "object" != typeof e ? null : function(e) {
                var t = [];
                if (!e || "object" != typeof e) return [];
                var n = e.errors;
                return n instanceof Array ? (n.forEach((function(e) {
                    if (e && "object" == typeof e) {
                        var n = e.code;
                        "number" == typeof n && t.push(n)
                    }
                })), t) : []
            }(e.data)[0] || null
        },
        dt = function(e, t) {
            return null == e ? null : Object.values(e).includes(t) ? t : null
        },
        ft = function(e, t, n) {
            return ct(void 0, void 0, Promise, (function() {
                var r, i, o, a;
                return ut(this, (function(l) {
                    switch (l.label) {
                        case 0:
                            return l.trys.push([0, 2, , 3]), [4, e];
                        case 1:
                            return r = l.sent(), void 0 !== n ? [2, ot(n(r.data))] : [2, ot(r.data)];
                        case 2:
                            return i = l.sent(), o = st(i), a = function(e) {
                                if ("object" != typeof e || null === e) return null;
                                var t = e.status || null;
                                return "number" != typeof t ? null : t
                            }(i), [2, at(dt(t, o), i, a)];
                        case 3:
                            return [2]
                    }
                }))
            }))
        },
        Et = function(e, t, n, r) {
            return void 0 === n && (n = st), ct(void 0, void 0, Promise, (function() {
                var i, o, a;
                return ut(this, (function(l) {
                    switch (l.label) {
                        case 0:
                            return l.trys.push([0, 2, , 3]), [4, e];
                        case 1:
                            return i = l.sent(), void 0 !== r ? [2, ot(r(i))] : [2, ot(i)];
                        case 2:
                            return o = l.sent(), a = n(o), [2, at(dt(t, a), o, 0)];
                        case 3:
                            return [2]
                    }
                }))
            }))
        },
        pt = (null !== (De = R.EnvironmentUrls.apiGatewayCdnUrl) && void 0 !== De ? De : "URL_NOT_FOUND") + "/captcha";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(Ce || (Ce = {}));
    var vt, ht, mt = {
            url: pt + "/v1/metadata",
            timeout: 6e4
        },
        Nt = function() {
            return ft(rt.httpService.get(mt, {}), Ce)
        },
        St = function(e) {
            return ft(rt.httpService.post(re, {
                emailAddress: e,
                skipVerificationEmail: !0
            }), G)
        },
        _t = function() {
            return ft(rt.httpService.get(ie), G)
        },
        yt = null !== (vt = R.EnvironmentUrls.gamesApi) && void 0 !== vt ? vt : "URL_NOT_FOUND";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(ht || (ht = {}));
    var At, Tt = {
            url: yt + "/v1/games",
            timeout: 1e4
        },
        Ot = function(e) {
            return ft(rt.httpService.get(Tt, {
                universeIds: e
            }), ht)
        };
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(At || (At = {}));
    var It, Rt, Dt = {
            withCredentials: !0,
            url: "/my/settings/json",
            timeout: 1e4
        },
        Ct = function() {
            return ft(rt.httpService.get(Dt, {}), At)
        },
        bt = (null !== (It = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== It ? It : "URL_NOT_FOUND") + "/otp-service";
    ! function(e) {
        e[e.NO_ERROR = 0] = "NO_ERROR", e[e.UNKNOWN = 1] = "UNKNOWN", e[e.INVALID_CODE = 2] = "INVALID_CODE", e[e.INVALID_SESSION_TOKEN = 3] = "INVALID_SESSION_TOKEN", e[e.CODE_EXPIRED = 4] = "CODE_EXPIRED", e[e.UNVALIDATED_SESSION_TOKEN = 5] = "UNVALIDATED_SESSION_TOKEN", e[e.TOO_MANY_REQUESTS = 6] = "TOO_MANY_REQUESTS", e[e.CONTACT_MALFORMED = 7] = "CONTACT_MALFORMED", e[e.VPN_REQUIRED = 8] = "VPN_REQUIRED", e[e.UNAUTHENTICATED = 9] = "UNAUTHENTICATED", e[e.METHOD_UNAVAILABLE = 10] = "METHOD_UNAVAILABLE"
    }(Rt || (Rt = {}));
    var gt, wt, Lt, Pt = {
            withCredentials: !0,
            url: bt + "/v1/sendCodeForUser",
            timeout: 1e4
        },
        Ut = {
            withCredentials: !0,
            url: bt + "/v1/resendCode",
            timeout: 1e4
        },
        kt = {
            withCredentials: !0,
            url: bt + "/v1/validateCode",
            timeout: 1e4
        },
        Mt = {
            withCredentials: !0,
            url: bt + "/v1/metadata",
            timeout: 1e4
        };
    ! function(e) {
        e.Unset = "Unset", e.Email = "Email"
    }(gt || (gt = {})),
    function(e) {
        e.Reauth = "Reauth", e.Challenge = "Challenge"
    }(wt || (wt = {})),
    function(e) {
        e.Default = "Default"
    }(Lt || (Lt = {}));
    var Ft, Kt, Vt = function(e) {
            return ft(rt.httpService.post(Pt, {
                contactType: e,
                origin: wt.Reauth,
                messageVariant: Lt.Default
            }), Rt)
        },
        xt = function(e, t) {
            return ft(rt.httpService.post(Ut, {
                contactType: e,
                origin: wt.Reauth,
                otpSessionToken: t
            }), Rt)
        },
        Wt = function(e, t, n) {
            return ft(rt.httpService.post(kt, {
                contactType: e,
                origin: wt.Reauth,
                passCode: n,
                otpSessionToken: t
            }), Rt)
        },
        Gt = function(e) {
            return ft(rt.httpService.get(Mt, {
                Origin: e
            }), Rt)
        },
        Bt = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Yt = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        Ht = function(e, t) {
            return ft(rt.httpService.post(le, {
                currentPassword: e,
                newPassword: t
            }), ne)
        },
        Qt = function() {
            return ft(rt.httpService.post(ue), ae)
        },
        zt = function(e, t) {
            return Bt(void 0, void 0, Promise, (function() {
                return Yt(this, (function(n) {
                    return [2, ft(rt.httpService.post(pe, {
                        username: e,
                        password: t
                    }), null).then((function(e) {
                        return lt(e, (function(e) {
                            return dt(ce, e.code)
                        }))
                    }))]
                }))
            }))
        },
        Xt = null !== (Ft = R.EnvironmentUrls.accountInformationApi) && void 0 !== Ft ? Ft : "URL_NOT_FOUND";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(Kt || (Kt = {}));
    var jt, Jt, qt = {
            withCredentials: !0,
            url: Xt + "/v1/phone",
            timeout: 1e4
        },
        Zt = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        $t = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        en = function() {
            return Zt(void 0, void 0, Promise, (function() {
                return $t(this, (function(e) {
                    return [2, ft(rt.httpService.get(qt, {}), Kt)]
                }))
            }))
        },
        tn = null !== (jt = R.EnvironmentUrls.authApi) && void 0 !== jt ? jt : "URL_NOT_FOUND",
        nn = "palisades-live";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(Jt || (Jt = {}));
    var rn, on, an, ln, cn, un = {
            withCredentials: !0,
            url: tn + "/v1/" + nn + "/is-live",
            timeout: 1e4
        },
        sn = {
            withCredentials: !0,
            url: tn + "/v1/" + nn + "/disconnect",
            timeout: 1e4
        },
        dn = function() {
            return ft(rt.httpService.get(un, {}), Jt)
        },
        fn = function() {
            return ft(rt.httpService.post(sn, {}), Jt)
        },
        En = (null !== (rn = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== rn ? rn : "URL_NOT_FOUND") + "/account-security-service";
    ! function(e) {
        e[e.UNKNOWN = 1] = "UNKNOWN", e[e.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", e[e.PROMPT_ASSIGNMENT_WAS_NOT_UPDATED = 3] = "PROMPT_ASSIGNMENT_WAS_NOT_UPDATED", e[e.UNKNOWN_PROMPT_TYPE = 4] = "UNKNOWN_PROMPT_TYPE"
    }(on || (on = {})),
    function(e) {
        e.TEXT_ONLY_BANNER = "DISPLAY_TYPE_TEXT_ONLY_BANNER"
    }(an || (an = {})),
    function(e) {
        e.GLOBAL = "PAGE_RESTRICTION_GLOBAL", e.HOME_PAGE_ONLY = "PAGE_RESTRICTION_HOME_PAGE"
    }(ln || (ln = {})),
    function(e) {
        e.CHANGE_PASSWORD__SUSPECTED_COMPROMISE = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE", e.CHANGE_PASSWORD__BREACHED_CREDENTIAL = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL", e.AUTHENTICATOR_UPSELL = "PROMPT_TYPE_AUTHENTICATOR_UPSELL", e.ACCOUNT_RESTORES_POLICY_UPDATE = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE", e.ACCOUNT_RESTORES_POLICY_UPDATE_V2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2", e.ACCOUNT_RESTORES_POLICY_UPDATE_V3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3", e.ACCOUNT_RESTORES_POLICY_UPSELL = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL", e.BROADER_AUTHENTICATOR_UPSELL = "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL", e.EMAIL_2SV_UPSELL = "PROMPT_TYPE_EMAIL_2SV_UPSELL"
    }(cn || (cn = {}));
    var pn, vn = {
        withCredentials: !0,
        url: En + "/v1/prompt-assignments",
        timeout: 1e4
    };
    ! function(e) {
        e.DISMISS_PROMPT = "DISMISS_PROMPT", e.DISABLE_PROMPT = "DISABLE_PROMPT"
    }(pn || (pn = {}));
    var hn, mn, Nn = {
            withCredentials: !0,
            url: En + "/v1/prompt-assignments",
            timeout: 1e4
        },
        Sn = function() {
            return Sn = Object.assign || function(e) {
                for (var t, n = 1, r = arguments.length; n < r; n++)
                    for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }, Sn.apply(this, arguments)
        },
        _n = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        yn = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        An = function() {
            return _n(void 0, void 0, Promise, (function() {
                var e;
                return yn(this, (function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, ft(rt.httpService.get(vn, {
                                shouldReturnMetadata: !0
                            }), on)];
                        case 1:
                            return (e = t.sent()).isError ? [2, e] : [2, e = Sn(Sn({}, e), {
                                value: e.value.filter((function(e) {
                                    return e.isGeneric ? Object.values(an).includes(e.metadata.displayType) : Object.values(cn).includes(e.promptType)
                                }))
                            })]
                    }
                }))
            }))
        },
        Tn = function(e, t) {
            return ft(rt.httpService.post(Nn, {
                action: e,
                promptType: t
            }), on)
        },
        On = (null !== (hn = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== hn ? hn : "URL_NOT_FOUND") + "/proof-of-space";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN", e[e.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", e[e.INVALID_REQUEST = 2] = "INVALID_REQUEST", e[e.INVALID_SESSION = 3] = "INVALID_SESSION"
    }(mn || (mn = {}));
    var In, Rn, Dn, Cn = {
            withCredentials: !0,
            url: On + "/v1/verify",
            timeout: 1e4
        },
        bn = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        gn = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        wn = function(e, t) {
            return bn(void 0, void 0, Promise, (function() {
                return gn(this, (function(n) {
                    return [2, ft(rt.httpService.post(Cn, {
                        challengeId: e,
                        solution: t
                    }), mn)]
                }))
            }))
        },
        Ln = (null !== (In = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== In ? In : "URL_NOT_FOUND") + "/proof-of-work-service";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN", e[e.REQUEST_INVALID = 1] = "REQUEST_INVALID", e[e.SESSION_INACTIVE = 2] = "SESSION_INACTIVE"
    }(Rn || (Rn = {})),
    function(e) {
        e[e.TIME_LOCK = 0] = "TIME_LOCK"
    }(Dn || (Dn = {}));
    var Pn, Un, kn = {
            withCredentials: !0,
            url: Ln + "/v1/pow-puzzle",
            timeout: 1e4
        },
        Mn = {
            withCredentials: !0,
            url: Ln + "/v1/pow-puzzle",
            timeout: 1e4
        },
        Fn = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Kn = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        Vn = function(e) {
            return ft(rt.httpService.get(kn, {
                sessionID: e
            }), Rn)
        },
        xn = function(e, t) {
            return Fn(void 0, void 0, Promise, (function() {
                return Kn(this, (function(n) {
                    return [2, ft(rt.httpService.post(Mn, {
                        sessionID: e,
                        solution: t
                    }), Rn)]
                }))
            }))
        },
        Wn = (null !== (Pn = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== Pn ? Pn : "URL_NOT_FOUND") + "/reauthentication-service";
    ! function(e) {
        e[e.UNKNOWN = 1] = "UNKNOWN", e[e.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", e[e.PASSWORD_INCORRECT = 3] = "PASSWORD_INCORRECT", e[e.OTP_EMAIL_REDEEM_FAILURE = 4] = "OTP_EMAIL_REDEEM_FAILURE"
    }(Un || (Un = {}));
    var Gn, Bn, Yn = {
            withCredentials: !0,
            url: Wn + "/v1/token/generate",
            timeout: 1e4
        },
        Hn = function(e) {
            return ft(rt.httpService.post(Yn, e), Un)
        },
        Qn = (null !== (Gn = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== Gn ? Gn : "URL_NOT_FOUND") + "/rostile";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN", e[e.INTERNAL_ERROR = 1] = "INTERNAL_ERROR", e[e.INVALID_REQUEST = 2] = "INVALID_REQUEST", e[e.INVALID_SESSION = 3] = "INVALID_SESSION"
    }(Bn || (Bn = {}));
    var zn, Xn, jn, Jn, qn = {
            withCredentials: !0,
            url: Qn + "/v1/verify",
            timeout: 1e4
        },
        Zn = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        $n = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        er = function(e, t) {
            return Zn(void 0, void 0, Promise, (function() {
                return $n(this, (function(n) {
                    return [2, ft(rt.httpService.post(qn, {
                        challengeId: e,
                        solution: t
                    }), Bn)]
                }))
            }))
        },
        tr = (null !== (zn = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== zn ? zn : "URL_NOT_FOUND") + "/account-security-service";
    ! function(e) {
        e[e.UNKNOWN = 1] = "UNKNOWN", e[e.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", e[e.SECURITY_QUESTIONS_DISABLED = 3] = "SECURITY_QUESTIONS_DISABLED", e[e.SESSION_INACTIVE = 4] = "SESSION_INACTIVE", e[e.QUESTION_NOT_FOUND = 5] = "QUESTION_NOT_FOUND", e[e.ANSWER_WRONG_FORMAT = 6] = "ANSWER_WRONG_FORMAT"
    }(Xn || (Xn = {})),
    function(e) {
        e[e.INVALID = 0] = "INVALID", e[e.MOST_RECENT_GAMES_PLAYED = 1] = "MOST_RECENT_GAMES_PLAYED"
    }(jn || (jn = {})),
    function(e) {
        e[e.PICK_ALL_CORRECT_CHOICES = 0] = "PICK_ALL_CORRECT_CHOICES", e[e.PICK_C_CORRECT_CHOICES = 1] = "PICK_C_CORRECT_CHOICES"
    }(Jn || (Jn = {}));
    var nr, rr, ir, or, ar, lr = {
            withCredentials: !0,
            url: tr + "/v1/security-question",
            timeout: 1e4
        },
        cr = {
            withCredentials: !0,
            url: tr + "/v1/security-question",
            timeout: 1e4
        },
        ur = function(e, t) {
            return ft(rt.httpService.get(lr, {
                userId: e,
                sessionId: t
            }), Xn)
        },
        sr = function(e, t, n) {
            return ft(rt.httpService.post(cr, {
                userId: e,
                answer: t,
                sessionId: n
            }), Xn)
        },
        dr = "URL_NOT_FOUND",
        fr = null !== (nr = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== nr ? nr : dr,
        Er = null !== (rr = R.EnvironmentUrls.authApi) && void 0 !== rr ? rr : dr,
        pr = fr + "/token-metadata-service";
    ! function(e) {
        e[e.UNKNOWN = 1] = "UNKNOWN", e[e.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", e[e.ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN = 3] = "ATTEMPT_TO_INVALIDATE_CURRENT_TOKEN"
    }(ir || (ir = {})),
    function(e) {
        e[e.UNKNOWN = 1] = "UNKNOWN"
    }(or || (or = {})),
    function(e) {
        e.UNKNOWN = "Unknown", e.APP = "App", e.BROWSER = "Browser", e.STUDIO = "Studio"
    }(ar || (ar = {}));
    var vr, hr, mr, Nr, Sr = {
            withCredentials: !0,
            url: pr + "/v1/sessions",
            timeout: 1e4
        },
        _r = {
            withCredentials: !0,
            url: pr + "/v1/logout",
            timeout: 1e4
        },
        yr = {
            withCredentials: !0,
            url: Er + "/v1/logoutfromallsessionsandreauthenticate",
            timeout: 1e4
        },
        Ar = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Tr = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        Or = function(e, t) {
            return Ar(void 0, void 0, Promise, (function() {
                return Tr(this, (function(n) {
                    return [2, ft(rt.httpService.get(Sr, {
                        nextCursor: e,
                        desiredLimit: t
                    }), ir)]
                }))
            }))
        },
        Ir = function(e) {
            return Ar(void 0, void 0, Promise, (function() {
                return Tr(this, (function(t) {
                    return [2, ft(rt.httpService.post(_r, {
                        token: e
                    }), ir)]
                }))
            }))
        },
        Rr = function(e) {
            return Ar(void 0, void 0, Promise, (function() {
                return Tr(this, (function(t) {
                    return [2, ft(rt.httpService.post(yr, {
                        secureAuthenticationIntent: e
                    }), or)]
                }))
            }))
        },
        Dr = null !== (vr = R.EnvironmentUrls.thumbnailsApi) && void 0 !== vr ? vr : "URL_NOT_FOUND";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(hr || (hr = {})),
    function(e) {
        e.PNG = "Png", e.JPEG = "Jpeg"
    }(mr || (mr = {})),
    function(e) {
        e.ERROR = "Error", e.COMPLETED = "Completed", e.IN_REVIEW = "InReview", e.PENDING = "Pending", e.BLOCKED = "Blocked"
    }(Nr || (Nr = {}));
    var Cr, br, gr = {
            url: Dr + "/v1/games/icons",
            timeout: 1e4
        },
        wr = function(e, t, n, r) {
            return ft(rt.httpService.get(gr, {
                universeIds: e,
                size: t,
                format: n,
                isCircular: r
            }), hr)
        },
        Lr = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Pr = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        Ur = B.cryptoUtil.generateSecureAuthIntent,
        kr = function(e) {
            return ft(rt.httpService.get(be, e || {}), Ee)
        },
        Mr = function(e, t) {
            return ft(rt.httpService.get(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration",
                    timeout: Re
                }
            }(e), t || {}), Ee)
        },
        Fr = function(e) {
            return Lr(void 0, void 0, Promise, (function() {
                var t;
                return Pr(this, (function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, Ur()];
                        case 1:
                            return t = n.sent(), [2, ft(rt.httpService.post(ge(e), {
                                secureAuthenticationIntent: t
                            }), Ee)]
                    }
                }))
            }))
        },
        Kr = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/email/send-code",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        Vr = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/email/verify",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        xr = function(e) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration/email/disable",
                    timeout: Re
                }
            }(e), {}), Ee)
        },
        Wr = function(e) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration/authenticator/enable",
                    timeout: Re
                }
            }(e), {}), Ee)
        },
        Gr = function(e, t, n) {
            return Lr(void 0, void 0, Promise, (function() {
                var r;
                return Pr(this, (function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, Ur()];
                        case 1:
                            return r = i.sent(), [2, ft(rt.httpService.post(we(e), {
                                setupToken: t,
                                code: n,
                                secureAuthenticationIntent: r
                            }), Ee)]
                    }
                }))
            }))
        },
        Br = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/authenticator/verify",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        Yr = function(e) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration/authenticator/disable",
                    timeout: Re
                }
            }(e), {}), Ee)
        },
        Hr = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/recovery-codes/verify",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        Qr = function(e) {
            return ft(rt.httpService.get(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/recovery-codes",
                    timeout: Re
                }
            }(e)), Ee)
        },
        zr = function(e) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/recovery-codes/regenerate",
                    timeout: Re
                }
            }(e), {
                password: "password"
            }), Ee)
        },
        Xr = function(e) {
            return Lr(void 0, void 0, Promise, (function() {
                var t;
                return Pr(this, (function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, Ur()];
                        case 1:
                            return t = n.sent(), [2, ft(rt.httpService.post(Le(e), {
                                secureAuthenticationIntent: t
                            }), Ee)]
                    }
                }))
            }))
        },
        jr = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/sms/send-code",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        Jr = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/sms/verify",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        qr = function(e) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration/sms/disable",
                    timeout: Re
                }
            }(e), {}), Ee)
        },
        Zr = function(e) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration/security-key/enable",
                    timeout: Re
                }
            }(e), {}), Ee, (function(e) {
                return {
                    creationOptions: JSON.parse(e.creationOptions),
                    sessionId: e.sessionId
                }
            }))
        },
        $r = function(e, t, n, r) {
            return Lr(void 0, void 0, Promise, (function() {
                var i;
                return Pr(this, (function(o) {
                    switch (o.label) {
                        case 0:
                            return [4, Ur()];
                        case 1:
                            return i = o.sent(), [2, ft(rt.httpService.post(Pe(e), {
                                sessionId: t,
                                credentialNickname: n,
                                attestationResponse: r,
                                secureAuthenticationIntent: i
                            }), Ee)]
                    }
                }))
            }))
        },
        ei = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/security-key/verify-start",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        ti = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/security-key/verify-finish",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        ni = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration/security-key/disable",
                    timeout: Re
                }
            }(e), {
                credentialNicknames: t
            }), Ee)
        },
        ri = function(e) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/configuration/security-key/list",
                    timeout: Re
                }
            }(e), {}), Ee)
        },
        ii = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/passkey/verify-start",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        oi = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/passkey/verify-finish",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        ai = function() {
            return ft(rt.httpService.get(Ue, {}), Ee)
        },
        li = function() {
            return ft(rt.httpService.get(ke, {}), Ee)
        },
        ci = function() {
            return ft(rt.httpService.get(Me, {}), Ee)
        },
        ui = function() {
            return ft(rt.httpService.post(Fe, {}), Ee)
        },
        si = function() {
            return ft(rt.httpService.post(Ke, {}), Ee)
        },
        di = function() {
            return ft(rt.httpService.post(Ve, {}), Ee)
        },
        fi = function(e, t) {
            return ft(rt.httpService.post(xe, {
                challengeToken: e,
                verificationToken: t
            }), Ee)
        },
        Ei = function(e, t) {
            return ft(rt.httpService.post(We, {
                challengeToken: e,
                verificationToken: t
            }), Ee)
        },
        pi = function(e, t) {
            return ft(rt.httpService.post(Ge, {
                challengeToken: e,
                verificationToken: t
            }), Ee)
        },
        vi = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/cross-device/retry",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        hi = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/cross-device/verify",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        mi = function(e, t) {
            return ft(rt.httpService.post(function(e) {
                return {
                    withCredentials: !0,
                    url: Te + "/v1/users/" + e + "/challenges/cross-device/retract",
                    timeout: Re
                }
            }(e), t), Ee)
        },
        Ni = null !== (Cr = R.EnvironmentUrls.universalAppConfigurationApi) && void 0 !== Cr ? Cr : "URL_NOT_FOUND";
    ! function(e) {
        e[e.INTERNAL_ERROR = 9] = "INTERNAL_ERROR"
    }(br || (br = {}));
    var Si, _i, yi = {
            withCredentials: !0,
            url: Ni + "/v1/behaviors/account-settings-ui/content",
            timeout: 1e4
        },
        Ai = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Ti = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        Oi = function() {
            return Ai(void 0, void 0, Promise, (function() {
                return Ti(this, (function(e) {
                    return [2, ft(rt.httpService.get(yi, {}), br)]
                }))
            }))
        },
        Ii = null !== (Si = R.EnvironmentUrls.authApi) && void 0 !== Si ? Si : "URL_NOT_FOUND";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(_i || (_i = {}));
    var Ri, Di, Ci, bi = {
            withCredentials: !0,
            url: Ii + "/v1/xbox/connection",
            timeout: 1e4
        },
        gi = {
            withCredentials: !0,
            url: Ii + "/v1/xbox/disconnect",
            timeout: 1e4
        },
        wi = function() {
            return ft(rt.httpService.get(bi, {}), _i)
        },
        Li = function() {
            return ft(rt.httpService.post(gi, {}), _i)
        },
        Pi = (null !== (Ri = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== Ri ? Ri : "URL_NOT_FOUND") + "/account-security-service";
    ! function(e) {
        e[e.UNKNOWN = 1] = "UNKNOWN", e[e.REQUEST_TYPE_WAS_INVALID = 2] = "REQUEST_TYPE_WAS_INVALID", e[e.INVAID_METRIC_NAME = 3] = "INVAID_METRIC_NAME", e[e.INVALID_METRIC_LABELS = 4] = "INVALID_METRIC_LABELS"
    }(Di || (Di = {})),
    function(e) {
        e.Event2sv = "event_2sv", e.SolveTime2sv = "solve_time_2sv", e.EventCaptcha = "event_captcha", e.SolveTimeCaptcha = "solve_time_captcha", e.EventPat = "event_pat", e.SolveTimePat = "solve_time_pat", e.EventPos = "event_pos", e.PuzzleComputeTimePos = "puzzle_compute_time_pos", e.SolveTimePos = "solve_time_pos", e.EventPow = "event_pow", e.PuzzleComputeTimePow = "puzzle_compute_time_pow", e.SolveTimePow = "solve_time_pow", e.EventRostile = "event_rostile", e.SolveTimeRostile = "solve_time_rostile", e.EventSecurityQuestion = "event_security_question", e.EventGeneric = "event_generic", e.EventReauthentication = "event_reauthentication", e.SolveTimeReauthentication = "solve_time_reauthentication", e.EventDeviceIntegrity = "event_device_integrity", e.SolveTimeDeviceIntegrity = "solve_time_device_integrity", e.EventPhoneVerification = "event_phone_verification", e.SolveTimePhoneVerification = "solve_time_phone_verification", e.EventEmailVerification = "event_email_verification", e.SolveTimeEmailVerification = "solve_time_email_verification"
    }(Ci || (Ci = {}));
    var Ui, ki, Mi = {
            withCredentials: !0,
            url: Pi + "/v1/metrics/record",
            timeout: 1e4
        },
        Fi = function(e) {
            return ft(rt.httpService.post(Mi, e), Di)
        },
        Ki = (null !== (Ui = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== Ui ? Ui : "URL_NOT_FOUND") + "/private-access-token";
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN"
    }(ki || (ki = {}));
    var Vi, xi, Wi = {
            withCredentials: !0,
            url: Ki + "/v1/getPATToken",
            timeout: 1e4
        },
        Gi = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Bi = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        Yi = function(e) {
            return Gi(void 0, void 0, Promise, (function() {
                return Bi(this, (function(t) {
                    return [2, ft(rt.httpService.post(Wi, {
                        challengeId: e
                    }), ki)]
                }))
            }))
        },
        Hi = (null !== (Vi = R.EnvironmentUrls.apiGatewayUrl) && void 0 !== Vi ? Vi : "URL_NOT_FOUND") + "/challenge";
    ! function(e) {
        e[e.UNKNOWN = 1] = "UNKNOWN"
    }(xi || (xi = {}));
    var Qi, zi, Xi = {
            withCredentials: !0,
            url: Hi + "/v1/continue",
            timeout: 1e4
        },
        ji = function(e, t, n, r) {
            return new(n || (n = Promise))((function(i, o) {
                function a(e) {
                    try {
                        c(r.next(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function l(e) {
                    try {
                        c(r.throw(e))
                    } catch (e) {
                        o(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(a, l)
                }
                c((r = r.apply(e, t || [])).next())
            }))
        },
        Ji = function(e, t) {
            var n, r, i, o, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return o = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                return this
            }), o;

            function l(o) {
                return function(l) {
                    return function(o) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; a;) try {
                            if (n = 1, r && (i = 2 & o[0] ? r.return : o[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, o[1])).done) return i;
                            switch (r = 0, i && (o = [2 & o[0], i.value]), o[0]) {
                                case 0:
                                case 1:
                                    i = o;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: o[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = o[1], o = [0];
                                    continue;
                                case 7:
                                    o = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = a.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== o[0] && 2 !== o[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
                                        a.label = o[1];
                                        break
                                    }
                                    if (6 === o[0] && a.label < i[1]) {
                                        a.label = i[1], i = o;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(o);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            o = t.call(e, a)
                        } catch (e) {
                            o = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & o[0]) throw o[1];
                        return {
                            value: o[0] ? o[1] : void 0,
                            done: !0
                        }
                    }([o, l])
                }
            }
        },
        qi = function(e, t, n) {
            return ji(void 0, void 0, Promise, (function() {
                return Ji(this, (function(r) {
                    return [2, ft(rt.httpService.post(Xi, {
                        challengeId: e,
                        challengeType: t,
                        challengeMetadata: n
                    }), xi)]
                }))
            }))
        },
        Zi = null !== (Qi = R.EnvironmentUrls.authApi) && void 0 !== Qi ? Qi : "URL_NOT_FOUND",
        $i = 1e4;
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN", e[e.EXCEEDED_REGISTERED_KEYS_LIMIT = 1] = "EXCEEDED_REGISTERED_KEYS_LIMIT", e[e.FEATURE_DISABLED = 2] = "FEATURE_DISABLED", e[e.INVALID_CREDENTIAL_NICKNAME = 3] = "INVALID_CREDENTIAL_NICKNAME"
    }(zi || (zi = {}));
    var eo, to = {
            withCredentials: !0,
            url: Zi + "/v1/passkey/StartRegistration",
            timeout: $i
        },
        no = {
            withCredentials: !0,
            url: Zi + "/v1/passkey/FinishRegistration",
            timeout: $i
        },
        ro = {
            withCredentials: !0,
            url: Zi + "/v1/passkey/DeleteCredentialBatch",
            timeout: $i
        },
        io = {
            withCredentials: !0,
            url: Zi + "/v1/passkey/ListCredentials",
            timeout: $i
        },
        oo = function() {
            return ft(rt.httpService.post(to, {}), zi, (function(e) {
                return {
                    creationOptions: JSON.parse(e.creationOptions),
                    sessionId: e.sessionId
                }
            }))
        },
        ao = function(e, t, n) {
            return ft(rt.httpService.post(no, {
                sessionId: e,
                credentialNickname: t,
                attestationResponse: n
            }), zi)
        },
        lo = function(e) {
            return ft(rt.httpService.post(ro, {
                credentialNicknames: e
            }), zi)
        },
        co = function() {
            return ft(rt.httpService.post(io, {
                all: !0
            }), zi)
        };
    ! function(e) {
        e[e.UNKNOWN = 0] = "UNKNOWN", e[e.CANCELLATION_ERROR = 1] = "CANCELLATION_ERROR", e[e.INTERRUPTED_ERROR = 2] = "INTERRUPTED_ERROR", e[e.INVALID_REQUEST = 3] = "INVALID_REQUEST", e[e.JSON_EXCEPTION = 4] = "JSON_EXCEPTION", e[e.CREDENTIALS_PROTOCOL_NOT_SUPPORTED = 5] = "CREDENTIALS_PROTOCOL_NOT_SUPPORTED", e[e.NO_CREDENTIALS_FOUND = 6] = "NO_CREDENTIALS_FOUND", e[e.INVALID_STATE_ERROR = 11] = "INVALID_STATE_ERROR"
    }(eo || (eo = {}));
    var uo = function(e) {
            return e.code
        },
        so = function(e, t, n) {
            return Et(B.hybridResponseService.getNativeResponse(e, t, n), eo, uo, (function(e) {
                if (null === e) return null;
                var t = JSON.parse(e);
                if (void 0 !== t.errorCode) throw {
                    name: "getNativeResponse Error",
                    message: t.errorMsg,
                    code: t.errorCode
                };
                return !(R.DeviceMeta && (0, R.DeviceMeta)().isInApp && (0, R.DeviceMeta)().isAndroidApp) ? B.fido2Util.formatCredentialAuthenticationResponseApp(e) : e
            }))
        },
        fo = function(e) {
            return Et(navigator.credentials.get(e), eo).then((function(e) {
                return lt(e, (function(e) {
                    return null === e ? null : B.fido2Util.formatCredentialAuthenticationResponseWeb(e)
                }))
            }))
        },
        Eo = new function() {
            this.captcha = t, this.email = n, this.fido2 = O, this.games = r, this.metrics = _, this.myAccount = i, this.otp = o, this.password = a, this.phone = l, this.playstation = c, this.promptAssignments = u, this.securityQuestions = p, this.sessionManagement = v, this.reauthentication = f, this.rostile = E, this.thumbnails = h, this.twoStepVerification = m, this.universalAppConfiguration = N, this.proofOfSpace = s, this.proofOfWork = d, this.xbox = S, this.privateAccessToken = y, this.genericChallenge = A, this.authApi = T
        },
        po = new nt,
        vo = function() {},
        ho = function(e) {
            var t = e.translate,
                n = e.onCreationSuccess,
                r = void 0 === n ? vo : n,
                i = e.onDuplicateCreated,
                o = void 0 === i ? vo : i,
                a = e.onDeleteSuccess,
                l = void 0 === a ? vo : a,
                c = e.onLastKeyDeleted,
                u = void 0 === c ? vo : c,
                s = e.onGenericError,
                d = void 0 === s ? vo : s,
                f = e.registeredKeys,
                E = void 0 === f ? [] : f,
                p = e.fido2Supported,
                v = e.credentialPurpose,
                h = e.deleteAllPasskeysAllowed;
            return b().createElement(K, {
                translate: t,
                eventService: po,
                requestService: Eo,
                onCreationSuccess: r,
                onDuplicateCreated: o,
                onDeleteSuccess: l,
                onLastKeyDeleted: u,
                onGenericError: d,
                credentialPurpose: v,
                registeredKeys: E,
                fido2Supported: p,
                deleteAllPasskeysAllowed: h
            }, b().createElement(tt, null))
        };
    ho.defaultProps = {
        onCreationSuccess: vo,
        onDuplicateCreated: vo,
        onDeleteSuccess: vo,
        onLastKeyDeleted: vo,
        onGenericError: vo,
        registeredKeys: [],
        fido2Supported: void 0,
        deleteAllPasskeysAllowed: !0
    };
    var mo = (0, w.withTranslations)(ho, {
            common: [],
            feature: "Feature.AccountSettings"
        }),
        No = function(e) {
            var t = e.containerId,
                n = e.onCreationSuccess,
                r = e.onDuplicateCreated,
                i = e.onDeleteSuccess,
                o = e.onLastKeyDeleted,
                a = e.onGenericError,
                l = e.credentialPurpose,
                c = e.registeredKeys,
                u = e.fido2Supported,
                s = e.deleteAllPasskeysAllowed,
                d = document.getElementById(t);
            return null != d && ((0, g.unmountComponentAtNode)(d), (0, g.render)(b().createElement(mo, {
                onCreationSuccess: n,
                onDuplicateCreated: r,
                onDeleteSuccess: i,
                onLastKeyDeleted: o,
                onGenericError: a,
                credentialPurpose: l,
                registeredKeys: c,
                fido2Supported: u,
                deleteAllPasskeysAllowed: s
            }), d), !0)
        },
        So = {
            renderFido2CredentialRegistration: No,
            CredentialPurpose: V
        };
    Object.assign(D(), {
        Fido2CredentialRegistrationService: So
    })
}();
//# sourceMappingURL=https://js.rbxcdn.com/d48c6b44b4b760b403e190cf1ff8eeeb-fido2CredentialRegistration.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Fido2CredentialRegistration");