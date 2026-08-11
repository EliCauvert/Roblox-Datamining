! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "c654e75159ee3287bdd04ee8f8baa0a6252d1333"
        };
        var n = (new t.Error).stack;
        n && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[n] = "ad52517e-bc1f-4f7e-b04f-88af96c33960", t._sentryDebugIdIdentifier = "sentry-dbid-ad52517e-bc1f-4f7e-b04f-88af96c33960")
    } catch (t) {}
}(),
function() {
    "use strict";
    var t = {
            507: function(t) {
                t.exports = "https://images.rbxcdn.com/6674b8e189bf79c6.png"
            },
            70: function(t, n, r) {
                t.exports = {}
            },
            560: function(t, n, r) {
                t.exports = {}
            },
            945: function(t, n, r) {
                t.exports = {}
            }
        },
        n = {};

    function r(a) {
        var o = n[a];
        if (void 0 !== o) return o.exports;
        var i = n[a] = {
            exports: {}
        };
        return t[a](i, i.exports, r), i.exports
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
        for (var a in n) r.o(n, a) && !r.o(t, a) && Object.defineProperty(t, a, {
            enumerable: !0,
            get: n[a]
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
    }, r.g.importScripts && (a = r.g.location + "");
    var a, o = r.g.document;
    if (!a && o && (o.currentScript && "SCRIPT" === o.currentScript.tagName.toUpperCase() && (a = o.currentScript.src), !a)) {
        var i = o.getElementsByTagName("script");
        if (i.length)
            for (var l = i.length - 1; l > -1 && (!a || !/^http(s?):/.test(a));) a = i[l--].src
    }
    if (!a) throw Error("Automatic publicPath is not supported in this browser");
    r.p = a.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            var t, n, a, o, i, l, u, c, s, d, f, p, m = window.jQuery,
                h = r.n(m),
                y = window.Roblox,
                v = window.React,
                b = r.n(v),
                g = window.TanstackQuery,
                w = window.Roblox["core-scripts"].http.http,
                x = window.CoreRobloxUtilities,
                S = window.Roblox["core-scripts"].guac,
                P = window.Roblox["core-scripts"].environmentUrls,
                E = r.n(P);

            function A(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function I(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            A(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            A(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function C(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var O = x.dataStores.gamesDataStore,
                k = function() {
                    return I(function() {
                        return C(this, function(t) {
                            return [2, (0, S.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                T = function() {
                    var t = {
                        url: "".concat(E().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return w.get(t).then(function(t) {
                        return t.data
                    })
                },
                j = function(t) {
                    var n = {
                        url: "".concat(E().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return w.post(n, {
                        universeId: t
                    }).then(function(t) {
                        return t.data
                    })
                },
                D = function(t, n) {
                    var r = {
                        url: "".concat(E().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return w.post(r, {
                        rootPlaceId: t,
                        expectedBasePriceId: n
                    }).then(function(t) {
                        var n, r;
                        return null != (r = JSON.parse(null != (n = t.data.checkoutUrl) ? n : "").checkoutUrl) ? r : ""
                    })
                },
                N = {
                    UnplayableOtherReason: "UnplayableOtherReason",
                    Playable: "Playable",
                    GuestProhibited: "GuestProhibited",
                    GameUnapproved: "GameUnapproved",
                    IncorrectConfiguration: "IncorrectConfiguration",
                    UniverseRootPlaceIsPrivate: "UniverseRootPlaceIsPrivate",
                    InsufficientPermissionFriendsOnly: "InsufficientPermissionFriendsOnly",
                    InsufficientPermissionGroupOnly: "InsufficientPermissionGroupOnly",
                    DeviceRestricted: "DeviceRestricted",
                    UnderReview: "UnderReview",
                    PurchaseRequired: "PurchaseRequired",
                    AccountRestricted: "AccountRestricted",
                    TemporarilyUnavailable: "TemporarilyUnavailable",
                    ComplianceBlocked: "ComplianceBlocked",
                    ContextualPlayabilityRegionalAvailability: "ContextualPlayabilityRegionalAvailability",
                    ContextualPlayabilityRegionalCompliance: "ContextualPlayabilityRegionalCompliance",
                    ContextualPlayabilityAgeRecommendationParentalControls: "ContextualPlayabilityAgeRecommendationParentalControls",
                    ContextualPlayabilityAgeGated: "ContextualPlayabilityAgeGated",
                    PlaceHasNoPublishedVersion: "PlaceHasNoPublishedVersion",
                    ContextualPlayabilityUnverifiedSeventeenPlusUser: "ContextualPlayabilityUnverifiedSeventeenPlusUser",
                    FiatPurchaseRequired: "FiatPurchaseRequired",
                    ContextualPlayabilityUnrated: "ContextualPlayabilityUnrated",
                    ContextualPlayabilityAgeGatedByDescriptor: "ContextualPlayabilityAgeGatedByDescriptor",
                    ContextualPlayabilityExperienceBlockedParentalControls: "ContextualPlayabilityExperienceBlockedParentalControls",
                    ContextualPlayabilityRequireParentApproval: "ContextualPlayabilityRequireParentApproval",
                    ContextualPlayabilityCoreGated: "ContextualPlayabilityCoreGated",
                    ContextualPlayabilityAgeCheckRequired: "ContextualPlayabilityAgeCheckRequired",
                    FiatPurchaseDeviceRestricted: "FiatPurchaseDeviceRestricted"
                };

            function R(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }
            var U = (R(eY = {}, N.UnplayableOtherReason, "UnplayableError.UnplayableOther"), R(eY, N.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), R(eY, N.GameUnapproved, "UnplayableError.GameUnapproved"), R(eY, N.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), R(eY, N.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), R(eY, N.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), R(eY, N.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), R(eY, N.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), R(eY, N.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), R(eY, N.UnderReview, "UnplayableError.Moderated"), R(eY, N.AccountRestricted, "UnplayableError.AccountRestricted"), R(eY, N.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), R(eY, N.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), R(eY, N.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), R(eY, N.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), R(eY, N.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), R(eY, N.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), R(eY, N.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), R(eY, N.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), R(eY, N.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), R(eY, N.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), eY),
                L = "PlayButtonMessage.AgreeToNotice",
                M = "PlayButtonText.Unlock",
                _ = "PlayButtonText.Unavailable",
                F = "PlayButtonText.Buy",
                B = "PlayButtonText.PlayDemo",
                G = function(t, n) {
                    var r, a;
                    return {
                        eventName: "playGameClicked",
                        ctx: "click",
                        properties: (r = function(t) {
                            for (var n = 1; n < arguments.length; n++) {
                                var r = null != arguments[n] ? arguments[n] : {},
                                    a = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(r, t).enumerable
                                }))), a.forEach(function(n) {
                                    R(t, n, r[n])
                                })
                            }
                            return t
                        }({}, n), a = a = {
                            placeId: t
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(a)) : (function(t, n) {
                            var r = Object.keys(t);
                            if (Object.getOwnPropertySymbols) {
                                var a = Object.getOwnPropertySymbols(t);
                                r.push.apply(r, a)
                            }
                            return r
                        })(Object(a)).forEach(function(t) {
                            Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(a, t))
                        }), r),
                        gamePlayIntentEventCtx: "PlayButton"
                    }
                },
                W = {
                    ActionNeeded: "ActionNeededButtonShown",
                    Unplayable: "UnplayableErrorShown",
                    SeventeenPlusInPlayable: "ReachedSeventeenPlusCaseInPlayable",
                    PlayButtonUpsellSelfUpdateSettingTriggered: "PlayButtonUpsellSelfUpdateSettingTriggered",
                    PlayButtonUpsellAskYourParentTriggered: "PlayButtonUpsellAskYourParentTriggered",
                    PlayButtonUpsellRestrictedUnplayableTriggered: "PlayButtonUpsellRestrictedUnplayableTriggered",
                    PlayButtonUpsellAgeRestrictionVerificationTriggered: "PlayButtonUpsellAgeRestrictionVerificationTriggered",
                    PlayButtonUpsellUnknownSettingOrAge: "PlayButtonUpsellUnknownSettingOrAge",
                    PlayButtonUpsellMinimalMaturityRating: "PlayButtonUpsellMinimalMaturityRating",
                    PlayButtonUpsellAgeNotInMapping: "PlayButtonUpsellAgeNotInMapping",
                    PlayButtonUpsellParentalConsentError: "PlayButtonUpsellParentalConsentError",
                    PlayButtonUpsellAgeRestrictionVerificationError: "PlayButtonUpsellAgeRestrictionVerificationError",
                    PlayButtonUpsellUnknownRequirement: "PlayButtonUpsellUnknownRequirement",
                    PlayButtonUpsellExperienceApprovalTriggered: "PlayButtonUpsellExperienceApprovalTriggered",
                    PlayButtonUpsellExperienceApprovalError: "PlayButtonUpsellExperienceApprovalError",
                    PreparePurchaseUrlError: "PreparePurchaseUrlError",
                    PlayButtonShowIdentificationError: "PlayButtonShowIdentificationIssueCaught",
                    PlayabilityStatusFetchInvalidUniverseId: "PlayabilityStatusFetchInvalidUniverseId",
                    PlayabilityStatusFetchInvalidResponse: "PlayabilityStatusFetchInvalidResponse",
                    PlayabilityStatusFetchFailed: "PlayabilityStatusFetchFailed",
                    PlayableUxTreatmentMalformedData: "PlayableUxTreatmentMalformedData",
                    PlayableUxTreatmentUnknownTreatment: "PlayableUxTreatmentUnknownTreatment",
                    PlayableUxTreatmentPlayabilityStatusStillLoading: "PlayableUxTreatmentPlayabilityStatusStillLoading"
                },
                z = {
                    eventName: "unlockPlayIntent",
                    ageCheckUpsellName: "AgeCheckRequired",
                    gameLaunchFallbackUpsellName: "GameLaunch",
                    restrictedUnplayableUpsellName: "RestrictedUnplayableOptionNotFound",
                    unverifiedSeventeenPlusUpsellName: "AgeVerificationUnverifiedSeventeenPlusUser",
                    fiatPurchaseUpsellName: "FiatPurchase",
                    reconfirmLaunchModalUpsellName: "ReconfirmLaunchModal",
                    experienceApprovalUpsellName: "ExperienceApproval"
                },
                V = "gameJoinAgeCheckRequired",
                H = "gameJoinContentMaturityLock";

            function q(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            var K = {
                    playabilityStatus: N.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0
                },
                J = function(t) {
                    var n = (0, g.useQuery)({
                            queryKey: ["playabilityStatus", t],
                            queryFn: function() {
                                var n;
                                return (n = function() {
                                    var n, r, a, o;
                                    return function(t, n) {
                                        var r, a, o, i = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                            return this
                                        }), l;

                                        function u(u) {
                                            return function(c) {
                                                var s = [u, c];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                    if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                                    switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = s;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: s[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, a = s[1], s = [0];
                                                            continue;
                                                        case 7:
                                                            s = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                                i.label = s[1];
                                                                break
                                                            }
                                                            if (6 === s[0] && i.label < o[1]) {
                                                                i.label = o[1], o = s;
                                                                break
                                                            }
                                                            if (o && i.label < o[2]) {
                                                                i.label = o[2], i.ops.push(s);
                                                                break
                                                            }
                                                            o[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    s = n.call(t, i)
                                                } catch (t) {
                                                    s = [6, t], a = 0
                                                } finally {
                                                    r = o = 0
                                                }
                                                if (5 & s[0]) throw s[1];
                                                return {
                                                    value: s[0] ? s[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                if (!t) throw null == (n = window.EventTracker) || n.fireEvent(W.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                i.label = 1;
                                            case 1:
                                                var l;
                                                return i.trys.push([1, 3, , 4]), [4, (l = [t], I(function() {
                                                    var t;
                                                    return C(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return [4, O.getPlayabilityStatus(l)];
                                                            case 1:
                                                                return [2, (void 0 === (t = n.sent().data) ? [] : t)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return r = i.sent(), [3, 4];
                                            case 3:
                                                throw i.sent(), null == (a = window.EventTracker) || a.fireEvent(W.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == r ? void 0 : r.playabilityStatus) || void 0 === r.isPlayable) throw null == (o = window.EventTracker) || o.fireEvent(W.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
                                                return [2, {
                                                    playabilityStatus: r.playabilityStatus,
                                                    isPlayable: r.isPlayable,
                                                    unplayableDisplayText: r.unplayableDisplayText,
                                                    playableUxTreatment: r.playableUxTreatment,
                                                    upsellUxTreatment: r.upsellUxTreatment,
                                                    demoModeAvailable: r.demoModeAvailable
                                                }]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(a, o) {
                                        var i = n.apply(t, r);

                                        function l(t) {
                                            q(i, a, o, l, u, "next", t)
                                        }

                                        function u(t) {
                                            q(i, a, o, l, u, "throw", t)
                                        }
                                        l(void 0)
                                    })
                                })()
                            },
                            staleTime: 3e4
                        }),
                        r = n.data,
                        a = n.isFetching,
                        o = n.isError,
                        i = n.refetch,
                        l = (0, v.useCallback)(function() {
                            i()
                        }, [i]);
                    return (0, v.useEffect)(function() {
                        var t = function(t) {
                            t.persisted && l()
                        };
                        return window.addEventListener("pageshow", t),
                            function() {
                                window.removeEventListener("pageshow", t)
                            }
                    }, [l]), (0, v.useMemo)(function() {
                        return o ? {
                            playabilityStatus: K.playabilityStatus,
                            isPlayable: K.isPlayable,
                            unplayableDisplayText: K.unplayableDisplayText,
                            playableUxTreatment: K.playableUxTreatment,
                            upsellUxTreatment: K.upsellUxTreatment,
                            demoModeAvailable: K.demoModeAvailable,
                            isFetchingPlayability: a,
                            refetchPlayabilityData: l
                        } : {
                            playabilityStatus: null == r ? void 0 : r.playabilityStatus,
                            isPlayable: null == r ? void 0 : r.isPlayable,
                            unplayableDisplayText: null == r ? void 0 : r.unplayableDisplayText,
                            playableUxTreatment: null == r ? void 0 : r.playableUxTreatment,
                            upsellUxTreatment: null == r ? void 0 : r.upsellUxTreatment,
                            demoModeAvailable: null == r ? void 0 : r.demoModeAvailable,
                            isFetchingPlayability: a,
                            refetchPlayabilityData: l
                        }
                    }, [r, o, a, l])
                },
                $ = window.Roblox["core-scripts"].game,
                Y = window.Roblox["core-scripts"].util.url,
                X = window.CoreUtilities,
                Q = window.HeaderScripts;

            function Z(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function ee(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            Z(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            Z(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function et(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        a = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), a.forEach(function(n) {
                        var a;
                        a = r[n], n in t ? Object.defineProperty(t, n, {
                            value: a,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = a
                    })
                }
                return t
            }

            function en(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var er = {
                pid: "experiencestart_mobileweb",
                is_retargeting: "false"
            };

            function ea(t) {
                if (!(null === y.GameLauncher || void 0 === y.GameLauncher ? void 0 : y.GameLauncher.isJoinAttemptIdEnabled())) return {};
                var n = t.joinAttemptOrigin,
                    r = t.joinAttemptId;
                return {
                    joinAttemptId: r = "string" == typeof r ? r : X.uuidService.generateRandomUuid(),
                    joinAttemptOrigin: n
                }
            }

            function eo(t, n, r, a) {
                var o = et({
                    placeId: n
                }, t, ea(t), r, null == a ? {} : {
                    actionType: a
                });
                return x.eventStreamService.sendEventWithTarget("playGameClicked", "click", o), o
            }

            function ei(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = "".concat(E().websiteUrl, "/games/start?placeid=").concat(t);
                if (null === y.GameLauncher || void 0 === y.GameLauncher ? void 0 : y.GameLauncher.isJoinAttemptIdEnabled()) {
                    var a = ea(n),
                        o = a.joinAttemptId,
                        i = a.joinAttemptOrigin;
                    "string" == typeof o && o.length > 0 && (r += "&joinAttemptId=".concat(o), "string" == typeof i && i.length > 0 && (r += "&joinAttemptOrigin=".concat(i)))
                }
                var l = n.launchData,
                    u = n.eventId;
                return "string" == typeof l && l.length > 0 && (r += "&launchData=".concat(l)), "string" == typeof u && u.length > 0 && (r += "&eventId=".concat(u)), encodeURIComponent(r)
            }
            var el = function(t, n, r, a) {
                    var o = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        i = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        l = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        u = arguments.length > 7 ? arguments[7] : void 0,
                        c = Q.deviceMeta.getDeviceMeta();
                    if ((null == c ? void 0 : c.isIosDevice) || (null == c ? void 0 : c.isAndroidDevice) || Q.jsClientDeviceIdentifier.isIos13Ipad || (null == c ? void 0 : c.isChromeOs)) {
                        var s = eo(o, t, i, u),
                            d = ei(t, s),
                            f = Y.composeQueryString(et({}, er, l));
                        window.open("https://ro.blox.com/Ebh5?".concat(f, "&af_dp=").concat(d, "&af_web_dp=").concat(d, "&deep_link_value=").concat(d), "_self")
                    } else {
                        var p = "0";
                        null !== window.localStorage.getItem("ref_info") && (p = function() {
                            var t = window.localStorage.getItem("ref_info");
                            if (!t) return {};
                            try {
                                return JSON.parse(atob(t))
                            } catch (t) {
                                return {}
                            }
                        }()[t]), (0, $.launchGame)((0, $.buildPlayGameProperties)(n, t, a, void 0, r, p, i), G(t, o), u), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                eu = function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = Q.deviceMeta.getDeviceMeta();
                    if ((null == r ? void 0 : r.isIosDevice) || (null == r ? void 0 : r.isAndroidDevice) || Q.jsClientDeviceIdentifier.isIos13Ipad || (null == r ? void 0 : r.isChromeOs)) {
                        var a = eo({}, t, {}),
                            o = ei(t, a),
                            i = Y.composeQueryString(et({}, er, n));
                        window.open("https://ro.blox.com/Ebh5?".concat(i, "&af_dp=").concat(o, "&af_web_dp=").concat(o, "&deep_link_value=").concat(o), "_self")
                    } else(0, $.launchGame)((0, $.buildPlayGameProperties)(void 0, t), G(t, {}))
                },
                ec = function(t) {
                    var n = t.context,
                        r = t.pageContext;
                    return ee(function() {
                        var t, a, o, i, l, u;
                        return en(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    return c.trys.push([0, 2, , 3]), a = {
                                        featureName: "TriggerAgeCheckUpsellIncludingVPC",
                                        isAsyncCall: !1,
                                        usePrologue: !1,
                                        namespace: "core_content/CoreContent",
                                        featureSpecificData: {
                                            context: "".concat(n, "-").concat(r)
                                        }
                                    }, [4, null == (t = window.Roblox.AccessManagementUpsellV2Service) ? void 0 : t.startAccessManagementUpsell(a)];
                                case 1:
                                    return [2, null != (o = c.sent()) && o];
                                case 2:
                                    throw i = c.sent(), null == (u = (null != (l = window.EventTracker) ? l : {}).fireEvent) || u(W.PlayButtonUpsellAgeRestrictionVerificationError), i;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                es = function(t, n) {
                    try {
                        var r, a = null == (r = window.Roblox.UrlParser) ? void 0 : r.getParameterValueByName("shareLinkSourceType", !1);
                        if ((null == a ? void 0 : a.toLowerCase()) !== "experiencedetails") return;
                        var o = window.Roblox.EventStream;
                        null == o || o.SendEventWithTarget("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: t,
                            universeId: n
                        }, o.TargetTypes.WWW)
                    } catch (t) {}
                },
                ed = function(t, n) {
                    return void 0 !== t && t !== N.Playable && t !== N.GuestProhibited && t !== N.PurchaseRequired && t !== N.ContextualPlayabilityUnverifiedSeventeenPlusUser && t !== N.FiatPurchaseRequired && t !== N.ContextualPlayabilityAgeCheckRequired && (t !== N.ContextualPlayabilityAgeRecommendationParentalControls && t !== N.ContextualPlayabilityRequireParentApproval || !n) && !0
                },
                ef = function(t, n, r, a) {
                    x.eventStreamService.sendEvent({
                        name: z.eventName,
                        type: z.eventName,
                        context: x.eventStreamService.eventTypes.formInteraction
                    }, {
                        universeId: t,
                        upsellName: n,
                        playabilityStatus: r,
                        pg: a
                    })
                },
                ep = window.ReactJSX,
                em = window.ReactStyleGuide,
                eh = window.Roblox["core-scripts"].react,
                ey = window.Roblox.NavigationService,
                ev = window.Roblox.ExperimentationService,
                eb = r.n(ev),
                eg = window.ReactUtilities,
                ew = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding"],
                ex = (0, eg.withTranslations)(function(t) {
                    var n = t.onButtonClick,
                        r = t.buttonWidth,
                        a = void 0 === r ? em.Button.widths.full : r,
                        o = t.buttonClassName,
                        i = t.translate;
                    return (0, ep.jsxs)(b().Fragment, {
                        children: [(0, ep.jsx)(em.Button, {
                            "data-testid": "play-action-needed-button",
                            width: a,
                            className: void 0 === o ? "btn-common-play-game-action-needed-lg" : o,
                            onClick: n,
                            children: i(M)
                        }), (0, ep.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                }, ew),
                eS = function(t) {
                    var n = t.universeId,
                        r = t.buttonClassName,
                        a = t.pageContext,
                        o = (0, v.useCallback)(function(t) {
                            t.preventDefault(), t.stopPropagation();
                            var r, o = (null != (r = window.EventTracker) ? r : {}).fireEvent;
                            if (null == o || o(W.PlayButtonUpsellExperienceApprovalTriggered), ef(n, z.experienceApprovalUpsellName, N.ContextualPlayabilityRequireParentApproval, a), !window.Roblox.AccessManagementUpsellV2Service) {
                                null == o || o(W.PlayButtonUpsellExperienceApprovalError);
                                return
                            }
                            window.Roblox.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                featureName: "CanApproveExperience",
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: n,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                null == o || o(W.PlayButtonUpsellExperienceApprovalError)
                            })
                        }, [n, a]);
                    return (0, ep.jsx)(ex, {
                        onButtonClick: o,
                        buttonClassName: r
                    })
                };
            eS.defaultProps = {
                buttonClassName: void 0
            };
            var eP = function() {
                return (eP = Object.assign || function(t) {
                    for (var n, r = 1, a = arguments.length; r < a; r++)
                        for (var o in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, o) && (t[o] = n[o]);
                    return t
                }).apply(this, arguments)
            };

            function eE(t, n) {
                var r = {};
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && 0 > n.indexOf(a) && (r[a] = t[a]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (a = Object.getOwnPropertySymbols(t); o < a.length; o++) 0 > n.indexOf(a[o]) && Object.prototype.propertyIsEnumerable.call(t, a[o]) && (r[a[o]] = t[a[o]])
                }
                return r
            }
            var eA = function() {
                for (var t, n, r = 0, a = "", o = arguments.length; r < o; r++)(t = arguments[r]) && (n = function t(n) {
                    var r, a, o = "";
                    if ("string" == typeof n || "number" == typeof n) o += n;
                    else if ("object" == (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n))
                        if (Array.isArray(n)) {
                            var i = n.length;
                            for (r = 0; r < i; r++) n[r] && (a = t(n[r])) && (o && (o += " "), o += a)
                        } else
                            for (a in n) n[a] && (o && (o += " "), o += a);
                    return o
                }(t)) && (a && (a += " "), a += n);
                return a
            };

            function eI(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }
            var eC = (null == (eX = globalThis) ? void 0 : eX.document) ? v.useLayoutEffect : function() {},
                eO = v[" useId ".trim().toString()] || function() {},
                ek = 0;

            function eT(t) {
                var n, r = (n = v.useState(eO()), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != o) {
                            var i = [],
                                l = !0,
                                u = !1;
                            try {
                                for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                            } catch (t) {
                                u = !0, a = t
                            } finally {
                                try {
                                    l || null == o.return || o.return()
                                } finally {
                                    if (u) throw a
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return eI(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eI(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    a = r[0],
                    o = r[1];
                return eC(function() {
                    t || o(function(t) {
                        return null != t ? t : String(ek++)
                    })
                }, [t]), t || (a ? "radix-".concat(a) : "")
            }
            var ej = window.ReactDOM,
                eD = r.n(ej);

            function eN(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function eR(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function eU(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function eL(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        a = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), a.forEach(function(n) {
                        eR(t, n, r[n])
                    })
                }
                return t
            }

            function eM(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, a)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function e_(t, n) {
                if (null == t) return {};
                var r, a, o = function(t, n) {
                    if (null == t) return {};
                    var r, a, o = {},
                        i = Object.keys(t);
                    for (a = 0; a < i.length; a++) r = i[a], n.indexOf(r) >= 0 || (o[r] = t[r]);
                    return o
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (a = 0; a < i.length; a++) r = i[a], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (o[r] = t[r])
                }
                return o
            }

            function eF(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || eG(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eB(t) {
                return function(t) {
                    if (Array.isArray(t)) return eN(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || eG(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eG(t, n) {
                if (t) {
                    if ("string" == typeof t) return eN(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eN(t, n)
                }
            }

            function eW(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    a = r.checkForDefaultPrevented,
                    o = void 0 === a || a;
                return function(r) {
                    if (null == t || t(r), !1 === o || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function ez(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function eV() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        a = n.map(function(n) {
                            var a = ez(n, t);
                            return r || "function" != typeof a || (r = !0), a
                        });
                    if (r) return function() {
                        for (var t = 0; t < a.length; t++) {
                            var r = a[t];
                            "function" == typeof r ? r() : ez(n[t], null)
                        }
                    }
                }
            }

            function eH() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return v.useCallback(eV.apply(void 0, eB(n)), n)
            }
            var eq = Symbol("radix.slottable");

            function eK(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === eq
            }
            var eJ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, a, o, i, l, u = (a = r = "Primitive.".concat(n), (o = v.forwardRef(function(t, n) {
                        var r = t.children,
                            a = e_(t, ["children"]);
                        if (v.isValidElement(r)) {
                            var o, i, l, u = (l = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = eL({}, n);
                                    for (var a in n) ! function(a) {
                                        var o = t[a],
                                            i = n[a];
                                        /^on[A-Z]/.test(a) ? o && i ? r[a] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, eB(n)), o.apply(void 0, eB(n))
                                        } : o && (r[a] = o) : "style" === a ? r[a] = eL({}, o, i) : "className" === a && (r[a] = [o, i].filter(Boolean).join(" "))
                                    }(a);
                                    return eL({}, t, r)
                                }(a, r.props);
                            return r.type !== v.Fragment && (c.ref = n ? eV(n, u) : u), v.cloneElement(r, c)
                        }
                        return v.Children.count(r) > 1 ? v.Children.only(null) : null
                    })).displayName = "".concat(a, ".SlotClone"), i = o, (l = v.forwardRef(function(t, n) {
                        var r = t.children,
                            a = e_(t, ["children"]),
                            o = v.Children.toArray(r),
                            l = o.find(eK);
                        if (l) {
                            var u = l.props.children,
                                c = o.map(function(t) {
                                    return t === l ? v.Children.count(u) > 1 ? v.Children.only(null) : v.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, ep.jsx)(i, eM(eL({}, a), {
                                ref: n,
                                children: v.isValidElement(u) ? v.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, ep.jsx)(i, eM(eL({}, a), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    c = v.forwardRef(function(t, r) {
                        var a = t.asChild,
                            o = e_(t, ["asChild"]),
                            i = a ? u : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ep.jsx)(i, eM(eL({}, o), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(n), eM(eL({}, t), eR({}, n, c))
            }, {});

            function e$(t) {
                var n = v.useRef(t);
                return v.useEffect(function() {
                    n.current = t
                }), v.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(eB(a)))
                    }
                }, [])
            }
            var eY, eX, eQ, eZ, e0 = "dismissableLayer.update",
                e1 = v.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                e2 = v.forwardRef(function(t, n) {
                    var r, a, o = t.disableOutsidePointerEvents,
                        i = void 0 !== o && o,
                        l = t.onEscapeKeyDown,
                        u = t.onPointerDownOutside,
                        c = t.onFocusOutside,
                        s = t.onInteractOutside,
                        d = t.onDismiss,
                        f = e_(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = v.useContext(e1),
                        m = eF(v.useState(null), 2),
                        h = m[0],
                        y = m[1],
                        b = null != (a = null == h ? void 0 : h.ownerDocument) ? a : null == (r = globalThis) ? void 0 : r.document,
                        g = eF(v.useState({}), 2)[1],
                        w = eH(n, function(t) {
                            return y(t)
                        }),
                        x = Array.from(p.layers),
                        S = eF(eB(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        P = x.indexOf(S),
                        E = h ? x.indexOf(h) : -1,
                        A = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        I = E >= P,
                        C = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                a = e$(t),
                                o = v.useRef(!1),
                                i = v.useRef(function() {});
                            return v.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !o.current) {
                                            var n = function() {
                                                    e5("dismissableLayer.pointerDownOutside", a, l, {
                                                        discrete: !0
                                                    })
                                                },
                                                l = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", i.current), i.current = n, r.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", i.current);
                                        o.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", i.current)
                                }
                            }, [r, a]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = eB(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            I && !r && (null == u || u(t), null == s || s(t), t.defaultPrevented || null == d || d())
                        }, b),
                        O = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                a = e$(t),
                                o = v.useRef(!1);
                            return v.useEffect(function() {
                                var t = function(t) {
                                    t.target && !o.current && e5("dismissableLayer.focusOutside", a, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, a]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            eB(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == c || c(t), null == s || s(t), t.defaultPrevented || null == d || d())
                        }, b);
                    return function(t) {
                        var n, r, a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            o = (r = v.useRef(t), v.useEffect(function() {
                                r.current = t
                            }), v.useMemo(function() {
                                return function() {
                                    for (var t, n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                                    return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(eB(a)))
                                }
                            }, []));
                        v.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && o(t)
                            };
                            return a.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return a.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [o, a])
                    }(function(t) {
                        E === p.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && d && (t.preventDefault(), d()))
                    }, b), v.useEffect(function() {
                        if (h) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (eZ = b.body.style.pointerEvents, b.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(h)), p.layers.add(h), e3(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (b.body.style.pointerEvents = eZ)
                            }
                    }, [h, b, i, p]), v.useEffect(function() {
                        return function() {
                            h && (p.layers.delete(h), p.layersWithOutsidePointerEventsDisabled.delete(h), e3())
                        }
                    }, [h, p]), v.useEffect(function() {
                        var t = function() {
                            return g({})
                        };
                        return document.addEventListener(e0, t),
                            function() {
                                return document.removeEventListener(e0, t)
                            }
                    }, []), (0, ep.jsx)(eJ.div, eM(eL({}, f), {
                        ref: w,
                        style: eL({
                            pointerEvents: A ? I ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: eW(t.onFocusCapture, O.onFocusCapture),
                        onBlurCapture: eW(t.onBlurCapture, O.onBlurCapture),
                        onPointerDownCapture: eW(t.onPointerDownCapture, C.onPointerDownCapture)
                    }))
                });

            function e3() {
                var t = new CustomEvent(e0);
                document.dispatchEvent(t)
            }

            function e5(t, n, r, a) {
                var o = a.discrete,
                    i = r.originalEvent.target,
                    l = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && i.addEventListener(t, n, {
                    once: !0
                }), o ? i && ej.flushSync(function() {
                    return i.dispatchEvent(l)
                }) : i.dispatchEvent(l)
            }
            e2.displayName = "DismissableLayer", v.forwardRef(function(t, n) {
                var r = v.useContext(e1),
                    a = v.useRef(null),
                    o = eH(n, a);
                return v.useEffect(function() {
                    var t = a.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, ep.jsx)(eJ.div, eM(eL({}, t), {
                    ref: o
                }))
            }).displayName = "DismissableLayerBranch";
            var e4 = 0;

            function e6() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }

            function e7(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function e8() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        a = n.map(function(n) {
                            var a = e7(n, t);
                            return r || "function" != typeof a || (r = !0), a
                        });
                    if (r) return function() {
                        for (var t = 0; t < a.length; t++) {
                            var r = a[t];
                            "function" == typeof r ? r() : e7(n[t], null)
                        }
                    }
                }
            }
            var e9 = Symbol("radix.slottable");

            function te(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === e9
            }
            var tt = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, a, o, i, l, u = (a = r = "Primitive.".concat(n), (o = v.forwardRef(function(t, n) {
                        var r = t.children,
                            a = e_(t, ["children"]);
                        if (v.isValidElement(r)) {
                            var o, i, l, u = (l = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = eL({}, n);
                                    for (var a in n) ! function(a) {
                                        var o = t[a],
                                            i = n[a];
                                        /^on[A-Z]/.test(a) ? o && i ? r[a] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, eB(n)), o.apply(void 0, eB(n))
                                        } : o && (r[a] = o) : "style" === a ? r[a] = eL({}, o, i) : "className" === a && (r[a] = [o, i].filter(Boolean).join(" "))
                                    }(a);
                                    return eL({}, t, r)
                                }(a, r.props);
                            return r.type !== v.Fragment && (c.ref = n ? e8(n, u) : u), v.cloneElement(r, c)
                        }
                        return v.Children.count(r) > 1 ? v.Children.only(null) : null
                    })).displayName = "".concat(a, ".SlotClone"), i = o, (l = v.forwardRef(function(t, n) {
                        var r = t.children,
                            a = e_(t, ["children"]),
                            o = v.Children.toArray(r),
                            l = o.find(te);
                        if (l) {
                            var u = l.props.children,
                                c = o.map(function(t) {
                                    return t === l ? v.Children.count(u) > 1 ? v.Children.only(null) : v.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, ep.jsx)(i, eM(eL({}, a), {
                                ref: n,
                                children: v.isValidElement(u) ? v.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, ep.jsx)(i, eM(eL({}, a), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    c = v.forwardRef(function(t, r) {
                        var a = t.asChild,
                            o = e_(t, ["asChild"]),
                            i = a ? u : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ep.jsx)(i, eM(eL({}, o), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(n), eM(eL({}, t), eR({}, n, c))
            }, {});

            function tn(t) {
                var n = v.useRef(t);
                return v.useEffect(function() {
                    n.current = t
                }), v.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(eB(a)))
                    }
                }, [])
            }
            var tr = "focusScope.autoFocusOnMount",
                ta = "focusScope.autoFocusOnUnmount",
                to = {
                    bubbles: !1,
                    cancelable: !0
                },
                ti = v.forwardRef(function(t, n) {
                    var r = t.loop,
                        a = void 0 !== r && r,
                        o = t.trapped,
                        i = void 0 !== o && o,
                        l = t.onMountAutoFocus,
                        u = t.onUnmountAutoFocus,
                        c = e_(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        s = eF(v.useState(null), 2),
                        d = s[0],
                        f = s[1],
                        p = tn(l),
                        m = tn(u),
                        h = v.useRef(null),
                        y = function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return v.useCallback(e8.apply(void 0, eB(n)), n)
                        }(n, function(t) {
                            return f(t)
                        }),
                        b = v.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    v.useEffect(function() {
                        if (i) {
                            var t = function(t) {
                                    if (!b.paused && d) {
                                        var n = t.target;
                                        d.contains(n) ? h.current = n : tc(h.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(t) {
                                    if (!b.paused && d) {
                                        var n = t.relatedTarget;
                                        null !== n && (d.contains(n) || tc(h.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                            var r = new MutationObserver(function(t) {
                                var n = !0,
                                    r = !1,
                                    a = void 0;
                                if (document.activeElement === document.body) try {
                                    for (var o, i = t[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) o.value.removedNodes.length > 0 && tc(d)
                                } catch (t) {
                                    r = !0, a = t
                                } finally {
                                    try {
                                        n || null == i.return || i.return()
                                    } finally {
                                        if (r) throw a
                                    }
                                }
                            });
                            return d && r.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), r.disconnect()
                                }
                        }
                    }, [i, d, b.paused]), v.useEffect(function() {
                        if (d) {
                            ts.add(b);
                            var t = document.activeElement;
                            if (!d.contains(t)) {
                                var n = new CustomEvent(tr, to);
                                d.addEventListener(tr, p), d.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = n.select,
                                        a = void 0 !== r && r,
                                        o = document.activeElement,
                                        i = !0,
                                        l = !1,
                                        u = void 0;
                                    try {
                                        for (var c, s = t[Symbol.iterator](); !(i = (c = s.next()).done); i = !0) {
                                            var d = c.value;
                                            if (tc(d, {
                                                    select: a
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (t) {
                                        l = !0, u = t
                                    } finally {
                                        try {
                                            i || null == s.return || s.return()
                                        } finally {
                                            if (l) throw u
                                        }
                                    }
                                }(tl(d).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && tc(d))
                            }
                            return function() {
                                d.removeEventListener(tr, p), setTimeout(function() {
                                    var n = new CustomEvent(ta, to);
                                    d.addEventListener(ta, m), d.dispatchEvent(n), n.defaultPrevented || tc(null != t ? t : document.body, {
                                        select: !0
                                    }), d.removeEventListener(ta, m), ts.remove(b)
                                }, 0)
                            }
                        }
                    }, [d, p, m, b]);
                    var g = v.useCallback(function(t) {
                        if ((a || i) && !b.paused) {
                            var n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                r = document.activeElement;
                            if (n && r) {
                                var o, l = t.currentTarget,
                                    u = eF([tu(o = tl(l), l), tu(o.reverse(), l)], 2),
                                    c = u[0],
                                    s = u[1];
                                c && s ? t.shiftKey || r !== s ? t.shiftKey && r === c && (t.preventDefault(), a && tc(s, {
                                    select: !0
                                })) : (t.preventDefault(), a && tc(c, {
                                    select: !0
                                })) : r === l && t.preventDefault()
                            }
                        }
                    }, [a, i, b.paused]);
                    return (0, ep.jsx)(tt.div, eM(eL({
                        tabIndex: -1
                    }, c), {
                        ref: y,
                        onKeyDown: g
                    }))
                });

            function tl(t) {
                for (var n = [], r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var n = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) n.push(r.currentNode);
                return n
            }

            function tu(t, n) {
                var r = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var i, l = t[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var u = i.value;
                        if (! function(t, n) {
                                var r = n.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === r || t !== r);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(u, {
                                upTo: n
                            })) return u
                    }
                } catch (t) {
                    a = !0, o = t
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (a) throw o
                    }
                }
            }

            function tc(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.select;
                if (t && t.focus) {
                    var a, o = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== o && eU(a = t, HTMLInputElement) && "select" in a && void 0 !== r && r && t.select()
                }
            }
            ti.displayName = "FocusScope";
            var ts = (tq = [], {
                add: function(t) {
                    var n = tq[0];
                    t !== n && (null == n || n.pause()), (tq = td(tq, t)).unshift(t)
                },
                remove: function(t) {
                    var n;
                    null == (n = (tq = td(tq, t))[0]) || n.resume()
                }
            });

            function td(t, n) {
                var r = eB(t),
                    a = r.indexOf(n);
                return -1 !== a && r.splice(a, 1), r
            }

            function tf(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var tp = Symbol("radix.slottable");

            function tm(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === tp
            }
            var th = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, a, o, i, l, u = (a = r = "Primitive.".concat(n), (o = v.forwardRef(function(t, n) {
                            var r = t.children,
                                a = e_(t, ["children"]);
                            if (v.isValidElement(r)) {
                                var o, i, l, u = (l = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = eL({}, n);
                                        for (var a in n) ! function(a) {
                                            var o = t[a],
                                                i = n[a];
                                            /^on[A-Z]/.test(a) ? o && i ? r[a] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, eB(n)), o.apply(void 0, eB(n))
                                            } : o && (r[a] = o) : "style" === a ? r[a] = eL({}, o, i) : "className" === a && (r[a] = [o, i].filter(Boolean).join(" "))
                                        }(a);
                                        return eL({}, t, r)
                                    }(a, r.props);
                                return r.type !== v.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            a = n.map(function(n) {
                                                var a = tf(n, t);
                                                return r || "function" != typeof a || (r = !0), a
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < a.length; t++) {
                                                var r = a[t];
                                                "function" == typeof r ? r() : tf(n[t], null)
                                            }
                                        }
                                    }
                                }(n, u) : u), v.cloneElement(r, c)
                            }
                            return v.Children.count(r) > 1 ? v.Children.only(null) : null
                        })).displayName = "".concat(a, ".SlotClone"), i = o, (l = v.forwardRef(function(t, n) {
                            var r = t.children,
                                a = e_(t, ["children"]),
                                o = v.Children.toArray(r),
                                l = o.find(tm);
                            if (l) {
                                var u = l.props.children,
                                    c = o.map(function(t) {
                                        return t === l ? v.Children.count(u) > 1 ? v.Children.only(null) : v.isValidElement(u) ? u.props.children : null : t
                                    });
                                return (0, ep.jsx)(i, eM(eL({}, a), {
                                    ref: n,
                                    children: v.isValidElement(u) ? v.cloneElement(u, void 0, c) : null
                                }))
                            }
                            return (0, ep.jsx)(i, eM(eL({}, a), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        c = v.forwardRef(function(t, r) {
                            var a = t.asChild,
                                o = e_(t, ["asChild"]),
                                i = a ? u : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ep.jsx)(i, eM(eL({}, o), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), eM(eL({}, t), eR({}, n, c))
                }, {}),
                ty = (null == (eQ = globalThis) ? void 0 : eQ.document) ? v.useLayoutEffect : function() {},
                tv = v.forwardRef(function(t, n) {
                    var r, a, o = t.container,
                        i = e_(t, ["container"]),
                        l = eF(v.useState(!1), 2),
                        u = l[0],
                        c = l[1];
                    ty(function() {
                        return c(!0)
                    }, []);
                    var s = o || u && (null == (a = globalThis) || null == (r = a.document) ? void 0 : r.body);
                    return s ? eD().createPortal((0, ep.jsx)(th.div, eM(eL({}, i), {
                        ref: n
                    })), s) : null
                });
            tv.displayName = "Portal";
            var tb = new WeakMap,
                tg = new WeakMap,
                tw = {},
                tx = 0,
                tS = function(t) {
                    return t && (t.host || tS(t.parentNode))
                },
                tP = function(t, n, r, a) {
                    var o = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (n.contains(t)) return t;
                        var r = tS(t);
                        return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    tw[r] || (tw[r] = new WeakMap);
                    var i = tw[r],
                        l = [],
                        u = new Set,
                        c = new Set(o),
                        s = function(t) {
                            t && !u.has(t) && (u.add(t), s(t.parentNode))
                        };
                    o.forEach(s);
                    var d = function(t) {
                        t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (u.has(t)) d(t);
                            else try {
                                var n = t.getAttribute(a),
                                    o = null !== n && "false" !== n,
                                    c = (tb.get(t) || 0) + 1,
                                    s = (i.get(t) || 0) + 1;
                                tb.set(t, c), i.set(t, s), l.push(t), 1 === c && o && tg.set(t, !0), 1 === s && t.setAttribute(r, "true"), o || t.setAttribute(a, "true")
                            } catch (n) {
                                console.error("aria-hidden: cannot operate on ", t, n)
                            }
                        })
                    };
                    return d(n), u.clear(), tx++,
                        function() {
                            l.forEach(function(t) {
                                var n = tb.get(t) - 1,
                                    o = i.get(t) - 1;
                                tb.set(t, n), i.set(t, o), n || (tg.has(t) || t.removeAttribute(a), tg.delete(t)), o || t.removeAttribute(r)
                            }), --tx || (tb = new WeakMap, tb = new WeakMap, tg = new WeakMap, tw = {})
                        }
                },
                tE = function(t, n, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var a = Array.from(Array.isArray(t) ? t : [t]),
                        o = n || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return o ? (a.push.apply(a, Array.from(o.querySelectorAll("[aria-live]"))), tP(a, o, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                tA = "right-scroll-bar-position",
                tI = "width-before-scroll-bar";

            function tC(t, n) {
                return "function" == typeof t ? t(n) : t && (t.current = n), t
            }
            var tO = "undefined" != typeof window ? v.useLayoutEffect : v.useEffect,
                tk = new WeakMap,
                tT = function(t) {
                    var n = t.sideCar,
                        r = eE(t, ["sideCar"]);
                    if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var a = n.read();
                    if (!a) throw Error("Sidecar medium not found");
                    return v.createElement(a, eP({}, r))
                };
            tT.isSideCarExport = !0;
            var tj = (void 0 === tK && (tK = {}), (void 0 === tJ && (tJ = function(t) {
                    return t
                }), t$ = [], tY = !1, tX = {
                    read: function() {
                        if (tY) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return t$.length ? t$[t$.length - 1] : null
                    },
                    useMedium: function(t) {
                        var n = tJ(t, tY);
                        return t$.push(n),
                            function() {
                                t$ = t$.filter(function(t) {
                                    return t !== n
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (tY = !0; t$.length;) {
                            var n = t$;
                            t$ = [], n.forEach(t)
                        }
                        t$ = {
                            push: function(n) {
                                return t(n)
                            },
                            filter: function() {
                                return t$
                            }
                        }
                    },
                    assignMedium: function(t) {
                        tY = !0;
                        var n = [];
                        if (t$.length) {
                            var r = t$;
                            t$ = [], r.forEach(t), n = t$
                        }
                        var a = function() {
                                var r = n;
                                n = [], r.forEach(t)
                            },
                            o = function() {
                                return Promise.resolve().then(a)
                            };
                        o(), t$ = {
                            push: function(t) {
                                n.push(t), o()
                            },
                            filter: function(t) {
                                return n = n.filter(t), t$
                            }
                        }
                    }
                }).options = eP({
                    async: !0,
                    ssr: !1
                }, tK), tX),
                tD = function() {},
                tN = v.forwardRef(function(t, n) {
                    var r, a, o, i, l = v.useRef(null),
                        u = v.useState({
                            onScrollCapture: tD,
                            onWheelCapture: tD,
                            onTouchMoveCapture: tD
                        }),
                        c = u[0],
                        s = u[1],
                        d = t.forwardProps,
                        f = t.children,
                        p = t.className,
                        m = t.removeScrollBar,
                        h = t.enabled,
                        y = t.shards,
                        b = t.sideCar,
                        g = t.noIsolation,
                        w = t.inert,
                        x = t.allowPinchZoom,
                        S = t.as,
                        P = t.gapMode,
                        E = eE(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        A = (r = [l, n], a = function(t) {
                            return r.forEach(function(n) {
                                return tC(n, t)
                            })
                        }, (o = (0, v.useState)(function() {
                            return {
                                value: null,
                                callback: a,
                                facade: {
                                    get current() {
                                        return o.value
                                    },
                                    set current(e) {
                                        var t = o.value;
                                        t !== e && (o.value = e, o.callback(e, t))
                                    }
                                }
                            }
                        })[0]).callback = a, i = o.facade, tO(function() {
                            var t = tk.get(i);
                            if (t) {
                                var n = new Set(t),
                                    a = new Set(r),
                                    o = i.current;
                                n.forEach(function(t) {
                                    a.has(t) || tC(t, null)
                                }), a.forEach(function(t) {
                                    n.has(t) || tC(t, o)
                                })
                            }
                            tk.set(i, r)
                        }, [r]), i),
                        I = eP(eP({}, E), c);
                    return v.createElement(v.Fragment, null, h && v.createElement(b, {
                        sideCar: tj,
                        removeScrollBar: m,
                        shards: y,
                        noIsolation: g,
                        inert: w,
                        setCallbacks: s,
                        allowPinchZoom: !!x,
                        lockRef: l,
                        gapMode: P
                    }), d ? v.cloneElement(v.Children.only(f), eP(eP({}, I), {
                        ref: A
                    })) : v.createElement(void 0 === S ? "div" : S, eP({}, I, {
                        className: p,
                        ref: A
                    }), f))
                });
            tN.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, tN.classNames = {
                fullWidth: tI,
                zeroRight: tA
            };
            var tR = function() {
                    var t = 0,
                        n = null;
                    return {
                        add: function(a) {
                            var o, i;
                            0 == t && (n = function() {
                                if (!document) return null;
                                var t = document.createElement("style");
                                t.type = "text/css";
                                var n = r.nc;
                                return n && t.setAttribute("nonce", n), t
                            }()) && ((o = n).styleSheet ? o.styleSheet.cssText = a : o.appendChild(document.createTextNode(a)), i = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)), t++
                        },
                        remove: function() {
                            --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                        }
                    }
                },
                tU = function() {
                    var t, n = (t = tR(), function(n, r) {
                        v.useEffect(function() {
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
                tL = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                tM = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                t_ = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return tL;
                    var n, r, a, o, i, l = (n = t, a = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], o = r["padding" === n ? "paddingTop" : "marginTop"], i = r["padding" === n ? "paddingRight" : "marginRight"], [tM(a), tM(o), tM(i)]),
                        u = document.documentElement.clientWidth,
                        c = window.innerWidth;
                    return {
                        left: l[0],
                        top: l[1],
                        right: l[2],
                        gap: Math.max(0, c - u + l[2] - l[0])
                    }
                },
                tF = tU(),
                tB = "data-scroll-locked",
                tG = function(t, n, r, a) {
                    var o = t.left,
                        i = t.top,
                        l = t.right,
                        u = t.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(a, ";\n   padding-right: ").concat(u, "px ").concat(a, ";\n  }\n  body[").concat(tB, "] {\n    overflow: hidden ").concat(a, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(a, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(a, ";\n    "), "padding" === r && "padding-right: ".concat(u, "px ").concat(a, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(tA, " {\n    right: ").concat(u, "px ").concat(a, ";\n  }\n  \n  .").concat(tI, " {\n    margin-right: ").concat(u, "px ").concat(a, ";\n  }\n  \n  .").concat(tA, " .").concat(tA, " {\n    right: 0 ").concat(a, ";\n  }\n  \n  .").concat(tI, " .").concat(tI, " {\n    margin-right: 0 ").concat(a, ";\n  }\n  \n  body[").concat(tB, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
                },
                tW = function() {
                    var t = parseInt(document.body.getAttribute(tB) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                tz = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        a = t.gapMode,
                        o = void 0 === a ? "margin" : a;
                    v.useEffect(function() {
                        return document.body.setAttribute(tB, (tW() + 1).toString()),
                            function() {
                                var t = tW() - 1;
                                t <= 0 ? document.body.removeAttribute(tB) : document.body.setAttribute(tB, t.toString())
                            }
                    }, []);
                    var i = v.useMemo(function() {
                        return t_(o)
                    }, [o]);
                    return v.createElement(tF, {
                        styles: tG(i, !n, o, r ? "" : "!important")
                    })
                },
                tV = !1;
            if ("undefined" != typeof window) try {
                var tH = Object.defineProperty({}, "passive", {
                    get: function() {
                        return tV = !0, !0
                    }
                });
                window.addEventListener("test", tH, tH), window.removeEventListener("test", tH, tH)
            } catch (t) {
                tV = !1
            }
            var tq, tK, tJ, t$, tY, tX, tQ, tZ = !!tV && {
                    passive: !1
                },
                t0 = function(t, n) {
                    if (!eU(t, Element)) return !1;
                    var r = window.getComputedStyle(t);
                    return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
                },
                t1 = function(t, n) {
                    var r = n.ownerDocument,
                        a = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && eU(a, ShadowRoot) && (a = a.host), t2(t, a)) {
                            var o = t3(t, a);
                            if (o[1] > o[2]) return !0
                        }
                        a = a.parentNode
                    } while (a && a !== r.body);
                    return !1
                },
                t2 = function(t, n) {
                    return "v" === t ? t0(n, "overflowY") : t0(n, "overflowX")
                },
                t3 = function(t, n) {
                    return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
                },
                t5 = function(t, n, r, a, o) {
                    var i, l = (i = window.getComputedStyle(n).direction, "h" === t && "rtl" === i ? -1 : 1),
                        u = l * a,
                        c = r.target,
                        s = n.contains(c),
                        d = !1,
                        f = u > 0,
                        p = 0,
                        m = 0;
                    do {
                        var h = t3(t, c),
                            y = h[0],
                            v = h[1] - h[2] - l * y;
                        (y || v) && t2(t, c) && (p += v, m += y), c = eU(c, ShadowRoot) ? c.host : c.parentNode
                    } while (!s && c !== document.body || s && (n.contains(c) || n === c));
                    return (f && (o && 1 > Math.abs(p) || !o && u > p) || !f && (o && 1 > Math.abs(m) || !o && -u > m)) && (d = !0), d
                },
                t4 = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                t6 = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                t7 = function(t) {
                    return t && "current" in t ? t.current : t
                },
                t8 = 0,
                t9 = [],
                ne = (tQ = function(t) {
                    var n = v.useRef([]),
                        r = v.useRef([0, 0]),
                        a = v.useRef(),
                        o = v.useState(t8++)[0],
                        i = v.useState(tU)[0],
                        l = v.useRef(t);
                    v.useEffect(function() {
                        l.current = t
                    }, [t]), v.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var n = (function(t, n, r) {
                                if (r || 2 == arguments.length)
                                    for (var a, o = 0, i = n.length; o < i; o++) !a && o in n || (a || (a = Array.prototype.slice.call(n, 0, o)), a[o] = n[o]);
                                return t.concat(a || Array.prototype.slice.call(n))
                            })([t.lockRef.current], (t.shards || []).map(t7), !0).filter(Boolean);
                            return n.forEach(function(t) {
                                    return t.classList.add("allow-interactivity-".concat(o))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(o)), n.forEach(function(t) {
                                        return t.classList.remove("allow-interactivity-".concat(o))
                                    })
                                }
                        }
                    }, [t.inert, t.lockRef.current, t.shards]);
                    var u = v.useCallback(function(t, n) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !l.current.allowPinchZoom;
                            var o, i = t4(t),
                                u = r.current,
                                c = "deltaX" in t ? t.deltaX : u[0] - i[0],
                                s = "deltaY" in t ? t.deltaY : u[1] - i[1],
                                d = t.target,
                                f = Math.abs(c) > Math.abs(s) ? "h" : "v";
                            if ("touches" in t && "h" === f && "range" === d.type) return !1;
                            var p = t1(f, d);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = t1(f, d)), !p) return !1;
                            if (!a.current && "changedTouches" in t && (c || s) && (a.current = o), !o) return !0;
                            var m = a.current || o;
                            return t5(m, n, t, "h" === m ? c : s, !0)
                        }, []),
                        c = v.useCallback(function(t) {
                            if (t9.length && t9[t9.length - 1] === i) {
                                var r = "deltaY" in t ? t6(t) : t4(t),
                                    a = n.current.filter(function(n) {
                                        var a;
                                        return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (a = n.delta, a[0] === r[0] && a[1] === r[1])
                                    })[0];
                                if (a && a.should) t.cancelable && t.preventDefault();
                                else if (!a) {
                                    var o = (l.current.shards || []).map(t7).filter(Boolean).filter(function(n) {
                                        return n.contains(t.target)
                                    });
                                    (o.length > 0 ? u(t, o[0]) : !l.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        s = v.useCallback(function(t, r, a, o) {
                            var i = {
                                name: t,
                                delta: r,
                                target: a,
                                should: o,
                                shadowParent: function(t) {
                                    for (var n = null; null !== t;) eU(t, ShadowRoot) && (n = t.host, t = t.host), t = t.parentNode;
                                    return n
                                }(a)
                            };
                            n.current.push(i), setTimeout(function() {
                                n.current = n.current.filter(function(t) {
                                    return t !== i
                                })
                            }, 1)
                        }, []),
                        d = v.useCallback(function(t) {
                            r.current = t4(t), a.current = void 0
                        }, []),
                        f = v.useCallback(function(n) {
                            s(n.type, t6(n), n.target, u(n, t.lockRef.current))
                        }, []),
                        p = v.useCallback(function(n) {
                            s(n.type, t4(n), n.target, u(n, t.lockRef.current))
                        }, []);
                    v.useEffect(function() {
                        return t9.push(i), t.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, tZ), document.addEventListener("touchmove", c, tZ), document.addEventListener("touchstart", d, tZ),
                            function() {
                                t9 = t9.filter(function(t) {
                                    return t !== i
                                }), document.removeEventListener("wheel", c, tZ), document.removeEventListener("touchmove", c, tZ), document.removeEventListener("touchstart", d, tZ)
                            }
                    }, []);
                    var m = t.removeScrollBar,
                        h = t.inert;
                    return v.createElement(v.Fragment, null, h ? v.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, m ? v.createElement(tz, {
                        gapMode: t.gapMode
                    }) : null)
                }, tj.useMedium(tQ), tT),
                nt = v.forwardRef(function(t, n) {
                    return v.createElement(tN, eP({}, t, {
                        ref: n,
                        sideCar: ne
                    }))
                });

            function nn(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function nr(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function na(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        a = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), a.forEach(function(n) {
                        nr(t, n, r[n])
                    })
                }
                return t
            }

            function no(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, a)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function ni(t, n) {
                if (null == t) return {};
                var r, a, o = function(t, n) {
                    if (null == t) return {};
                    var r, a, o = {},
                        i = Object.keys(t);
                    for (a = 0; a < i.length; a++) r = i[a], n.indexOf(r) >= 0 || (o[r] = t[r]);
                    return o
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (a = 0; a < i.length; a++) r = i[a], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (o[r] = t[r])
                }
                return o
            }

            function nl(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || nc(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nu(t) {
                return function(t) {
                    if (Array.isArray(t)) return nn(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || nc(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nc(t, n) {
                if (t) {
                    if ("string" == typeof t) return nn(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nn(t, n)
                }
            }

            function ns(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    a = r.checkForDefaultPrevented,
                    o = void 0 === a || a;
                return function(r) {
                    if (null == t || t(r), !1 === o || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function nd(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function nf() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        a = n.map(function(n) {
                            var a = nd(n, t);
                            return r || "function" != typeof a || (r = !0), a
                        });
                    if (r) return function() {
                        for (var t = 0; t < a.length; t++) {
                            var r = a[t];
                            "function" == typeof r ? r() : nd(n[t], null)
                        }
                    }
                }
            }

            function np() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return v.useCallback(nf.apply(void 0, nu(n)), n)
            }

            function nm() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var a = n[0];
                if (1 === n.length) return a;
                var o = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var a = r.useScope,
                                o = r.scopeName;
                            return na({}, t, a(n)["__scope".concat(o)])
                        }, {});
                        return v.useMemo(function() {
                            return nr({}, "__scope".concat(a.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = a.scopeName, o
            }

            function nh(t) {
                var n = v.useRef(t);
                return v.useEffect(function() {
                    n.current = t
                }), v.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(nu(a)))
                    }
                }, [])
            }
            nt.classNames = tN.classNames;
            var ny = (null == (c = globalThis) ? void 0 : c.document) ? v.useLayoutEffect : function() {},
                nv = function(t) {
                    var n, r, a, o, i, l, u, c, s, d, f, p, m, h, y = t.present,
                        b = t.children,
                        g = (o = (a = nl(v.useState(), 2))[0], i = a[1], l = v.useRef({}), u = v.useRef(y), c = v.useRef("none"), d = (s = nl((n = y ? "mounted" : "unmounted", r = {
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
                        }, v.useReducer(function(t, n) {
                            var a;
                            return null != (a = r[t][n]) ? a : t
                        }, n)), 2))[0], f = s[1], v.useEffect(function() {
                            var t = nb(l.current);
                            c.current = "mounted" === d ? t : "none"
                        }, [d]), ny(function() {
                            var t = l.current,
                                n = u.current;
                            if (n !== y) {
                                var r = c.current,
                                    a = nb(t);
                                y ? f("MOUNT") : "none" === a || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(n && r !== a ? "ANIMATION_OUT" : "UNMOUNT"), u.current = y
                            }
                        }, [y, f]), ny(function() {
                            if (o) {
                                var t, n, r = null != (n = o.ownerDocument.defaultView) ? n : window,
                                    a = function(n) {
                                        var a = nb(l.current).includes(n.animationName);
                                        if (n.target === o && a && (f("ANIMATION_END"), !u.current)) {
                                            var i = o.style.animationFillMode;
                                            o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(t) {
                                        t.target === o && (c.current = nb(l.current))
                                    };
                                return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", a), o.addEventListener("animationend", a),
                                    function() {
                                        r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", a), o.removeEventListener("animationend", a)
                                    }
                            }
                            f("ANIMATION_END")
                        }, [o, f]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(d),
                            ref: v.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), i(t)
                            }, [])
                        }),
                        w = "function" == typeof b ? b({
                            present: g.isPresent
                        }) : v.Children.only(b),
                        x = np(g.ref, (h = null == (p = Object.getOwnPropertyDescriptor(w.props, "ref")) ? void 0 : p.get) && "isReactWarning" in h && h.isReactWarning ? w.ref : (h = null == (m = Object.getOwnPropertyDescriptor(w, "ref")) ? void 0 : m.get) && "isReactWarning" in h && h.isReactWarning ? w.props.ref : w.props.ref || w.ref);
                    return "function" == typeof b || g.isPresent ? v.cloneElement(w, {
                        ref: x
                    }) : null
                };

            function nb(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function ng(t) {
                var n, r, a = (n = t, (r = v.forwardRef(function(t, n) {
                        var r = t.children,
                            a = ni(t, ["children"]);
                        if (v.isValidElement(r)) {
                            var o, i, l, u = (l = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = na({}, n);
                                    for (var a in n) ! function(a) {
                                        var o = t[a],
                                            i = n[a];
                                        /^on[A-Z]/.test(a) ? o && i ? r[a] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, nu(n)), o.apply(void 0, nu(n))
                                        } : o && (r[a] = o) : "style" === a ? r[a] = na({}, o, i) : "className" === a && (r[a] = [o, i].filter(Boolean).join(" "))
                                    }(a);
                                    return na({}, t, r)
                                }(a, r.props);
                            return r.type !== v.Fragment && (c.ref = n ? nf(n, u) : u), v.cloneElement(r, c)
                        }
                        return v.Children.count(r) > 1 ? v.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    o = v.forwardRef(function(t, n) {
                        var r = t.children,
                            o = ni(t, ["children"]),
                            i = v.Children.toArray(r),
                            l = i.find(nx);
                        if (l) {
                            var u = l.props.children,
                                c = i.map(function(t) {
                                    return t === l ? v.Children.count(u) > 1 ? v.Children.only(null) : v.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, ep.jsx)(a, no(na({}, o), {
                                ref: n,
                                children: v.isValidElement(u) ? v.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, ep.jsx)(a, no(na({}, o), {
                            ref: n,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(t, ".Slot"), o
            }
            nv.displayName = "Presence";
            var nw = Symbol("radix.slottable");

            function nx(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === nw
            }
            var nS = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = ng("Primitive.".concat(n)),
                        a = v.forwardRef(function(t, a) {
                            var o = t.asChild,
                                i = ni(t, ["asChild"]),
                                l = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ep.jsx)(l, no(na({}, i), {
                                ref: a
                            }))
                        });
                    return a.displayName = "Primitive.".concat(n), no(na({}, t), nr({}, n, a))
                }, {}),
                nP = "Dialog",
                nE = nl(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        a = function() {
                            var n = r.map(function(t) {
                                return v.createContext(t)
                            });
                            return function(r) {
                                var a = (null == r ? void 0 : r[t]) || n;
                                return v.useMemo(function() {
                                    return nr({}, "__scope".concat(t), no(na({}, r), nr({}, t, a)))
                                }, [r, a])
                            }
                        };
                    return a.scopeName = t, [function(n, a) {
                        var o = v.createContext(a),
                            i = r.length;
                        r = nu(r).concat([a]);
                        var l = function(n) {
                            var r, a = n.scope,
                                l = n.children,
                                u = ni(n, ["scope", "children"]),
                                c = (null == a || null == (r = a[t]) ? void 0 : r[i]) || o,
                                s = v.useMemo(function() {
                                    return u
                                }, Object.values(u));
                            return (0, ep.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null == (u = l[t]) ? void 0 : u[i]) || o,
                                s = v.useContext(c);
                            if (s) return s;
                            if (void 0 !== a) return a;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, nm.apply(void 0, [a].concat(nu(n)))]
                }(nP), 2),
                nA = nE[0],
                nI = (nE[1], nl(nA(nP), 2)),
                nC = nI[0],
                nO = nI[1],
                nk = function(t) {
                    var n, r, a, o, i, l, u, c, s, d, f, p, m, h, y, b, g, w = t.__scopeDialog,
                        x = t.children,
                        S = t.open,
                        P = t.defaultOpen,
                        E = t.onOpenChange,
                        A = t.modal,
                        I = v.useRef(null),
                        C = v.useRef(null),
                        O = nl((r = (n = {
                            prop: S,
                            defaultProp: P,
                            onChange: E
                        }).prop, m = (p = nl((l = (i = {
                            defaultProp: n.defaultProp,
                            onChange: o = void 0 === (a = n.onChange) ? function() {} : a
                        }).defaultProp, u = i.onChange, s = nl(c = v.useState(l), 1)[0], d = v.useRef(s), f = nh(u), v.useEffect(function() {
                            d.current !== s && (f(s), d.current = s)
                        }, [s, d, f]), c), 2))[0], h = p[1], b = (y = void 0 !== r) ? r : m, g = nh(o), [b, v.useCallback(function(t) {
                            if (y) {
                                var n = "function" == typeof t ? t(r) : t;
                                n !== r && g(n)
                            } else h(t)
                        }, [y, r, h, g])]), 2),
                        k = O[0],
                        T = O[1];
                    return (0, ep.jsx)(nC, {
                        scope: w,
                        triggerRef: I,
                        contentRef: C,
                        contentId: eT(),
                        titleId: eT(),
                        descriptionId: eT(),
                        open: void 0 !== k && k,
                        onOpenChange: T,
                        onOpenToggle: v.useCallback(function() {
                            return T(function(t) {
                                return !t
                            })
                        }, [T]),
                        modal: void 0 === A || A,
                        children: x
                    })
                };
            nk.displayName = nP;
            var nT = "DialogTrigger";
            v.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    a = ni(t, ["__scopeDialog"]),
                    o = nO(nT, r),
                    i = np(n, o.triggerRef);
                return (0, ep.jsx)(nS.button, no(na({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": nY(o.open)
                }, a), {
                    ref: i,
                    onClick: ns(t.onClick, o.onOpenToggle)
                }))
            }).displayName = nT;
            var nj = "DialogPortal",
                nD = nl(nA(nj, {
                    forceMount: void 0
                }), 2),
                nN = nD[0],
                nR = nD[1],
                nU = function(t) {
                    var n = t.__scopeDialog,
                        r = t.forceMount,
                        a = t.children,
                        o = t.container,
                        i = nO(nj, n);
                    return (0, ep.jsx)(nN, {
                        scope: n,
                        forceMount: r,
                        children: v.Children.map(a, function(t) {
                            return (0, ep.jsx)(nv, {
                                present: r || i.open,
                                children: (0, ep.jsx)(tv, {
                                    asChild: !0,
                                    container: o,
                                    children: t
                                })
                            })
                        })
                    })
                };
            nU.displayName = nj;
            var nL = "DialogOverlay",
                nM = v.forwardRef(function(t, n) {
                    var r = nR(nL, t.__scopeDialog),
                        a = t.forceMount,
                        o = void 0 === a ? r.forceMount : a,
                        i = ni(t, ["forceMount"]),
                        l = nO(nL, t.__scopeDialog);
                    return l.modal ? (0, ep.jsx)(nv, {
                        present: o || l.open,
                        children: (0, ep.jsx)(nF, no(na({}, i), {
                            ref: n
                        }))
                    }) : null
                });
            nM.displayName = nL;
            var n_ = ng("DialogOverlay.RemoveScroll"),
                nF = v.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        a = ni(t, ["__scopeDialog"]),
                        o = nO(nL, r);
                    return (0, ep.jsx)(nt, {
                        as: n_,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, ep.jsx)(nS.div, no(na({
                            "data-state": nY(o.open)
                        }, a), {
                            ref: n,
                            style: na({
                                pointerEvents: "auto"
                            }, a.style)
                        }))
                    })
                }),
                nB = "DialogContent",
                nG = v.forwardRef(function(t, n) {
                    var r = nR(nB, t.__scopeDialog),
                        a = t.forceMount,
                        o = void 0 === a ? r.forceMount : a,
                        i = ni(t, ["forceMount"]),
                        l = nO(nB, t.__scopeDialog);
                    return (0, ep.jsx)(nv, {
                        present: o || l.open,
                        children: l.modal ? (0, ep.jsx)(nW, no(na({}, i), {
                            ref: n
                        })) : (0, ep.jsx)(nz, no(na({}, i), {
                            ref: n
                        }))
                    })
                });
            nG.displayName = nB;
            var nW = v.forwardRef(function(t, n) {
                    var r = nO(nB, t.__scopeDialog),
                        a = v.useRef(null),
                        o = np(n, r.contentRef, a);
                    return v.useEffect(function() {
                        var t = a.current;
                        if (t) return tE(t)
                    }, []), (0, ep.jsx)(nV, no(na({}, t), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: ns(t.onCloseAutoFocus, function(t) {
                            var n;
                            t.preventDefault(), null == (n = r.triggerRef.current) || n.focus()
                        }),
                        onPointerDownOutside: ns(t.onPointerDownOutside, function(t) {
                            var n = t.detail.originalEvent,
                                r = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || r) && t.preventDefault()
                        }),
                        onFocusOutside: ns(t.onFocusOutside, function(t) {
                            return t.preventDefault()
                        })
                    }))
                }),
                nz = v.forwardRef(function(t, n) {
                    var r = nO(nB, t.__scopeDialog),
                        a = v.useRef(!1),
                        o = v.useRef(!1);
                    return (0, ep.jsx)(nV, no(na({}, t), {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var i, l;
                            null == (i = t.onCloseAutoFocus) || i.call(t, n), n.defaultPrevented || (a.current || null == (l = r.triggerRef.current) || l.focus(), n.preventDefault()), a.current = !1, o.current = !1
                        },
                        onInteractOutside: function(n) {
                            null == (i = t.onInteractOutside) || i.call(t, n), n.defaultPrevented || (a.current = !0, "pointerdown" === n.detail.originalEvent.type && (o.current = !0));
                            var i, l, u = n.target;
                            (null == (l = r.triggerRef.current) ? void 0 : l.contains(u)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && o.current && n.preventDefault()
                        }
                    }))
                }),
                nV = v.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        a = t.trapFocus,
                        o = t.onOpenAutoFocus,
                        i = t.onCloseAutoFocus,
                        l = ni(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        u = nO(nB, r),
                        c = v.useRef(null),
                        s = np(n, c);
                    return v.useEffect(function() {
                        var t, n, r = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : e6()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : e6()), e4++,
                            function() {
                                1 === e4 && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                    return t.remove()
                                }), e4--
                            }
                    }, []), (0, ep.jsxs)(ep.Fragment, {
                        children: [(0, ep.jsx)(ti, {
                            asChild: !0,
                            loop: !0,
                            trapped: a,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, ep.jsx)(e2, no(na({
                                role: "dialog",
                                id: u.contentId,
                                "aria-describedby": u.descriptionId,
                                "aria-labelledby": u.titleId,
                                "data-state": nY(u.open)
                            }, l), {
                                ref: s,
                                onDismiss: function() {
                                    return u.onOpenChange(!1)
                                }
                            }))
                        }), (0, ep.jsxs)(ep.Fragment, {
                            children: [(0, ep.jsx)(n0, {
                                titleId: u.titleId
                            }), (0, ep.jsx)(n1, {
                                contentRef: c,
                                descriptionId: u.descriptionId
                            })]
                        })]
                    })
                }),
                nH = "DialogTitle",
                nq = v.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        a = ni(t, ["__scopeDialog"]),
                        o = nO(nH, r);
                    return (0, ep.jsx)(nS.h2, no(na({
                        id: o.titleId
                    }, a), {
                        ref: n
                    }))
                });
            nq.displayName = nH;
            var nK = "DialogDescription";
            v.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    a = ni(t, ["__scopeDialog"]),
                    o = nO(nK, r);
                return (0, ep.jsx)(nS.p, no(na({
                    id: o.descriptionId
                }, a), {
                    ref: n
                }))
            }).displayName = nK;
            var nJ = "DialogClose",
                n$ = v.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        a = ni(t, ["__scopeDialog"]),
                        o = nO(nJ, r);
                    return (0, ep.jsx)(nS.button, no(na({
                        type: "button"
                    }, a), {
                        ref: n,
                        onClick: ns(t.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function nY(t) {
                return t ? "open" : "closed"
            }
            n$.displayName = nJ;
            var nX = "DialogTitleWarning",
                nQ = nl((a = {
                    contentName: nB,
                    titleName: nH,
                    docsSlug: "dialog"
                }, o = v.createContext(a), (i = function(t) {
                    var n = t.children,
                        r = ni(t, ["children"]),
                        a = v.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, ep.jsx)(o.Provider, {
                        value: a,
                        children: n
                    })
                }).displayName = nX + "Provider", [i, function(t) {
                    var n = v.useContext(o);
                    if (n) return n;
                    if (void 0 !== a) return a;
                    throw Error("`".concat(t, "` must be used within `").concat(nX, "`"))
                }]), 2),
                nZ = (nQ[0], nQ[1]),
                n0 = function(t) {
                    var n = t.titleId,
                        r = nZ(nX),
                        a = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return v.useEffect(function() {
                        n && (document.getElementById(n) || console.error(a))
                    }, [a, n]), null
                },
                n1 = function(t) {
                    var n = t.contentRef,
                        r = t.descriptionId,
                        a = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(nZ("DialogDescriptionWarning").contentName, "}.");
                    return v.useEffect(function() {
                        var t, o = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                        r && o && (document.getElementById(r) || console.warn(a))
                    }, [a, n, r]), null
                };

            function n2(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function n3(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function n5(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        a = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), a.forEach(function(n) {
                        n3(t, n, r[n])
                    })
                }
                return t
            }

            function n4(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, a)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function n6(t, n) {
                if (null == t) return {};
                var r, a, o = function(t, n) {
                    if (null == t) return {};
                    var r, a, o = {},
                        i = Object.keys(t);
                    for (a = 0; a < i.length; a++) r = i[a], n.indexOf(r) >= 0 || (o[r] = t[r]);
                    return o
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (a = 0; a < i.length; a++) r = i[a], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (o[r] = t[r])
                }
                return o
            }

            function n7(t) {
                return function(t) {
                    if (Array.isArray(t)) return n2(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return n2(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n2(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n8(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var n9 = Symbol("radix.slottable");

            function re(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === n9
            }
            var rt = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, a, o, i, l, u = (a = r = "Primitive.".concat(n), (o = v.forwardRef(function(t, n) {
                            var r = t.children,
                                a = n6(t, ["children"]);
                            if (v.isValidElement(r)) {
                                var o, i, l, u = (l = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = n5({}, n);
                                        for (var a in n) ! function(a) {
                                            var o = t[a],
                                                i = n[a];
                                            /^on[A-Z]/.test(a) ? o && i ? r[a] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                var a = i.apply(void 0, n7(n));
                                                return o.apply(void 0, n7(n)), a
                                            } : o && (r[a] = o) : "style" === a ? r[a] = n5({}, o, i) : "className" === a && (r[a] = [o, i].filter(Boolean).join(" "))
                                        }(a);
                                        return n5({}, t, r)
                                    }(a, r.props);
                                return r.type !== v.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            a = n.map(function(n) {
                                                var a = n8(n, t);
                                                return r || "function" != typeof a || (r = !0), a
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < a.length; t++) {
                                                var r = a[t];
                                                "function" == typeof r ? r() : n8(n[t], null)
                                            }
                                        }
                                    }
                                }(n, u) : u), v.cloneElement(r, c)
                            }
                            return v.Children.count(r) > 1 ? v.Children.only(null) : null
                        })).displayName = "".concat(a, ".SlotClone"), i = o, (l = v.forwardRef(function(t, n) {
                            var r = t.children,
                                a = n6(t, ["children"]),
                                o = v.Children.toArray(r),
                                l = o.find(re);
                            if (l) {
                                var u = l.props.children,
                                    c = o.map(function(t) {
                                        return t === l ? v.Children.count(u) > 1 ? v.Children.only(null) : v.isValidElement(u) ? u.props.children : null : t
                                    });
                                return (0, ep.jsx)(i, n4(n5({}, a), {
                                    ref: n,
                                    children: v.isValidElement(u) ? v.cloneElement(u, void 0, c) : null
                                }))
                            }
                            return (0, ep.jsx)(i, n4(n5({}, a), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        c = v.forwardRef(function(t, r) {
                            var a = t.asChild,
                                o = n6(t, ["asChild"]),
                                i = a ? u : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ep.jsx)(i, n4(n5({}, o), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), n4(n5({}, t), n3({}, n, c))
                }, {}),
                rn = Object.freeze({
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
                rr = v.forwardRef(function(t, n) {
                    return (0, ep.jsx)(rt.span, n4(n5({}, t), {
                        ref: n,
                        style: n5({}, rn, t.style)
                    }))
                });

            function ra(t, n) {
                void 0 === n && (n = {});
                var r = n.insertAt;
                if (t && "undefined" != typeof document) {
                    var a = document.head || document.getElementsByTagName("head")[0],
                        o = document.createElement("style");
                    o.type = "text/css", "top" === r && a.firstChild ? a.insertBefore(o, a.firstChild) : a.appendChild(o), o.styleSheet ? o.styleSheet.cssText = t : o.appendChild(document.createTextNode(t))
                }
            }
            rr.displayName = "VisuallyHidden", ra(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var ro = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                ri = b().forwardRef(function(t, n) {
                    var r = t.name,
                        a = t.size,
                        o = t.className,
                        i = (t.children, eE(t, ["name", "size", "className", "children"]));
                    return b().createElement("span", Object.assign({
                        ref: n,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: eA("grow-0 shrink-0 basis-auto icon", r, ro[void 0 === a ? "Medium" : a], o)
                    }, i))
                });
            ri.displayName = "Icon";
            var rl = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                ru = function(t) {
                    var n = t.className;
                    return b().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: eA("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
                    })
                },
                rc = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                rs = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rd = function(t) {
                    var n = t.variant,
                        r = t.size,
                        a = t.isCircular,
                        o = t.className,
                        i = eE(t, ["variant", "size", "isCircular", "className"]);
                    return b().createElement("button", Object.assign({
                        type: "button",
                        className: eA("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", rl, rs[n], rc[r], a && "radius-circle", o)
                    }, i), b().createElement(ru, null), b().createElement(ri, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };
            ra(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var rf = (0, v.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                rp = function() {
                    var t = (0, v.useContext)(rf);
                    if (!t) throw Error("Dialog components must be used within a Dialog");
                    return t
                },
                rm = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                rh = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                ry = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                rv = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        a = t.children,
                        o = t.size,
                        i = t.type,
                        l = void 0 === i ? "Default" : i,
                        u = t.isModal,
                        c = t.hasCloseAffordance,
                        s = t.closeLabel,
                        d = t.hasMarginTop,
                        f = void 0 === d || d,
                        p = t.hasMarginBottom,
                        m = void 0 === p || p,
                        h = t.hasDescription,
                        y = void 0 !== h && h,
                        g = t.experimentalDisablePointerEventsStylingOnBody,
                        w = void 0 !== g && g,
                        x = (0, v.useMemo)(function() {
                            return {
                                size: o,
                                isModal: u,
                                type: l,
                                hasCloseAffordance: c,
                                closeLabel: s,
                                hasMarginTop: f,
                                hasMarginBottom: m,
                                hasDescription: y
                            }
                        }, [o, u, l, c, s, f, m, y]);
                    return (0, v.useEffect)(function() {
                        w && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [w, n]), b().createElement(rf.Provider, {
                        value: x
                    }, b().createElement(nk, {
                        open: n,
                        onOpenChange: r
                    }, a))
                };
            rv.displayName = "Dialog";
            var rb = function(t) {
                var n = t.children,
                    r = t.className,
                    a = t.style,
                    o = t.overlayClassName,
                    i = t.overlayStyle,
                    l = t.onOpenAutoFocus,
                    u = eE(t, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = rp(),
                    s = c.size,
                    d = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    m = c.hasDescription,
                    h = eA("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", d && "bg-common-backdrop", o),
                    y = eA("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return b().createElement(nU, null, b().createElement(nM, {
                    className: h,
                    style: i
                }, b().createElement(nG, Object.assign({
                    className: y,
                    "data-size": s,
                    style: a,
                    onOpenAutoFocus: l
                }, !m && {
                    "aria-describedby": void 0
                }, u), f && b().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, b().createElement(n$, {
                    asChild: !0
                }, b().createElement(rd, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": p
                }))), n)))
            };
            rb.displayName = "DialogContent";
            var rg = function(t) {
                var n = t.children,
                    r = t.className,
                    a = eE(t, ["children", "className"]),
                    o = rp(),
                    i = o.size,
                    l = o.hasMarginTop,
                    u = o.hasMarginBottom,
                    c = eA(rm[i], l && rh[i], u && ry[i], r);
                return b().createElement("div", Object.assign({
                    className: c
                }, a), n)
            };
            rg.displayName = "DialogBody";
            var rw = function(t) {
                var n = t.children,
                    r = t.className,
                    a = t.hidden,
                    o = eE(t, ["children", "className", "hidden"]),
                    i = b().createElement(nq, Object.assign({
                        className: r
                    }, o), n);
                return a ? b().createElement(rr, null, i) : i
            };
            rw.displayName = "DialogTitle";
            var rx = function(t) {
                var n = t.children,
                    r = t.className,
                    a = eE(t, ["children", "className"]),
                    o = rp().size,
                    i = eA(rm[o], ry[o], r);
                return b().createElement("div", Object.assign({
                    className: i
                }, a), n)
            };

            function rS(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function rP(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        a = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), a.forEach(function(n) {
                        var a;
                        a = r[n], n in t ? Object.defineProperty(t, n, {
                            value: a,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = a
                    })
                }
                return t
            }

            function rE(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, a)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function rA(t, n) {
                if (null == t) return {};
                var r, a, o = function(t, n) {
                    if (null == t) return {};
                    var r, a, o = {},
                        i = Object.keys(t);
                    for (a = 0; a < i.length; a++) r = i[a], n.indexOf(r) >= 0 || (o[r] = t[r]);
                    return o
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (a = 0; a < i.length; a++) r = i[a], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (o[r] = t[r])
                }
                return o
            }

            function rI(t) {
                return function(t) {
                    if (Array.isArray(t)) return rS(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return rS(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rS(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rC(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function rO(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            rx.displayName = "DialogFooter";
            var rk = Symbol.for("react.lazy"),
                rT = v[" use ".trim().toString()];

            function rj(t) {
                var n;
                return null != t && "object" == (void 0 === t ? "undefined" : rC(t)) && "$$typeof" in t && t.$$typeof === rk && "_payload" in t && "object" == rC(n = t._payload) && null !== n && "then" in n
            }
            var rD = ((t = v.forwardRef(function(t, n) {
                    var r = t.children,
                        a = rA(t, ["children"]);
                    if (rj(r) && "function" == typeof rT && (r = rT(r._payload)), v.isValidElement(r)) {
                        var o, i, l, u, c = (u = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? o.ref : (u = null == (l = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : l.get) && "isReactWarning" in u && u.isReactWarning ? o.props.ref : o.props.ref || o.ref,
                            s = function(t, n) {
                                var r = rP({}, n);
                                for (var a in n) ! function(a) {
                                    var o = t[a],
                                        i = n[a];
                                    /^on[A-Z]/.test(a) ? o && i ? r[a] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        var a = i.apply(void 0, rI(n));
                                        return o.apply(void 0, rI(n)), a
                                    } : o && (r[a] = o) : "style" === a ? r[a] = rP({}, o, i) : "className" === a && (r[a] = [o, i].filter(Boolean).join(" "))
                                }(a);
                                return rP({}, t, r)
                            }(a, r.props);
                        return r.type !== v.Fragment && (s.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return function(t) {
                                var r = !1,
                                    a = n.map(function(n) {
                                        var a = rO(n, t);
                                        return r || "function" != typeof a || (r = !0), a
                                    });
                                if (r) return function() {
                                    for (var t = 0; t < a.length; t++) {
                                        var r = a[t];
                                        "function" == typeof r ? r() : rO(n[t], null)
                                    }
                                }
                            }
                        }(n, c) : c), v.cloneElement(r, s)
                    }
                    return v.Children.count(r) > 1 ? v.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), l = t, (u = v.forwardRef(function(t, n) {
                    var r = t.children,
                        a = rA(t, ["children"]);
                    rj(r) && "function" == typeof rT && (r = rT(r._payload));
                    var o = v.Children.toArray(r),
                        i = o.find(rR);
                    if (i) {
                        var u = i.props.children,
                            c = o.map(function(t) {
                                return t === i ? v.Children.count(u) > 1 ? v.Children.only(null) : v.isValidElement(u) ? u.props.children : null : t
                            });
                        return (0, ep.jsx)(l, rE(rP({}, a), {
                            ref: n,
                            children: v.isValidElement(u) ? v.cloneElement(u, void 0, c) : null
                        }))
                    }
                    return (0, ep.jsx)(l, rE(rP({}, a), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), u),
                rN = Symbol("radix.slottable");

            function rR(t) {
                return v.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === rN
            }
            ra("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var rU = function(t) {
                    var n = t.width,
                        r = t.height;
                    return b().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, b().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                rL = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                rM = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                r_ = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rF = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rB = (0, v.forwardRef)(function(t, n) {
                    var r = t.children,
                        a = t.className,
                        o = t.style,
                        i = t.isDisabled,
                        l = void 0 !== i && i,
                        u = t.isLoading,
                        c = void 0 !== u && u,
                        s = t.icon,
                        d = t.size,
                        f = void 0 === d ? "Large" : d,
                        p = t.variant,
                        m = void 0 === p ? "Emphasis" : p,
                        h = t.asChild,
                        y = eE(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        v = eA("foundation-web-button", l ? "opacity-[0.5]" : [rl, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", rM[f], l ? rF[m] : r_[m], a),
                        g = Object.assign({
                            textDecoration: "none"
                        }, o),
                        w = function(t) {
                            return b().createElement(b().Fragment, null, b().createElement(ru, null), c && b().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, b().createElement(rU, {
                                width: rL[f],
                                height: rL[f]
                            })), b().createElement("span", {
                                className: eA("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, s && b().createElement(ri, {
                                name: s,
                                size: f
                            }), b().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (h) {
                        var x = eE(y, ["as"]),
                            S = b().Children.only(r);
                        return b().createElement(rD, Object.assign({
                            ref: n
                        }, x, {
                            className: v,
                            style: g,
                            "aria-disabled": l || void 0
                        }), b().cloneElement(S, {}, w(S.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var P = y.href,
                            E = eE(y, ["as", "href"]);
                        return b().createElement("a", Object.assign({
                            ref: n
                        }, E, {
                            "aria-disabled": l,
                            href: l ? void 0 : P,
                            className: v,
                            style: g
                        }), w(r))
                    }
                    var A = eE(y, ["as"]);
                    return b().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, A, {
                        disabled: l,
                        className: v,
                        style: g
                    }), w(r))
                }); /*! @license DOMPurify 3.3.1 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.3.1/LICENSE */
            function rG(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function rW(t, n, r) {
                return (rW = rJ() ? Reflect.construct : function(t, n, r) {
                    var a = [null];
                    a.push.apply(a, n);
                    var o = new(Function.bind.apply(t, a));
                    return r && rV(o, r.prototype), o
                }).apply(null, arguments)
            }

            function rz(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function rV(t, n) {
                return (rV = Object.setPrototypeOf || function(t, n) {
                    return t.__proto__ = n, t
                })(t, n)
            }

            function rH(t) {
                return function(t) {
                    if (Array.isArray(t)) return rG(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || rK(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rq(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function rK(t, n) {
                if (t) {
                    if ("string" == typeof t) return rG(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rG(t, n)
                }
            }

            function rJ() {
                try {
                    var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (t) {}
                return (rJ = function() {
                    return !!t
                })()
            }
            var r$ = Object.entries,
                rY = Object.setPrototypeOf,
                rX = Object.isFrozen,
                rQ = Object.getPrototypeOf,
                rZ = Object.getOwnPropertyDescriptor,
                r0 = Object.freeze,
                r1 = Object.seal,
                r2 = Object.create,
                r3 = "undefined" != typeof Reflect && Reflect,
                r5 = r3.apply,
                r4 = r3.construct;
            r0 || (r0 = function(t) {
                return t
            }), r1 || (r1 = function(t) {
                return t
            }), r5 || (r5 = function(t, n) {
                for (var r = arguments.length, a = Array(r > 2 ? r - 2 : 0), o = 2; o < r; o++) a[o - 2] = arguments[o];
                return t.apply(n, a)
            }), r4 || (r4 = function(t) {
                for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), a = 1; a < n; a++) r[a - 1] = arguments[a];
                return rW(t, rH(r))
            });
            var r6 = as(Array.prototype.forEach),
                r7 = as(Array.prototype.lastIndexOf),
                r8 = as(Array.prototype.pop),
                r9 = as(Array.prototype.push),
                ae = as(Array.prototype.splice),
                at = as(String.prototype.toLowerCase),
                an = as(String.prototype.toString),
                ar = as(String.prototype.match),
                aa = as(String.prototype.replace),
                ao = as(String.prototype.indexOf),
                ai = as(String.prototype.trim),
                al = as(Object.prototype.hasOwnProperty),
                au = as(RegExp.prototype.test),
                ac = (n = TypeError, function() {
                    for (var t = arguments.length, r = Array(t), a = 0; a < t; a++) r[a] = arguments[a];
                    return r4(n, r)
                });

            function as(t) {
                return function(n) {
                    rz(n, RegExp) && (n.lastIndex = 0);
                    for (var r = arguments.length, a = Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) a[o - 1] = arguments[o];
                    return r5(t, n, a)
                }
            }

            function ad(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : at;
                rY && rY(t, null);
                for (var a = n.length; a--;) {
                    var o = n[a];
                    if ("string" == typeof o) {
                        var i = r(o);
                        i !== o && (rX(n) || (n[a] = i), o = i)
                    }
                    t[o] = !0
                }
                return t
            }

            function af(t) {
                var n = r2(null),
                    r = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var i, l = r$(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var u, c = (u = i.value, function(t) {
                                if (Array.isArray(t)) return t
                            }(u) || function(t, n) {
                                var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                                if (null != o) {
                                    var i = [],
                                        l = !0,
                                        u = !1;
                                    try {
                                        for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                    } catch (t) {
                                        u = !0, a = t
                                    } finally {
                                        try {
                                            l || null == o.return || o.return()
                                        } finally {
                                            if (u) throw a
                                        }
                                    }
                                    return i
                                }
                            }(u, 2) || rK(u, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            s = c[0],
                            d = c[1];
                        al(t, s) && (Array.isArray(d) ? n[s] = function(t) {
                            for (var n = 0; n < t.length; n++) al(t, n) || (t[n] = null);
                            return t
                        }(d) : d && (void 0 === d ? "undefined" : rq(d)) === "object" && d.constructor === Object ? n[s] = af(d) : n[s] = d)
                    }
                } catch (t) {
                    a = !0, o = t
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (a) throw o
                    }
                }
                return n
            }

            function ap(t, n) {
                for (; null !== t;) {
                    var r = rZ(t, n);
                    if (r) {
                        if (r.get) return as(r.get);
                        if ("function" == typeof r.value) return as(r.value)
                    }
                    t = rQ(t)
                }
                return function() {
                    return null
                }
            }
            var am = r0(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                ah = r0(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                ay = r0(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                av = r0(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                ab = r0(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                ag = r0(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                aw = r0(["#text"]),
                ax = r0(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns", "slot"]),
                aS = r0(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                aP = r0(["accent", "accentunder", "align", "bevelled", "close", "columnsalign", "columnlines", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lspace", "lquote", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                aE = r0(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                aA = r1(/\{\{[\w\W]*|[\w\W]*\}\}/gm),
                aI = r1(/<%[\w\W]*|[\w\W]*%>/gm),
                aC = r1(/\$\{[\w\W]*/gm),
                aO = r1(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                ak = r1(/^aria-[\-\w]+$/),
                aT = r1(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                aj = r1(/^(?:\w+script|data):/i),
                aD = r1(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                aN = r1(/^html$/i),
                aR = Object.freeze({
                    __proto__: null,
                    ARIA_ATTR: ak,
                    ATTR_WHITESPACE: aD,
                    CUSTOM_ELEMENT: r1(/^[a-z][.\w]*(-[.\w]+)+$/i),
                    DATA_ATTR: aO,
                    DOCTYPE_NAME: aN,
                    ERB_EXPR: aI,
                    IS_ALLOWED_URI: aT,
                    IS_SCRIPT_OR_DATA: aj,
                    MUSTACHE_EXPR: aA,
                    TMPLIT_EXPR: aC
                }),
                aU = function(t, n) {
                    if ((void 0 === t ? "undefined" : rq(t)) !== "object" || "function" != typeof t.createPolicy) return null;
                    var r = null,
                        a = "data-tt-policy-suffix";
                    n && n.hasAttribute(a) && (r = n.getAttribute(a));
                    var o = "dompurify" + (r ? "#" + r : "");
                    try {
                        return t.createPolicy(o, {
                            createHTML: function(t) {
                                return t
                            },
                            createScriptURL: function(t) {
                                return t
                            }
                        })
                    } catch (t) {
                        return console.warn("TrustedTypes policy " + o + " could not be created."), null
                    }
                },
                aL = function() {
                    return {
                        afterSanitizeAttributes: [],
                        afterSanitizeElements: [],
                        afterSanitizeShadowDOM: [],
                        beforeSanitizeAttributes: [],
                        beforeSanitizeElements: [],
                        beforeSanitizeShadowDOM: [],
                        uponSanitizeAttribute: [],
                        uponSanitizeElement: [],
                        uponSanitizeShadowNode: []
                    }
                },
                aM = function t() {
                    var n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "undefined" == typeof window ? null : window,
                        a = function(n) {
                            return t(n)
                        };
                    if (a.version = "3.3.1", a.removed = [], !r || !r.document || 9 !== r.document.nodeType || !r.Element) return a.isSupported = !1, a;
                    var o = r.document,
                        i = o,
                        l = i.currentScript,
                        u = r.DocumentFragment,
                        c = r.HTMLTemplateElement,
                        s = r.Node,
                        d = r.Element,
                        f = r.NodeFilter,
                        p = r.NamedNodeMap,
                        m = void 0 === p ? r.NamedNodeMap || r.MozNamedAttrMap : p,
                        h = r.HTMLFormElement,
                        y = r.DOMParser,
                        v = r.trustedTypes,
                        b = d.prototype,
                        g = ap(b, "cloneNode"),
                        w = ap(b, "remove"),
                        x = ap(b, "nextSibling"),
                        S = ap(b, "childNodes"),
                        P = ap(b, "parentNode");
                    if ("function" == typeof c) {
                        var E = o.createElement("template");
                        E.content && E.content.ownerDocument && (o = E.content.ownerDocument)
                    }
                    var A = "",
                        I = o.implementation,
                        C = o.createNodeIterator,
                        O = o.createDocumentFragment,
                        k = o.getElementsByTagName,
                        T = i.importNode,
                        j = aL();
                    a.isSupported = "function" == typeof r$ && "function" == typeof P && I && void 0 !== I.createHTMLDocument;
                    var D = aR.MUSTACHE_EXPR,
                        N = aR.ERB_EXPR,
                        R = aR.TMPLIT_EXPR,
                        U = aR.DATA_ATTR,
                        L = aR.ARIA_ATTR,
                        M = aR.IS_SCRIPT_OR_DATA,
                        _ = aR.ATTR_WHITESPACE,
                        F = aR.CUSTOM_ELEMENT,
                        B = aR.IS_ALLOWED_URI,
                        G = null,
                        W = ad({}, rH(am).concat(rH(ah), rH(ay), rH(ab), rH(aw))),
                        z = null,
                        V = ad({}, rH(ax).concat(rH(aS), rH(aP), rH(aE))),
                        H = Object.seal(r2(null, {
                            tagNameCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            },
                            attributeNameCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            },
                            allowCustomizedBuiltInElements: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: !1
                            }
                        })),
                        q = null,
                        K = null,
                        J = Object.seal(r2(null, {
                            tagCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            },
                            attributeCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            }
                        })),
                        $ = !0,
                        Y = !0,
                        X = !1,
                        Q = !0,
                        Z = !1,
                        ee = !0,
                        et = !1,
                        en = !1,
                        er = !1,
                        ea = !1,
                        eo = !1,
                        ei = !1,
                        el = !0,
                        eu = !1,
                        ec = !0,
                        es = !1,
                        ed = {},
                        ef = null,
                        ep = ad({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        em = null,
                        eh = ad({}, ["audio", "video", "img", "source", "image", "track"]),
                        ey = null,
                        ev = ad({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eb = "http://www.w3.org/1998/Math/MathML",
                        eg = "http://www.w3.org/2000/svg",
                        ew = "http://www.w3.org/1999/xhtml",
                        ex = ew,
                        eS = !1,
                        eP = null,
                        eE = ad({}, [eb, eg, ew], an),
                        eA = ad({}, ["mi", "mo", "mn", "ms", "mtext"]),
                        eI = ad({}, ["annotation-xml"]),
                        eC = ad({}, ["title", "style", "font", "a", "script"]),
                        eO = null,
                        ek = ["application/xhtml+xml", "text/html"],
                        eT = null,
                        ej = null,
                        eD = o.createElement("form"),
                        eN = function(t) {
                            return rz(t, RegExp) || rz(t, Function)
                        },
                        eR = function() {
                            var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!ej || ej !== t) {
                                if (t && (void 0 === t ? "undefined" : rq(t)) === "object" || (t = {}), t = af(t), eT = "application/xhtml+xml" === (eO = -1 === ek.indexOf(t.PARSER_MEDIA_TYPE) ? "text/html" : t.PARSER_MEDIA_TYPE) ? an : at, G = al(t, "ALLOWED_TAGS") ? ad({}, t.ALLOWED_TAGS, eT) : W, z = al(t, "ALLOWED_ATTR") ? ad({}, t.ALLOWED_ATTR, eT) : V, eP = al(t, "ALLOWED_NAMESPACES") ? ad({}, t.ALLOWED_NAMESPACES, an) : eE, ey = al(t, "ADD_URI_SAFE_ATTR") ? ad(af(ev), t.ADD_URI_SAFE_ATTR, eT) : ev, em = al(t, "ADD_DATA_URI_TAGS") ? ad(af(eh), t.ADD_DATA_URI_TAGS, eT) : eh, ef = al(t, "FORBID_CONTENTS") ? ad({}, t.FORBID_CONTENTS, eT) : ep, q = al(t, "FORBID_TAGS") ? ad({}, t.FORBID_TAGS, eT) : af({}), K = al(t, "FORBID_ATTR") ? ad({}, t.FORBID_ATTR, eT) : af({}), ed = !!al(t, "USE_PROFILES") && t.USE_PROFILES, $ = !1 !== t.ALLOW_ARIA_ATTR, Y = !1 !== t.ALLOW_DATA_ATTR, X = t.ALLOW_UNKNOWN_PROTOCOLS || !1, Q = !1 !== t.ALLOW_SELF_CLOSE_IN_ATTR, Z = t.SAFE_FOR_TEMPLATES || !1, ee = !1 !== t.SAFE_FOR_XML, et = t.WHOLE_DOCUMENT || !1, ea = t.RETURN_DOM || !1, eo = t.RETURN_DOM_FRAGMENT || !1, ei = t.RETURN_TRUSTED_TYPE || !1, er = t.FORCE_BODY || !1, el = !1 !== t.SANITIZE_DOM, eu = t.SANITIZE_NAMED_PROPS || !1, ec = !1 !== t.KEEP_CONTENT, es = t.IN_PLACE || !1, B = t.ALLOWED_URI_REGEXP || aT, ex = t.NAMESPACE || ew, eA = t.MATHML_TEXT_INTEGRATION_POINTS || eA, eI = t.HTML_INTEGRATION_POINTS || eI, H = t.CUSTOM_ELEMENT_HANDLING || {}, t.CUSTOM_ELEMENT_HANDLING && eN(t.CUSTOM_ELEMENT_HANDLING.tagNameCheck) && (H.tagNameCheck = t.CUSTOM_ELEMENT_HANDLING.tagNameCheck), t.CUSTOM_ELEMENT_HANDLING && eN(t.CUSTOM_ELEMENT_HANDLING.attributeNameCheck) && (H.attributeNameCheck = t.CUSTOM_ELEMENT_HANDLING.attributeNameCheck), t.CUSTOM_ELEMENT_HANDLING && "boolean" == typeof t.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements && (H.allowCustomizedBuiltInElements = t.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements), Z && (Y = !1), eo && (ea = !0), ed && (G = ad({}, aw), z = [], !0 === ed.html && (ad(G, am), ad(z, ax)), !0 === ed.svg && (ad(G, ah), ad(z, aS), ad(z, aE)), !0 === ed.svgFilters && (ad(G, ay), ad(z, aS), ad(z, aE)), !0 === ed.mathMl && (ad(G, ab), ad(z, aP), ad(z, aE))), t.ADD_TAGS && ("function" == typeof t.ADD_TAGS ? J.tagCheck = t.ADD_TAGS : (G === W && (G = af(G)), ad(G, t.ADD_TAGS, eT))), t.ADD_ATTR && ("function" == typeof t.ADD_ATTR ? J.attributeCheck = t.ADD_ATTR : (z === V && (z = af(z)), ad(z, t.ADD_ATTR, eT))), t.ADD_URI_SAFE_ATTR && ad(ey, t.ADD_URI_SAFE_ATTR, eT), t.FORBID_CONTENTS && (ef === ep && (ef = af(ef)), ad(ef, t.FORBID_CONTENTS, eT)), t.ADD_FORBID_CONTENTS && (ef === ep && (ef = af(ef)), ad(ef, t.ADD_FORBID_CONTENTS, eT)), ec && (G["#text"] = !0), et && ad(G, ["html", "head", "body"]), G.table && (ad(G, ["tbody"]), delete q.tbody), t.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof t.TRUSTED_TYPES_POLICY.createHTML) throw ac('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof t.TRUSTED_TYPES_POLICY.createScriptURL) throw ac('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    A = (n = t.TRUSTED_TYPES_POLICY).createHTML("")
                                } else void 0 === n && (n = aU(v, l)), null !== n && "string" == typeof A && (A = n.createHTML(""));
                                r0 && r0(t), ej = t
                            }
                        },
                        eU = ad({}, rH(ah).concat(rH(ay), rH(av))),
                        eL = ad({}, rH(ab).concat(rH(ag))),
                        eM = function(t) {
                            var n = P(t);
                            n && n.tagName || (n = {
                                namespaceURI: ex,
                                tagName: "template"
                            });
                            var r = at(t.tagName),
                                a = at(n.tagName);
                            return !!eP[t.namespaceURI] && (t.namespaceURI === eg ? n.namespaceURI === ew ? "svg" === r : n.namespaceURI === eb ? "svg" === r && ("annotation-xml" === a || eA[a]) : !!eU[r] : t.namespaceURI === eb ? n.namespaceURI === ew ? "math" === r : n.namespaceURI === eg ? "math" === r && eI[a] : !!eL[r] : t.namespaceURI === ew ? (n.namespaceURI !== eg || !!eI[a]) && (n.namespaceURI !== eb || !!eA[a]) && !eL[r] && (eC[r] || !eU[r]) : "application/xhtml+xml" === eO && !!eP[t.namespaceURI])
                        },
                        e_ = function(t) {
                            r9(a.removed, {
                                element: t
                            });
                            try {
                                P(t).removeChild(t)
                            } catch (n) {
                                w(t)
                            }
                        },
                        eF = function(t, n) {
                            try {
                                r9(a.removed, {
                                    attribute: n.getAttributeNode(t),
                                    from: n
                                })
                            } catch (t) {
                                r9(a.removed, {
                                    attribute: null,
                                    from: n
                                })
                            }
                            if (n.removeAttribute(t), "is" === t)
                                if (ea || eo) try {
                                    e_(n)
                                } catch (t) {} else try {
                                    n.setAttribute(t, "")
                                } catch (t) {}
                        },
                        eB = function(t) {
                            var r = null,
                                a = null;
                            if (er) t = "<remove></remove>" + t;
                            else {
                                var i = ar(t, /^[\r\n\t ]+/);
                                a = i && i[0]
                            }
                            "application/xhtml+xml" === eO && ex === ew && (t = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + t + "</body></html>");
                            var l = n ? n.createHTML(t) : t;
                            if (ex === ew) try {
                                r = new y().parseFromString(l, eO)
                            } catch (t) {}
                            if (!r || !r.documentElement) {
                                r = I.createDocument(ex, "template", null);
                                try {
                                    r.documentElement.innerHTML = eS ? A : l
                                } catch (t) {}
                            }
                            var u = r.body || r.documentElement;
                            return (t && a && u.insertBefore(o.createTextNode(a), u.childNodes[0] || null), ex === ew) ? k.call(r, et ? "html" : "body")[0] : et ? r.documentElement : u
                        },
                        eG = function(t) {
                            return C.call(t.ownerDocument || t, t, f.SHOW_ELEMENT | f.SHOW_COMMENT | f.SHOW_TEXT | f.SHOW_PROCESSING_INSTRUCTION | f.SHOW_CDATA_SECTION, null)
                        },
                        eW = function(t) {
                            return rz(t, h) && ("string" != typeof t.nodeName || "string" != typeof t.textContent || "function" != typeof t.removeChild || !rz(t.attributes, m) || "function" != typeof t.removeAttribute || "function" != typeof t.setAttribute || "string" != typeof t.namespaceURI || "function" != typeof t.insertBefore || "function" != typeof t.hasChildNodes)
                        },
                        ez = function(t) {
                            return "function" == typeof s && rz(t, s)
                        };

                    function eV(t, n, r) {
                        r6(t, function(t) {
                            t.call(a, n, r, ej)
                        })
                    }
                    var eH = function(t) {
                            var n = null;
                            if (eV(j.beforeSanitizeElements, t, null), eW(t)) return e_(t), !0;
                            var r = eT(t.nodeName);
                            if (eV(j.uponSanitizeElement, t, {
                                    tagName: r,
                                    allowedTags: G
                                }), ee && t.hasChildNodes() && !ez(t.firstElementChild) && au(/<[/\w!]/g, t.innerHTML) && au(/<[/\w!]/g, t.textContent) || 7 === t.nodeType || ee && 8 === t.nodeType && au(/<[/\w]/g, t.data)) return e_(t), !0;
                            if (!(rz(J.tagCheck, Function) && J.tagCheck(r)) && (!G[r] || q[r])) {
                                if (!q[r] && eK(r) && (rz(H.tagNameCheck, RegExp) && au(H.tagNameCheck, r) || rz(H.tagNameCheck, Function) && H.tagNameCheck(r))) return !1;
                                if (ec && !ef[r]) {
                                    var o = P(t) || t.parentNode,
                                        i = S(t) || t.childNodes;
                                    if (i && o)
                                        for (var l = i.length, u = l - 1; u >= 0; --u) {
                                            var c = g(i[u], !0);
                                            c.__removalCount = (t.__removalCount || 0) + 1, o.insertBefore(c, x(t))
                                        }
                                }
                                return e_(t), !0
                            }
                            return rz(t, d) && !eM(t) || ("noscript" === r || "noembed" === r || "noframes" === r) && au(/<\/no(script|embed|frames)/i, t.innerHTML) ? (e_(t), !0) : (Z && 3 === t.nodeType && (n = t.textContent, r6([D, N, R], function(t) {
                                n = aa(n, t, " ")
                            }), t.textContent !== n && (r9(a.removed, {
                                element: t.cloneNode()
                            }), t.textContent = n)), eV(j.afterSanitizeElements, t, null), !1)
                        },
                        eq = function(t, n, r) {
                            if (el && ("id" === n || "name" === n) && (r in o || r in eD)) return !1;
                            if (Y && !K[n] && au(U, n));
                            else if ($ && au(L, n));
                            else if (rz(J.attributeCheck, Function) && J.attributeCheck(n, t));
                            else if (!z[n] || K[n]) {
                                if (!(eK(t) && (rz(H.tagNameCheck, RegExp) && au(H.tagNameCheck, t) || rz(H.tagNameCheck, Function) && H.tagNameCheck(t)) && (rz(H.attributeNameCheck, RegExp) && au(H.attributeNameCheck, n) || rz(H.attributeNameCheck, Function) && H.attributeNameCheck(n, t)) || "is" === n && H.allowCustomizedBuiltInElements && (rz(H.tagNameCheck, RegExp) && au(H.tagNameCheck, r) || rz(H.tagNameCheck, Function) && H.tagNameCheck(r)))) return !1
                            } else if (ey[n]);
                            else if (au(B, aa(r, _, "")));
                            else if (("src" === n || "xlink:href" === n || "href" === n) && "script" !== t && 0 === ao(r, "data:") && em[t]);
                            else if (X && !au(M, aa(r, _, "")));
                            else if (r) return !1;
                            return !0
                        },
                        eK = function(t) {
                            return "annotation-xml" !== t && ar(t, F)
                        },
                        eJ = function(t) {
                            eV(j.beforeSanitizeAttributes, t, null);
                            var r = t.attributes;
                            if (!(!r || eW(t))) {
                                for (var o = {
                                        attrName: "",
                                        attrValue: "",
                                        keepAttr: !0,
                                        allowedAttributes: z,
                                        forceKeepAttr: void 0
                                    }, i = r.length; i--;) ! function() {
                                    var l = r[i],
                                        u = l.name,
                                        c = l.namespaceURI,
                                        s = l.value,
                                        d = eT(u),
                                        f = "value" === u ? s : ai(s);
                                    if (o.attrName = d, o.attrValue = f, o.keepAttr = !0, o.forceKeepAttr = void 0, eV(j.uponSanitizeAttribute, t, o), f = o.attrValue, eu && ("id" === d || "name" === d) && (eF(u, t), f = "user-content-" + f), ee && au(/((--!?|])>)|<\/(style|title|textarea)/i, f) || "attributename" === d && ar(f, "href")) return eF(u, t);
                                    if (!o.forceKeepAttr) {
                                        if (!o.keepAttr || !Q && au(/\/>/i, f)) return eF(u, t);
                                        Z && r6([D, N, R], function(t) {
                                            f = aa(f, t, " ")
                                        });
                                        var p = eT(t.nodeName);
                                        if (!eq(p, d, f)) return eF(u, t);
                                        if (n && (void 0 === v ? "undefined" : rq(v)) === "object" && "function" == typeof v.getAttributeType)
                                            if (c);
                                            else switch (v.getAttributeType(p, d)) {
                                                case "TrustedHTML":
                                                    f = n.createHTML(f);
                                                    break;
                                                case "TrustedScriptURL":
                                                    f = n.createScriptURL(f)
                                            }
                                        if (f !== s) try {
                                            c ? t.setAttributeNS(c, u, f) : t.setAttribute(u, f), eW(t) ? e_(t) : r8(a.removed)
                                        } catch (n) {
                                            eF(u, t)
                                        }
                                    }
                                }();
                                eV(j.afterSanitizeAttributes, t, null)
                            }
                        },
                        e$ = function t(n) {
                            var r = null,
                                a = eG(n);
                            for (eV(j.beforeSanitizeShadowDOM, n, null); r = a.nextNode();) eV(j.uponSanitizeShadowNode, r, null), eH(r), eJ(r), rz(r.content, u) && t(r.content);
                            eV(j.afterSanitizeShadowDOM, n, null)
                        };
                    return a.sanitize = function(t) {
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            o = null,
                            l = null,
                            c = null,
                            d = null;
                        if ((eS = !t) && (t = "\x3c!--\x3e"), "string" != typeof t && !ez(t))
                            if ("function" == typeof t.toString) {
                                if ("string" != typeof(t = t.toString())) throw ac("dirty is not a string, aborting")
                            } else throw ac("toString is not a function");
                        if (!a.isSupported) return t;
                        if (en || eR(r), a.removed = [], "string" == typeof t && (es = !1), es) {
                            if (t.nodeName) {
                                var f = eT(t.nodeName);
                                if (!G[f] || q[f]) throw ac("root node is forbidden and cannot be sanitized in-place")
                            }
                        } else if (rz(t, s)) 1 === (l = (o = eB("\x3c!----\x3e")).ownerDocument.importNode(t, !0)).nodeType && "BODY" === l.nodeName || "HTML" === l.nodeName ? o = l : o.appendChild(l);
                        else {
                            if (!ea && !Z && !et && -1 === t.indexOf("<")) return n && ei ? n.createHTML(t) : t;
                            if (!(o = eB(t))) return ea ? null : ei ? A : ""
                        }
                        o && er && e_(o.firstChild);
                        for (var p = eG(es ? t : o); c = p.nextNode();) eH(c), eJ(c), rz(c.content, u) && e$(c.content);
                        if (es) return t;
                        if (ea) {
                            if (eo)
                                for (d = O.call(o.ownerDocument); o.firstChild;) d.appendChild(o.firstChild);
                            else d = o;
                            return (z.shadowroot || z.shadowrootmode) && (d = T.call(i, d, !0)), d
                        }
                        var m = et ? o.outerHTML : o.innerHTML;
                        return et && G["!doctype"] && o.ownerDocument && o.ownerDocument.doctype && o.ownerDocument.doctype.name && au(aN, o.ownerDocument.doctype.name) && (m = "<!DOCTYPE " + o.ownerDocument.doctype.name + ">\n" + m), Z && r6([D, N, R], function(t) {
                            m = aa(m, t, " ")
                        }), n && ei ? n.createHTML(m) : m
                    }, a.setConfig = function() {
                        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eR(t), en = !0
                    }, a.clearConfig = function() {
                        ej = null, en = !1
                    }, a.isValidAttribute = function(t, n, r) {
                        return ej || eR({}), eq(eT(t), eT(n), r)
                    }, a.addHook = function(t, n) {
                        "function" == typeof n && r9(j[t], n)
                    }, a.removeHook = function(t, n) {
                        if (void 0 !== n) {
                            var r = r7(j[t], n);
                            return -1 === r ? void 0 : ae(j[t], r, 1)[0]
                        }
                        return r8(j[t])
                    }, a.removeHooks = function(t) {
                        j[t] = []
                    }, a.removeAllHooks = function() {
                        j = aL()
                    }, a
                }(),
                a_ = {
                    ADD_ATTR: ["target"]
                },
                aF = aM();
            aF.addHook("afterSanitizeAttributes", function(t) {
                "A" === t.nodeName && (t.setAttribute("target", "_blank"), t.setAttribute("rel", "noopener noreferrer"))
            });
            var aB = function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = n.shouldOpenLinksInNewTab;
                    return (0, v.useMemo)(function() {
                        return (r ? aF : aM).sanitize(t, a_)
                    }, [t, r])
                },
                aG = function(t) {
                    var n = t.titleText,
                        r = t.bodyText,
                        a = t.primaryButtonText,
                        o = t.secondaryButtonText,
                        i = t.closeLabelText,
                        l = t.onPrimaryButtonClick,
                        u = t.onSecondaryButtonClick,
                        c = t.isModalOpen,
                        s = t.onCloseModal,
                        d = aB(r, {
                            shouldOpenLinksInNewTab: !0
                        });
                    return (0, ep.jsx)(rv, {
                        open: c,
                        onOpenChange: function(t) {
                            t || s()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: i,
                        children: (0, ep.jsxs)(rb, {
                            children: [(0, ep.jsxs)(rg, {
                                className: "flex flex-col gap-large",
                                children: [(0, ep.jsx)(rw, {
                                    children: n
                                }), (0, ep.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: d
                                    }
                                })]
                            }), (0, ep.jsxs)(rx, {
                                className: "flex gap-x-medium",
                                children: [o && u && (0, ep.jsx)(rB, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: u,
                                    className: "grow basis-0",
                                    children: o
                                }), a && l && (0, ep.jsx)(rB, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    onClick: l,
                                    className: "grow basis-0",
                                    children: a
                                })]
                            })]
                        })
                    })
                },
                aW = function(t) {
                    var n = t.isModalOpen,
                        r = t.navigateToAccountSettings,
                        a = t.closeModal,
                        o = t.translate;
                    return (0, ep.jsx)(aG, {
                        titleText: o("UpdateMaturitySettingModal.Label.Title"),
                        bodyText: o("UpdateMaturitySettingModal.Label.Body"),
                        primaryButtonText: o("UpdateMaturitySettingModal.Action.GoToSettings"),
                        secondaryButtonText: o("UpdateMaturitySettingModal.Action.Cancel"),
                        closeLabelText: o("Action.Close"),
                        onPrimaryButtonClick: r,
                        onSecondaryButtonClick: a,
                        isModalOpen: n,
                        onCloseModal: a
                    })
                },
                az = function(t) {
                    var n = t.isModalOpen,
                        r = t.closeModal,
                        a = t.translate;
                    return (0, ep.jsx)(aG, {
                        titleText: a("RestrictedUnplayableModal.Label.Title"),
                        bodyText: a("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: a("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: a("Action.Close"),
                        onSecondaryButtonClick: r,
                        isModalOpen: n,
                        onCloseModal: r
                    })
                },
                aV = function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = !!t && !n,
                        a = (0, g.useQuery)({
                            queryKey: ["ageRecommendation", t],
                            queryFn: function() {
                                return j(t)
                            },
                            enabled: r
                        }),
                        o = a.data,
                        i = a.isError,
                        l = a.isLoading;
                    return {
                        ageRecommendationData: o,
                        hasError: i,
                        isLoading: r && l
                    }
                };

            function aH(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function aq(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return aH(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aH(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aK = function(t) {
                var n, r, a = aq((0, v.useState)(void 0), 2),
                    o = a[0],
                    i = a[1],
                    l = aq((0, v.useState)(!1), 2),
                    u = l[0],
                    c = l[1],
                    s = aq((0, v.useState)(!1), 2),
                    d = s[0],
                    f = s[1];
                (0, v.useEffect)(function() {
                    f(!1), c(!0), T().then(function(t) {
                        i(t.contentAgeRestriction)
                    }).catch(function() {
                        f(!0)
                    }).finally(function() {
                        c(!1)
                    })
                }, []);
                var p = aV(t),
                    m = p.ageRecommendationData,
                    h = p.hasError,
                    y = p.isLoading;
                return {
                    contentAgeRestriction: o,
                    contentMaturityRating: null == m || null == (r = m.ageRecommendationDetails) || null == (n = r.summary.ageRecommendation) ? void 0 : n.contentMaturity,
                    isFetching: u || y,
                    hasError: d || h
                }
            };

            function aJ(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function a$(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function aY(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return aJ(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aJ(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aX = function(t, n, r, a, o, i, l, u) {
                    var c = (0, g.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return k()
                            },
                            staleTime: 6e4
                        }).data,
                        s = aY((0, v.useState)(!1), 2),
                        d = s[0],
                        f = s[1],
                        p = aY((0, v.useState)(!1), 2),
                        m = p[0],
                        h = p[1],
                        b = (0, v.useCallback)(function() {
                            el(t, a, o, i, l, void 0, u)
                        }, [l, i, t, o, a, u]),
                        w = (0, v.useCallback)(function(t, a, o) {
                            var i;
                            return (i = function() {
                                var i, l, u, s, d, p, m;
                                return function(t, n) {
                                    var r, a, o, i = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                        return this
                                    }), l;

                                    function u(u) {
                                        return function(c) {
                                            var s = [u, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                                switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = s;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, a = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                            i.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && i.label < o[1]) {
                                                            i.label = o[1], o = s;
                                                            break
                                                        }
                                                        if (o && i.label < o[2]) {
                                                            i.label = o[2], i.ops.push(s);
                                                            break
                                                        }
                                                        o[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                s = n.call(t, i)
                                            } catch (t) {
                                                s = [6, t], a = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & s[0]) throw s[1];
                                            return {
                                                value: s[0] ? s[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(y) {
                                    switch (y.label) {
                                        case 0:
                                            if (i = function(t) {
                                                    ef(n, t, N.ContextualPlayabilityAgeRecommendationParentalControls, r)
                                                }, u = (null != (l = window.EventTracker) ? l : {}).fireEvent, o || void 0 === t || void 0 === a) return b(), null == u || u(W.PlayButtonUpsellUnknownSettingOrAge), i(z.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === a) return b(), null == u || u(W.PlayButtonUpsellMinimalMaturityRating), i(z.gameLaunchFallbackUpsellName), [2];
                                            if (!(s = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[a])) return b(), null == u || u(W.PlayButtonUpsellAgeNotInMapping), i(z.gameLaunchFallbackUpsellName), [2];
                                            if (!(d = t.options.find(function(t) {
                                                    return t.option.optionValue === s
                                                }))) return [3, 13];
                                            switch (p = d.requirement) {
                                                case "SelfUpdateSetting":
                                                    return [3, 1];
                                                case "ParentalConsent":
                                                    return [3, 2];
                                                case "ContentAgeRestrictionVerification":
                                                    return [3, 7]
                                            }
                                            return [3, 11];
                                        case 1:
                                            return f(!0), null == u || u(W.PlayButtonUpsellSelfUpdateSettingTriggered), i(p), [3, 12];
                                        case 2:
                                            if (null == u || u(W.PlayButtonUpsellAskYourParentTriggered), i(p), !window.Roblox.AccessManagementUpsellV2Service) return null == u || u(W.PlayButtonUpsellParentalConsentError), [3, 12];
                                            y.label = 3;
                                        case 3:
                                            return y.trys.push([3, 5, , 6]), m = (null == c ? void 0 : c.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: n,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: d.option.optionValue
                                                }
                                            }, [4, window.Roblox.AccessManagementUpsellV2Service.startAccessManagementUpsell(m)];
                                        case 4:
                                            return y.sent(), [3, 6];
                                        case 5:
                                            return y.sent(), b(), null == u || u(W.PlayButtonUpsellParentalConsentError), i(z.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return y.trys.push([7, 9, , 10]), null == u || u(W.PlayButtonUpsellAgeRestrictionVerificationTriggered), i(p), [4, ec({
                                                context: H,
                                                pageContext: r
                                            })];
                                        case 8:
                                            return y.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return y.sent(), b(), i(z.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            b(), null == u || u(W.PlayButtonUpsellUnknownRequirement), i(z.gameLaunchFallbackUpsellName), y.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            h(!0), null == u || u(W.PlayButtonUpsellRestrictedUnplayableTriggered), i(z.restrictedUnplayableUpsellName), y.label = 14;
                                        case 14:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    n = arguments;
                                return new Promise(function(r, a) {
                                    var o = i.apply(t, n);

                                    function l(t) {
                                        a$(o, r, a, l, u, "next", t)
                                    }

                                    function u(t) {
                                        a$(o, r, a, l, u, "throw", t)
                                    }
                                    l(void 0)
                                })
                            })()
                        }, [c, b, n, r]),
                        x = (0, v.useCallback)(function() {
                            f(!1)
                        }, []),
                        S = (0, v.useCallback)(function() {
                            h(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: w,
                        isSelfUpdateSettingModalOpen: d,
                        navigateToAccountSettings: (0, v.useCallback)(function() {
                            var t = y.Endpoints.getAbsoluteUrl("/my/account#!/privacy");
                            "undefined" != typeof window && (window.location.href = t, f(!1))
                        }, []),
                        closeSelfUpdateSettingModal: x,
                        isRestrictedUnplayableModalOpen: m,
                        closeRestrictedUnplayableModal: S
                    }
                },
                aQ = function(t) {
                    var n = t.universeId,
                        r = t.buttonClassName,
                        a = t.placeId,
                        o = t.rootPlaceId,
                        i = t.privateServerLinkCode,
                        l = t.gameInstanceId,
                        u = t.eventProperties,
                        c = t.appsFlyerReferralProperties,
                        s = t.pageContext,
                        d = t.translate,
                        f = aK(n),
                        p = f.contentAgeRestriction,
                        m = f.contentMaturityRating,
                        h = f.isFetching,
                        y = f.hasError,
                        g = aX(a, n, s, o, i, l, u, c),
                        w = g.launchPlayButtonUpsell,
                        x = g.isSelfUpdateSettingModalOpen,
                        S = g.navigateToAccountSettings,
                        P = g.closeSelfUpdateSettingModal,
                        E = g.isRestrictedUnplayableModalOpen,
                        A = g.closeRestrictedUnplayableModal,
                        I = (0, v.useCallback)(function(t) {
                            t.preventDefault(), t.stopPropagation(), w(p, m, y)
                        }, [w, p, m, y]);
                    return !y && h ? (0, ep.jsx)(em.Loading, {}) : (0, ep.jsxs)(b().Fragment, {
                        children: [(0, ep.jsx)(ex, {
                            onButtonClick: I,
                            buttonClassName: r
                        }), x && (0, ep.jsx)(aW, {
                            isModalOpen: x,
                            navigateToAccountSettings: S,
                            closeModal: P,
                            translate: d
                        }), E && (0, ep.jsx)(az, {
                            isModalOpen: E,
                            closeModal: A,
                            translate: d
                        })]
                    })
                };
            aQ.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var aZ = (0, eg.withTranslations)(aQ, ew);

            function a0(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function a1(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function a2(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return a0(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a0(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var a3 = function(t, n) {
                    var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        a = (0, g.useQuery)({
                            queryKey: ["purchaseProductData", t, n],
                            queryFn: function() {
                                var r;
                                return (r = function() {
                                    var r;
                                    return function(t, n) {
                                        var r, a, o, i = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                            return this
                                        }), l;

                                        function u(u) {
                                            return function(c) {
                                                var s = [u, c];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                    if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                                    switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = s;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: s[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, a = s[1], s = [0];
                                                            continue;
                                                        case 7:
                                                            s = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                                i.label = s[1];
                                                                break
                                                            }
                                                            if (6 === s[0] && i.label < o[1]) {
                                                                i.label = o[1], o = s;
                                                                break
                                                            }
                                                            if (o && i.label < o[2]) {
                                                                i.label = o[2], i.ops.push(s);
                                                                break
                                                            }
                                                            o[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    s = n.call(t, i)
                                                } catch (t) {
                                                    s = [6, t], a = 0
                                                } finally {
                                                    r = o = 0
                                                }
                                                if (5 & s[0]) throw s[1];
                                                return {
                                                    value: s[0] ? s[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                var o, i;
                                                return [4, Promise.all([(o = [t], I(function() {
                                                    var t;
                                                    return C(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return [4, O.getProductInfo(o)];
                                                            case 1:
                                                                return [2, (void 0 === (t = n.sent().data.data) ? [] : t)[0]]
                                                        }
                                                    })
                                                })()), (i = [n], I(function() {
                                                    var t;
                                                    return C(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return [4, O.getPlaceDetails(i)];
                                                            case 1:
                                                                return [2, (void 0 === (t = n.sent().data) ? [] : t)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (r = a2.apply(void 0, [a.sent(), 2]))[0],
                                                    productDetails: r[1]
                                                }]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        n = arguments;
                                    return new Promise(function(a, o) {
                                        var i = r.apply(t, n);

                                        function l(t) {
                                            a1(i, a, o, l, u, "next", t)
                                        }

                                        function u(t) {
                                            a1(i, a, o, l, u, "throw", t)
                                        }
                                        l(void 0)
                                    })
                                })()
                            },
                            enabled: r,
                            staleTime: 3e4
                        }).data,
                        o = null == a ? void 0 : a.productInfo,
                        i = null == a ? void 0 : a.productDetails;
                    return void 0 === o || void 0 === i ? {
                        isLoading: !0,
                        productInfo: void 0,
                        productDetails: void 0
                    } : {
                        isLoading: !1,
                        productInfo: o,
                        productDetails: i
                    }
                },
                a5 = function(t) {
                    var n = t.buttonWidth,
                        r = t.buttonClassName,
                        a = t.iconClassName,
                        o = t.hideButtonText,
                        i = t.hideButtonIcon,
                        l = t.buttonContent,
                        u = t.onClick,
                        c = t.isPurchasing,
                        s = t.redirectUrl;
                    return s ? (0, ep.jsx)(em.Link, {
                        url: s,
                        className: "purchase-button-link",
                        children: (0, ep.jsxs)(em.Button, {
                            "data-testid": "play-purchase-button",
                            width: n,
                            className: r,
                            onClick: function() {
                                return null
                            },
                            isDisabled: c,
                            children: [!i && (0, ep.jsx)("span", {
                                className: a
                            }), !o && (0, ep.jsx)("span", {
                                className: "btn-text",
                                children: l
                            })]
                        })
                    }) : (0, ep.jsxs)(em.Button, {
                        "data-testid": "play-purchase-button",
                        width: n,
                        className: r,
                        onClick: function(t) {
                            u && !c && u(t)
                        },
                        isDisabled: c,
                        children: [!i && (0, ep.jsx)("span", {
                            className: a
                        }), !o && (0, ep.jsx)("span", {
                            className: "btn-text",
                            children: l
                        })]
                    })
                };

            function a4(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function a6(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            a5.defaultProps = {
                hideButtonText: !1,
                buttonWidth: em.Button.widths.full,
                buttonClassName: "btn-economy-robux-white-lg",
                iconClassName: "icon-robux-white",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var a7 = function(t) {
                    var n, r, a, o = t.universeId,
                        i = t.placeId,
                        l = t.productDetails,
                        u = t.translate,
                        c = t.iconClassName,
                        s = t.buttonWidth,
                        d = t.buttonClassName,
                        f = t.hideButtonText,
                        p = t.redirectPurchaseUrl,
                        m = t.showDefaultPurchaseText,
                        h = t.pageContext,
                        y = (n = (0, v.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    l = !0,
                                    u = !1;
                                try {
                                    for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    u = !0, a = t
                                } finally {
                                    try {
                                        l || null == o.return || o.return()
                                    } finally {
                                        if (u) throw a
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return a4(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a4(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        b = y[0],
                        g = y[1],
                        w = (0, v.useCallback)(function(t) {
                            var n;
                            return (n = function() {
                                var n, r, a, u;
                                return function(t, n) {
                                    var r, a, o, i = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                        return this
                                    }), l;

                                    function u(u) {
                                        return function(c) {
                                            var s = [u, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                                switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = s;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, a = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                            i.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && i.label < o[1]) {
                                                            i.label = o[1], o = s;
                                                            break
                                                        }
                                                        if (o && i.label < o[2]) {
                                                            i.label = o[2], i.ops.push(s);
                                                            break
                                                        }
                                                        o[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                s = n.call(t, i)
                                            } catch (t) {
                                                s = [6, t], a = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & s[0]) throw s[1];
                                            return {
                                                value: s[0] ? s[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            if (t.preventDefault(), t.stopPropagation(), r = null == (n = l.fiatPurchaseData) ? void 0 : n.basePriceId, !i || !r) return [2];
                                            g(!0), c.label = 1;
                                        case 1:
                                            return c.trys.push([1, 3, 4, 5]), ef(o, z.fiatPurchaseUpsellName, N.FiatPurchaseRequired, h), [4, D(i, r)];
                                        case 2:
                                            return (a = c.sent()) && (0, Y.isValidStripeCheckoutUrl)(a) && (window.location.href = a), [3, 5];
                                        case 3:
                                            return c.sent(), null == (u = window.EventTracker) || u.fireEvent(W.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
                                        case 4:
                                            return g(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(a, o) {
                                    var i = n.apply(t, r);

                                    function l(t) {
                                        a6(i, a, o, l, u, "next", t)
                                    }

                                    function u(t) {
                                        a6(i, a, o, l, u, "throw", t)
                                    }
                                    l(void 0)
                                })
                            })()
                        }, [i, l, o, h]);
                    return (0, ep.jsx)(a5, {
                        buttonWidth: s,
                        buttonClassName: d,
                        iconClassName: c,
                        hideButtonText: f,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== m && m ? u(F) : null != (a = null == (r = l.fiatPurchaseData) ? void 0 : r.localizedFiatPrice) ? a : "",
                        onClick: p ? void 0 : w,
                        redirectUrl: p,
                        isPurchasing: b
                    })
                },
                a8 = window.RobloxThumbnails;

            function a9(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }
            var oe = function(t) {
                    var n;
                    return null != (n = null == t ? void 0 : t.price.toString()) ? n : ""
                },
                ot = function(t) {
                    var n, r = t.universeId,
                        a = t.iconClassName,
                        o = t.buttonWidth,
                        i = t.buttonClassName,
                        l = t.hideButtonText,
                        u = t.redirectPurchaseUrl,
                        c = t.productDetails,
                        s = t.productInfo,
                        d = t.translate,
                        f = t.refetchPlayabilityStatus,
                        p = (0, v.useRef)();
                    null != p.current || (p.current = window.RobloxItemPurchase.createItemPurchase());
                    var m = (n = p.current, function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    l = !0,
                                    u = !1;
                                try {
                                    for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    u = !0, a = t
                                } finally {
                                    try {
                                        l || null == o.return || o.return()
                                    } finally {
                                        if (u) throw a
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return a9(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a9(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        h = m[0],
                        y = m[1],
                        g = (0, v.useCallback)(function(t) {
                            t.preventDefault(), t.stopPropagation(), y.start()
                        }, [y]);
                    return (0, ep.jsxs)(b().Fragment, {
                        children: [(0, ep.jsx)(a5, {
                            buttonWidth: o,
                            buttonClassName: i,
                            iconClassName: a,
                            hideButtonText: l,
                            buttonContent: oe(s),
                            onClick: u ? void 0 : g,
                            redirectUrl: u
                        }), (0, ep.jsx)(h, {
                            translate: d,
                            productId: s.productId,
                            expectedPrice: s.price,
                            thumbnail: (0, ep.jsx)(a8.Thumbnail2d, {
                                type: a8.ThumbnailTypes.gameIcon,
                                size: a8.DefaultThumbnailSize,
                                targetId: parseInt(r, 10),
                                imgClassName: "game-card-thumb",
                                format: a8.ThumbnailFormat.jpeg
                            }),
                            assetName: c.name,
                            assetType: "Place",
                            sellerName: c.builder,
                            expectedCurrency: 1,
                            expectedSellerId: s.sellerId,
                            onPurchaseSuccess: f,
                            isPlace: !0
                        })]
                    })
                },
                on = (0, eg.withTranslations)(function(t) {
                    var n = t.translate,
                        r = t.universeId,
                        a = t.placeId,
                        o = t.iconClassName,
                        i = void 0 === o ? "icon-robux-white" : o,
                        l = t.buttonWidth,
                        u = void 0 === l ? em.Button.widths.full : l,
                        c = t.buttonClassName,
                        s = void 0 === c ? "btn-economy-robux-white-lg" : c,
                        d = t.refetchPlayabilityStatus,
                        f = t.hideButtonText,
                        p = void 0 !== f && f,
                        m = t.redirectPurchaseUrl,
                        h = t.playabilityStatus,
                        y = t.showDefaultPurchaseText,
                        v = t.pageContext,
                        b = a3(r, a),
                        g = b.productInfo,
                        w = b.productDetails;
                    return b.isLoading ? (0, ep.jsx)(em.Loading, {}) : "Fiat" == (h === N.FiatPurchaseRequired && (null == w ? void 0 : w.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, ep.jsx)(a7, {
                        universeId: r,
                        placeId: a,
                        iconClassName: i,
                        buttonWidth: u,
                        buttonClassName: s,
                        hideButtonText: p,
                        redirectPurchaseUrl: m,
                        productDetails: w,
                        translate: n,
                        showDefaultPurchaseText: void 0 !== y && y,
                        pageContext: v
                    }) : (0, ep.jsx)(ot, {
                        universeId: r,
                        iconClassName: i,
                        buttonWidth: u,
                        buttonClassName: s,
                        hideButtonText: p,
                        redirectPurchaseUrl: m,
                        productDetails: w,
                        productInfo: g,
                        translate: n,
                        refetchPlayabilityStatus: d
                    })
                }, ew),
                or = function(t) {
                    var n, r, a = new URLSearchParams(window.location.search);
                    return {
                        launchData: null != (n = a.get("launchData")) ? n : t,
                        eventId: null != (r = a.get("eventId")) ? r : void 0
                    }
                },
                oa = (0, eh.withTranslations)(function(t) {
                    var n = t.translate,
                        r = t.universeId,
                        a = t.placeId,
                        o = t.rootPlaceId,
                        i = t.privateServerLinkCode,
                        l = t.gameInstanceId,
                        u = t.eventProperties,
                        c = t.appsFlyerReferralProperties,
                        s = (0, v.useCallback)(function(t) {
                            t.preventDefault(), t.stopPropagation(), es(a, r);
                            var n = or((null == u ? void 0 : u.launchData) != null ? String(u.launchData) : void 0);
                            el(a, o, i, l, u, n, c, "DemoPlayButtonClick")
                        }, [r, a, o, i, l, u, c]),
                        d = n(B) || "Play Demo";
                    return (0, ep.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: s,
                        children: d
                    })
                }, ew),
                oo = (0, eg.withTranslations)(function(t) {
                    var n = t.translate,
                        r = t.iconClassName,
                        a = t.buttonWidth,
                        o = void 0 === a ? em.Button.widths.full : a,
                        i = t.buttonClassName,
                        l = t.hideButtonText;
                    return (0, ep.jsxs)(em.Button, {
                        "data-testid": "play-unplayable-button",
                        width: o,
                        className: void 0 === i ? "btn-common-play-game-unplayable-lg" : i,
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, ep.jsx)("span", {
                            className: void 0 === r ? "icon-status-unavailable-secondary" : r
                        }), !(void 0 !== l && l) && (0, ep.jsx)("span", {
                            className: "btn-text",
                            children: n(_)
                        })]
                    })
                }, ew),
                oi = (0, eg.withTranslations)(function(t) {
                    var n = t.treatmentData,
                        r = t.isModalOpen,
                        a = t.onConfirm,
                        o = t.onDismiss,
                        i = t.translate;
                    return (0, ep.jsx)(aG, {
                        titleText: n.titleText,
                        bodyText: n.bodyText,
                        primaryButtonText: n.primaryActionText,
                        secondaryButtonText: n.secondaryActionText,
                        closeLabelText: i("Action.Close"),
                        onPrimaryButtonClick: a,
                        onSecondaryButtonClick: o,
                        isModalOpen: r,
                        onCloseModal: o
                    })
                }, ew);

            function ol(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }
            var ou = function(t) {
                    return !!t && "string" == typeof t.titleText && t.titleText.length > 0 && "string" == typeof t.bodyText && t.bodyText.length > 0 && "string" == typeof t.primaryActionText && t.primaryActionText.length > 0 && "string" == typeof t.secondaryActionText && t.secondaryActionText.length > 0
                },
                oc = function(t, n, r) {
                    var a, o = (a = (0, v.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(a) || function(t, n) {
                            var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != o) {
                                var i = [],
                                    l = !0,
                                    u = !1;
                                try {
                                    for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    u = !0, a = t
                                } finally {
                                    try {
                                        l || null == o.return || o.return()
                                    } finally {
                                        if (u) throw a
                                    }
                                }
                                return i
                            }
                        }(a, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return ol(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ol(t, n)
                            }
                        }(a, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        i = o[0],
                        l = o[1],
                        u = J(t),
                        c = u.playabilityStatus,
                        s = u.playableUxTreatment,
                        d = u.isFetchingPlayability,
                        f = (0, v.useCallback)(function(n) {
                            ef(t, n, N.Playable, r)
                        }, [t, r]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, v.useCallback)(function() {
                            var t, r, a;
                            if (d) {
                                n(), null == (t = window.EventTracker) || t.fireEvent(W.PlayableUxTreatmentPlayabilityStatusStillLoading), f(z.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (c !== N.Playable || !(null == s ? void 0 : s.treatment)) return void n();
                            if ("reconfirmLaunchModal" !== s.treatment) {
                                n(), null == (r = window.EventTracker) || r.fireEvent(W.PlayableUxTreatmentUnknownTreatment), f(z.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!ou(s.data)) {
                                n(), null == (a = window.EventTracker) || a.fireEvent(W.PlayableUxTreatmentMalformedData), f(z.gameLaunchFallbackUpsellName);
                                return
                            }
                            l(!0), f(z.reconfirmLaunchModalUpsellName)
                        }, [d, c, s, n, f]),
                        playableUxTreatmentModal: (0, v.useMemo)(function() {
                            return i && s && ou(s.data) ? (0, ep.jsx)(oi, {
                                treatmentData: s.data,
                                isModalOpen: i,
                                onConfirm: function() {
                                    l(!1), n()
                                },
                                onDismiss: function() {
                                    l(!1)
                                }
                            }) : null
                        }, [s, i, n])
                    }
                };

            function os(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            var od = function(t) {
                var n = t.universeId,
                    r = t.buttonClassName,
                    a = t.playabilityStatus,
                    o = t.pageContext;
                return (0, ep.jsx)(ex, {
                    onButtonClick: function(t) {
                        var r;
                        return (r = function() {
                            return function(t, n) {
                                var r, a, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                    return this
                                }), l;

                                function u(u) {
                                    return function(c) {
                                        var s = [u, c];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                                case 0:
                                                case 1:
                                                    o = s;
                                                    break;
                                                case 4:
                                                    return i.label++, {
                                                        value: s[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    i.label++, a = s[1], s = [0];
                                                    continue;
                                                case 7:
                                                    s = i.ops.pop(), i.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                        i = 0;
                                                        continue
                                                    }
                                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                        i.label = s[1];
                                                        break
                                                    }
                                                    if (6 === s[0] && i.label < o[1]) {
                                                        i.label = o[1], o = s;
                                                        break
                                                    }
                                                    if (o && i.label < o[2]) {
                                                        i.label = o[2], i.ops.push(s);
                                                        break
                                                    }
                                                    o[2] && i.ops.pop(), i.trys.pop();
                                                    continue
                                            }
                                            s = n.call(t, i)
                                        } catch (t) {
                                            s = [6, t], a = 0
                                        } finally {
                                            r = o = 0
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
                                        t.preventDefault(), t.stopPropagation(), r.label = 1;
                                    case 1:
                                        return r.trys.push([1, 3, , 4]), ef(n, z.ageCheckUpsellName, a, o), [4, ec({
                                            context: V,
                                            pageContext: o
                                        })];
                                    case 2:
                                        return r.sent() && window.location.reload(), [3, 4];
                                    case 3:
                                        return r.sent(), [3, 4];
                                    case 4:
                                        return [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(a, o) {
                                var i = r.apply(t, n);

                                function l(t) {
                                    os(i, a, o, l, u, "next", t)
                                }

                                function u(t) {
                                    os(i, a, o, l, u, "throw", t)
                                }
                                l(void 0)
                            })
                        })()
                    },
                    buttonClassName: r
                })
            };

            function of(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function op(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function om(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            op(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            op(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function oh(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return of(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return of(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oy(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ov = function(t) {
                    var n, r;
                    return {
                        launchData: null != (n = new URLSearchParams(window.location.search).get("launchData")) ? n : t,
                        eventId: null != (r = new URLSearchParams(window.location.search).get("eventId")) ? r : void 0
                    }
                },
                ob = {},
                og = function(t) {
                    var n = t.universeId,
                        r = t.placeId,
                        a = t.rootPlaceId,
                        o = t.privateServerLinkCode,
                        i = t.gameInstanceId,
                        l = t.status,
                        u = t.eventProperties,
                        c = void 0 === u ? ob : u,
                        s = t.appsFlyerReferralProperties,
                        d = void 0 === s ? ob : s,
                        f = t.iconClassName,
                        p = t.buttonWidth,
                        m = void 0 === p ? em.Button.widths.full : p,
                        h = t.buttonClassName,
                        y = t.disableLoadingState,
                        x = t.buttonText,
                        S = void 0 === x ? void 0 : x,
                        P = t.hideIcon,
                        A = t.analyticsCallback,
                        O = void 0 === A ? void 0 : A,
                        T = t.pageContext,
                        j = oh((0, v.useState)(void 0), 2),
                        D = j[0],
                        R = j[1],
                        U = oh((0, v.useState)(void 0), 2),
                        L = U[0],
                        M = U[1],
                        _ = oh((0, v.useState)(void 0), 2),
                        F = _[0],
                        B = _[1],
                        G = oh((0, v.useState)(void 0), 2),
                        z = G[0],
                        V = G[1],
                        H = oh((0, v.useState)(void 0), 2),
                        q = H[0],
                        K = H[1],
                        J = oh((0, v.useState)(void 0), 2),
                        $ = J[0],
                        Y = J[1],
                        X = oh((0, v.useState)(void 0), 2),
                        Z = X[0],
                        et = X[1],
                        er = oh((0, v.useState)(void 0), 2),
                        ea = er[0],
                        eo = er[1],
                        ei = (0, g.useQuery)({
                            queryKey: ["getIsVNGLandingRedirectEnabled"],
                            queryFn: ey.getIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, v.useEffect)(function() {
                        om(function() {
                            var t, r, a;
                            return oy(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return o.trys.push([0, 2, , 3]), [4, om(function() {
                                            var t, r, a, o, i, l, u, c, s, d, f, p, m, h, y, v, b;
                                            return oy(this, function(g) {
                                                switch (g.label) {
                                                    case 0:
                                                        if (t = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, !Q.authenticatedUser.isAuthenticated) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: t,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, k()];
                                                    case 1:
                                                        var x;
                                                        if (a = (r = g.sent()).playButtonOverlayWebFlag, o = r.voiceOptInWebFlag, i = r.cameraOptInWebFlag, l = r.cameraOptInWebFlagU13, u = r.requireExplicitVoiceConsent, c = r.useCameraU13Design, s = r.useVoiceUpsellV2Design, !a && !(o || i)) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: t,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: u,
                                                            useCameraU13Design: c,
                                                            useVoiceUpsellV2Design: s
                                                        }];
                                                        return [4, (x = n, I(function() {
                                                            var t;
                                                            return C(this, function(n) {
                                                                switch (n.label) {
                                                                    case 0:
                                                                        return t = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(E().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(x)
                                                                        }, [4, w.get(t)];
                                                                    case 1:
                                                                        return [2, n.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (f = (d = g.sent()).showAgeVerificationOverlay, p = d.showVoiceOptInOverlay, m = d.showAvatarVideoOptInOverlay, h = d.elegibleToSeeVoiceUpsell, y = d.universePlaceVoiceEnabledSettings, v = !1, b = !1, !eb().getAllValuesForLayer) return [3, 5];
                                                        return [4, eb().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return v = Boolean.apply(void 0, [g.sent().ShouldShowUpsell]), [4, eb().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
                                                    case 4:
                                                        b = Boolean.apply(void 0, [g.sent().ShouldShowUpsell]), g.label = 5;
                                                    case 5:
                                                        return [2, {
                                                            elegibleToSeeVoiceUpsell: h,
                                                            universePlaceVoiceEnabledSettings: y,
                                                            showAgeVerificationOverlay: a && f,
                                                            showVoiceOptInOverlay: o && p,
                                                            showAvatarVideoOptInOverlay: m && (i && v || l && b),
                                                            requireExplicitVoiceConsent: u,
                                                            useCameraU13Design: c,
                                                            useVoiceUpsellV2Design: s
                                                        }]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return R(null != (r = (t = o.sent()).universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice) && r), B(t.elegibleToSeeVoiceUpsell), M(t.showAgeVerificationOverlay), V(t.showVoiceOptInOverlay), K(t.showAvatarVideoOptInOverlay), Y(t.requireExplicitVoiceConsent), et(t.useCameraU13Design), eo(t.useVoiceUpsellV2Design), [3, 3];
                                    case 2:
                                        return o.sent(), null == (a = window.EventTracker) || a.fireEvent(W.PlayButtonShowIdentificationError), B(!1), R(!1), M(!1), V(!1), K(!1), Y(!0), et(!1), eo(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var ec = (0, v.useCallback)(function() {
                            es(r, n);
                            var t = ov(null != c.launchData ? String(c.launchData) : void 0);
                            el(r, a, o, i, c, t, d)
                        }, [r, n, c, d, a, o, i]),
                        ed = oc(n, ec, T),
                        ef = ed.doGameLaunchWithPlayableUxTreatment,
                        eh = ed.playableUxTreatmentModal;
                    return void 0 !== L || void 0 !== y && y ? (0, ep.jsxs)(b().Fragment, {
                        children: [(0, ep.jsxs)(em.Button, {
                            "data-testid": "play-button",
                            width: m,
                            className: void 0 === h ? "btn-common-play-game-lg" : h,
                            onClick: function(t) {
                                return om(function() {
                                    var n;
                                    return oy(this, function(a) {
                                        var o, i, u, c;
                                        switch (a.label) {
                                            case 0:
                                                if (t.preventDefault(), t.stopPropagation(), l !== N.Playable) return [3, 7];
                                                if (F && D && eb().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        eb().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !L) return [3, 2];
                                                return [4, ee(function() {
                                                    return en(this, function(t) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.startVerificationFlow()]
                                                        } catch (t) {
                                                            return [2, [!1, !1]]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return (n = oh.apply(void 0, [a.sent(), 2]))[0], n[1] && M(!1), [3, 6];
                                            case 2:
                                                if (!z) return [3, 4];
                                                return [4, (o = null == $ || $, i = null != ea && ea, ee(function() {
                                                    return en(this, function(t) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.showVoiceOptInOverlay(o, i)]
                                                        } catch (t) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return a.sent() && V(!1), [3, 6];
                                            case 4:
                                                if (!q) return [3, 6];
                                                return [4, (u = null == $ || $, c = null == Z || Z, ee(function() {
                                                    return en(this, function(t) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.showAvatarVideoOptInOverlay(u, c)]
                                                        } catch (t) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 5:
                                                a.sent() && K(!1), a.label = 6;
                                            case 6:
                                                return ef(), [3, 8];
                                            case 7:
                                                l === N.GuestProhibited && (ei ? ey.navigateToLoginWithRedirect() : eu(r, d)), a.label = 8;
                                            case 8:
                                                return O && O(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== P && P) && (0, ep.jsx)("span", {
                                className: void 0 === f ? "icon-common-play" : f
                            }), S && (0, ep.jsx)("span", {
                                className: "play-button-text",
                                children: S
                            })]
                        }), (0, ep.jsx)("div", {
                            id: "id-verification-container"
                        }), eh]
                    }) : (0, ep.jsx)(em.Loading, {})
                },
                ow = function(t) {
                    return (0, ep.jsx)(g.QueryClientProvider, {
                        client: eh.queryClient,
                        children: (0, ep.jsx)(og, function(t) {
                            for (var n = 1; n < arguments.length; n++) {
                                var r = null != arguments[n] ? arguments[n] : {},
                                    a = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(r, t).enumerable
                                }))), a.forEach(function(n) {
                                    var a;
                                    a = r[n], n in t ? Object.defineProperty(t, n, {
                                        value: a,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : t[n] = a
                                })
                            }
                            return t
                        }({}, t))
                    })
                },
                ox = (0, eg.withTranslations)(function(t) {
                    var n = t.translate,
                        r = t.playabilityStatus,
                        a = t.errorClassName,
                        o = t.containerRef,
                        i = n(Object.hasOwn(U, r) ? U[r] : U[N.UnplayableOtherReason]);
                    return (0, ep.jsx)("span", {
                        "data-testid": "play-error",
                        className: void 0 === a ? "error-message" : a,
                        ref: o,
                        children: i
                    })
                }, ew),
                oS = function(t, n) {
                    var r = n.playabilityStatus,
                        a = n.shouldShowVpcPlayButtonUpsells,
                        o = n.shouldShowNoticeAgreementIfPlayable,
                        i = n.unplayableDisplayText;
                    if (void 0 !== r) {
                        if (r === N.Playable && o) return {
                            message: t(L),
                            testId: "play-contextual-message"
                        };
                        if (i) return {
                            message: i,
                            testId: "play-server-message"
                        };
                        if (r !== N.ContextualPlayabilityCoreGated && ed(r, a)) return {
                            message: t(Object.hasOwn(U, r) ? U[r] : U[N.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                oP = window.Roblox["core-scripts"].util.elementVisibility,
                oE = function(t, n) {
                    var r = n.universeId,
                        a = n.playabilityStatus,
                        o = n.pageContext,
                        i = n.attributionId,
                        l = n.contextualMessage,
                        u = (0, v.useRef)(!1);
                    (0, v.useEffect)(function() {
                        u.current = !1
                    }, [r, a, o, i, l]), (0, v.useEffect)(function() {
                        if (t.current && !u.current && l) {
                            var n = null;
                            return n = (0, oP.observeVisibility)({
                                    element: t.current,
                                    threshold: .5
                                }, function(t) {
                                    t && !u.current && (u.current = !0, x.eventStreamService.sendEventWithTarget("playButtonContextualMessageImpression", o, {
                                        universeId: r,
                                        playabilityStatus: a,
                                        contextualMessage: l,
                                        attributionId: i
                                    }), null == n || n(), n = null)
                                }),
                                function() {
                                    null == n || n()
                                }
                        }
                    }, [t, r, a, o, i, l])
                },
                oA = (0, eg.withTranslations)(function(t) {
                    var n = t.translate,
                        r = t.playabilityStatus,
                        a = t.shouldShowVpcPlayButtonUpsells,
                        o = t.unplayableDisplayText,
                        i = t.shouldShowNoticeAgreementIfPlayable,
                        l = t.contextualMessageClassName,
                        u = t.analyticsConfig,
                        c = (0, v.useRef)(null),
                        s = oS(n, {
                            playabilityStatus: r,
                            shouldShowVpcPlayButtonUpsells: a,
                            shouldShowNoticeAgreementIfPlayable: i,
                            unplayableDisplayText: o
                        });
                    return (oE(c, {
                        universeId: u.universeId,
                        playabilityStatus: r,
                        pageContext: u.pageContext,
                        attributionId: u.attributionId,
                        contextualMessage: null == s ? void 0 : s.message
                    }), s) ? (0, ep.jsx)("span", {
                        ref: c,
                        "data-testid": s.testId,
                        className: void 0 === l ? "contextual-message" : l,
                        children: s.message
                    }) : null
                }, ew);

            function oI(t) {
                var n = new(h()).Deferred;
                return y.Hybrid.Game.launchGame(t, function() {
                    n.resolve(t)
                }), n
            }
            var oC = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(t) {
                    var n = !0 === t.isPlayTogetherGame,
                        r = {
                            requestType: y.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: t.placeId.toString(),
                            isPlayTogetherGame: n,
                            browserTrackerId: y.Cookies.getBrowserTrackerId()
                        };
                    return t.joinAttemptId && (r.joinAttemptId = t.joinAttemptId), t.joinAttemptOrigin && (r.joinAttemptOrigin = t.joinAttemptOrigin), oI(r)
                },
                followPlayerIntoGame: function(t) {
                    var n = {
                        requestType: y.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: t.userId.toString(),
                        browserTrackerId: y.Cookies.getBrowserTrackerId()
                    };
                    return t.joinAttemptId && (n.joinAttemptId = t.joinAttemptId), t.joinAttemptOrigin && (n.joinAttemptOrigin = t.joinAttemptOrigin), oI(n)
                },
                joinGameInstance: function(t) {
                    var n = !0 === t.isPlayTogetherGame,
                        r = {
                            requestType: y.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: t.placeId.toString(),
                            instanceId: t.gameId,
                            isPlayTogetherGame: n,
                            browserTrackerId: y.Cookies.getBrowserTrackerId()
                        };
                    return t.joinAttemptId && (r.joinAttemptId = t.joinAttemptId), t.joinAttemptOrigin && (r.joinAttemptOrigin = t.joinAttemptOrigin), oI(r)
                },
                joinPrivateGame: function(t) {
                    var n = {
                        requestType: y.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: t.placeId.toString(),
                        accessCode: t.accessCode,
                        browserTrackerId: y.Cookies.getBrowserTrackerId()
                    };
                    return t.joinAttemptId && (n.joinAttemptId = t.joinAttemptId), t.joinAttemptOrigin && (n.joinAttemptOrigin = t.joinAttemptOrigin), oI(n)
                },
                playTogetherGame: function(t) {
                    var n = {
                        requestType: y.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: t.placeId.toString(),
                        conversationId: t.conversationId.toString(),
                        browserTrackerId: y.Cookies.getBrowserTrackerId()
                    };
                    return t.joinAttemptId && (n.joinAttemptId = t.joinAttemptId), t.joinAttemptOrigin && (n.joinAttemptOrigin = t.joinAttemptOrigin), oI(n)
                }
            };
            h()(document).ready(function() {
                s = new y.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var oO = {
                restrictGuests: function(t) {
                    var n = new(h()).Deferred;
                    return y.CurrentUser.isAuthenticated ? n.resolve(t) : y.Dialog.open({
                        titleText: s.get("Heading.Dialog.SignUpOrLogin"),
                        bodyContent: s.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                        cssClass: "soli-modal",
                        acceptColor: y.Dialog.green,
                        acceptText: s.get("Action.Dialog.SignUp"),
                        declineText: s.get("Action.Dialog.Login"),
                        onDecline: function() {
                            y.FormEvents && y.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                            var t = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                            window.location.href = y.Endpoints ? y.Endpoints.getAbsoluteUrl(t) : t
                        },
                        onAccept: function() {
                            var t;
                            y.FormEvents && y.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), t = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = y.Endpoints ? y.Endpoints.getAbsoluteUrl(t) : t
                        }
                    }), n
                }
            };

            function ok(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            var oT = {
                gameLaunchInterface: null,
                gameLaunchLogger: null,
                initialized: new Promise(function(t) {
                    d = t
                })
            };

            function oj(t, n, r) {
                var a, o, i = (a = function(t) {
                    for (var n = 1; n < arguments.length; n++) {
                        var r = null != arguments[n] ? arguments[n] : {},
                            a = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                            return Object.getOwnPropertyDescriptor(r, t).enumerable
                        }))), a.forEach(function(n) {
                            var a;
                            a = r[n], n in t ? Object.defineProperty(t, n, {
                                value: a,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : t[n] = a
                        })
                    }
                    return t
                }({}, t), o = o = {
                    joinAttemptId: null != n ? n : X.uuidService.generateRandomUuid()
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(a, Object.getOwnPropertyDescriptors(o)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, a)
                    }
                    return r
                })(Object(o)).forEach(function(t) {
                    Object.defineProperty(a, t, Object.getOwnPropertyDescriptor(o, t))
                }), a);
                return r && (i.joinAttemptOrigin = r), i
            }

            function oD(t, n, r) {
                var a, o, i = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    l = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    u = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    c = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    s = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                i && l && (a = {
                    url: "".concat(y.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, o = {
                    gameJoinAttemptId: X.uuidService.generateRandomUuid(),
                    placeId: t
                }, X.httpService.post(a, o)), oT.gameLaunchInterface.editGameInStudio(t, n, r, i && u, c, s)
            }

            function oN(t, n, r, a, o, i, l) {
                var u = {
                    placeId: t,
                    launchData: null == i ? void 0 : i.launchData,
                    eventId: null == i ? void 0 : i.eventId,
                    isPlayTogetherGame: !0 === r,
                    referredByPlayerId: l
                };
                return oT.gameLaunchInterface.isJoinAttemptIdEnabled && (u = oj(u, a, o)), oO.restrictGuests(u).then(oT.gameLaunchInterface.joinMultiplayerGame)
            }
            h().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var t = h()(this);
                    oN(t.attr("placeid"), t.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var t = h()(this);
                    oD(t.attr("placeid"), t.data("universeid"), !!t.data("allowupload"))
                }), this
            }, h()(document).ready(function() {
                h()("body").bindGameLaunch()
            }), Object.assign(oT, {
                authenticationChecker: oO,
                joinMultiplayerGame: oN,
                openStudio: function() {
                    oT.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(t) {
                    oT.gameLaunchInterface.openPluginInStudio(t)
                },
                editGameInStudio: oD,
                followPlayerIntoGame: function(t, n, r) {
                    var a = {
                        userId: t
                    };
                    return oT.gameLaunchInterface.isJoinAttemptIdEnabled && (a = oj(a, n, r)), oO.restrictGuests(a).then(oT.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(t, n, r, a, o, i, l) {
                    var u = {
                        placeId: t,
                        gameId: n,
                        isPlayTogetherGame: !0 === a,
                        referredByPlayerId: l
                    };
                    return oT.gameLaunchInterface.isJoinAttemptIdEnabled && (u = oj(u, o, i)), oO.restrictGuests(u).then(oT.gameLaunchInterface.joinGameInstance)
                },
                joinPrivateGame: function(t, n, r, a, o) {
                    var i;
                    return (i = function() {
                        var i;
                        return function(t, n) {
                            var r, a, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function u(u) {
                                return function(c) {
                                    var s = [u, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                        switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                o = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, a = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < o[1]) {
                                                    i.label = o[1], o = s;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(s);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, i)
                                    } catch (t) {
                                        s = [6, t], a = 0
                                    } finally {
                                        r = o = 0
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
                                    return [4, oT.initialized];
                                case 1:
                                    return l.sent(), i = {
                                        placeId: t,
                                        accessCode: n,
                                        linkCode: r
                                    }, oT.gameLaunchInterface.isJoinAttemptIdEnabled && (i = oj(i, a, o)), [2, oT.gameLaunchInterface.joinPrivateGame(i)]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, a) {
                            var o = i.apply(t, n);

                            function l(t) {
                                ok(o, r, a, l, u, "next", t)
                            }

                            function u(t) {
                                ok(o, r, a, l, u, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                },
                playTogetherGame: function(t, n, r, a) {
                    var o = {
                        placeId: t,
                        conversationId: n
                    };
                    return oT.gameLaunchInterface.isJoinAttemptIdEnabled && (o = oj(o, r, a)), oO.restrictGuests(o).then(oT.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(t) {
                    oT.gameLaunchInterface = t, d()
                },
                setGameLaunchLogger: function(t) {
                    oT.gameLaunchLogger = t
                },
                tryAssetInStudio: function(t) {
                    oT.gameLaunchInterface.tryAssetInStudio(t)
                },
                isJoinAttemptIdEnabled: function() {
                    var t;
                    return null == (t = oT.gameLaunchInterface) ? void 0 : t.isJoinAttemptIdEnabled
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var oR = function(t) {
                    var n, r = "".concat(t, "="),
                        a = null == (n = document.cookie.split("; ").find(function(t) {
                            return t.startsWith(r)
                        })) ? void 0 : n.split("=")[1];
                    return null == a ? null : {
                        name: t,
                        value: decodeURIComponent(a)
                    }
                },
                oU = function() {
                    var t = oR("RBXcb");
                    if (null == t || "" === t.value) return !1;
                    var n = t.value.split("&").find(function(t) {
                        return "GoogleAnalytics" === t.split("=")[0]
                    });
                    return "true" === (null == n ? void 0 : n.split("=")[1])
                },
                oL = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function oM(t, n, r, a, o, i) {
                var l, u, c;
                null !== n && "" !== n && "unknown" !== n && (oL.lastContext = n), y.EventStream.SendEvent(t, oL.lastContext, function(t) {
                    for (var n = 1; n < arguments.length; n++) {
                        var r = null != arguments[n] ? arguments[n] : {},
                            a = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                            return Object.getOwnPropertyDescriptor(r, t).enumerable
                        }))), a.forEach(function(n) {
                            var a;
                            a = r[n], n in t ? Object.defineProperty(t, n, {
                                value: a,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : t[n] = a
                        })
                    }
                    return t
                }({
                    lType: "protocol",
                    pid: r,
                    refuid: a,
                    pg: (l = window.location.pathname.toLowerCase(), u = "profile", -1 !== (c = l.lastIndexOf(u)) && l.length === c + u.length ? u : 0 === l.indexOf("/develop") ? "develop" : 0 === l.indexOf("/discover") ? "games" : "gameDetail"),
                    joinAttemptId: o
                }, null != i && {
                    actionType: i
                }))
            }
            Object.assign(oL, {
                SendGamePlayIntent: function(t, n, r, a, o) {
                    oM("gamePlayIntent", t, n, r, a, o), h()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(t, n) {
                    oM("developIntent", t, n)
                },
                SendInstallBegin: function(t, n) {
                    oM("installBegin", t, n)
                },
                SendInstallSuccess: function(t, n) {
                    oM("installSuccess", t, n)
                },
                SendClientStartAttempt: function(t, n) {
                    oM("clientStartAttempt", t, n)
                },
                SendClientStartSuccessWeb: function(t, n) {
                    oM("clientStartSuccessWeb", t, n)
                },
                SendManualDownloadClick: function(t, n) {
                    oM("manualDownload", t, n)
                }
            });
            var o_ = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                oF = {};
            oF[oT.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], oF[oT.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var oB = {};
            y.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (oB[oT.startClientAttemptedEvent] = "Launch Attempt", oB[oT.startClientSucceededEvent] = "Launch Success"), oB[oT.beginInstallEvent] = "Install Begin", oB[oT.successfulInstallEvent] = "Install Success", oB[oT.manualDownloadEvent] = "Manual Download";
            var oG = {};

            function oW(t) {
                o_.logToConsoleEnabled && console.log(t)
            }

            function oz(t, n) {
                if (o_.logToEphemeralCountersEnabled) {
                    var r, a = h()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === a && (a = "Win32");
                    var o = t;
                    o = (o = o.replace("<os>", a)).replace("<launchmethod>", n), (null == (r = window.EventTracker) ? void 0 : r.fireEvent) && window.EventTracker.fireEvent(o)
                }
            }

            function oV(t, n, r, a) {
                oU() && void 0 !== window.GoogleAnalyticsEvents && o_.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([t, n, r, a])
            }

            function oH(t, n) {
                oW("".concat(t.type, ": ").concat(JSON.stringify(n))), oF[t.type] && h().each(oF[t.type], function(t, r) {
                    oz(r, n.launchMethod)
                }), oB[t.type] && oV(n.launchMethod, oB[t.type], n.params.launchMode, 0), oG[t.type] && oG[t.type](null, n.params.placeId)
            }
            oG[oT.startClientAttemptedEvent] = oL.SendClientStartAttempt, oG[oT.startClientSucceededEvent] = oL.SendClientStartSuccessWeb, oG[oT.beginInstallEvent] = oL.SendInstallBegin, oG[oT.successfulInstallEvent] = oL.SendInstallSuccess, oG[oT.manualDownloadEvent] = oL.SendManualDownloadClick, Object.assign(o_, {
                logToConsole: oW,
                logToEphemeralCounters: oz,
                logToGA: oV
            }), h()(document).ready(function() {
                var t = [oT.startClientAttemptedEvent, oT.startClientFailedEvent, oT.startClientSucceededEvent, oT.beginInstallEvent, oT.successfulInstallEvent, oT.manualDownloadEvent];
                h()(oT).on(t.join(" "), oH)
            });
            var oq = function() {
                    var t = "click";
                    h()("body").on(t, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                        var t, n = h()(this);
                        if ((n.hasClass("VisitButtonPlay") || n.hasClass("VisitButtonPlayGLI")) && (t = "PlayButton"), t) {
                            var r = h()(this).attr("placeid"),
                                a = y.UrlParser ? y.UrlParser.getParameterValueByName("rbxp") : null;
                            oL.SendGamePlayIntent(t, r, a)
                        }
                    }), h()("body").on(t, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                        var t = h()(this).attr("placeid");
                        oL.SendDevelopIntent("Edit", t)
                    }), h()("#rbx-running-games").on(t, ".rbx-game-server-item .rbx-game-server-join", function() {
                        var t = h()(this).data("placeid");
                        t && oL.SendGamePlayIntent("JoinInstance", t)
                    }), h()("#rbx-friends-running-games").on(t, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                        var t = h()(this).data("placeid");
                        t && oL.SendGamePlayIntent("JoinInstance", t)
                    }), h()("#game-instances").on(t, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                        var t = h()(this).data("placeid");
                        t && oL.SendGamePlayIntent("PrivateServer", t)
                    })
                },
                oK = window.Roblox["core-scripts"].meta.device,
                oJ = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}'),
                o$ = window.Roblox["core-scripts"].endpoints;

            function oY(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }
            var oX = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                oQ = ["Feature.DownloadLanding", "Common.VisitGame"],
                oZ = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, o$.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, o$.getAbsoluteUrl)("/download/client?os=mac"),
                    androidAppDownloadLabel: "Action.DownloadAndroidApp",
                    amazonStoreLink: "Link.AmazonStoreRobloxApp",
                    googlePlayStoreLink: "Link.GooglePlayStoreRobloxApp",
                    iOSDownloadLabel: "Action.DownloadiOSApp",
                    appleAppStoreLink: "Link.AppleAppStoreRobloxApp",
                    downloadConfirmationHeader: "Heading.DownloadConfirmation",
                    followInstallStepsLabel: "Label.FollowInstallSteps",
                    retryDownloadLabel: "Label.RetryDownload",
                    installInstructionsHeader: "Heading.InstallInstructions",
                    mobileAppDownloadOptionHeading: "Heading.MobileAppDownloadOption",
                    mobileAppQrCodeLabel: "Label.MobileAppQrCode"
                },
                o0 = ["Response.Dialog.PcChromeFirstInstruction", "Response.Dialog.PcChromeSecondInstruction", "Response.Dialog.PcChromeThirdInstruction"],
                o1 = ["Response.Dialog.PcEdgeFirstInstruction", "Response.Dialog.PcEdgeSecondInstruction", "Blank"],
                o2 = ["Response.Dialog.PcFirefoxFirstInstruction", "Response.Dialog.PcFirefoxSecondInstruction", "Response.Dialog.PcFirefoxThirdInstruction"],
                o3 = ["Response.Dialog.MacChromeFirstInstruction", "Response.Dialog.MacChromeSecondInstruction", "Response.Dialog.MacChromeThirdInstruction"],
                o5 = ["Response.Dialog.MacFirefoxFirstInstruction", "Response.Dialog.MacFirefoxSecondInstruction", "Response.Dialog.MacFirefoxThirdInstruction"],
                o4 = ["Response.Dialog.MacSafariFirstInstruction", "Response.Dialog.MacSafariSecondInstruction", "Response.Dialog.MacSafariThirdInstruction"],
                o6 = (oY(f = {}, oX.WindowsDirectDownload, {
                    href: oZ.windowsDownloadLink,
                    title: oZ.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), oY(f, oX.MacDirectDownload, {
                    href: oZ.macDownloadLink,
                    title: oZ.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), oY(f, oX.AmazonAppStore, {
                    href: oZ.amazonStoreLink,
                    title: oZ.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), oY(f, oX.GooglePlayStore, {
                    href: oZ.googlePlayStoreLink,
                    title: oZ.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), oY(f, oX.AppleAppStore, {
                    href: oZ.appleAppStoreLink,
                    title: oZ.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), f),
                o7 = window.Roblox["core-scripts"].eventStream,
                o8 = function(t) {
                    return t.toLowerCase().includes("firefox")
                },
                o9 = function() {
                    return navigator.userAgent
                },
                ie = function(t) {
                    var n, r = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != r) {
                        var a = oX[r];
                        if (null != a) return a
                    }
                    if (!t) return oX.Unknown;
                    var o = oK.getDeviceMeta();
                    return (null == o ? void 0 : o.isIosDevice) ? oX.AppleAppStore : (n = t, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(n)) ? oX.AmazonAppStore : (null == o ? void 0 : o.isAndroidDevice) ? oX.GooglePlayStore : oK.isMac() ? oX.MacDirectDownload : oK.isWindows() ? oX.WindowsDirectDownload : oX.Unknown
                },
                it = function() {
                    var t = o9();
                    return oK.isMac() ? o8(t) ? o5 : !/apple/i.exec(navigator.vendor) || /crios/i.exec(navigator.userAgent) || /fxios/i.exec(navigator.userAgent) || /Opera|OPT\//.exec(navigator.userAgent) ? o3 : o4 : o8(t) ? o2 : window.navigator.userAgent.includes("Edge/") ? o1 : o0
                },
                ir = function(t) {
                    (0, o7.sendEventWithTarget)(o7.eventTypes.formInteraction, "downloadV2", {
                        field: "".concat(t, "DownloadLink"),
                        aType: "click"
                    })
                },
                ia = function(t) {
                    return t
                };

            function io(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function ii(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function il(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            ii(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            ii(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function iu(t, n) {
                if (!(t instanceof n)) throw TypeError("Cannot call a class as a function")
            }

            function ic(t, n) {
                for (var r = 0; r < n.length; r++) {
                    var a = n[r];
                    a.enumerable = a.enumerable || !1, a.configurable = !0, "value" in a && (a.writable = !0), Object.defineProperty(t, a.key, a)
                }
            }

            function is(t, n, r) {
                return n && ic(t.prototype, n), r && ic(t, r), t
            }

            function id(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function ip(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function im(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ih = function() {
                    function t(n) {
                        iu(this, t), id(this, "value", void 0), this.value = n
                    }
                    return is(t, [{
                        key: "cast",
                        value: function() {
                            return this
                        }
                    }, {
                        key: "isOk",
                        value: function() {
                            return !0
                        }
                    }, {
                        key: "isErr",
                        value: function() {
                            return !1
                        }
                    }, {
                        key: "map",
                        value: function(n) {
                            return new t(n(this.value))
                        }
                    }, {
                        key: "mapErr",
                        value: function(t) {
                            return this.cast()
                        }
                    }, {
                        key: "andThen",
                        value: function(t) {
                            return t(this.value)
                        }
                    }, {
                        key: "andThenAsync",
                        value: function(t) {
                            return t(this.value)
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return this.cast()
                        }
                    }, {
                        key: "orElseAsync",
                        value: function(t) {
                            return iv.fromResult(this.cast())
                        }
                    }, {
                        key: "inspect",
                        value: function(t) {
                            return t(this.value), this
                        }
                    }, {
                        key: "inspectErr",
                        value: function(t) {
                            return this
                        }
                    }, {
                        key: "match",
                        value: function(t, n) {
                            return t(this.value)
                        }
                    }, {
                        key: "getOrDefault",
                        value: function(t) {
                            return this.value
                        }
                    }, {
                        key: "getOrNull",
                        value: function() {
                            return this.value
                        }
                    }, {
                        key: "getOrElse",
                        value: function(t) {
                            return this.value
                        }
                    }, {
                        key: "getOrThrow",
                        value: function() {
                            return this.value
                        }
                    }, {
                        key: "getErrOrNull",
                        value: function() {
                            return null
                        }
                    }]), t
                }(),
                iy = function() {
                    function t(n) {
                        iu(this, t), id(this, "error", void 0), this.error = n
                    }
                    return is(t, [{
                        key: "cast",
                        value: function() {
                            return this
                        }
                    }, {
                        key: "isOk",
                        value: function() {
                            return !1
                        }
                    }, {
                        key: "isErr",
                        value: function() {
                            return !0
                        }
                    }, {
                        key: "map",
                        value: function(t) {
                            return this.cast()
                        }
                    }, {
                        key: "mapErr",
                        value: function(n) {
                            return new t(n(this.error))
                        }
                    }, {
                        key: "andThen",
                        value: function(t) {
                            return this.cast()
                        }
                    }, {
                        key: "andThenAsync",
                        value: function(t) {
                            return iv.fromResult(this.cast())
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return t(this.error)
                        }
                    }, {
                        key: "orElseAsync",
                        value: function(t) {
                            return t(this.error)
                        }
                    }, {
                        key: "inspect",
                        value: function(t) {
                            return this
                        }
                    }, {
                        key: "inspectErr",
                        value: function(t) {
                            return t(this.error), this
                        }
                    }, {
                        key: "match",
                        value: function(t, n) {
                            return n(this.error)
                        }
                    }, {
                        key: "getOrDefault",
                        value: function(t) {
                            return t
                        }
                    }, {
                        key: "getOrNull",
                        value: function() {
                            return null
                        }
                    }, {
                        key: "getOrElse",
                        value: function(t) {
                            return t()
                        }
                    }, {
                        key: "getOrThrow",
                        value: function() {
                            throw this.error
                        }
                    }, {
                        key: "getErrOrNull",
                        value: function() {
                            return this.error
                        }
                    }]), t
                }();
            (p || (p = {})).all = function(t) {
                var n = t.findIndex(function(t) {
                    return t.isErr()
                });
                return -1 === n ? new ih(t.map(function(t) {
                    return t.getOrNull()
                })) : t[n]
            };
            var iv = function() {
                function t(n) {
                    iu(this, t), id(this, "promise", void 0), this.promise = n
                }
                return is(t, [{
                    key: "map",
                    value: function(n) {
                        return new t(this.promise.then(function(t) {
                            return il(function() {
                                var r, a;
                                return im(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!t.isOk()) return [3, 2];
                                            return a = ih.bind, [4, n(t.value)];
                                        case 1:
                                            return r = new(a.apply(ih, [void 0, o.sent()])), [3, 3];
                                        case 2:
                                            r = t.cast(), o.label = 3;
                                        case 3:
                                            return [2, r]
                                    }
                                })
                            })()
                        }))
                    }
                }, {
                    key: "mapErr",
                    value: function(n) {
                        return new t(this.promise.then(function(t) {
                            return il(function() {
                                var r, a;
                                return im(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!t.isErr()) return [3, 2];
                                            return a = iy.bind, [4, n(t.error)];
                                        case 1:
                                            return r = new(a.apply(iy, [void 0, o.sent()])), [3, 3];
                                        case 2:
                                            r = t.cast(), o.label = 3;
                                        case 3:
                                            return [2, r]
                                    }
                                })
                            })()
                        }))
                    }
                }, {
                    key: "andThen",
                    value: function(n) {
                        return new t(this.promise.then(function(r) {
                            if (r.isErr()) return r.cast();
                            var a = n(r.value);
                            return ip(a, t) ? a.promise : a
                        }))
                    }
                }, {
                    key: "orElse",
                    value: function(n) {
                        return new t(this.promise.then(function(r) {
                            if (r.isOk()) return r.cast();
                            var a = n(r.error);
                            return ip(a, t) ? a.promise : a
                        }))
                    }
                }, {
                    key: "then",
                    value: function(t, n) {
                        return this.promise.then(t, n)
                    }
                }, {
                    key: "inspect",
                    value: function(n) {
                        return new t(this.promise.then(function(t) {
                            return t.isOk() && n(t.value), t
                        }))
                    }
                }, {
                    key: "inspectErr",
                    value: function(n) {
                        return new t(this.promise.then(function(t) {
                            return t.isErr() && n(t.error), t
                        }))
                    }
                }, {
                    key: "match",
                    value: function(t, n) {
                        return this.promise.then(function(r) {
                            return r.match(t, n)
                        })
                    }
                }, {
                    key: "getOrDefault",
                    value: function(t) {
                        return this.promise.then(function(n) {
                            return n.getOrDefault(t)
                        })
                    }
                }, {
                    key: "getOrNull",
                    value: function() {
                        return this.promise.then(function(t) {
                            return t.getOrNull()
                        })
                    }
                }, {
                    key: "getOrElse",
                    value: function(t) {
                        return this.promise.then(function(n) {
                            return n.getOrElse(t)
                        })
                    }
                }, {
                    key: "getOrThrow",
                    value: function() {
                        return this.promise.then(function(t) {
                            return t.getOrThrow()
                        })
                    }
                }, {
                    key: "getErrOrNull",
                    value: function() {
                        return this.promise.then(function(t) {
                            return t.getErrOrNull()
                        })
                    }
                }], [{
                    key: "fromResult",
                    value: function(n) {
                        return new t(Promise.resolve(n))
                    }
                }, {
                    key: "fromPromise",
                    value: function(n, r) {
                        return new t(n.then(function(t) {
                            return new ih(t)
                        }).catch(function(t) {
                            return new iy(r(t))
                        }))
                    }
                }, {
                    key: "fromPromiseResult",
                    value: function(n) {
                        return new t(n)
                    }
                }, {
                    key: "fromExecutor",
                    value: function(n) {
                        return new t(new Promise(function(t) {
                            n(t)
                        }))
                    }
                }, {
                    key: "from",
                    value: function(n) {
                        return ip(n, t) ? n : ip(n, Promise) ? t.fromPromiseResult(n) : t.fromResult(n)
                    }
                }, {
                    key: "fn",
                    value: function(n) {
                        return function() {
                            for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                            return t.fromPromiseResult(n.apply(void 0, function(t) {
                                if (Array.isArray(t)) return io(t)
                            }(a) || function(t) {
                                if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                            }(a) || function(t, n) {
                                if (t) {
                                    if ("string" == typeof t) return io(t, void 0);
                                    var r = Object.prototype.toString.call(t).slice(8, -1);
                                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return io(t, n)
                                }
                            }(a) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()))
                        }
                    }
                }, {
                    key: "all",
                    value: function(n) {
                        return new t(Promise.all(n).then(p.all))
                    }
                }]), t
            }();

            function ib(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }
            var ig = function() {
                var t;

                function n(t, r) {
                    if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                    ib(this, "url", void 0), ib(this, "searchParams", void 0), this.url = t, this.searchParams = r
                }
                return t = [{
                        key: "href",
                        get: function() {
                            return this.url.href
                        }
                    }, {
                        key: "scheme",
                        get: function() {
                            return this.url.protocol
                        }
                    }, {
                        key: "authority",
                        get: function() {
                            return this.url.host
                        }
                    }, {
                        key: "host",
                        get: function() {
                            return this.url.hostname
                        }
                    }, {
                        key: "port",
                        get: function() {
                            return this.url.port
                        }
                    }, {
                        key: "path",
                        get: function() {
                            return this.url.pathname
                        }
                    }, {
                        key: "query",
                        get: function() {
                            return this.url.search
                        }
                    }, {
                        key: "fragment",
                        get: function() {
                            return this.url.hash
                        }
                    }, {
                        key: "toMutable",
                        value: function() {
                            return new URL(this.url)
                        }
                    }, {
                        key: "toString",
                        value: function() {
                            return this.url.toString()
                        }
                    }, {
                        key: "toJson",
                        value: function() {
                            return this.url.toJSON()
                        }
                    }],
                    function(t, n) {
                        for (var r = 0; r < n.length; r++) {
                            var a = n[r];
                            a.enumerable = a.enumerable || !1, a.configurable = !0, "value" in a && (a.writable = !0), Object.defineProperty(t, a.key, a)
                        }
                    }(n.prototype, t), n
            }();

            function iw(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function ix(t, n) {
                for (var r = 0; r < n.length; r++) {
                    var a = n[r];
                    a.enumerable = a.enumerable || !1, a.configurable = !0, "value" in a && (a.writable = !0), Object.defineProperty(t, a.key, a)
                }
            }

            function iS(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function iP(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function iE(t) {
                return function(t) {
                    if (Array.isArray(t)) return iw(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || iA(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iA(t, n) {
                if (t) {
                    if ("string" == typeof t) return iw(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iw(t, n)
                }
            }
            var iI = function(t) {
                    return ia(new URLSearchParams(t))
                },
                iC = ["__proto__", "prototype", "constructor"],
                iO = function(t) {
                    return iI(t.entries().filter(function(t) {
                        var n = function(t) {
                                if (Array.isArray(t)) return t
                            }(t) || function(t, n) {
                                var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                                if (null != o) {
                                    var i = [],
                                        l = !0,
                                        u = !1;
                                    try {
                                        for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                    } catch (t) {
                                        u = !0, a = t
                                    } finally {
                                        try {
                                            l || null == o.return || o.return()
                                        } finally {
                                            if (u) throw a
                                        }
                                    }
                                    return i
                                }
                            }(t, 2) || iA(t, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = n[0],
                            a = n[1];
                        return !iC.includes(r) && !iC.includes(a)
                    }).toArray())
                },
                ik = function() {
                    var t, n;

                    function r(t) {
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        iS(this, "searchParams", void 0), this.searchParams = t
                    }
                    return t = [{
                        key: "size",
                        get: function() {
                            return this.searchParams.size
                        }
                    }, {
                        key: "get",
                        value: function(t) {
                            return this.searchParams.get(t)
                        }
                    }, {
                        key: "getAll",
                        value: function(t) {
                            return this.searchParams.getAll(t)
                        }
                    }, {
                        key: "has",
                        value: function(t, n) {
                            return this.searchParams.has(t, n)
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(t, n) {
                            var a = iI(this.searchParams);
                            return a.append(t, n), r.fromUnique(a)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(t) {
                            var n = iP(t, URLSearchParams) || iP(t, r) || Array.isArray(t) ? t : Object.entries(t);
                            return r.new(iE(this.searchParams).concat(iE(n)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(t, n) {
                            var a = iI(this.searchParams);
                            return a.set(t, n), r.fromUnique(a)
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(t, n) {
                            if (this.searchParams.has(t, n)) {
                                var a = iI(this.searchParams);
                                return a.delete(t, n), r.fromUnique(a)
                            }
                            return this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var t = iI(this.searchParams);
                            return t.sort(), r.fromUnique(t)
                        }
                    }, {
                        key: "toMutable",
                        value: function() {
                            return new URLSearchParams(this.searchParams)
                        }
                    }, {
                        key: "toString",
                        value: function() {
                            return this.searchParams.toString()
                        }
                    }, {
                        key: Symbol.iterator,
                        value: function() {
                            return this.searchParams[Symbol.iterator]()
                        }
                    }, {
                        key: "entries",
                        value: function() {
                            return this.searchParams.entries()
                        }
                    }, {
                        key: "keys",
                        value: function() {
                            return this.searchParams.keys()
                        }
                    }, {
                        key: "values",
                        value: function() {
                            return this.searchParams.values()
                        }
                    }], n = [{
                        key: "fromUnique",
                        value: function(t) {
                            return new r(t)
                        }
                    }, {
                        key: "internalFromUniqueURLSearchParams",
                        value: function(t) {
                            return r.fromUnique(t)
                        }
                    }, {
                        key: "new",
                        value: function(t) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                            if (iP(t, r)) return t;
                            var a = iI(t);
                            return r.fromUnique(n ? iO(a) : a)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return r.fromUnique(n ? iO(t) : iI(t))
                        }
                    }, {
                        key: "parse",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                a = iI(t);
                            return r.fromUnique(n ? iO(a) : a)
                        }
                    }], t && ix(r.prototype, t), n && ix(r, n), r
                }();

            function iT(t, n, r) {
                return (iT = iR() ? Reflect.construct : function(t, n, r) {
                    var a = [null];
                    a.push.apply(a, n);
                    var o = new(Function.bind.apply(t, a));
                    return r && iD(o, r.prototype), o
                }).apply(null, arguments)
            }

            function ij(t) {
                return (ij = Object.setPrototypeOf ? Object.getPrototypeOf : function(t) {
                    return t.__proto__ || Object.getPrototypeOf(t)
                })(t)
            }

            function iD(t, n) {
                return (iD = Object.setPrototypeOf || function(t, n) {
                    return t.__proto__ = n, t
                })(t, n)
            }

            function iN(t) {
                var n = "function" == typeof Map ? new Map : void 0;
                return (iN = function(t) {
                    if (null === t || -1 === Function.toString.call(t).indexOf("[native code]")) return t;
                    if ("function" != typeof t) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== n) {
                        if (n.has(t)) return n.get(t);
                        n.set(t, r)
                    }

                    function r() {
                        return iT(t, arguments, ij(this).constructor)
                    }
                    return r.prototype = Object.create(t.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), iD(r, t)
                })(t)
            }

            function iR() {
                try {
                    var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (t) {}
                return (iR = function() {
                    return !!t
                })()
            }
            iS(ik, "empty", ik.fromUnique(iI(""))), iN(Error), iN(Error);
            var iU = function(t) {
                return ia(new URL(t))
            };

            function iL(t, n) {
                for (var r = 0; r < n.length; r++) {
                    var a = n[r];
                    a.enumerable = a.enumerable || !1, a.configurable = !0, "value" in a && (a.writable = !0), Object.defineProperty(t, a.key, a)
                }
            }

            function iM(t) {
                return (iM = Object.setPrototypeOf ? Object.getPrototypeOf : function(t) {
                    return t.__proto__ || Object.getPrototypeOf(t)
                })(t)
            }

            function i_(t, n) {
                return (i_ = Object.setPrototypeOf || function(t, n) {
                    return t.__proto__ = n, t
                })(t, n)
            }

            function iF() {
                try {
                    var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (t) {}
                return (iF = function() {
                    return !!t
                })()
            }
            var iB = function(t) {
                    var n, r;
                    if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");

                    function a(t, n) {
                        var r, o;
                        if (!(this instanceof a)) throw TypeError("Cannot call a class as a function");
                        return r = a, o = [t, n], r = iM(r),
                            function(t, n) {
                                var r;
                                if (n && ("object" == ((r = n) && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof n)) return n;
                                if (void 0 === t) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return t
                            }(this, iF() ? Reflect.construct(r, o || [], iM(this).constructor) : r.apply(this, o))
                    }
                    return a.prototype = Object.create(t && t.prototype, {
                        constructor: {
                            value: a,
                            writable: !0,
                            configurable: !0
                        }
                    }), t && i_(a, t), n = [{
                        key: "with",
                        value: function(t) {
                            var n = t.scheme,
                                r = t.host,
                                o = t.port,
                                i = t.path,
                                l = t.searchParams,
                                u = t.fragment;
                            if (null == n && null == r && null == o && null == i && null == l && null == u) return this;
                            var c = iU(this.url);
                            if (null != n && (c.protocol = n), null != r && (c.hostname = r), null != o && (c.port = "number" == typeof o ? o.toString() : o), null != i && (c.pathname = i), null != u && (c.hash = u), null != l) {
                                var s = ik.new(l);
                                return c.search = s.toString(), new a(c, s)
                            }
                            return new a(c, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(t) {
                            var n = iU(this.url);
                            return n.protocol = t, new a(n, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(t) {
                            var n = iU(this.url);
                            return n.hostname = t, new a(n, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(t) {
                            var n = iU(this.url);
                            return n.port = "number" == typeof t ? t.toString() : t, new a(n, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(t) {
                            var n = iU(this.url);
                            return n.pathname = t, new a(n, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(t) {
                            var n = ik.new(t),
                                r = iU(this.url);
                            return r.search = n.toString(), new a(r, n)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(t) {
                            var n = this.searchParams.copyAndAppendAll(t),
                                r = iU(this.url);
                            return r.search = n.toString(), new a(r, n)
                        }
                    }, {
                        key: "withFragment",
                        value: function(t) {
                            var n = iU(this.url);
                            return n.hash = t, new a(n, this.searchParams)
                        }
                    }], r = [{
                        key: "new",
                        value: function(t) {
                            t.password = "", t.username = "";
                            var n = ik.internalFromUniqueURLSearchParams(ia(t.searchParams));
                            return new a(t, n)
                        }
                    }, {
                        key: "fromURL",
                        value: function(t) {
                            return a.new(iU(t))
                        }
                    }, {
                        key: "parse",
                        value: function(t) {
                            try {
                                var n;
                                return n = a.new(ia(new URL(t))), new ih(n)
                            } catch (t) {
                                return new iy(t)
                            }
                        }
                    }], n && iL(a.prototype, n), r && iL(a, r), a
                }(ig),
                iG = function(t) {
                    return Object.values(oX).some(function(n) {
                        return n === t
                    })
                },
                iW = function(t) {
                    if (null != t) {
                        if ("number" == typeof t) return iG(t) && o6[t] ? t : void 0;
                        var n = oX[t];
                        if (null != n && o6[n]) return n;
                        var r = Number(t);
                        if (Number.isInteger(r) && iG(r) && o6[r]) return r
                    }
                },
                iz = function() {
                    var t, n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        a = r.downloadTypeOverride,
                        o = r.translate,
                        i = null != (t = iW(a)) ? t : ie(o9()),
                        l = o6[i];
                    if (l) {
                        var u = l.isDirectDownload ? l.href : null != (n = null == o ? void 0 : o(l.href)) ? n : l.href,
                            c = iB.parse(u);
                        if (!c.isErr()) return {
                            downloadType: i,
                            link: l,
                            isDirectDownload: l.isDirectDownload,
                            href: c.value,
                            icon: l.icon,
                            legacyIcon: l.legacyIcon
                        }
                    }
                },
                iV = function(t, n) {
                    ir(t.link.name)
                };

            function iH(t) {
                var n = t.translate,
                    r = t.downloadLink,
                    a = t.showQrCode,
                    o = it();
                return (0, ep.jsxs)("div", {
                    children: [(0, ep.jsx)("h1", {
                        children: n(oZ.downloadConfirmationHeader)
                    }), (0, ep.jsxs)("div", {
                        className: "instructions-description",
                        children: [(0, ep.jsx)("div", {
                            children: n(oZ.followInstallStepsLabel)
                        }), (0, ep.jsx)("div", {
                            dangerouslySetInnerHTML: {
                                __html: n(oZ.retryDownloadLabel, {
                                    startLink: '<a href="'.concat(r.isDirectDownload ? r.href : n(r.href), '">'),
                                    endLink: "</a>"
                                })
                            }
                        })]
                    }), (0, ep.jsxs)("div", {
                        className: "section install-instructions",
                        children: [(0, ep.jsx)("div", {
                            className: "col-xs-6",
                            children: (0, ep.jsxs)("div", {
                                className: "section-content",
                                children: [(0, ep.jsx)("h3", {
                                    children: n(oZ.installInstructionsHeader)
                                }), (0, ep.jsx)("ol", {
                                    type: "1",
                                    children: o.map(function(t) {
                                        return (0, ep.jsx)("li", {
                                            children: (0, ep.jsx)("p", {
                                                dangerouslySetInnerHTML: {
                                                    __html: n(t, {
                                                        startBold: "<b>",
                                                        endBold: "</b>"
                                                    })
                                                }
                                            })
                                        }, t)
                                    })
                                })]
                            })
                        }), void 0 === a || a ? (0, ep.jsx)("div", {
                            className: "col-xs-6",
                            children: (0, ep.jsxs)("div", {
                                className: "section-content",
                                children: [(0, ep.jsx)("h3", {
                                    children: n(oZ.mobileAppDownloadOptionHeading)
                                }), (0, ep.jsx)("p", {
                                    className: "qr-tagline",
                                    children: n(oZ.mobileAppQrCodeLabel)
                                }), (0, ep.jsx)("div", {
                                    className: "qr-container",
                                    children: (0, ep.jsx)("div", {
                                        className: "qr-code"
                                    })
                                })]
                            })
                        }) : null]
                    })]
                })
            }

            function iq(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function iK(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function iJ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return iq(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iq(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            r(945), (0, eh.withTranslations)(function(t) {
                var n = t.translate,
                    r = t.downloadLink,
                    a = t.showQrCode;
                return (0, ep.jsx)(iH, {
                    translate: n,
                    downloadLink: r,
                    showQrCode: a
                })
            }, oQ);
            var i$ = {
                    Large: "XLarge"
                },
                iY = {
                    Large: "min-width-[240px] medium:min-width-[400px]"
                };
            (0, eh.withTranslations)(function(t) {
                var n, r = t.translate,
                    a = t.text,
                    o = t.variant,
                    i = t.size,
                    l = void 0 === i ? "Small" : i,
                    u = t.showIcon,
                    c = t.renderInstallInstructions,
                    s = t.isDisabled,
                    d = t.isVisible,
                    f = t.className,
                    p = t.href,
                    m = t.download,
                    h = t.downloadTypeOverride,
                    y = t.onClick,
                    g = iJ((0, v.useState)(!1), 2),
                    w = g[0],
                    x = g[1],
                    S = iJ((0, v.useState)(!1), 2),
                    P = S[0],
                    E = S[1],
                    A = null != m ? m : iz({
                        downloadTypeOverride: h,
                        translate: r
                    });
                if (!(void 0 === d || d) || !A) return null;
                var I = null != p ? p : A.href.toString(),
                    C = null != a ? a : r(A.link.title),
                    O = null != (n = i$[l]) ? n : l,
                    k = [iY[l], f].filter(Boolean).join(" "),
                    T = null != c,
                    j = void 0 !== s && s || P,
                    D = function(t) {
                        var n;
                        return (n = function() {
                            return function(t, n) {
                                var r, a, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                    return this
                                }), l;

                                function u(u) {
                                    return function(c) {
                                        var s = [u, c];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                                case 0:
                                                case 1:
                                                    o = s;
                                                    break;
                                                case 4:
                                                    return i.label++, {
                                                        value: s[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    i.label++, a = s[1], s = [0];
                                                    continue;
                                                case 7:
                                                    s = i.ops.pop(), i.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                        i = 0;
                                                        continue
                                                    }
                                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                        i.label = s[1];
                                                        break
                                                    }
                                                    if (6 === s[0] && i.label < o[1]) {
                                                        i.label = o[1], o = s;
                                                        break
                                                    }
                                                    if (o && i.label < o[2]) {
                                                        i.label = o[2], i.ops.push(s);
                                                        break
                                                    }
                                                    o[2] && i.ops.pop(), i.trys.pop();
                                                    continue
                                            }
                                            s = n.call(t, i)
                                        } catch (t) {
                                            s = [6, t], a = 0
                                        } finally {
                                            r = o = 0
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
                                        if (j) return [2];
                                        if (!y) return [3, 5];
                                        E(!0), n.label = 1;
                                    case 1:
                                        return n.trys.push([1, , 3, 4]), [4, y(A, t)];
                                    case 2:
                                        return n.sent(), [3, 4];
                                    case 3:
                                        return E(!1), [7];
                                    case 4:
                                        return [3, 6];
                                    case 5:
                                        iV(A), n.label = 6;
                                    case 6:
                                        return A.isDirectDownload && T && window.setTimeout(function() {
                                            x(!0)
                                        }, 1e3), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(a, o) {
                                var i = n.apply(t, r);

                                function l(t) {
                                    iK(i, a, o, l, u, "next", t)
                                }

                                function u(t) {
                                    iK(i, a, o, l, u, "throw", t)
                                }
                                l(void 0)
                            })
                        })()
                    };
                return (0, ep.jsxs)(b().Fragment, {
                    children: [(0, ep.jsx)(rB, {
                        as: "a",
                        variant: void 0 === o ? "Emphasis" : o,
                        size: l,
                        className: k,
                        href: j ? void 0 : I,
                        target: A.isDirectDownload ? "_self" : "_blank",
                        rel: A.isDirectDownload ? void 0 : "noopener noreferrer",
                        isDisabled: j,
                        isLoading: P,
                        onClick: function(t) {
                            D(t)
                        },
                        children: (0, ep.jsxs)("span", {
                            className: "flex justify-center items-center gap-small",
                            children: [void 0 !== u && u ? (0, ep.jsx)(ri, {
                                name: A.link.icon,
                                size: O
                            }) : null, (0, ep.jsx)("span", {
                                children: C
                            })]
                        })
                    }), T ? (0, ep.jsx)(rv, {
                        open: w,
                        size: "Large",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: r("Action.Close"),
                        onOpenChange: function() {
                            x(!1)
                        },
                        children: (0, ep.jsx)(rb, {
                            className: "install-dialog",
                            children: (0, ep.jsx)(rg, {
                                className: "content-default",
                                children: c(A)
                            })
                        })
                    }) : null]
                })
            }, oQ);
            var iX = "deeplink",
                iQ = function(t, n, r) {
                    var a;
                    try {
                        null == (a = window.Roblox.EventStream) || a.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: n,
                            group: iX,
                            action: "create-token-attempt",
                            status_code: r,
                            token: null != t ? t : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (t) {}
                };

            function iZ(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            var i0 = "".concat(E().apiGatewayUrl, "/deferred-deep-link/token-api"),
                i1 = function(t) {
                    var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return (n = function() {
                        var n, a, o, i, l, u, c, s;
                        return function(t, n) {
                            var r, a, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function u(u) {
                                return function(c) {
                                    var s = [u, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                        switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                o = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, a = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < o[1]) {
                                                    i.label = o[1], o = s;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(s);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, i)
                                    } catch (t) {
                                        s = [6, t], a = 0
                                    } finally {
                                        r = o = 0
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
                                    n = r.authTicket, a = r.btId, o = r.downloadSource, i = {
                                        linkId: t,
                                        group: iX
                                    }, n && (i.authTicket = n), a && (i.btId = a), o && (i.downloadSource = o), l = {
                                        withCredentials: !0,
                                        url: "".concat(i0, "/create-token")
                                    }, d.label = 1;
                                case 1:
                                    return d.trys.push([1, 3, , 4]), [4, w.post(l, i)];
                                case 2:
                                    return iQ(s = null != (c = (u = d.sent()).data.token) ? c : null, t, u.status), [2, s];
                                case 3:
                                    return d.sent(), [2, null];
                                case 4:
                                    return [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(a, o) {
                            var i = n.apply(t, r);

                            function l(t) {
                                iZ(i, a, o, l, u, "next", t)
                            }

                            function u(t) {
                                iZ(i, a, o, l, u, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                },
                i2 = window.Roblox["core-scripts"].meta.user;

            function i3(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            var i5 = function() {
                var t;
                return (t = function() {
                    var t, n, r;
                    return function(t, n) {
                        var r, a, o, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                            return this
                        }), l;

                        function u(u) {
                            return function(c) {
                                var s = [u, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                    if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                    switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            o = s;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, a = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                i.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && i.label < o[1]) {
                                                i.label = o[1], o = s;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(s);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    s = n.call(t, i)
                                } catch (t) {
                                    s = [6, t], a = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & s[0]) throw s[1];
                                return {
                                    value: s[0] ? s[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return a.trys.push([0, 2, , 3]), [4, w.get({
                                    url: "".concat(E().authApi, "/v1/client-assertion/"),
                                    withCredentials: !0
                                })];
                            case 1:
                                return t = a.sent().data, [3, 3];
                            case 2:
                                return a.sent(), [3, 3];
                            case 3:
                                return a.trys.push([3, 5, , 6]), [4, w.post({
                                    url: "".concat(E().authApi, "/v1/authentication-ticket/"),
                                    withCredentials: !0
                                }, null != t ? t : {})];
                            case 4:
                                if (null != (n = a.sent().headers) && (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) == "object" && "string" == typeof(r = n["rbx-authentication-ticket"]) && r.length > 0) return [2, r];
                                return [2, void 0];
                            case 5:
                                return a.sent(), [2, void 0];
                            case 6:
                                return [2]
                        }
                    })
                }, function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            i3(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            i3(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                })()
            };

            function i4(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            var i6 = "Website.DownloadFunnel",
                i7 = function() {
                    var t = null === y.Cookies || void 0 === y.Cookies ? void 0 : y.Cookies.getBrowserTrackerId();
                    return "string" == typeof t && t.length > 0 ? t : void 0
                },
                i8 = function() {
                    var t, n = (arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}).ixpValues;
                    return (t = function() {
                        var t, r, a;
                        return function(t, n) {
                            var r, a, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function u(u) {
                                return function(c) {
                                    var s = [u, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                        switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                o = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, a = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < o[1]) {
                                                    i.label = o[1], o = s;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(s);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, i)
                                    } catch (t) {
                                        s = [6, t], a = 0
                                    } finally {
                                        r = o = 0
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
                                    if (null != (t = n)) return [3, 4];
                                    o.label = 1;
                                case 1:
                                    return o.trys.push([1, 3, , 4]), [4, eb().getAllValuesForLayer(i6)];
                                case 2:
                                    return t = o.sent(), [3, 4];
                                case 3:
                                    return o.sent(), t = {}, [3, 4];
                                case 4:
                                    if (r = !0 === t.IsDeeplinkTokenEnabled, !(null != (0, i2.authenticatedUser)() && r)) return [3, 6];
                                    return [4, i5()];
                                case 5:
                                    return a = o.sent(), [3, 7];
                                case 6:
                                    a = void 0, o.label = 7;
                                case 7:
                                    return [2, {
                                        authTicket: a,
                                        btId: i7()
                                    }]
                            }
                        })
                    }, function() {
                        var n = this,
                            r = arguments;
                        return new Promise(function(a, o) {
                            var i = t.apply(n, r);

                            function l(t) {
                                i4(i, a, o, l, u, "next", t)
                            }

                            function u(t) {
                                i4(i, a, o, l, u, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                };

            function i9(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function le(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            i9(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            i9(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function lt(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ln = function(t) {
                    var n = t.linkId,
                        r = t.downloadSource,
                        a = (0, g.useQuery)({
                            queryKey: ["ixp/".concat(i6)],
                            queryFn: function() {
                                return le(function() {
                                    return lt(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return t.trys.push([0, 2, , 3]), [4, eb().getAllValuesForLayer(i6)];
                                            case 1:
                                                return [2, t.sent()];
                                            case 2:
                                                return t.sent(), [2, {}];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            staleTime: 1 / 0
                        }),
                        o = (0, v.useCallback)(function(t) {
                            return le(function() {
                                var o, i, l;
                                return lt(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            if (null == n) return [2, t];
                                            return [4, i8({
                                                ixpValues: null != (o = a.data) ? o : {}
                                            })];
                                        case 1:
                                            return [4, i1(n, {
                                                authTicket: (i = u.sent()).authTicket,
                                                btId: i.btId,
                                                downloadSource: r
                                            })];
                                        case 2:
                                            if (!(l = u.sent())) return [2, t];
                                            return [2, t.withSearchParamsAppended({
                                                token: l
                                            })]
                                    }
                                })
                            })()
                        }, [n, r, a.data]),
                        i = (0, v.useCallback)(function() {
                            eb().logLayerExposure(i6)
                        }, []);
                    return {
                        resolveTokenizedHref: o,
                        isLoading: a.isLoading,
                        logExposure: i
                    }
                },
                lr = r(507),
                la = function(t) {
                    var n = t.translate;
                    return (0, ep.jsxs)(b().Fragment, {
                        children: [(0, ep.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, ep.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: n("Heading.MobileAppDownloadOption")
                            }), (0, ep.jsx)("p", {
                                className: "text-body-medium",
                                children: n("Label.MobileAppQrCode")
                            })]
                        }), (0, ep.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, ep.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, ep.jsx)("img", {
                                    className: "size-2100",
                                    src: lr,
                                    alt: ""
                                })
                            })
                        })]
                    })
                },
                lo = "deeplink",
                li = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(t) {
                    return new RegExp(t.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                ll = ["/share-links"],
                lu = ["ExperienceAffiliate"],
                lc = function(t) {
                    var n;
                    return ll.includes(t.pathname) && lu.includes(null != (n = t.searchParams.get("type")) ? n : "")
                },
                ls = function(t) {
                    try {
                        var n = new URL(t).searchParams.get("referralUrl");
                        if (!n) return null;
                        var r = new URL(decodeURIComponent(n));
                        if (lc(r)) return r.href;
                        return null
                    } catch (t) {
                        return null
                    }
                },
                ld = function(t, n, r) {
                    var a;
                    try {
                        null == (a = window.Roblox.EventStream) || a.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: n,
                            group: lo,
                            action: "create-token-attempt",
                            status_code: r,
                            token: null != t ? t : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (t) {}
                };

            function lf(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }
            var lp = "".concat(E().apiGatewayUrl, "/deferred-deep-link/token-api"),
                lm = function(t) {
                    var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return (n = function() {
                        var n, a, o, i, l, u, c, s;
                        return function(t, n) {
                            var r, a, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function u(u) {
                                return function(c) {
                                    var s = [u, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                        switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                o = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, a = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < o[1]) {
                                                    i.label = o[1], o = s;
                                                    break
                                                }
                                                if (o && i.label < o[2]) {
                                                    i.label = o[2], i.ops.push(s);
                                                    break
                                                }
                                                o[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, i)
                                    } catch (t) {
                                        s = [6, t], a = 0
                                    } finally {
                                        r = o = 0
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
                                    n = r.authTicket, a = r.btId, o = r.downloadSource, i = {
                                        linkId: t,
                                        group: lo
                                    }, n && (i.authTicket = n), a && (i.btId = a), o && (i.downloadSource = o), l = {
                                        withCredentials: !0,
                                        url: "".concat(lp, "/create-token")
                                    }, d.label = 1;
                                case 1:
                                    return d.trys.push([1, 3, , 4]), [4, w.post(l, i)];
                                case 2:
                                    return ld(s = null != (c = (u = d.sent()).data.token) ? c : null, t, u.status), [2, s];
                                case 3:
                                    return d.sent(), [2, null];
                                case 4:
                                    return [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(a, o) {
                            var i = n.apply(t, r);

                            function l(t) {
                                lf(i, a, o, l, u, "next", t)
                            }

                            function u(t) {
                                lf(i, a, o, l, u, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                };

            function lh(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function ly(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        a = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), a.forEach(function(n) {
                        var a;
                        a = r[n], n in t ? Object.defineProperty(t, n, {
                            value: a,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = a
                    })
                }
                return t
            }

            function lv(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, a)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }
            var lb = "undefined" != typeof window ? window.navigator.userAgent : "",
                lg = /Mac OS X/i.test(lb),
                lw = /Windows NT/i.test(lb);
            /Linux/i.test(lb) && /Android/i.test(lb);
            var lx = /Android/i.test(lb),
                lS = /iPhone|iPad|iPod/i.test(lb),
                lP = function(t) {
                    var n = t.alt,
                        r = void 0 === n ? "App Icon" : n,
                        a = t.className,
                        o = t.title,
                        i = t.style;
                    return b().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(lg ? "mac" : lw ? "windows" : lS ? "ios" : lx ? "android" : "windows", " ").concat(void 0 === a ? "" : a),
                        role: "img",
                        "aria-label": r,
                        title: (void 0 === o ? "" : o) || r,
                        style: void 0 === i ? {} : i
                    })
                };

            function lE(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function lA(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            lE(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            lE(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function lI(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function lC(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function lO(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function lk(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            lO(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            lO(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function lT(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return lC(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lC(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lj(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var lD = function(t) {
                    var n = t.indexOf(".");
                    return n >= 0 ? (0, ep.jsxs)(b().Fragment, {
                        children: [(0, ep.jsx)("span", {
                            children: t.substring(0, n + 1)
                        }), (0, ep.jsx)("span", {
                            children: t.substring(n + 1)
                        })]
                    }) : t
                },
                lN = "\x01LINK_START\x01",
                lR = "\x01LINK_END\x01",
                lU = new RegExp("".concat(lN, "|").concat(lR)),
                lL = function(t) {
                    var n = t.download,
                        r = t.launchGame,
                        a = t.unmount,
                        o = lT((0, v.useState)(!1), 2),
                        i = o[0],
                        l = o[1],
                        u = (0, eh.useTranslation)().translate,
                        c = ln({}).logExposure,
                        s = (0, g.useQuery)({
                            queryKey: ["client-status"],
                            queryFn: function() {
                                return lk(function() {
                                    return lj(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, lA(function() {
                                                    return lI(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, w.get({
                                                                    url: "".concat(E().matchmakingApi, "/v1/client-status"),
                                                                    withCredentials: !0
                                                                })];
                                                            case 1:
                                                                return [2, t.sent().data]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === t.sent().status) throw Error();
                                                return a(), [2, !0]
                                        }
                                    })
                                })()
                            },
                            retry: 2,
                            retryDelay: 2500,
                            cacheTime: 0
                        }).isLoading;
                    if (!i) {
                        var d = u(s ? "Label.RobloxLoadingToPlay" : "Label.RobloxExciteToDownload");
                        return (0, ep.jsx)(rv, {
                            hasCloseAffordance: !0,
                            closeLabel: u("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: a,
                            children: (0, ep.jsxs)(rb, {
                                className: "download-dialog",
                                children: [(0, ep.jsxs)(rg, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, ep.jsx)(lP, {
                                        className: "size-1600"
                                    }), (0, ep.jsx)(rw, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: s ? lD(d) : d
                                    })]
                                }), (0, ep.jsx)(rx, {
                                    className: "flex",
                                    children: s ? (0, ep.jsx)(rB, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, ep.jsx)(rB, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return lk(function() {
                                                var t;
                                                return lj(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                c(), (t = iz()) && ir(t.link.name)
                                                            } catch (t) {}
                                                            return l(!0), [4, n()];
                                                        case 1:
                                                            return r.sent(), [2]
                                                    }
                                                })
                                            })()
                                        },
                                        children: u("Title.DownloadPage")
                                    })
                                })]
                            })
                        })
                    }
                    var f = (0, oK.isMac)(),
                        p = f ? (0, o$.getAbsoluteUrl)("/download/client?os=mac") : (0, o$.getAbsoluteUrl)("/download/client?os=win");
                    return (0, ep.jsx)(rv, {
                        hasCloseAffordance: !0,
                        closeLabel: u("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: a,
                        children: (0, ep.jsx)(rb, {
                            className: "install-dialog",
                            children: (0, ep.jsx)(rg, {
                                className: "content-default",
                                children: (0, ep.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, ep.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, ep.jsx)(rw, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: u("Heading.DownloadConfirmation")
                                        }), (0, ep.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(u("Label.FollowInstallSteps"), " ").concat(u("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(p, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, ep.jsx)("div", {}), " ", (0, ep.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, ep.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, ep.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: u("Heading.InstallInstructions")
                                            }), (0, ep.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, ep.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: u(f ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ep.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: u("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ep.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: u("Response.Dialog.ThirdInstruction")
                                                }), (0, ep.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var t = u("Response.Dialog.FourthInstruction", {
                                                                startLink: lN,
                                                                endLink: lR
                                                            }),
                                                            n = t.split(lU);
                                                        if (n.length < 3) return t;
                                                        var a = lT(n, 3),
                                                            o = a[0],
                                                            i = a[1],
                                                            l = a[2];
                                                        return (0, ep.jsxs)(b().Fragment, {
                                                            children: [o, (0, ep.jsx)("button", {
                                                                type: "button",
                                                                className: "download-link-underline",
                                                                onClick: function() {
                                                                    return null == r ? void 0 : r()
                                                                },
                                                                children: i
                                                            }), l]
                                                        })
                                                    }()
                                                })]
                                            })]
                                        }), (0, ep.jsx)("div", {}), " ", (0, ep.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, ep.jsx)("div", {}), " ", (0, ep.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, ep.jsx)(la, {
                                                translate: u
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                };

            function lM(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, a = Array(n); r < n; r++) a[r] = t[r];
                return a
            }

            function l_(t, n, r, a, o, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(a, o)
            }

            function lF(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(a, o) {
                        var i = t.apply(n, r);

                        function l(t) {
                            l_(i, a, o, l, u, "next", t)
                        }

                        function u(t) {
                            l_(i, a, o, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function lB(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, a, o = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != o) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (o = o.call(t); !(l = (r = o.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, a = t
                        } finally {
                            try {
                                l || null == o.return || o.return()
                            } finally {
                                if (u) throw a
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return lM(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lM(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lG(t, n) {
                var r, a, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                            switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                case 0:
                                case 1:
                                    o = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < o[1]) {
                                        i.label = o[1], o = s;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(s);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], a = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var lW = {
                isInstalling: !1,
                robloxLocale: "",
                gameLocale: "",
                protocolUrlSeparator: "+",
                protocolDetectionEnabled: !1,
                avatarParamEnabled: !0,
                separateScriptParamsEnabled: !1,
                waitTimeBeforeFailure: 300,
                protocolNameForStudio: "roblox-studio",
                protocolNameForClient: "roblox-client",
                logger: null,
                channel: "",
                studioChannel: "",
                playerChannel: "",
                isDuarAutoOptInEnabled: !1,
                isDuarOptOutDisabled: !1,
                isJoinAttemptIdEnabled: !1,
                isOmitPlayerChannelForWinAndMacEnabled: !1
            };

            function lz(t) {
                return "edit" === t || "plugin" === t || "asset" === t
            }

            function lV() {
                var t = "react-dialog-container",
                    n = document.getElementById(t);
                return n ? (eD().unmountComponentAtNode(n), n.innerHTML = "") : ((n = document.createElement("div")).id = t, document.body.appendChild(n)), n
            }

            function lH() {
                h().modal.close();
                var t = new y.TranslationResourceProvider,
                    n = t.getTranslationResource("Common.VisitGame"),
                    r = t.getTranslationResource("CommonUI.Controls");
                y.Dialog.open({
                    titleText: n.get("Heading.ErrorStartingGame"),
                    bodyContent: n.get("Response.Dialog.ErrorLaunching"),
                    acceptText: r.get("Action.OK") || "OK",
                    showDecline: !1
                })
            }

            function lq(t) {
                h().modal.close();
                var n = {
                    launchMethod: "Protocol",
                    params: t
                };
                h()(oT).trigger(oT.startClientSucceededEvent, n), lW.isInstalling && (h()(oT).trigger(oT.successfulInstallEvent, n), lW.isInstalling = !1)
            }

            function lK(t) {
                var n = h()("iframe#gamelaunch");
                n.length > 0 && n.remove(), n = h()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", t), h()("body").append(n);
                var r = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(r)
            }

            function lJ(t) {
                return lF(function() {
                    var n, r, a;
                    return lG(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), n = lz(null == t ? void 0 : t.launchMode), r = lA(function() {
                                        return lI(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return [4, w.post({
                                                        url: "".concat(E().matchmakingApi, "/v1/client-status"),
                                                        withCredentials: !0
                                                    }, {
                                                        status: "Unknown"
                                                    })];
                                                case 1:
                                                    return t.sent(), [2]
                                            }
                                        })
                                    })(), !(y.CurrentUser.isAuthenticated && !n)) return [3, 2];
                                return [4, Promise.all([lA(function() {
                                    var t, n, r;
                                    return lI(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                return a.trys.push([0, 2, , 3]), [4, w.get({
                                                    url: "".concat(E().authApi, "/v1/client-assertion/"),
                                                    withCredentials: !0
                                                })];
                                            case 1:
                                                return t = a.sent().data, [3, 3];
                                            case 2:
                                                return a.sent(), [3, 3];
                                            case 3:
                                                return a.trys.push([3, 5, , 6]), [4, w.post({
                                                    url: "".concat(E().authApi, "/v1/authentication-ticket/"),
                                                    withCredentials: !0
                                                }, null != t ? t : {})];
                                            case 4:
                                                if (null != (n = a.sent().headers) && (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n) == "object" && "string" == typeof(r = n["rbx-authentication-ticket"]) && r.length > 0) return [2, r];
                                                return [2, void 0];
                                            case 5:
                                                return a.sent(), [2, void 0];
                                            case 6:
                                                return [2]
                                        }
                                    })
                                })(), r])];
                            case 1:
                                return a = lB.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, r];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                var i, l, u, c, s, d, f;
                                return i = a, c = lz(null == t ? void 0 : t.launchMode), s = lW.protocolUrlSeparator, d = "".concat(t.protocolName, ":"), (f = []).push(1), f.push("launchmode:".concat(t.launchMode)), i && (t.protocolName !== lW.protocolNameForStudio || 0 !== i.indexOf("Guest:")) && f.push("gameinfo:".concat(encodeURIComponent(i))), f.push("launchtime:".concat(t.launchTime)), c && y.CurrentUser.isAuthenticated && (f.push("distributorType:".concat("Global")), f.push("userId:".concat(y.CurrentUser.userId))), c && f.push("browser:".concat((0, X.getCurrentBrowser)())), h().each(t.otherParams, function(t, n) {
                                    t === n ? f.push(t) : f.push("".concat(t, ":").concat(encodeURIComponent(n)))
                                }), d += f.join(s), null == (u = oT.gameLaunchLogger) || null == (l = u.logToConsole) || l.call(u, "launchProtocolUrl: ".concat(JSON.stringify({
                                    url: d,
                                    params: t
                                }))), lK(d), lq(t), [3, 6];
                            case 5:
                                return console.error(o.sent()), lH(), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }

            function l$(t) {
                var n = function(t) {
                    for (var n = 1; n < arguments.length; n++) {
                        var r = null != arguments[n] ? arguments[n] : {},
                            a = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                            return Object.getOwnPropertyDescriptor(r, t).enumerable
                        }))), a.forEach(function(n) {
                            var a;
                            a = r[n], n in t ? Object.defineProperty(t, n, {
                                value: a,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : t[n] = a
                        })
                    }
                    return t
                }({}, t);
                n.launchTime = new Date().getTime(), n.otherParams.browsertrackerid = y.Cookies.getBrowserTrackerId(), n.otherParams.robloxLocale = lW.robloxLocale, n.otherParams.gameLocale = lW.gameLocale, n.protocolName === lW.protocolNameForStudio ? n.otherParams.channel = lW.studioChannel : lW.isOmitPlayerChannelForWinAndMacEnabled && ((0, oK.isWindows)() || (0, oK.isMac)()) || (n.otherParams.channel = lW.playerChannel), lW.isDuarAutoOptInEnabled && n.protocolName === lW.protocolNameForClient && !n.otherParams.LaunchExp && (lW.isDuarOptOutDisabled ? n.otherParams.LaunchExp = "InApp" : n.otherParams.LaunchExp = "PreferInApp"), h()(oT).trigger(oT.startClientAttemptedEvent, {
                    launchMethod: "Protocol",
                    params: n
                });
                var r = lJ(n);
                return lW.showDialog(n), r
            }

            function lY(t, n) {
                var r = " ";
                y.Endpoints && y.Endpoints.Urls && (r = "".concat(y.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx"), "?")), "h" !== r[0] && (r = "http://".concat(window.location.host) + "/Game/PlaceLauncher.ashx?"), r = r.replace("placelauncher", "PlaceLauncher");
                var a = {
                    request: t,
                    browserTrackerId: y.Cookies.getBrowserTrackerId()
                };
                return h().extend(a, n), r + h().param(a)
            }

            function lX() {
                return lF(function() {
                    var t, n, r;
                    return lG(this, function(a) {
                        switch (a.label) {
                            case 0:
                                var o, i;
                                return t = document.getElementById("downloadInstallerIFrame"), n = "/download/client", t.referrerPolicy = "no-referrer", [4, (o = window.location.toString(), (i = function() {
                                    var t, n, r, a, i;
                                    return function(t, n) {
                                        var r, a, o, i = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                            return this
                                        }), l;

                                        function u(u) {
                                            return function(c) {
                                                var s = [u, c];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                    if (r = 1, a && (o = 2 & s[0] ? a.return : s[0] ? a.throw || ((o = a.return) && o.call(a), 0) : a.next) && !(o = o.call(a, s[1])).done) return o;
                                                    switch (a = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = s;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: s[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, a = s[1], s = [0];
                                                            continue;
                                                        case 7:
                                                            s = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                                                i.label = s[1];
                                                                break
                                                            }
                                                            if (6 === s[0] && i.label < o[1]) {
                                                                i.label = o[1], o = s;
                                                                break
                                                            }
                                                            if (o && i.label < o[2]) {
                                                                i.label = o[2], i.ops.push(s);
                                                                break
                                                            }
                                                            o[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    s = n.call(t, i)
                                                } catch (t) {
                                                    s = [6, t], a = 0
                                                } finally {
                                                    r = o = 0
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
                                                if (t = "", !(n = function(t) {
                                                        var n = ls(t);
                                                        if (n) return n;
                                                        var r = new URL(t);
                                                        return (r.search = "", r.hash = "", li.some(function(t) {
                                                            return t.test(r.pathname)
                                                        })) ? r.toString() : null
                                                    }(o))) return [2, t];
                                                return a = [n], i = [{}], [4, i8()];
                                            case 1:
                                                return [4, lm.apply(void 0, a.concat([lv.apply(void 0, [ly.apply(void 0, i.concat([l.sent()])), {
                                                    downloadSource: "installer"
                                                }])]))];
                                            case 2:
                                                return (r = l.sent()) && (t = "?".concat("token", "=").concat(r)), [2, t]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        n = arguments;
                                    return new Promise(function(r, a) {
                                        var o = i.apply(t, n);

                                        function l(t) {
                                            lh(o, r, a, l, u, "next", t)
                                        }

                                        function u(t) {
                                            lh(o, r, a, l, u, "throw", t)
                                        }
                                        l(void 0)
                                    })
                                })())];
                            case 1:
                                return r = a.sent(), t.src = "".concat(n).concat(r), [2]
                        }
                    })
                })()
            }

            function lQ() {
                return lF(function() {
                    return lG(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return h()(oT).trigger(oT.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, lX()];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })()
            }

            function lZ(t) {
                switch (y.EnvironmentUrls.domain) {
                    case "sitetest1.robloxlabs.com":
                        return "".concat(t, "-sitetest1");
                    case "sitetest2.robloxlabs.com":
                        return "".concat(t, "-sitetest2");
                    case "sitetest3.robloxlabs.com":
                        return "".concat(t, "-sitetest3");
                    default:
                        return t
                }
            }
            Object.assign(lW, {
                joinMultiplayerGame: function(t) {
                    var n = lW.protocolNameForClient,
                        r = lY("RequestGame", t),
                        a = !0 === t.isPlayTogetherGame;
                    return l$({
                        protocolName: n,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: r
                        },
                        placeId: t.placeId,
                        isPlayTogetherGame: a,
                        launchData: t.launchData,
                        eventId: t.eventId
                    })
                },
                openStudio: function() {
                    var t = {};
                    return lW.avatarParamEnabled && (t.avatar = "avatar"), l$({
                        protocolName: lW.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: t
                    })
                },
                tryAssetInStudio: function(t) {
                    var n = {
                        assetid: t
                    };
                    return lW.avatarParamEnabled && (n.avatar = "avatar"), l$({
                        protocolName: lW.protocolNameForStudio,
                        launchMode: "asset",
                        otherParams: n
                    })
                },
                openPluginInStudio: function(t) {
                    var n = {
                        pluginid: t
                    };
                    lW.avatarParamEnabled && (n.avatar = "avatar"), l$({
                        protocolName: lW.protocolNameForStudio,
                        launchMode: "plugin",
                        otherParams: n
                    })
                },
                editGameInStudio: function(t, n, r) {
                    var a, o, i, l, u, c, s = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        d = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : "",
                        f = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : "";
                    lW.separateScriptParamsEnabled ? (c = {
                        task: s ? "StartTeamTest" : "EditPlace",
                        placeId: t,
                        universeId: n
                    }, !s && (d && (c.targetInstanceId = d), f && (c.annotationId = f))) : c = {
                        script: (a = t, o = n, i = r, l = "Edit.ashx", u = " ", y.Endpoints && y.Endpoints.Urls && (u = "".concat(y.Endpoints.getAbsoluteUrl("/Game/".concat(l)), "?")), "h" !== u[0] && (u = "http://".concat(window.location.host) + "/Game/".concat(l, "?")), u + h().param({
                            placeId: a,
                            upload: i ? a : "",
                            universeId: o,
                            testMode: !1
                        }))
                    }, lW.avatarParamEnabled && (c.avatar = "avatar"), l$({
                        protocolName: lW.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: c,
                        placeId: t
                    })
                },
                followPlayerIntoGame: function(t) {
                    return l$({
                        protocolName: lW.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: lY("RequestFollowUser", t)
                        }
                    })
                },
                joinGameInstance: function(t) {
                    var n = lW.protocolNameForClient,
                        r = lY("RequestGameJob", t),
                        a = !0 === t.isPlayTogetherGame;
                    return l$({
                        protocolName: n,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: r
                        },
                        placeId: t.placeId,
                        isPlayTogetherGame: a
                    })
                },
                joinPrivateGame: function(t) {
                    return l$({
                        protocolName: lW.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: lY("RequestPrivateGame", t)
                        },
                        placeId: t.placeId
                    })
                },
                playTogetherGame: function(t) {
                    return l$({
                        protocolName: lW.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: lY("RequestPlayTogetherGame", t)
                        },
                        placeId: t.placeId,
                        conversationId: t.conversationId
                    })
                },
                manualDownload: lQ,
                attachManualDownloadToLink: function() {
                    return lF(function() {
                        return lG(this, function(t) {
                            return h()("body #GameLaunchManualInstallLink").click(function() {
                                return lF(function() {
                                    return lG(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, lQ()];
                                            case 1:
                                                return t.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: lX,
                setLocationHref: lK,
                openDesktopUniversalApp: function() {
                    var t = {};
                    t.protocolName = lW.protocolNameForClient, t.launchTime = new Date().getTime(), t.launchMode = "app", t.otherParams = {}, t.otherParams.browsertrackerid = y.Cookies.getBrowserTrackerId(), t.otherParams.robloxLocale = lW.robloxLocale, t.otherParams.gameLocale = lW.gameLocale, t.otherParams.LaunchExp = "InApp", h()(oT).trigger(oT.startClientAttemptedEvent, {
                        launchMethod: "Protocol",
                        params: t
                    });
                    var n = lJ(t);
                    return lW.showDialog(t), n
                },
                startDeepLinkFlow: function(t) {
                    var n = lV();
                    (0, eh.renderWithErrorBoundary)((0, ep.jsx)(eh.TranslationProvider, {
                        config: oJ.P,
                        children: (0, ep.jsx)(g.QueryClientProvider, {
                            client: eh.queryClient,
                            children: (0, ep.jsx)(lL, {
                                download: function() {
                                    return lF(function() {
                                        return lG(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return h()(oT).trigger(oT.beginInstallEvent, {
                                                        launchMethod: "Protocol",
                                                        params: {}
                                                    }), lW.isInstalling = !0, [4, lX()];
                                                case 1:
                                                    return t.sent(), [2]
                                            }
                                        })
                                    })()
                                },
                                launchGame: function() {
                                    return lF(function() {
                                        return lG(this, function(n) {
                                            return lK(t), [2]
                                        })
                                    })()
                                },
                                unmount: function() {
                                    return eD().unmountComponentAtNode(n)
                                }
                            })
                        })
                    }), n), lK(t)
                },
                showDialog: function(t) {
                    var n = lV(),
                        r = function() {
                            return eD().unmountComponentAtNode(n)
                        },
                        a = lz(null == t ? void 0 : t.launchMode);
                    (0, eh.renderWithErrorBoundary)((0, ep.jsx)(eh.TranslationProvider, {
                        config: oJ.P,
                        children: (0, ep.jsx)(g.QueryClientProvider, {
                            client: eh.queryClient,
                            children: (0, ep.jsx)(lL, {
                                download: function() {
                                    return lF(function() {
                                        var n, o;
                                        return lG(this, function(i) {
                                            switch (i.label) {
                                                case 0:
                                                    if (t.placeId && null != (n = window.localStorage.getItem("ref_info"))) {
                                                        window.localStorage.removeItem("ref_info"), o = {};
                                                        try {
                                                            o = JSON.parse(atob(n))
                                                        } catch (t) {}
                                                        t.referredByPlayerId = o[t.placeId]
                                                    }
                                                    if (h()(oT).trigger(oT.beginInstallEvent, {
                                                            launchMethod: "Protocol",
                                                            params: t
                                                        }), lW.isInstalling = !0, !a) return [3, 1];
                                                    return document.getElementById("downloadInstallerIFrame").src = "/download/studio", r(), [3, 3];
                                                case 1:
                                                    return [4, lX()];
                                                case 2:
                                                    i.sent(), i.label = 3;
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                launchGame: function() {
                                    return lF(function() {
                                        return lG(this, function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    return [4, lJ(t)];
                                                case 1:
                                                    return [2, n.sent()]
                                            }
                                        })
                                    })()
                                },
                                unmount: r
                            })
                        })
                    }), n)
                },
                showLaunchFailureDialog: lH,
                cleanUpAndLogSuccess: lq,
                startGameWithDeepLinkUrl: function(t, n) {
                    var r = {
                        launchMode: "play",
                        protocolName: lW.protocolNameForClient,
                        placeId: n
                    };
                    lW.showDialog(r), lK(t)
                }
            }), h()(document).ready(function() {
                oT.setGameLaunchInterface(lW);
                var t = h()("#PlaceLauncherStatusPanel");
                lW.protocolNameForClient = lZ("roblox-player"), lW.protocolNameForStudio = lZ("roblox-studio"), lW.protocolDetectionEnabled = !0, lW.separateScriptParamsEnabled = !0, lW.avatarParamEnabled = !0, lW.isJoinAttemptIdEnabled = !0, lW.robloxLocale = t.data("protocol-roblox-locale"), lW.gameLocale = t.data("protocol-game-locale");
                var n = t.data("protocol-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (lW.channel = n);
                var r = t.data("protocol-studio-channel-name");
                "string" == typeof r && "LIVE" !== r.toUpperCase() && (lW.studioChannel = r);
                var a = t.data("protocol-player-channel-name");
                "string" == typeof a && "LIVE" !== a.toUpperCase() && (lW.playerChannel = a), lW.logger || void 0 === window.Roblox.ProtocolHandlerLogger || (lW.logger = window.Roblox.ProtocolHandlerLogger), lW.isDuarAutoOptInEnabled = t.data("is-duar-auto-opt-in-enabled"), lW.isDuarOptOutDisabled = t.data("is-duar-opt-out-disabled"), lW.isOmitPlayerChannelForWinAndMacEnabled = t.data("is-omit-player-channel-for-win-and-mac-enabled")
            }), r(560), r(70), Object.assign(window.Roblox, {
                AuthenticationChecker: oO,
                GameLauncher: oT,
                GameLaunchLogger: o_,
                GamePlayEvents: oL,
                ProtocolHandlerClientInterface: lW,
                PlayButton: {
                    usePlayabilityStatus: J,
                    PlayabilityStatuses: N,
                    launchGame: el,
                    launchLogin: eu,
                    shouldShowUnplayableButton: ed,
                    DefaultPlayButton: function(t) {
                        var n, r = t.placeId,
                            a = t.rootPlaceId,
                            o = t.universeId,
                            i = t.privateServerLinkCode,
                            l = t.gameInstanceId,
                            u = t.refetchPlayabilityStatus,
                            c = t.playabilityStatus,
                            s = t.demoModeAvailable,
                            d = t.hideButtonText,
                            f = t.eventProperties,
                            p = void 0 === f ? ob : f,
                            m = t.appsFlyerReferralProperties,
                            h = void 0 === m ? ob : m,
                            y = t.disableLoadingState,
                            v = t.buttonClassName,
                            b = t.redirectPurchaseUrl,
                            g = t.showDefaultPurchaseText,
                            w = t.shouldShowVpcPlayButtonUpsells,
                            x = t.pageContext,
                            S = (null != (n = window.EventTracker) ? n : {}).fireEvent,
                            P = a3(o, r, c === N.PurchaseRequired || c === N.FiatPurchaseRequired),
                            E = P.isLoading,
                            A = P.productInfo,
                            I = P.productDetails,
                            C = s ? (0, ep.jsx)(oa, {
                                universeId: o,
                                placeId: r,
                                rootPlaceId: a,
                                privateServerLinkCode: i,
                                gameInstanceId: l,
                                eventProperties: p,
                                appsFlyerReferralProperties: h
                            }) : null,
                            O = function(t) {
                                var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                                return C ? (0, ep.jsxs)("div", {
                                    className: "stacked-play-buttons-container",
                                    children: [t, n && C]
                                }) : t
                            };
                        switch (c) {
                            case void 0:
                                if (!y) return (0, ep.jsx)(em.Loading, {});
                                return (0, ep.jsx)(ow, {
                                    universeId: o,
                                    placeId: r,
                                    rootPlaceId: a,
                                    privateServerLinkCode: i,
                                    gameInstanceId: l,
                                    status: N.Playable,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: h,
                                    disableLoadingState: y,
                                    buttonClassName: v,
                                    pageContext: x
                                });
                            case N.Playable:
                            case N.GuestProhibited:
                                return (0, ep.jsx)(ow, {
                                    universeId: o,
                                    placeId: r,
                                    rootPlaceId: a,
                                    privateServerLinkCode: i,
                                    gameInstanceId: l,
                                    status: c,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: h,
                                    disableLoadingState: y,
                                    buttonClassName: v,
                                    pageContext: x
                                });
                            case N.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case N.ContextualPlayabilityAgeCheckRequired:
                                return null == S || S(W.ActionNeeded), (0, ep.jsx)(od, {
                                    universeId: o,
                                    buttonClassName: v,
                                    playabilityStatus: c,
                                    pageContext: x
                                });
                            case N.PurchaseRequired:
                            case N.FiatPurchaseRequired:
                                var k = c === N.FiatPurchaseRequired ? !!(null == I ? void 0 : I.fiatPurchaseData) : !!(null == A ? void 0 : A.isForSale);
                                if (!E && !k) return null == S || S(W.Unplayable), O((0, ep.jsx)(oo, {
                                    hideButtonText: d,
                                    buttonClassName: v
                                }));
                                return O((0, ep.jsx)(on, {
                                    refetchPlayabilityStatus: u,
                                    universeId: o,
                                    placeId: r,
                                    hideButtonText: d,
                                    buttonClassName: v,
                                    redirectPurchaseUrl: b,
                                    playabilityStatus: c,
                                    showDefaultPurchaseText: g,
                                    pageContext: x
                                }), !E);
                            case N.FiatPurchaseDeviceRestricted:
                            case N.ContextualPlayabilityRegionalAvailability:
                                return null == S || S(W.Unplayable), O((0, ep.jsx)(oo, {
                                    hideButtonText: d,
                                    buttonClassName: v
                                }));
                            case N.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (w) return null == S || S(W.ActionNeeded), (0, ep.jsx)(aZ, {
                                    universeId: o,
                                    buttonClassName: v,
                                    placeId: r,
                                    rootPlaceId: a,
                                    privateServerLinkCode: i,
                                    gameInstanceId: l,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: h,
                                    pageContext: x
                                });
                                return null == S || S(W.Unplayable), (0, ep.jsx)(oo, {
                                    hideButtonText: d,
                                    buttonClassName: v
                                });
                            case N.ContextualPlayabilityRequireParentApproval:
                                if (w) return null == S || S(W.ActionNeeded), (0, ep.jsx)(eS, {
                                    universeId: o,
                                    buttonClassName: v,
                                    pageContext: x
                                });
                                return null == S || S(W.Unplayable), (0, ep.jsx)(oo, {
                                    hideButtonText: d,
                                    buttonClassName: v
                                });
                            case N.UnplayableOtherReason:
                            case N.GameUnapproved:
                            case N.IncorrectConfiguration:
                            case N.UniverseRootPlaceIsPrivate:
                            case N.InsufficientPermissionFriendsOnly:
                            case N.InsufficientPermissionGroupOnly:
                            case N.DeviceRestricted:
                            case N.UnderReview:
                            case N.AccountRestricted:
                            case N.TemporarilyUnavailable:
                            case N.ComplianceBlocked:
                            case N.ContextualPlayabilityRegionalCompliance:
                            case N.ContextualPlayabilityAgeGated:
                            case N.PlaceHasNoPublishedVersion:
                            case N.ContextualPlayabilityUnrated:
                            case N.ContextualPlayabilityAgeGatedByDescriptor:
                            case N.ContextualPlayabilityExperienceBlockedParentalControls:
                            case N.ContextualPlayabilityCoreGated:
                            default:
                                return null == S || S(W.Unplayable), (0, ep.jsx)(oo, {
                                    hideButtonText: d,
                                    buttonClassName: v
                                })
                        }
                    },
                    PlayButton: ow,
                    PurchaseButton: on,
                    Error: ox,
                    ContextualMessage: oA
                }
            }), h()(document).ready(function() {
                oq();
                var t = (0, y.DeviceMeta)();
                (t.isUWPApp || t.isUniversalApp) && (oC.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = oC, oT.setGameLaunchInterface(oC)), oT.setGameLaunchLogger(o_)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-b9dc5efbdff73b21.js.map