! function() {
    "use strict";
    var e, t = {
            n: function(e) {
                var n = e && e.__esModule ? function() {
                    return e.default
                } : function() {
                    return e
                };
                return t.d(n, {
                    a: n
                }), n
            },
            d: function(e, n) {
                for (var o in n) t.o(n, o) && !t.o(e, o) && Object.defineProperty(e, o, {
                    enumerable: !0,
                    get: n[o]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        n = Roblox,
        o = t.n(n),
        i = React,
        a = t.n(i),
        r = ReactDOM,
        s = ReactStyleGuide,
        c = ReactUtilities,
        l = "enterEmail",
        u = "enterCode",
        d = "Label.Email",
        g = "Response.InvalidEmail",
        p = "Action.SendCode",
        h = "Label.SixDigitCode",
        m = "Label.CodeSent",
        E = "Action.Resend",
        f = "Action.Continue",
        S = "Action.ChangeEmail",
        C = "Description.EnterCodeHelpV3",
        T = "Action.DidntReceiveCode",
        y = "Response.TooManyAttemptsPleaseWait",
        v = "Response.ErrorUseCorporateNetwork",
        b = "Response.UnknownError",
        k = "Response.IncorrectOtpCode",
        O = 3,
        P = 6,
        _ = 8,
        w = 2,
        x = 429,
        L = "email",
        A = function() {
            return A = Object.assign || function(e) {
                for (var t, n = 1, o = arguments.length; n < o; n++)
                    for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }, A.apply(this, arguments)
        };
    ! function(e) {
        e[e.SET_ENTER_EMAIL_PAGE = 0] = "SET_ENTER_EMAIL_PAGE", e[e.SET_ENTER_CODE_PAGE = 1] = "SET_ENTER_CODE_PAGE", e[e.SET_EMAIL = 2] = "SET_EMAIL", e[e.SET_SESSION_TOKEN = 3] = "SET_SESSION_TOKEN", e[e.SET_OTP_CODE = 4] = "SET_OTP_CODE", e[e.SET_LEGAL_CHECK = 5] = "SET_LEGAL_CHECK", e[e.SET_CODE_VALID = 6] = "SET_CODE_VALID", e[e.SET_LOADING = 7] = "SET_LOADING", e[e.SET_CHECKBOX_AND_CONTINUE_BUTTON_STATE = 8] = "SET_CHECKBOX_AND_CONTINUE_BUTTON_STATE", e[e.SET_ERROR = 9] = "SET_ERROR", e[e.CLOSE_MODAL = 10] = "CLOSE_MODAL"
    }(e || (e = {}));
    var M = {
            emailVerifyCodeModalPage: l,
            email: "",
            sessionToken: "",
            code: "",
            isChecked: !1,
            isCheckboxEnabled: !1,
            isLoading: !1,
            isCodeValid: !1,
            isContinueButtonEnabled: !1,
            errorMessage: "",
            isModalOpen: !0
        },
        R = (0, i.createContext)(null),
        N = function(t, n) {
            var o = A({}, t);
            switch (n.type) {
                case e.SET_ENTER_EMAIL_PAGE:
                    return o.emailVerifyCodeModalPage = l, o;
                case e.SET_ENTER_CODE_PAGE:
                    return o.emailVerifyCodeModalPage = u, o;
                case e.SET_EMAIL:
                    return o.email = n.email, o;
                case e.SET_SESSION_TOKEN:
                    return o.sessionToken = n.sessionToken, o;
                case e.SET_OTP_CODE:
                    return o.code = n.code, o;
                case e.SET_LEGAL_CHECK:
                    return o.isChecked = n.isChecked, o;
                case e.SET_CODE_VALID:
                    return o.isCodeValid = n.isCodeValid, o;
                case e.SET_LOADING:
                    return o.isLoading = n.isLoading, o;
                case e.SET_CHECKBOX_AND_CONTINUE_BUTTON_STATE:
                    return o.isContinueButtonEnabled = n.isContinueButtonEnabled, o.isCheckboxEnabled = n.isCheckboxEnabled, o;
                case e.SET_ERROR:
                    return o.errorMessage = n.errorMessage, o;
                case e.CLOSE_MODAL:
                    return o.isModalOpen = !1, o;
                default:
                    return t
            }
        },
        I = function(e) {
            var t = e.children,
                n = (0, i.useReducer)(N, M),
                o = n[0],
                r = n[1];
            return a().createElement(R.Provider, {
                value: {
                    state: o,
                    dispatch: r
                }
            }, t)
        },
        D = function() {
            var e = (0, i.useContext)(R);
            if (null === e) throw new Error("EmailVerifyCodeModalContext was not provided in the current scope");
            return e
        },
        B = {
            common: ["Common.Captcha"],
            feature: "Authentication.Login"
        },
        F = function(e) {
            return new RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$").test(e)
        },
        U = {
            schematizedEventTypes: {
                authFormInteraction: "authFormInteraction",
                authButtonClick: "authButtonClick",
                authMsgShown: "authMsgShown",
                authPageLoad: "authPageload",
                authModalShown: "authModalShown",
                authClientError: "authClientError",
                usernameSuggestionShown: "usernameSuggestionShown"
            },
            eventName: {
                loginOtherDevice: "loginOtherDevice",
                formValidation: "formValidation",
                authPageLoad: "authPageload",
                authFormInteraction: "authFormInteraction",
                authButtonClick: "authButtonClick",
                authModalShown: "authModalShown",
                saiCreated: "saiCreated",
                saiMissing: "saiMissing",
                signupUsernameKeystrokes: "accountIntegrityKeystrokeEvents",
                qualifiedSignup: "qualifiedSignup"
            },
            context: {
                loginPage: "loginPage",
                loginForm: "LoginForm",
                schematizedLoginForm: "loginForm",
                lrLoginForm: "lrLoginForm",
                landingPage: "Multiverse",
                signupForm: "MultiverseSignupForm",
                schematizedSignupForm: "signupForm",
                lrSignupForm: "lrSignupForm",
                sendOTP: "sendOTP",
                schematizedSendOTP: "sendOtp",
                enterOTP: "enterOTP",
                schematizedEnterOTP: "enterOtp",
                validateOTP: "validateOTP",
                disambiguationOTP: "disambiguationOTP",
                disambiguationEmail: "disambiguationEmail",
                disambiguationPhone: "disambiguationPhone",
                disambigOTP: "disambigOtp",
                revertAccount: "revertAccount",
                accountSwitcherConfirmation: "accountSwitcherConfirmation",
                accountSwitcherModal: "accountSwitcherModal",
                accountSwitcherLimitError: "accountSwitcherLimitError",
                accountSwitcherLogin: "accountSwitcherLogin",
                accountSwitcherSignup: "accountSwitcherSignup",
                accountSwitcherBackendRequestFailure: "accountSwitcherBackendRequestFailure",
                accountSwitcherLocalStorageFailure: "accountSwitcherLocalStorageFailure",
                accountSwitcherVpcLogin: "accountSwitcherVpcLogin",
                accountSwitcherVpcSignup: "accountSwitcherVpcSignup",
                platformAuthenticatorSupport: "platformAuthenticatorSupport",
                passkeyLogin: "passkeyLogin",
                silentPasskeyUpgradeWebLogin: "handleSilentPasskeyUpgradeWebLogin",
                silentPasskeyUpgradeWebLoginImmediate: "handleSilentPasskeyUpgradeWebLoginImmediate",
                silentPasskeyUpgradeWebLoginDelayed: "handleSilentPasskeyUpgradeWebLoginDelayed",
                silentPasskeyUpgradeWebSignupDelayed: "handleSilentPasskeyUpgradeWebSignupDelayed",
                hba: "hba",
                resetPasswordPage: "resetPasswordPage"
            },
            verifiedParentalConsentContext: {
                chargeback: {
                    finishParentalSignup: "finishParentalSignup",
                    homepage: "homepage"
                },
                savePaymentMethods: {
                    finishParentalSignup: "finishParentalSignupDevsubs",
                    homepage: "homepageDevsubs"
                },
                changeBirthdayContext: {
                    finishParentalSignup: "finishParentalSignupAgeChange",
                    homepage: "homepageAgeChange"
                },
                linkToChild: {
                    finishParentalSignup: "finishParentalSignupLinking",
                    homepage: "homePageLinking"
                },
                updateUserSetting: {
                    finishParentalSignup: "finishParentalSignupSettings",
                    homepage: "homePageSettings"
                }
            },
            aType: {
                buttonClick: "buttonClick",
                click: "click",
                offFocus: "offFocus",
                focus: "focus",
                shown: "shown",
                dismissed: "dismissed"
            },
            field: {
                loginOtherDevice: "loginOtherDevice",
                loginOTP: "loginOTP",
                OTP: "otp",
                loginSubmitButtonName: "loginSubmit",
                password: "password",
                username: "username",
                signupSubmitButtonName: "signupSubmit",
                appButtonClickName: "AppLink",
                showPassword: "showPassword",
                hidePassword: "hidePassword",
                birthdayDay: "birthdayDay",
                birthdayMonth: "birthdayMonth",
                birthdayYear: "birthdayYear",
                signupUsername: "signupUsername",
                signupPassword: "signupPassword",
                signupEmail: "signupEmail",
                parentEmail: "parentEmail",
                genderMale: "genderMale",
                genderFemale: "genderFemale",
                email: "email",
                code: "code",
                otpCode: "OTPcode",
                errorMessage: "errorMessage",
                resendErrorMessage: "resendErrorMessage",
                accountSelection: "accountSelection",
                checked: "checked",
                unchecked: "unchecked",
                usernameValid: "usernameValid",
                revertAccountSubmitButtonName: "revertAccountSubmit",
                birthday: "birthday",
                accountSwitcher: "accountSwitcher",
                logoutPopup: "logoutPopup",
                hasAuthIntent: "hasAuthIntent",
                tosCheckbox: "tosCheckbox",
                exitSignupConfirmation: "exitSignupConfirmation"
            },
            btn: {
                cancel: "cancel",
                sendCode: "sendCode",
                resendCode: "resendCode",
                resend: "resend",
                login: "login",
                xdl: "xdl",
                forgotCredentials: "forgotCredentials",
                createAccount: "createAccount",
                logoutAll: "logoutAll",
                signup: "signup",
                continue: "continue",
                changeEmail: "changeEmail",
                select: "select",
                parentalConsentCheckbox: "pc_checkbox",
                termsOfServiceCheckbox: "tos_checkbox",
                privacyPolicyCheckbox: "pp_checkbox",
                termsOfServiceLink: "tos_link",
                privacyPolicyLink: "pp_link",
                submitRevertAccount: "submitRevertAccount",
                dismiss: "dismiss",
                switch: "switch",
                addAccount: "addAccount",
                primaryButton: "primaryButton",
                secondaryButton: "secondaryButton",
                usernameSuggestion: "usernameSuggestion",
                signIn: "signIn",
                lrSignInButton: "lrSignInButton",
                signupSubmit: "signupSubmit",
                genderMale: "genderMale",
                genderFemale: "genderFemale",
                showPassword: "showPassword",
                hidePassword: "hidePassword",
                koreaConsentAllCheckbox: "koreaConsentAll",
                koreaTosAndPrivacyPolicyCheckbox: "koreaToS1",
                koreaThirdPartyPersonalInfoCheckbox: "koreaToS2",
                koreaTransferPersonalInfoCheckbox: "koreaToS3",
                koreaPersonalInfoCheckbox: "koreaToS4",
                koreaOptionalPersonalInfoCheckbox: "koreaToS5Optional",
                koreaAgreeTermsOfService: "koreaAgreeToS",
                logoutPopupLogout: "logoutPopupLogout",
                addPasskeyInlineCTA: "addPasskeyInlineCTA",
                addPasskeyModal: "addPasskeyModal",
                skipPasskey: "skipPasskey",
                exitSignupConfirmYes: "exitSignupConfirmYes",
                exitSignupConfirmCancel: "exitSignupConfirmCancel"
            },
            input: {
                redacted: "[Redacted]"
            },
            origin: {
                webVerifiedSignup: "WebVerifiedSignup",
                signup: "signup",
                login: "login"
            },
            text: {
                finishCreatingYourAccount: "Create Your Roblox Account",
                signup: "Sign Up",
                createAccount: "Create Account",
                logout: "Log Out"
            },
            clientErrorTypes: {
                pageLoadFailed: "pageLoadFailed",
                userInfoFetchFailed: "userInfoFetchFailed",
                localStorageSetFailure: "localStorageSetFailure",
                localStorageGetFailure: "localStorageGetFailure",
                localStorageRemoveFailure: "localStorageRemoveFailure",
                logoutAllAccountSwitcherAccounts: "logoutAllAccountSwitcherAccounts"
            },
            state: {
                focused: "focused",
                unfocused: "unfocused",
                selected: "selected",
                unselected: "unselected",
                passkeyUpselling: {
                    passkeyRegistrationSuccess: "passkeyRegistrationSuccess",
                    passkeyRegistrationFailure: "passkeyRegistrationFailure",
                    passkeyOsDialogue: "passkeyOsDialogue",
                    passkeyUpsellModal: "passkeyUpsellModal",
                    passkeyUpsellShown: "passkeyUpsellShown",
                    passkeyNotSupported: "passkeyNotSupported",
                    passkeyUpsellFilteredByInAppTraffic: "passkeyUpsellFilteredByInAppTraffic",
                    filteredByNoPasskeySupport: "filteredByNoPasskeySupport",
                    filteredByNoSilentUpgradeSupport: "filteredByNoSilentUpgradeSupport",
                    unclearedWebSessionFlag: "unclearedWebSessionFlag"
                }
            }
        },
        V = CoreRobloxUtilities,
        G = V.eventStreamService.eventTypes,
        W = function(e) {
            var t = e.ctx,
                n = e.field,
                o = e.origin,
                i = e.entered,
                a = e.state,
                r = {};
            r.field = n, i && (r.entered = i), a && (r.state = a), o && (r.origin = o), V.eventStreamService.sendEventWithTarget(U.schematizedEventTypes.authFormInteraction, t, r)
        },
        K = function(e) {
            var t;
            return ((t = {})[U.context.validateOTP] = U.context.schematizedEnterOTP, t[U.context.enterOTP] = U.context.schematizedEnterOTP, t[U.context.sendOTP] = U.context.schematizedSendOTP, t)[e] || e
        },
        z = function(e) {
            var t = e.ctx,
                n = e.field,
                o = e.btn,
                i = e.aType,
                a = e.errorCode,
                r = e.origin,
                s = {};
            s.field = n, o && (s.btn = o), i && (s.aType = i), a && (s.errorCode = a), r && (s.origin = r), V.eventStreamService.sendEventWithTarget(G.formInteraction, t, s)
        },
        H = function(e, t, n) {
            z({
                ctx: e,
                field: U.field.errorMessage,
                aType: U.aType.shown,
                errorCode: t,
                origin: n
            }), V.eventStreamService.sendEventWithTarget(U.schematizedEventTypes.authMsgShown, K(e), {
                field: e === U.context.enterOTP ? U.field.resendErrorMessage : U.field.errorMessage,
                errorCode: t,
                origin: n
            })
        },
        Y = function(e, t, n) {
            V.eventStreamService.sendEventWithTarget(G.buttonClick, e, {
                btn: t,
                origin: n
            }), V.eventStreamService.sendEventWithTarget(U.schematizedEventTypes.authButtonClick, K(e), {
                btn: t,
                origin: n
            })
        },
        j = function(e, t, n) {
            V.eventStreamService.sendEventWithTarget(G.modalAction, e, {
                aType: t,
                origin: n
            })
        },
        q = function(e, t) {
            V.eventStreamService.sendEventWithTarget(U.schematizedEventTypes.authPageLoad, K(e), {
                origin: t
            })
        },
        X = (0, c.withTranslations)((function(t) {
            var n = t.origin,
                o = t.titleText,
                r = t.descriptionText,
                l = t.onSendCode,
                u = t.errorMessage,
                h = t.onClose,
                m = t.translate,
                E = D(),
                f = E.state.email,
                S = E.dispatch,
                C = (0, i.useState)(!0),
                T = C[0],
                y = C[1],
                v = (0, i.useState)(!1),
                b = v[0],
                k = v[1],
                O = U.context.sendOTP,
                P = (0, c.useDebounce)(f, 200),
                _ = function() {
                    k(!0), Y(O, U.btn.sendCode, n), l()
                };
            (0, i.useEffect)((function() {
                T && f.length > 0 && (y(!1), function(e) {
                    z({
                        ctx: U.context.sendOTP,
                        field: U.field.email,
                        origin: e
                    }), W({
                        ctx: U.context.schematizedSendOTP,
                        field: U.field.email,
                        origin: e
                    })
                }(n)), !F(P) && P.length > 0 ? S({
                    type: e.SET_ERROR,
                    errorMessage: m(g)
                }) : S({
                    type: e.SET_ERROR,
                    errorMessage: ""
                })
            }), [P]), (0, i.useEffect)((function() {
                u && k(!1)
            }), [u]);
            return (0, i.useEffect)((function() {
                j(O, U.aType.shown, n), q(O, n)
            }), []), a().createElement(i.Fragment, null, a().createElement(s.Modal.Header, {
                title: o,
                onClose: function() {
                    Y(O, U.btn.cancel, n), j(O, U.aType.dismissed, n), h()
                }
            }), a().createElement(s.Modal.Body, null, a().createElement("p", {
                className: "email-verify-code-help-text"
            }, r), a().createElement("input", {
                placeholder: m(d),
                onChange: function(t) {
                    return n = t.target.value, void S({
                        type: e.SET_EMAIL,
                        email: n
                    });
                    var n
                },
                type: "email",
                autoFocus: !0,
                className: "form-control input-field email-verify-code-input",
                autoComplete: "email",
                maxLength: 320,
                onKeyPress: function(e) {
                    "Enter" === e.key && F(f) && !b && _()
                },
                value: f
            }), a().createElement("p", {
                className: "text-error input-validation email-verify-code-error-text"
            }, u), a().createElement(s.Button, {
                className: "email-verify-code-button",
                variant: s.Button.variants.secondary,
                isDisabled: b || !F(f),
                onClick: _
            }, m(p))))
        }), B),
        $ = function(e) {
            var t = e.id,
                n = e.legalText,
                o = e.isChecked,
                i = void 0 !== o && o,
                r = e.disabled,
                s = void 0 !== r && r,
                c = e.onCheckBoxChanged;
            return a().createElement("div", {
                className: "legal-text-container"
            }, a().createElement("div", {
                className: "terms-agreement terms-agreement-checkbox"
            }, a().createElement("input", {
                id: t,
                className: "checkbox",
                type: "checkbox",
                checked: i,
                onChange: c,
                disabled: s
            }), a().createElement("label", {
                htmlFor: t,
                dangerouslySetInnerHTML: {
                    __html: n
                }
            })))
        },
        J = (0, c.withTranslations)((function(t) {
            var n = t.origin,
                o = t.titleText,
                r = t.descriptionText,
                l = t.legalCheckboxLabel,
                u = t.code,
                d = t.codeLength,
                g = t.isCheckboxEnabled,
                p = t.isContinueButtonEnabled,
                y = t.onContinueButtonPressed,
                v = t.onResendCode,
                b = t.onClose,
                k = t.translate,
                O = t.isChangeEmailEnabled,
                P = D(),
                _ = P.state,
                w = _.email,
                x = _.isChecked,
                L = _.isLoading,
                A = _.errorMessage,
                M = P.dispatch,
                R = (0, i.useState)(!0),
                N = R[0],
                I = R[1],
                B = (0, i.useState)(0),
                F = B[0],
                K = B[1],
                H = (0, i.useState)(!0),
                X = H[0],
                J = H[1],
                Q = (0, c.useDebounce)(u, 200),
                Z = U.context.enterOTP,
                ee = function() {
                    if (I(!1), 0 === F) var e = setInterval((function() {
                        K((function(t) {
                            return 1 === t && (clearInterval(e), I(!0)), t - 1
                        }))
                    }), 1e3);
                    K(30)
                },
                te = function() {
                    Y(Z, U.btn.resendCode, n), v(), ee()
                },
                ne = function(t) {
                    M({
                            type: e.SET_LEGAL_CHECK,
                            isChecked: t.target.checked
                        }),
                        function(e, t, n, o) {
                            V.eventStreamService.sendEventWithTarget(G.buttonClick, e, {
                                btn: t,
                                field: n ? U.field.checked : U.field.unchecked,
                                origin: o
                            })
                        }(Z, U.btn.parentalConsentCheckbox, t.target.checked, n)
                };
            (0, i.useEffect)((function() {
                X && u.length > 0 && (J(!1), function(e) {
                    z({
                        ctx: U.context.enterOTP,
                        field: U.field.otpCode,
                        origin: e
                    }), W({
                        ctx: U.context.schematizedEnterOTP,
                        field: U.field.code,
                        origin: e
                    })
                }(n))
            }), [Q]);
            var oe = a().createElement("div", {
                className: "email-verify-code-help-text",
                dangerouslySetInnerHTML: {
                    __html: "<p className='email-verify-code-help-text'>" + k(C, {
                        email: "<b>" + w + "</b>"
                    }) + "</p>"
                }
            });
            return (0, i.useEffect)((function() {
                j(Z, U.aType.shown, n), q(Z, n), ee()
            }), []), a().createElement(i.Fragment, null, a().createElement(s.Modal.Header, {
                title: o,
                onClose: function() {
                    Y(Z, U.btn.cancel, n), j(Z, U.aType.dismissed, n), b()
                }
            }), a().createElement(s.Modal.Body, null, O ? a().createElement(i.Fragment, null, oe, a().createElement("div", {
                className: "email-verify-code-email-display"
            }, a().createElement("button", {
                className: "email-verify-code-change-email-link text-link",
                type: "button",
                onClick: function() {
                    M({
                        type: e.SET_ENTER_EMAIL_PAGE
                    }), Y(Z, U.btn.changeEmail, n)
                }
            }, k(S)))) : a().createElement("p", {
                className: "email-verify-code-help-text"
            }, r), a().createElement("input", {
                placeholder: k(h),
                onChange: function(t) {
                    return function(t) {
                        M({
                            type: e.SET_ERROR,
                            errorMessage: ""
                        });
                        var n = t.replace(/\D/g, "");
                        M({
                            type: e.SET_OTP_CODE,
                            code: n
                        })
                    }(t.target.value)
                },
                type: "text",
                inputMode: "numeric",
                maxLength: d,
                autoFocus: !0,
                className: "form-control input-field email-verify-code-input",
                value: u,
                disabled: L
            }), a().createElement("p", {
                className: "text-error email-verify-code-error-text"
            }, A), a().createElement((function() {
                return l ? a().createElement("div", {
                    className: "legal-checkbox-container"
                }, a().createElement($, {
                    id: "parent-consent",
                    legalText: l,
                    isChecked: x,
                    disabled: !g,
                    onCheckBoxChanged: ne
                })) : null
            }), null), a().createElement((function() {
                return l ? a().createElement(s.Button, {
                    className: "email-verify-code-button",
                    variant: s.Button.variants.primary,
                    onClick: y,
                    isDisabled: !p
                }, k(f)) : null
            }), null), a().createElement((function() {
                return L ? a().createElement(s.Loading, null) : a().createElement(s.Button, {
                    className: "email-verify-code-button",
                    variant: s.Button.variants.secondary,
                    onClick: te,
                    isDisabled: !N
                }, N ? k(E) : k(m) + " (" + F + ")")
            }), null), a().createElement((function() {
                return l ? null : a().createElement("div", {
                    className: "font-caption-header email-verify-code-help-link"
                }, a().createElement("a", {
                    className: "text-link",
                    href: "https://en.help.roblox.com/hc/articles/11014749736980",
                    target: "_blank",
                    rel: "noreferrer"
                }, k(T)))
            }), null)))
        }), {
            common: [],
            feature: "Authentication.OneTimePasscode"
        }),
        Q = CoreUtilities,
        Z = function(e, t, n, o) {
            return new(n || (n = Promise))((function(i, a) {
                function r(e) {
                    try {
                        c(o.next(e))
                    } catch (e) {
                        a(e)
                    }
                }

                function s(e) {
                    try {
                        c(o.throw(e))
                    } catch (e) {
                        a(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(r, s)
                }
                c((o = o.apply(e, t || [])).next())
            }))
        },
        ee = function(e, t) {
            var n, o, i, a, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return a = {
                next: s(0),
                throw: s(1),
                return: s(2)
            }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                return this
            }), a;

            function s(a) {
                return function(s) {
                    return function(a) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; r;) try {
                            if (n = 1, o && (i = 2 & a[0] ? o.return : a[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, a[1])).done) return i;
                            switch (o = 0, i && (a = [2 & a[0], i.value]), a[0]) {
                                case 0:
                                case 1:
                                    i = a;
                                    break;
                                case 4:
                                    return r.label++, {
                                        value: a[1],
                                        done: !1
                                    };
                                case 5:
                                    r.label++, o = a[1], a = [0];
                                    continue;
                                case 7:
                                    a = r.ops.pop(), r.trys.pop();
                                    continue;
                                default:
                                    if (!(i = r.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                        r = 0;
                                        continue
                                    }
                                    if (3 === a[0] && (!i || a[1] > i[0] && a[1] < i[3])) {
                                        r.label = a[1];
                                        break
                                    }
                                    if (6 === a[0] && r.label < i[1]) {
                                        r.label = i[1], i = a;
                                        break
                                    }
                                    if (i && r.label < i[2]) {
                                        r.label = i[2], r.ops.push(a);
                                        break
                                    }
                                    i[2] && r.ops.pop(), r.trys.pop();
                                    continue
                            }
                            a = t.call(e, r)
                        } catch (e) {
                            a = [6, e], o = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & a[0]) throw a[1];
                        return {
                            value: a[0] ? a[1] : void 0,
                            done: !0
                        }
                    }([a, s])
                }
            }
        },
        te = function(e) {
            return n.EnvironmentUrls.apiGatewayUrl + "/otp-service/v1/" + e
        },
        ne = function(e, t, n, o) {
            return new(n || (n = Promise))((function(i, a) {
                function r(e) {
                    try {
                        c(o.next(e))
                    } catch (e) {
                        a(e)
                    }
                }

                function s(e) {
                    try {
                        c(o.throw(e))
                    } catch (e) {
                        a(e)
                    }
                }

                function c(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(r, s)
                }
                c((o = o.apply(e, t || [])).next())
            }))
        },
        oe = function(e, t) {
            var n, o, i, a, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return a = {
                next: s(0),
                throw: s(1),
                return: s(2)
            }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                return this
            }), a;

            function s(a) {
                return function(s) {
                    return function(a) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; r;) try {
                            if (n = 1, o && (i = 2 & a[0] ? o.return : a[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, a[1])).done) return i;
                            switch (o = 0, i && (a = [2 & a[0], i.value]), a[0]) {
                                case 0:
                                case 1:
                                    i = a;
                                    break;
                                case 4:
                                    return r.label++, {
                                        value: a[1],
                                        done: !1
                                    };
                                case 5:
                                    r.label++, o = a[1], a = [0];
                                    continue;
                                case 7:
                                    a = r.ops.pop(), r.trys.pop();
                                    continue;
                                default:
                                    if (!(i = r.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                        r = 0;
                                        continue
                                    }
                                    if (3 === a[0] && (!i || a[1] > i[0] && a[1] < i[3])) {
                                        r.label = a[1];
                                        break
                                    }
                                    if (6 === a[0] && r.label < i[1]) {
                                        r.label = i[1], i = a;
                                        break
                                    }
                                    if (i && r.label < i[2]) {
                                        r.label = i[2], r.ops.push(a);
                                        break
                                    }
                                    i[2] && r.ops.pop(), r.trys.pop();
                                    continue
                            }
                            a = t.call(e, r)
                        } catch (e) {
                            a = [6, e], o = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & a[0]) throw a[1];
                        return {
                            value: a[0] ? a[1] : void 0,
                            done: !0
                        }
                    }([a, s])
                }
            }
        },
        ie = (0, c.withTranslations)((function(t) {
            t.containerId;
            var n = t.codeLength,
                o = t.onEmailCodeEntered,
                r = t.onComplete,
                d = t.onModalAbandoned,
                g = t.enterEmailTitle,
                p = t.enterEmailDescription,
                h = t.enterCodeTitle,
                m = t.enterCodeDescription,
                E = t.legalCheckboxLabel,
                f = t.origin,
                S = t.translate,
                C = t.isChangeEmailEnabled,
                T = void 0 !== C && C,
                A = t.renderInWebview,
                M = D(),
                R = M.state,
                N = R.emailVerifyCodeModalPage,
                I = R.email,
                B = R.sessionToken,
                F = R.code,
                V = R.isChecked,
                G = R.isCheckboxEnabled,
                W = R.isLoading,
                K = R.isCodeValid,
                z = R.errorMessage,
                q = R.isModalOpen,
                $ = R.isContinueButtonEnabled,
                ie = M.dispatch,
                ae = (0, c.useDebounce)(F, 200);
            (0, i.useEffect)((function() {
                o && !E && ae.length === n ? (le(), ie({
                    type: e.SET_LOADING,
                    isLoading: !0
                }), Y(U.context.enterOTP, U.btn.login, f)) : E && ie({
                    type: e.SET_CHECKBOX_AND_CONTINUE_BUTTON_STATE,
                    isContinueButtonEnabled: ae.length === n && V,
                    isCheckboxEnabled: ae.length === n
                })
            }), [ae, V]), (0, i.useEffect)((function() {
                E && r && K ? (ie({
                    type: e.CLOSE_MODAL
                }), j(U.context.enterOTP, U.aType.dismissed, f), Y(U.context.enterOTP, U.btn.signup, f), r({
                    otpSessionToken: B,
                    otpContactType: L
                })) : K && o && (ie({
                    type: e.CLOSE_MODAL
                }), o(B, ae))
            }), [K]), (0, i.useEffect)((function() {
                var t = function(t) {
                    if (t.detail) {
                        if (t.detail.shouldCloseModal) return void re();
                        ie({
                            type: e.SET_ERROR,
                            errorMessage: t.detail.errorMessage
                        })
                    }
                    ie({
                        type: e.SET_OTP_CODE,
                        code: ""
                    }), ie({
                        type: e.SET_LOADING,
                        isLoading: !1
                    })
                };
                return window.addEventListener("onEnterEmailVerifyCodeError", t),
                    function() {
                        window.removeEventListener("onEnterEmailVerifyCodeError", t)
                    }
            }), []), (0, i.useEffect)((function() {
                window.addEventListener("closeEmailVerifyCodeModal", re)
            }), []);
            var re = function() {
                    d(), ie({
                        type: e.CLOSE_MODAL
                    })
                },
                se = function(t, n) {
                    var o = t,
                        i = o.data,
                        a = o.status;
                    return ie({
                        type: e.SET_LOADING,
                        isLoading: !1
                    }), i === P ? (ie({
                        type: e.SET_ERROR,
                        errorMessage: S(y)
                    }), void H(n, String(i), f)) : i === _ ? (ie({
                        type: e.SET_ERROR,
                        errorMessage: S(v)
                    }), void H(n, String(i), f)) : i === w ? (ie({
                        type: e.SET_ERROR,
                        errorMessage: S(k)
                    }), void H(n, String(i), f)) : a === x ? (ie({
                        type: e.SET_ERROR,
                        errorMessage: S(y)
                    }), void H(n, String(a), f)) : i === O ? (H(n, String(i), f), void ce()) : (H(n, String(i), f), void ie({
                        type: e.SET_ERROR,
                        errorMessage: S(b)
                    }))
                },
                ce = function() {
                    return ne(void 0, void 0, void 0, (function() {
                        var t, n, o;
                        return oe(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return i.trys.push([0, 2, , 3]), [4, (a = {
                                        origin: f,
                                        contactType: L,
                                        contactValue: I
                                    }, Z(void 0, void 0, Promise, (function() {
                                        var e, t;
                                        return ee(this, (function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return e = te("sendCode"), t = {
                                                        url: e,
                                                        withCredentials: !0
                                                    }, [4, Q.httpService.post(t, a)];
                                                case 1:
                                                    return [2, n.sent().data]
                                            }
                                        }))
                                    })))];
                                case 1:
                                    return t = i.sent(), ie({
                                        type: e.SET_SESSION_TOKEN,
                                        sessionToken: null !== (o = null == t ? void 0 : t.otpSessionToken) && void 0 !== o ? o : ""
                                    }), ie({
                                        type: e.SET_ERROR,
                                        errorMessage: ""
                                    }), ie({
                                        type: e.SET_ENTER_CODE_PAGE
                                    }), [3, 3];
                                case 2:
                                    return n = i.sent(), se(n, U.context.sendOTP), [3, 3];
                                case 3:
                                    return [2]
                            }
                            var a
                        }))
                    }))
                },
                le = function() {
                    return ne(void 0, void 0, void 0, (function() {
                        var t;
                        return oe(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), [4, (o = {
                                        passCode: ae,
                                        otpSessionToken: B,
                                        contactType: L,
                                        origin: f
                                    }, Z(void 0, void 0, Promise, (function() {
                                        var e, t;
                                        return ee(this, (function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return e = te("validateCode"), t = {
                                                        url: e,
                                                        withCredentials: !0
                                                    }, [4, Q.httpService.post(t, o)];
                                                case 1:
                                                    return [2, n.sent().data]
                                            }
                                        }))
                                    })))];
                                case 1:
                                    return n.sent(), ie({
                                        type: e.SET_CODE_VALID,
                                        isCodeValid: !0
                                    }), [3, 3];
                                case 2:
                                    return t = n.sent(), se(t, U.context.validateOTP), [3, 3];
                                case 3:
                                    return [2]
                            }
                            var o
                        }))
                    }))
                };
            return a().createElement(s.Modal, {
                className: A ? "email-verify-code-webview" : "email-verify-code-modal",
                show: q,
                size: "lg",
                backdrop: "static",
                onHide: re
            }, a().createElement(i.Fragment, null, N === l && a().createElement(X, {
                origin: f,
                titleText: g,
                descriptionText: p,
                onSendCode: ce,
                errorMessage: z,
                onClose: re,
                translate: S
            }), N === u && B && a().createElement(J, {
                origin: f,
                titleText: h,
                descriptionText: m,
                legalCheckboxLabel: E,
                code: F,
                codeLength: n,
                onContinueButtonPressed: function() {
                    $ && (Y(U.context.enterOTP, U.btn.continue, f), le())
                },
                onResendCode: function() {
                    return ne(void 0, void 0, void 0, (function() {
                        var t, n, o;
                        return oe(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return i.trys.push([0, 2, , 3]), [4, (a = {
                                        contactType: L,
                                        origin: f,
                                        otpSessionToken: B
                                    }, Z(void 0, void 0, Promise, (function() {
                                        var e, t;
                                        return ee(this, (function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return e = te("resendCode"), t = {
                                                        url: e,
                                                        withCredentials: !0
                                                    }, [4, Q.httpService.post(t, a)];
                                                case 1:
                                                    return [2, n.sent().data]
                                            }
                                        }))
                                    })))];
                                case 1:
                                    return t = i.sent(), ie({
                                        type: e.SET_SESSION_TOKEN,
                                        sessionToken: null !== (o = null == t ? void 0 : t.otpSessionToken) && void 0 !== o ? o : ""
                                    }), ie({
                                        type: e.SET_ERROR,
                                        errorMessage: ""
                                    }), [3, 3];
                                case 2:
                                    return n = i.sent(), se(n, U.context.enterOTP), [3, 3];
                                case 3:
                                    return [2]
                            }
                            var a
                        }))
                    }))
                },
                isLoading: W,
                isContinueButtonEnabled: $,
                isCheckboxEnabled: G,
                isChecked: V,
                errorMessage: z,
                onClose: re,
                translate: S,
                isChangeEmailEnabled: T
            })))
        }), B),
        ae = function(e) {
            var t = e.containerId,
                n = e.codeLength,
                o = e.onEmailCodeEntered,
                i = e.onComplete,
                s = e.onModalAbandoned,
                c = e.enterEmailTitle,
                l = e.enterEmailDescription,
                u = e.enterCodeTitle,
                d = e.enterCodeDescription,
                g = e.legalCheckboxLabel,
                p = e.origin,
                h = e.translate,
                m = e.isChangeEmailEnabled,
                E = e.renderInWebview,
                f = document.getElementById(t);
            return null != f && ((0, r.unmountComponentAtNode)(f), (0, r.render)(a().createElement(I, null, a().createElement(ie, {
                containerId: t,
                codeLength: n,
                onEmailCodeEntered: o,
                onModalAbandoned: s,
                legalCheckboxLabel: g,
                onComplete: i,
                enterEmailTitle: c,
                enterEmailDescription: l,
                enterCodeTitle: u,
                enterCodeDescription: d,
                origin: p,
                translate: h,
                isChangeEmailEnabled: m,
                renderInWebview: E
            })), f), !0)
        },
        re = {
            renderEmailVerifyCodeModal: ae
        };
    Object.assign(o(), {
        EmailVerifyCodeModalService: re
    })
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/0cb8c046df74b206a31d3a9cb94ff29f-emailVerifyCodeModal.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("EmailVerifyCodeModal");