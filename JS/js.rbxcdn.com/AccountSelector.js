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
                for (var a in n) e.o(n, a) && !e.o(t, a) && Object.defineProperty(t, a, {
                    enumerable: !0,
                    get: n[a]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        t = Roblox,
        n = e.n(t),
        a = React,
        c = e.n(a),
        o = ReactDOM,
        l = ReactStyleGuide,
        s = ReactUtilities,
        r = RobloxThumbnails,
        i = "@",
        u = {
            common: ["CommonUI.Controls"],
            feature: "Authentication.OneTimePasscode"
        },
        m = {
            ActionSelect: "Action.Select",
            LabelBackToLogin: "Label.BackToLogin",
            ResponseChooseAnotherMethod: "Response.ChooseAnotherMethod"
        },
        d = (0, s.withTranslations)((function(e) {
            var t = e.userId,
                n = e.username,
                a = e.displayName,
                o = e.onAccountSelection,
                s = e.disabled,
                u = e.translate;
            return c().createElement("li", {
                className: "account-selection-list-item"
            }, c().createElement("div", {
                className: "account-selection"
            }, c().createElement("div", {
                className: "account-selection-thumbnail"
            }, c().createElement(r.Thumbnail2d, {
                containerClass: "avatar-card-image",
                type: r.ThumbnailTypes.avatarHeadshot,
                targetId: t,
                size: r.ThumbnailAvatarHeadshotSize.size48
            })), c().createElement("div", {
                className: "account-selection-name-container"
            }, c().createElement("p", {
                className: "account-selection-displayname"
            }, a || n), c().createElement("p", {
                className: "account-selection-username"
            }, i + n)), !s && c().createElement("div", {
                className: "account-selection-button-container"
            }, c().createElement(l.Button, {
                className: "account-selection-button",
                variant: "secondary",
                size: "sm",
                onClick: function(e) {
                    return o(t)
                }
            }, u(m.ActionSelect)))))
        }), u),
        h = function(e) {
            var t = e.users,
                n = e.onAccountSelection,
                a = e.disabled,
                o = e.translate;
            return c().createElement("ul", {
                className: "account-selector"
            }, t.map((function(e) {
                return c().createElement(d, {
                    key: e.id,
                    userId: e.id,
                    username: e.name,
                    displayName: e.displayName,
                    onAccountSelection: n,
                    disabled: a,
                    translate: o
                })
            })))
        },
        E = (0, s.withTranslations)((function(e) {
            var t = e.users,
                n = e.invalidUsers,
                o = e.onAccountSelection,
                s = e.onAccountSelectorAbandoned,
                r = e.titleText,
                i = e.helpText,
                u = e.translate,
                d = (0, a.useState)(!0),
                E = d[0],
                b = d[1],
                p = function() {
                    s(), b(!1)
                };
            return c().createElement(l.Modal, {
                className: "account-selector-modal",
                show: E,
                onHide: p,
                size: "lg"
            }, c().createElement(a.Fragment, null, c().createElement(l.Modal.Header, {
                className: "account-selector-header",
                title: r,
                onClose: p
            }), c().createElement(l.Modal.Body, null, c().createElement(a.Fragment, null, c().createElement("p", {
                className: "account-selector-help-text"
            }, i), c().createElement(h, {
                users: t,
                onAccountSelection: function(e) {
                    o(e), b(!1)
                },
                disabled: !1,
                translate: u
            }), n.length > 0 && c().createElement(a.Fragment, null, c().createElement("p", {
                className: "account-selector-help-text"
            }, u(m.ResponseChooseAnotherMethod)), c().createElement(h, {
                users: n,
                onAccountSelection: function() {},
                disabled: !0,
                translate: u
            }), c().createElement(l.Button, {
                className: "account-selector-back-button",
                variant: "secondary",
                size: "sm",
                onClick: function() {
                    window.dispatchEvent(new Event("closeEmailVerifyCodeModal")), p()
                }
            }, u(m.LabelBackToLogin)))))))
        }), u),
        b = function(e) {
            var t = e.containerId,
                n = e.users,
                a = e.invalidUsers,
                l = e.onAccountSelection,
                s = e.onAccountSelectorAbandoned,
                r = e.titleText,
                i = e.helpText,
                u = e.translate,
                m = document.getElementById(t);
            return null != m && ((0, o.unmountComponentAtNode)(m), (0, o.render)(c().createElement(E, {
                users: n,
                invalidUsers: a,
                onAccountSelection: l,
                onAccountSelectorAbandoned: s,
                titleText: r,
                helpText: i,
                translate: u
            }), m), !0)
        },
        p = {
            renderAccountSelectorModal: b
        };
    Object.assign(n(), {
        AccountSelectorService: p
    })
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/1b514895d6824ef131185505a1c525a1-accountSelector.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AccountSelector");