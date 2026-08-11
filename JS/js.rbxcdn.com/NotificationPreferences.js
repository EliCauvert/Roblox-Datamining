! function() {
    var e = {
            942: function(e) {
                function t(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var n = {}.hasOwnProperty;

                    function r() {
                        for (var e = "", o = 0; o < arguments.length; o++) {
                            var a = arguments[o];
                            a && (e = i(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return r.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var o = "";
                                for (var a in e) n.call(e, a) && e[a] && (o = i(o, a));
                                return o
                            }(a)))
                        }
                        return e
                    }

                    function i(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (r.default = r, e.exports = r) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return r
                    }) : window.classNames = r
                }()
            },
            346: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            387: function(e, t, n) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function n(r) {
        var i = t[r];
        if (void 0 !== i) return i.exports;
        var o = t[r] = {
            exports: {}
        };
        return e[r](o, o.exports, n), o.exports
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
    var r, i = n.g.document;
    if (!r && i && (i.currentScript && "SCRIPT" === i.currentScript.tagName.toUpperCase() && (r = i.currentScript.src), !r)) {
        var o = i.getElementsByTagName("script");
        if (o.length)
            for (var a = o.length - 1; a > -1 && (!r || !/^http(s?):/.test(r));) r = o[a--].src
    }
    if (!r) throw Error("Automatic publicPath is not supported in this browser");
    n.p = r.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            n(346), n(387);
            var e, t, r, i, o, a, c = window.Roblox,
                l = n.n(c),
                s = window.ReactJSX,
                u = window.React,
                f = n.n(u),
                p = window.ReactDOM,
                d = window.ReactUtilities,
                b = window.ReactStyleGuide,
                m = window.CoreUtilities,
                h = window.CoreRobloxUtilities,
                y = h.eventStreamService.eventTypes,
                g = "NotificationPreferences",
                v = {
                    NotificationPreferencesOrigin: "NotificationPreferences",
                    pageLoaded: {
                        name: "pageLoaded",
                        context: g,
                        type: y.pageLoad,
                        params: {}
                    },
                    enableNotificationsPromptShown: {
                        name: "enableNotificationsPromptShown",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "enableMobilePushNotifications",
                            aType: "shown"
                        }
                    },
                    enableNotificationsPromptClicked: {
                        name: "enableNotificationsPromptClicked",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "enableMobilePushNotifications",
                            aType: "click"
                        }
                    },
                    categoryToggle: {
                        name: "categoryToggle",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "toggleCategoryShown",
                            aType: "click"
                        }
                    },
                    sendAll: {
                        name: "sendAll",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "sendAll",
                            aType: "click"
                        }
                    },
                    sendBest: {
                        name: "sendBest",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "sendBest",
                            aType: "click"
                        }
                    },
                    sendNone: {
                        name: "sendNone",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "sendNone",
                            aType: "click"
                        }
                    },
                    promptUnsubscribe: {
                        name: "promptUnsubscribe",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "promptUnsubscribe",
                            aType: "click"
                        }
                    },
                    unsubscribeFromExperience: {
                        name: "unsubscribeFromExperience",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "unsubscribeFromExperience",
                            aType: "click"
                        }
                    },
                    cancelUnsubscribe: {
                        name: "cancelUnsubscribe",
                        context: g,
                        type: y.formInteraction,
                        params: {
                            btn: "cancelUnsubscribe",
                            aType: "click"
                        }
                    }
                },
                x = {
                    notificationPreferencesUrl: {
                        url: "".concat(c.EnvironmentUrls.notificationApi, "/v2/notifications/notification-preferences"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    groupedNotificationPreferences: {
                        url: "".concat(c.EnvironmentUrls.notificationApi, "/v2/notifications/grouped-notification-preferences"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    experiencePreferencesUrl: {
                        url: "".concat(c.EnvironmentUrls.notificationApi, "/v2/notifications/experience-preferences"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    gameDetailsUrl: {
                        url: "".concat(c.EnvironmentUrls.gamesApi, "/v1/games"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    pushEnabledUrl: {
                        url: "".concat(c.EnvironmentUrls.notificationApi, "/v2/push-notifications/get-current-device-destination"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    followingsUrl: function(e, t) {
                        return {
                            url: "".concat(c.EnvironmentUrls.followingsApi, "/v1/users/").concat(e, "/universes/").concat(t),
                            retryable: !1,
                            withCredentials: !0
                        }
                    },
                    groupShoutPreferencesUrl: {
                        url: "".concat(c.EnvironmentUrls.notificationApi, "/v2/notifications/group-shout-preferences"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    updateGroupShoutNotificationPreferencesUrl: function(e) {
                        return {
                            url: "".concat(c.EnvironmentUrls.groupsApi, "/v1/groups/").concat(e, "/notification-preference"),
                            retryable: !0,
                            withCredentials: !0
                        }
                    },
                    getGroupShoutNotificationGroupsUrl: function(e) {
                        return {
                            url: "".concat(c.EnvironmentUrls.groupsApi, "/v1/users/").concat(e, "/groups/roles?includeNotificationPreferences=true"),
                            retryable: !0,
                            withCredentials: !0
                        }
                    },
                    updateUserSetting: {
                        url: "".concat(c.EnvironmentUrls.userSettingsApi, "/v1/user-settings"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    updateUserSettingV2: {
                        url: "".concat(c.EnvironmentUrls.userSettingsApi, "/v2/user-settings"),
                        retryable: !0,
                        withCredentials: !0
                    }
                };

            function S(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function w(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            S(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            S(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function j(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var N = function(e) {
                    return w(function() {
                        var t;
                        return j(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), [4, m.httpService.get(x.gameDetailsUrl, e)];
                                case 1:
                                    if (200 !== (t = n.sent()).status) return [2, null];
                                    return [2, t.data];
                                case 2:
                                    return n.sent(), [2, null];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                P = function(e) {
                    return w(function() {
                        var t;
                        return j(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), [4, m.httpService.get(x.getGroupShoutNotificationGroupsUrl(e), {})];
                                case 1:
                                    if (200 !== (t = n.sent()).status) return [2, null];
                                    return [2, t.data];
                                case 2:
                                    return n.sent(), [2, null];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                O = function(e, t, n) {
                    var r, i;
                    h.eventStreamService.sendEventWithTarget(e.type, e.context, (r = function(e) {
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
                    }({}, e.params), i = i = {
                        field: t || "",
                        origin: n || v.NotificationPreferencesOrigin
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(i)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(i)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(i, e))
                    }), r))
                },
                T = {
                    common: ["CommonUI.Messages", "CommonUI.Controls", "Feature.DoNotDisturb"],
                    feature: "Notifications.Preferences"
                },
                D = function() {
                    for (var e, t, n = 0, r = "", i = arguments.length; n < i; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var o = t.length;
                                for (n = 0; n < o; n++) t[n] && (r = e(t[n])) && (i && (i += " "), i += r)
                            } else
                                for (r in t) t[r] && (i && (i += " "), i += r);
                        return i
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                C = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                E = f().forwardRef(function(e, t) {
                    var n = e.name,
                        r = e.size,
                        i = e.className,
                        o = (e.children, function(e, t) {
                            var n = {};
                            for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                            if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                                var i = 0;
                                for (r = Object.getOwnPropertySymbols(e); i < r.length; i++) 0 > t.indexOf(r[i]) && Object.prototype.propertyIsEnumerable.call(e, r[i]) && (n[r[i]] = e[r[i]])
                            }
                            return n
                        }(e, ["name", "size", "className", "children"]));
                    return f().createElement("span", Object.assign({
                        ref: t,
                        role: "presentation",
                        className: D("grow-0 shrink-0 basis-auto icon", n, C[void 0 === r ? "Medium" : r], i)
                    }, o))
                });
            E.displayName = "Icon";
            var A = ((e = {}).All = "All", e.Best = "Personalized", e.None = "None", e),
                I = ((t = {}).Push = "Push", t.Stream = "Stream", t.Invalid = "Invalid", t),
                k = (0, d.withTranslations)(function(e) {
                    var t = e.translate;
                    return (0, s.jsxs)("div", {
                        className: "group-locked-pill xsmall ",
                        children: [(0, s.jsx)("span", {
                            className: "icon-status-private themified-icon"
                        }), (0, s.jsx)("span", {
                            className: "group-locked-label",
                            children: t("Label.ParentalControls")
                        })]
                    })
                }, T),
                M = n(942),
                U = n.n(M),
                z = function(e) {
                    var t = e.selectionDisabled,
                        n = e.onChangeCallback,
                        r = e.selection,
                        i = U()("btn-toggle receiver-destination-type-toggle", {
                            on: r
                        });
                    return (0, s.jsxs)("button", {
                        type: "button",
                        role: "switch",
                        disabled: t,
                        "aria-checked": r,
                        "aria-label": "toggle-button",
                        className: i,
                        onClick: function() {
                            n && n(!r)
                        },
                        children: [(0, s.jsx)("span", {
                            className: "toggle-flip"
                        }), (0, s.jsx)("span", {
                            id: "toggle-on",
                            className: "toggle-on"
                        }), (0, s.jsx)("span", {
                            id: "toggle-off",
                            className: "toggle-off"
                        })]
                    })
                },
                G = function(e) {
                    var t = e.userSettingName,
                        n = e.userSetting,
                        r = e.localizedTypeName,
                        i = e.localizedDescription,
                        o = e.selection,
                        a = e.onTogglePreference,
                        c = e.hasBorder,
                        l = e.selectionDisabled,
                        u = e.showLockOnToggle,
                        f = e.renderAdditionalContent;
                    return (0, s.jsxs)("div", {
                        className: "preference-selector",
                        children: [(0, s.jsxs)("div", {
                            className: U()("preference-selector-header", {
                                "border-top": c
                            }),
                            children: [(0, s.jsxs)("div", {
                                className: U()("notification-type-info", {
                                    "text-disabled": l
                                }),
                                children: [(0, s.jsx)("div", {
                                    className: "notification-type heading text text-emphasis",
                                    children: r
                                }), (0, s.jsx)("div", {
                                    className: "notification-type-descriptor small text text-content",
                                    children: i
                                })]
                            }), (0, s.jsxs)("div", {
                                className: "toggle-button-container",
                                children: [u && (0, s.jsx)(k, {}), (0, s.jsx)(z, {
                                    selectionDisabled: l,
                                    onChangeCallback: function(e) {
                                        a(e, n, null != t ? t : null)
                                    },
                                    selection: o
                                })]
                            })]
                        }), (0, s.jsx)("div", {
                            className: U()({
                                "text-disabled": l
                            }),
                            children: null == f ? void 0 : f()
                        })]
                    })
                },
                B = window.RobloxThumbnails;

            function L(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var F = function(e) {
                    var t, n = e.titleText,
                        r = e.bodyComponent,
                        i = e.actionButtonText,
                        o = e.onAction,
                        a = e.neutralButtonText,
                        c = e.onNeutral,
                        l = e.closeable,
                        f = void 0 === l || l,
                        p = e.disableActionButton,
                        d = (t = (0, u.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var o = [],
                                    a = !0,
                                    c = !1;
                                try {
                                    for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), o.length !== t); a = !0);
                                } catch (e) {
                                    c = !0, r = e
                                } finally {
                                    try {
                                        a || null == i.return || i.return()
                                    } finally {
                                        if (c) throw r
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return L(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return L(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        m = d[0],
                        h = d[1],
                        y = U()({
                            "info-modal-half-width-button": a,
                            "info-modal-full-width-button": !a
                        }),
                        g = (0, u.useMemo)(function() {
                            return {
                                open: function() {
                                    return h(!0)
                                },
                                close: function() {
                                    return h(!1)
                                }
                            }
                        }, []);
                    return [(0, s.jsxs)(b.Modal, {
                        show: m,
                        onHide: function() {
                            g.close()
                        },
                        backdrop: !!f || "static",
                        keyboard: f,
                        className: "confirmation-modal",
                        size: "sm",
                        "aria-labelledby": "info-modal-title",
                        scrollable: !0,
                        centered: !0,
                        closeable: f,
                        children: [(0, s.jsx)(b.Modal.Header, {
                            useBaseBootstrapComponent: !0,
                            children: (0, s.jsx)("div", {
                                children: (0, s.jsx)(b.Modal.Title, {
                                    id: "info-modal-title",
                                    children: n
                                })
                            })
                        }), (0, s.jsx)(b.Modal.Body, {
                            children: r
                        }), (0, s.jsxs)(b.Modal.Footer, {
                            children: [a && (0, s.jsx)(b.Button, {
                                className: y,
                                variant: b.Button.variants.secondary,
                                size: b.Button.sizes.medium,
                                onClick: function() {
                                    null == c || c(), g.close()
                                },
                                children: a
                            }), (0, s.jsx)(b.Button, {
                                className: y,
                                variant: b.Button.variants.primary,
                                size: b.Button.sizes.medium,
                                isDisabled: void 0 !== p && p,
                                onClick: function() {
                                    null == o || o(), g.close()
                                },
                                children: i
                            })]
                        })]
                    }), g]
                },
                H = ((r = {}).doNotDisturbTimeWindow = "doNotDisturbTimeWindow", r.doNotDisturb = "doNotDisturb", r.allowMarketingEmailNotifications = "allowMarketingEmailNotifications", r),
                R = ((i = {}).doNotDisturbTimeWindow = "doNotDisturbTimeWindow", i),
                $ = ((o = {}).Invalid = "Invalid", o.Enabled = "Enabled", o.Disabled = "Disabled", o);

            function W(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var V = ((a = {}).experience = "Experience", a.groupShout = "GroupShout", a.default = "Default", a),
                _ = {
                    GroupToIconMap: {
                        Experiences: "icon-regular-circle-play",
                        MobilePush: "icon-regular-smartphone-portrait",
                        GroupShouts: "icon-regular-three-people",
                        Email: "icon-regular-envelope",
                        Desktop: "icon-regular-mouse-scrollwheel"
                    },
                    GroupToThumbnailType: {
                        GroupShout: B.ThumbnailTypes.groupIcon,
                        Experience: B.ThumbnailTypes.gameIcon
                    },
                    UserSettingNameToUserSetting: {
                        AllowMarketingEmailNotifications: H.allowMarketingEmailNotifications
                    },
                    UserSettingToSurface: W({}, H.allowMarketingEmailNotifications, "email-marketing-setting"),
                    UserSettingToConsentName: W({}, H.allowMarketingEmailNotifications, "allowMarketingEmailNotificationsPreferences")
                };

            function X(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function J(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function Y(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            J(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            J(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function q(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return X(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return X(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function K(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var Q = function(e) {
                var t = e.entityId,
                    n = e.entityName,
                    r = e.entityType,
                    i = e.truncatedEntityName,
                    o = e.entityCreatorName,
                    a = e.hasBorder,
                    c = e.hasToggle,
                    l = e.initToggle,
                    f = e.unsubscribeCallback,
                    p = e.selectionDisabled,
                    d = e.translate,
                    m = q((0, u.useState)(!!l), 2),
                    h = m[0],
                    y = m[1],
                    g = q((0, b.createSystemFeedback)(), 2),
                    x = g[0],
                    S = g[1],
                    w = function() {
                        S.warning(d("Message.ErrorGeneral"))
                    },
                    j = function(e) {
                        return Y(function() {
                            return K(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return e || O(v.promptUnsubscribe, t.toString()), [4, f(e)];
                                    case 1:
                                        return n.sent() ? y(e) : w(), [2]
                                }
                            })
                        })()
                    },
                    N = q(F({
                        titleText: d("Heading.AreYouSure"),
                        bodyComponent: d("Body.TurnOffExperienceNotifications", {
                            experienceName: i
                        }),
                        actionButtonText: d("Action.TurnOff"),
                        neutralButtonText: d("Action.Cancel"),
                        onAction: function() {
                            return j(!1)
                        }
                    }), 2),
                    P = N[0],
                    T = N[1];
                return (0, s.jsxs)("div", {
                    className: U()("preference-button-wrapper", {
                        "border-top": a,
                        "text-disabled": p
                    }),
                    children: [(0, s.jsxs)("div", {
                        className: "preference-button ",
                        children: [(0, s.jsx)(B.Thumbnail2d, {
                            type: _.GroupToThumbnailType[r],
                            size: B.DefaultThumbnailSize,
                            format: B.ThumbnailFormat.webp,
                            targetId: t,
                            containerClass: "preference-thumbnail"
                        }), (0, s.jsxs)("div", {
                            className: "preference-info-wrapper",
                            children: [(0, s.jsx)("div", {
                                className: "small text text-emphasis preference-name",
                                children: n
                            }), (0, s.jsx)("div", {
                                className: "small text text-content",
                                children: o
                            })]
                        }), (null == c || c) && (0, s.jsx)("div", {
                            className: "toggle-button-container",
                            "data-testid": "toggle-button-container",
                            children: (0, s.jsx)(z, {
                                onChangeCallback: function(e) {
                                    return Y(function() {
                                        return K(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    if (e) return [3, 1];
                                                    return T.open(), [3, 3];
                                                case 1:
                                                    return [4, j(e)];
                                                case 2:
                                                    t.sent(), t.label = 3;
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                selection: h,
                                selectionDisabled: p
                            })
                        })]
                    }), (0, s.jsx)(x, {}), P]
                })
            };

            function Z(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ee(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function et(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            ee(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            ee(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function en(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || ei(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function er(e) {
                return function(e) {
                    if (Array.isArray(e)) return Z(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ei(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ei(e, t) {
                if (e) {
                    if ("string" == typeof e) return Z(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Z(e, t)
                }
            }

            function eo(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ea = (0, u.createContext)({
                    experienceDataList: [],
                    showMore: function() {},
                    initGroupExperiencePreferencesList: function(e) {
                        return Promise.resolve()
                    },
                    canShowMore: !1,
                    updateExperiencePreferences: function(e, t) {
                        return Promise.resolve(!1)
                    },
                    isFetchingGamesInfo: !1
                }),
                ec = function() {
                    return (0, u.useContext)(ea)
                },
                el = function(e) {
                    var t = e.children,
                        n = en((0, u.useState)([]), 2),
                        r = n[0],
                        i = n[1],
                        o = en((0, u.useState)([]), 2),
                        a = o[0],
                        l = o[1],
                        f = en((0, u.useState)(!1), 2),
                        p = f[0],
                        d = f[1],
                        b = en((0, u.useState)(!1), 2),
                        h = b[0],
                        y = b[1],
                        g = (0, u.useCallback)(function(e) {
                            return et(function() {
                                var t, n;
                                return eo(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return y(!0), [4, N({
                                                universeIds: e.map(function(e) {
                                                    return e.toString()
                                                })
                                            })];
                                        case 1:
                                            if (t = r.sent()) return n = null == t ? void 0 : t.data.map(function(e) {
                                                var t;
                                                return {
                                                    experienceName: e.name,
                                                    truncatedExperienceName: (t = e.name, t.length > 100 ? "".concat(t.slice(0, 100), "...") : t),
                                                    experienceCreator: e.creator.name,
                                                    id: e.id,
                                                    enabled: !0
                                                }
                                            }), y(!1), [2, n];
                                            return y(!1), [2, null]
                                    }
                                })
                            })()
                        }, [y, N]),
                        v = function(e, t) {
                            var n = a.indexOf(e);
                            if (n > -1) {
                                var r = er(a);
                                r[n] = t, l(r)
                            }
                        };
                    return (0, s.jsx)(ea.Provider, {
                        value: {
                            experienceDataList: a,
                            showMore: function() {
                                return et(function() {
                                    var e, t;
                                    return eo(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                if (!p) return [3, 2];
                                                return (e = a.length + 10) >= r.length && d(!1), [4, g(r.slice(a.length, e))];
                                            case 1:
                                                (t = n.sent()) && l(er(a).concat(er(t))), n.label = 2;
                                            case 2:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            initGroupExperiencePreferencesList: function(e) {
                                return et(function() {
                                    var t;
                                    return eo(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                if (!e.notificationsEnabledExperiences) return [3, 2];
                                                return i(e.notificationsEnabledExperiences), [4, g(e.notificationsEnabledExperiences.slice(0, 10))];
                                            case 1:
                                                (t = n.sent()) && (l(er(a).concat(er(t))), d(e.notificationsEnabledExperiences.length > 10)), n.label = 2;
                                            case 2:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            canShowMore: p,
                            updateExperiencePreferences: function(e, t) {
                                return et(function() {
                                    var n, r, i, o;
                                    return eo(this, function(a) {
                                        var l, s, u, f;
                                        switch (a.label) {
                                            case 0:
                                                if (!t) return [3, 2];
                                                return [4, (l = c.CurrentUser.userId, s = e.id.toString(), w(function() {
                                                    var e;
                                                    return j(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return t.trys.push([0, 2, , 3]), e = x.followingsUrl(l, s), [4, m.httpService.post(e, {})];
                                                            case 1:
                                                                if (200 === t.sent().status) return [2, !0];
                                                                return [2, !1];
                                                            case 2:
                                                                return t.sent(), [2, !1];
                                                            case 3:
                                                                return [2]
                                                        }
                                                    })
                                                })())];
                                            case 1:
                                                return (n = a.sent()) && (r = {
                                                    experienceName: e.experienceName,
                                                    truncatedExperienceName: e.truncatedExperienceName,
                                                    experienceCreator: e.experienceCreator,
                                                    id: e.id,
                                                    enabled: !0
                                                }, v(e, r)), [2, n];
                                            case 2:
                                                return [4, (u = c.CurrentUser.userId, f = e.id.toString(), w(function() {
                                                    var e;
                                                    return j(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return t.trys.push([0, 2, , 3]), e = x.followingsUrl(u, f), [4, m.httpService.delete(e, {})];
                                                            case 1:
                                                                if (200 === t.sent().status) return [2, !0];
                                                                return [2, !1];
                                                            case 2:
                                                                return t.sent(), [2, !1];
                                                            case 3:
                                                                return [2]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return (i = a.sent()) && (o = {
                                                    experienceName: e.experienceName,
                                                    truncatedExperienceName: e.truncatedExperienceName,
                                                    experienceCreator: e.experienceCreator,
                                                    id: e.id,
                                                    enabled: !1
                                                }, v(e, o)), [2, i]
                                        }
                                    })
                                })()
                            },
                            isFetchingGamesInfo: h
                        },
                        children: t
                    })
                };

            function es(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function eu(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            es(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            es(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function ef(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ep = (0, d.withTranslations)(function(e) {
                var t = e.translate,
                    n = e.localizedDescription,
                    r = e.parentalControlsEnabled,
                    i = ec(),
                    o = i.updateExperiencePreferences,
                    a = i.canShowMore,
                    c = i.showMore,
                    l = i.isFetchingGamesInfo,
                    u = i.experienceDataList.map(function(e, n) {
                        return (0, s.jsx)(Q, {
                            hasBorder: 0 !== n,
                            entityId: e.id,
                            entityName: e.experienceName,
                            truncatedEntityName: e.truncatedExperienceName,
                            entityCreatorName: t("Label.CreatedBy", {
                                creator: e.experienceCreator
                            }),
                            unsubscribeCallback: function(t) {
                                return eu(function() {
                                    return ef(this, function(n) {
                                        return [2, eu(function() {
                                            return ef(this, function(n) {
                                                return [2, o(e, t)]
                                            })
                                        })()]
                                    })
                                })()
                            },
                            initToggle: e.enabled,
                            translate: t,
                            entityType: V.experience,
                            selectionDisabled: r
                        }, e.id)
                    });
                return (0, s.jsxs)("div", {
                    className: "preference-selector",
                    children: [(0, s.jsx)("div", {
                        className: "notification-type-info",
                        children: (0, s.jsx)("div", {
                            className: "notification-descriptor small text text-content",
                            children: n
                        })
                    }), (0, s.jsx)("div", {
                        children: u
                    }), (0, s.jsxs)("div", {
                        children: [l ? (0, s.jsx)(b.Loading, {}) : null, a && (0, s.jsx)(b.Button, {
                            className: "load-more-button btn-secondary-md",
                            onClick: c,
                            children: t("Action.ShowMore")
                        })]
                    })]
                })
            }, T);

            function ed(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eb(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function em(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            eb(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            eb(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function eh(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || eg(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ey(e) {
                return function(e) {
                    if (Array.isArray(e)) return ed(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || eg(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eg(e, t) {
                if (e) {
                    if ("string" == typeof e) return ed(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ed(e, t)
                }
            }

            function ev(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ex = (0, u.createContext)({
                    groupShoutDataList: [],
                    showMore: function() {},
                    initGroupShoutPreferencesList: function(e) {
                        return Promise.resolve()
                    },
                    canShowMore: !1,
                    updateGroupShoutPreferences: function(e, t, n) {
                        return Promise.resolve(!1)
                    },
                    isFetchingGroupsInfo: !1
                }),
                eS = function() {
                    return (0, u.useContext)(ex)
                },
                ew = function(e) {
                    var t = e.children,
                        n = eh((0, u.useState)([]), 2),
                        r = n[0],
                        i = n[1],
                        o = eh((0, u.useState)([]), 2),
                        a = o[0],
                        l = o[1],
                        f = eh((0, u.useState)(!1), 2),
                        p = f[0],
                        d = f[1],
                        b = eh((0, u.useState)(!1), 2),
                        h = b[0],
                        y = b[1],
                        g = (0, u.useCallback)(function() {
                            return em(function() {
                                var e, t;
                                return ev(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return y(!0), [4, P(c.CurrentUser.userId)];
                                        case 1:
                                            if (!(e = n.sent())) return y(!1), [2, null];
                                            return t = e.data.map(function(e) {
                                                var t, n;
                                                return {
                                                    groupName: e.group.name,
                                                    truncatedGroupName: (n = e.group.name, n.length > 100 ? "".concat(n.slice(0, 100), "...") : n),
                                                    creatorName: null == (t = e.group.owner) ? void 0 : t.displayName,
                                                    groupId: e.group.id,
                                                    notificationPreferences: e.notificationPreferences
                                                }
                                            }), y(!1), [2, t]
                                    }
                                })
                            })()
                        }, [y, P]),
                        v = function(e, t) {
                            var n = a.indexOf(e);
                            if (n > -1) {
                                var r = ey(a);
                                r[n] = t, l(r)
                            }
                        };
                    return (0, s.jsx)(ex.Provider, {
                        value: {
                            groupShoutDataList: a,
                            showMore: function() {
                                if (p) {
                                    var e = a.length + 10;
                                    e >= r.length && d(!1);
                                    var t = r.slice(a.length, e);
                                    l(ey(a).concat(ey(t)))
                                }
                            },
                            initGroupShoutPreferencesList: function(e) {
                                return em(function() {
                                    var t, n;
                                    return ev(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!e.notificationsEnabledGroups) return [3, 2];
                                                return [4, g()];
                                            case 1:
                                                (t = r.sent()) && (i(t), n = t.slice(0, 10), l(ey(a).concat(ey(n))), d(t.length > 10)), r.label = 2;
                                            case 2:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            canShowMore: p,
                            updateGroupShoutPreferences: function(e, t, n) {
                                return em(function() {
                                    var r, i, o, a;
                                    return ev(this, function(c) {
                                        switch (c.label) {
                                            case 0:
                                                var l;
                                                return [4, (l = e.groupId.toString(), w(function() {
                                                    var e;
                                                    return j(this, function(r) {
                                                        switch (r.label) {
                                                            case 0:
                                                                return r.trys.push([0, 2, , 3]), e = x.updateGroupShoutNotificationPreferencesUrl(l), [4, m.httpService.patch(e, {
                                                                    notificationsEnabled: t,
                                                                    type: n
                                                                })];
                                                            case 1:
                                                                if (200 === r.sent().status) return [2, !0];
                                                                return [2, !1];
                                                            case 2:
                                                                return r.sent(), [2, !1];
                                                            case 3:
                                                                return [2]
                                                        }
                                                    })
                                                })())];
                                            case 1:
                                                if (r = c.sent(), !(o = (i = ey(e.notificationPreferences)).find(function(e) {
                                                        return e.type === n
                                                    }))) return [2, !1];
                                                return o.enabled = t, r && (a = {
                                                    groupName: e.groupName,
                                                    truncatedGroupName: e.truncatedGroupName,
                                                    creatorName: e.creatorName,
                                                    groupId: e.groupId,
                                                    notificationPreferences: i
                                                }, v(e, a)), [2, r]
                                        }
                                    })
                                })()
                            },
                            isFetchingGroupsInfo: h
                        },
                        children: t
                    })
                };

            function ej(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function eN(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            ej(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            ej(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function eP(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var eO = (0, d.withTranslations)(function(e) {
                    var t = e.translate,
                        n = e.localizedDescription,
                        r = e.parentalControlsEnabled,
                        i = eS(),
                        o = i.updateGroupShoutPreferences,
                        a = i.canShowMore,
                        c = i.showMore,
                        l = i.isFetchingGroupsInfo,
                        u = i.groupShoutDataList.map(function(e, n) {
                            var i;
                            return (0, s.jsxs)(f().Fragment, {
                                children: [(0, s.jsx)(Q, {
                                    hasBorder: 0 !== n,
                                    entityId: e.groupId,
                                    entityName: e.groupName,
                                    truncatedEntityName: e.truncatedGroupName,
                                    entityCreatorName: t("Label.CreatedBy", {
                                        creator: e.creatorName
                                    }),
                                    hasToggle: !1,
                                    unsubscribeCallback: function() {
                                        return Promise.resolve(!1)
                                    },
                                    initToggle: !1,
                                    translate: t,
                                    entityType: V.groupShout,
                                    selectionDisabled: r
                                }, e.groupId), null == (i = e.notificationPreferences) ? void 0 : i.map(function(t) {
                                    return (0, s.jsx)(G, {
                                        localizedTypeName: t.name,
                                        localizedDescription: t.description,
                                        selection: t.enabled,
                                        onTogglePreference: function(n) {
                                            return eN(function() {
                                                return eP(this, function(r) {
                                                    var i;
                                                    return [2, (i = t.type, eN(function() {
                                                        return eP(this, function(t) {
                                                            return [2, o(e, n, i)]
                                                        })
                                                    })())]
                                                })
                                            })()
                                        },
                                        selectionDisabled: r
                                    })
                                })]
                            })
                        });
                    return (0, s.jsxs)("div", {
                        className: "preference-selector",
                        children: [(0, s.jsx)("div", {
                            className: "notification-type-info",
                            children: (0, s.jsx)("div", {
                                className: "notification-descriptor small text text-content",
                                children: n
                            })
                        }), (0, s.jsx)("div", {
                            children: u
                        }), (0, s.jsxs)("div", {
                            children: [l ? (0, s.jsx)(b.Loading, {}) : null, a && (0, s.jsx)(b.Button, {
                                className: "load-more-button btn-secondary-md",
                                onClick: c,
                                children: t("Action.ShowMore")
                            })]
                        })]
                    })
                }, T),
                eT = function(e) {
                    var t = e.localizedDescription,
                        n = e.timeString,
                        r = e.selectionDisabled,
                        i = e.onClick;
                    return (0, s.jsx)("div", {
                        className: "preference-selector",
                        children: (0, s.jsxs)("div", {
                            className: U()("preference-selector-header", {
                                "text-disabled": r
                            }),
                            children: [(0, s.jsx)("div", {
                                className: "notification-type-info",
                                children: (0, s.jsx)("div", {
                                    className: "notification-type-descriptor small text text-content",
                                    children: t
                                })
                            }), (0, s.jsxs)("button", {
                                className: "time-preference-selector-button",
                                type: "button",
                                disabled: r,
                                onClick: i,
                                children: [(0, s.jsx)("span", {
                                    className: "small text text-content",
                                    children: n
                                }), (0, s.jsx)("span", {
                                    className: "icon-chevron-heavy-right"
                                })]
                            })]
                        })
                    })
                },
                eD = function(e, t, n) {
                    var r = Math.max(0, Math.min(1439, e)),
                        i = Math.floor(r / 60),
                        o = (r % 60).toString().padStart(2, "0");
                    return "".concat(0 === i ? 12 : i > 12 ? i - 12 : i, ":").concat(o, " ").concat(i >= 12 ? n : t)
                },
                eC = function(e) {
                    var t = Math.max(0, Math.min(1439, e)),
                        n = Math.floor(t / 60);
                    return {
                        hour: 0 === n ? 12 : n > 12 ? n - 12 : n,
                        minute: t % 60,
                        isPM: n >= 12
                    }
                },
                eE = function(e, t, n) {
                    var r = e;
                    return n && 12 !== e ? r += 12 : n || 12 !== e || (r = 0), 60 * r + t
                },
                eA = function() {
                    for (var e = [], t = 1; t <= 12; t++) e.push({
                        label: t.toString(),
                        value: t.toString()
                    });
                    return e
                },
                eI = function() {
                    for (var e = [], t = 0; t < 60; t += 15) {
                        var n = t.toString().padStart(2, "0");
                        e.push({
                            label: n,
                            value: t.toString()
                        })
                    }
                    return e
                };

            function ek(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eM(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ek(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ek(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eU = function(e, t, n, r, i, o) {
                var a = eM((0, u.useState)({
                        hour: 12,
                        minute: 0,
                        isPM: !1
                    }), 2),
                    c = a[0],
                    l = a[1],
                    p = eM((0, u.useState)(void 0), 2),
                    d = p[0],
                    m = p[1];
                (0, u.useEffect)(function() {
                    e >= 0 && l(eC(e))
                }, [e]);
                var h = function(e, t) {
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
                        }({}, c);
                        "hour" === e ? n.hour = Number(t) : "minute" === e ? n.minute = Number(t) : "ampm" === e && (n.isPM = "PM" === t), l(n), m(void 0)
                    },
                    y = !d,
                    g = eE(c.hour, c.minute, c.isPM),
                    v = eA(),
                    x = eI();
                return [g, (0, s.jsxs)(f().Fragment, {
                    children: [(0, s.jsx)("div", {
                        id: "time-dropdown",
                        className: "time-container form-group",
                        children: (0, s.jsxs)("div", {
                            className: "time-dropdown-row",
                            children: [(0, s.jsxs)("div", {
                                className: "time-dropdown-item",
                                children: [(0, s.jsx)("label", {
                                    className: "time-dropdown-label",
                                    htmlFor: "hour-dropdown",
                                    children: t
                                }), (0, s.jsx)(b.NativeDropdown, {
                                    id: "hour-dropdown",
                                    selectedItemvalue: c.hour.toString(),
                                    selectionItems: v,
                                    className: U()("rbx-select-group time-select-group"),
                                    onChange: function(e) {
                                        h("hour", e.target.value)
                                    }
                                })]
                            }), (0, s.jsxs)("div", {
                                className: "time-dropdown-item",
                                children: [(0, s.jsx)("label", {
                                    className: "time-dropdown-label",
                                    htmlFor: "minute-dropdown",
                                    children: n
                                }), (0, s.jsx)(b.NativeDropdown, {
                                    id: "minute-dropdown",
                                    selectedItemvalue: c.minute.toString(),
                                    selectionItems: x,
                                    className: U()("rbx-select-group time-select-group"),
                                    onChange: function(e) {
                                        h("minute", e.target.value)
                                    }
                                })]
                            }), (0, s.jsxs)("div", {
                                className: "time-dropdown-item",
                                children: [(0, s.jsx)("label", {
                                    className: "time-dropdown-label",
                                    htmlFor: "ampm-dropdown",
                                    children: r
                                }), (0, s.jsx)(b.NativeDropdown, {
                                    id: "ampm-dropdown",
                                    selectedItemvalue: c.isPM ? "PM" : "AM",
                                    selectionItems: [{
                                        label: i,
                                        value: "AM"
                                    }, {
                                        label: o,
                                        value: "PM"
                                    }],
                                    className: U()("rbx-select-group time-select-group"),
                                    onChange: function(e) {
                                        h("ampm", e.target.value)
                                    }
                                })]
                            })]
                        })
                    }), d && (0, s.jsx)("p", {
                        className: "text-error form-control-label modal-error-message",
                        children: d
                    })]
                }), function(e) {
                    e >= 0 && l(eC(e)), m(void 0)
                }, y]
            };

            function ez(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eG(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ez(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ez(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eB = function(e) {
                var t = e.titleText,
                    n = e.bodyText,
                    r = e.actionButtonText,
                    i = e.onAction,
                    o = e.neutralButtonText,
                    a = e.closeable,
                    c = e.initTimeMinutes,
                    l = void 0 === c ? 0 : c,
                    u = e.translate,
                    f = e.invalidTimeMinutes,
                    p = eG(eU(null != l ? l : 0, u("Label.DoNotDisturb.Hour"), u("Label.DoNotDisturb.Minute"), u("Label.DoNotDisturb.AMPM"), u("Label.DoNotDisturb.CapitalizedAM"), u("Label.DoNotDisturb.CapitalizedPM")), 4),
                    d = p[0],
                    b = p[1],
                    m = p[2];
                p[3];
                var h = eG(F({
                    titleText: t,
                    bodyComponent: (0, s.jsxs)("div", {
                        className: "do-not-disturb-time-container",
                        children: [(0, s.jsx)("div", {
                            className: "text-description modal-description",
                            children: n
                        }), b, d === f && (0, s.jsx)("div", {
                            className: "text-error",
                            children: u("Error.TimeWindowTooShort")
                        })]
                    }),
                    actionButtonText: r,
                    neutralButtonText: o,
                    closeable: void 0 === a || a,
                    onAction: function() {
                        null == i || i(d)
                    },
                    onNeutral: function() {
                        m(l)
                    },
                    disableActionButton: d === f
                }), 2);
                return [h[0], h[1]]
            };

            function eL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eF(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eL(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eL(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eH = function(e) {
                var t, n, r = e.localizedHeading,
                    i = e.localizedDescription,
                    o = e.selection,
                    a = e.selectionDisabled,
                    c = e.startTimeMinutes,
                    l = e.endTimeMinutes,
                    u = e.dndEnabledByParentalControls,
                    p = e.translate,
                    d = e.updateUserSettings,
                    b = e.userSettingName,
                    m = function(e, t) {
                        t && d(null != t ? t : H.doNotDisturb, null != b ? b : null, e ? $.Enabled : $.Disabled)
                    },
                    h = function(e, t) {
                        d(H.doNotDisturbTimeWindow, b ? R.doNotDisturbTimeWindow : null, {
                            startTimeMinutes: e,
                            endTimeMinutes: t
                        })
                    },
                    y = eF(eB({
                        titleText: p("Label.DoNotDisturb.StartTime"),
                        bodyText: p("Description.DoNotDisturbTimePicker.StartTime"),
                        actionButtonText: p("Action.Save"),
                        onAction: function(e) {
                            h(e, l)
                        },
                        neutralButtonText: p("Action.Cancel"),
                        initTimeMinutes: c,
                        translate: p,
                        invalidTimeMinutes: l
                    }), 2),
                    g = y[0],
                    v = y[1],
                    x = eF(eB({
                        titleText: p("Label.DoNotDisturb.EndTime"),
                        bodyText: p("Description.DoNotDisturbTimePicker.EndTime"),
                        actionButtonText: p("Action.Save"),
                        onAction: function(e) {
                            h(c, e)
                        },
                        neutralButtonText: p("Action.Cancel"),
                        initTimeMinutes: l,
                        translate: p,
                        invalidTimeMinutes: c
                    }), 2),
                    S = x[0],
                    w = x[1];
                return (0, s.jsx)(G, (t = function(e) {
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
                    userSetting: H.doNotDisturb,
                    localizedTypeName: r,
                    localizedDescription: i,
                    onTogglePreference: function(e, t) {
                        m(e, t)
                    },
                    selection: o
                }, o && {
                    renderAdditionalContent: function() {
                        return (0, s.jsxs)(f().Fragment, {
                            children: [(0, s.jsx)(eT, {
                                localizedDescription: p("Label.DoNotDisturb.StartTime"),
                                timeString: eD(c, p("Label.DoNotDisturb.CapitalizedAM"), p("Label.DoNotDisturb.CapitalizedPM")),
                                selectionDisabled: a,
                                onClick: function() {
                                    v.open()
                                }
                            }), g, (0, s.jsx)(eT, {
                                localizedDescription: p("Label.DoNotDisturb.EndTime"),
                                timeString: eD(l, p("Label.DoNotDisturb.CapitalizedAM"), p("Label.DoNotDisturb.CapitalizedPM")),
                                selectionDisabled: a,
                                onClick: function() {
                                    w.open()
                                }
                            }), S]
                        })
                    }
                }), n = n = {
                    selectionDisabled: a,
                    showLockOnToggle: u
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                }), t))
            };

            function eR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function e$(e) {
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
            }

            function eW(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || eV(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eV(e, t) {
                if (e) {
                    if ("string" == typeof e) return eR(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eR(e, t)
                }
            }
            var e_ = function(e) {
                var t, n = e.groupSettings,
                    r = e.translate,
                    i = e.updatePreferenceStatus,
                    o = e.updateUserSettings,
                    a = e.updateUserSettingsV2,
                    c = eW((0, u.useState)(n.notificationTypePreferences), 2),
                    l = c[0],
                    p = c[1],
                    d = eW((0, u.useState)(n.notificationDndPreferences), 2),
                    b = d[0],
                    m = d[1],
                    h = eW((0, u.useState)(n.notificationChannelAggregateSettings), 2),
                    y = h[0],
                    g = h[1],
                    x = ec().initGroupExperiencePreferencesList,
                    S = eS().initGroupShoutPreferencesList,
                    w = eW((0, u.useState)(V.default), 2),
                    j = w[0],
                    N = w[1],
                    P = eW((0, u.useState)(!1), 2),
                    T = P[0],
                    D = P[1];
                (0, u.useEffect)(function() {
                    n.notificationsEnabledExperiences ? N(V.experience) : n.notificationsEnabledGroups && N(V.groupShout)
                }, []), (0, u.useEffect)(function() {
                    j === V.experience ? x(n) : j === V.groupShout && S(n)
                }, [j]), (0, u.useEffect)(function() {
                    n.notificationTypePreferences !== l && p(n.notificationTypePreferences), n.notificationDndPreferences !== b && m(n.notificationDndPreferences);
                    var e = n.notificationChannelAggregateSettings,
                        t = null == y ? void 0 : y.isChannelAggregateSettingEnabled,
                        r = null == e ? void 0 : e.isChannelAggregateSettingEnabled;
                    e !== y && (r !== t || null === e || null === y) && g(e)
                }, [n, l, b, y]);
                var C = function(e, t, n) {
                        if (l) {
                            var r = l.find(function(t) {
                                    return t.notificationTypeName === e
                                }),
                                i = null == r ? void 0 : r.notificationChannelPreferences.find(function(e) {
                                    return e.notificationChannel === t
                                });
                            i && (i.preferenceStatus = n, p(function(e) {
                                if (Array.isArray(e)) return eR(e)
                            }(l) || function(e) {
                                if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(l) || eV(l) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()))
                        }
                    },
                    M = function(e, t, n) {
                        b && (void 0 !== e && (b.isNotificationDndSettingEnabled = e), void 0 !== t && (b.notificationDndStartTimeMinutes = t), void 0 !== n && (b.notificationDndEndTimeMinutes = n), m(e$({}, b)))
                    },
                    U = function(e, t, n, r) {
                        switch (e) {
                            case H.doNotDisturb:
                                M(n === $.Enabled);
                                break;
                            case H.doNotDisturbTimeWindow:
                                M(void 0, n.startTimeMinutes, n.endTimeMinutes)
                        }
                        t ? a(null, t, n, r) : o(e, null, n, r)
                    },
                    z = function(e, t, n) {
                        var r;
                        switch (C(e, t, n), n) {
                            case A.All:
                                r = v.sendAll;
                                break;
                            case A.None:
                                r = v.sendNone
                        }
                        r && O(r, e), i(e, t, n)
                    };
                return (0, s.jsxs)("div", {
                    className: T ? "group-wrapper group-open" : "group-wrapper",
                    children: [(0, s.jsxs)("button", {
                        type: "button",
                        className: "toggle-button ".concat(T ? "" : "toggle-button-closed"),
                        "aria-label": "toggle-section",
                        onClick: function() {
                            O(v.categoryToggle, n.groupName), D(function(e) {
                                return !e
                            })
                        },
                        children: [n.groupIcon && (0, s.jsx)("div", {
                            className: "flex shrink-0",
                            children: (0, s.jsx)(E, {
                                size: "Large",
                                name: "".concat(_.GroupToIconMap[n.groupIcon])
                            })
                        }), (0, s.jsx)("span", {
                            className: "group-name heading text-emphasis",
                            children: n.localizedGroupName
                        }), n.parentalControlsEnabled && (0, s.jsx)(k, {}), (0, s.jsx)("span", {
                            className: T ? "icon-up" : "icon-down"
                        })]
                    }), T && (0, s.jsx)("div", {
                        className: "selector-list",
                        children: j === V.experience ? (0, s.jsx)(ep, {
                            translate: r,
                            localizedDescription: n.parentalControlsEnabled ? n.parentalControlsMessage : n.localizedGroupDescription,
                            parentalControlsEnabled: n.parentalControlsEnabled
                        }) : j === V.groupShout ? (0, s.jsx)(eO, {
                            translate: r,
                            localizedDescription: n.parentalControlsEnabled ? n.parentalControlsMessage : n.localizedGroupDescription,
                            parentalControlsEnabled: n.parentalControlsEnabled
                        }) : (0, s.jsxs)(f().Fragment, {
                            children: [(0, s.jsx)("div", {
                                className: "notification-descriptor small text text-content",
                                children: n.parentalControlsEnabled ? n.parentalControlsMessage : n.localizedGroupDescription
                            }), (0, s.jsx)("div", {
                                className: "notification-aggregate-settings",
                                children: null != y && (0, s.jsx)(G, {
                                    userSettingName: y.userSettingsName,
                                    localizedDescription: y.localizedChannelAggregateSettingDescription,
                                    localizedTypeName: y.localizedChannelAggregateSettingName,
                                    onTogglePreference: function(e, t, n) {
                                        g((r = e$({}, y), i = i = {
                                            isChannelAggregateSettingEnabled: e
                                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(i)) : (function(e, t) {
                                            var n = Object.keys(e);
                                            if (Object.getOwnPropertySymbols) {
                                                var r = Object.getOwnPropertySymbols(e);
                                                n.push.apply(n, r)
                                            }
                                            return n
                                        })(Object(i)).forEach(function(e) {
                                            Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(i, e))
                                        }), r));
                                        var r, i, o = e ? $.Enabled : $.Disabled;
                                        n && a(null, n, o)
                                    },
                                    selectionDisabled: n.parentalControlsEnabled,
                                    selection: y.isChannelAggregateSettingEnabled
                                })
                            }), null != b && (0, s.jsx)(eH, {
                                localizedHeading: b.notificationDndTitleName,
                                localizedDescription: b.notificationDndDescription,
                                selection: b.isNotificationDndSettingEnabled,
                                selectionDisabled: n.parentalControlsEnabled || b.isDndParentalControlEnabled,
                                startTimeMinutes: b.notificationDndStartTimeMinutes,
                                endTimeMinutes: b.notificationDndEndTimeMinutes,
                                dndEnabledByParentalControls: b.isDndParentalControlEnabled,
                                translate: r,
                                updateUserSettings: U,
                                userSettingName: null != (t = b.userSettingsName) ? t : null
                            }), null == l ? void 0 : l.map(function(e, t) {
                                var r = n.parentalControlsEnabled || null != y && !y.isChannelAggregateSettingEnabled,
                                    i = !r && (e.notificationChannelPreferences[0].preferenceStatus === A.All || e.notificationChannelPreferences[0].preferenceStatus === A.Best),
                                    o = e.notificationChannelPreferences[0].notificationChannel;
                                return o && o !== I.Invalid ? (0, s.jsx)(G, {
                                    userSetting: e.userSettingsName ? _.UserSettingNameToUserSetting[e.userSettingsName] : void 0,
                                    userSettingName: e.userSettingsName,
                                    localizedDescription: e.localizedNotificationTypeDescriptor,
                                    localizedTypeName: e.localizedNotificationTypeName,
                                    onTogglePreference: function(t, n, r) {
                                        var i = e.notificationChannelPreferences[0],
                                            o = t ? A.All : A.None,
                                            a = e.enableUserSettingsUpdateEndpointCutover || e.enableUserSettingsDualWrite || (null == i ? void 0 : i.enableUserSettingsDualWrite) || (null == i ? void 0 : i.enableUserSettingsUpdateEndpointCutover),
                                            c = !e.enableUserSettingsUpdateEndpointCutover && !(null == i ? void 0 : i.enableUserSettingsUpdateEndpointCutover);
                                        if (a) {
                                            C(e.notificationTypeName, i.notificationChannel, o);
                                            var l, s, u, f = t ? $.Enabled : $.Disabled;
                                            r ? n ? U(null, r, f, null != (l = e.auditDataHeader) ? l : "") : U(null, r, {
                                                channelSettings: [{
                                                    channelName: e.notificationChannelPreferences[0].notificationChannel,
                                                    setting: f
                                                }]
                                            }, null != (s = e.auditDataHeader) ? s : "") : n && U(n, null, f, null != (u = e.auditDataHeader) ? u : "")
                                        }
                                        c && z(e.notificationTypeName, e.notificationChannelPreferences[0].notificationChannel, o)
                                    },
                                    hasBorder: 0 === t && (null != b || null != y),
                                    selectionDisabled: r,
                                    selection: i
                                }, e.notificationTypeName) : null
                            })]
                        })
                    })]
                })
            };

            function eX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var eJ = function(e) {
                var t, n, r = e.translate,
                    i = e.displayGeneralErrorMessage,
                    o = (t = (0, u.useState)(!0), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != i) {
                            var o = [],
                                a = !0,
                                c = !1;
                            try {
                                for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), o.length !== t); a = !0);
                            } catch (e) {
                                c = !0, r = e
                            } finally {
                                try {
                                    a || null == i.return || i.return()
                                } finally {
                                    if (c) throw r
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return eX(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return eX(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    a = o[0],
                    l = o[1];
                (0, u.useEffect)(function() {
                    w(function() {
                        return j(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, m.httpService.get(x.pushEnabledUrl)];
                                case 1:
                                    return [2, !!e.sent().data.destination]
                            }
                        })
                    })().then(function(e) {
                        l(e), e || O(v.enableNotificationsPromptShown)
                    }).catch(i)
                }, []);
                var f = (0, c.DeviceMeta)();
                return a || !(f.isAndroidDevice || f.isIosDevice) ? null : (0, s.jsxs)("div", {
                    className: "enable-push-notifications-prompt",
                    children: [(0, s.jsx)("p", {
                        className: "text-emphasis",
                        children: r("Label.NotificationsDisabled", {
                            platform: r(f.isAndroidDevice ? "Label.Android" : "Label.IOS")
                        })
                    }), (0, s.jsx)("p", {
                        className: "small text-emphasis text-format",
                        children: r("Label.NotificationDisabledWarning")
                    }), (null === c.Hybrid || void 0 === c.Hybrid || null == (n = c.Hybrid.Push) ? void 0 : n.pushPermissionTrigger) && (0, s.jsx)(b.Button, {
                        variant: b.Button.variants.growth,
                        className: "access-settings-button",
                        onClick: function() {
                            var e;
                            (null === c.Hybrid || void 0 === c.Hybrid || null == (e = c.Hybrid.Push) ? void 0 : e.pushPermissionTrigger) && (O(v.enableNotificationsPromptClicked), c.Hybrid.Push.pushPermissionTrigger("enableAuthorizationForUser"), l(!0))
                        },
                        children: r("Action.EnableNotifications")
                    })]
                })
            };

            function eY(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function eq(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            eY(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            eY(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function eK(e) {
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
            }

            function eQ(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        n.push.apply(n, r)
                    }
                    return n
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function eZ(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function e0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function e1(e, t, n, r, i, o, a) {
                try {
                    var c = e[o](a),
                        l = c.value
                } catch (e) {
                    n(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(r, i)
            }

            function e2(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var o = e.apply(t, n);

                        function a(e) {
                            e1(o, r, i, a, c, "next", e)
                        }

                        function c(e) {
                            e1(o, r, i, a, c, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function e3(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function e4(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            c = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (c) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return e0(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return e0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e6(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = c(0), a.throw = c(1), a.return = c(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function c(c) {
                    return function(l) {
                        var s = [c, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var e8 = e4((0, b.createSystemFeedback)(), 2),
                e5 = e8[0],
                e7 = e8[1],
                e9 = (0, d.withTranslations)(function(e) {
                    var t = e.translate,
                        n = e4((0, u.useState)([]), 2),
                        r = n[0],
                        i = n[1],
                        o = e4((0, u.useState)({
                            groupName: "",
                            localizedGroupName: ""
                        }), 2),
                        a = o[0],
                        l = o[1],
                        f = e4((0, u.useState)({
                            groupName: "",
                            localizedGroupName: ""
                        }), 2),
                        p = f[0],
                        d = f[1],
                        b = e4((0, u.useState)(!1), 2),
                        h = b[0],
                        y = b[1],
                        g = (0, u.useCallback)(function() {
                            e7.warning(t("Message.ErrorGeneral"))
                        }, [t]),
                        S = (0, u.useCallback)(function() {
                            return e2(function() {
                                var e;
                                return e6(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return [4, w(function() {
                                                var e;
                                                return j(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return t.trys.push([0, 2, , 3]), [4, m.httpService.get(x.groupedNotificationPreferences)];
                                                        case 1:
                                                            if (200 !== (e = t.sent()).status) return [2, null];
                                                            return [2, e.data];
                                                        case 2:
                                                            return t.sent(), [2, null];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            return (e = t.sent()) ? (O(v.pageLoaded), i(e.notificationPreferences)) : g(), [2]
                                    }
                                })
                            })()
                        }, [g]),
                        N = (0, u.useCallback)(function(e) {
                            return !!e && r.some(function(t) {
                                var n;
                                return (null == (n = t.notificationChannelAggregateSettings) ? void 0 : n.userSettingsName) === e
                            })
                        }, [r]),
                        P = function(e, t, n) {
                            return e2(function() {
                                return e6(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            var i;
                                            return [4, (i = {
                                                updatedPreferences: [{
                                                    notificationType: e,
                                                    notificationChannel: t,
                                                    preferenceStatus: n
                                                }]
                                            }, w(function() {
                                                return j(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, m.httpService.post(x.notificationPreferencesUrl, i)];
                                                        case 1:
                                                            return [2, e.sent().status]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return 200 !== r.sent() && g(), [2]
                                    }
                                })
                            })()
                        },
                        T = function(e, t, n, r) {
                            return e2(function() {
                                var t, i;
                                return e6(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!e) return [3, 4];
                                            t = e3({}, e, n), i = {}, r && (i["rbx-audit-data"] = r), o.label = 1;
                                        case 1:
                                            var a, c;
                                            return o.trys.push([1, 3, , 4]), [4, (a = t, c = i, eq(function() {
                                                var e;
                                                return eZ(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return e = eQ(eK({}, x.updateUserSetting), {
                                                                headers: c
                                                            }), [4, m.httpService.post(e, a)];
                                                        case 1:
                                                            return [2, t.sent().status]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            return o.sent(), [3, 4];
                                        case 3:
                                            return o.sent(), g(), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        D = function(e, t, n, r) {
                            return e2(function() {
                                var e, i;
                                return e6(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!t) return [3, 6];
                                            e = e3({}, t, n), i = {}, r && (i["rbx-audit-data"] = r), o.label = 1;
                                        case 1:
                                            var a, c;
                                            return o.trys.push([1, 5, , 6]), [4, (a = e, c = i, eq(function() {
                                                var e;
                                                return eZ(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return e = eQ(eK({}, x.updateUserSettingV2), {
                                                                headers: c
                                                            }), [4, m.httpService.post(e, a)];
                                                        case 1:
                                                            return [2, t.sent().status]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (o.sent(), !N(t)) return [3, 4];
                                            return [4, S()];
                                        case 3:
                                            o.sent(), o.label = 4;
                                        case 4:
                                            return [3, 6];
                                        case 5:
                                            return o.sent(), g(), [3, 6];
                                        case 6:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    return (0, u.useEffect)(function() {
                        S(), e2(function() {
                            var e;
                            return e6(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, w(function() {
                                            var e;
                                            return j(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return t.trys.push([0, 2, , 3]), [4, m.httpService.get(x.experiencePreferencesUrl)];
                                                    case 1:
                                                        if (200 !== (e = t.sent()).status) return [2, null];
                                                        return [2, e.data];
                                                    case 2:
                                                        return t.sent(), [2, null];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return (e = t.sent()) ? l(e.experiencePreferences) : g(), [2]
                                }
                            })
                        })(), e2(function() {
                            var e;
                            return e6(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, w(function() {
                                            var e;
                                            return j(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return t.trys.push([0, 2, , 3]), [4, m.httpService.get(x.groupShoutPreferencesUrl)];
                                                    case 1:
                                                        if (200 !== (e = t.sent()).status) return [2, null];
                                                        return [2, e.data];
                                                    case 2:
                                                        return t.sent(), [2, null];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return (e = t.sent()) ? d(e.groupShoutPreferences) : g(), [2]
                                }
                            })
                        })(), e2(function() {
                            return e6(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, w(function() {
                                            return j(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        return e.trys.push([0, 2, , 3]), [4, c.Guac.callBehaviour("account-settings-ui")];
                                                    case 1:
                                                        return [2, !!e.sent().displayPushNotificationUpsell];
                                                    case 2:
                                                        return e.sent(), [2, !1];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return y(e.sent()), [2]
                                }
                            })
                        })()
                    }, [g, S]), (0, s.jsxs)("div", {
                        children: [(0, s.jsx)(e5, {}), (0, s.jsxs)("div", {
                            className: "title-wrapper",
                            children: [(0, s.jsx)("h2", {
                                children: t("Heading.Notifications")
                            }), (0, s.jsx)("p", {
                                children: t("Description.CustomizeNotificationsChannels")
                            }), h && (0, s.jsx)(eJ, {
                                translate: t,
                                displayGeneralErrorMessage: g
                            })]
                        }), r.map(function(e, n) {
                            return [0 !== n && !e.restrictedAccess && (0, s.jsx)("div", {
                                className: "group-divider"
                            }), !e.restrictedAccess && (0, s.jsx)(e_, {
                                groupSettings: e,
                                translate: t,
                                updatePreferenceStatus: P,
                                updateUserSettings: T,
                                updateUserSettingsV2: D
                            }, e.localizedGroupName)]
                        }), !a.restrictedAccess && (0, s.jsxs)(el, {
                            children: [r.length > 0 && (0, s.jsx)("div", {
                                className: "group-divider"
                            }), (0, s.jsx)(e_, {
                                groupSettings: a,
                                translate: t,
                                updatePreferenceStatus: P,
                                updateUserSettings: T,
                                updateUserSettingsV2: D
                            }, a.localizedGroupName)]
                        }), !p.restrictedAccess && (0, s.jsxs)(ew, {
                            children: [(0, s.jsx)("div", {
                                className: "group-divider"
                            }), (0, s.jsx)(e_, {
                                groupSettings: p,
                                translate: t,
                                updatePreferenceStatus: P,
                                updateUserSettings: T,
                                updateUserSettingsV2: D
                            }, p.localizedGroupName)]
                        })]
                    })
                }, T);
            Object.assign(l(), {
                NotificationPreferencesService: {
                    renderNotificationPreferences: function(e) {
                        (0, p.render)((0, s.jsx)(e9, {}), e)
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("NotificationPreferences");
//# debugId=5642ac03-2078-4683-8699-78bf6d8fda4d
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/notificationPreferences-5360aaaa89f1c420.js.map