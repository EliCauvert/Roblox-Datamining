;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d9b994d4-5c25-80b4-1509-8107f2f69447")
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

    function r(e, t, n, r) {
        return new(n || (n = Promise))(function(i, s) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var n, r, i, s = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var c = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (s = 0)), s;) try {
                    if (n = 1, r && (i = 2 & c[0] ? r.return : c[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, c[1])).done) return i;
                    switch (r = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, r = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = s.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < i[1]) {
                                s.label = i[1], i = c;
                                break
                            }
                            if (i && s.label < i[2]) {
                                s.label = i[2], s.ops.push(c);
                                break
                            }
                            i[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = t.call(e, s)
                } catch (e) {
                    c = [6, e], r = 0
                } finally {
                    n = i = 0
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

    function s(e) {
        var n;
        return null == (n = e) ? n : {
            notificationChannel: (0, t.exists)(n, "notificationChannel") ? n.notificationChannel : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0
        }
    }

    function a(e) {
        if (void 0 !== e) return null === e ? null : {
            notificationChannel: e.notificationChannel,
            status: e.status
        }
    }

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            notificationType: (0, t.exists)(n, "notificationType") ? n.notificationType : void 0,
            status: (0, t.exists)(n, "status") ? n.status : void 0,
            localizedNotificationTypeName: (0, t.exists)(n, "localizedNotificationTypeName") ? n.localizedNotificationTypeName : void 0,
            localizedNotificationTypeDescription: (0, t.exists)(n, "localizedNotificationTypeDescription") ? n.localizedNotificationTypeDescription : void 0,
            notificationChannelPreferences: (0, t.exists)(n, "notificationChannelPreferences") ? n.notificationChannelPreferences.map(s) : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            notificationType: e.notificationType,
            status: e.status,
            localizedNotificationTypeName: e.localizedNotificationTypeName,
            localizedNotificationTypeDescription: e.localizedNotificationTypeDescription,
            notificationChannelPreferences: void 0 === e.notificationChannelPreferences ? void 0 : e.notificationChannelPreferences.map(a)
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            notificationCategoryName: (0, t.exists)(n, "notificationCategoryName") ? n.notificationCategoryName : void 0,
            localizedNotificationCategoryName: (0, t.exists)(n, "localizedNotificationCategoryName") ? n.localizedNotificationCategoryName : void 0,
            notifications: (0, t.exists)(n, "notifications") ? n.notifications.map(o) : void 0
        }
    }

    function l(e) {
        var n;
        return null == (n = e) ? n : {
            settingType: (0, t.exists)(n, "settingType") ? n.settingType : void 0,
            settingValue: (0, t.exists)(n, "settingValue") ? n.settingValue : void 0
        }
    }

    function d(e, n) {
        var r, i;
        return null == e ? e : {
            emailSettings: (0, t.exists)(e, "emailSettings") ? null == (r = e.emailSettings) ? r : {
                disableAllEmails: (0, t.exists)(r, "disableAllEmails") ? r.disableAllEmails : void 0,
                notifyJobApplication: (0, t.exists)(r, "notifyJobApplication") ? r.notifyJobApplication : void 0,
                notifyApplicantRescinded: (0, t.exists)(r, "notifyApplicantRescinded") ? r.notifyApplicantRescinded : void 0,
                notifyNewMessage: (0, t.exists)(r, "notifyNewMessage") ? r.notifyNewMessage : void 0,
                notifyApplicationStatus: (0, t.exists)(r, "notifyApplicationStatus") ? r.notifyApplicationStatus : void 0,
                notifyInviteToJob: (0, t.exists)(r, "notifyInviteToJob") ? r.notifyInviteToJob : void 0
            } : void 0,
            privacySettings: (0, t.exists)(e, "privacySettings") ? null == (i = e.privacySettings) ? i : {
                talentHubRestrictions: (0, t.exists)(i, "talentHubRestrictions") ? i.talentHubRestrictions : void 0
            } : void 0
        }
    }
    var v = function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function r() {
                this.constructor = e
            }
            n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
        }(s, e), s.prototype.v1NotificationsSettingsPatchRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "PATCH",
                                headers: s,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        notificationsSettings: void 0 === e.notificationsSettings ? void 0 : e.notificationsSettings.map(u)
                                    }
                                }(e.updateCreatorNotificationSettingsRequest)
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a)]
                    }
                })
            })
        }, s.prototype.v1NotificationsSettingsPatch = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v1NotificationsSettingsPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/settings",
                                schemaPath: "/v1/notifications/settings",
                                method: "POST",
                                headers: s,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        notificationChannels: e.notificationChannels
                                    }
                                }(e.getAllCreatorNotificationSettingsRequest)
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    categories: (0, t.exists)(e, "categories") ? e.categories.map(c) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1NotificationsSettingsPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v1NotificationsUnsubscribePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/unsubscribe",
                                schemaPath: "/v1/notifications/unsubscribe",
                                method: "POST",
                                headers: s,
                                query: r,
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
                            return a = i.sent(), [2, new t.JSONApiResponse(a)]
                    }
                })
            })
        }, s.prototype.v1NotificationsUnsubscribePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v1NotificationsValidatePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/notifications/validate",
                                schemaPath: "/v1/notifications/validate",
                                method: "POST",
                                headers: s,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        notificationType: e.notificationType
                                    }
                                }(e.validateCreatorNotificationsUnsubscribeHashRequest)
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a)]
                    }
                })
            })
        }, s.prototype.v1NotificationsValidatePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v1SettingsPatchRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "PATCH",
                                headers: s,
                                query: r,
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
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingsType: (0, t.exists)(e, "settingsType") ? e.settingsType : void 0,
                                    talentHubSettings: (0, t.exists)(e, "talentHubSettings") ? d(e.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SettingsPatch = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v1SettingsPostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/settings",
                                schemaPath: "/v1/settings",
                                method: "POST",
                                headers: s,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingsType: e.settingsType
                                    }
                                }(e.getOrCreateCreatorSettingsByUserIdAndSettingsTypeRequest)
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingsType: (0, t.exists)(e, "settingsType") ? e.settingsType : void 0,
                                    isCreated: (0, t.exists)(e, "isCreated") ? e.isCreated : void 0,
                                    talentHubSettings: (0, t.exists)(e, "talentHubSettings") ? d(e.talentHubSettings) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SettingsPost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDeleteRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            if (null === e.settingsType || void 0 === e.settingsType) throw new t.RequiredError("settingsType", "Required parameter requestParameters.settingsType was null or undefined when calling v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete.");
                            return r = {}, s = {}, [4, this.request({
                                path: "/v1/settings/user_id/{userId}/settings_type/{settingsType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingsType", "}"), encodeURIComponent(String(e.settingsType))),
                                schemaPath: "/v1/settings/user_id/{userId}/settings_type/{settingsType}",
                                method: "DELETE",
                                headers: s,
                                query: r
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    isSuccess: (0, t.exists)(e, "isSuccess") ? e.isSuccess : void 0,
                                    settingsType: (0, t.exists)(e, "settingsType") ? e.settingsType : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1SettingsUserIdUserIdSettingsTypeSettingsTypeDelete = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
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
        }, s.prototype.v1UnsubscribeUnsubscribePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/unsubscribe",
                                schemaPath: "/v1/unsubscribe/unsubscribe",
                                method: "POST",
                                headers: s,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        unsubscribeType: e.unsubscribeType
                                    }
                                }(e.unsubscribeByHashRequest)
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    isSuccess: (0, t.exists)(e, "isSuccess") ? e.isSuccess : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1UnsubscribeUnsubscribePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v1UnsubscribeValidatePostRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/unsubscribe/validate",
                                schemaPath: "/v1/unsubscribe/validate",
                                method: "POST",
                                headers: s,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        hash: e.hash,
                                        unsubscribeType: e.unsubscribeType
                                    }
                                }(e.validateUnsubscribeHashRequest)
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    isValid: (0, t.exists)(e, "isValid") ? e.isValid : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v1UnsubscribeValidatePost = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(n) {
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
        }, s.prototype.v2SettingsUserUserIdGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdGet.");
                            return r = {}, void 0 !== e.maxPageSize && (r.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (r.pageToken = e.pageToken), s = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/settings/user/{userId}",
                                method: "GET",
                                headers: s,
                                query: r
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settings: (0, t.exists)(e, "settings") ? e.settings.map(l) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v2SettingsUserUserIdGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
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
        }, s.prototype.v2SettingsUserUserIdSettingSettingTypeGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            if (null === e.settingType || void 0 === e.settingType) throw new t.RequiredError("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypeGet.");
                            return r = {}, s = {}, [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(e.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "GET",
                                headers: s,
                                query: r
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingType: (0, t.exists)(e, "settingType") ? e.settingType : void 0,
                                    settingValue: (0, t.exists)(e, "settingValue") ? e.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v2SettingsUserUserIdSettingSettingTypeGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
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
        }, s.prototype.v2SettingsUserUserIdSettingSettingTypePatchRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var r, s, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            if (null === e.settingType || void 0 === e.settingType) throw new t.RequiredError("settingType", "Required parameter requestParameters.settingType was null or undefined when calling v2SettingsUserUserIdSettingSettingTypePatch.");
                            return r = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v2/settings/user/{userId}/setting/{settingType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("settingType", "}"), encodeURIComponent(String(e.settingType))),
                                schemaPath: "/v2/settings/user/{userId}/setting/{settingType}",
                                method: "PATCH",
                                headers: s,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        userId: e.userId,
                                        settingType: e.settingType,
                                        settingValue: e.settingValue
                                    }
                                }(e.updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest)
                            }, n)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
                                    settingType: (0, t.exists)(e, "settingType") ? e.settingType : void 0,
                                    settingValue: (0, t.exists)(e, "settingValue") ? e.settingValue : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.v2SettingsUserUserIdSettingSettingTypePatch = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(n) {
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
        }, s
    }(t.BaseAPI);
    e.s(["CreatorSettingsAPIApi", 0, v, "GenericCreatorSettingType", 0, {
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
}, 620140, e => {
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

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function i(e, t, n, r) {
        return new(n || (n = Promise))(function(i, s) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, r, i, s = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var c = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (s = 0)), s;) try {
                    if (n = 1, r && (i = 2 & c[0] ? r.return : c[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, c[1])).done) return i;
                    switch (r = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, r = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = s.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < i[1]) {
                                s.label = i[1], i = c;
                                break
                            }
                            if (i && s.label < i[2]) {
                                s.label = i[2], s.ops.push(c);
                                break
                            }
                            i[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = t.call(e, s)
                } catch (e) {
                    c = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e) {
        var n;
        return null == (n = e) ? n : {
            targetId: (0, t.exists)(n, "targetId") ? n.targetId : void 0,
            state: (0, t.exists)(n, "state") ? n.state : void 0,
            imageUrl: (0, t.exists)(n, "imageUrl") ? n.imageUrl : void 0,
            version: (0, t.exists)(n, "version") ? n.version : void 0
        }
    }

    function o(e) {
        var n, r;
        return null == (n = e) ? n : {
            universeId: (0, t.exists)(n, "universeId") ? n.universeId : void 0,
            error: (0, t.exists)(n, "error") ? null == (r = n.error) ? r : {
                code: (0, t.exists)(r, "code") ? r.code : void 0,
                message: (0, t.exists)(r, "message") ? r.message : void 0,
                userFacingMessage: (0, t.exists)(r, "userFacingMessage") ? r.userFacingMessage : void 0,
                field: (0, t.exists)(r, "field") ? r.field : void 0,
                fieldData: (0, t.exists)(r, "fieldData") ? r.fieldData : void 0
            } : void 0,
            thumbnails: (0, t.exists)(n, "thumbnails") ? n.thumbnails.map(a) : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            requestId: e.requestId,
            targetId: e.targetId,
            token: e.token,
            alias: e.alias,
            type: e.type,
            size: e.size,
            format: e.format,
            isCircular: e.isCircular,
            accessContext: e.accessContext,
            headShape: e.headShape
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            requestId: (0, t.exists)(n, "requestId") ? n.requestId : void 0,
            errorCode: (0, t.exists)(n, "errorCode") ? n.errorCode : void 0,
            errorMessage: (0, t.exists)(n, "errorMessage") ? n.errorMessage : void 0,
            targetId: (0, t.exists)(n, "targetId") ? n.targetId : void 0,
            state: (0, t.exists)(n, "state") ? n.state : void 0,
            imageUrl: (0, t.exists)(n, "imageUrl") ? n.imageUrl : void 0,
            version: (0, t.exists)(n, "version") ? n.version : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, n) {
        return null == e ? e : {
            data: (0, t.exists)(e, "data") ? e.data.map(a) : void 0
        }
    }
    var d = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1AssetThumbnailAnimatedGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetThumbnailAnimatedGet.");
                                return r = {}, void 0 !== e.assetId && (r.assetId = e.assetId), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/asset-thumbnail-animated",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetThumbnailAnimatedGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetThumbnailAnimatedGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1AssetsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new t.RequiredError("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsGet.");
                                return r = {}, e.assetIds && (r.assetIds = e.assetIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1AssetsThumbnail3dGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsThumbnail3dGet.");
                                return r = {}, void 0 !== e.assetId && (r.assetId = e.assetId), void 0 !== e.useGltf && (r.useGltf = e.useGltf), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets-thumbnail-3d",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetsThumbnail3dGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsThumbnail3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        v = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1UsersAvatar3dGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersAvatar3dGet.");
                                return r = {}, void 0 !== e.userId && (r.userId = e.userId), i = {}, [4, this.request({
                                    path: "/v1/users/avatar-3d",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatar3dGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatar3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarBustGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarBustGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/avatar-bust",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarBustGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarBustGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/avatar",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarHeadshotGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarHeadshotGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/avatar-headshot",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarHeadshotGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarHeadshotGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        h = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BadgesIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.badgeIds || void 0 === e.badgeIds) throw new t.RequiredError("badgeIds", "Required parameter requestParameters.badgeIds was null or undefined when calling v1BadgesIconsGet.");
                                return r = {}, e.badgeIds && (r.badgeIds = e.badgeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/badges/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1BadgesIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BadgesIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        p = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BatchPostRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.requests || void 0 === e.requests) throw new t.RequiredError("requests", "Required parameter requestParameters.requests was null or undefined when calling v1BatchPost.");
                                return r = {}, (i = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/batch",
                                    method: "POST",
                                    headers: i,
                                    query: r,
                                    body: e.requests.map(u)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1BatchPost = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BatchPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        f = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BundlesThumbnailsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.bundleIds || void 0 === e.bundleIds) throw new t.RequiredError("bundleIds", "Required parameter requestParameters.bundleIds was null or undefined when calling v1BundlesThumbnailsGet.");
                                return r = {}, e.bundleIds && (r.bundleIds = e.bundleIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/bundles/thumbnails",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1BundlesThumbnailsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BundlesThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        m = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1DeveloperProductsIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.developerProductIds || void 0 === e.developerProductIds) throw new t.RequiredError("developerProductIds", "Required parameter requestParameters.developerProductIds was null or undefined when calling v1DeveloperProductsIconsGet.");
                                return r = {}, e.developerProductIds && (r.developerProductIds = e.developerProductIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/developer-products/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1DeveloperProductsIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1DeveloperProductsIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        g = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GamePassesGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.gamePassIds || void 0 === e.gamePassIds) throw new t.RequiredError("gamePassIds", "Required parameter requestParameters.gamePassIds was null or undefined when calling v1GamePassesGet.");
                                return r = {}, e.gamePassIds && (r.gamePassIds = e.gamePassIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/game-passes",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamePassesGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamePassesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        I = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GamesIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesIconsGet.");
                                return r = {}, e.universeIds && (r.universeIds = e.universeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/games/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1GamesMultigetThumbnailsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesMultigetThumbnailsGet.");
                                return r = {}, e.universeIds && (r.universeIds = e.universeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.countPerUniverse && (r.countPerUniverse = e.countPerUniverse), void 0 !== e.defaults && (r.defaults = e.defaults), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/games/multiget/thumbnails",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(o) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesMultigetThumbnailsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesMultigetThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1GamesUniverseIdThumbnailsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                if (null === e.thumbnailIds || void 0 === e.thumbnailIds) throw new t.RequiredError("thumbnailIds", "Required parameter requestParameters.thumbnailIds was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                return r = {}, e.thumbnailIds && (r.thumbnailIds = e.thumbnailIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/thumbnails".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesUniverseIdThumbnailsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        b = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GroupsIconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.groupIds || void 0 === e.groupIds) throw new t.RequiredError("groupIds", "Required parameter requestParameters.groupIds was null or undefined when calling v1GroupsIconsGet.");
                                return r = {}, e.groupIds && (r.groupIds = e.groupIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/groups/icons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GroupsIconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GroupsIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        T = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1UsersOutfit3dGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.outfitId || void 0 === e.outfitId) throw new t.RequiredError("outfitId", "Required parameter requestParameters.outfitId was null or undefined when calling v1UsersOutfit3dGet.");
                                return r = {}, void 0 !== e.outfitId && (r.outfitId = e.outfitId), i = {}, [4, this.request({
                                    path: "/v1/users/outfit-3d",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfit3dGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersOutfit3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfitsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userOutfitIds || void 0 === e.userOutfitIds) throw new t.RequiredError("userOutfitIds", "Required parameter requestParameters.userOutfitIds was null or undefined when calling v1UsersOutfitsGet.");
                                return r = {}, e.userOutfitIds && (r.userOutfitIds = e.userOutfitIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/users/outfits",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfitsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersOutfitsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        w = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1PlacesGameiconsGetRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var r, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeIds || void 0 === e.placeIds) throw new t.RequiredError("placeIds", "Required parameter requestParameters.placeIds was null or undefined when calling v1PlacesGameiconsGet.");
                                return r = {}, e.placeIds && (r.placeIds = e.placeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), i = {}, [4, this.request({
                                    path: "/v1/places/gameicons",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1PlacesGameiconsGet = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesGameiconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI);
    e.s(["AssetsApi", 0, d, "AvatarApi", 0, v, "BadgesApi", 0, h, "BatchApi", 0, p, "BundlesApi", 0, f, "DeveloperProductsApi", 0, m, "GamePassesApi", 0, g, "GamesApi", 0, I, "GroupEmblemApi", 0, b, "OutfitsApi", 0, T, "PlacesApi", 0, w, "RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum", 0, {
        Avatar: "Avatar",
        AvatarHeadShot: "AvatarHeadShot",
        GameIcon: "GameIcon",
        BadgeIcon: "BadgeIcon",
        GameThumbnail: "GameThumbnail",
        GamePass: "GamePass",
        Asset: "Asset",
        BundleThumbnail: "BundleThumbnail",
        Outfit: "Outfit",
        GroupIcon: "GroupIcon",
        DeveloperProduct: "DeveloperProduct",
        AvatarBust: "AvatarBust",
        AutoGeneratedAsset: "AutoGeneratedAsset",
        PlaceIcon: "PlaceIcon",
        AutoGeneratedGameIcon: "AutoGeneratedGameIcon",
        ForceAutoGeneratedGameIcon: "ForceAutoGeneratedGameIcon",
        Look: "Look",
        CreatorContextAsset: "CreatorContextAsset",
        Screenshot: "Screenshot"
    }, "RobloxWebResponsesThumbnailsThumbnailBatchResponseStateEnum", 0, {
        Error: "Error",
        Completed: "Completed",
        InReview: "InReview",
        Pending: "Pending",
        Blocked: "Blocked",
        TemporarilyUnavailable: "TemporarilyUnavailable"
    }, "RobloxWebResponsesThumbnailsThumbnailResponseStateEnum", 0, {
        Error: "Error",
        Completed: "Completed",
        InReview: "InReview",
        Pending: "Pending",
        Blocked: "Blocked",
        TemporarilyUnavailable: "TemporarilyUnavailable"
    }, "V1AssetsGetFormatEnum", 0, {
        Png: "Png",
        Jpeg: "Jpeg",
        Webp: "Webp"
    }, "V1AssetsGetIsCircularEnum", 0, {
        True: !0,
        False: !1
    }, "V1AssetsGetReturnPolicyEnum", 0, {
        PlaceHolder: "PlaceHolder",
        ForcePlaceHolder: "ForcePlaceHolder",
        AutoGenerated: "AutoGenerated",
        ForceAutoGenerated: "ForceAutoGenerated"
    }, "V1AssetsGetSizeEnum", 0, {
        _30x30: "30x30",
        _42x42: "42x42",
        _50x50: "50x50",
        _60x62: "60x62",
        _75x75: "75x75",
        _110x110: "110x110",
        _140x140: "140x140",
        _150x150: "150x150",
        _160x100: "160x100",
        _160x600: "160x600",
        _250x250: "250x250",
        _256x144: "256x144",
        _300x250: "300x250",
        _304x166: "304x166",
        _384x216: "384x216",
        _396x216: "396x216",
        _420x420: "420x420",
        _480x270: "480x270",
        _512x512: "512x512",
        _576x324: "576x324",
        _700x700: "700x700",
        _728x90: "728x90",
        _768x432: "768x432",
        _1200x80: "1200x80",
        _330x110: "330x110",
        _660x220: "660x220",
        _1320x440: "1320x440",
        _720x228: "720x228",
        _1440x456: "1440x456",
        _930x480: "930x480"
    }, "V1BadgesIconsGetSizeEnum", 0, {
        _150x150: "150x150"
    }, "V1BundlesThumbnailsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "V1DeveloperProductsIconsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "V1GamePassesGetSizeEnum", 0, {
        _150x150: "150x150"
    }, "V1GamesIconsGetSizeEnum", 0, {
        _50x50: "50x50",
        _128x128: "128x128",
        _150x150: "150x150",
        _256x256: "256x256",
        _420x420: "420x420",
        _512x512: "512x512"
    }, "V1GamesMultigetThumbnailsGetSizeEnum", 0, {
        _768x432: "768x432",
        _576x324: "576x324",
        _480x270: "480x270",
        _384x216: "384x216",
        _256x144: "256x144"
    }, "V1GamesUniverseIdThumbnailsGetSizeEnum", 0, {
        _768x432: "768x432",
        _576x324: "576x324",
        _480x270: "480x270",
        _384x216: "384x216",
        _256x144: "256x144"
    }, "V1GroupsIconsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "V1PlacesGameiconsGetFormatEnum", 0, {
        Png: "Png",
        Jpeg: "Jpeg",
        Webp: "Webp"
    }, "V1PlacesGameiconsGetIsCircularEnum", 0, {
        True: !0,
        False: !1
    }, "V1PlacesGameiconsGetReturnPolicyEnum", 0, {
        PlaceHolder: "PlaceHolder",
        ForcePlaceHolder: "ForcePlaceHolder",
        AutoGenerated: "AutoGenerated",
        ForceAutoGenerated: "ForceAutoGenerated"
    }, "V1PlacesGameiconsGetSizeEnum", 0, {
        _50x50: "50x50",
        _128x128: "128x128",
        _150x150: "150x150",
        _256x256: "256x256",
        _420x420: "420x420",
        _512x512: "512x512"
    }, "V1UsersAvatarGetSizeEnum", 0, {
        _30x30: "30x30",
        _48x48: "48x48",
        _60x60: "60x60",
        _75x75: "75x75",
        _100x100: "100x100",
        _110x110: "110x110",
        _140x140: "140x140",
        _150x150: "150x150",
        _150x200: "150x200",
        _180x180: "180x180",
        _250x250: "250x250",
        _352x352: "352x352",
        _420x420: "420x420",
        _720x720: "720x720"
    }, "V1UsersAvatarHeadshotGetSizeEnum", 0, {
        _48x48: "48x48",
        _50x50: "50x50",
        _60x60: "60x60",
        _75x75: "75x75",
        _100x100: "100x100",
        _110x110: "110x110",
        _150x150: "150x150",
        _180x180: "180x180",
        _352x352: "352x352",
        _420x420: "420x420",
        _720x720: "720x720"
    }, "V1UsersOutfitsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }])
}, 540513, e => {
    "use strict";
    var t = e.i(677753),
        n = e.i(620140),
        r = e.i(416340),
        i = e.i(706442),
        s = e.i(559956),
        a = e.i(95656),
        o = e.i(252842);

    function u() {
        if (void 0 === l) throw Error("Most call thumbnailsClient before using getThumbnailsClient");
        return l
    }(c = v || (v = {})).assetThumbnail = "assetThumbnail", c.avatarHeadshot = "avatarHeadshot", c.avatar = "avatar", c.bundleThumbnail = "bundleThumbnail", c.gameIcon = "gameIcon", c.groupIcon = "groupIcon", c.badgeIcon = "badgeIcon", c.gamePassIcon = "gamePassIcon", c.developerProductIcon = "developerProductIcon", c.userOutfit = "userOutfit", c.gameThumbnail = "gameThumbnail", c.universeThumbnail = "universeThumbnail", c.placeIcon = "placeIcon", c.autoGeneratedPlaceThumbnail = "autoGeneratedPlaceThumbnail", c.autoGeneratedPlaceIcon = "autoGeneratedPlaceIcon";
    var c, l, d, v, h, p, f, m = ((d = {})[v.assetThumbnail] = n.V1AssetsGetSizeEnum._150x150, d[v.avatarHeadshot] = n.V1UsersAvatarHeadshotGetSizeEnum._150x150, d[v.avatar] = n.V1UsersAvatarGetSizeEnum._150x150, d[v.bundleThumbnail] = n.V1BundlesThumbnailsGetSizeEnum._150x150, d[v.gameIcon] = n.V1GamesIconsGetSizeEnum._150x150, d[v.groupIcon] = n.V1GroupsIconsGetSizeEnum._150x150, d[v.badgeIcon] = n.V1BadgesIconsGetSizeEnum._150x150, d[v.gamePassIcon] = n.V1GamePassesGetSizeEnum._150x150, d[v.developerProductIcon] = n.V1DeveloperProductsIconsGetSizeEnum._150x150, d[v.userOutfit] = n.V1UsersOutfitsGetSizeEnum._150x150, d[v.gameThumbnail] = n.V1GamesUniverseIdThumbnailsGetSizeEnum._576x324, d[v.universeThumbnail] = n.V1GamesMultigetThumbnailsGetSizeEnum._576x324, d[v.placeIcon] = n.V1PlacesGameiconsGetSizeEnum._150x150, d[v.autoGeneratedPlaceThumbnail] = n.V1GamesUniverseIdThumbnailsGetSizeEnum._768x432, d[v.autoGeneratedPlaceIcon] = n.V1GamesIconsGetSizeEnum._512x512, d);

    function g(e, t, n, r) {
        return new(n || (n = Promise))(function(i, s) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function I(e, t) {
        var n, r, i, s = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var c = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, c[0] && (s = 0)), s;) try {
                    if (n = 1, r && (i = 2 & c[0] ? r.return : c[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, c[1])).done) return i;
                    switch (r = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, r = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = s.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < i[1]) {
                                s.label = i[1], i = c;
                                break
                            }
                            if (i && s.label < i[2]) {
                                s.label = i[2], s.ops.push(c);
                                break
                            }
                            i[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = t.call(e, s)
                } catch (e) {
                    c = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }(b = h || (h = {}))[b.maxRetryAttempts = 10] = "maxRetryAttempts", b[b.minCooldown = 1e3] = "minCooldown", b[b.maxCooldown = 3e4] = "maxCooldown", (T = p || (p = {})).png = "png", T.jpg = "jpg", T.jpeg = "jpeg", T.webp = "webp", (w = f || (f = {})).PlaceHolder = "PlaceHolder", w.AutoGenerated = "AutoGenerated", w.ForceAutoGenerated = "ForceAutoGenerated", w.ForcePlaceHolder = "ForcePlaceHolder", "function" == typeof SuppressedError && SuppressedError;
    var b, T, w, y, x, R = (0, i.makeStyles)()(function(e, t) {
            return {
                container: {
                    paddingTop: "".concat(100 * t.sizeRatio, "%"),
                    position: "relative",
                    height: "auto",
                    width: "100%",
                    overflow: "hidden"
                },
                background: {
                    backgroundColor: e.palette.action.focus
                },
                img: {
                    position: "absolute",
                    top: 0,
                    left: 0,
                    width: "100%",
                    height: "100%"
                },
                completed: {
                    transition: "opacity .5s ease",
                    opacity: 1
                },
                loading: {
                    opacity: 0
                }
            }
        }),
        S = "".concat("https://assets.create.roblox.com/d3d59f2ecddf652f6d3a23f10dd62efe6d42376d/assets", "/thumbnails"),
        P = "".concat(S, "/broken.svg"),
        A = "".concat(S, "/not_approved.svg"),
        E = "".concat(S, "/review_pending.svg"),
        G = "".concat(S, "/unavailable.svg");
    (y || (y = {})).Time = "time", (x || (x = {})).LoadThumbnail = "loadThumbnail";
    var _ = function(e, t) {
            var n = t || "Grasshopper",
                r = new a.Configuration({
                    baseUrl: "".concat(e, "/").concat(n)
                }),
                i = new a.Tracker(r);
            return {
                sendEvent: function(e) {
                    var t = {
                        target: n,
                        eventType: e.eventType,
                        context: e.context,
                        localTime: new Date,
                        additionalProperties: e.additionalProperties
                    };
                    return i.sendEventViaImg(t)
                }
            }
        },
        C = (0, r.createContext)({});
    C.displayName = "ThumbnailsContext";
    var O, N = function(e) {
            var t = e.thumbnailUrl,
                i = e.thumbnailStatus,
                a = e.imgClassName,
                o = e.isPendingResponse,
                u = e.isPendingNewTarget,
                c = e.containerClass,
                l = e.alt,
                d = e.includeBackground,
                v = e.sizeRatio,
                h = e.startTime,
                p = e.skeletonVariant,
                f = e.onLoadThumbnailStatus,
                m = void 0 === f ? void 0 : f,
                g = R({
                    sizeRatio: v
                }),
                I = g.classes,
                b = I.container,
                T = I.background,
                w = I.img,
                S = I.completed,
                _ = I.loading,
                O = g.cx,
                N = O(b, c),
                q = (0, r.useState)(!1),
                U = q[0],
                z = q[1],
                B = (0, r.useState)(!1),
                H = B[0],
                k = B[1],
                V = (0, r.useContext)(C).eventTracker,
                L = (0, r.useMemo)(function() {
                    switch (i) {
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error:
                            return P;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Blocked:
                            return A;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.InReview:
                            return E;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending:
                            return o ? "" : G;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Completed:
                        default:
                            return ""
                    }
                }, [o, i]);
            return r.default.createElement("span", {
                className: O(N, u || o || !d ? "" : T)
            }, u || o ? r.default.createElement(s.Skeleton, {
                className: w,
                variant: void 0 === p ? "rectangular" : p,
                animate: !u
            }) : r.default.createElement("img", {
                className: O(w, a, U ? S : _),
                src: null != t ? t : L,
                alt: l,
                onLoad: function() {
                    var e;
                    if (z(!0), V && !H) {
                        var n = performance.now() - h;
                        V.sendEvent({
                            eventType: x.LoadThumbnail,
                            context: y.Time,
                            currentUrl: null == (e = null == window ? void 0 : window.location) ? void 0 : e.href,
                            additionalProperties: {
                                elapsedTime: n,
                                thumbnailStatus: i,
                                thumbnailUrl: null != t ? t : L,
                                sizeRatio: v
                            }
                        }), k(!0)
                    }
                    void 0 !== m && m(i)
                }
            }))
        },
        q = function(e) {
            var t;
            return null != (t = null == e ? void 0 : e.toString()) ? t : ""
        },
        U = new o.BatchRequestFactory,
        z = {
            getFailureCooldown: U.createExponentialBackoffCooldown(h.minCooldown, h.maxCooldown),
            maxRetryAttempts: h.maxRetryAttempts,
            batchSize: 50,
            processBatchWaitTime: 0
        },
        B = {},
        H = {},
        k = function(e, t, n, r, i) {
            if (i && r && delete H[r], !(r in H)) {
                var s = function(e, t) {
                    if (t in B) return B[t];
                    var n = U.createRequestProcessor(e, q, z);
                    return B[t] = n, n
                }(t, n);
                i && s.invalidateItem(e);
                var a = s.queueItem(e).catch(function(e) {
                    return Promise.reject(e)
                });
                H[r] = a
            }
            return H[r]
        },
        V = {},
        L = function(e, t, r, i, s, a) {
            void 0 === s && (s = p.webp), void 0 === a && (a = f.PlaceHolder);
            var c, l, d, h = (l = u(), (d = ((c = {})[v.assetThumbnail] = l.getAssets, c[v.avatarHeadshot] = l.getAvatarHeadshots, c[v.avatar] = l.getAvatars, c[v.bundleThumbnail] = l.getBundles, c[v.gameIcon] = l.getGameIcons, c[v.groupIcon] = l.getGroupIcons, c[v.badgeIcon] = l.getBadgeIcons, c[v.gamePassIcon] = l.getGamePassIcons, c[v.developerProductIcon] = l.getDeveloperProductIcons, c[v.userOutfit] = l.getUserOutfits, c[v.gameThumbnail] = l.getGameThumbnails, c[v.universeThumbnail] = l.getUniverseThumbnails, c[v.placeIcon] = l.getPlaceIcons, c[v.autoGeneratedPlaceThumbnail] = l.getAutoGeneratedPlaceImage, c[v.autoGeneratedPlaceIcon] = l.getAutoGeneratedPlaceImage, c)[r]) || console.debug("Missing urlConfig implementation for thumbnail type: ".concat(r)), d);
            return new Promise(function(u, c) {
                var l = t.map(function(e) {
                    return e.itemId
                });
                if (h) {
                    var d = (new Date).getTime(),
                        p = [];
                    p = r === v.assetThumbnail || r === v.gameIcon || r === v.placeIcon ? [l, a, i, s] : r === v.gameThumbnail ? [e, l, i, s] : [l, i, s], h.apply(null, p).then(function(e) {
                        var r, i = {};
                        (null != (r = null == e ? void 0 : e.data) ? r : []).forEach(function(e) {
                            i[q(e.targetId)] = e
                        }), t.forEach(function(e) {
                            var t = e.itemId,
                                r = q(t);
                            Object.prototype.hasOwnProperty.call(i, r) && i[r] ? i[r].state === n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending && (delete i[r], V[r] || (V[r] = {
                                startTime: d
                            })) : i[r] = {
                                targetId: t,
                                state: n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error
                            }
                        }), u(i)
                    }).catch(function() {
                        u({})
                    })
                } else c(o.BatchRequestError.unretriableFailure)
            })
        },
        M = function(e, t, r, i, s, a, o) {
            void 0 === i && (i = p.webp), void 0 === s && (s = f.PlaceHolder), void 0 === o && (o = !1);
            var u, c, l, d, v = a || m[e] || n.V1UsersAvatarHeadshotGetSizeEnum._150x150;
            if (!r) return new Promise(function(e, t) {
                t("TargetId can not be empty.")
            });
            if (!e) return new Promise(function(e, t) {
                t("ThumbnailType can not be empty.")
            });
            var h = (u = i, c = s, void 0 === u && (u = p.webp), void 0 === c && (c = f.PlaceHolder), "thumbnail_type:".concat(e, "_baseTargetId:").concat(t, "_targetId:").concat(r, "_requestedSize:").concat(v, "_format:").concat(u, "_returnPolicy:").concat(c));
            return k(r, function(n) {
                return L(t, n, e, v, i, s)
            }, (l = i, d = s, void 0 === l && (l = p.webp), void 0 === d && (d = f.PlaceHolder), "".concat(t, ":").concat(e, ":").concat(v, ":").concat(l, ":").concat(d)), h, o)
        },
        F = {
            getThumbnailImage: function(e, t, n, r, i) {
                return void 0 === n && (n = f.PlaceHolder), void 0 === r && (r = p.webp), M(e, 0, t, r, n, i)
            },
            reloadThumbnailImage: function(e, t, n, r, i) {
                return void 0 === n && (n = f.PlaceHolder), void 0 === r && (r = p.webp), M(e, 0, t, r, n, i, !0)
            },
            getThumbnailImageWithBaseTarget: function(e, t, n, r, i, s) {
                return void 0 === r && (r = f.PlaceHolder), void 0 === i && (i = p.webp), M(e, t, n, i, r, s)
            }
        },
        D = (0, r.forwardRef)(function(e, t) {
            var i = this,
                s = e.type,
                a = e.baseTargetId,
                o = void 0 === a ? 0 : a,
                u = e.targetId,
                c = e.imgClassName,
                l = void 0 === c ? "" : c,
                d = e.containerClass,
                h = e.returnPolicy,
                m = void 0 === h ? f.PlaceHolder : h,
                b = e.alt,
                T = e.skeletonVariant,
                w = e.isPendingNewTarget,
                y = e.includeBackground,
                x = e.size,
                R = e.onLoadThumbnailStatus,
                S = e.format,
                P = void 0 === S ? p.webp : S,
                A = (0, r.useState)(),
                E = A[0],
                G = A[1];
            (0, r.useEffect)(function() {
                var e = !0;
                return g(i, void 0, void 0, function() {
                        var t;
                        return I(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return P !== p.webp && G(P), [4, function() {
                                        return g(this, void 0, void 0, function() {
                                            return I(this, function(e) {
                                                return void 0 === O && (O = new Promise(function(e) {
                                                    try {
                                                        var t = new Image;
                                                        t.onload = function() {
                                                            return e(t.width > 0 && t.height > 0)
                                                        }, t.onerror = function() {
                                                            return e(!1)
                                                        }, t.src = "data:image/webp;base64,UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA=="
                                                    } catch (t) {
                                                        e(!0)
                                                    }
                                                })), [2, O]
                                            })
                                        })
                                    }()];
                                case 1:
                                    return t = n.sent(), e && G(t ? P : p.png), [2]
                            }
                        })
                    }),
                    function() {
                        e = !1
                    }
            }, [P]);
            var _ = (0, r.useState)(n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending),
                C = _[0],
                q = _[1],
                U = (0, r.useState)(),
                z = U[0],
                B = U[1],
                H = (0, r.useState)(!0),
                k = H[0],
                V = H[1],
                L = (0, r.useState)(performance.now())[0],
                M = (0, r.useMemo)(function() {
                    return s === v.gameThumbnail || s === v.universeThumbnail ? .5625 : 1
                }, [s]);
            return (0, r.useImperativeHandle)(t, function() {
                return {
                    refreshThumbnail: function() {
                        F.reloadThumbnailImage(s, u, m, E).then(function(e) {
                            var t = e.state,
                                r = e.imageUrl;
                            q(null != t ? t : n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), B(r)
                        }, function(e) {
                            console.log(e)
                        }).finally(function() {
                            V(!1)
                        })
                    }
                }
            }), (0, r.useEffect)(function() {
                var e = !1;
                return V(!0), void 0 === E || (o ? F.getThumbnailImageWithBaseTarget(s, o, u, m, E, x) : F.getThumbnailImage(s, u, m, E, x)).then(function(t) {
                        var r = t.state,
                            i = t.imageUrl;
                        e || (q(null != r ? r : n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), B(i))
                    }, function(e) {
                        console.log(e)
                    }).finally(function() {
                        e || V(!1)
                    }),
                    function() {
                        e = !0
                    }
            }, [s, o, u, l, E, m, x]), r.default.createElement(N, {
                thumbnailUrl: z,
                thumbnailStatus: C,
                skeletonVariant: T,
                imgClassName: l,
                isPendingResponse: k,
                isPendingNewTarget: void 0 !== w && w,
                containerClass: void 0 === d ? "" : d,
                alt: b,
                includeBackground: void 0 !== y && y,
                sizeRatio: M,
                startTime: L,
                onLoadThumbnailStatus: void 0 === R ? void 0 : R
            })
        });
    e.s(["ReturnPolicy", 0, f, "Thumbnail2d", 0, D, "ThumbnailClient", 0, F, "ThumbnailFormat", 0, p, "ThumbnailTypes", 0, v, "ThumbnailsProvider", 0, function(e) {
        var t = e.baseUrl,
            n = e.targetNamespace,
            i = e.children,
            s = (0, r.useMemo)(function() {
                return {
                    eventTracker: _(t, n)
                }
            }, [t, n]);
        return r.default.createElement(C.Provider, {
            value: s
        }, i)
    }, "createThumbnailsClient", 0, function(e) {
        var r = new n.AssetsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            i = new n.AvatarApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            s = new n.BadgesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            a = new n.BundlesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            o = new n.DeveloperProductsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            u = new n.GamePassesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            c = new n.GamesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            d = new n.GroupEmblemApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            v = new n.OutfitsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            h = new n.PlacesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            p = new n.BatchApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            }));
        l = {
            getAssets: function(e, t, n, i, s) {
                return r.v1AssetsGet({
                    assetIds: e,
                    returnPolicy: t,
                    size: n,
                    format: i,
                    isCircular: s
                })
            },
            getAvatarHeadshots: function(e, t, n, r) {
                return i.v1UsersAvatarHeadshotGet({
                    userIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getAvatars: function(e, t, n, r) {
                return i.v1UsersAvatarGet({
                    userIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getBundles: function(e, t, n, r) {
                return a.v1BundlesThumbnailsGet({
                    bundleIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGameIcons: function(e, t, n, r, i) {
                return c.v1GamesIconsGet({
                    universeIds: e,
                    returnPolicy: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getGroupIcons: function(e, t, n, r) {
                return d.v1GroupsIconsGet({
                    groupIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getBadgeIcons: function(e, t, n, r) {
                return s.v1BadgesIconsGet({
                    badgeIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGamePassIcons: function(e, t, n, r) {
                return u.v1GamePassesGet({
                    gamePassIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getDeveloperProductIcons: function(e, t, n, r) {
                return o.v1DeveloperProductsIconsGet({
                    developerProductIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getUserOutfits: function(e, t, n, r) {
                return v.v1UsersOutfitsGet({
                    userOutfitIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGameThumbnails: function(e, t, n, r, i) {
                return c.v1GamesUniverseIdThumbnailsGet({
                    universeId: e,
                    thumbnailIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getUniverseThumbnails: function(e, t, n, r) {
                return c.v1GamesMultigetThumbnailsGet({
                    universeIds: e,
                    countPerUniverse: 1,
                    defaults: !0,
                    size: t,
                    format: n,
                    isCircular: r
                }).then(function(e) {
                    var t, n = null == e ? void 0 : e.data;
                    return {
                        data: null != (t = null == n ? void 0 : n.map(function(e) {
                            var t, n = null == (t = e.thumbnails) ? void 0 : t[0];
                            return {
                                targetId: e.universeId,
                                state: null == n ? void 0 : n.state,
                                imageUrl: null == n ? void 0 : n.imageUrl
                            }
                        })) ? t : []
                    }
                })
            },
            getPlaceIcons: function(e, t, n, r, i) {
                return h.v1PlacesGameiconsGet({
                    placeIds: e,
                    returnPolicy: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getAutoGeneratedPlaceImage: function(e, t, r) {
                var i = e.map(function(e) {
                    return {
                        targetId: e,
                        type: n.RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum.GameIcon,
                        size: t,
                        format: r
                    }
                });
                return p.v1BatchPost({
                    requests: i
                })
            },
            getBatchThumbnails: function(e, t, n, r, i) {
                var s = e.map(function(e) {
                    return {
                        targetId: e,
                        type: t,
                        size: n,
                        format: r,
                        isCircular: i
                    }
                });
                return p.v1BatchPost({
                    requests: s
                })
            }
        }
    }, "getThumbnailsClient", 0, u])
}, 559956, e => {
    "use strict";
    let t, n, r, i;
    var s = e.i(569384),
        a = e.i(865800),
        o = e.i(416340),
        u = e.i(614515),
        c = e.i(993807),
        l = e.i(273589),
        d = e.i(962560),
        v = e.i(42569),
        h = e.i(696180),
        p = e.i(221628),
        f = e.i(990857),
        m = e.i(963320),
        g = e.i(571709);

    function I() {
        let e = (0, s._)(["\n  0% {\n    opacity: 1;\n  }\n\n  50% {\n    opacity: 0.4;\n  }\n\n  100% {\n    opacity: 1;\n  }\n"]);
        return I = function() {
            return e
        }, e
    }

    function b() {
        let e = (0, s._)(["\n  0% {\n    transform: translateX(-100%);\n  }\n\n  50% {\n    /* +0.5s of delay between each loop */\n    transform: translateX(100%);\n  }\n\n  100% {\n    transform: translateX(100%);\n  }\n"]);
        return b = function() {
            return e
        }, e
    }

    function T() {
        let e = (0, s._)(["\n      animation: ", " 2s ease-in-out 0.5s infinite;\n    "]);
        return T = function() {
            return e
        }, e
    }

    function w() {
        let e = (0, s._)(["\n      position: relative;\n      overflow: hidden;\n\n      /* Fix bug in Safari https://bugs.webkit.org/show_bug.cgi?id=68196 */\n      -webkit-mask-image: -webkit-radial-gradient(white, black);\n\n      &::after {\n        animation: ", " 2s linear 0.5s infinite;\n        background: linear-gradient(\n          90deg,\n          transparent,\n          ", ",\n          transparent\n        );\n        content: '';\n        position: absolute;\n        transform: translateX(-100%); /* Avoid flash during server-side hydration */\n        bottom: 0;\n        left: 0;\n        right: 0;\n        top: 0;\n      }\n    "]);
        return w = function() {
            return e
        }, e
    }

    function y(e) {
        return (0, l.g)("MuiSkeleton", e)
    }(0, h.g)("MuiSkeleton", ["root", "text", "rectangular", "rounded", "circular", "pulse", "wave", "withChildren", "fitContent", "heightAuto"]);
    let x = ["animation", "className", "component", "height", "style", "variant", "width"],
        R = (0, g.keyframes)(t || (t = I())),
        S = (0, g.keyframes)(n || (n = b())),
        P = (0, v.s)("span", {
            name: "MuiSkeleton",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, t[n.variant], !1 !== n.animation && t[n.animation], n.hasChildren && t.withChildren, n.hasChildren && !n.width && t.fitContent, n.hasChildren && !n.height && t.heightAuto]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e, r = String(t.shape.borderRadius).match(/[\d.\-+]*\s*(.*)/)[1] || "px", i = parseFloat(t.shape.borderRadius);
            return (0, d._)({
                display: "block",
                backgroundColor: t.vars ? t.vars.palette.Skeleton.bg : (0, f.a)(t.palette.text.primary, "light" === t.palette.mode ? .11 : .13),
                height: "1.2em"
            }, "text" === n.variant && {
                marginTop: 0,
                marginBottom: 0,
                height: "auto",
                transformOrigin: "0 55%",
                transform: "scale(1, 0.60)",
                borderRadius: "".concat(i).concat(r, "/").concat(Math.round(i / .6 * 10) / 10).concat(r),
                "&:empty:before": {
                    content: '"\\00a0"'
                }
            }, "circular" === n.variant && {
                borderRadius: "50%"
            }, "rounded" === n.variant && {
                borderRadius: (t.vars || t).shape.borderRadius
            }, n.hasChildren && {
                "& > *": {
                    visibility: "hidden"
                }
            }, n.hasChildren && !n.width && {
                maxWidth: "fit-content"
            }, n.hasChildren && !n.height && {
                height: "auto"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return "pulse" === t.animation && (0, g.css)(r || (r = T()), R)
        }, e => {
            let {
                ownerState: t,
                theme: n
            } = e;
            return "wave" === t.animation && (0, g.css)(i || (i = w()), S, (n.vars || n).palette.action.hover)
        }),
        A = o.forwardRef(function(e, t) {
            let n = (0, m.u)({
                    props: e,
                    name: "MuiSkeleton"
                }),
                {
                    animation: r = "pulse",
                    className: i,
                    component: s = "span",
                    height: a,
                    style: o,
                    variant: u = "text",
                    width: c
                } = n,
                h = (0, l._)(n, x),
                f = (0, d._)({}, n, {
                    animation: r,
                    component: s,
                    variant: u,
                    hasChildren: !!h.children
                }),
                g = (e => {
                    let {
                        classes: t,
                        variant: n,
                        animation: r,
                        hasChildren: i,
                        width: s,
                        height: a
                    } = e;
                    return (0, v.a)({
                        root: ["root", n, r, i && "withChildren", i && !s && "fitContent", i && !a && "heightAuto"]
                    }, y, t)
                })(f);
            return (0, p.jsx)(P, (0, d._)({
                as: s,
                ref: t,
                className: (0, v.c)(g.root, i),
                ownerState: f
            }, h, {
                style: (0, d._)({
                    width: c,
                    height: a
                }, o)
            }))
        });
    var E = (0, u.default)({
            name: "Skeleton"
        })(function(e) {
            return {
                root: {
                    backgroundColor: e.palette.states.hover
                },
                wave: {
                    backgroundColor: e.palette.states.focus
                },
                rectangular: (0, a._)({}, e.border.radius.large),
                square: {
                    borderRadius: "0px"
                }
            }
        }),
        G = {
            text: "text",
            rectangular: "rectangular",
            circular: "circular",
            square: "rectangular"
        },
        _ = (0, o.forwardRef)(function(e, t) {
            var n, r = e.variant,
                i = void 0 === r ? "text" : r,
                s = e.animate,
                u = e.classes,
                l = e.className,
                d = (0, a.a)(e, ["variant", "animate", "classes", "className"]),
                v = E(void 0, {
                    props: {
                        classes: (0, c.default)(u, l)
                    }
                }),
                h = v.classes,
                p = h.square,
                f = h.rectangular,
                m = (0, a.a)(h, ["square", "rectangular"]),
                g = v.cx;
            return o.default.createElement(A, (0, a._)({}, d, {
                variant: G[i],
                animation: !!(void 0 !== s && s) && "wave",
                classes: (0, a._)((0, a._)({}, m), {
                    rectangular: g(f, ((n = {})[p] = "square" === i, n))
                }),
                ref: t
            }))
        });
    e.s(["Skeleton", 0, _], 559956)
}, 990857, e => {
    "use strict";
    var t = e.i(983545);

    function n(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
        return (0, t.c)(e, n, r)
    }

    function r(e) {
        if (e.type) return e;
        if ("#" === e.charAt(0)) {
            var n;
            let t, i;
            return r((n = (n = e).slice(1), t = RegExp(".{1,".concat(n.length >= 6 ? 2 : 1, "}"), "g"), (i = n.match(t)) && 1 === i[0].length && (i = i.map(e => e + e)), i ? "rgb".concat(4 === i.length ? "a" : "", "(").concat(i.map((e, t) => t < 3 ? parseInt(e, 16) : Math.round(parseInt(e, 16) / 255 * 1e3) / 1e3).join(", "), ")") : ""))
        }
        let i = e.indexOf("("),
            s = e.substring(0, i);
        if (-1 === ["rgb", "rgba", "hsl", "hsla", "color"].indexOf(s)) throw Error((0, t.f)(9, e));
        let a, o = e.substring(i + 1, e.length - 1);
        if ("color" === s) {
            if (a = (o = o.split(" ")).shift(), 4 === o.length && "/" === o[3].charAt(0) && (o[3] = o[3].slice(1)), -1 === ["srgb", "display-p3", "a98-rgb", "prophoto-rgb", "rec-2020"].indexOf(a)) throw Error((0, t.f)(10, a))
        } else o = o.split(",");
        return {
            type: s,
            values: o = o.map(e => parseFloat(e)),
            colorSpace: a
        }
    }

    function i(e) {
        let {
            type: t,
            colorSpace: n
        } = e, {
            values: r
        } = e;
        return -1 !== t.indexOf("rgb") ? r = r.map((e, t) => t < 3 ? parseInt(e, 10) : e) : -1 !== t.indexOf("hsl") && (r[1] = "".concat(r[1], "%"), r[2] = "".concat(r[2], "%")), r = -1 !== t.indexOf("color") ? "".concat(n, " ").concat(r.join(" ")) : "".concat(r.join(", ")), "".concat(t, "(").concat(r, ")")
    }
    e.s(["a", 0, function(e, t) {
        return e = r(e), t = n(t), "rgb" !== e.type && "hsl" !== e.type || (e.type += "a"), "color" === e.type ? e.values[3] = "/".concat(t) : e.values[3] = t, i(e)
    }, "l", 0, function(e, t) {
        if (e = r(e), t = n(t), -1 !== e.type.indexOf("hsl")) e.values[2] += (100 - e.values[2]) * t;
        else if (-1 !== e.type.indexOf("rgb"))
            for (let n = 0; n < 3; n += 1) e.values[n] += (255 - e.values[n]) * t;
        else if (-1 !== e.type.indexOf("color"))
            for (let n = 0; n < 3; n += 1) e.values[n] += (1 - e.values[n]) * t;
        return i(e)
    }])
}, 237401, (e, t, n) => {
    t.exports = e.r(761438)
}, 533414, e => {
    "use strict";
    var t = e.i(416340);
    let n = t.useLayoutEffect,
        r = (e, r) => (i, s) => {
            var a;
            let o, u = (0, t.useRef)(s),
                c = (0, t.useCallback)(() => {
                    try {
                        let t = e().getItem(i);
                        return t ? JSON.parse(t) : u.current
                    } catch (e) {
                        return console.warn("Error reading backingStorage (eventName: ".concat(r, ") key “").concat(i, "”:"), e), u.current
                    }
                }, [i]),
                [l, d] = (0, t.useState)(() => c());
            (0, t.useEffect)(() => {
                d(c)
            }, [c]);
            let v = (a = t => {
                try {
                    let n = t instanceof Function ? t(l) : t,
                        s = JSON.stringify(n),
                        a = e().getItem(i);
                    s !== a && (e().setItem(i, s), d(n), window.dispatchEvent(new CustomEvent(r, {
                        detail: {
                            key: i,
                            newValue: n
                        }
                    })))
                } catch (e) {
                    console.warn("Error setting backingStorage (eventName: ".concat(r, ") key “").concat(i, "”:"), e)
                }
            }, o = (0, t.useRef)(() => {
                throw Error("Cannot call an event callback while rendering")
            }), n(() => {
                o.current = a
            }, [a]), (0, t.useCallback)(function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return o.current(...t)
            }, [o]));
            return (0, t.useEffect)(() => {
                let t = e => {
                        let {
                            key: t,
                            newValue: n
                        } = e.detail;
                        t === i && d(n)
                    },
                    n = t => {
                        let {
                            key: n,
                            newValue: r
                        } = t;
                        t.storageArea === e() && n === i && d(JSON.parse(r))
                    };
                return window.addEventListener("storage", n), window.addEventListener(r, t), () => {
                    window.removeEventListener("storage", n), window.removeEventListener(r, t)
                }
            }, [i]), [l, v]
        };
    e.s(["useDebounce", 0, (e, n) => {
        let [r, i] = (0, t.useState)(e);
        return (0, t.useEffect)(() => {
            let t = setTimeout(() => {
                i(e)
            }, n);
            return () => {
                clearTimeout(t)
            }
        }, [e, n]), r
    }, "useLocalStorage", 0, (e, t) => r(() => window.localStorage, "local-storage")(e, t), "usePrevious", 0, e => {
        let n = (0, t.useRef)(void 0);
        return (0, t.useEffect)(() => {
            n.current = e
        }, [e]), n.current
    }, "useSessionStorage", 0, (e, t) => r(() => window.sessionStorage, "session-storage")(e, t)])
}]);

//# debugId=d9b994d4-5c25-80b4-1509-8107f2f69447
//# sourceMappingURL=0c6zobbd5ug4x.js.map