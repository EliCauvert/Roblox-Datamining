! function() {
    "use strict";
    var a = {
            742: function(e, t, a) {
                function r(e, t) {
                    for (var a = 0; a < t.length; a++) {
                        var n = t[a];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }
                a.d(t, {
                    A: function() {
                        return n
                    }
                });
                var n = function() {
                    function t() {
                        ! function(e) {
                            if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
                        }(this), this.timeStore = {}
                    }
                    var e, a, n;
                    return e = t, (a = [{
                        key: "start",
                        value: function(e) {
                            this.timeStore[e] = Date.now()
                        }
                    }, {
                        key: "end",
                        value: function(e) {
                            var t = this.timeStore[e];
                            return t ? (delete this.timeStore[e], (new Date).valueOf() - t) : null
                        }
                    }]) && r(e.prototype, a), n && r(e, n), t
                }()
            },
            434: function(e, t, a) {
                a.d(t, {
                    Gm: function() {
                        return p
                    },
                    lA: function() {
                        return s
                    },
                    uz: function() {
                        return c
                    },
                    yc: function() {
                        return o
                    }
                });
                var n = a(577),
                    t = a(669),
                    r = a.n(t),
                    n = null !== (n = n.EnvironmentUrls.apiGatewayUrl) && void 0 !== n ? n : "URL_NOT_FOUND",
                    i = "".concat(n, "/account-security-service"),
                    o = "event_captcha",
                    c = "solve_time_captcha",
                    s = "V1",
                    p = function(a) {
                        return new Promise(function(e, t) {
                            r().ajax({
                                method: "POST",
                                url: "".concat(i, "/v1/metrics/record"),
                                data: JSON.stringify(a),
                                contentType: "application/json",
                                timeout: 1e4,
                                success: e,
                                error: t,
                                withCredentials: !0
                            })
                        })
                    }
            },
            934: function(e, t, a) {
                a.d(t, {
                    IM: function() {
                        return w.A
                    },
                    aU: function() {
                        return T.A
                    }
                });
                var r, i, n, o, c, s, p, u, l, d, f, h, v, m, g, t = a(669),
                    y = a.n(t),
                    E = a(577),
                    T = a(746),
                    w = a(660),
                    b = (n = i = !(r = {
                        shownCb: function() {
                            {
                                var e;
                                n || (E.Hybrid && E.Hybrid.Navigation && E.Hybrid.Navigation.navigateToFeature({
                                    feature: w.A.hybridEvents.shown
                                }), null !== (e = document.getElementById(w.A.eventElementIds.shown)) && (e.value = w.A.hybridEvents.shown, e.dispatchEvent(o)), n = !0)
                            }
                        },
                        successCb: function(e, t) {
                            var a = null;
                            null != e && "" != e && (a = {
                                captchaId: t,
                                captchaToken: e,
                                captchaProvider: w.A.captchaProviders.arkoseLabs
                            });
                            E.Hybrid && E.Hybrid.Navigation && (null !== a ? E.Hybrid.Navigation.navigateToFeature({
                                feature: w.A.hybridEvents.success,
                                captchaData: a
                            }) : E.Hybrid.Navigation.navigateToFeature({
                                feature: w.A.hybridEvents.success
                            }));
                            e = document.getElementById(w.A.eventElementIds.token);
                            null != e && (null !== a && (e.value = JSON.stringify(a)), e.dispatchEvent(o))
                        },
                        errorCb: S,
                        returnTokenInSuccessCb: !1,
                        inputParams: {
                            dataExchange: "",
                            unifiedCaptchaId: ""
                        },
                        extraValidationParams: {}
                    }), (t = document.createEvent("HTMLEvents")).initEvent("change", !1, !1), o = t, c = null, new Promise(function(t, a) {
                        c && t(c), y().ajax({
                            method: "GET",
                            url: w.A.urls.getMetadata,
                            success: function(e) {
                                t(c = e)
                            },
                            error: function(e) {
                                a(e)
                            }
                        })
                    }).then(function(e) {
                        var t, a = e.funCaptchaPublicKeys,
                            n = [];
                        for (t in w.A.funCaptchaPublicKeyMap) {
                            if (!w.A.funCaptchaPublicKeyMap.hasOwnProperty(t)) return;
                            var r = w.A.funCaptchaPublicKeyMap[t];
                            r && a.hasOwnProperty(r) ? n.push({
                                Type: C(t),
                                ApiUrl: w.A.urls.funCaptchaRedeem[r],
                                PublicKey: a[r]
                            }) : console.warn("Missing public key for: ".concat(t, "\n\tpublicKeyType: ").concat(r))
                        }
                        console.debug("Add captcha types from new app:", n), T.A.addCaptchaTypes(n, !1), i = !0
                    }, function(e) {
                        console.debug("Failed to load captcha metadata for funCaptchaService. FunCaptcha will not work properly.")
                    }), {
                        triggerCaptcha: function() {
                            var e, t, a, n;
                            T.A ? (E.UrlParser && (e = E.UrlParser.getParameterValueByName("credentialstype", !1), t = E.UrlParser.getParameterValueByName("credentialsvalue", !1), null !== e && null !== t && (r.extraValidationParams.credentialsType = e, r.extraValidationParams.credentialsValue = t), r.returnTokenInSuccessCb = "1" === E.UrlParser.getParameterValueByName("hybrid-return-token", !1), null !== (t = E.UrlParser.getParameterValueByName("data-exchange-blob", !1)) && (r.inputParams.dataExchange = t), null !== (t = E.UrlParser.getParameterValueByName("hybrid-return-captcha-id", !1)) && (r.inputParams.unifiedCaptchaId = t)), a = new Date, n = setInterval(function() {
                                i ? (clearInterval(n), T.A.render(w.A.ids.appCaptcha, r)) : (new Date).getTime() - a.getTime() > w.A.metadataLoadParameters.timeoutMilliseconds && (clearInterval(n), S())
                            }, w.A.metadataLoadParameters.waitIntervalMilliseconds)) : S()
                        },
                        setCaptchaType: function(e) {
                            r.cType = C(e)
                        },
                        displayErrorMessage: S,
                        fetchLanguageResources: function(e) {
                            y().ajax({
                                method: "GET",
                                url: e,
                                dataType: "json",
                                data: w.A.translationRequestParams,
                                success: function(e) {
                                    y()("#".concat(w.A.messageElementIds.defaultError)).text(e["Response.CaptchaErrorFailedToVerify"])
                                }
                            })
                        },
                        captchaParams: r
                    });

                function S() {
                    y()("#".concat(w.A.messageElementIds.defaultError)).show()
                }

                function C(e) {
                    return e.charAt(0).toLowerCase() + e.slice(1)
                }

                function P() {
                    b.triggerCaptcha()
                }

                function A(e) {
                    return e.charAt(0).toUpperCase() + e.slice(1)
                }

                function _() {
                    return (new Date).valueOf()
                }

                function O(e) {
                    "function" == typeof h && h();
                    var t, a = null;
                    u && (a = _() - u, t = function(e) {
                        for (var t = g.captchaSolvedPrefix, a = g.captchaSolveTimeIntervals, n = 0; n < a.length; n++) {
                            var r = a[n];
                            if (e <= 1e3 * r.seconds) return t + r.suffix
                        }
                        return t + g.captchaSolveTimeLarge
                    }(t = a), window.EventTracker && window.EventTracker.fireEvent(A(l + t)), u = null), x(l, e, a)
                }

                function I(e, t, a) {
                    E.EventStream && (t = t || 0, a = a ? "true" : "false", E.EventStream.SendEventWithTarget("captcha", e, {
                        solveDuration: t,
                        success: a,
                        provider: "Google"
                    }, E.EventStream.TargetTypes.WWW))
                }

                function x(e, t, a) {
                    t = {
                        "g-Recaptcha-Response": t,
                        isInvisible: m.invisible
                    };
                    y().ajax({
                        method: "POST",
                        data: t,
                        success: function() {
                            window.EventTracker && window.EventTracker.fireEvent(A(e + g.successSuffix)), I(e, a, !0), d && (d(), y()("#" + s).empty())
                        },
                        error: function() {
                            window.EventTracker && window.EventTracker.fireEvent(A(e + g.failSuffix)), I(e, a, !1), f && f(), E.BootstrapWidgets && E.BootstrapWidgets.ToggleSystemMessage(y()(".alert-warning"), 100, 2e3, w.A.messages.error)
                        },
                        url: v[e]
                    })
                }
                v = w.A.endpoints, m = {
                    invisible: !1
                }, g = w.A.serviceData, t = {
                    ids: w.A.ids,
                    types: w.A.types,
                    setEndpoint: function(e, t) {
                        v[e] = t
                    },
                    getEndpoint: function(e) {
                        return v[e]
                    },
                    setInvisibleMode: function(e) {
                        m.invisible = e
                    },
                    getInvisibleMode: function() {
                        return m.invisible
                    },
                    setSiteKey: function(e) {
                        g.sitekey = e
                    },
                    verify: x,
                    reset: function(e, t, a, n) {
                        l = e, d = t, f = a, h = n, window.grecaptcha && (window.grecaptcha.reset(p), m.invisible && window.grecaptcha.execute(p))
                    },
                    render: function(e, t, a, n, r) {
                        l = t, d = a, f = n, h = r, s = e, window.grecaptcha && (r = {
                            sitekey: g.sitekey,
                            callback: O,
                            badge: g.badgePosition
                        }, m.invisible && (r.size = "invisible"), p = window.grecaptcha.render(e, r), window.EventTracker && window.EventTracker.fireEvent(A(l + g.displayedSuffix)), u = _())
                    },
                    execute: function() {
                        window.grecaptcha && m.invisible && window.grecaptcha.execute(p)
                    },
                    setMultipleEndpoints: function(e, t) {
                        if (e && t)
                            for (var a = 0; a < e.length; a++) {
                                var n = (n = e[a]).charAt(0).toLowerCase() + n.slice(1);
                                v[n] = t
                            }
                    }
                }, a = a(940);
                window.Roblox.triggerCaptcha = P, window.Roblox.Captcha = t, window.Roblox.AppCaptcha = b, window.Roblox.CaptchaLogger = a.A, window.Roblox.FunCaptcha = T.A, window.Roblox.CaptchaV2ServiceCaptchaIdBase = 0, window.Roblox.CaptchaConstants = w.A, window.triggerCaptcha = P
            },
            660: function(e, t, a) {
                var n = a(577);
                Roblox.EnvironmentUrls = Roblox.EnvironmentUrls || {};
                n = {
                    urls: {
                        getMetadata: "".concat(n.EnvironmentUrls.apiGatewayCdnUrl, "/captcha/v1/metadata"),
                        funCaptchaRedeem: {
                            WebSignup: "".concat(n.EnvironmentUrls.captchaApi, "/v1/funcaptcha/signup/web"),
                            AppSignup: "".concat(n.EnvironmentUrls.captchaApi, "/v1/funcaptcha/signup/app"),
                            WebLogin: "".concat(n.EnvironmentUrls.captchaApi, "/v1/funcaptcha/login/web"),
                            AppLogin: "".concat(n.EnvironmentUrls.captchaApi, "/v1/funcaptcha/login/app"),
                            WebResetPassword: "".concat(n.EnvironmentUrls.captchaApi, "/v1/funcaptcha/resetpassword/web"),
                            UserAction: "".concat(n.EnvironmentUrls.captchaApi, "/v1/funcaptcha/user"),
                            WebGamecardRedemption: "".concat(n.EnvironmentUrls.captchaApi, "/v1/funcaptcha/gamecardredemption/web")
                        }
                    },
                    funCaptchaPublicKeyMap: {
                        Login: "ACTION_TYPE_WEB_LOGIN",
                        AppLogin: "ACTION_TYPE_WEB_LOGIN",
                        Signup: "ACTION_TYPE_WEB_SIGNUP",
                        AppSignup: "ACTION_TYPE_WEB_SIGNUP",
                        JoinGroup: "ACTION_TYPE_GROUP_JOIN",
                        GroupWallPost: "ACTION_TYPE_GROUP_WALL_POST",
                        ResetPassword: "ACTION_TYPE_WEB_RESET_PASSWORD",
                        ToyCodeRedeem: "ACTION_TYPE_WEB_GAMECARD_REDEMPTION",
                        SupportRequest: "ACTION_TYPE_SUPPORT_REQUEST",
                        FollowUser: "ACTION_TYPE_FOLLOW_USER",
                        Generic: "ACTION_TYPE_GENERIC_CHALLENGE",
                        AssetComment: "ACTION_TYPE_ASSET_COMMENT",
                        Marketplace: "ACTION_TYPE_MARKETPLACE",
                        Passive: "ACTION_TYPE_PASSIVE"
                    },
                    endpoints: {
                        sendMessage: "",
                        addFriend: "",
                        follow: "",
                        signup: "",
                        joinGroup: "",
                        login: "",
                        postComment: "",
                        clothingUpload: "",
                        favorite: "",
                        appSignup: "",
                        appLogin: "",
                        resetPassword: ""
                    },
                    serviceData: {
                        sitekey: "",
                        successSuffix: "Captcha_Success",
                        failSuffix: "Captcha_Failed",
                        displayedSuffix: "Captcha_Displayed",
                        captchaSolvedPrefix: "Captcha_User_Solved_InSeconds_",
                        captchaSolveTimeIntervals: [{
                            seconds: 1,
                            suffix: "Less_Than_1"
                        }, {
                            seconds: 3,
                            suffix: "1_To_3"
                        }, {
                            seconds: 10,
                            suffix: "4_To_10"
                        }, {
                            seconds: 20,
                            suffix: "11_To_20"
                        }, {
                            seconds: 30,
                            suffix: "21_To_30"
                        }, {
                            seconds: 40,
                            suffix: "31_To_40"
                        }, {
                            seconds: 50,
                            suffix: "41_To_50"
                        }],
                        captchaSolveTimeLarge: "Greater_Than_50",
                        badgePosition: "bottomright",
                        logConstants: {
                            successSuffix: "_Success",
                            failSuffix: "_Failed",
                            maxFailSuffix: "_MaxFailed",
                            retrySuffix: "_Retried",
                            displayedSuffix: "_Displayed",
                            triggeredSuffix: "_Triggered",
                            initializedSuffix: "_Initialized",
                            suppressedSuffix: "_Suppressed",
                            providerErrorSuffix: "_FailedToLoad",
                            metadataErrorSuffix: "_FailedToLoadMetadata",
                            completedTimeSequenceSuffix: "_SolveTime",
                            solvedPrefix: "_User_Solved_InSeconds_",
                            solveTimeIntervals: [{
                                seconds: 1,
                                suffix: "Less_Than_1"
                            }, {
                                seconds: 3,
                                suffix: "1_To_3"
                            }, {
                                seconds: 10,
                                suffix: "4_To_10"
                            }, {
                                seconds: 20,
                                suffix: "11_To_20"
                            }, {
                                seconds: 30,
                                suffix: "21_To_30"
                            }, {
                                seconds: 40,
                                suffix: "31_To_40"
                            }, {
                                seconds: 50,
                                suffix: "41_To_50"
                            }],
                            solveTimeLarge: "Greater_Than_50",
                            eventStreamCaptchaEventName: "captcha",
                            eventStreamCaptchaInitiatedEventName: "captchaInitiated",
                            eventStreamCaptchaTokenReceivedEventName: "captchaTokenReceived",
                            captchaInitiatedChallengeTypes: {
                                visible: "visible",
                                hidden: "hidden",
                                error: "error"
                            }
                        }
                    },
                    types: {
                        signup: "signup",
                        sendMessage: "sendMessage",
                        addFriend: "addFriend",
                        follow: "follow",
                        joinGroup: "joinGroup",
                        login: "login",
                        postComment: "postComment",
                        clothingUpload: "clothingUpload",
                        favorite: "favorite",
                        appSignup: "appSignup",
                        appLogin: "appLogin",
                        gameCardRedeem: "gameCardRedeem",
                        resetPassword: "resetPassword"
                    },
                    ids: {
                        defaultCaptcha: "captcha-container",
                        signup: "signup-captcha",
                        login: "login-captcha",
                        friends: "friends-captcha",
                        groups: "groups-captcha",
                        profile: "profile-captcha",
                        playerSearch: "player-search-captcha",
                        appCaptcha: "app-captcha",
                        gameCardRedeem: "game-card-redeem-captcha",
                        resetPassword: "reset-password-captcha"
                    },
                    messageElementIds: {
                        defaultError: "captcha-error"
                    },
                    eventElementIds: {
                        shown: "captcha-event-shown",
                        token: "captcha-event-token",
                        provider: "captcha-event-provider"
                    },
                    hybridEvents: {
                        shown: "CaptchaShown",
                        success: "CaptchaSuccess"
                    },
                    messages: {
                        error: "We currently cannot verify CAPTCHA, please try again later.",
                        funCaptchaError: "We currently cannot verify FunCaptcha, please try again later."
                    },
                    translationRequestParams: {
                        consumerType: "Web",
                        contentNamespace: "Common.Captcha",
                        Keys: ["Response.CaptchaErrorFailedToVerify"]
                    },
                    errorCodes: {
                        failedToLoadProviderScript: 0,
                        failedToVerify: 1
                    },
                    localeToFunCaptchaLanguageCodeMap: {
                        "de-de": "de",
                        "en-us": "en",
                        "es-es": "es",
                        "fr-fr": "fr",
                        "pt-br": "pt-br",
                        "ko-kr": "ko",
                        "zh-cn": "zh",
                        "zh-tw": "zh-tw",
                        "ja-jp": "ja"
                    },
                    appTypes: {
                        android: "android",
                        ios: "ios",
                        xbox: "xbox",
                        uwp: "uwp",
                        "studio-windows": "studio-windows",
                        "studio-mac": "studio-mac",
                        "studio-luobu-windows": "studio-luobu-windows",
                        "studio-luobu-mac": "studio-luobu-mac",
                        unknown: "unknown"
                    },
                    captchaProviders: {
                        arkoseLabs: "PROVIDER_ARKOSE_LABS"
                    },
                    metadataLoadParameters: {
                        timeoutMilliseconds: 1e4,
                        waitIntervalMilliseconds: 100
                    }
                };
                t.A = n
            },
            940: function(e, t, a) {
                var n = a(669),
                    s = a.n(n),
                    p = a(577),
                    u = a(742),
                    l = a(434),
                    d = a(660);
                t.A = function(e) {
                    var r, i = d.A,
                        o = s().extend({}, i.serviceData).logConstants,
                        c = !1;

                    function a(e) {
                        return c && void 0 !== r ? "".concat(e, "_").concat(r) : e
                    }

                    function n(e) {
                        return e.charAt(0).toUpperCase() + e.slice(1)
                    }
                    this.provider = e, this.eventTimer = new u.A, this.setPerAppTypeLoggingEnabled = function(e) {
                        var t, a = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : void 0,
                            n = null;
                        void 0 === a ? (p.UrlParser && (t = p.UrlParser.getParameterValueByName("appType"), i && i.appTypes && i.appTypes.hasOwnProperty(t) && (n = t)), null == n && p.DeviceMeta && (0, p.DeviceMeta)().isInApp && (n = (0, p.DeviceMeta)().appType), null !== n && (c = e, r = n)) : r = a
                    }, this.fireEventCaptcha = function(e, t) {
                        (0, l.Gm)({
                            name: l.yc,
                            value: 1,
                            labelValues: {
                                action_type: n(e),
                                event_type: n(this.provider + t),
                                application_type: r || "unknown",
                                version: l.lA
                            }
                        }).catch(function() {})
                    }, this.fireSolveTimeCaptcha = function(e, t, a) {
                        (0, l.Gm)({
                            name: l.uz,
                            value: a,
                            labelValues: {
                                action_type: n(e),
                                event_type: n(this.provider + t),
                                application_type: r || "unknown",
                                version: l.lA
                            }
                        }).catch(function() {})
                    }, this.fireEvent = function(e, t) {
                        this.fireEventCaptcha(e, t), t = n(e + this.provider + t), window.EventTracker && window.EventTracker.fireEvent(a(t))
                    }, this.startStatisticsSequence = function(e) {
                        this.eventTimer.start(e), window.EventTracker && window.EventTracker.start(a(e))
                    }, this.endStatisticsSequenceWithSuccess = function(e) {
                        window.EventTracker && window.EventTracker.endSuccess(a(e))
                    }, this.endStatisticsSequenceWithFailure = function(e) {
                        window.EventTracker && window.EventTracker.endFailure(a(e))
                    }, this.logSuccess = function(e) {
                        var t = n(e + this.provider + o.completedTimeSequenceSuffix);
                        this.fireEvent(e, o.successSuffix), this.fireSolveTimeCaptcha(e, o.successSuffix, this.eventTimer.end(t)), this.endStatisticsSequenceWithSuccess(t)
                    }, this.logFail = function(e) {
                        this.fireEvent(e, o.failSuffix)
                    }, this.logMaxFail = function(e) {
                        var t = n(e + this.provider + o.completedTimeSequenceSuffix);
                        this.fireEvent(e, o.maxFailSuffix), this.fireSolveTimeCaptcha(e, o.completedTimeSequenceSuffix, this.eventTimer.end(t)), this.endStatisticsSequenceWithFailure(t)
                    }, this.logRetried = function(e) {
                        this.fireEvent(e, o.retrySuffix)
                    }, this.logTriggered = function(e) {
                        this.fireEvent(e, o.triggeredSuffix), this.startStatisticsSequence(n(e + this.provider + o.completedTimeSequenceSuffix))
                    }, this.logInitialized = function(e) {
                        this.fireEvent(e, o.initializedSuffix)
                    }, this.logSuppressed = function(e) {
                        this.fireEvent(e, o.suppressedSuffix)
                    }, this.logDisplayed = function(e) {
                        this.fireEvent(e, o.displayedSuffix)
                    }, this.logProviderError = function(e) {
                        this.fireEvent(e, o.providerErrorSuffix)
                    }, this.logMetadataError = function(e) {
                        this.fireEvent(e, o.metadataErrorSuffix)
                    }, this.logCaptchaShownEventToEventStream = function(e, t, a) {
                        this.logCaptchaInitiatedEventToEventStream(e, o.captchaInitiatedChallengeTypes.visible, t, a)
                    }, this.logCaptchaSuppressedEventToEventStream = function(e, t, a) {
                        this.logCaptchaInitiatedEventToEventStream(e, o.captchaInitiatedChallengeTypes.hidden, t, a)
                    }, this.logCaptchaErrorEventToEventStream = function(e, t, a, n) {
                        this.logCaptchaInitiatedEventToEventStream(e, o.captchaInitiatedChallengeTypes.error, t, a, n.toString())
                    }, this.logCaptchaInitiatedEventToEventStream = function(e, t, a, n, r) {
                        p.EventStream && (e = e, t = {
                            type: t,
                            provider: this.provider
                        }, "" !== a && void 0 !== a && (t.session = a), "" !== n && void 0 !== n && (t.ucid = n), "" !== r && void 0 !== r && (t.message = r), p.EventStream.SendEventWithTarget(o.eventStreamCaptchaInitiatedEventName, e, t, p.EventStream.TargetTypes.WWW))
                    }, this.logCaptchaTokenReceivedEventToEventStream = function(e, t, a) {
                        p.EventStream && p.EventStream.SendEventWithTarget(o.eventStreamCaptchaTokenReceivedEventName, e, {
                            provider: this.provider,
                            session: t,
                            ucid: a || ""
                        }, p.EventStream.TargetTypes.WWW)
                    }, this.logCaptchaEventToEventStream = function(e, t, a, n, r) {
                        p.EventStream && (t = t || 0, a = a ? "true" : "false", p.EventStream.SendEventWithTarget(o.eventStreamCaptchaEventName, e, {
                            solveDuration: t,
                            success: a,
                            provider: this.provider,
                            session: n || "",
                            ucid: r || ""
                        }, p.EventStream.TargetTypes.WWW))
                    }
                }
            },
            746: function(e, t, a) {
                var n = a(669),
                    s = a.n(n),
                    p = a(577),
                    u = a(660),
                    l = a(940),
                    a = function() {
                        var n = [],
                            a = (s().extend({}, u.A.messages), new l.A("FunCaptcha")),
                            r = {},
                            e = "",
                            t = {};
                        s().noop, s().noop, s().noop, s().noop, s().noop, s().noop;

                        function i(e) {
                            t[e] && t[e].fcInstance.refresh_session()
                        }

                        function o(e, t) {
                            throw new Error("CAPI V1 is deprecated")
                        }

                        function c() {
                            var e = s()("#game-card-redeem-captcha").addClass("hidden").detach();
                            s()("#redeem-card-wrapper").append(e), p.Dialog.close()
                        }
                        return {
                            types: s().extend({}, u.A.types),
                            setMaxRetriesOnTokenValidationFailure: function(e) {
                                0
                            },
                            setRetryIntervalRange: function(e, t) {
                                0
                            },
                            reset: i,
                            render: o,
                            addCaptchaTypes: function(e, a) {
                                e && e.forEach(function(e) {
                                    var t, t = {
                                            Type: a ? (t = e.Type).charAt(0).toLowerCase() + t.slice(1) : e.Type,
                                            ApiUrl: e.ApiUrl,
                                            PublicKey: e.PublicKey
                                        },
                                        e = JSON.stringify(t);
                                    r.hasOwnProperty(e) || (r[e] = t, n.push(t))
                                })
                            },
                            setPerAppTypeLoggingEnabled: function(e, t) {
                                t = 1 < arguments.length && void 0 !== t ? t : void 0;
                                a.setPerAppTypeLoggingEnabled(e, t)
                            },
                            showFunCaptchaInModal: function() {
                                p.Dialog.open({
                                    bodyContent: '<div id="funcaptcha-modal-body" class="funcaptcha-modal-body"></div>',
                                    allowHtmlContentInBody: !0,
                                    showAccept: !1,
                                    showDecline: !1,
                                    xToCancel: !0,
                                    onCloseCallback: c
                                });
                                var e = s()("#game-card-redeem-captcha").removeClass("hidden").detach();
                                s()("#funcaptcha-modal-body").append(e)
                            },
                            dismissFunCaptchaModal: c,
                            captchaInstances: t,
                            loggerInstance: a
                        }
                    }();
                t.A = a
            },
            577: function(e) {
                e.exports = Roblox
            },
            669: function(e) {
                e.exports = jQuery
            }
        },
        n = {};

    function r(e) {
        var t = n[e];
        if (void 0 !== t) return t.exports;
        t = n[e] = {
            exports: {}
        };
        return a[e](t, t.exports, r), t.exports
    }

    function l() {
        throw new Error("CAPI V1 is deprecated")
    }
    r.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return r.d(t, {
            a: t
        }), t
    }, r.d = function(e, t) {
        for (var a in t) r.o(t, a) && !r.o(e, a) && Object.defineProperty(e, a, {
            enumerable: !0,
            get: t[a]
        })
    }, r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    };
    var i = CoreUtilities,
        d = React,
        f = r.n(d),
        t = ReactDOM,
        e = r(577),
        o = r.n(e),
        c = PropTypes,
        c = r.n(c),
        h = {
            urls: {
                getMetadata: "".concat(e.EnvironmentUrls.apiGatewayCdnUrl, "/captcha/v1/metadata"),
                funCaptchaRedeem: {
                    WebSignup: "".concat(e.EnvironmentUrls.captchaApi, "/v1/funcaptcha/signup/web"),
                    AppSignup: "".concat(e.EnvironmentUrls.captchaApi, "/v1/funcaptcha/signup/app"),
                    WebLogin: "".concat(e.EnvironmentUrls.captchaApi, "/v1/funcaptcha/login/web"),
                    AppLogin: "".concat(e.EnvironmentUrls.captchaApi, "/v1/funcaptcha/login/app"),
                    WebResetPassword: "".concat(e.EnvironmentUrls.captchaApi, "/v1/funcaptcha/resetpassword/web"),
                    UserAction: "".concat(e.EnvironmentUrls.captchaApi, "/v1/funcaptcha/user"),
                    WebGamecardRedemption: "".concat(e.EnvironmentUrls.captchaApi, "/v1/funcaptcha/gamecardredemption/web")
                }
            },
            captchaActionTypes: {
                login: "login",
                appLogin: "appLogin",
                signup: "signup",
                appSignup: "appSignup",
                groupJoin: "groupJoin",
                groupWallPost: "groupWallPost",
                resetPassword: "resetPassword",
                toyCodeRedeem: "toyCodeRedeem",
                gameCardRedeem: "gameCardRedeem",
                followUser: "followUser"
            },
            funCaptchaCaptchaTypes: {
                login: "Login",
                appLogin: "AppLogin",
                signup: "Signup",
                appSignup: "AppSignup",
                groupJoin: "JoinGroup",
                groupWallPost: "GroupWallPost",
                resetPassword: "ResetPassword",
                toyCodeRedeem: "ToyCodeRedeem",
                gameCardRedeem: "GameCardRedeem",
                followUser: "FollowUser"
            },
            funCaptchaPublicKeyMap: {
                Login: "ACTION_TYPE_WEB_LOGIN",
                AppLogin: "ACTION_TYPE_WEB_LOGIN",
                Signup: "ACTION_TYPE_WEB_SIGNUP",
                AppSignup: "ACTION_TYPE_WEB_SIGNUP",
                JoinGroup: "ACTION_TYPE_GROUP_JOIN",
                GroupWallPost: "ACTION_TYPE_GROUP_WALL_POST",
                ResetPassword: "ACTION_TYPE_WEB_RESET_PASSWORD",
                ToyCodeRedeem: "ACTION_TYPE_WEB_GAMECARD_REDEMPTION",
                GameCardRedeem: "ACTION_TYPE_WEB_GAMECARD_REDEMPTION",
                FollowUser: "ACTION_TYPE_FOLLOW_USER",
                AssetComment: "ACTION_TYPE_ASSET_COMMENT"
            },
            funCaptchaEvents: {
                resolve: "resolve",
                reject: "reject",
                shown: "shown"
            },
            captchaProviders: {
                arkoseLabs: "PROVIDER_ARKOSE_LABS"
            },
            errorCodes: {
                internal: {
                    unknown: 0,
                    missingPrivateKey: 1,
                    missingActionType: 2,
                    failedToLoadProviderScript: 3,
                    failedToVerify: 4
                }
            },
            literals: {
                close: "Close"
            }
        },
        s = r(934),
        v = {
            id: 0
        },
        p = null;

    function u(t, e) {
        var a, n = Object.keys(t);
        return Object.getOwnPropertySymbols && (a = Object.getOwnPropertySymbols(t), e && (a = a.filter(function(e) {
            return Object.getOwnPropertyDescriptor(t, e).enumerable
        })), n.push.apply(n, a)), n
    }

    function m(n) {
        for (var e = 1; e < arguments.length; e++) {
            var r = null != arguments[e] ? arguments[e] : {};
            e % 2 ? u(Object(r), !0).forEach(function(e) {
                var t, a;
                t = n, e = r[a = e], a in t ? Object.defineProperty(t, a, {
                    value: e,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[a] = e
            }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : u(Object(r)).forEach(function(e) {
                Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
            })
        }
        return n
    }

    function g(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
            var a = [],
                n = !0,
                r = !1,
                i = void 0;
            try {
                for (var o, c = e[Symbol.iterator](); !(n = (o = c.next()).done) && (a.push(o.value), !t || a.length !== t); n = !0);
            } catch (e) {
                r = !0, i = e
            } finally {
                try {
                    n || null == c.return || c.return()
                } finally {
                    if (r) throw i
                }
            }
            return a
        }(e, t) || function(e, t) {
            if (!e) return;
            if ("string" == typeof e) return y(e, t);
            var a = Object.prototype.toString.call(e).slice(8, -1);
            "Object" === a && e.constructor && (a = e.constructor.name);
            if ("Map" === a || "Set" === a) return Array.from(e);
            if ("Arguments" === a || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(a)) return y(e, t)
        }(e, t) || function() {
            throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function y(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var a = 0, n = new Array(t); a < t; a++) n[a] = e[a];
        return n
    }
    new Promise(function(t, e) {
        p && t(p);
        var a = {
            url: h.urls.getMetadata
        };
        i.httpService.get(a).then(function(e) {
            t(p = e)
        }, e)
    }).then(function(e) {
        var a = e.data.funCaptchaPublicKeys,
            n = [];
        Object.keys(h.funCaptchaPublicKeyMap).forEach(function(e) {
            var t = h.funCaptchaPublicKeyMap[e];
            t && Object.prototype.hasOwnProperty.call(a, t) ? n.push({
                Type: e,
                ApiUrl: h.urls.funCaptchaRedeem[t],
                PublicKey: a[t]
            }) : console.warn("Missing public key for: ".concat(e, "\n\tpublicKeyType: ").concat(t))
        }), console.debug("Add captcha types from new webapp:", n), s.aU.addCaptchaTypes(n, !1)
    }, function() {
        console.debug("Failed to load captcha metadata for funCaptchaService. FunCaptcha will not work properly.")
    });
    var E = !1,
        T = !1;

    function w(e) {
        function t() {
            p(m(m({}, s), {}, {
                shown: !1
            })), T = !1, c()
        }
        var a = e.captchaActivated,
            n = (e.captchaActionType, e.captchaError),
            r = e.captchaSuccess,
            i = e.captchaReturnTokenInSuccessCb,
            o = (e.inputParams, e.captchaDismissed),
            c = (e.extraValidationParams, e.endCaptcha),
            e = g((0, d.useState)({
                id: null,
                shown: null
            }), 2),
            s = e[0],
            p = e[1],
            e = function() {
                c(), o && o()
            };
        (0, d.useEffect)(function() {
            var e;
            null === s.id && p(m(m({}, s), {}, {
                id: (v.id += 1, "captchaV2-".concat(v.id))
            })), E !== a && (E = a) && !T && (e = (T = !0) === i ? function(e) {
                a && (e = {
                    captchaId: e.captchaId,
                    captchaToken: e.token,
                    captchaProvider: h.captchaProviders.arkoseLabs
                }, r(e)), t()
            } : function() {
                a && r(), t()
            }, l(s.id).then(e, function(e) {
                a && n(e), t()
            }))
        }, [a]);
        var u;
        return f().createElement("div", {
            role: "button",
            tabIndex: "0",
            className: (u = "captcha-container modal", s.shown && a ? [u, "captcha-activated"].join(" ") : u),
            onClick: e
        }, f().createElement("div", {
            className: "modal-dialog"
        }, f().createElement("div", {
            className: "modal-content"
        }, f().createElement("div", {
            role: "link",
            tabIndex: -1,
            className: "modal-body",
            onClick: function(e) {
                return e.stopPropagation()
            }
        }, f().createElement("button", {
            type: "button",
            className: "close",
            onClick: e
        }, f().createElement("span", {
            "aria-hidden": "true"
        }, f().createElement("span", {
            className: "icon-close"
        })), f().createElement("span", {
            className: "sr-only"
        }, h.literals.close)), f().createElement("div", {
            id: s.id,
            className: "captchav2-funcaptcha-modal-body"
        })))))
    }
    w.propTypes = {
        captchaActionType: c().string.isRequired,
        captchaActivated: c().bool.isRequired,
        captchaError: c().func.isRequired,
        captchaSuccess: c().func.isRequired,
        captchaReturnTokenInSuccessCb: c().bool.isRequired,
        inputParams: c().shape({
            dataExchange: c().string,
            unifiedCaptchaId: c().string
        }).isRequired,
        captchaDismissed: c().func.isRequired,
        extraValidationParams: c().func.isRequired,
        endCaptcha: c().func.isRequired
    };
    var b = w;

    function S(t, e) {
        var a, n = Object.keys(t);
        return Object.getOwnPropertySymbols && (a = Object.getOwnPropertySymbols(t), e && (a = a.filter(function(e) {
            return Object.getOwnPropertyDescriptor(t, e).enumerable
        })), n.push.apply(n, a)), n
    }

    function C(n) {
        for (var e = 1; e < arguments.length; e++) {
            var r = null != arguments[e] ? arguments[e] : {};
            e % 2 ? S(Object(r), !0).forEach(function(e) {
                var t, a;
                t = n, e = r[a = e], a in t ? Object.defineProperty(t, a, {
                    value: e,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[a] = e
            }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : S(Object(r)).forEach(function(e) {
                Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
            })
        }
        return n
    }

    function P(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
            var a = [],
                n = !0,
                r = !1,
                i = void 0;
            try {
                for (var o, c = e[Symbol.iterator](); !(n = (o = c.next()).done) && (a.push(o.value), !t || a.length !== t); n = !0);
            } catch (e) {
                r = !0, i = e
            } finally {
                try {
                    n || null == c.return || c.return()
                } finally {
                    if (r) throw i
                }
            }
            return a
        }(e, t) || function(e, t) {
            if (!e) return;
            if ("string" == typeof e) return A(e, t);
            var a = Object.prototype.toString.call(e).slice(8, -1);
            "Object" === a && e.constructor && (a = e.constructor.name);
            if ("Map" === a || "Set" === a) return Array.from(e);
            if ("Arguments" === a || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(a)) return A(e, t)
        }(e, t) || function() {
            throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function A(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var a = 0, n = new Array(t); a < t; a++) n[a] = e[a];
        return n
    }

    function _() {
        var e = P((0, d.useState)({
                captchaActionType: null,
                captchaActivated: null,
                captchaError: null,
                captchaSuccess: null,
                captchaReturnTokenInSuccessCb: null,
                inputParams: {},
                captchaDismissed: null,
                endCaptcha: null
            }), 2),
            t = e[0],
            a = e[1];
        return window.addEventListener("UpdateCaptchaWidget", function(e) {
            a(C(C({}, t), e.detail))
        }, !1), f().createElement(b, {
            captchaActionType: t.captchaActionType,
            captchaActivated: t.captchaActivated,
            captchaError: t.captchaError,
            captchaSuccess: t.captchaSuccess,
            captchaReturnTokenInSuccessCb: t.captchaReturnTokenInSuccessCb,
            inputParams: t.inputParams,
            captchaDismissed: t.captchaDismissed,
            endCaptcha: t.endCaptcha
        })
    }
    var O = function() {
            return f().createElement(_, null)
        },
        I = "react-captcha-container";

    function x() {
        var e = document.getElementById(I);
        e ? (0, t.render)(f().createElement(O, null), e) : window.requestAnimationFrame(x)
    }
    o().CaptchaService = {
        openCaptcha: function(e) {
            var t = new CustomEvent("UpdateCaptchaWidget", {
                detail: e
            });
            return Object.prototype.hasOwnProperty.call(e, "captchaActionType") && Object.prototype.hasOwnProperty.call(e, "captchaActivated") && Object.prototype.hasOwnProperty.call(e, "captchaError") && Object.prototype.hasOwnProperty.call(e, "captchaSuccess") && Object.prototype.hasOwnProperty.call(e, "captchaReturnTokenInSuccessCb") && Object.prototype.hasOwnProperty.call(e, "inputParams") ? (window.dispatchEvent(t), !0) : (console.debug("Failed to render captcha. Missing properties."), !1)
        }
    }, (0, i.ready)(function() {
        I && x()
    })
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/0337af3800b649c5e2766ce04035fe7e-reactCaptcha.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ReactCaptcha");