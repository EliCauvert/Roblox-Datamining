;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1f968e66-22c9-7e89-ab96-6baf0923c1fa")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 897547, e => {
    "use strict";
    var t = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function o(e, t, n, i) {
        return new(n || (n = Promise))(function(o, r) {
            function s(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(s, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var n, i, o, r = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = a(0), s.throw = a(1), s.return = a(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function a(a) {
            return function(u) {
                var l = [a, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, l[0] && (r = 0)), r;) try {
                    if (n = 1, i && (o = 2 & l[0] ? i.return : l[0] ? i.throw || ((o = i.return) && o.call(i), 0) : i.next) && !(o = o.call(i, l[1])).done) return o;
                    switch (i = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                        case 0:
                        case 1:
                            o = l;
                            break;
                        case 4:
                            return r.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = r.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                r.label = l[1];
                                break
                            }
                            if (6 === l[0] && r.label < o[1]) {
                                r.label = o[1], o = l;
                                break
                            }
                            if (o && r.label < o[2]) {
                                r.label = o[2], r.ops.push(l);
                                break
                            }
                            o[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    l = t.call(e, r)
                } catch (e) {
                    l = [6, e], i = 0
                } finally {
                    n = o = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var s = t.BaseAPI;

    function a() {
        return null !== s && s.apply(this, arguments) || this
    }

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            updateFriendsAboutMyActivity: (0, t.exists)(n, "updateFriendsAboutMyActivity") ? n.updateFriendsAboutMyActivity : void 0,
            whoCanJoinMeInExperiences: (0, t.exists)(n, "whoCanJoinMeInExperiences") ? n.whoCanJoinMeInExperiences : void 0,
            whoCanTradeWithMe: (0, t.exists)(n, "whoCanTradeWithMe") ? n.whoCanTradeWithMe : void 0,
            whoCanSeeMyInventory: (0, t.exists)(n, "whoCanSeeMyInventory") ? n.whoCanSeeMyInventory : void 0,
            whoCanChatWithMeInExperiences: (0, t.exists)(n, "whoCanChatWithMeInExperiences") ? n.whoCanChatWithMeInExperiences : void 0,
            whoCanWhisperChatWithMeInExperiences: (0, t.exists)(n, "whoCanWhisperChatWithMeInExperiences") ? n.whoCanWhisperChatWithMeInExperiences : void 0,
            whoCanChatWithMeInApp: (0, t.exists)(n, "whoCanChatWithMeInApp") ? n.whoCanChatWithMeInApp : void 0,
            whoCanGroupChatWithMeInApp: (0, t.exists)(n, "whoCanGroupChatWithMeInApp") ? n.whoCanGroupChatWithMeInApp : void 0,
            doNotDisturb: (0, t.exists)(n, "doNotDisturb") ? n.doNotDisturb : void 0,
            whoCanPartyWithMe: (0, t.exists)(n, "whoCanPartyWithMe") ? n.whoCanPartyWithMe : void 0,
            whoCanUsePartyChatWithMe: (0, t.exists)(n, "whoCanUsePartyChatWithMe") ? n.whoCanUsePartyChatWithMe : void 0,
            whoCanUsePartyVoiceWithMe: (0, t.exists)(n, "whoCanUsePartyVoiceWithMe") ? n.whoCanUsePartyVoiceWithMe : void 0,
            allowAIRephrase: (0, t.exists)(n, "allowAIRephrase") ? n.allowAIRephrase : void 0,
            allowThirdPartySummary: (0, t.exists)(n, "allowThirdPartySummary") ? n.allowThirdPartySummary : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            startTimeMinutes: e.startTimeMinutes,
            endTimeMinutes: e.endTimeMinutes
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            channelName: e.channelName,
            setting: e.setting
        }
    }

    function h(e) {
        if (void 0 !== e) return null === e ? null : {
            channelSettings: void 0 === e.channelSettings ? void 0 : null === e.channelSettings ? null : e.channelSettings.map(c)
        }
    }
    i(a, s), a.prototype.accountInsightsGetParentEmailsRaw = function(e, n) {
        return o(this, void 0, void 0, function() {
            var i, o, s;
            return r(this, function(r) {
                switch (r.label) {
                    case 0:
                        return i = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/account-insights/parent-emails",
                            schemaPath: "/v1/account-insights/parent-emails",
                            method: "GET",
                            headers: o,
                            query: i
                        }, n)];
                    case 1:
                        return s = r.sent(), [2, new t.VoidApiResponse(s)]
                }
            })
        })
    }, a.prototype.accountInsightsGetParentEmails = function() {
        return o(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), r(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.accountInsightsGetParentEmailsRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, a.prototype.accountInsightsGetUserAgeGroupRaw = function(e, n) {
        return o(this, void 0, void 0, function() {
            var i, o, s;
            return r(this, function(r) {
                switch (r.label) {
                    case 0:
                        return i = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/account-insights/age-group",
                            schemaPath: "/v1/account-insights/age-group",
                            method: "GET",
                            headers: o,
                            query: i
                        }, n)];
                    case 1:
                        return s = r.sent(), [2, new t.VoidApiResponse(s)]
                }
            })
        })
    }, a.prototype.accountInsightsGetUserAgeGroup = function() {
        return o(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), r(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.accountInsightsGetUserAgeGroupRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var p = function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        return i(n, e), n.prototype.userSettingsApiGetRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserSettings && (i.requestedUserSettings = e.requestedUserSettings), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings",
                                schemaPath: "/v1/user-settings",
                                method: "GET",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGet = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetMetadataRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/metadata",
                                schemaPath: "/v1/user-settings/metadata",
                                method: "GET",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetMetadata = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiGetMetadataRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetPlatformSettingsRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserPlatformSettings && (i.requestedUserPlatformSettings = e.requestedUserPlatformSettings), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/platform",
                                schemaPath: "/v1/user-settings/platform",
                                method: "GET",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetPlatformSettings = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiGetPlatformSettingsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetSettingsAndOptionsRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserSettings && (i.requestedUserSettings = e.requestedUserSettings), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/settings-and-options",
                                schemaPath: "/v1/user-settings/settings-and-options",
                                method: "GET",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetSettingsAndOptions = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiGetSettingsAndOptionsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetSettingsAndOptionsSubsetRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserSettings && (i.requestedUserSettings = e.requestedUserSettings), o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/user-settings/settings-and-options-subset",
                                schemaPath: "/v2/user-settings/settings-and-options-subset",
                                method: "GET",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetSettingsAndOptionsSubset = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiGetSettingsAndOptionsSubsetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.userSettingsApiSetGlobalPrivacyControlRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, o = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/gpc",
                                schemaPath: "/v1/user-settings/gpc",
                                method: "POST",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiSetGlobalPrivacyControl = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiSetGlobalPrivacyControlRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.userSettingsApiUpdateRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings",
                                schemaPath: "/v1/user-settings",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        phoneNumberDiscoverability: e.phoneNumberDiscoverability,
                                        contentAgeRestriction: e.contentAgeRestriction,
                                        privateServerJoinRestriction: e.privateServerJoinRestriction,
                                        themeType: e.themeType,
                                        canUploadContacts: e.canUploadContacts,
                                        whoCanChatWithMe: e.whoCanChatWithMe,
                                        whoCanChatWithMeInExperiences: e.whoCanChatWithMeInExperiences,
                                        whoCanWhisperChatWithMeInExperiences: e.whoCanWhisperChatWithMeInExperiences,
                                        whoCanChatWithMeInApp: e.whoCanChatWithMeInApp,
                                        whoCanGroupChatWithMeInApp: e.whoCanGroupChatWithMeInApp,
                                        whoCanJoinMeInExperiences: e.whoCanJoinMeInExperiences,
                                        voiceChatOptIn: e.voiceChatOptIn,
                                        IsOptedInThroughUpsell: e.isOptedInThroughUpsell,
                                        whoCanSeeMyInventory: e.whoCanSeeMyInventory,
                                        whoCanSeeMySocialNetworks: e.whoCanSeeMySocialNetworks,
                                        whoCanTradeWithMe: e.whoCanTradeWithMe,
                                        tradeQualityFilter: e.tradeQualityFilter,
                                        xboxCrossPlayStatusIsEnabled: e.xboxCrossPlayStatusIsEnabled,
                                        privateServerInvitePrivacy: e.privateServerInvitePrivacy,
                                        privateServerPrivacy: e.privateServerPrivacy,
                                        boundAuthTokenValidation: e.boundAuthTokenValidation,
                                        updateFriendsAboutMyActivity: e.updateFriendsAboutMyActivity,
                                        friendSuggestions: e.friendSuggestions,
                                        allowSellShareData: e.allowSellShareData,
                                        allowPersonalizedAdvertising: e.allowPersonalizedAdvertising,
                                        allowVoiceDataUsage: e.allowVoiceDataUsage,
                                        dailyScreenTimeLimit: e.dailyScreenTimeLimit,
                                        enablePurchases: e.enablePurchases,
                                        whoCanOneOnOnePartyWithMe: e.whoCanOneOnOnePartyWithMe,
                                        whoCanGroupPartyWithMe: e.whoCanGroupPartyWithMe,
                                        whoCanSeeMyOnlineStatus: e.whoCanSeeMyOnlineStatus,
                                        doNotDisturb: e.doNotDisturb,
                                        doNotDisturbTimeWindow: l(e.doNotDisturbTimeWindow),
                                        allowEnableEmailNotifications: e.allowEnableEmailNotifications,
                                        allowAnnouncementsEmailNotifications: e.allowAnnouncementsEmailNotifications,
                                        allowMarketingEmailNotifications: e.allowMarketingEmailNotifications,
                                        allowEnableExperienceNotifications: e.allowEnableExperienceNotifications,
                                        eppEnrollmentStatus: e.eppEnrollmentStatus,
                                        allowSensitiveIssues: e.allowSensitiveIssues,
                                        allowFacialAgeEstimation: e.allowFacialAgeEstimation,
                                        allowCrossAgeGroupStudioCollaboration: e.allowCrossAgeGroupStudioCollaboration,
                                        whoCanPartyWithMe: e.whoCanPartyWithMe,
                                        whoCanUsePartyChatWithMe: e.whoCanUsePartyChatWithMe,
                                        whoCanUsePartyVoiceWithMe: e.whoCanUsePartyVoiceWithMe,
                                        allowAIRephrase: e.allowAIRephrase,
                                        allowThirdPartySummary: e.allowThirdPartySummary,
                                        accountTheme: e.accountTheme
                                    }
                                }(e.userSettingsApiUpdateRequest)
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiUpdate = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiUpdateRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.userSettingsApiUpdatePlatformSettingsRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/platform",
                                schemaPath: "/v1/user-settings/platform",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        palisadesCrossPlayStatusIsEnabled: e.palisadesCrossPlayStatusIsEnabled
                                    }
                                }(e.userSettingsApiUpdatePlatformSettingsRequest)
                            }, n)];
                        case 1:
                            return s = r.sent(), this.isJsonMime(s.headers.get("content-type")) ? [2, new t.JSONApiResponse(s)] : [2, new t.TextApiResponse(s)]
                    }
                })
            })
        }, n.prototype.userSettingsApiUpdatePlatformSettings = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.userSettingsApiUpdatePlatformSettingsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.v2UserSettingsApiUpdateRaw = function(e, n) {
            return o(this, void 0, void 0, function() {
                var i, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (o["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/user-settings",
                                schemaPath: "/v2/user-settings",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        aggregatedDesktopNotifications: e.aggregatedDesktopNotifications,
                                        allowEnablePushNotifications: e.allowEnablePushNotifications,
                                        allowExperienceEventsNotifications: h(e.allowExperienceEventsNotifications),
                                        allowRobloxCommunityEventsNotifications: h(e.allowRobloxCommunityEventsNotifications),
                                        allowPartyInvitationsNotifications: h(e.allowPartyInvitationsNotifications),
                                        allowChatMessagesNotifications: h(e.allowChatMessagesNotifications),
                                        allowConnectionRequestReceivedNotifications: h(e.allowConnectionRequestReceivedNotifications),
                                        allowConnectionRequestAcceptedNotifications: h(e.allowConnectionRequestAcceptedNotifications),
                                        allowContactsOnRobloxNotifications: h(e.allowContactsOnRobloxNotifications),
                                        allowMarketingEmailNotifications: e.allowMarketingEmailNotifications,
                                        doNotDisturb: e.doNotDisturb,
                                        doNotDisturbTimeWindow: l(e.doNotDisturbTimeWindow),
                                        allowGroupAnnouncementsNotifications: h(e.allowGroupAnnouncementsNotifications),
                                        allowForumPostSubscriptionNotifications: h(e.allowForumPostSubscriptionNotifications),
                                        allowForumPostRepliesNotifications: h(e.allowForumPostRepliesNotifications),
                                        allowForumPostCommentsNotifications: h(e.allowForumPostCommentsNotifications),
                                        allowRecommendedExperienceNotifications: h(e.allowRecommendedExperienceNotifications),
                                        allowExperienceInvitationNotifications: h(e.allowExperienceInvitationNotifications),
                                        allowRecommendedItemsNotifications: h(e.allowRecommendedItemsNotifications),
                                        allowPromotionalOffersNotifications: h(e.allowPromotionalOffersNotifications),
                                        allowNewsAndAnnouncementsNotifications: h(e.allowNewsAndAnnouncementsNotifications),
                                        allowAIRephrase: e.allowAIRephrase,
                                        allowThirdPartySummary: e.allowThirdPartySummary,
                                        allowPresetChat: e.allowPresetChat,
                                        accountTheme: e.accountTheme
                                    }
                                }(e.v2UserSettingsApiUpdateRequest)
                            }, n)];
                        case 1:
                            return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                return null == e ? e : {
                                    cascadingSettingUpdates: (0, t.exists)(e, "cascadingSettingUpdates") ? null === e.cascadingSettingUpdates ? null : e.cascadingSettingUpdates.map(u) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v2UserSettingsApiUpdate = function() {
            return o(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2UserSettingsApiUpdateRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n
    }(t.BaseAPI);
    e.s(["UserSettingsApiApi", 0, p])
}, 921394, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(533414),
        i = e.i(328104),
        o = e.i(677753),
        r = e.i(897547);
    let s = (e, t) => "".concat(t, "/").concat(e),
        a = "light",
        u = "dark";
    var l, c = ((l = {}).Dark = "Dark", l.Light = "Light", l.StudioDark = "StudioDark", l.StudioLight = "StudioLight", l.SyncWWW = "SyncWWW", l.SyncDevice = "SyncDevice", l);
    let h = i.GenericCreatorSettingType.Theme,
        p = "Dark",
        d = e => Object.values(c).includes(e),
        w = async e => {
            let t = await e.getUserSetting("themeType");
            return "Dark" === ("string" == typeof t ? JSON.parse(t) : t).themeType ? u : a
        }, y = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
            if (t <= 0) return null;
            try {
                let {
                    settingValue: n = ""
                } = await e.getGenericCreatorSetting(t, h);
                if (d(n)) return n
            } catch (e) {}
            return null
        }, v = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0;
            if (n <= 0) return null;
            try {
                let {
                    settingValue: i = ""
                } = await e.updateGenericCreatorSetting(n, h, t);
                if (d(i)) return i
            } catch (e) {}
            return null
        }, f = async (e, t) => {
            switch (t) {
                case c.Dark:
                case c.StudioDark:
                    return u;
                case c.Light:
                case c.StudioLight:
                    return a;
                case c.SyncDevice:
                    var n;
                    return (null == (n = window) ? void 0 : n.matchMedia("(prefers-color-scheme: dark)")).matches ? u : a;
                case c.SyncWWW:
                    return await w(e);
                default:
                    return u
            }
        }, g = (0, t.createContext)({
            themeMode: u,
            themeOption: p,
            updateThemeMode: () => Promise.resolve(!1)
        });
    e.s(["ThemeModeProvider", 0, e => {
        let {
            currentUser: l,
            bedev2BaseUrl: h,
            children: d
        } = e, [w, S] = (0, n.useLocalStorage)("creator-hub-theme-option", p), [m, A] = (0, n.useLocalStorage)("creator-hub-theme-mode", u), b = (0, t.useRef)(null), C = (0, t.useRef)(null), x = (0, t.useRef)(!1), M = (0, t.useMemo)(() => {
            let e;
            return e = new i.CreatorSettingsAPIApi(new o.Configuration({
                basePath: s("creator-settings", h),
                credentials: "include",
                enableMrRouter: !0
            })), {
                getGenericCreatorSetting: (t, n) => e.v2SettingsUserUserIdSettingSettingTypeGet({
                    userId: t,
                    settingType: n
                }),
                updateGenericCreatorSetting: (t, n, i) => e.v2SettingsUserUserIdSettingSettingTypePatch({
                    userId: t,
                    settingType: n,
                    updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest: {
                        settingValue: i
                    }
                })
            }
        }, [h]), P = (0, t.useMemo)(() => {
            let e;
            return e = new r.UserSettingsApiApi(new o.Configuration({
                basePath: s("user-settings-api", h),
                credentials: "include",
                enableMrRouter: !0
            })), {
                getUserSetting: t => e.userSettingsApiGet({
                    requestedUserSettings: t
                })
            }
        }, [h]), R = (0, t.useCallback)(async e => {
            try {
                let t = function(e) {
                    switch (e) {
                        case c.StudioDark:
                            return u;
                        case c.StudioLight:
                            return a;
                        default:
                            return null
                    }
                }(e);
                if (t) return S(e), A(t), x.current = !0, !0;
                let n = await v(M, e, null == l ? void 0 : l.id);
                if (null !== n) {
                    let e = await f(P, n);
                    return S(n), A(e), !0
                }
            } catch (e) {}
            return !1
        }, [M, null == l ? void 0 : l.id, A, S, P]), T = (0, t.useMemo)(() => ({
            themeOption: w,
            themeMode: m,
            updateThemeMode: R
        }), [m, w, R]);
        return (0, t.useEffect)(() => {
            (async () => {
                if (x.current) return;
                let e = await y(M, null == l ? void 0 : l.id);
                if (null !== e && !x.current) {
                    let t = await f(P, e);
                    S(e), A(t)
                }
            })()
        }, [M, null == l ? void 0 : l.id, A, S, P]), (0, t.useEffect)(() => (b.current || (b.current = window.matchMedia("(prefers-color-scheme: dark)")), C.current || (C.current = e => {
            A(e.matches ? u : a)
        }), w === c.SyncDevice && b.current.addEventListener("change", C.current), () => {
            b.current && C.current && b.current.removeEventListener("change", C.current)
        }), [A, w]), t.default.createElement(g.Provider, {
            value: T
        }, d)
    }, "ThemeOption", 0, c, "useThemeMode", 0, () => {
        let e = (0, t.useContext)(g);
        if (!e) throw Error("useThemeMode must be used within a ThemeProvider");
        return e
    }])
}]);

//# debugId=1f968e66-22c9-7e89-ab96-6baf0923c1fa
//# sourceMappingURL=3pbtzgptiim7r.js.map