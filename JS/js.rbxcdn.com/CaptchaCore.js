! function() {
    "use strict";
    var a = {
            n: function(e) {
                var t = e && e.__esModule ? function() {
                    return e.default
                } : function() {
                    return e
                };
                return a.d(t, {
                    a: t
                }), t
            },
            d: function(e, t) {
                for (var n in t) a.o(t, n) && !a.o(e, n) && Object.defineProperty(e, n, {
                    enumerable: !0,
                    get: t[n]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        e = jQuery,
        c = a.n(e),
        p = Roblox;
    Roblox.EnvironmentUrls = Roblox.EnvironmentUrls || {};
    var o, r, s, d, u, l, f, i, v, h, T = {
        urls: {
            getMetadata: "".concat(p.EnvironmentUrls.apiGatewayCdnUrl, "/captcha/v1/metadata"),
            funCaptchaRedeem: {
                WebSignup: "".concat(p.EnvironmentUrls.captchaApi, "/v1/funcaptcha/signup/web"),
                AppSignup: "".concat(p.EnvironmentUrls.captchaApi, "/v1/funcaptcha/signup/app"),
                WebLogin: "".concat(p.EnvironmentUrls.captchaApi, "/v1/funcaptcha/login/web"),
                AppLogin: "".concat(p.EnvironmentUrls.captchaApi, "/v1/funcaptcha/login/app"),
                WebResetPassword: "".concat(p.EnvironmentUrls.captchaApi, "/v1/funcaptcha/resetpassword/web"),
                UserAction: "".concat(p.EnvironmentUrls.captchaApi, "/v1/funcaptcha/user"),
                WebGamecardRedemption: "".concat(p.EnvironmentUrls.captchaApi, "/v1/funcaptcha/gamecardredemption/web")
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

    function E(e) {
        return e.charAt(0).toUpperCase() + e.slice(1)
    }

    function g() {
        return (new Date).valueOf()
    }

    function m(e) {
        "function" == typeof f && f();
        var t, n = null;
        s && (n = g() - s, t = function(e) {
            for (var t = h.captchaSolvedPrefix, n = h.captchaSolveTimeIntervals, a = 0; a < n.length; a++) {
                var i = n[a];
                if (e <= 1e3 * i.seconds) return t + i.suffix
            }
            return t + h.captchaSolveTimeLarge
        }(t = n), window.EventTracker && window.EventTracker.fireEvent(E(d + t)), s = null), w(d, e, n)
    }

    function S(e, t, n) {
        p.EventStream && (t = t || 0, n = n ? "true" : "false", p.EventStream.SendEventWithTarget("captcha", e, {
            solveDuration: t,
            success: n,
            provider: "Google"
        }, p.EventStream.TargetTypes.WWW))
    }

    function w(e, t, n) {
        t = {
            "g-Recaptcha-Response": t,
            isInvisible: v.invisible
        };
        c().ajax({
            method: "POST",
            data: t,
            success: function() {
                window.EventTracker && window.EventTracker.fireEvent(E(e + h.successSuffix)), S(e, n, !0), u && (u(), c()("#" + o).empty())
            },
            error: function() {
                window.EventTracker && window.EventTracker.fireEvent(E(e + h.failSuffix)), S(e, n, !1), l && l(), p.BootstrapWidgets && p.BootstrapWidgets.ToggleSystemMessage(c()(".alert-warning"), 100, 2e3, T.messages.error)
            },
            url: i[e]
        })
    }
    var t = (i = T.endpoints, v = {
        invisible: !1
    }, h = T.serviceData, {
        ids: T.ids,
        types: T.types,
        setEndpoint: function(e, t) {
            i[e] = t
        },
        getEndpoint: function(e) {
            return i[e]
        },
        setInvisibleMode: function(e) {
            v.invisible = e
        },
        getInvisibleMode: function() {
            return v.invisible
        },
        setSiteKey: function(e) {
            h.sitekey = e
        },
        verify: w,
        reset: function(e, t, n, a) {
            d = e, u = t, l = n, f = a, window.grecaptcha && (window.grecaptcha.reset(r), v.invisible && window.grecaptcha.execute(r))
        },
        render: function(e, t, n, a, i) {
            d = t, u = n, l = a, f = i, o = e, window.grecaptcha && (i = {
                sitekey: h.sitekey,
                callback: m,
                badge: h.badgePosition
            }, v.invisible && (i.size = "invisible"), r = window.grecaptcha.render(e, i), window.EventTracker && window.EventTracker.fireEvent(E(d + h.displayedSuffix)), s = g())
        },
        execute: function() {
            window.grecaptcha && v.invisible && window.grecaptcha.execute(r)
        },
        setMultipleEndpoints: function(e, t) {
            if (e && t)
                for (var n = 0; n < e.length; n++) {
                    var a = (a = e[n]).charAt(0).toLowerCase() + a.slice(1);
                    i[a] = t
                }
        }
    });

    function _(e, t) {
        for (var n = 0; n < t.length; n++) {
            var a = t[n];
            a.enumerable = a.enumerable || !1, a.configurable = !0, "value" in a && (a.writable = !0), Object.defineProperty(e, a.key, a)
        }
    }

    function C(n) {
        return new Promise(function(e, t) {
            c().ajax({
                method: "POST",
                url: "".concat(x, "/v1/metrics/record"),
                data: JSON.stringify(n),
                contentType: "application/json",
                timeout: 1e4,
                success: e,
                error: t,
                withCredentials: !0
            })
        })
    }
    var y = function() {
            function t() {
                ! function(e) {
                    if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
                }(this), this.timeStore = {}
            }
            var e, n, a;
            return e = t, (n = [{
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
            }]) && _(e.prototype, n), a && _(e, a), t
        }(),
        e = null !== (e = p.EnvironmentUrls.apiGatewayUrl) && void 0 !== e ? e : "URL_NOT_FOUND",
        x = "".concat(e, "/account-security-service"),
        b = function(e) {
            var i, o = T,
                r = c().extend({}, o.serviceData).logConstants,
                s = !1;

            function n(e) {
                return s && void 0 !== i ? "".concat(e, "_").concat(i) : e
            }

            function a(e) {
                return e.charAt(0).toUpperCase() + e.slice(1)
            }
            this.provider = e, this.eventTimer = new y, this.setPerAppTypeLoggingEnabled = function(e) {
                var t, n = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : void 0,
                    a = null;
                void 0 === n ? (p.UrlParser && (t = p.UrlParser.getParameterValueByName("appType"), o && o.appTypes && o.appTypes.hasOwnProperty(t) && (a = t)), null == a && p.DeviceMeta && (0, p.DeviceMeta)().isInApp && (a = (0, p.DeviceMeta)().appType), null !== a && (s = e, i = a)) : i = n
            }, this.fireEventCaptcha = function(e, t) {
                C({
                    name: "event_captcha",
                    value: 1,
                    labelValues: {
                        action_type: a(e),
                        event_type: a(this.provider + t),
                        application_type: i || "unknown",
                        version: "V1"
                    }
                }).catch(function() {})
            }, this.fireSolveTimeCaptcha = function(e, t, n) {
                C({
                    name: "solve_time_captcha",
                    value: n,
                    labelValues: {
                        action_type: a(e),
                        event_type: a(this.provider + t),
                        application_type: i || "unknown",
                        version: "V1"
                    }
                }).catch(function() {})
            }, this.fireEvent = function(e, t) {
                this.fireEventCaptcha(e, t), t = a(e + this.provider + t), window.EventTracker && window.EventTracker.fireEvent(n(t))
            }, this.startStatisticsSequence = function(e) {
                this.eventTimer.start(e), window.EventTracker && window.EventTracker.start(n(e))
            }, this.endStatisticsSequenceWithSuccess = function(e) {
                window.EventTracker && window.EventTracker.endSuccess(n(e))
            }, this.endStatisticsSequenceWithFailure = function(e) {
                window.EventTracker && window.EventTracker.endFailure(n(e))
            }, this.logSuccess = function(e) {
                var t = a(e + this.provider + r.completedTimeSequenceSuffix);
                this.fireEvent(e, r.successSuffix), this.fireSolveTimeCaptcha(e, r.successSuffix, this.eventTimer.end(t)), this.endStatisticsSequenceWithSuccess(t)
            }, this.logFail = function(e) {
                this.fireEvent(e, r.failSuffix)
            }, this.logMaxFail = function(e) {
                var t = a(e + this.provider + r.completedTimeSequenceSuffix);
                this.fireEvent(e, r.maxFailSuffix), this.fireSolveTimeCaptcha(e, r.completedTimeSequenceSuffix, this.eventTimer.end(t)), this.endStatisticsSequenceWithFailure(t)
            }, this.logRetried = function(e) {
                this.fireEvent(e, r.retrySuffix)
            }, this.logTriggered = function(e) {
                this.fireEvent(e, r.triggeredSuffix), this.startStatisticsSequence(a(e + this.provider + r.completedTimeSequenceSuffix))
            }, this.logInitialized = function(e) {
                this.fireEvent(e, r.initializedSuffix)
            }, this.logSuppressed = function(e) {
                this.fireEvent(e, r.suppressedSuffix)
            }, this.logDisplayed = function(e) {
                this.fireEvent(e, r.displayedSuffix)
            }, this.logProviderError = function(e) {
                this.fireEvent(e, r.providerErrorSuffix)
            }, this.logMetadataError = function(e) {
                this.fireEvent(e, r.metadataErrorSuffix)
            }, this.logCaptchaShownEventToEventStream = function(e, t, n) {
                this.logCaptchaInitiatedEventToEventStream(e, r.captchaInitiatedChallengeTypes.visible, t, n)
            }, this.logCaptchaSuppressedEventToEventStream = function(e, t, n) {
                this.logCaptchaInitiatedEventToEventStream(e, r.captchaInitiatedChallengeTypes.hidden, t, n)
            }, this.logCaptchaErrorEventToEventStream = function(e, t, n, a) {
                this.logCaptchaInitiatedEventToEventStream(e, r.captchaInitiatedChallengeTypes.error, t, n, a.toString())
            }, this.logCaptchaInitiatedEventToEventStream = function(e, t, n, a, i) {
                p.EventStream && (e = e, t = {
                    type: t,
                    provider: this.provider
                }, "" !== n && void 0 !== n && (t.session = n), "" !== a && void 0 !== a && (t.ucid = a), "" !== i && void 0 !== i && (t.message = i), p.EventStream.SendEventWithTarget(r.eventStreamCaptchaInitiatedEventName, e, t, p.EventStream.TargetTypes.WWW))
            }, this.logCaptchaTokenReceivedEventToEventStream = function(e, t, n) {
                p.EventStream && p.EventStream.SendEventWithTarget(r.eventStreamCaptchaTokenReceivedEventName, e, {
                    provider: this.provider,
                    session: t,
                    ucid: n || ""
                }, p.EventStream.TargetTypes.WWW)
            }, this.logCaptchaEventToEventStream = function(e, t, n, a, i) {
                p.EventStream && (t = t || 0, n = n ? "true" : "false", p.EventStream.SendEventWithTarget(r.eventStreamCaptchaEventName, e, {
                    solveDuration: t,
                    success: n,
                    provider: this.provider,
                    session: a || "",
                    ucid: i || ""
                }, p.EventStream.TargetTypes.WWW))
            }
        },
        e = function() {
            var a = [],
                n = (c().extend({}, T.messages), new b("FunCaptcha")),
                i = {},
                e = "",
                t = {};
            c().noop, c().noop, c().noop, c().noop, c().noop, c().noop;

            function o(e) {
                t[e] && t[e].fcInstance.refresh_session()
            }

            function r(e, t) {
                throw new Error("CAPI V1 is deprecated")
            }

            function s() {
                var e = c()("#game-card-redeem-captcha").addClass("hidden").detach();
                c()("#redeem-card-wrapper").append(e), p.Dialog.close()
            }
            return {
                types: c().extend({}, T.types),
                setMaxRetriesOnTokenValidationFailure: function(e) {
                    0
                },
                setRetryIntervalRange: function(e, t) {
                    0
                },
                reset: o,
                render: r,
                addCaptchaTypes: function(e, n) {
                    e && e.forEach(function(e) {
                        var t, t = {
                                Type: n ? (t = e.Type).charAt(0).toLowerCase() + t.slice(1) : e.Type,
                                ApiUrl: e.ApiUrl,
                                PublicKey: e.PublicKey
                            },
                            e = JSON.stringify(t);
                        i.hasOwnProperty(e) || (i[e] = t, a.push(t))
                    })
                },
                setPerAppTypeLoggingEnabled: function(e, t) {
                    t = 1 < arguments.length && void 0 !== t ? t : void 0;
                    n.setPerAppTypeLoggingEnabled(e, t)
                },
                showFunCaptchaInModal: function() {
                    p.Dialog.open({
                        bodyContent: '<div id="funcaptcha-modal-body" class="funcaptcha-modal-body"></div>',
                        allowHtmlContentInBody: !0,
                        showAccept: !1,
                        showDecline: !1,
                        xToCancel: !0,
                        onCloseCallback: s
                    });
                    var e = c()("#game-card-redeem-captcha").removeClass("hidden").detach();
                    c()("#funcaptcha-modal-body").append(e)
                },
                dismissFunCaptchaModal: s,
                captchaInstances: t,
                loggerInstance: n
            }
        }();
    window.Roblox.Captcha = t, window.Roblox.CaptchaLogger = b, window.Roblox.FunCaptcha = e, window.Roblox.CaptchaV2ServiceCaptchaIdBase = 0, window.Roblox.CaptchaConstants = T
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/783f8bc751ec3da5730fa4ca8ec59b7b-captchaCore.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("CaptchaCore");