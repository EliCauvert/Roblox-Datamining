;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1afb42e6-814d-3521-b488-db699d2e5d4a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 272593, 650502, t => {
    "use strict";
    var e = t.i(677753),
        s = t.i(215955);

    function o(t) {
        return "https://".concat(t, ".").concat("roblox.com")
    }

    function i(t) {
        return "".concat("https://apis.roblox.com", "/").concat(t)
    }
    t.s(["getBEDEV1ServiceBasePath", 0, o, "getBEDEV2ServiceBasePath", 0, i], 650502), t.s(["createClientConfiguration", 0, function(t, n, r) {
        var l, c;
        let a = "bedev1" === n ? o(t) : i(t),
            u = null == (l = null == r ? void 0 : r.enableMrRouter) || l;
        return new e.Configuration({
            robloxSiteDomain: "roblox.com",
            basePath: a,
            credentials: null != (c = null == r ? void 0 : r.credentials) ? c : "include",
            unifiedLogger: s.default,
            enableMrRouter: u,
            ...(null == r ? void 0 : r.middleware) && {
                middleware: r.middleware
            },
            ...(null == r ? void 0 : r.enableBoundAuthToken) !== void 0 && {
                enableBoundAuthToken: r.enableBoundAuthToken
            },
            ...(null == r ? void 0 : r.boundAuthTokenLoadTimeout) !== void 0 && {
                boundAuthTokenLoadTimeout: r.boundAuthTokenLoadTimeout
            },
            ...(null == r ? void 0 : r.boundAuthTokenDataTimeout) !== void 0 && {
                boundAuthTokenDataTimeout: r.boundAuthTokenDataTimeout
            }
        })
    }], 272593)
}, 328104, t => {
    "use strict";
    var e = t.i(677753),
        s = function(t, e) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(t, e) {
                t.__proto__ = e
            } || function(t, e) {
                for (var s in e) Object.prototype.hasOwnProperty.call(e, s) && (t[s] = e[s])
            })(t, e)
        };

    function o(t, e, s, o) {
        return new(s || (s = Promise))(function(i, n) {
            function r(t) {
                try {
                    c(o.next(t))
                } catch (t) {
                    n(t)
                }
            }

            function l(t) {
                try {
                    c(o.throw(t))
                } catch (t) {
                    n(t)
                }
            }

            function c(t) {
                var e;
                t.done ? i(t.value) : ((e = t.value) instanceof s ? e : new s(function(t) {
                    t(e)
                })).then(r, l)
            }
            c((o = o.apply(t, e || [])).next())
        })
    }

    function i(t, e) {
        var s, o, i, n = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            r = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return r.next = l(0), r.throw = l(1), r.return = l(2), "function" == typeof Symbol && (r[Symbol.iterator] = function() {
            return this
        }), r;

        function l(l) {
            return function(c) {
                var a = [l, c];
                if (s) throw TypeError("Generator is already executing.");
                for (; r && (r = 0, a[0] && (n = 0)), n;) try {
                    if (s = 1, o && (i = 2 & a[0] ? o.return : a[0] ? o.throw || ((i = o.return) && i.call(o), 0) : o.next) && !(i = i.call(o, a[1])).done) return i;
                    switch (o = 0, i && (a = [2 & a[0], i.value]), a[0]) {
                        case 0:
                        case 1:
                            i = a;
                            break;
                        case 4:
                            return n.label++, {
                                value: a[1],
                                done: !1
                            };
                        case 5:
                            n.label++, o = a[1], a = [0];
                            continue;
                        case 7:
                            a = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = n.trys).length > 0 && i[i.length - 1]) && (6 === a[0] || 2 === a[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === a[0] && (!i || a[1] > i[0] && a[1] < i[3])) {
                                n.label = a[1];
                                break
                            }
                            if (6 === a[0] && n.label < i[1]) {
                                n.label = i[1], i = a;
                                break
                            }
                            if (i && n.label < i[2]) {
                                n.label = i[2], n.ops.push(a);
                                break
                            }
                            i[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    a = e.call(t, n)
                } catch (t) {
                    a = [6, t], o = 0
                } finally {
                    s = i = 0
                }
                if (5 & a[0]) throw a[1];
                return {
                    value: a[0] ? a[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function n(t) {
        var s;
        return null == (s = t) ? s : {
            notificationChannel: (0, e.exists)(s, "notificationChannel") ? s.notificationChannel : void 0,
            status: (0, e.exists)(s, "status") ? s.status : void 0
        }
    }

    function r(t) {
        if (void 0 !== t) return null === t ? null : {
            notificationChannel: t.notificationChannel,
            status: t.status
        }
    }

    function l(t) {
        var s;
        return null == (s = t) ? s : {
            notificationType: (0, e.exists)(s, "notificationType") ? s.notificationType : void 0,
            status: (0, e.exists)(s, "status") ? s.status : void 0,
            localizedNotificationTypeName: (0, e.exists)(s, "localizedNotificationTypeName") ? s.localizedNotificationTypeName : void 0,
            localizedNotificationTypeDescription: (0, e.exists)(s, "localizedNotificationTypeDescription") ? s.localizedNotificationTypeDescription : void 0,
            notificationChannelPreferences: (0, e.exists)(s, "notificationChannelPreferences") ? s.notificationChannelPreferences.map(n) : void 0
        }
    }

    function c(t) {
        if (void 0 !== t) return null === t ? null : {
            notificationType: t.notificationType,
            status: t.status,
            localizedNotificationTypeName: t.localizedNotificationTypeName,
            localizedNotificationTypeDescription: t.localizedNotificationTypeDescription,
            notificationChannelPreferences: void 0 === t.notificationChannelPreferences ? void 0 : t.notificationChannelPreferences.map(r)
        }
    }

    function a(t) {
        var s;
        return null == (s = t) ? s : {
            notificationCategoryName: (0, e.exists)(s, "notificationCategoryName") ? s.notificationCategoryName : void 0,
            localizedNotificationCategoryName: (0, e.exists)(s, "localizedNotificationCategoryName") ? s.localizedNotificationCategoryName : void 0,
            notifications: (0, e.exists)(s, "notifications") ? s.notifications.map(l) : void 0
        }
    }

    function u(t) {
        var s;
        return null == (s = t) ? s : {
            settingType: (0, e.exists)(s, "settingType") ? s.settingType : void 0,
            settingValue: (0, e.exists)(s, "settingValue") ? s.settingValue : void 0
        }
    }

    function p(t, s) {
        var o, i;
        return null == t ? t : {
            emailSettings: (0, e.exists)(t, "emailSettings") ? null == (o = t.emailSettings) ? o : {
                disableAllEmails: (0, e.exists)(o, "disableAllEmails") ? o.disableAllEmails : void 0,
                notifyJobApplication: (0, e.exists)(o, "notifyJobApplication") ? o.notifyJobApplication : void 0,
                notifyApplicantRescinded: (0, e.exists)(o, "notifyApplicantRescinded") ? o.notifyApplicantRescinded : void 0,
                notifyNewMessage: (0, e.exists)(o, "notifyNewMessage") ? o.notifyNewMessage : void 0,
                notifyApplicationStatus: (0, e.exists)(o, "notifyApplicationStatus") ? o.notifyApplicationStatus : void 0,
                notifyInviteToJob: (0, e.exists)(o, "notifyInviteToJob") ? o.notifyInviteToJob : void 0
            } : void 0,
            privacySettings: (0, e.exists)(t, "privacySettings") ? null == (i = t.privacySettings) ? i : {
                talentHubRestrictions: (0, e.exists)(i, "talentHubRestrictions") ? i.talentHubRestrictions : void 0
            } : void 0
        }
    }
    var d = function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        return function(t, e) {
            if ("function" != typeof e && null !== e) throw TypeError("Class extends value " + String(e) + " is not a constructor or null");

            function o() {
                this.constructor = t
            }
            s(t, e), t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o)
        }(n, t), n.prototype.v1NotificationsSettingsPatchRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "PATCH",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        notificationsSettings: void 0 === t.notificationsSettings ? void 0 : t.notificationsSettings.map(c)
                                    }
                                }(t.updateCreatorNotificationSettingsRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r)]
                    }
                })
            })
        }, n.prototype.v1NotificationsSettingsPatch = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1NotificationsSettingsPatchRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1NotificationsSettingsPostRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "POST",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        notificationChannels: t.notificationChannels
                                    }
                                }(t.getAllCreatorNotificationSettingsRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    categories: (0, e.exists)(t, "categories") ? t.categories.map(a) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1NotificationsSettingsPost = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1NotificationsSettingsPostRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1NotificationsUnsubscribePostRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/unsubscribe",
                                schemaPath: "/v1/notifications/unsubscribe",
                                method: "POST",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        hash: t.hash,
                                        choice: t.choice,
                                        notificationType: t.notificationType
                                    }
                                }(t.unsubscribeFromCreatorNotificationsRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r)]
                    }
                })
            })
        }, n.prototype.v1NotificationsUnsubscribePost = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1NotificationsUnsubscribePostRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1NotificationsValidatePostRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/validate",
                                schemaPath: "/v1/notifications/validate",
                                method: "POST",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        hash: t.hash,
                                        notificationType: t.notificationType
                                    }
                                }(t.validateCreatorNotificationsUnsubscribeHashRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r)]
                    }
                })
            })
        }, n.prototype.v1NotificationsValidatePost = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1NotificationsValidatePostRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1SettingsPatchRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "PATCH",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        settingsType: t.settingsType,
                                        talentHubSettings: function(t) {
                                            if (void 0 !== t) return null === t ? null : {
                                                emailSettings: function(t) {
                                                    if (void 0 !== t) return null === t ? null : {
                                                        disableAllEmails: t.disableAllEmails,
                                                        notifyJobApplication: t.notifyJobApplication,
                                                        notifyApplicantRescinded: t.notifyApplicantRescinded,
                                                        notifyNewMessage: t.notifyNewMessage,
                                                        notifyApplicationStatus: t.notifyApplicationStatus,
                                                        notifyInviteToJob: t.notifyInviteToJob
                                                    }
                                                }(t.emailSettings),
                                                privacySettings: function(t) {
                                                    if (void 0 !== t) return null === t ? null : {
                                                        talentHubRestrictions: t.talentHubRestrictions
                                                    }
                                                }(t.privacySettings)
                                            }
                                        }(t.talentHubSettings)
                                    }
                                }(t.updateCreatorSettingsByUserIdAndSettingsTypeRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    userId: (0, e.exists)(t, "userId") ? t.userId : void 0,
                                    settingsType: (0, e.exists)(t, "settingsType") ? t.settingsType : void 0,
                                    talentHubSettings: (0, e.exists)(t, "talentHubSettings") ? p(t.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1SettingsPatch = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1SettingsPatchRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1SettingsPostRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "POST",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        settingsType: t.settingsType
                                    }
                                }(t.getOrCreateCreatorSettingsByUserIdAndSettingsTypeRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    userId: (0, e.exists)(t, "userId") ? t.userId : void 0,
                                    settingsType: (0, e.exists)(t, "settingsType") ? t.settingsType : void 0,
                                    isCreated: (0, e.exists)(t, "isCreated") ? t.isCreated : void 0,
                                    talentHubSettings: (0, e.exists)(t, "talentHubSettings") ? p(t.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1SettingsPost = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1SettingsPostRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDeleteRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new e.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            if (null === t.settingsType || void 0 === t.settingsType) throw new e.RequiredError("settingsType", "Required parameter requestParameters.settingsType was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            return o = {}, n = {}, [4, this.request({
                                path: "/v1/settings/user_id/{userId}/settings_type/{settingsType}".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))).replace("{".concat("settingsType", "}"), encodeURIComponent(String(t.settingsType))),
                                schemaPath: "/v1/settings/user_id/{userId}/settings_type/{settingsType}",
                                method: "DELETE",
                                headers: n,
                                query: o
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    isSuccess: (0, e.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    settingsType: (0, e.exists)(t, "settingsType") ? t.settingsType : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete = function(t, e) {
            return o(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDeleteRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1UnsubscribeUnsubscribePostRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/unsubscribe",
                                schemaPath: "/v1/unsubscribe/unsubscribe",
                                method: "POST",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        hash: t.hash,
                                        unsubscribeType: t.unsubscribeType
                                    }
                                }(t.unsubscribeByHashRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    isSuccess: (0, e.exists)(t, "isSuccess") ? t.isSuccess : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UnsubscribeUnsubscribePost = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1UnsubscribeUnsubscribePostRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v1UnsubscribeValidatePostRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/validate",
                                schemaPath: "/v1/unsubscribe/validate",
                                method: "POST",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        hash: t.hash,
                                        unsubscribeType: t.unsubscribeType
                                    }
                                }(t.validateUnsubscribeHashRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    isValid: (0, e.exists)(t, "isValid") ? t.isValid : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UnsubscribeValidatePost = function() {
            return o(this, arguments, void 0, function(t, e) {
                return void 0 === t && (t = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v1UnsubscribeValidatePostRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v2SettingsUserUserIdGetRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new e.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdGet.");
                            return o = {}, void 0 !== t.maxPageSize && (o.maxPageSize = t.maxPageSize), void 0 !== t.pageToken && (o.pageToken = t.pageToken), n = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))),
                                schemaPath: "/v2/settings/user/{userId}",
                                method: "GET",
                                headers: n,
                                query: o
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    userId: (0, e.exists)(t, "userId") ? t.userId : void 0,
                                    settings: (0, e.exists)(t, "settings") ? t.settings.map(u) : void 0,
                                    nextPageToken: (0, e.exists)(t, "nextPageToken") ? t.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v2SettingsUserUserIdGet = function(t, e) {
            return o(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdGetRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v2SettingsUserUserIdSettingSettingTypeGetRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new e.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            if (null === t.settingType || void 0 === t.settingType) throw new e.RequiredError("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            return o = {}, n = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(t.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "GET",
                                headers: n,
                                query: o
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    userId: (0, e.exists)(t, "userId") ? t.userId : void 0,
                                    settingType: (0, e.exists)(t, "settingType") ? t.settingType : void 0,
                                    settingValue: (0, e.exists)(t, "settingValue") ? t.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v2SettingsUserUserIdSettingSettingTypeGet = function(t, e) {
            return o(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdSettingSettingTypeGetRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n.prototype.v2SettingsUserUserIdSettingSettingTypePatchRaw = function(t, s) {
            return o(this, void 0, void 0, function() {
                var o, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new e.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            if (null === t.settingType || void 0 === t.settingType) throw new e.RequiredError("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            return o = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(t.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "PATCH",
                                headers: n,
                                query: o,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        settingType: t.settingType,
                                        settingValue: t.settingValue
                                    }
                                }(t.updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest)
                            }, s)];
                        case 1:
                            return r = i.sent(), [2, new e.JSONApiResponse(r, function(t) {
                                return null == t ? t : {
                                    userId: (0, e.exists)(t, "userId") ? t.userId : void 0,
                                    settingType: (0, e.exists)(t, "settingType") ? t.settingType : void 0,
                                    settingValue: (0, e.exists)(t, "settingValue") ? t.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v2SettingsUserUserIdSettingSettingTypePatch = function(t, e) {
            return o(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdSettingSettingTypePatchRaw(t, e)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, n
    }(e.BaseAPI);
    t.s(["CreatorSettingsAPIApi", 0, d, "GenericCreatorSettingType", 0, {
        Invalid: "GENERIC_CREATOR_SETTING_TYPE_INVALID",
        Theme: "GENERIC_CREATOR_SETTING_TYPE_THEME",
        HomeHomepageUpsell: "GENERIC_CREATOR_SETTING_TYPE_HOME_HOMEPAGE_UPSELL",
        HomeStudioDocumentationUpsell: "GENERIC_CREATOR_SETTING_TYPE_HOME_STUDIO_DOCUMENTATION_UPSELL",
        HomeShowTour: "GENERIC_CREATOR_SETTING_TYPE_HOME_SHOW_TOUR",
        DataSharingDefaults: "GENERIC_CREATOR_SETTING_TYPE_DATA_SHARING_DEFAULTS",
        ShowMinimumSpecBanner: "GENERIC_CREATOR_SETTING_TYPE_SHOW_MINIMUM_SPEC_BANNER",
        HubHomeLastViewedDate: "GENERIC_CREATOR_SETTING_TYPE_HUB_HOME_LAST_VIEWED_DATE",
        CoursesTakeSurveyBanner: "GENERIC_CREATOR_SETTING_TYPE_COURSES_TAKE_SURVEY_BANNER",
        CoursesExploreCoursesBanner: "GENERIC_CREATOR_SETTING_TYPE_COURSES_EXPLORE_COURSES_BANNER",
        HomeAgeVerificationUpsell: "GENERIC_CREATOR_SETTING_TYPE_HOME_AGE_VERIFICATION_UPSELL",
        NotificationsM2Tooltip: "GENERIC_CREATOR_SETTING_TYPE_NOTIFICATIONS_M2_TOOLTIP",
        GroupUnifiedAcknowledgement: "GENERIC_CREATOR_SETTING_TYPE_GROUP_UNIFIED_ACKNOWLEDGEMENT"
    }, "NotificationPreferenceStatus", 0, {
        Invalid: "NOTIFICATION_PREFERENCE_STATUS_INVALID",
        All: "NOTIFICATION_PREFERENCE_STATUS_ALL",
        Personalized: "NOTIFICATION_PREFERENCE_STATUS_PERSONALIZED",
        None: "NOTIFICATION_PREFERENCE_STATUS_NONE"
    }, "UnsubscribeChoice", 0, {
        Invalid: "UNSUBSCRIBE_CHOICE_INVALID",
        One: "UNSUBSCRIBE_CHOICE_ONE",
        All: "UNSUBSCRIBE_CHOICE_ALL"
    }])
}, 260022, t => {
    "use strict";
    let e = {
        reportAppealsUrl: {
            global: {
                development: "https://www.sitetest3.robloxlabs.com/report-appeals",
                sitetest3: "https://www.sitetest3.robloxlabs.com/report-appeals",
                sitetest2: "https://www.sitetest2.robloxlabs.com/report-appeals",
                sitetest1: "https://www.sitetest1.robloxlabs.com/report-appeals",
                production: "https://www.roblox.com/report-appeals"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        playRobloxUrl: {
            global: {
                development: "https://play.sitetest3.robloxlabs.com",
                sitetest3: "https://play.sitetest3.robloxlabs.com",
                sitetest2: "https://play.sitetest2.robloxlabs.com",
                sitetest1: "https://play.sitetest1.robloxlabs.com",
                production: "https://play.roblox.com"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        accountSessionProtectionHelpArticle: {
            global: {
                development: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest3: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest2: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest1: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                production: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aiBasedToolsSupplementalTermsAndDisclaimer: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                production: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorsRestrictionsOnUse: {
            global: {
                development: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest3: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest2: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest1: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                production: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        agreementsManagerUrl: {
            global: {
                development: "https://content-licensing-public-test.simulpong.com",
                sitetest3: "https://content-licensing-public-test.simulpong.com",
                sitetest2: "https://content-licensing-public-test.simulpong.com",
                sitetest1: "https://content-licensing-public-test.simulpong.com",
                production: "https://agreements-manageraws.rbxcdn.com"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devForumWAYWOCInspirationUrl: {
            global: {
                development: "http://devforum.roblox.com/waywoc",
                sitetest3: "http://devforum.roblox.com/waywoc",
                sitetest2: "http://devforum.roblox.com/waywoc",
                sitetest1: "http://devforum.roblox.com/waywoc",
                production: "http://devforum.roblox.com/waywoc"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        shopifyMerchantUrl: {
            global: {
                development: "https://apps.shopify.com/roblox",
                sitetest3: "https://apps.shopify.com/roblox",
                sitetest2: "https://apps.shopify.com/roblox",
                sitetest1: "https://apps.shopify.com/roblox",
                production: "https://apps.shopify.com/roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        copyrightFairUseUrl: {
            global: {
                development: "https://copyright.gov/fair-use/",
                sitetest3: "https://copyright.gov/fair-use/",
                sitetest2: "https://copyright.gov/fair-use/",
                sitetest1: "https://copyright.gov/fair-use/",
                production: "https://copyright.gov/fair-use/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aboutUsUrl: {
            global: {
                development: "https://www.roblox.com/info/about-us",
                sitetest3: "https://www.roblox.com/info/about-us",
                sitetest2: "https://www.roblox.com/info/about-us",
                sitetest1: "https://www.roblox.com/info/about-us",
                production: "https://www.roblox.com/info/about-us"
            },
            luobu: {
                development: "https://corp.roblox.cn/",
                sitetest3: "https://corp.roblox.cn/",
                sitetest2: "https://corp.roblox.cn/",
                sitetest1: "https://corp.roblox.cn/",
                production: "https://corp.roblox.cn/"
            }
        },
        joinUsUrl: {
            global: {
                development: "https://www.roblox.com/info/jobs",
                sitetest3: "https://www.roblox.com/info/jobs",
                sitetest2: "https://www.roblox.com/info/jobs",
                sitetest1: "https://www.roblox.com/info/jobs",
                production: "https://www.roblox.com/info/jobs"
            },
            luobu: {
                development: "https://corp.roblox.cn/career/",
                sitetest3: "https://corp.roblox.cn/career/",
                sitetest2: "https://corp.roblox.cn/career/",
                sitetest1: "https://corp.roblox.cn/career/",
                production: "https://corp.roblox.cn/career/"
            }
        },
        termsOfServiceUrl: {
            global: {
                development: "https://www.roblox.com/info/terms",
                sitetest3: "https://www.roblox.com/info/terms",
                sitetest2: "https://www.roblox.com/info/terms",
                sitetest1: "https://www.roblox.com/info/terms",
                production: "https://www.roblox.com/info/terms"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-terms.html",
                sitetest3: "https://robloxdev.cn/dev-terms.html",
                sitetest2: "https://robloxdev.cn/dev-terms.html",
                sitetest1: "https://robloxdev.cn/dev-terms.html",
                production: "https://robloxdev.cn/dev-terms.html"
            }
        },
        privacyPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/privacy",
                sitetest3: "https://www.roblox.com/info/privacy",
                sitetest2: "https://www.roblox.com/info/privacy",
                sitetest1: "https://www.roblox.com/info/privacy",
                production: "https://www.roblox.com/info/privacy"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest3: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest2: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest1: "https://robloxdev.cn/dev-privacy-policy.html",
                production: "https://robloxdev.cn/dev-privacy-policy.html"
            }
        },
        accessibilityPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/accessibility",
                sitetest3: "https://www.roblox.com/info/accessibility",
                sitetest2: "https://www.roblox.com/info/accessibility",
                sitetest1: "https://www.roblox.com/info/accessibility",
                production: "https://www.roblox.com/info/accessibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devexPolicyUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest3: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest2: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest1: "https://robloxdev.cn/dev-ex-policy.html",
                production: "https://robloxdev.cn/dev-ex-policy.html"
            }
        },
        robloxCubeAnnouncementUrl: {
            global: {
                development: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest3: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest2: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest1: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                production: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleBadgesSpecialGameAwardsUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest3: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest2: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest1: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                production: "https://developer.roblox.com/articles/Badges-Special-Game-Awards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleProductsInGamePurchasesUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest3: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest2: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest1: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                production: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleRedirectCreatePlaceAsyncUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest3: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest2: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest1: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                production: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleCreateVipServerUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest3: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest2: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest1: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                production: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleGamesAndPlacesUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest3: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest2: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest1: "https://developer.roblox.com/en-us/articles/games-and-places",
                production: "https://developer.roblox.com/en-us/articles/games-and-places"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        ugcSubscriptionTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest3: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest2: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest1: "https://en.help.roblox.com/hc/articles/19694609252884/",
                production: "https://en.help.roblox.com/hc/articles/19694609252884/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorStoreTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest3: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest2: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest1: "https://en.help.roblox.com/hc/articles/21308223046932",
                production: "https://en.help.roblox.com/hc/articles/21308223046932"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        accountVerificationUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                production: "https://create.roblox.com/docs/en-us/production/publishing/account-verification#verify-through-government-id"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioUploadLicenseAgreementUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest3: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest2: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest1: "https://en.help.roblox.com/hc/articles/23359485439124",
                production: "https://en.help.roblox.com/hc/articles/23359485439124"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioThumbnailModerationUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                production: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        extendedServicesTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest3: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest2: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest1: "https://en.help.roblox.com/hc/articles/37967848292500",
                production: "https://en.help.roblox.com/hc/articles/37967848292500"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                production: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        advertisingStandardsUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                production: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                production: "https://en.help.roblox.com/hc/en-us/articles/15887203369620"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        dataCollectionOptInUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                production: "https://en.help.roblox.com/hc/en-us/articles/18922542221076"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxCommunityStandardsUrl: {
            global: {
                development: "https://about.roblox.com/community-standards",
                sitetest3: "https://about.roblox.com/community-standards",
                sitetest2: "https://about.roblox.com/community-standards",
                sitetest1: "https://about.roblox.com/community-standards",
                production: "https://about.roblox.com/community-standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyPolicyUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                production: "https://en.help.roblox.com/hc/en-us/articles/37924211313044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorAnalyticsTermsOfUseUrl: {
            global: {
                development: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest3: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest2: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest1: "https://help.roblox.com/hc/articles/10949046065044",
                production: "https://help.roblox.com/hc/articles/10949046065044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        friendRewardsTermsOfUseUrl: {
            global: {
                development: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest3: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest2: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest1: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                production: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerExchangeHelpAndInformationPageUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                production: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        trustedConnectionsLearnMoreUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                production: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        templateUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        gameDetailsPageDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        songEligibilityDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        }
    };
    t.s(["getProductionCreatorHubUrl", 0, t => "luobu" === t ? "https://create.roblox.cn" : "https://create.roblox.com", "resolveUrl", 0, (t, s, o) => {
        var i, n;
        return (null == (n = e[t]) || null == (i = n[o]) ? void 0 : i[s]) || (console.warn("No URL found for ".concat(t, " in environment ").concat(s, " and target ").concat(o)), "")
    }])
}, 533414, t => {
    "use strict";
    var e = t.i(416340);
    let s = e.useLayoutEffect,
        o = (t, o) => (i, n) => {
            var r;
            let l, c = (0, e.useRef)(n),
                a = (0, e.useCallback)(() => {
                    try {
                        let e = t().getItem(i);
                        return e ? JSON.parse(e) : c.current
                    } catch (t) {
                        return console.warn("Error reading backingStorage (eventName: ".concat(o, ") key “").concat(i, "”:"), t), c.current
                    }
                }, [i]),
                [u, p] = (0, e.useState)(() => a());
            (0, e.useEffect)(() => {
                p(a)
            }, [a]);
            let d = (r = e => {
                try {
                    let s = e instanceof Function ? e(u) : e,
                        n = JSON.stringify(s),
                        r = t().getItem(i);
                    n !== r && (t().setItem(i, n), p(s), window.dispatchEvent(new CustomEvent(o, {
                        detail: {
                            key: i,
                            newValue: s
                        }
                    })))
                } catch (t) {
                    console.warn("Error setting backingStorage (eventName: ".concat(o, ") key “").concat(i, "”:"), t)
                }
            }, l = (0, e.useRef)(() => {
                throw Error("Cannot call an event callback while rendering")
            }), s(() => {
                l.current = r
            }, [r]), (0, e.useCallback)(function() {
                for (var t = arguments.length, e = Array(t), s = 0; s < t; s++) e[s] = arguments[s];
                return l.current(...e)
            }, [l]));
            return (0, e.useEffect)(() => {
                let e = t => {
                        let {
                            key: e,
                            newValue: s
                        } = t.detail;
                        e === i && p(s)
                    },
                    s = e => {
                        let {
                            key: s,
                            newValue: o
                        } = e;
                        e.storageArea === t() && s === i && p(JSON.parse(o))
                    };
                return window.addEventListener("storage", s), window.addEventListener(o, e), () => {
                    window.removeEventListener("storage", s), window.removeEventListener(o, e)
                }
            }, [i]), [u, d]
        };
    t.s(["useDebounce", 0, (t, s) => {
        let [o, i] = (0, e.useState)(t);
        return (0, e.useEffect)(() => {
            let e = setTimeout(() => {
                i(t)
            }, s);
            return () => {
                clearTimeout(e)
            }
        }, [t, s]), o
    }, "useInterval", 0, (t, s) => {
        let o = (0, e.useRef)(t);
        (0, e.useEffect)(() => {
            o.current = t
        }, [t]), (0, e.useEffect)(() => {
            if (null === s) return;
            let t = setInterval(() => o.current(), s);
            return () => {
                clearInterval(t)
            }
        }, [s])
    }, "useLocalStorage", 0, (t, e) => o(() => window.localStorage, "local-storage")(t, e), "usePrevious", 0, t => {
        let s = (0, e.useRef)(void 0);
        return (0, e.useEffect)(() => {
            s.current = t
        }, [t]), s.current
    }, "useSessionStorage", 0, (t, e) => o(() => window.sessionStorage, "session-storage")(t, e)])
}]);

//# debugId=1afb42e6-814d-3521-b488-db699d2e5d4a
//# sourceMappingURL=1c6jgyb8bkndp.js.map