;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2efc5796-7061-a48c-3c2d-c03d14f395c2")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 328104, e => {
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

    function i(e, t, n, i) {
        return new(n || (n = Promise))(function(s, o) {
            function r(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(r, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, i, s, o = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            r = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return r.next = a(0), r.throw = a(1), r.return = a(2), "function" == typeof Symbol && (r[Symbol.iterator] = function() {
            return this
        }), r;

        function a(a) {
            return function(u) {
                var c = [a, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; r && (r = 0, c[0] && (o = 0)), o;) try {
                    if (n = 1, i && (s = 2 & c[0] ? i.return : c[0] ? i.throw || ((s = i.return) && s.call(i), 0) : i.next) && !(s = s.call(i, c[1])).done) return s;
                    switch (i = 0, s && (c = [2 & c[0], s.value]), c[0]) {
                        case 0:
                        case 1:
                            s = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = o.trys).length > 0 && s[s.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!s || c[1] > s[0] && c[1] < s[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < s[1]) {
                                o.label = s[1], s = c;
                                break
                            }
                            if (s && o.label < s[2]) {
                                o.label = s[2], o.ops.push(c);
                                break
                            }
                            s[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = t.call(e, o)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    n = s = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            notificationChannel: (0, t.exists)(n, "notificationChannel") ? n.notificationChannel : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0
        }
    }

    function r(e) {
        if (void 0 !== e) return null === e ? null : {
            notificationChannel: e.notificationChannel,
            status: e.status
        }
    }

    function a(e) {
        var n;
        return null == (n = e) ? n : {
            notificationType: (0, t.exists)(n, "notificationType") ? n.notificationType : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            localizedNotificationTypeName: (0, t.exists)(n, "localizedNotificationTypeName") ? n.localizedNotificationTypeName : void 0,
            localizedNotificationTypeDescription: (0, t.exists)(n, "localizedNotificationTypeDescription") ? n.localizedNotificationTypeDescription : void 0,
            notificationChannelPreferences: (0, t.exists)(n, "notificationChannelPreferences") ? n.notificationChannelPreferences.map(o) : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            notificationType: e.notificationType,
            status: e.status,
            localizedNotificationTypeName: e.localizedNotificationTypeName,
            localizedNotificationTypeDescription: e.localizedNotificationTypeDescription,
            notificationChannelPreferences: void 0 === e.notificationChannelPreferences ? void 0 : e.notificationChannelPreferences.map(r)
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            notificationCategoryName: (0, t.exists)(n, "notificationCategoryName") ? n.notificationCategoryName : void 0,
            localizedNotificationCategoryName: (0, t.exists)(n, "localizedNotificationCategoryName") ? n.localizedNotificationCategoryName : void 0,
            notifications: (0, t.exists)(n, "notifications") ? n.notifications.map(a) : void 0
        }
    }

    function l(e) {
        var n;
        return null == (n = e) ? n : {
            settingType: (0, t.exists)(n, "settingType") ? n.settingType : void 0,
            settingValue: (0, t.exists)(n, "settingValue") ? n.settingValue : void 0
        }
    }

    function p(e, n) {
        var i, s;
        return null == e ? e : {
            emailSettings: (0, t.exists)(e, "emailSettings") ? null == (i = e.emailSettings) ? i : {
                disableAllEmails: (0, t.exists)(i, "disableAllEmails") ? i.disableAllEmails : void 0,
                notifyJobApplication: (0, t.exists)(i, "notifyJobApplication") ? i.notifyJobApplication : void 0,
                notifyApplicantRescinded: (0, t.exists)(i, "notifyApplicantRescinded") ? i.notifyApplicantRescinded : void 0,
                notifyNewMessage: (0, t.exists)(i, "notifyNewMessage") ? i.notifyNewMessage : void 0,
                notifyApplicationStatus: (0, t.exists)(i, "notifyApplicationStatus") ? i.notifyApplicationStatus : void 0,
                notifyInviteToJob: (0, t.exists)(i, "notifyInviteToJob") ? i.notifyInviteToJob : void 0
            } : void 0,
            privacySettings: (0, t.exists)(e, "privacySettings") ? null == (s = e.privacySettings) ? s : {
                talentHubRestrictions: (0, t.exists)(s, "talentHubRestrictions") ? s.talentHubRestrictions : void 0
            } : void 0
        }
    }
    var d = function(e) {
        function o() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function i() {
                this.constructor = e
            }
            n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
        }(o, e), o.prototype.v1NotificationsSettingsPatchRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "PATCH",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        notificationsSettings: void 0 === e.notificationsSettings ? void 0 : e.notificationsSettings.map(u)
                                    }
                                }(e.updateCreatorNotificationSettingsRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r)]
                    }
                })
            })
        }, o.prototype.v1NotificationsSettingsPatch = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1NotificationsSettingsPatchRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1NotificationsSettingsPostRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        notificationChannels: e.notificationChannels
                                    }
                                }(e.getAllCreatorNotificationSettingsRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    categories: (0, t.exists)(e, "categories") ? e.categories.map(c) : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1NotificationsSettingsPost = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1NotificationsSettingsPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1NotificationsUnsubscribePostRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/unsubscribe",
                                schemaPath: "/v1/notifications/unsubscribe",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        choice: e.choice,
                                        notificationType: e.notificationType
                                    }
                                }(e.unsubscribeFromCreatorNotificationsRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r)]
                    }
                })
            })
        }, o.prototype.v1NotificationsUnsubscribePost = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1NotificationsUnsubscribePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1NotificationsValidatePostRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/validate",
                                schemaPath: "/v1/notifications/validate",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        notificationType: e.notificationType
                                    }
                                }(e.validateCreatorNotificationsUnsubscribeHashRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r)]
                    }
                })
            })
        }, o.prototype.v1NotificationsValidatePost = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1NotificationsValidatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1SettingsPatchRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "PATCH",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingsType: e.settingsType,
                                        talentHubSettings: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                emailSettings: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        disableAllEmails: e.disableAllEmails,
                                                        notifyJobApplication: e.notifyJobApplication,
                                                        notifyApplicantRescinded: e.notifyApplicantRescinded,
                                                        notifyNewMessage: e.notifyNewMessage,
                                                        notifyApplicationStatus: e.notifyApplicationStatus,
                                                        notifyInviteToJob: e.notifyInviteToJob
                                                    }
                                                }(e.emailSettings),
                                                privacySettings: function(e) {
                                                    if (void 0 !== e) return null === e ? null : {
                                                        talentHubRestrictions: e.talentHubRestrictions
                                                    }
                                                }(e.privacySettings)
                                            }
                                        }(e.talentHubSettings)
                                    }
                                }(e.updateCreatorSettingsByUserIdAndSettingsTypeRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingsType: (0, t.exists)(e, "settingsType") ? e.settingsType : void 0,
                                    talentHubSettings: (0, t.exists)(e, "talentHubSettings") ? p(e.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1SettingsPatch = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SettingsPatchRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1SettingsPostRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingsType: e.settingsType
                                    }
                                }(e.getOrCreateCreatorSettingsByUserIdAndSettingsTypeRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingsType: (0, t.exists)(e, "settingsType") ? e.settingsType : void 0,
                                    isCreated: (0, t.exists)(e, "isCreated") ? e.isCreated : void 0,
                                    talentHubSettings: (0, t.exists)(e, "talentHubSettings") ? p(e.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1SettingsPost = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SettingsPostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDeleteRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            if (null === e.settingsType || void 0 === e.settingsType) throw new t.RequiredError("settingsType", "Required parameter requestParameters.settingsType was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            return i = {}, o = {}, [4, this.request({
                                path: "/v1/settings/user_id/{userId}/settings_type/{settingsType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingsType", "}"), encodeURIComponent(String(e.settingsType))),
                                schemaPath: "/v1/settings/user_id/{userId}/settings_type/{settingsType}",
                                method: "DELETE",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    isSuccess: (0, t.exists)(e, "isSuccess") ? e.isSuccess : void 0,
                                    settingsType: (0, t.exists)(e, "settingsType") ? e.settingsType : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete = function(e, t) {
            return i(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDeleteRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1UnsubscribeUnsubscribePostRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/unsubscribe",
                                schemaPath: "/v1/unsubscribe/unsubscribe",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        unsubscribeType: e.unsubscribeType
                                    }
                                }(e.unsubscribeByHashRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    isSuccess: (0, t.exists)(e, "isSuccess") ? e.isSuccess : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1UnsubscribeUnsubscribePost = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UnsubscribeUnsubscribePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v1UnsubscribeValidatePostRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/validate",
                                schemaPath: "/v1/unsubscribe/validate",
                                method: "POST",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        unsubscribeType: e.unsubscribeType
                                    }
                                }(e.validateUnsubscribeHashRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.exists)(e, "isValid") ? e.isValid : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v1UnsubscribeValidatePost = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v1UnsubscribeValidatePostRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v2SettingsUserUserIdGetRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdGet.");
                            return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), o = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/settings/user/{userId}",
                                method: "GET",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settings: (0, t.exists)(e, "settings") ? e.settings.map(l) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v2SettingsUserUserIdGet = function(e, t) {
            return i(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v2SettingsUserUserIdSettingSettingTypeGetRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            if (null === e.settingType || void 0 === e.settingType) throw new t.RequiredError("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            return i = {}, o = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(e.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "GET",
                                headers: o,
                                query: i
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingType: (0, t.exists)(e, "settingType") ? e.settingType : void 0,
                                    settingValue: (0, t.exists)(e, "settingValue") ? e.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v2SettingsUserUserIdSettingSettingTypeGet = function(e, t) {
            return i(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdSettingSettingTypeGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o.prototype.v2SettingsUserUserIdSettingSettingTypePatchRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var i, o, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            if (null === e.settingType || void 0 === e.settingType) throw new t.RequiredError("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            return i = {}, (o = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(e.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "PATCH",
                                headers: o,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingType: e.settingType,
                                        settingValue: e.settingValue
                                    }
                                }(e.updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest)
                            }, n)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingType: (0, t.exists)(e, "settingType") ? e.settingType : void 0,
                                    settingValue: (0, t.exists)(e, "settingValue") ? e.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, o.prototype.v2SettingsUserUserIdSettingSettingTypePatch = function(e, t) {
            return i(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.v2SettingsUserUserIdSettingSettingTypePatchRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, o
    }(t.BaseAPI);
    e.s(["CreatorSettingsAPIApi", 0, d, "GenericCreatorSettingType", 0, {
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
    }, "SettingsType", 0, {
        Invalid: "SETTINGS_TYPE_INVALID",
        All: "SETTINGS_TYPE_ALL",
        TalentHub: "SETTINGS_TYPE_TALENT_HUB"
    }, "TalentHubRestrictions", 0, {
        Invalid: "TALENT_HUB_RESTRICTIONS_INVALID",
        Blocked: "TALENT_HUB_RESTRICTIONS_BLOCKED",
        VerifiedOnly: "TALENT_HUB_RESTRICTIONS_VERIFIED_ONLY",
        Open: "TALENT_HUB_RESTRICTIONS_OPEN"
    }, "UnsubscribeChoice", 0, {
        Invalid: "UNSUBSCRIBE_CHOICE_INVALID",
        One: "UNSUBSCRIBE_CHOICE_ONE",
        All: "UNSUBSCRIBE_CHOICE_ALL"
    }])
}, 266511, e => {
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

    function s(e, t, n, i) {
        return new(n || (n = Promise))(function(s, o) {
            function r(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(r, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var n, i, s, o = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            r = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return r.next = a(0), r.throw = a(1), r.return = a(2), "function" == typeof Symbol && (r[Symbol.iterator] = function() {
            return this
        }), r;

        function a(a) {
            return function(u) {
                var c = [a, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; r && (r = 0, c[0] && (o = 0)), o;) try {
                    if (n = 1, i && (s = 2 & c[0] ? i.return : c[0] ? i.throw || ((s = i.return) && s.call(i), 0) : i.next) && !(s = s.call(i, c[1])).done) return s;
                    switch (i = 0, s && (c = [2 & c[0], s.value]), c[0]) {
                        case 0:
                        case 1:
                            s = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = o.trys).length > 0 && s[s.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!s || c[1] > s[0] && c[1] < s[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < s[1]) {
                                o.label = s[1], s = c;
                                break
                            }
                            if (s && o.label < s[2]) {
                                o.label = s[2], o.ops.push(c);
                                break
                            }
                            s[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = t.call(e, o)
                } catch (e) {
                    c = [6, e], i = 0
                } finally {
                    n = s = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var r = t.BaseAPI;

    function a() {
        return null !== r && r.apply(this, arguments) || this
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

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            startTimeMinutes: e.startTimeMinutes,
            endTimeMinutes: e.endTimeMinutes
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            channelName: e.channelName,
            setting: e.setting
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            channelSettings: void 0 === e.channelSettings ? void 0 : null === e.channelSettings ? null : e.channelSettings.map(l)
        }
    }
    i(a, r), a.prototype.accountInsightsGetParentEmailsRaw = function(e, n) {
        return s(this, void 0, void 0, function() {
            var i, s, r;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return i = {}, s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/account-insights/parent-emails",
                            schemaPath: "/v1/account-insights/parent-emails",
                            method: "GET",
                            headers: s,
                            query: i
                        }, n)];
                    case 1:
                        return r = o.sent(), [2, new t.VoidApiResponse(r)]
                }
            })
        })
    }, a.prototype.accountInsightsGetParentEmails = function() {
        return s(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), o(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.accountInsightsGetParentEmailsRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    }, a.prototype.accountInsightsGetUserAgeGroupRaw = function(e, n) {
        return s(this, void 0, void 0, function() {
            var i, s, r;
            return o(this, function(o) {
                switch (o.label) {
                    case 0:
                        return i = {}, s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                            path: "/v1/account-insights/age-group",
                            schemaPath: "/v1/account-insights/age-group",
                            method: "GET",
                            headers: s,
                            query: i
                        }, n)];
                    case 1:
                        return r = o.sent(), [2, new t.VoidApiResponse(r)]
                }
            })
        })
    }, a.prototype.accountInsightsGetUserAgeGroup = function() {
        return s(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), o(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.accountInsightsGetUserAgeGroupRaw(e, t)];
                    case 1:
                        return n.sent(), [2]
                }
            })
        })
    };
    var d = function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        return i(n, e), n.prototype.userSettingsApiGetRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserSettings && (i.requestedUserSettings = e.requestedUserSettings), s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings",
                                schemaPath: "/v1/user-settings",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGet = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/metadata",
                                schemaPath: "/v1/user-settings/metadata",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetMetadata = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserPlatformSettings && (i.requestedUserPlatformSettings = e.requestedUserPlatformSettings), s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/platform",
                                schemaPath: "/v1/user-settings/platform",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetPlatformSettings = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserSettings && (i.requestedUserSettings = e.requestedUserSettings), s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/settings-and-options",
                                schemaPath: "/v1/user-settings/settings-and-options",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetSettingsAndOptions = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, void 0 !== e.requestedUserSettings && (i.requestedUserSettings = e.requestedUserSettings), s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/user-settings/settings-and-options-subset",
                                schemaPath: "/v2/user-settings/settings-and-options-subset",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiGetSettingsAndOptionsSubset = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, s = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/gpc",
                                schemaPath: "/v1/user-settings/gpc",
                                method: "POST",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiSetGlobalPrivacyControl = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings",
                                schemaPath: "/v1/user-settings",
                                method: "POST",
                                headers: s,
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
                                        doNotDisturbTimeWindow: c(e.doNotDisturbTimeWindow),
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
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiUpdate = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/user-settings/platform",
                                schemaPath: "/v1/user-settings/platform",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        palisadesCrossPlayStatusIsEnabled: e.palisadesCrossPlayStatusIsEnabled
                                    }
                                }(e.userSettingsApiUpdatePlatformSettingsRequest)
                            }, n)];
                        case 1:
                            return r = o.sent(), this.isJsonMime(r.headers.get("content-type")) ? [2, new t.JSONApiResponse(r)] : [2, new t.TextApiResponse(r)]
                    }
                })
            })
        }, n.prototype.userSettingsApiUpdatePlatformSettings = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
            return s(this, void 0, void 0, function() {
                var i, s, r;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (s["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v2/user-settings",
                                schemaPath: "/v2/user-settings",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        aggregatedDesktopNotifications: e.aggregatedDesktopNotifications,
                                        allowEnablePushNotifications: e.allowEnablePushNotifications,
                                        allowExperienceEventsNotifications: p(e.allowExperienceEventsNotifications),
                                        allowRobloxCommunityEventsNotifications: p(e.allowRobloxCommunityEventsNotifications),
                                        allowPartyInvitationsNotifications: p(e.allowPartyInvitationsNotifications),
                                        allowChatMessagesNotifications: p(e.allowChatMessagesNotifications),
                                        allowConnectionRequestReceivedNotifications: p(e.allowConnectionRequestReceivedNotifications),
                                        allowConnectionRequestAcceptedNotifications: p(e.allowConnectionRequestAcceptedNotifications),
                                        allowContactsOnRobloxNotifications: p(e.allowContactsOnRobloxNotifications),
                                        allowMarketingEmailNotifications: e.allowMarketingEmailNotifications,
                                        doNotDisturb: e.doNotDisturb,
                                        doNotDisturbTimeWindow: c(e.doNotDisturbTimeWindow),
                                        allowGroupAnnouncementsNotifications: p(e.allowGroupAnnouncementsNotifications),
                                        allowForumPostSubscriptionNotifications: p(e.allowForumPostSubscriptionNotifications),
                                        allowForumPostRepliesNotifications: p(e.allowForumPostRepliesNotifications),
                                        allowForumPostCommentsNotifications: p(e.allowForumPostCommentsNotifications),
                                        allowRecommendedExperienceNotifications: p(e.allowRecommendedExperienceNotifications),
                                        allowExperienceInvitationNotifications: p(e.allowExperienceInvitationNotifications),
                                        allowRecommendedItemsNotifications: p(e.allowRecommendedItemsNotifications),
                                        allowPromotionalOffersNotifications: p(e.allowPromotionalOffersNotifications),
                                        allowNewsAndAnnouncementsNotifications: p(e.allowNewsAndAnnouncementsNotifications),
                                        allowAIRephrase: e.allowAIRephrase,
                                        allowThirdPartySummary: e.allowThirdPartySummary,
                                        allowPresetChat: e.allowPresetChat,
                                        accountTheme: e.accountTheme
                                    }
                                }(e.v2UserSettingsApiUpdateRequest)
                            }, n)];
                        case 1:
                            return r = o.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                return null == e ? e : {
                                    cascadingSettingUpdates: (0, t.exists)(e, "cascadingSettingUpdates") ? null === e.cascadingSettingUpdates ? null : e.cascadingSettingUpdates.map(u) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v2UserSettingsApiUpdate = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
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
    e.s(["UserSettingsApiApi", 0, d])
}, 533414, e => {
    "use strict";
    var t = e.i(416340);
    let n = t.useLayoutEffect,
        i = (e, i) => (s, o) => {
            var r;
            let a, u = (0, t.useRef)(o),
                c = (0, t.useCallback)(() => {
                    try {
                        let t = e().getItem(s);
                        return t ? JSON.parse(t) : u.current
                    } catch (e) {
                        return console.warn("Error reading backingStorage (eventName: ".concat(i, ") key “").concat(s, "”:"), e), u.current
                    }
                }, [s]),
                [l, p] = (0, t.useState)(() => c());
            (0, t.useEffect)(() => {
                p(c)
            }, [c]);
            let d = (r = t => {
                try {
                    let n = t instanceof Function ? t(l) : t,
                        o = JSON.stringify(n),
                        r = e().getItem(s);
                    o !== r && (e().setItem(s, o), p(n), window.dispatchEvent(new CustomEvent(i, {
                        detail: {
                            key: s,
                            newValue: n
                        }
                    })))
                } catch (e) {
                    console.warn("Error setting backingStorage (eventName: ".concat(i, ") key “").concat(s, "”:"), e)
                }
            }, a = (0, t.useRef)(() => {
                throw Error("Cannot call an event callback while rendering")
            }), n(() => {
                a.current = r
            }, [r]), (0, t.useCallback)(function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return a.current(...t)
            }, [a]));
            return (0, t.useEffect)(() => {
                let t = e => {
                        let {
                            key: t,
                            newValue: n
                        } = e.detail;
                        t === s && p(n)
                    },
                    n = t => {
                        let {
                            key: n,
                            newValue: i
                        } = t;
                        t.storageArea === e() && n === s && p(JSON.parse(i))
                    };
                return window.addEventListener("storage", n), window.addEventListener(i, t), () => {
                    window.removeEventListener("storage", n), window.removeEventListener(i, t)
                }
            }, [s]), [l, d]
        };
    e.s(["useDebounce", 0, (e, n) => {
        let [i, s] = (0, t.useState)(e);
        return (0, t.useEffect)(() => {
            let t = setTimeout(() => {
                s(e)
            }, n);
            return () => {
                clearTimeout(t)
            }
        }, [e, n]), i
    }, "useLocalStorage", 0, (e, t) => i(() => window.localStorage, "local-storage")(e, t), "usePrevious", 0, e => {
        let n = (0, t.useRef)(void 0);
        return (0, t.useEffect)(() => {
            n.current = e
        }, [e]), n.current
    }, "useSessionStorage", 0, (e, t) => i(() => window.sessionStorage, "session-storage")(e, t)])
}, 921394, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(533414),
        i = e.i(328104),
        s = e.i(677753),
        o = e.i(266511);
    let r = (e, t) => "".concat(t, "/").concat(e),
        a = "light",
        u = "dark";
    var c, l = ((c = {}).Dark = "Dark", c.Light = "Light", c.StudioDark = "StudioDark", c.StudioLight = "StudioLight", c.SyncWWW = "SyncWWW", c.SyncDevice = "SyncDevice", c);
    let p = i.GenericCreatorSettingType.Theme,
        d = "Dark",
        h = e => Object.values(l).includes(e),
        f = async e => {
            let t = await e.getUserSetting("themeType");
            return "Dark" === ("string" == typeof t ? JSON.parse(t) : t).themeType ? u : a
        }, v = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
            if (t <= 0) return null;
            try {
                let {
                    settingValue: n = ""
                } = await e.getGenericCreatorSetting(t, p);
                if (h(n)) return n
            } catch (e) {}
            return null
        }, y = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0;
            if (n <= 0) return null;
            try {
                let {
                    settingValue: i = ""
                } = await e.updateGenericCreatorSetting(n, p, t);
                if (h(i)) return i
            } catch (e) {}
            return null
        }, g = async (e, t) => {
            switch (t) {
                case l.Dark:
                case l.StudioDark:
                    return u;
                case l.Light:
                case l.StudioLight:
                    return a;
                case l.SyncDevice:
                    var n;
                    return (null == (n = window) ? void 0 : n.matchMedia("(prefers-color-scheme: dark)")).matches ? u : a;
                case l.SyncWWW:
                    return await f(e);
                default:
                    return u
            }
        }, S = (0, t.createContext)({
            themeMode: u,
            themeOption: d,
            updateThemeMode: () => Promise.resolve(!1)
        });
    e.s(["ThemeModeProvider", 0, e => {
        let {
            currentUser: c,
            bedev2BaseUrl: p,
            children: h
        } = e, [f, w] = (0, n.useLocalStorage)("creator-hub-theme-option", d), [T, b] = (0, n.useLocalStorage)("creator-hub-theme-mode", u), I = (0, t.useRef)(null), m = (0, t.useRef)(null), A = (0, t.useRef)(!1), C = (0, t.useMemo)(() => {
            let e;
            return e = new i.CreatorSettingsAPIApi(new s.Configuration({
                basePath: r("creator-settings", p),
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
        }, [p]), E = (0, t.useMemo)(() => {
            let e;
            return e = new o.UserSettingsApiApi(new s.Configuration({
                basePath: r("user-settings-api", p),
                credentials: "include",
                enableMrRouter: !0
            })), {
                getUserSetting: t => e.userSettingsApiGet({
                    requestedUserSettings: t
                })
            }
        }, [p]), R = (0, t.useCallback)(async e => {
            try {
                let t = function(e) {
                    switch (e) {
                        case l.StudioDark:
                            return u;
                        case l.StudioLight:
                            return a;
                        default:
                            return null
                    }
                }(e);
                if (t) return w(e), b(t), A.current = !0, !0;
                let n = await y(C, e, null == c ? void 0 : c.id);
                if (null !== n) {
                    let e = await g(E, n);
                    return w(n), b(e), !0
                }
            } catch (e) {}
            return !1
        }, [C, null == c ? void 0 : c.id, b, w, E]), N = (0, t.useMemo)(() => ({
            themeOption: f,
            themeMode: T,
            updateThemeMode: R
        }), [T, f, R]);
        return (0, t.useEffect)(() => {
            (async () => {
                if (A.current) return;
                let e = await v(C, null == c ? void 0 : c.id);
                if (null !== e && !A.current) {
                    let t = await g(E, e);
                    w(e), b(t)
                }
            })()
        }, [C, null == c ? void 0 : c.id, b, w, E]), (0, t.useEffect)(() => (I.current || (I.current = window.matchMedia("(prefers-color-scheme: dark)")), m.current || (m.current = e => {
            b(e.matches ? u : a)
        }), f === l.SyncDevice && I.current.addEventListener("change", m.current), () => {
            I.current && m.current && I.current.removeEventListener("change", m.current)
        }), [b, f]), t.default.createElement(S.Provider, {
            value: N
        }, h)
    }, "ThemeOption", 0, l, "useThemeMode", 0, () => {
        let e = (0, t.useContext)(S);
        if (!e) throw Error("useThemeMode must be used within a ThemeProvider");
        return e
    }])
}]);

//# debugId=2efc5796-7061-a48c-3c2d-c03d14f395c2
//# sourceMappingURL=2eeclze0qqpv-.js.map