/*! For license information please see profileHeader.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            452: function(e, t) {
                var n;
                ! function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function o() {
                        for (var e = "", t = 0; t < arguments.length; t++) {
                            var n = arguments[t];
                            n && (e = i(e, a(n)))
                        }
                        return e
                    }

                    function a(e) {
                        if ("string" == typeof e || "number" == typeof e) return e;
                        if ("object" != typeof e) return "";
                        if (Array.isArray(e)) return o.apply(null, e);
                        if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                        var t = "";
                        for (var n in e) r.call(e, n) && e[n] && (t = i(t, n));
                        return t
                    }

                    function i(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (o.default = o, e.exports = o) : void 0 === (n = function() {
                        return o
                    }.apply(t, [])) || (e.exports = n)
                }()
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var a = t[r] = {
            exports: {}
        };
        return e[r](a, a.exports, n), a.exports
    }
    n.n = function(e) {
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
        }, n.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || new Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.nc = void 0,
        function() {
            "use strict";
            var e = CoreUtilities,
                t = React,
                r = n.n(t),
                o = ReactDOM,
                a = n.n(o),
                i = Roblox.ui,
                l = {
                    profileHeaderContainer: function() {
                        return document.getElementById("profile-header-container")
                    },
                    translationKeys: {
                        friends: "Label.Friends",
                        connections: "Label.Connections",
                        connection: "Label.Connection",
                        followers: "Label.Followers",
                        following: "Label.Following",
                        customizeName: "Label.CustomizeName",
                        cancel: "Label.Cancel",
                        setCustomName: "Description.SetCustomName2",
                        recognizeFriends: "Description.RecognizeConnectionsByCustomName",
                        save: "Action.Save",
                        customizeNamePlaceholder: "Label.CustomizeNamePlaceholder",
                        invalidAlias: "Message.InvalidAliasError",
                        buttons: {
                            accept: "Action.Accept",
                            addConnection: "Label.AddConnection",
                            pending: "Action.Pending",
                            removeConnection: "Label.RemoveConnection",
                            chat: "Action.Chat",
                            joinGame: "Action.JoinGame",
                            openDropdown: "Action.SeeMore"
                        },
                        modal: {
                            block: {
                                title: "Heading.BlockUser",
                                body: "Message.BlockConfirmation",
                                blockButton: "Action.Block",
                                blockAndReportButton: "Action.BlockAndReport",
                                cancelButton: "Action.Cancel"
                            },
                            unblock: {
                                title: "Heading.UnblockUser",
                                body: "Message.UnblockConfirmation",
                                unblockButton: "Action.Unblock",
                                cancelButton: "Action.Cancel"
                            }
                        },
                        dropdown: {
                            follow: "Action.Follow",
                            unfollow: "Action.Unfollow",
                            blockUser: "Action.BlockUser",
                            unblockUser: "Action.UnblockUser",
                            inventory: "Action.Inventory",
                            favorites: "Action.Favorites",
                            impersonateUser: "Action.ImpersonateUser",
                            tradeItems: "Action.TradeItems",
                            reportAbuse: "Label.ReportAbuse"
                        },
                        error: {
                            acceptFriendRequestFailed: "Message.AcceptFriendRequestError",
                            sendFriendRequestFailed: "Message.SendFriendRequestError",
                            sendConnectionRequestFailed: "Message.SendConnectionRequestError",
                            removeFriendFailed: "Message.RemoveFriendError",
                            followFailed: "Message.FollowError",
                            unfollowFailed: "Message.UnfollowError",
                            blockFailed: "Message.BlockError",
                            blockRequestFailed: "Message.BlockRequestError",
                            impersonateUserFailed: "Message.ImpersonateUserError",
                            updateStatusFailed: "Message.UpdateStatusError",
                            tooManyAttempts: "Response.TooManyAttempts",
                            blockLimitExceeded: "Message.TooManyBlockedUsersError",
                            targetAlreadyBlocked: "Message.UserAlreadyBlockedError",
                            targetNotBlocked: "Message.TargetNotBlockedError",
                            parentManaged: "Message.ParentBlockedUserError",
                            blockedOnPlatform: "Message.TargetBlockedOnPlatform"
                        }
                    },
                    eventNames: {
                        playerFriendAdd: "playerFriendAdd",
                        playerFriendAccept: "playerFriendAccept",
                        tradeEntryPoint: "tradeEntryPoint",
                        modalOpen: "modalOpen",
                        buttonClick: "buttonClick",
                        customNameInvalidInput: "customizeNameSaveAttemptInvalidInput",
                        customNameMaxLimit: "customizeNameMaximumCharLimitTyped",
                        customNameClearedInput: "customizeNameClearedInput"
                    },
                    eventCtx: {
                        userProfile: "userProfile",
                        profileMenu: "profileMenu",
                        customizeName: "customizeName"
                    },
                    maxCharactersForAlias: 20,
                    eventBtns: {
                        saveAlias: "saveAlias",
                        closeCustomName: "closeCustomizeName"
                    },
                    experiments: {
                        profileFRAcceptCTALayer: "Social.Profile",
                        profileFRAcceptCTAParameter: "useProminentFRAcceptCTA"
                    }
                },
                u = ReactUtilities,
                c = CoreRobloxUtilities,
                s = HeaderScripts,
                d = RobloxUserProfiles,
                f = RobloxPresence,
                p = n.n(f),
                m = function() {
                    return m = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, m.apply(this, arguments)
                };

            function v(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && t.indexOf(r) < 0 && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) t.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]])
                }
                return n
            }

            function h(e) {
                var t, n, r = "";
                if ("string" == typeof e || "number" == typeof e) r += e;
                else if ("object" == typeof e)
                    if (Array.isArray(e))
                        for (t = 0; t < e.length; t++) e[t] && (n = h(e[t])) && (r && (r += " "), r += n);
                    else
                        for (t in e) e[t] && (r && (r += " "), r += t);
                return r
            }
            var y = function() {
                    for (var e, t, n = 0, r = ""; n < arguments.length;)(e = arguments[n++]) && (t = h(e)) && (r && (r += " "), r += t);
                    return r
                },
                b = ReactJSX;

            function g(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return w(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return w(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function w(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var x = null !== globalThis && void 0 !== globalThis && globalThis.document ? t.useLayoutEffect : function() {},
                E = t[" useId ".trim().toString()] || function() {},
                S = 0;

            function O(e) {
                var n = g(t.useState(E()), 2),
                    r = n[0],
                    o = n[1];
                return x((function() {
                    e || o((function(e) {
                        return null != e ? e : String(S++)
                    }))
                }), [e]), e || (r ? "radix-".concat(r) : "")
            }

            function C(e, t) {
                var n;
                if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                    if (Array.isArray(e) || (n = N(e)) || t && e && "number" == typeof e.length) {
                        n && (e = n);
                        var r = 0,
                            o = function() {};
                        return {
                            s: o,
                            n: function() {
                                return r >= e.length ? {
                                    done: !0
                                } : {
                                    done: !1,
                                    value: e[r++]
                                }
                            },
                            e: function(e) {
                                throw e
                            },
                            f: o
                        }
                    }
                    throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }
                var a, i = !0,
                    l = !1;
                return {
                    s: function() {
                        n = e[Symbol.iterator]()
                    },
                    n: function() {
                        var e = n.next();
                        return i = e.done, e
                    },
                    e: function(e) {
                        l = !0, a = e
                    },
                    f: function() {
                        try {
                            i || null == n.return || n.return()
                        } finally {
                            if (l) throw a
                        }
                    }
                }
            }

            function k(e) {
                return function(e) {
                    if (Array.isArray(e)) return P(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || N(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function A(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || N(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function N(e, t) {
                if (e) {
                    if ("string" == typeof e) return P(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? P(e, t) : void 0
                }
            }

            function P(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function R(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function j(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? R(Object(n), !0).forEach((function(t) {
                        T(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : R(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function T(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function _(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function I(e, t) {
                var n = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === n || n;
                return function(n) {
                    if (null != e && e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function D(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function F() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = D(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : D(t[e], null)
                        }
                    }
                }
            }

            function M() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                return t.useCallback(F.apply(void 0, n), n)
            }
            var U = Symbol("radix.slottable");

            function L(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === U
            }
            var B = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                var r = function(e) {
                        var n = function(e) {
                                var n = t.forwardRef((function(e, n) {
                                    var r = e.children,
                                        o = _(e, ["children"]);
                                    if (t.isValidElement(r)) {
                                        var a = function(e) {
                                                var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            i = function(e, t) {
                                                var n = j({}, t),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            a = t[r];
                                                        /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                            a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (n[r] = o) : "style" === r ? n[r] = j(j({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                    };
                                                for (var o in t) r(o);
                                                return j(j({}, e), n)
                                            }(o, r.props);
                                        return r.type !== t.Fragment && (i.ref = n ? F(n, a) : a), t.cloneElement(r, i)
                                    }
                                    return t.Children.count(r) > 1 ? t.Children.only(null) : null
                                }));
                                return n.displayName = "".concat(e, ".SlotClone"), n
                            }(e),
                            r = t.forwardRef((function(e, r) {
                                var o = e.children,
                                    a = _(e, ["children"]),
                                    i = t.Children.toArray(o),
                                    l = i.find(L);
                                if (l) {
                                    var u = l.props.children,
                                        c = i.map((function(e) {
                                            return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                        }));
                                    return (0, b.jsx)(n, j(j({}, a), {}, {
                                        ref: r,
                                        children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                                    }))
                                }
                                return (0, b.jsx)(n, j(j({}, a), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(e, ".Slot"), r
                    }("Primitive.".concat(n)),
                    o = t.forwardRef((function(e, t) {
                        var o = e.asChild,
                            a = _(e, ["asChild"]),
                            i = o ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, j(j({}, a), {}, {
                            ref: t
                        }))
                    }));
                return o.displayName = "Primitive.".concat(n), j(j({}, e), {}, T({}, n, o))
            }), {});

            function W(e) {
                var n = t.useRef(e);
                return t.useEffect((function() {
                    n.current = e
                })), t.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var z, V = "dismissableLayer.update",
                H = t.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                K = t.forwardRef((function(e, n) {
                    var r, o = e.disableOutsidePointerEvents,
                        a = void 0 !== o && o,
                        i = e.onEscapeKeyDown,
                        l = e.onPointerDownOutside,
                        u = e.onFocusOutside,
                        c = e.onInteractOutside,
                        s = e.onDismiss,
                        d = _(e, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        f = t.useContext(H),
                        p = A(t.useState(null), 2),
                        m = p[0],
                        v = p[1],
                        h = null !== (r = null == m ? void 0 : m.ownerDocument) && void 0 !== r ? r : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                        y = A(t.useState({}), 2)[1],
                        g = M(n, (function(e) {
                            return v(e)
                        })),
                        w = Array.from(f.layers),
                        x = A(k(f.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        E = w.indexOf(x),
                        S = m ? w.indexOf(m) : -1,
                        O = f.layersWithOutsidePointerEventsDisabled.size > 0,
                        C = S >= E,
                        N = function(e) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = W(e),
                                o = t.useRef(!1),
                                a = t.useRef((function() {}));
                            return t.useEffect((function() {
                                var e = function(e) {
                                        if (e.target && !o.current) {
                                            var t = function() {
                                                    q("dismissableLayer.pointerDownOutside", r, i, {
                                                        discrete: !0
                                                    })
                                                },
                                                i = {
                                                    originalEvent: e
                                                };
                                            "touch" === e.pointerType ? (n.removeEventListener("click", a.current), a.current = t, n.addEventListener("click", a.current, {
                                                once: !0
                                            })) : t()
                                        } else n.removeEventListener("click", a.current);
                                        o.current = !1
                                    },
                                    t = window.setTimeout((function() {
                                        n.addEventListener("pointerdown", e)
                                    }), 0);
                                return function() {
                                    window.clearTimeout(t), n.removeEventListener("pointerdown", e), n.removeEventListener("click", a.current)
                                }
                            }), [n, r]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }((function(e) {
                            var t = e.target,
                                n = k(f.branches).some((function(e) {
                                    return e.contains(t)
                                }));
                            C && !n && (null != l && l(e), null != c && c(e), e.defaultPrevented || null == s || s())
                        }), h),
                        P = function(e) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = W(e),
                                o = t.useRef(!1);
                            return t.useEffect((function() {
                                var e = function(e) {
                                    e.target && !o.current && q("dismissableLayer.focusOutside", r, {
                                        originalEvent: e
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return n.addEventListener("focusin", e),
                                    function() {
                                        return n.removeEventListener("focusin", e)
                                    }
                            }), [n, r]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }((function(e) {
                            var t = e.target;
                            k(f.branches).some((function(e) {
                                return e.contains(t)
                            })) || (null != u && u(e), null != c && c(e), e.defaultPrevented || null == s || s())
                        }), h);
                    return function(e) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                            r = function(e) {
                                var n = t.useRef(e);
                                return t.useEffect((function() {
                                    n.current = e
                                })), t.useMemo((function() {
                                    return function() {
                                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                                    }
                                }), [])
                            }(e);
                        t.useEffect((function() {
                            var e = function(e) {
                                "Escape" === e.key && r(e)
                            };
                            return n.addEventListener("keydown", e, {
                                    capture: !0
                                }),
                                function() {
                                    return n.removeEventListener("keydown", e, {
                                        capture: !0
                                    })
                                }
                        }), [r, n])
                    }((function(e) {
                        S === f.layers.size - 1 && (null != i && i(e), !e.defaultPrevented && s && (e.preventDefault(), s()))
                    }), h), t.useEffect((function() {
                        if (m) return a && (0 === f.layersWithOutsidePointerEventsDisabled.size && (z = h.body.style.pointerEvents, h.body.style.pointerEvents = "none"), f.layersWithOutsidePointerEventsDisabled.add(m)), f.layers.add(m), G(),
                            function() {
                                a && 1 === f.layersWithOutsidePointerEventsDisabled.size && (h.body.style.pointerEvents = z)
                            }
                    }), [m, h, a, f]), t.useEffect((function() {
                        return function() {
                            m && (f.layers.delete(m), f.layersWithOutsidePointerEventsDisabled.delete(m), G())
                        }
                    }), [m, f]), t.useEffect((function() {
                        var e = function() {
                            return y({})
                        };
                        return document.addEventListener(V, e),
                            function() {
                                return document.removeEventListener(V, e)
                            }
                    }), []), (0, b.jsx)(B.div, j(j({}, d), {}, {
                        ref: g,
                        style: j({
                            pointerEvents: O ? C ? "auto" : "none" : void 0
                        }, e.style),
                        onFocusCapture: I(e.onFocusCapture, P.onFocusCapture),
                        onBlurCapture: I(e.onBlurCapture, P.onBlurCapture),
                        onPointerDownCapture: I(e.onPointerDownCapture, N.onPointerDownCapture)
                    }))
                }));

            function G() {
                var e = new CustomEvent(V);
                document.dispatchEvent(e)
            }

            function q(e, t, n, r) {
                var a = r.discrete,
                    i = n.originalEvent.target,
                    l = new CustomEvent(e, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: n
                    });
                t && i.addEventListener(e, t, {
                    once: !0
                }), a ? function(e, t) {
                    e && o.flushSync((function() {
                        return e.dispatchEvent(t)
                    }))
                }(i, l) : i.dispatchEvent(l)
            }

            function X(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function $() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = X(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : X(t[e], null)
                        }
                    }
                }
            }
            K.displayName = "DismissableLayer", t.forwardRef((function(e, n) {
                var r = t.useContext(H),
                    o = t.useRef(null),
                    a = M(n, o);
                return t.useEffect((function() {
                    var e = o.current;
                    if (e) return r.branches.add(e),
                        function() {
                            r.branches.delete(e)
                        }
                }), [r.branches]), (0, b.jsx)(B.div, j(j({}, e), {}, {
                    ref: a
                }))
            })).displayName = "DismissableLayerBranch";
            var Y = Symbol("radix.slottable");

            function Z(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === Y
            }
            var J = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                var r = function(e) {
                        var n = function(e) {
                                var n = t.forwardRef((function(e, n) {
                                    var r = e.children,
                                        o = _(e, ["children"]);
                                    if (t.isValidElement(r)) {
                                        var a = function(e) {
                                                var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            i = function(e, t) {
                                                var n = j({}, t),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            a = t[r];
                                                        /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                            a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (n[r] = o) : "style" === r ? n[r] = j(j({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                    };
                                                for (var o in t) r(o);
                                                return j(j({}, e), n)
                                            }(o, r.props);
                                        return r.type !== t.Fragment && (i.ref = n ? $(n, a) : a), t.cloneElement(r, i)
                                    }
                                    return t.Children.count(r) > 1 ? t.Children.only(null) : null
                                }));
                                return n.displayName = "".concat(e, ".SlotClone"), n
                            }(e),
                            r = t.forwardRef((function(e, r) {
                                var o = e.children,
                                    a = _(e, ["children"]),
                                    i = t.Children.toArray(o),
                                    l = i.find(Z);
                                if (l) {
                                    var u = l.props.children,
                                        c = i.map((function(e) {
                                            return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                        }));
                                    return (0, b.jsx)(n, j(j({}, a), {}, {
                                        ref: r,
                                        children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                                    }))
                                }
                                return (0, b.jsx)(n, j(j({}, a), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(e, ".Slot"), r
                    }("Primitive.".concat(n)),
                    o = t.forwardRef((function(e, t) {
                        var o = e.asChild,
                            a = _(e, ["asChild"]),
                            i = o ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, j(j({}, a), {}, {
                            ref: t
                        }))
                    }));
                return o.displayName = "Primitive.".concat(n), j(j({}, e), {}, T({}, n, o))
            }), {});

            function Q(e) {
                var n = t.useRef(e);
                return t.useEffect((function() {
                    n.current = e
                })), t.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var ee = "focusScope.autoFocusOnMount",
                te = "focusScope.autoFocusOnUnmount",
                ne = {
                    bubbles: !1,
                    cancelable: !0
                },
                re = t.forwardRef((function(e, n) {
                    var r = e.loop,
                        o = void 0 !== r && r,
                        a = e.trapped,
                        i = void 0 !== a && a,
                        l = e.onMountAutoFocus,
                        u = e.onUnmountAutoFocus,
                        c = _(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        s = A(t.useState(null), 2),
                        d = s[0],
                        f = s[1],
                        p = Q(l),
                        m = Q(u),
                        v = t.useRef(null),
                        h = function() {
                            for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            return t.useCallback($.apply(void 0, n), n)
                        }(n, (function(e) {
                            return f(e)
                        })),
                        y = t.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    t.useEffect((function() {
                        if (i) {
                            var e = function(e) {
                                    if (!y.paused && d) {
                                        var t = e.target;
                                        d.contains(t) ? v.current = t : le(v.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!y.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || le(v.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var n = new MutationObserver((function(e) {
                                if (document.activeElement === document.body) {
                                    var t, n = C(e);
                                    try {
                                        for (n.s(); !(t = n.n()).done;) {
                                            t.value.removedNodes.length > 0 && le(d)
                                        }
                                    } catch (e) {
                                        n.e(e)
                                    } finally {
                                        n.f()
                                    }
                                }
                            }));
                            return d && n.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                                }
                        }
                    }), [i, d, y.paused]), t.useEffect((function() {
                        if (d) {
                            ue.add(y);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(ee, ne);
                                d.addEventListener(ee, p), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t, n = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                                        r = void 0 !== n && n,
                                        o = document.activeElement,
                                        a = C(e);
                                    try {
                                        for (a.s(); !(t = a.n()).done;) {
                                            if (le(t.value, {
                                                    select: r
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        a.e(e)
                                    } finally {
                                        a.f()
                                    }
                                }(oe(d).filter((function(e) {
                                    return "A" !== e.tagName
                                })), {
                                    select: !0
                                }), document.activeElement === e && le(d))
                            }
                            return function() {
                                d.removeEventListener(ee, p), setTimeout((function() {
                                    var t = new CustomEvent(te, ne);
                                    d.addEventListener(te, m), d.dispatchEvent(t), t.defaultPrevented || le(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(te, m), ue.remove(y)
                                }), 0)
                            }
                        }
                    }), [d, p, m, y]);
                    var g = t.useCallback((function(e) {
                        if ((o || i) && !y.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                n = document.activeElement;
                            if (t && n) {
                                var r = e.currentTarget,
                                    a = function(e) {
                                        var t = oe(e);
                                        return [ae(t, e), ae(t.reverse(), e)]
                                    }(r),
                                    l = A(a, 2),
                                    u = l[0],
                                    c = l[1];
                                u && c ? e.shiftKey || n !== c ? e.shiftKey && n === u && (e.preventDefault(), o && le(c, {
                                    select: !0
                                })) : (e.preventDefault(), o && le(u, {
                                    select: !0
                                })) : n === r && e.preventDefault()
                            }
                        }
                    }), [o, i, y.paused]);
                    return (0, b.jsx)(J.div, j(j({
                        tabIndex: -1
                    }, c), {}, {
                        ref: h,
                        onKeyDown: g
                    }))
                }));

            function oe(e) {
                for (var t = [], n = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); n.nextNode();) t.push(n.currentNode);
                return t
            }

            function ae(e, t) {
                var n, r = C(e);
                try {
                    for (r.s(); !(n = r.n()).done;) {
                        var o = n.value;
                        if (!ie(o, {
                                upTo: t
                            })) return o
                    }
                } catch (e) {
                    r.e(e)
                } finally {
                    r.f()
                }
            }

            function ie(e, t) {
                var n = t.upTo;
                if ("hidden" === getComputedStyle(e).visibility) return !0;
                for (; e;) {
                    if (void 0 !== n && e === n) return !1;
                    if ("none" === getComputedStyle(e).display) return !0;
                    e = e.parentElement
                }
                return !1
            }

            function le(e) {
                var t = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                    n = void 0 !== t && t;
                if (e && e.focus) {
                    var r = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== r && function(e) {
                        return e instanceof HTMLInputElement && "select" in e
                    }(e) && n && e.select()
                }
            }
            re.displayName = "FocusScope";
            var ue = function() {
                var e = [];
                return {
                    add: function(t) {
                        var n = e[0];
                        t !== n && null != n && n.pause(), (e = ce(e, t)).unshift(t)
                    },
                    remove: function(t) {
                        var n;
                        null === (n = (e = ce(e, t))[0]) || void 0 === n || n.resume()
                    }
                }
            }();

            function ce(e, t) {
                var n = k(e),
                    r = n.indexOf(t);
                return -1 !== r && n.splice(r, 1), n
            }

            function se(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var de = Symbol("radix.slottable");

            function fe(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === de
            }
            var pe = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                    var r = function(e) {
                            var n = function(e) {
                                    var n = t.forwardRef((function(e, n) {
                                        var r = e.children,
                                            o = _(e, ["children"]);
                                        if (t.isValidElement(r)) {
                                            var a = function(e) {
                                                    var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                i = function(e, t) {
                                                    var n = j({}, t),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                a = t[r];
                                                            /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                                a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (n[r] = o) : "style" === r ? n[r] = j(j({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) r(o);
                                                    return j(j({}, e), n)
                                                }(o, r.props);
                                            return r.type !== t.Fragment && (i.ref = n ? function() {
                                                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                return function(e) {
                                                    var n = !1,
                                                        r = t.map((function(t) {
                                                            var r = se(t, e);
                                                            return n || "function" != typeof r || (n = !0), r
                                                        }));
                                                    if (n) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var n = r[e];
                                                            "function" == typeof n ? n() : se(t[e], null)
                                                        }
                                                    }
                                                }
                                            }(n, a) : a), t.cloneElement(r, i)
                                        }
                                        return t.Children.count(r) > 1 ? t.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(e, ".SlotClone"), n
                                }(e),
                                r = t.forwardRef((function(e, r) {
                                    var o = e.children,
                                        a = _(e, ["children"]),
                                        i = t.Children.toArray(o),
                                        l = i.find(fe);
                                    if (l) {
                                        var u = l.props.children,
                                            c = i.map((function(e) {
                                                return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                            }));
                                        return (0, b.jsx)(n, j(j({}, a), {}, {
                                            ref: r,
                                            children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                                        }))
                                    }
                                    return (0, b.jsx)(n, j(j({}, a), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(n)),
                        o = t.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = _(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, j(j({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), j(j({}, e), {}, T({}, n, o))
                }), {}),
                me = null !== globalThis && void 0 !== globalThis && globalThis.document ? t.useLayoutEffect : function() {},
                ve = t.forwardRef((function(e, n) {
                    var r, o = e.container,
                        i = _(e, ["container"]),
                        l = A(t.useState(!1), 2),
                        u = l[0],
                        c = l[1];
                    me((function() {
                        return c(!0)
                    }), []);
                    var s = o || u && (null === globalThis || void 0 === globalThis || null === (r = globalThis.document) || void 0 === r ? void 0 : r.body);
                    return s ? a().createPortal((0, b.jsx)(pe.div, j(j({}, i), {}, {
                        ref: n
                    })), s) : null
                }));
            ve.displayName = "Portal";
            var he = 0;

            function ye() {
                t.useEffect((function() {
                    var e, t, n = document.querySelectorAll("[data-radix-focus-guard]");
                    return document.body.insertAdjacentElement("afterbegin", null !== (e = n[0]) && void 0 !== e ? e : be()), document.body.insertAdjacentElement("beforeend", null !== (t = n[1]) && void 0 !== t ? t : be()), he++,
                        function() {
                            1 === he && document.querySelectorAll("[data-radix-focus-guard]").forEach((function(e) {
                                return e.remove()
                            })), he--
                        }
                }), [])
            }

            function be() {
                var e = document.createElement("span");
                return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
            }
            var ge = "right-scroll-bar-position",
                we = "width-before-scroll-bar";

            function xe(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var Ee = "undefined" != typeof window ? t.useLayoutEffect : t.useEffect,
                Se = new WeakMap;

            function Oe(e) {
                return e
            }
            var Ce = function(e) {
                var n = e.sideCar,
                    r = v(e, ["sideCar"]);
                if (!n) throw new Error("Sidecar: please provide `sideCar` property to import the right car");
                var o = n.read();
                if (!o) throw new Error("Sidecar medium not found");
                return t.createElement(o, m({}, r))
            };
            Ce.isSideCarExport = !0;
            var ke = function(e) {
                    void 0 === e && (e = {});
                    var t = function(e, t) {
                        void 0 === t && (t = Oe);
                        var n = [],
                            r = !1;
                        return {
                            read: function() {
                                if (r) throw new Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                                return n.length ? n[n.length - 1] : null
                            },
                            useMedium: function(e) {
                                var o = t(e, r);
                                return n.push(o),
                                    function() {
                                        n = n.filter((function(e) {
                                            return e !== o
                                        }))
                                    }
                            },
                            assignSyncMedium: function(e) {
                                for (r = !0; n.length;) {
                                    var t = n;
                                    n = [], t.forEach(e)
                                }
                                n = {
                                    push: function(t) {
                                        return e(t)
                                    },
                                    filter: function() {
                                        return n
                                    }
                                }
                            },
                            assignMedium: function(e) {
                                r = !0;
                                var t = [];
                                if (n.length) {
                                    var o = n;
                                    n = [], o.forEach(e), t = n
                                }
                                var a = function() {
                                        var n = t;
                                        t = [], n.forEach(e)
                                    },
                                    i = function() {
                                        return Promise.resolve().then(a)
                                    };
                                i(), n = {
                                    push: function(e) {
                                        t.push(e), i()
                                    },
                                    filter: function(e) {
                                        return t = t.filter(e), n
                                    }
                                }
                            }
                        }
                    }();
                    return t.options = m({
                        async: !0,
                        ssr: !1
                    }, e), t
                }(),
                Ae = function() {},
                Ne = t.forwardRef((function(e, n) {
                    var r = t.useRef(null),
                        o = t.useState({
                            onScrollCapture: Ae,
                            onWheelCapture: Ae,
                            onTouchMoveCapture: Ae
                        }),
                        a = o[0],
                        i = o[1],
                        l = e.forwardProps,
                        u = e.children,
                        c = e.className,
                        s = e.removeScrollBar,
                        d = e.enabled,
                        f = e.shards,
                        p = e.sideCar,
                        h = e.noIsolation,
                        y = e.inert,
                        b = e.allowPinchZoom,
                        g = e.as,
                        w = void 0 === g ? "div" : g,
                        x = e.gapMode,
                        E = v(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = p,
                        O = function(e, n) {
                            var r, o, a, i = (r = n || null, o = function(t) {
                                return e.forEach((function(e) {
                                    return xe(e, t)
                                }))
                            }, (a = (0, t.useState)((function() {
                                return {
                                    value: r,
                                    callback: o,
                                    facade: {
                                        get current() {
                                            return a.value
                                        },
                                        set current(e) {
                                            var t = a.value;
                                            t !== e && (a.value = e, a.callback(e, t))
                                        }
                                    }
                                }
                            }))[0]).callback = o, a.facade);
                            return Ee((function() {
                                var t = Se.get(i);
                                if (t) {
                                    var n = new Set(t),
                                        r = new Set(e),
                                        o = i.current;
                                    n.forEach((function(e) {
                                        r.has(e) || xe(e, null)
                                    })), r.forEach((function(e) {
                                        n.has(e) || xe(e, o)
                                    }))
                                }
                                Se.set(i, e)
                            }), [e]), i
                        }([r, n]),
                        C = m(m({}, E), a);
                    return t.createElement(t.Fragment, null, d && t.createElement(S, {
                        sideCar: ke,
                        removeScrollBar: s,
                        shards: f,
                        noIsolation: h,
                        inert: y,
                        setCallbacks: i,
                        allowPinchZoom: !!b,
                        lockRef: r,
                        gapMode: x
                    }), l ? t.cloneElement(t.Children.only(u), m(m({}, C), {
                        ref: O
                    })) : t.createElement(w, m({}, C, {
                        className: c,
                        ref: O
                    }), u))
                }));
            Ne.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, Ne.classNames = {
                fullWidth: we,
                zeroRight: ge
            };
            var Pe = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            var o, a;
                            0 == e && (t = function() {
                                if (!document) return null;
                                var e = document.createElement("style");
                                e.type = "text/css";
                                var t = n.nc;
                                return t && e.setAttribute("nonce", t), e
                            }()) && (a = r, (o = t).styleSheet ? o.styleSheet.cssText = a : o.appendChild(document.createTextNode(a)), function(e) {
                                (document.head || document.getElementsByTagName("head")[0]).appendChild(e)
                            }(t)), e++
                        },
                        remove: function() {
                            !--e && t && (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                Re = function() {
                    var e, n = (e = Pe(), function(n, r) {
                        t.useEffect((function() {
                            return e.add(n),
                                function() {
                                    e.remove()
                                }
                        }), [n && r])
                    });
                    return function(e) {
                        var t = e.styles,
                            r = e.dynamic;
                        return n(t, r), null
                    }
                },
                je = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                Te = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                _e = Re(),
                Ie = "data-scroll-locked",
                De = function(e, t, n, r) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(l, "px ").concat(r, ";\n  }\n  body[").concat(Ie, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(ge, " {\n    right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(we, " {\n    margin-right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(ge, " .").concat(ge, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(we, " .").concat(we, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(Ie, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                Fe = function() {
                    var e = parseInt(document.body.getAttribute(Ie) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                Me = function(e) {
                    var n = e.noRelative,
                        r = e.noImportant,
                        o = e.gapMode,
                        a = void 0 === o ? "margin" : o;
                    t.useEffect((function() {
                        return document.body.setAttribute(Ie, (Fe() + 1).toString()),
                            function() {
                                var e = Fe() - 1;
                                e <= 0 ? document.body.removeAttribute(Ie) : document.body.setAttribute(Ie, e.toString())
                            }
                    }), []);
                    var i = t.useMemo((function() {
                        return function(e) {
                            if (void 0 === e && (e = "margin"), "undefined" == typeof window) return je;
                            var t = function(e) {
                                    var t = window.getComputedStyle(document.body),
                                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                                    return [Te(n), Te(r), Te(o)]
                                }(e),
                                n = document.documentElement.clientWidth,
                                r = window.innerWidth;
                            return {
                                left: t[0],
                                top: t[1],
                                right: t[2],
                                gap: Math.max(0, r - n + t[2] - t[0])
                            }
                        }(a)
                    }), [a]);
                    return t.createElement(_e, {
                        styles: De(i, !n, a, r ? "" : "!important")
                    })
                },
                Ue = !1;
            if ("undefined" != typeof window) try {
                var Le = Object.defineProperty({}, "passive", {
                    get: function() {
                        return Ue = !0, !0
                    }
                });
                window.addEventListener("test", Le, Le), window.removeEventListener("test", Le, Le)
            } catch (e) {
                Ue = !1
            }
            var Be = !!Ue && {
                    passive: !1
                },
                We = function(e, t) {
                    if (!(e instanceof Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && !(n.overflowY === n.overflowX && ! function(e) {
                        return "TEXTAREA" === e.tagName
                    }(e) && "visible" === n[t])
                },
                ze = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), Ve(e, r)) {
                            var o = He(e, r);
                            if (o[1] > o[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                Ve = function(e, t) {
                    return "v" === e ? function(e) {
                        return We(e, "overflowY")
                    }(t) : function(e) {
                        return We(e, "overflowX")
                    }(t)
                },
                He = function(e, t) {
                    return "v" === e ? [(n = t).scrollTop, n.scrollHeight, n.clientHeight] : function(e) {
                        return [e.scrollLeft, e.scrollWidth, e.clientWidth]
                    }(t);
                    var n
                },
                Ke = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                Ge = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                qe = function(e) {
                    return e && "current" in e ? e.current : e
                },
                Xe = function(e) {
                    return "\n  .block-interactivity-".concat(e, " {pointer-events: none;}\n  .allow-interactivity-").concat(e, " {pointer-events: all;}\n")
                },
                $e = 0,
                Ye = [];

            function Ze(e) {
                for (var t = null; null !== e;) e instanceof ShadowRoot && (t = e.host, e = e.host), e = e.parentNode;
                return t
            }
            var Je, Qe = (Je = function(e) {
                    var n = t.useRef([]),
                        r = t.useRef([0, 0]),
                        o = t.useRef(),
                        a = t.useState($e++)[0],
                        i = t.useState(Re)[0],
                        l = t.useRef(e);
                    t.useEffect((function() {
                        l.current = e
                    }), [e]), t.useEffect((function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var t = function(e, t, n) {
                                if (n || 2 === arguments.length)
                                    for (var r, o = 0, a = t.length; o < a; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            }([e.lockRef.current], (e.shards || []).map(qe), !0).filter(Boolean);
                            return t.forEach((function(e) {
                                    return e.classList.add("allow-interactivity-".concat(a))
                                })),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(a)), t.forEach((function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(a))
                                    }))
                                }
                        }
                    }), [e.inert, e.lockRef.current, e.shards]);
                    var u = t.useCallback((function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !l.current.allowPinchZoom;
                            var n, a = Ke(e),
                                i = r.current,
                                u = "deltaX" in e ? e.deltaX : i[0] - a[0],
                                c = "deltaY" in e ? e.deltaY : i[1] - a[1],
                                s = e.target,
                                d = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === s.type) return !1;
                            var f = ze(d, s);
                            if (!f) return !0;
                            if (f ? n = d : (n = "v" === d ? "h" : "v", f = ze(d, s)), !f) return !1;
                            if (!o.current && "changedTouches" in e && (u || c) && (o.current = n), !n) return !0;
                            var p = o.current || n;
                            return function(e, t, n, r, o) {
                                var a = function(e, t) {
                                        return "h" === e && "rtl" === t ? -1 : 1
                                    }(e, window.getComputedStyle(t).direction),
                                    i = a * r,
                                    l = n.target,
                                    u = t.contains(l),
                                    c = !1,
                                    s = i > 0,
                                    d = 0,
                                    f = 0;
                                do {
                                    var p = He(e, l),
                                        m = p[0],
                                        v = p[1] - p[2] - a * m;
                                    (m || v) && Ve(e, l) && (d += v, f += m), l = l instanceof ShadowRoot ? l.host : l.parentNode
                                } while (!u && l !== document.body || u && (t.contains(l) || t === l));
                                return (s && (o && Math.abs(d) < 1 || !o && i > d) || !s && (o && Math.abs(f) < 1 || !o && -i > f)) && (c = !0), c
                            }(p, t, e, "h" === p ? u : c, !0)
                        }), []),
                        c = t.useCallback((function(e) {
                            var t = e;
                            if (Ye.length && Ye[Ye.length - 1] === i) {
                                var r = "deltaY" in t ? Ge(t) : Ke(t),
                                    o = n.current.filter((function(e) {
                                        return e.name === t.type && (e.target === t.target || t.target === e.shadowParent) && function(e, t) {
                                            return e[0] === t[0] && e[1] === t[1]
                                        }(e.delta, r)
                                    }))[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var a = (l.current.shards || []).map(qe).filter(Boolean).filter((function(e) {
                                        return e.contains(t.target)
                                    }));
                                    (a.length > 0 ? u(t, a[0]) : !l.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }), []),
                        s = t.useCallback((function(e, t, r, o) {
                            var a = {
                                name: e,
                                delta: t,
                                target: r,
                                should: o,
                                shadowParent: Ze(r)
                            };
                            n.current.push(a), setTimeout((function() {
                                n.current = n.current.filter((function(e) {
                                    return e !== a
                                }))
                            }), 1)
                        }), []),
                        d = t.useCallback((function(e) {
                            r.current = Ke(e), o.current = void 0
                        }), []),
                        f = t.useCallback((function(t) {
                            s(t.type, Ge(t), t.target, u(t, e.lockRef.current))
                        }), []),
                        p = t.useCallback((function(t) {
                            s(t.type, Ke(t), t.target, u(t, e.lockRef.current))
                        }), []);
                    t.useEffect((function() {
                        return Ye.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, Be), document.addEventListener("touchmove", c, Be), document.addEventListener("touchstart", d, Be),
                            function() {
                                Ye = Ye.filter((function(e) {
                                    return e !== i
                                })), document.removeEventListener("wheel", c, Be), document.removeEventListener("touchmove", c, Be), document.removeEventListener("touchstart", d, Be)
                            }
                    }), []);
                    var m = e.removeScrollBar,
                        v = e.inert;
                    return t.createElement(t.Fragment, null, v ? t.createElement(i, {
                        styles: Xe(a)
                    }) : null, m ? t.createElement(Me, {
                        gapMode: e.gapMode
                    }) : null)
                }, ke.useMedium(Je), Ce),
                et = t.forwardRef((function(e, n) {
                    return t.createElement(Ne, m({}, e, {
                        ref: n,
                        sideCar: Qe
                    }))
                }));
            et.classNames = Ne.classNames;
            var tt = et,
                nt = new WeakMap,
                rt = new WeakMap,
                ot = {},
                at = 0,
                it = function e(t) {
                    return t && (t.host || e(t.parentNode))
                },
                lt = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || function(e) {
                            return "undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body
                        }(e);
                    return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live]"))), function(e, t, n, r) {
                        var o = function(e, t) {
                            return t.map((function(t) {
                                if (e.contains(t)) return t;
                                var n = it(t);
                                return n && e.contains(n) ? n : (console.error("aria-hidden", t, "in not contained inside", e, ". Doing nothing"), null)
                            })).filter((function(e) {
                                return Boolean(e)
                            }))
                        }(t, Array.isArray(e) ? e : [e]);
                        ot[n] || (ot[n] = new WeakMap);
                        var a = ot[n],
                            i = [],
                            l = new Set,
                            u = new Set(o);
                        return o.forEach((function e(t) {
                                t && !l.has(t) && (l.add(t), e(t.parentNode))
                            })),
                            function e(t) {
                                t && !u.has(t) && Array.prototype.forEach.call(t.children, (function(t) {
                                    if (l.has(t)) e(t);
                                    else try {
                                        var o = t.getAttribute(r),
                                            u = null !== o && "false" !== o,
                                            c = (nt.get(t) || 0) + 1,
                                            s = (a.get(t) || 0) + 1;
                                        nt.set(t, c), a.set(t, s), i.push(t), 1 === c && u && rt.set(t, !0), 1 === s && t.setAttribute(n, "true"), u || t.setAttribute(r, "true")
                                    } catch (o) {
                                        console.error("aria-hidden: cannot operate on ", t, o)
                                    }
                                }))
                            }(t), l.clear(), at++,
                            function() {
                                i.forEach((function(e) {
                                    var t = nt.get(e) - 1,
                                        o = a.get(e) - 1;
                                    nt.set(e, t), a.set(e, o), t || (rt.has(e) || e.removeAttribute(r), rt.delete(e)), o || e.removeAttribute(n)
                                })), --at || (nt = new WeakMap, nt = new WeakMap, rt = new WeakMap, ot = {})
                            }
                    }(r, o, n, "aria-hidden")) : function() {
                        return null
                    }
                };

            function ut(e) {
                return function(e) {
                    if (Array.isArray(e)) return ft(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || dt(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ct(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function st(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || dt(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dt(e, t) {
                if (e) {
                    if ("string" == typeof e) return ft(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? ft(e, t) : void 0
                }
            }

            function ft(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function pt(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function mt(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? pt(Object(n), !0).forEach((function(t) {
                        vt(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : pt(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function vt(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ht(e, t) {
                var n = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === n || n;
                return function(n) {
                    if (null != e && e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function yt(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function bt() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = yt(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : yt(t[e], null)
                        }
                    }
                }
            }

            function gt() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                return t.useCallback(bt.apply(void 0, n), n)
            }

            function wt() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var e = n.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(n) {
                        var r = e.reduce((function(e, t) {
                            var r = t.useScope,
                                o = t.scopeName;
                            return mt(mt({}, e), r(n)["__scope".concat(o)])
                        }), {});
                        return t.useMemo((function() {
                            return vt({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function xt(e) {
                var n = t.useRef(e);
                return t.useEffect((function() {
                    n.current = e
                })), t.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var Et = null !== globalThis && void 0 !== globalThis && globalThis.document ? t.useLayoutEffect : function() {},
                St = function(e) {
                    var n = e.present,
                        r = e.children,
                        o = function(e) {
                            var n = st(t.useState(), 2),
                                r = n[0],
                                o = n[1],
                                a = t.useRef({}),
                                i = t.useRef(e),
                                l = t.useRef("none"),
                                u = function(e, n) {
                                    return t.useReducer((function(e, t) {
                                        var r;
                                        return null !== (r = n[e][t]) && void 0 !== r ? r : e
                                    }), e)
                                }(e ? "mounted" : "unmounted", {
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
                                }),
                                c = st(u, 2),
                                s = c[0],
                                d = c[1];
                            return t.useEffect((function() {
                                var e = Ot(a.current);
                                l.current = "mounted" === s ? e : "none"
                            }), [s]), Et((function() {
                                var t = a.current,
                                    n = i.current;
                                if (n !== e) {
                                    var r = l.current,
                                        o = Ot(t);
                                    e ? d("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), i.current = e
                                }
                            }), [e, d]), Et((function() {
                                if (r) {
                                    var e, t, n = null !== (e = r.ownerDocument.defaultView) && void 0 !== e ? e : window,
                                        o = function(e) {
                                            var o = Ot(a.current).includes(e.animationName);
                                            if (e.target === r && o && (d("ANIMATION_END"), !i.current)) {
                                                var l = r.style.animationFillMode;
                                                r.style.animationFillMode = "forwards", t = n.setTimeout((function() {
                                                    "forwards" === r.style.animationFillMode && (r.style.animationFillMode = l)
                                                }))
                                            }
                                        },
                                        u = function(e) {
                                            e.target === r && (l.current = Ot(a.current))
                                        };
                                    return r.addEventListener("animationstart", u), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o),
                                        function() {
                                            n.clearTimeout(t), r.removeEventListener("animationstart", u), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                                        }
                                }
                                d("ANIMATION_END")
                            }), [r, d]), {
                                isPresent: ["mounted", "unmountSuspended"].includes(s),
                                ref: t.useCallback((function(e) {
                                    e && (a.current = getComputedStyle(e)), o(e)
                                }), [])
                            }
                        }(n),
                        a = "function" == typeof r ? r({
                            present: o.isPresent
                        }) : t.Children.only(r),
                        i = gt(o.ref, function(e) {
                            var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                o = r && "isReactWarning" in r && r.isReactWarning;
                            return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                        }(a));
                    return "function" == typeof r || o.isPresent ? t.cloneElement(a, {
                        ref: i
                    }) : null
                };

            function Ot(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function Ct(e) {
                var n = function(e) {
                        var n = t.forwardRef((function(e, n) {
                            var r = e.children,
                                o = ct(e, ["children"]);
                            if (t.isValidElement(r)) {
                                var a = function(e) {
                                        var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = r && "isReactWarning" in r && r.isReactWarning;
                                        return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    i = function(e, t) {
                                        var n = mt({}, t),
                                            r = function(r) {
                                                var o = e[r],
                                                    a = t[r];
                                                /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                    a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (n[r] = o) : "style" === r ? n[r] = mt(mt({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) r(o);
                                        return mt(mt({}, e), n)
                                    }(o, r.props);
                                return r.type !== t.Fragment && (i.ref = n ? bt(n, a) : a), t.cloneElement(r, i)
                            }
                            return t.Children.count(r) > 1 ? t.Children.only(null) : null
                        }));
                        return n.displayName = "".concat(e, ".SlotClone"), n
                    }(e),
                    r = t.forwardRef((function(e, r) {
                        var o = e.children,
                            a = ct(e, ["children"]),
                            i = t.Children.toArray(o),
                            l = i.find(At);
                        if (l) {
                            var u = l.props.children,
                                c = i.map((function(e) {
                                    return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                }));
                            return (0, b.jsx)(n, mt(mt({}, a), {}, {
                                ref: r,
                                children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, b.jsx)(n, mt(mt({}, a), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }
            St.displayName = "Presence";
            var kt = Symbol("radix.slottable");

            function At(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === kt
            }
            var Nt = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                    var r = Ct("Primitive.".concat(n)),
                        o = t.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = ct(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, mt(mt({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), mt(mt({}, e), {}, vt({}, n, o))
                }), {}),
                Pt = "Dialog",
                Rt = function(e) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map((function(e) {
                                return t.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || n;
                                return t.useMemo((function() {
                                    return vt({}, "__scope".concat(e), mt(mt({}, r), {}, vt({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(n, o) {
                        var a = t.createContext(o),
                            i = r.length;
                        r = [].concat(ut(r), [o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = ct(n, ["scope", "children"]),
                                c = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[i]) || a,
                                s = t.useMemo((function() {
                                    return u
                                }), Object.values(u));
                            return (0, b.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null === (u = l[e]) || void 0 === u ? void 0 : u[i]) || a,
                                s = t.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, wt.apply(void 0, [o].concat(ut(n)))]
                }(Pt),
                jt = st(Rt, 2),
                Tt = jt[0],
                _t = (jt[1], st(Tt(Pt), 2)),
                It = _t[0],
                Dt = _t[1],
                Ft = function(e) {
                    var n = e.__scopeDialog,
                        r = e.children,
                        o = e.open,
                        a = e.defaultOpen,
                        i = e.onOpenChange,
                        l = e.modal,
                        u = void 0 === l || l,
                        c = t.useRef(null),
                        s = t.useRef(null),
                        d = function(e) {
                            var n = e.prop,
                                r = e.defaultProp,
                                o = e.onChange,
                                a = void 0 === o ? function() {} : o,
                                i = function(e) {
                                    var n = e.defaultProp,
                                        r = e.onChange,
                                        o = t.useState(n),
                                        a = st(o, 1)[0],
                                        i = t.useRef(a),
                                        l = xt(r);
                                    return t.useEffect((function() {
                                        i.current !== a && (l(a), i.current = a)
                                    }), [a, i, l]), o
                                }({
                                    defaultProp: r,
                                    onChange: a
                                }),
                                l = st(i, 2),
                                u = l[0],
                                c = l[1],
                                s = void 0 !== n,
                                d = s ? n : u,
                                f = xt(a);
                            return [d, t.useCallback((function(e) {
                                if (s) {
                                    var t = "function" == typeof e ? e(n) : e;
                                    t !== n && f(t)
                                } else c(e)
                            }), [s, n, c, f])]
                        }({
                            prop: o,
                            defaultProp: a,
                            onChange: i
                        }),
                        f = st(d, 2),
                        p = f[0],
                        m = void 0 !== p && p,
                        v = f[1];
                    return (0, b.jsx)(It, {
                        scope: n,
                        triggerRef: c,
                        contentRef: s,
                        contentId: O(),
                        titleId: O(),
                        descriptionId: O(),
                        open: m,
                        onOpenChange: v,
                        onOpenToggle: t.useCallback((function() {
                            return v((function(e) {
                                return !e
                            }))
                        }), [v]),
                        modal: u,
                        children: r
                    })
                };
            Ft.displayName = Pt;
            var Mt = "DialogTrigger",
                Ut = t.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = ct(e, ["__scopeDialog"]),
                        o = Dt(Mt, n),
                        a = gt(t, o.triggerRef);
                    return (0, b.jsx)(Nt.button, mt(mt({
                        type: "button",
                        "aria-haspopup": "dialog",
                        "aria-expanded": o.open,
                        "aria-controls": o.contentId,
                        "data-state": an(o.open)
                    }, r), {}, {
                        ref: a,
                        onClick: ht(e.onClick, o.onOpenToggle)
                    }))
                }));
            Ut.displayName = Mt;
            var Lt = "DialogPortal",
                Bt = st(Tt(Lt, {
                    forceMount: void 0
                }), 2),
                Wt = Bt[0],
                zt = Bt[1],
                Vt = function(e) {
                    var n = e.__scopeDialog,
                        r = e.forceMount,
                        o = e.children,
                        a = e.container,
                        i = Dt(Lt, n);
                    return (0, b.jsx)(Wt, {
                        scope: n,
                        forceMount: r,
                        children: t.Children.map(o, (function(e) {
                            return (0, b.jsx)(St, {
                                present: r || i.open,
                                children: (0, b.jsx)(ve, {
                                    asChild: !0,
                                    container: a,
                                    children: e
                                })
                            })
                        }))
                    })
                };
            Vt.displayName = Lt;
            var Ht = "DialogOverlay",
                Kt = t.forwardRef((function(e, t) {
                    var n = zt(Ht, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        a = ct(e, ["forceMount"]),
                        i = Dt(Ht, e.__scopeDialog);
                    return i.modal ? (0, b.jsx)(St, {
                        present: o || i.open,
                        children: (0, b.jsx)(qt, mt(mt({}, a), {}, {
                            ref: t
                        }))
                    }) : null
                }));
            Kt.displayName = Ht;
            var Gt = Ct("DialogOverlay.RemoveScroll"),
                qt = t.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = ct(e, ["__scopeDialog"]),
                        o = Dt(Ht, n);
                    return (0, b.jsx)(tt, {
                        as: Gt,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, b.jsx)(Nt.div, mt(mt({
                            "data-state": an(o.open)
                        }, r), {}, {
                            ref: t,
                            style: mt({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                })),
                Xt = "DialogContent",
                $t = t.forwardRef((function(e, t) {
                    var n = zt(Xt, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        a = ct(e, ["forceMount"]),
                        i = Dt(Xt, e.__scopeDialog);
                    return (0, b.jsx)(St, {
                        present: o || i.open,
                        children: i.modal ? (0, b.jsx)(Yt, mt(mt({}, a), {}, {
                            ref: t
                        })) : (0, b.jsx)(Zt, mt(mt({}, a), {}, {
                            ref: t
                        }))
                    })
                }));
            $t.displayName = Xt;
            var Yt = t.forwardRef((function(e, n) {
                    var r = Dt(Xt, e.__scopeDialog),
                        o = t.useRef(null),
                        a = gt(n, r.contentRef, o);
                    return t.useEffect((function() {
                        var e = o.current;
                        if (e) return lt(e)
                    }), []), (0, b.jsx)(Jt, mt(mt({}, e), {}, {
                        ref: a,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: ht(e.onCloseAutoFocus, (function(e) {
                            var t;
                            e.preventDefault(), null === (t = r.triggerRef.current) || void 0 === t || t.focus()
                        })),
                        onPointerDownOutside: ht(e.onPointerDownOutside, (function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        })),
                        onFocusOutside: ht(e.onFocusOutside, (function(e) {
                            return e.preventDefault()
                        }))
                    }))
                })),
                Zt = t.forwardRef((function(e, n) {
                    var r = Dt(Xt, e.__scopeDialog),
                        o = t.useRef(!1),
                        a = t.useRef(!1);
                    return (0, b.jsx)(Jt, mt(mt({}, e), {}, {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var n, i;
                            null !== (n = e.onCloseAutoFocus) && void 0 !== n && n.call(e, t), t.defaultPrevented || (o.current || null !== (i = r.triggerRef.current) && void 0 !== i && i.focus(), t.preventDefault()), o.current = !1, a.current = !1
                        },
                        onInteractOutside: function(t) {
                            var n, i;
                            null !== (n = e.onInteractOutside) && void 0 !== n && n.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (a.current = !0));
                            var l = t.target;
                            (null === (i = r.triggerRef.current) || void 0 === i ? void 0 : i.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && a.current && t.preventDefault()
                        }
                    }))
                })),
                Jt = t.forwardRef((function(e, n) {
                    var r = e.__scopeDialog,
                        o = e.trapFocus,
                        a = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        l = ct(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        u = Dt(Xt, r),
                        c = t.useRef(null),
                        s = gt(n, c);
                    return ye(), (0, b.jsxs)(b.Fragment, {
                        children: [(0, b.jsx)(re, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: i,
                            children: (0, b.jsx)(K, mt(mt({
                                role: "dialog",
                                id: u.contentId,
                                "aria-describedby": u.descriptionId,
                                "aria-labelledby": u.titleId,
                                "data-state": an(u.open)
                            }, l), {}, {
                                ref: s,
                                onDismiss: function() {
                                    return u.onOpenChange(!1)
                                }
                            }))
                        }), (0, b.jsxs)(b.Fragment, {
                            children: [(0, b.jsx)(dn, {
                                titleId: u.titleId
                            }), (0, b.jsx)(fn, {
                                contentRef: c,
                                descriptionId: u.descriptionId
                            })]
                        })]
                    })
                })),
                Qt = "DialogTitle",
                en = t.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = ct(e, ["__scopeDialog"]),
                        o = Dt(Qt, n);
                    return (0, b.jsx)(Nt.h2, mt(mt({
                        id: o.titleId
                    }, r), {}, {
                        ref: t
                    }))
                }));
            en.displayName = Qt;
            var tn = "DialogDescription",
                nn = t.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = ct(e, ["__scopeDialog"]),
                        o = Dt(tn, n);
                    return (0, b.jsx)(Nt.p, mt(mt({
                        id: o.descriptionId
                    }, r), {}, {
                        ref: t
                    }))
                }));
            nn.displayName = tn;
            var rn = "DialogClose",
                on = t.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = ct(e, ["__scopeDialog"]),
                        o = Dt(rn, n);
                    return (0, b.jsx)(Nt.button, mt(mt({
                        type: "button"
                    }, r), {}, {
                        ref: t,
                        onClick: ht(e.onClick, (function() {
                            return o.onOpenChange(!1)
                        }))
                    }))
                }));

            function an(e) {
                return e ? "open" : "closed"
            }
            on.displayName = rn;
            var ln = "DialogTitleWarning",
                un = function(e, n) {
                    var r = t.createContext(n),
                        o = function(e) {
                            var n = e.children,
                                o = ct(e, ["children"]),
                                a = t.useMemo((function() {
                                    return o
                                }), Object.values(o));
                            return (0, b.jsx)(r.Provider, {
                                value: a,
                                children: n
                            })
                        };
                    return o.displayName = e + "Provider", [o, function(o) {
                        var a = t.useContext(r);
                        if (a) return a;
                        if (void 0 !== n) return n;
                        throw new Error("`".concat(o, "` must be used within `").concat(e, "`"))
                    }]
                }(ln, {
                    contentName: Xt,
                    titleName: Qt,
                    docsSlug: "dialog"
                }),
                cn = st(un, 2),
                sn = (cn[0], cn[1]),
                dn = function(e) {
                    var n = e.titleId,
                        r = sn(ln),
                        o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return t.useEffect((function() {
                        n && (document.getElementById(n) || console.error(o))
                    }), [o, n]), null
                },
                fn = function(e) {
                    var n = e.contentRef,
                        r = e.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(sn("DialogDescriptionWarning").contentName, "}.");
                    return t.useEffect((function() {
                        var e, t = null === (e = n.current) || void 0 === e ? void 0 : e.getAttribute("aria-describedby");
                        r && t && (document.getElementById(r) || console.warn(o))
                    }), [o, n, r]), null
                },
                pn = Ft,
                mn = Vt,
                vn = Kt,
                hn = $t,
                yn = en,
                bn = nn,
                gn = on;

            function wn(e, t) {
                void 0 === t && (t = {});
                var n = t.insertAt;
                if (e && "undefined" != typeof document) {
                    var r = document.head || document.getElementsByTagName("head")[0],
                        o = document.createElement("style");
                    o.type = "text/css", "top" === n && r.firstChild ? r.insertBefore(o, r.firstChild) : r.appendChild(o), o.styleSheet ? o.styleSheet.cssText = e : o.appendChild(document.createTextNode(e))
                }
            }
            wn(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}.light-theme,.system-theme,:root{--alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-system-progress:#335fff}.dark-theme{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}@media (prefers-color-scheme:dark){:is(:root,.system-theme){--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}:is(:root,.light-theme,.system-theme) .stroke-contrast-alpha{border-color:rgba(27,37,75,.5)}.dark-theme .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}@media (prefers-color-scheme:dark){:is(:root,.system-theme) .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}}");
            var xn = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                En = function() {
                    return r().createElement("div", {
                        role: "presentation",
                        className: "absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none"
                    })
                },
                Sn = "opacity-[0.5]",
                On = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                Cn = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-500"
                },
                kn = {
                    Large: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Medium: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Small: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    XSmall: {
                        circular: "radius-circle",
                        square: "radius-small"
                    }
                },
                An = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                Nn = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                Pn = {
                    Emphasis: "content-action-emphasis",
                    Standard: "content-action-standard",
                    Alert: "content-action-alert",
                    Utility: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                Rn = {
                    Emphasis: "content-action-standard",
                    Standard: "content-action-standard",
                    Alert: "content-action-standard",
                    Utility: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                jn = (0, t.forwardRef)((function(e, t) {
                    var n = e.className,
                        o = e.icon,
                        a = e.ariaLabel,
                        i = e.isDisabled,
                        l = void 0 !== i && i,
                        u = e.isCircular,
                        c = void 0 !== u && u,
                        s = e.size,
                        d = void 0 === s ? "Large" : s,
                        f = e.variant,
                        p = void 0 === f ? "Emphasis" : f,
                        h = v(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "size", "variant"]),
                        b = y("foundation-web-icon-button", l ? Sn : [xn, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", On[d], kn[d][c ? "circular" : "square"], l ? Nn[p] : An[p], n),
                        g = r().createElement(r().Fragment, null, r().createElement(En, null), r().createElement("span", {
                            className: y("icon", o, Cn[d], l ? Rn[p] : Pn[p])
                        }));
                    if ("a" === h.as) {
                        h.as;
                        var w = h.href,
                            x = v(h, ["as", "href"]);
                        return r().createElement("a", m({
                            ref: t
                        }, x, {
                            "aria-label": a,
                            "aria-disabled": l,
                            href: l ? void 0 : w,
                            className: b
                        }), g)
                    }
                    h.as;
                    var E = v(h, ["as"]);
                    return r().createElement("button", m({
                        ref: t,
                        type: "button"
                    }, E, {
                        "aria-label": a,
                        disabled: l,
                        className: b
                    }), g)
                })),
                Tn = (0, t.forwardRef)((function(e, t) {
                    var n, o = e.className,
                        a = e.style,
                        i = e.orientation,
                        l = void 0 === i ? "horizontal" : i,
                        u = e.variant,
                        c = void 0 === u ? "Standard" : u,
                        s = v(e, ["className", "style", "orientation", "variant"]),
                        d = "vertical" === l;
                    n = d ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === c ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    };
                    var f = {};
                    return d || "Inset" !== c ? d || "InsetLeft" !== c ? d || "InsetRight" !== c || (f = {
                        marginRight: "var(--padding-xlarge)"
                    }) : f = {
                        marginLeft: "var(--padding-xlarge)"
                    } : f = {
                        marginLeft: "var(--padding-xlarge)",
                        marginRight: "var(--padding-xlarge)"
                    }, r().createElement("div", m({
                        ref: t
                    }, s, {
                        role: "separator",
                        "data-orientation": l,
                        "aria-orientation": l,
                        style: m(m(m({
                            borderRightWidth: 0,
                            borderBottomWidth: 0,
                            boxSizing: "border-box",
                            borderStyle: "solid"
                        }, n), f), a),
                        className: y("stroke-default self-stretch", o)
                    }))
                }));
            Tn.displayName = "Divider", wn("@keyframes fui-base-sheet-overlay-fade-in{0%{background-color:transparent}to{background-color:var(--color-common-backdrop)}}@keyframes fui-base-sheet-overlay-fade-out{0%{background-color:var(--color-common-backdrop)}to{background-color:transparent}}@keyframes fui-base-sheet-slide-in-from-right{0%{transform:translateX(110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-right{0%{transform:translateX(0)}to{transform:translateX(110%)}}@keyframes fui-base-sheet-slide-in-from-left{0%{transform:translateX(-110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-left{0%{transform:translateX(0)}to{transform:translateX(-110%)}}@keyframes fui-base-sheet-fade-in{0%{opacity:0}to{opacity:1}}@keyframes fui-base-sheet-fade-out{0%{opacity:1}to{opacity:0}}@keyframes fui-base-sheet-slide-in-from-bottom{0%{transform:translateY(110%)}to{transform:translateY(0)}}@keyframes fui-base-sheet-slide-out-to-bottom{0%{transform:translateY(0)}to{transform:translateY(110%)}}.fui-base-sheet-overlay{background-color:var(--color-common-backdrop)}.fui-base-sheet-overlay[data-state=open]{animation:fui-base-sheet-overlay-fade-in var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-state=closed]{animation:fui-base-sheet-overlay-fade-out var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-type=bottomSheet]{align-items:flex-end;justify-content:center}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:env(safe-area-inset-left);margin-right:env(safe-area-inset-right);max-height:90vh;max-width:440px;padding-bottom:env(safe-area-inset-bottom);width:100%}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=open]{animation-duration:var(--time-300);animation-timing-function:var(--ease-standard-out)}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=closed]{animation-duration:var(--time-100);animation-timing-function:var(--ease-standard-in)}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-bottom}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-bottom}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right]{align-items:stretch;justify-content:flex-end}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left]{align-items:stretch;justify-content:flex-start}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true] .fui-base-sheet-content{max-height:100vh;padding-bottom:env(safe-area-inset-bottom);padding-top:env(safe-area-inset-top);width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=right] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-right:env(safe-area-inset-right)}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=left] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-left:env(safe-area-inset-left)}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-left}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-left}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false] .fui-base-sheet-content{border-radius:var(--radius-large);margin:var(--padding-medium);margin-bottom:max(env(safe-area-inset-bottom),var(--padding-medium));margin-top:max(env(safe-area-inset-top),var(--padding-medium));max-height:100vh;max-width:360px;width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=right] .fui-base-sheet-content{margin-right:max(env(safe-area-inset-right),var(--padding-medium))}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=left] .fui-base-sheet-content{margin-left:max(env(safe-area-inset-left),var(--padding-medium))}.fui-base-sheet-overlay[data-type=centerSheet]{align-items:center;justify-content:center;padding:var(--padding-medium)}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content{border-radius:var(--radius-large);max-height:90vh}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Medium] .fui-base-sheet-content{max-width:480px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Large] .fui-base-sheet-content{max-width:640px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-fade-in}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-fade-out}");
            var _n = function(e) {
                    var t = e.type,
                        n = e.sideSheetSide,
                        o = void 0 === n ? "right" : n,
                        a = e.isSideSheetFlush,
                        i = void 0 !== a && a,
                        l = e.centerSheetSize,
                        u = void 0 === l ? "Medium" : l,
                        c = e.children,
                        s = e.overlayClassName,
                        d = e.contentClassName,
                        f = e.onOpenAutoFocus,
                        p = e.onCloseAutoFocus;
                    return r().createElement(mn, null, r().createElement(vn, {
                        "data-testid": "fui-base-sheet-overlay",
                        "data-type": t,
                        "data-side": "sideSheet" === t ? o : void 0,
                        "data-flush": "sideSheet" === t ? i : void 0,
                        "data-size": "centerSheet" === t ? u : void 0,
                        className: y("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", s)
                    }, r().createElement(hn, {
                        "data-testid": "fui-base-sheet-content",
                        className: y("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                        onOpenAutoFocus: f,
                        onCloseAutoFocus: p
                    }, c)))
                },
                In = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var n = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== n.length) {
                            var r = [];
                            n.forEach((function(e) {
                                var t = e.getAttribute("data-autofocus-priority"),
                                    n = parseInt(t || "", 10);
                                !Number.isNaN(n) && e instanceof HTMLElement && r.push({
                                    element: e,
                                    priority: n
                                })
                            })), r.sort((function(e, t) {
                                return e.priority - t.priority
                            }));
                            var o, a = r.find((function(e) {
                                return function(e) {
                                    return "function" != typeof e.checkVisibility || e.checkVisibility()
                                }(t = e.element) && ! function(e) {
                                    return !(!("disabled" in e) || !e.disabled) || "true" === e.getAttribute("aria-disabled")
                                }(t);
                                var t
                            }));
                            if (a) {
                                e.preventDefault();
                                var i = document.activeElement === a.element;
                                a.element.focus(), i || (o = a.element) instanceof HTMLInputElement && "function" == typeof o.select && o.select()
                            }
                        }
                    }
                };

            function Dn(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Fn(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Fn(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Fn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Mn(e) {
                return Mn = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, Mn(e)
            }
            var Un = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof window ? window : void 0 !== n.g ? n.g : "undefined" != typeof self ? self : {},
                Ln = "object" == Mn(Un) && Un && Un.Object === Object && Un,
                Bn = "object" == ("undefined" == typeof self ? "undefined" : Mn(self)) && self && self.Object === Object && self;
            Ln || Bn || Function("return this")();
            var Wn = "undefined" != typeof window ? t.useLayoutEffect : t.useEffect,
                zn = "undefined" == typeof window;

            function Vn(e) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.defaultValue,
                    o = void 0 !== r && r,
                    a = n.initializeWithValue,
                    i = void 0 === a || a,
                    l = function(e) {
                        return zn ? o : window.matchMedia(e).matches
                    },
                    u = Dn((0, t.useState)((function() {
                        return i ? l(e) : o
                    })), 2),
                    c = u[0],
                    s = u[1];

                function d() {
                    s(l(e))
                }
                return Wn((function() {
                    var t = window.matchMedia(e);
                    return d(), t.addListener ? t.addListener(d) : t.addEventListener("change", d),
                        function() {
                            t.removeListener ? t.removeListener(d) : t.removeEventListener("change", d)
                        }
                }), [e]), c
            }
            var Hn = (0, t.createContext)(null),
                Kn = function() {
                    var e = (0, t.useContext)(Hn);
                    if (!e) throw new Error("Sheet components must be used within a Sheet");
                    return e
                },
                Gn = "padding-x-xlarge",
                qn = function(e) {
                    var t = e.open,
                        n = e.onOpenChange,
                        o = e.defaultOpen,
                        a = e.children;
                    return r().createElement(pn, {
                        open: t,
                        onOpenChange: n,
                        defaultOpen: o,
                        modal: !0
                    }, a)
                },
                Xn = function(e) {
                    var n, o = e.children,
                        a = e.centerSheetSize,
                        i = void 0 === a ? "Medium" : a,
                        l = e.largeScreenVariant,
                        u = void 0 === l ? "center" : l,
                        c = e.closeLabel,
                        s = e.className,
                        d = e.mobilePortraitClassName,
                        f = e.mobileLandscapeClassName,
                        p = e.largeScreenClassName,
                        m = e.onOpenAutoFocus,
                        v = e.onCloseAutoFocus,
                        h = Vn("(orientation: portrait) and (max-width: 600px)"),
                        b = Vn("(orientation: landscape) and (max-height: 600px)"),
                        g = (0, t.useMemo)((function() {
                            return {
                                centerSheetSize: i,
                                largeScreenVariant: u,
                                closeLabel: c,
                                isPortraitMobile: h,
                                isLandscapeMobile: b,
                                type: n
                            }
                        }), [i, u, c, h, b, n = h ? "bottomSheet" : b || "side" === u ? "sideSheet" : "centerSheet"]),
                        w = y(s, h && d, b && f, !h && !b && p);
                    return r().createElement(Hn.Provider, {
                        value: g
                    }, r().createElement(_n, {
                        type: n,
                        sideSheetSide: "right",
                        isSideSheetFlush: b,
                        centerSheetSize: i,
                        contentClassName: w,
                        onOpenAutoFocus: null != m ? m : In,
                        onCloseAutoFocus: v
                    }, o))
                },
                $n = (0, t.forwardRef)((function(e, t) {
                    var n = e.children,
                        o = e.className,
                        a = v(e, ["children", "className"]),
                        i = Kn().type;
                    return r().createElement("div", m({
                        ref: t,
                        className: y("scroll-y", Gn, "sideSheet" === i ? "grow-1" : "", o)
                    }, a), n)
                }));
            $n.displayName = "SheetBody";
            var Yn = function(e) {
                    var t = e.className,
                        n = e.children,
                        o = e.navigation,
                        a = e.utilities,
                        i = Kn().closeLabel;
                    return r().createElement("div", {
                        className: y(t, o ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, r().createElement("div", {
                        className: y("flex items-center", o && "gap-xsmall")
                    }, o, r().createElement(yn, {
                        className: "text-heading-small margin-none"
                    }, n)), r().createElement("div", {
                        className: y("flex items-center", a && "gap-xxsmall")
                    }, a, r().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, r().createElement(gn, {
                        asChild: !0
                    }, r().createElement(jn, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: i || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                Zn = function(e) {
                    var t = e.children,
                        n = e.className,
                        o = v(e, ["children", "className"]);
                    return r().createElement(r().Fragment, null, r().createElement(Tn, null), r().createElement("div", m({
                        className: y(Gn, "margin-y-small shrink-0", n)
                    }, o), t))
                },
                Jn = function(e) {
                    return r().createElement(bn, m({
                        asChild: !0
                    }, e))
                },
                Qn = Roblox;

            function er(e) {
                return function(e) {
                    if (Array.isArray(e)) return or(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || rr(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tr(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function nr(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || rr(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rr(e, t) {
                if (e) {
                    if ("string" == typeof e) return or(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? or(e, t) : void 0
                }
            }

            function or(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ar(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function ir(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? ar(Object(n), !0).forEach((function(t) {
                        lr(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : ar(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function lr(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ur(e, t) {
                var n = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === n || n;
                return function(n) {
                    if (null != e && e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function cr(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function sr() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = cr(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : cr(t[e], null)
                        }
                    }
                }
            }

            function dr() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var e = n.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(n) {
                        var r = e.reduce((function(e, t) {
                            var r = t.useScope,
                                o = t.scopeName;
                            return ir(ir({}, e), r(n)["__scope".concat(o)])
                        }), {});
                        return t.useMemo((function() {
                            return lr({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function fr(e) {
                var n = t.useRef(e);
                return t.useEffect((function() {
                    n.current = e
                })), t.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var pr = null !== globalThis && void 0 !== globalThis && globalThis.document ? t.useLayoutEffect : function() {};
            var mr = Symbol("radix.slottable");

            function vr(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === mr
            }
            var hr = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                    var r = function(e) {
                            var n = function(e) {
                                    var n = t.forwardRef((function(e, n) {
                                        var r = e.children,
                                            o = tr(e, ["children"]);
                                        if (t.isValidElement(r)) {
                                            var a = function(e) {
                                                    var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                i = function(e, t) {
                                                    var n = ir({}, t),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                a = t[r];
                                                            /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                                a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (n[r] = o) : "style" === r ? n[r] = ir(ir({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) r(o);
                                                    return ir(ir({}, e), n)
                                                }(o, r.props);
                                            return r.type !== t.Fragment && (i.ref = n ? sr(n, a) : a), t.cloneElement(r, i)
                                        }
                                        return t.Children.count(r) > 1 ? t.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(e, ".SlotClone"), n
                                }(e),
                                r = t.forwardRef((function(e, r) {
                                    var o = e.children,
                                        a = tr(e, ["children"]),
                                        i = t.Children.toArray(o),
                                        l = i.find(vr);
                                    if (l) {
                                        var u = l.props.children,
                                            c = i.map((function(e) {
                                                return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                            }));
                                        return (0, b.jsx)(n, ir(ir({}, a), {}, {
                                            ref: r,
                                            children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                                        }))
                                    }
                                    return (0, b.jsx)(n, ir(ir({}, a), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(n)),
                        o = t.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = tr(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, ir(ir({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), ir(ir({}, e), {}, lr({}, n, o))
                }), {}),
                yr = "Switch",
                br = function(e) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map((function(e) {
                                return t.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || n;
                                return t.useMemo((function() {
                                    return lr({}, "__scope".concat(e), ir(ir({}, r), {}, lr({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(n, o) {
                        var a = t.createContext(o),
                            i = r.length;
                        r = [].concat(er(r), [o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = tr(n, ["scope", "children"]),
                                c = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[i]) || a,
                                s = t.useMemo((function() {
                                    return u
                                }), Object.values(u));
                            return (0, b.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null === (u = l[e]) || void 0 === u ? void 0 : u[i]) || a,
                                s = t.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, dr.apply(void 0, [o].concat(er(n)))]
                }(yr),
                gr = nr(br, 2),
                wr = gr[0],
                xr = (gr[1], nr(wr(yr), 2)),
                Er = xr[0],
                Sr = xr[1],
                Or = t.forwardRef((function(e, n) {
                    var r = e.__scopeSwitch,
                        o = e.name,
                        a = e.checked,
                        i = e.defaultChecked,
                        l = e.required,
                        u = e.disabled,
                        c = e.value,
                        s = void 0 === c ? "on" : c,
                        d = e.onCheckedChange,
                        f = e.form,
                        p = tr(e, ["__scopeSwitch", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]),
                        m = nr(t.useState(null), 2),
                        v = m[0],
                        h = m[1],
                        y = function() {
                            for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            return t.useCallback(sr.apply(void 0, n), n)
                        }(n, (function(e) {
                            return h(e)
                        })),
                        g = t.useRef(!1),
                        w = !v || f || !!v.closest("form"),
                        x = function(e) {
                            var n = e.prop,
                                r = e.defaultProp,
                                o = e.onChange,
                                a = void 0 === o ? function() {} : o,
                                i = function(e) {
                                    var n = e.defaultProp,
                                        r = e.onChange,
                                        o = t.useState(n),
                                        a = nr(o, 1)[0],
                                        i = t.useRef(a),
                                        l = fr(r);
                                    return t.useEffect((function() {
                                        i.current !== a && (l(a), i.current = a)
                                    }), [a, i, l]), o
                                }({
                                    defaultProp: r,
                                    onChange: a
                                }),
                                l = nr(i, 2),
                                u = l[0],
                                c = l[1],
                                s = void 0 !== n,
                                d = s ? n : u,
                                f = fr(a);
                            return [d, t.useCallback((function(e) {
                                if (s) {
                                    var t = "function" == typeof e ? e(n) : e;
                                    t !== n && f(t)
                                } else c(e)
                            }), [s, n, c, f])]
                        }({
                            prop: a,
                            defaultProp: i,
                            onChange: d
                        }),
                        E = nr(x, 2),
                        S = E[0],
                        O = void 0 !== S && S,
                        C = E[1];
                    return (0, b.jsxs)(Er, {
                        scope: r,
                        checked: O,
                        disabled: u,
                        children: [(0, b.jsx)(hr.button, ir(ir({
                            type: "button",
                            role: "switch",
                            "aria-checked": O,
                            "aria-required": l,
                            "data-state": Nr(O),
                            "data-disabled": u ? "" : void 0,
                            disabled: u,
                            value: s
                        }, p), {}, {
                            ref: y,
                            onClick: ur(e.onClick, (function(e) {
                                C((function(e) {
                                    return !e
                                })), w && (g.current = e.isPropagationStopped(), g.current || e.stopPropagation())
                            }))
                        })), w && (0, b.jsx)(Ar, {
                            control: v,
                            bubbles: !g.current,
                            name: o,
                            value: s,
                            checked: O,
                            required: l,
                            disabled: u,
                            form: f,
                            style: {
                                transform: "translateX(-100%)"
                            }
                        })]
                    })
                }));
            Or.displayName = yr;
            var Cr = "SwitchThumb",
                kr = t.forwardRef((function(e, t) {
                    var n = e.__scopeSwitch,
                        r = tr(e, ["__scopeSwitch"]),
                        o = Sr(Cr, n);
                    return (0, b.jsx)(hr.span, ir(ir({
                        "data-state": Nr(o.checked),
                        "data-disabled": o.disabled ? "" : void 0
                    }, r), {}, {
                        ref: t
                    }))
                }));
            kr.displayName = Cr;
            var Ar = function(e) {
                var n = e.control,
                    r = e.checked,
                    o = e.bubbles,
                    a = void 0 === o || o,
                    i = tr(e, ["control", "checked", "bubbles"]),
                    l = t.useRef(null),
                    u = function(e) {
                        var n = t.useRef({
                            value: e,
                            previous: e
                        });
                        return t.useMemo((function() {
                            return n.current.value !== e && (n.current.previous = n.current.value, n.current.value = e), n.current.previous
                        }), [e])
                    }(r),
                    c = function(e) {
                        var n = nr(t.useState(void 0), 2),
                            r = n[0],
                            o = n[1];
                        return pr((function() {
                            if (e) {
                                o({
                                    width: e.offsetWidth,
                                    height: e.offsetHeight
                                });
                                var t = new ResizeObserver((function(t) {
                                    if (Array.isArray(t) && t.length) {
                                        var n, r, a = t[0];
                                        if ("borderBoxSize" in a) {
                                            var i = a.borderBoxSize,
                                                l = Array.isArray(i) ? i[0] : i;
                                            n = l.inlineSize, r = l.blockSize
                                        } else n = e.offsetWidth, r = e.offsetHeight;
                                        o({
                                            width: n,
                                            height: r
                                        })
                                    }
                                }));
                                return t.observe(e, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return t.unobserve(e)
                                    }
                            }
                            o(void 0)
                        }), [e]), r
                    }(n);
                return t.useEffect((function() {
                    var e = l.current,
                        t = window.HTMLInputElement.prototype,
                        n = Object.getOwnPropertyDescriptor(t, "checked").set;
                    if (u !== r && n) {
                        var o = new Event("click", {
                            bubbles: a
                        });
                        n.call(e, r), e.dispatchEvent(o)
                    }
                }), [u, r, a]), (0, b.jsx)("input", ir(ir({
                    type: "checkbox",
                    "aria-hidden": !0,
                    defaultChecked: r
                }, i), {}, {
                    tabIndex: -1,
                    ref: l,
                    style: ir(ir(ir({}, e.style), c), {}, {
                        position: "absolute",
                        pointerEvents: "none",
                        opacity: 0,
                        margin: 0
                    })
                }))
            };

            function Nr(e) {
                return e ? "checked" : "unchecked"
            }
            var Pr = Or,
                Rr = kr,
                jr = {
                    XSmall: {
                        togglePadding: null,
                        toggleWidth: "width-700",
                        toggleHeight: "height-400",
                        thumbSize: "size-200",
                        textSize: "text-title-small",
                        textPadding: null,
                        hintSize: "text-body-small"
                    },
                    Small: {
                        togglePadding: null,
                        toggleWidth: "width-800",
                        toggleHeight: "height-500",
                        thumbSize: "size-300",
                        textSize: "text-title-small",
                        textPadding: "padding-top-xxsmall",
                        hintSize: "text-body-small"
                    },
                    Medium: {
                        togglePadding: null,
                        toggleWidth: "width-1000",
                        toggleHeight: "height-600",
                        thumbSize: "size-400",
                        textSize: "text-title-medium",
                        textPadding: "padding-top-xxsmall",
                        hintSize: "text-body-medium"
                    },
                    Large: {
                        togglePadding: "padding-y-xxsmall",
                        toggleWidth: "width-1100",
                        toggleHeight: "height-600",
                        thumbSize: "size-400",
                        textSize: "text-title-large",
                        textPadding: "padding-top-xxsmall",
                        hintSize: "text-body-large"
                    }
                },
                Tr = r().forwardRef((function(e, t) {
                    var n, o = e.label,
                        a = e.className,
                        i = e.isChecked,
                        l = e.isDisabled,
                        u = e.size,
                        c = e.hint,
                        s = e.placement,
                        d = e.onCheckedChange,
                        f = v(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange"]),
                        p = jr[u],
                        h = p.togglePadding,
                        b = p.toggleWidth,
                        g = p.toggleHeight,
                        w = p.thumbSize,
                        x = p.textSize,
                        E = p.textPadding,
                        S = p.hintSize;
                    return r().createElement("label", {
                        className: y("foundation-web-toggle flex gap-medium items-start", (n = {}, n[Sn] = l, n["flex-row"] = "Start" === s, n["flex-row-reverse"] = "End" === s, n), a)
                    }, r().createElement("div", {
                        className: y("flex", h)
                    }, r().createElement(Pr, m({
                        ref: t,
                        className: y(xn, "flex items-center padding-x-xsmall padding-y-none stroke-none radius-circle", b, g, i ? "bg-system-emphasis" : "bg-action-standard"),
                        disabled: l,
                        checked: i,
                        onCheckedChange: d
                    }, f), r().createElement(En, null), r().createElement("span", {
                        className: y("motion-safe:transition-[flex-grow] ease-standard-out duration-100", i ? "fill" : "size-0")
                    }), r().createElement(Rr, {
                        className: y("transition-colors radius-circle", w, i ? "bg-[var(--dark-mode-action-standard-foreground)]" : "bg-[var(--color-action-standard-foreground)]")
                    }), r().createElement("span", {
                        className: y("motion-safe:transition-[flex-grow] ease-standard-out duration-100", i ? "size-0" : "fill")
                    }))), o && r().createElement("div", {
                        className: "flex flex-col fill"
                    }, r().createElement("span", {
                        className: y("content-emphasis", E, x)
                    }, o), c && r().createElement("span", {
                        className: y("content-default", S)
                    }, c)))
                }));
            Tr.displayName = "Toggle", wn("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var _r = function(e) {
                    var t = e.width,
                        n = e.height;
                    return r().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, r().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                Ir = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                Dr = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-large"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                Fr = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"],
                    Alert: ["bg-action-alert", "content-action-alert"]
                },
                Mr = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"],
                    Alert: ["bg-action-standard", "content-action-standard"]
                },
                Ur = (0, t.forwardRef)((function(e, t) {
                    var n = e.children,
                        o = e.className,
                        a = e.style,
                        i = e.isDisabled,
                        l = void 0 !== i && i,
                        u = e.isLoading,
                        c = void 0 !== u && u,
                        s = e.size,
                        d = void 0 === s ? "Large" : s,
                        f = e.variant,
                        p = void 0 === f ? "Emphasis" : f,
                        h = v(e, ["children", "className", "style", "isDisabled", "isLoading", "size", "variant"]),
                        b = y("foundation-web-button", l ? Sn : [xn, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", Dr[d], l ? Mr[p] : Fr[p], o),
                        g = r().createElement(r().Fragment, null, r().createElement(En, null), c && r().createElement("div", {
                            "aria-hidden": "true",
                            className: "absolute flex"
                        }, r().createElement(_r, {
                            width: Ir[d],
                            height: Ir[d]
                        })), r().createElement("span", {
                            className: y("padding-y-xsmall text-truncate-end text-no-wrap", c && "invisible")
                        }, n)),
                        w = m({
                            textDecoration: "none"
                        }, a);
                    if ("a" === h.as) {
                        h.as;
                        var x = h.href,
                            E = v(h, ["as", "href"]);
                        return r().createElement("a", m({
                            ref: t
                        }, E, {
                            "aria-disabled": l,
                            href: l ? void 0 : x,
                            className: b,
                            style: w
                        }), g)
                    }
                    h.as;
                    var S = v(h, ["as"]);
                    return r().createElement("button", m({
                        ref: t,
                        type: "button"
                    }, S, {
                        disabled: l,
                        className: b,
                        style: w
                    }), g)
                })),
                Lr = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                Br = r().forwardRef((function(e, t) {
                    var n = e.name,
                        o = e.size,
                        a = void 0 === o ? "Medium" : o,
                        i = e.className;
                    e.children;
                    var l = v(e, ["name", "size", "className", "children"]);
                    return r().createElement("span", m({
                        ref: t,
                        role: "presentation",
                        className: y("grow-0 shrink-0 basis-auto icon", n, Lr[a], i)
                    }, l))
                }));
            Br.displayName = "Icon";
            var Wr = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600"
                },
                zr = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250"
                },
                Vr = {
                    XSmall: "size-1200",
                    Small: "size-1400",
                    Medium: "size-1600"
                },
                Hr = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                Kr = {
                    XSmall: void 0,
                    Small: "padding-top-xxsmall",
                    Medium: "padding-y-xxsmall"
                },
                Gr = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium"
                },
                qr = {
                    XSmall: "padding-medium",
                    Small: "padding-large",
                    Medium: "padding-xlarge"
                },
                Xr = {
                    XSmall: "Small",
                    Small: "Medium",
                    Medium: "Large"
                },
                $r = (0, t.forwardRef)((function(e, n) {
                    var o = e.layout,
                        a = e.size,
                        i = e.type,
                        l = e.isDisabled,
                        u = e.label,
                        c = e.description,
                        s = e.media,
                        d = e.icon,
                        f = e.metadata,
                        p = e.isSelected,
                        m = e.onSelect,
                        v = (0, t.useMemo)((function() {
                            return u && r().createElement("div", {
                                className: y(Hr[a], Kr[a], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
                            }, u)
                        }), [u, a]),
                        h = (0, t.useMemo)((function() {
                            return f && r().createElement("div", {
                                className: y("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
                            }, f)
                        }), [f]),
                        b = (0, t.useMemo)((function() {
                            return c && r().createElement("div", {
                                className: y(Gr[a], "content-default text-align-x-start")
                            }, c)
                        }), [c, a]),
                        g = (0, t.useMemo)((function() {
                            return d && r().createElement(Br, {
                                name: d,
                                size: Xr[a]
                            })
                        }), [d, a]),
                        w = (0, t.useMemo)((function() {
                            switch (i) {
                                case "Checkmark":
                                    return p && r().createElement(Br, {
                                        name: "icon-filled-check",
                                        size: Xr[a]
                                    });
                                case "Checkbox":
                                    return r().createElement("div", {
                                        className: y(Wr[a], "flex items-center justify-center radius-small padding-none content-default", p ? "stroke-none" : "stroke-standard stroke-emphasis", p ? "bg-system-contrast" : "bg-none")
                                    }, p && r().createElement("div", {
                                        className: y(Wr[a], "content-inverse-emphasis icon icon-filled-check")
                                    }));
                                case "Radio":
                                    return r().createElement("div", {
                                        className: y(Wr[a], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", p ? "bg-system-contrast" : "bg-none")
                                    }, p && r().createElement("div", {
                                        className: y("radius-circle bg-inverse-action-sub-emphasis", zr[a])
                                    }));
                                default:
                                    var e = i;
                                    return console.error("Invalid OptionSelector type ".concat(e)), null
                            }
                        }), [i, a, p]),
                        x = (0, t.useMemo)((function() {
                            return s && r().createElement("div", {
                                className: y(Vr[a], "flex items-center justify-center clip shrink-0")
                            }, s)
                        }), [s, a]),
                        E = (0, t.useMemo)((function() {
                            switch (o) {
                                case "Horizontal":
                                    return r().createElement("div", {
                                        className: "flex gap-large"
                                    }, x, r().createElement("div", {
                                        className: "flex flex-col gap-xsmall fill clip"
                                    }, r().createElement("div", {
                                        className: "flex gap-small items-start"
                                    }, r().createElement("div", {
                                        className: "flex flex-col items-start fill clip"
                                    }, r().createElement("div", {
                                        className: "flex gap-small items-center width-full"
                                    }, g, v), h), r().createElement("div", {
                                        className: Wr[a]
                                    }, w)), b));
                                case "Vertical":
                                    return r().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, r().createElement("div", {
                                        className: "flex gap-small"
                                    }, r().createElement("div", {
                                        className: "flex flex-col gap-medium fill min-width-0"
                                    }, x, r().createElement("div", {
                                        className: "flex flex-col gap-xsmall"
                                    }, g, v, h)), r().createElement("div", {
                                        className: Wr[a]
                                    }, w)), b);
                                default:
                                    var e = o;
                                    return console.error("Invalid OptionSelector layout ".concat(e)), null
                            }
                        }), [o, x, g, v, b, w, a, h]);
                    return r().createElement("button", {
                        type: "button",
                        className: y(xn, "bg-none width-full radius-medium stroke-standard", p ? "stroke-system-contrast" : "stroke-contrast-alpha", qr[a], l && Sn, !l && "cursor-pointer"),
                        disabled: l,
                        ref: n,
                        onClick: function() {
                            return m()
                        }
                    }, !l && r().createElement(En, null), E)
                }));
            $r.displayName = "OptionSelector";
            var Yr = 0,
                Zr = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                Jr = {
                    XSmall: "padding-y-small",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-small"
                },
                Qr = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                eo = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                to = r().forwardRef((function(e, n) {
                    var o, a = e.size,
                        i = e.label,
                        l = e.value,
                        u = e.defaultValue,
                        c = e.isDisabled,
                        s = e.hasError,
                        d = e.className,
                        f = e.style,
                        p = e.textareaClassName,
                        h = e.textareaStyle,
                        b = v(e, ["size", "label", "value", "defaultValue", "isDisabled", "hasError", "className", "style", "textareaClassName", "textareaStyle"]),
                        g = function(e) {
                            void 0 === e && (e = ":r");
                            var n = (0, t.useRef)();
                            return n.current || (Yr += 1, n.current = "".concat(e).concat(Yr)), n.current
                        }(),
                        w = null != a ? a : "Large";
                    return r().createElement("div", {
                        className: y("flex fill flex-col width-full gap-small", (o = {}, o[Sn] = c, o), d),
                        style: f
                    }, i && r().createElement("label", {
                        htmlFor: g,
                        className: y(Qr[w], "content-emphasis")
                    }, i), r().createElement("textarea", m({
                        ref: n,
                        id: g,
                        style: h,
                        className: y("foundation-web-text-area", "bg-none radius-medium stroke-standard content-emphasis placeholder:content-muted", {
                            "stroke-system-alert": s,
                            "stroke-contrast-alpha": !s
                        }, eo[w], Zr[w], Jr[w], p),
                        value: l,
                        defaultValue: null == l ? u : void 0,
                        disabled: c
                    }, b)))
                }));

            function no(e) {
                return no = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, no(e)
            }

            function ro(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function oo(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || io(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ao(e) {
                return function(e) {
                    if (Array.isArray(e)) return lo(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || io(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function io(e, t) {
                if (e) {
                    if ("string" == typeof e) return lo(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? lo(e, t) : void 0
                }
            }

            function lo(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function uo(e, t, n, r, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function co(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var a = e.apply(t, n);

                        function i(e) {
                            uo(a, r, o, i, l, "next", e)
                        }

                        function l(e) {
                            uo(a, r, o, i, l, "throw", e)
                        }
                        i(void 0)
                    }))
                }
            }

            function so(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function fo(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? so(Object(n), !0).forEach((function(t) {
                        po(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : so(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function po(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            to.displayName = "TextArea";
            var mo = ["top", "right", "bottom", "left"],
                vo = Math.min,
                ho = Math.max,
                yo = Math.round,
                bo = Math.floor,
                go = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                wo = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                xo = {
                    start: "end",
                    end: "start"
                };

            function Eo(e, t, n) {
                return ho(e, vo(t, n))
            }

            function So(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function Oo(e) {
                return e.split("-")[0]
            }

            function Co(e) {
                return e.split("-")[1]
            }

            function ko(e) {
                return "x" === e ? "y" : "x"
            }

            function Ao(e) {
                return "y" === e ? "height" : "width"
            }
            var No = new Set(["top", "bottom"]);

            function Po(e) {
                return No.has(Oo(e)) ? "y" : "x"
            }

            function Ro(e) {
                return ko(Po(e))
            }

            function jo(e) {
                return e.replace(/start|end/g, (function(e) {
                    return xo[e]
                }))
            }
            var To = ["left", "right"],
                _o = ["right", "left"],
                Io = ["top", "bottom"],
                Do = ["bottom", "top"];

            function Fo(e, t, n, r) {
                var o = Co(e),
                    a = function(e, t, n) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                return n ? t ? _o : To : t ? To : _o;
                            case "left":
                            case "right":
                                return t ? Io : Do;
                            default:
                                return []
                        }
                    }(Oo(e), "start" === n, r);
                return o && (a = a.map((function(e) {
                    return e + "-" + o
                })), t && (a = a.concat(a.map(jo)))), a
            }

            function Mo(e) {
                return e.replace(/left|right|bottom|top/g, (function(e) {
                    return wo[e]
                }))
            }

            function Uo(e) {
                return "number" != typeof e ? function(e) {
                    return fo({
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    }, e)
                }(e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function Lo(e) {
                var t = e.x,
                    n = e.y,
                    r = e.width,
                    o = e.height;
                return {
                    width: r,
                    height: o,
                    top: n,
                    left: t,
                    right: t + r,
                    bottom: n + o,
                    x: t,
                    y: n
                }
            }

            function Bo(e, t, n) {
                var r, o = e.reference,
                    a = e.floating,
                    i = Po(t),
                    l = Ro(t),
                    u = Ao(l),
                    c = Oo(t),
                    s = "y" === i,
                    d = o.x + o.width / 2 - a.width / 2,
                    f = o.y + o.height / 2 - a.height / 2,
                    p = o[u] / 2 - a[u] / 2;
                switch (c) {
                    case "top":
                        r = {
                            x: d,
                            y: o.y - a.height
                        };
                        break;
                    case "bottom":
                        r = {
                            x: d,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        r = {
                            x: o.x + o.width,
                            y: f
                        };
                        break;
                    case "left":
                        r = {
                            x: o.x - a.width,
                            y: f
                        };
                        break;
                    default:
                        r = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (Co(t)) {
                    case "start":
                        r[l] -= p * (n && s ? -1 : 1);
                        break;
                    case "end":
                        r[l] += p * (n && s ? -1 : 1)
                }
                return r
            }

            function Wo(e, t) {
                return zo.apply(this, arguments)
            }

            function zo() {
                return zo = co(regeneratorRuntime.mark((function e(t, n) {
                    var r, o, a, i, l, u, c, s, d, f, p, m, v, h, y, b, g, w, x, E, S, O, C, k;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return void 0 === n && (n = {}), o = t.x, a = t.y, i = t.platform, l = t.rects, u = t.elements, c = t.strategy, s = So(n, t), d = s.boundary, f = void 0 === d ? "clippingAncestors" : d, p = s.rootBoundary, m = void 0 === p ? "viewport" : p, v = s.elementContext, h = void 0 === v ? "floating" : v, y = s.altBoundary, b = void 0 !== y && y, g = s.padding, w = Uo(void 0 === g ? 0 : g), x = u[b ? "floating" === h ? "reference" : "floating" : h], e.t0 = Lo, e.t1 = i, e.next = 24, null == i.isElement ? void 0 : i.isElement(x);
                            case 24:
                                if (e.t3 = r = e.sent, e.t2 = null == e.t3, e.t2) {
                                    e.next = 28;
                                    break
                                }
                                e.t2 = r;
                            case 28:
                                if (!e.t2) {
                                    e.next = 32;
                                    break
                                }
                                e.t4 = x, e.next = 38;
                                break;
                            case 32:
                                if (e.t5 = x.contextElement, e.t5) {
                                    e.next = 37;
                                    break
                                }
                                return e.next = 36, null == i.getDocumentElement ? void 0 : i.getDocumentElement(u.floating);
                            case 36:
                                e.t5 = e.sent;
                            case 37:
                                e.t4 = e.t5;
                            case 38:
                                return e.t6 = e.t4, e.t7 = f, e.t8 = m, e.t9 = c, e.t10 = {
                                    element: e.t6,
                                    boundary: e.t7,
                                    rootBoundary: e.t8,
                                    strategy: e.t9
                                }, e.next = 45, e.t1.getClippingRect.call(e.t1, e.t10);
                            case 45:
                                return e.t11 = e.sent, E = (0, e.t0)(e.t11), S = "floating" === h ? {
                                    x: o,
                                    y: a,
                                    width: l.floating.width,
                                    height: l.floating.height
                                } : l.reference, e.next = 50, null == i.getOffsetParent ? void 0 : i.getOffsetParent(u.floating);
                            case 50:
                                return O = e.sent, e.next = 53, null == i.isElement ? void 0 : i.isElement(O);
                            case 53:
                                if (e.t13 = e.sent, !e.t13) {
                                    e.next = 58;
                                    break
                                }
                                return e.next = 57, null == i.getScale ? void 0 : i.getScale(O);
                            case 57:
                                e.t13 = e.sent;
                            case 58:
                                if (e.t12 = e.t13, e.t12) {
                                    e.next = 61;
                                    break
                                }
                                e.t12 = {
                                    x: 1,
                                    y: 1
                                };
                            case 61:
                                if (C = e.t12, e.t14 = Lo, !i.convertOffsetParentRelativeRectToViewportRelativeRect) {
                                    e.next = 69;
                                    break
                                }
                                return e.next = 66, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: u,
                                    rect: S,
                                    offsetParent: O,
                                    strategy: c
                                });
                            case 66:
                                e.t15 = e.sent, e.next = 70;
                                break;
                            case 69:
                                e.t15 = S;
                            case 70:
                                return e.t16 = e.t15, k = (0, e.t14)(e.t16), e.abrupt("return", {
                                    top: (E.top - k.top + w.top) / C.y,
                                    bottom: (k.bottom - E.bottom + w.bottom) / C.y,
                                    left: (E.left - k.left + w.left) / C.x,
                                    right: (k.right - E.right + w.right) / C.x
                                });
                            case 73:
                            case "end":
                                return e.stop()
                        }
                    }), e)
                }))), zo.apply(this, arguments)
            }

            function Vo(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function Ho(e) {
                return mo.some((function(t) {
                    return e[t] >= 0
                }))
            }
            var Ko = new Set(["left", "top"]);

            function Go() {
                return "undefined" != typeof window
            }

            function qo(e) {
                return Yo(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function Xo(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function $o(e) {
                var t;
                return null == (t = (Yo(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function Yo(e) {
                return !!Go() && (e instanceof Node || e instanceof Xo(e).Node)
            }

            function Zo(e) {
                return !!Go() && (e instanceof Element || e instanceof Xo(e).Element)
            }

            function Jo(e) {
                return !!Go() && (e instanceof HTMLElement || e instanceof Xo(e).HTMLElement)
            }

            function Qo(e) {
                return !(!Go() || "undefined" == typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof Xo(e).ShadowRoot)
            }
            var ea = new Set(["inline", "contents"]);

            function ta(e) {
                var t = pa(e),
                    n = t.overflow,
                    r = t.overflowX,
                    o = t.overflowY,
                    a = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(n + o + r) && !ea.has(a)
            }
            var na = new Set(["table", "td", "th"]);

            function ra(e) {
                return na.has(qo(e))
            }
            var oa = [":popover-open", ":modal"];

            function aa(e) {
                return oa.some((function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                }))
            }
            var ia = ["transform", "translate", "scale", "rotate", "perspective"],
                la = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                ua = ["paint", "layout", "strict", "content"];

            function ca(e) {
                var t = sa(),
                    n = Zo(e) ? pa(e) : e;
                return ia.some((function(e) {
                    return !!n[e] && "none" !== n[e]
                })) || !!n.containerType && "normal" !== n.containerType || !t && !!n.backdropFilter && "none" !== n.backdropFilter || !t && !!n.filter && "none" !== n.filter || la.some((function(e) {
                    return (n.willChange || "").includes(e)
                })) || ua.some((function(e) {
                    return (n.contain || "").includes(e)
                }))
            }

            function sa() {
                return !("undefined" == typeof CSS || !CSS.supports) && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var da = new Set(["html", "body", "#document"]);

            function fa(e) {
                return da.has(qo(e))
            }

            function pa(e) {
                return Xo(e).getComputedStyle(e)
            }

            function ma(e) {
                return Zo(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function va(e) {
                if ("html" === qo(e)) return e;
                var t = e.assignedSlot || e.parentNode || Qo(e) && e.host || $o(e);
                return Qo(t) ? t.host : t
            }

            function ha(e) {
                var t = va(e);
                return fa(t) ? e.ownerDocument ? e.ownerDocument.body : e.body : Jo(t) && ta(t) ? t : ha(t)
            }

            function ya(e, t, n) {
                var r;
                void 0 === t && (t = []), void 0 === n && (n = !0);
                var o = ha(e),
                    a = o === (null == (r = e.ownerDocument) ? void 0 : r.body),
                    i = Xo(o);
                if (a) {
                    var l = ba(i);
                    return t.concat(i, i.visualViewport || [], ta(o) ? o : [], l && n ? ya(l) : [])
                }
                return t.concat(o, ya(o, [], n))
            }

            function ba(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function ga(e) {
                var t = pa(e),
                    n = parseFloat(t.width) || 0,
                    r = parseFloat(t.height) || 0,
                    o = Jo(e),
                    a = o ? e.offsetWidth : n,
                    i = o ? e.offsetHeight : r,
                    l = yo(n) !== a || yo(r) !== i;
                return l && (n = a, r = i), {
                    width: n,
                    height: r,
                    $: l
                }
            }

            function wa(e) {
                return Zo(e) ? e : e.contextElement
            }

            function xa(e) {
                var t = wa(e);
                if (!Jo(t)) return go(1);
                var n = t.getBoundingClientRect(),
                    r = ga(t),
                    o = r.width,
                    a = r.height,
                    i = r.$,
                    l = (i ? yo(n.width) : n.width) / o,
                    u = (i ? yo(n.height) : n.height) / a;
                return l && Number.isFinite(l) || (l = 1), u && Number.isFinite(u) || (u = 1), {
                    x: l,
                    y: u
                }
            }
            var Ea = go(0);

            function Sa(e) {
                var t = Xo(e);
                return sa() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : Ea
            }

            function Oa(e, t, n, r) {
                void 0 === t && (t = !1), void 0 === n && (n = !1);
                var o = e.getBoundingClientRect(),
                    a = wa(e),
                    i = go(1);
                t && (r ? Zo(r) && (i = xa(r)) : i = xa(e));
                var l = function(e, t, n) {
                        return void 0 === t && (t = !1), !(!n || t && n !== Xo(e)) && t
                    }(a, n, r) ? Sa(a) : go(0),
                    u = (o.left + l.x) / i.x,
                    c = (o.top + l.y) / i.y,
                    s = o.width / i.x,
                    d = o.height / i.y;
                if (a)
                    for (var f = Xo(a), p = r && Zo(r) ? Xo(r) : r, m = f, v = ba(m); v && r && p !== m;) {
                        var h = xa(v),
                            y = v.getBoundingClientRect(),
                            b = pa(v),
                            g = y.left + (v.clientLeft + parseFloat(b.paddingLeft)) * h.x,
                            w = y.top + (v.clientTop + parseFloat(b.paddingTop)) * h.y;
                        u *= h.x, c *= h.y, s *= h.x, d *= h.y, u += g, c += w, v = ba(m = Xo(v))
                    }
                return Lo({
                    width: s,
                    height: d,
                    x: u,
                    y: c
                })
            }

            function Ca(e, t) {
                var n = ma(e).scrollLeft;
                return t ? t.left + n : Oa($o(e)).left + n
            }

            function ka(e, t, n) {
                void 0 === n && (n = !1);
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - (n ? 0 : Ca(e, r)),
                    y: r.top + t.scrollTop
                }
            }
            var Aa = new Set(["absolute", "fixed"]);

            function Na(e, t, n) {
                var r;
                if ("viewport" === t) r = function(e, t) {
                    var n = Xo(e),
                        r = $o(e),
                        o = n.visualViewport,
                        a = r.clientWidth,
                        i = r.clientHeight,
                        l = 0,
                        u = 0;
                    if (o) {
                        a = o.width, i = o.height;
                        var c = sa();
                        (!c || c && "fixed" === t) && (l = o.offsetLeft, u = o.offsetTop)
                    }
                    return {
                        width: a,
                        height: i,
                        x: l,
                        y: u
                    }
                }(e, n);
                else if ("document" === t) r = function(e) {
                    var t = $o(e),
                        n = ma(e),
                        r = e.ownerDocument.body,
                        o = ho(t.scrollWidth, t.clientWidth, r.scrollWidth, r.clientWidth),
                        a = ho(t.scrollHeight, t.clientHeight, r.scrollHeight, r.clientHeight),
                        i = -n.scrollLeft + Ca(e),
                        l = -n.scrollTop;
                    return "rtl" === pa(r).direction && (i += ho(t.clientWidth, r.clientWidth) - o), {
                        width: o,
                        height: a,
                        x: i,
                        y: l
                    }
                }($o(e));
                else if (Zo(t)) r = function(e, t) {
                    var n = Oa(e, !0, "fixed" === t),
                        r = n.top + e.clientTop,
                        o = n.left + e.clientLeft,
                        a = Jo(e) ? xa(e) : go(1);
                    return {
                        width: e.clientWidth * a.x,
                        height: e.clientHeight * a.y,
                        x: o * a.x,
                        y: r * a.y
                    }
                }(t, n);
                else {
                    var o = Sa(e);
                    r = {
                        x: t.x - o.x,
                        y: t.y - o.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return Lo(r)
            }

            function Pa(e, t) {
                var n = va(e);
                return !(n === t || !Zo(n) || fa(n)) && ("fixed" === pa(n).position || Pa(n, t))
            }

            function Ra(e, t, n) {
                var r = Jo(t),
                    o = $o(t),
                    a = "fixed" === n,
                    i = Oa(e, !0, a, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = go(0);

                function c() {
                    u.x = Ca(o)
                }
                if (r || !r && !a)
                    if (("body" !== qo(t) || ta(o)) && (l = ma(t)), r) {
                        var s = Oa(t, !0, a, t);
                        u.x = s.x + t.clientLeft, u.y = s.y + t.clientTop
                    } else o && c();
                a && !r && o && c();
                var d = !o || r || a ? go(0) : ka(o, l);
                return {
                    x: i.left + l.scrollLeft - u.x - d.x,
                    y: i.top + l.scrollTop - u.y - d.y,
                    width: i.width,
                    height: i.height
                }
            }

            function ja(e) {
                return "static" === pa(e).position
            }

            function Ta(e, t) {
                if (!Jo(e) || "fixed" === pa(e).position) return null;
                if (t) return t(e);
                var n = e.offsetParent;
                return $o(e) === n && (n = n.ownerDocument.body), n
            }

            function _a(e, t) {
                var n = Xo(e);
                if (aa(e)) return n;
                if (!Jo(e)) {
                    for (var r = va(e); r && !fa(r);) {
                        if (Zo(r) && !ja(r)) return r;
                        r = va(r)
                    }
                    return n
                }
                for (var o = Ta(e, t); o && ra(o) && ja(o);) o = Ta(o, t);
                return o && fa(o) && ja(o) && !ca(o) ? n : o || function(e) {
                    for (var t = va(e); Jo(t) && !fa(t);) {
                        if (ca(t)) return t;
                        if (aa(t)) return null;
                        t = va(t)
                    }
                    return null
                }(e) || n
            }
            var Ia, Da = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        n = e.rect,
                        r = e.offsetParent,
                        o = "fixed" === e.strategy,
                        a = $o(r),
                        i = !!t && aa(t.floating);
                    if (r === a || i && o) return n;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = go(1),
                        c = go(0),
                        s = Jo(r);
                    if ((s || !s && !o) && (("body" !== qo(r) || ta(a)) && (l = ma(r)), Jo(r))) {
                        var d = Oa(r);
                        u = xa(r), c.x = d.x + r.clientLeft, c.y = d.y + r.clientTop
                    }
                    var f = !a || s || o ? go(0) : ka(a, l, !0);
                    return {
                        width: n.width * u.x,
                        height: n.height * u.y,
                        x: n.x * u.x - l.scrollLeft * u.x + c.x + f.x,
                        y: n.y * u.y - l.scrollTop * u.y + c.y + f.y
                    }
                },
                getDocumentElement: $o,
                getClippingRect: function(e) {
                    var t = e.element,
                        n = e.boundary,
                        r = e.rootBoundary,
                        o = e.strategy,
                        a = [].concat(ao("clippingAncestors" === n ? aa(t) ? [] : function(e, t) {
                            var n = t.get(e);
                            if (n) return n;
                            for (var r = ya(e, [], !1).filter((function(e) {
                                    return Zo(e) && "body" !== qo(e)
                                })), o = null, a = "fixed" === pa(e).position, i = a ? va(e) : e; Zo(i) && !fa(i);) {
                                var l = pa(i),
                                    u = ca(i);
                                u || "fixed" !== l.position || (o = null), (a ? !u && !o : !u && "static" === l.position && o && Aa.has(o.position) || ta(i) && !u && Pa(e, i)) ? r = r.filter((function(e) {
                                    return e !== i
                                })) : o = l, i = va(i)
                            }
                            return t.set(e, r), r
                        }(t, this._c) : [].concat(n)), [r]),
                        i = a[0],
                        l = a.reduce((function(e, n) {
                            var r = Na(t, n, o);
                            return e.top = ho(r.top, e.top), e.right = vo(r.right, e.right), e.bottom = vo(r.bottom, e.bottom), e.left = ho(r.left, e.left), e
                        }), Na(t, i, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: _a,
                getElementRects: (Ia = co(regeneratorRuntime.mark((function e(t) {
                    var n, r, o;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return n = this.getOffsetParent || _a, r = this.getDimensions, e.next = 4, r(t.floating);
                            case 4:
                                return o = e.sent, e.t0 = Ra, e.t1 = t.reference, e.next = 9, n(t.floating);
                            case 9:
                                return e.t2 = e.sent, e.t3 = t.strategy, e.t4 = (0, e.t0)(e.t1, e.t2, e.t3), e.t5 = {
                                    x: 0,
                                    y: 0,
                                    width: o.width,
                                    height: o.height
                                }, e.abrupt("return", {
                                    reference: e.t4,
                                    floating: e.t5
                                });
                            case 14:
                            case "end":
                                return e.stop()
                        }
                    }), e, this)
                }))), function(e) {
                    return Ia.apply(this, arguments)
                }),
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = ga(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: xa,
                isElement: Zo,
                isRTL: function(e) {
                    return "rtl" === pa(e).direction
                }
            };

            function Fa(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function Ma(e, t, n, r) {
                void 0 === r && (r = {});
                var o = r,
                    a = o.ancestorScroll,
                    i = void 0 === a || a,
                    l = o.ancestorResize,
                    u = void 0 === l || l,
                    c = o.elementResize,
                    s = void 0 === c ? "function" == typeof ResizeObserver : c,
                    d = o.layoutShift,
                    f = void 0 === d ? "function" == typeof IntersectionObserver : d,
                    p = o.animationFrame,
                    m = void 0 !== p && p,
                    v = wa(e),
                    h = i || u ? [].concat(ao(v ? ya(v) : []), ao(ya(t))) : [];
                h.forEach((function(e) {
                    i && e.addEventListener("scroll", n, {
                        passive: !0
                    }), u && e.addEventListener("resize", n)
                }));
                var y, b = v && f ? function(e, t) {
                        var n, r = null,
                            o = $o(e);

                        function a() {
                            var e;
                            clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                        }
                        return function i(l, u) {
                            void 0 === l && (l = !1), void 0 === u && (u = 1), a();
                            var c = e.getBoundingClientRect(),
                                s = c.left,
                                d = c.top,
                                f = c.width,
                                p = c.height;
                            if (l || t(), f && p) {
                                var m = {
                                        rootMargin: -bo(d) + "px " + -bo(o.clientWidth - (s + f)) + "px " + -bo(o.clientHeight - (d + p)) + "px " + -bo(s) + "px",
                                        threshold: ho(0, vo(1, u)) || 1
                                    },
                                    v = !0;
                                try {
                                    r = new IntersectionObserver(h, fo(fo({}, m), {}, {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    r = new IntersectionObserver(h, m)
                                }
                                r.observe(e)
                            }

                            function h(t) {
                                var r = t[0].intersectionRatio;
                                if (r !== u) {
                                    if (!v) return i();
                                    r ? i(!1, r) : n = setTimeout((function() {
                                        i(!1, 1e-7)
                                    }), 1e3)
                                }
                                1 !== r || Fa(c, e.getBoundingClientRect()) || i(), v = !1
                            }
                        }(!0), a
                    }(v, n) : null,
                    g = -1,
                    w = null;
                s && (w = new ResizeObserver((function(e) {
                    var r = oo(e, 1)[0];
                    r && r.target === v && w && (w.unobserve(t), cancelAnimationFrame(g), g = requestAnimationFrame((function() {
                        var e;
                        null == (e = w) || e.observe(t)
                    }))), n()
                })), v && !m && w.observe(v), w.observe(t));
                var x = m ? Oa(e) : null;
                return m && function t() {
                        var r = Oa(e);
                        x && !Fa(x, r) && n(), x = r, y = requestAnimationFrame(t)
                    }(), n(),
                    function() {
                        var e;
                        h.forEach((function(e) {
                            i && e.removeEventListener("scroll", n), u && e.removeEventListener("resize", n)
                        })), null == b || b(), null == (e = w) || e.disconnect(), w = null, m && cancelAnimationFrame(y)
                    }
            }
            var Ua = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return co(regeneratorRuntime.mark((function n() {
                                var r, o, a, i, l, u, c, s, d, f, p, m, v, h, y, b, g, w, x, E, S, O, C, k, A, N, P, R, j, T, _, I, D, F, M, U;
                                return regeneratorRuntime.wrap((function(n) {
                                    for (;;) switch (n.prev = n.next) {
                                        case 0:
                                            if (a = t.x, i = t.y, l = t.placement, u = t.rects, c = t.platform, s = t.elements, d = t.middlewareData, f = So(e, t) || {}, p = f.element, m = f.padding, v = void 0 === m ? 0 : m, null != p) {
                                                n.next = 3;
                                                break
                                            }
                                            return n.abrupt("return", {});
                                        case 3:
                                            return h = Uo(v), y = {
                                                x: a,
                                                y: i
                                            }, b = Ro(l), g = Ao(b), n.next = 9, c.getDimensions(p);
                                        case 9:
                                            return w = n.sent, E = (x = "y" === b) ? "top" : "left", S = x ? "bottom" : "right", O = x ? "clientHeight" : "clientWidth", C = u.reference[g] + u.reference[b] - y[b] - u.floating[g], k = y[b] - u.reference[b], n.next = 18, null == c.getOffsetParent ? void 0 : c.getOffsetParent(p);
                                        case 18:
                                            if (A = n.sent, N = A ? A[O] : 0, n.t0 = N, !n.t0) {
                                                n.next = 25;
                                                break
                                            }
                                            return n.next = 24, null == c.isElement ? void 0 : c.isElement(A);
                                        case 24:
                                            n.t0 = n.sent;
                                        case 25:
                                            if (n.t1 = n.t0, n.t1) {
                                                n.next = 28;
                                                break
                                            }
                                            N = s.floating[O] || u.floating[g];
                                        case 28:
                                            return P = C / 2 - k / 2, R = N / 2 - w[g] / 2 - 1, j = vo(h[E], R), T = vo(h[S], R), _ = j, I = N - w[g] - T, D = N / 2 - w[g] / 2 + P, F = Eo(_, D, I), M = !d.arrow && null != Co(l) && D !== F && u.reference[g] / 2 - (D < _ ? j : T) - w[g] / 2 < 0, U = M ? D < _ ? D - _ : D - I : 0, n.abrupt("return", (po(o = {}, b, y[b] + U), po(o, "data", fo((po(r = {}, b, F), po(r, "centerOffset", D - F - U), r), M && {
                                                alignmentOffset: U
                                            })), po(o, "reset", M), o));
                                        case 30:
                                        case "end":
                                            return n.stop()
                                    }
                                }), n)
                            })))()
                        }
                    }
                },
                La = "undefined" != typeof document ? t.useLayoutEffect : function() {};

            function Ba(e, t) {
                if (e === t) return !0;
                if (no(e) != no(t)) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                var n, r, o;
                if (e && t && "object" == no(e)) {
                    if (Array.isArray(e)) {
                        if ((n = e.length) !== t.length) return !1;
                        for (r = n; 0 != r--;)
                            if (!Ba(e[r], t[r])) return !1;
                        return !0
                    }
                    if ((n = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (r = n; 0 != r--;)
                        if (!{}.hasOwnProperty.call(t, o[r])) return !1;
                    for (r = n; 0 != r--;) {
                        var a = o[r];
                        if (!("_owner" === a && e.$$typeof || Ba(e[a], t[a]))) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function Wa(e) {
                return "undefined" == typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function za(e, t) {
                var n = Wa(e);
                return Math.round(t * n) / n
            }

            function Va(e) {
                var n = t.useRef(e);
                return La((function() {
                    n.current = e
                })), n
            }

            function Ha(e) {
                void 0 === e && (e = {});
                var n = e,
                    r = n.placement,
                    a = void 0 === r ? "bottom" : r,
                    i = n.strategy,
                    l = void 0 === i ? "absolute" : i,
                    u = n.middleware,
                    c = void 0 === u ? [] : u,
                    s = n.platform,
                    d = n.elements,
                    f = (d = void 0 === d ? {} : d).reference,
                    p = d.floating,
                    m = n.transform,
                    v = void 0 === m || m,
                    h = n.whileElementsMounted,
                    y = n.open,
                    b = oo(t.useState({
                        x: 0,
                        y: 0,
                        strategy: l,
                        placement: a,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    g = b[0],
                    w = b[1],
                    x = oo(t.useState(c), 2),
                    E = x[0],
                    S = x[1];
                Ba(E, c) || S(c);
                var O = oo(t.useState(null), 2),
                    C = O[0],
                    k = O[1],
                    A = oo(t.useState(null), 2),
                    N = A[0],
                    P = A[1],
                    R = t.useCallback((function(e) {
                        e !== I.current && (I.current = e, k(e))
                    }), []),
                    j = t.useCallback((function(e) {
                        e !== D.current && (D.current = e, P(e))
                    }), []),
                    T = f || C,
                    _ = p || N,
                    I = t.useRef(null),
                    D = t.useRef(null),
                    F = t.useRef(g),
                    M = null != h,
                    U = Va(h),
                    L = Va(s),
                    B = Va(y),
                    W = t.useCallback((function() {
                        if (I.current && D.current) {
                            var e = {
                                placement: a,
                                strategy: l,
                                middleware: E
                            };
                            L.current && (e.platform = L.current),
                                function(e, t, n) {
                                    var r = new Map,
                                        o = fo({
                                            platform: Da
                                        }, n),
                                        a = fo(fo({}, o.platform), {}, {
                                            _c: r
                                        });
                                    return function() {
                                        var e = co(regeneratorRuntime.mark((function e(t, n, r) {
                                            var o, a, i, l, u, c, s, d, f, p, m, v, h, y, b, g, w, x, E, S, O, C, k, A, N, P;
                                            return regeneratorRuntime.wrap((function(e) {
                                                for (;;) switch (e.prev = e.next) {
                                                    case 0:
                                                        return o = r.placement, a = void 0 === o ? "bottom" : o, i = r.strategy, l = void 0 === i ? "absolute" : i, u = r.middleware, c = void 0 === u ? [] : u, s = r.platform, d = c.filter(Boolean), e.next = 10, null == s.isRTL ? void 0 : s.isRTL(n);
                                                    case 10:
                                                        return f = e.sent, e.next = 13, s.getElementRects({
                                                            reference: t,
                                                            floating: n,
                                                            strategy: l
                                                        });
                                                    case 13:
                                                        p = e.sent, m = Bo(p, a, f), v = m.x, h = m.y, y = a, b = {}, g = 0, w = 0;
                                                    case 21:
                                                        if (!(w < d.length)) {
                                                            e.next = 56;
                                                            break
                                                        }
                                                        return E = d[w], S = E.name, O = E.fn, e.next = 27, O({
                                                            x: v,
                                                            y: h,
                                                            initialPlacement: a,
                                                            placement: y,
                                                            strategy: l,
                                                            middlewareData: b,
                                                            rects: p,
                                                            platform: s,
                                                            elements: {
                                                                reference: t,
                                                                floating: n
                                                            }
                                                        });
                                                    case 27:
                                                        if (C = e.sent, k = C.x, A = C.y, N = C.data, P = C.reset, v = null != k ? k : v, h = null != A ? A : h, b = fo(fo({}, b), {}, po({}, S, fo(fo({}, b[S]), N))), e.t0 = P && g <= 50, !e.t0) {
                                                            e.next = 53;
                                                            break
                                                        }
                                                        if (g++, e.t1 = "object" == no(P), !e.t1) {
                                                            e.next = 52;
                                                            break
                                                        }
                                                        if (P.placement && (y = P.placement), e.t2 = P.rects, !e.t2) {
                                                            e.next = 51;
                                                            break
                                                        }
                                                        if (!0 !== P.rects) {
                                                            e.next = 49;
                                                            break
                                                        }
                                                        return e.next = 46, s.getElementRects({
                                                            reference: t,
                                                            floating: n,
                                                            strategy: l
                                                        });
                                                    case 46:
                                                        e.t3 = e.sent, e.next = 50;
                                                        break;
                                                    case 49:
                                                        e.t3 = P.rects;
                                                    case 50:
                                                        p = e.t3;
                                                    case 51:
                                                        x = Bo(p, y, f), v = x.x, h = x.y;
                                                    case 52:
                                                        w = -1;
                                                    case 53:
                                                        w++, e.next = 21;
                                                        break;
                                                    case 56:
                                                        return e.abrupt("return", {
                                                            x: v,
                                                            y: h,
                                                            placement: y,
                                                            strategy: l,
                                                            middlewareData: b
                                                        });
                                                    case 57:
                                                    case "end":
                                                        return e.stop()
                                                }
                                            }), e)
                                        })));
                                        return function(t, n, r) {
                                            return e.apply(this, arguments)
                                        }
                                    }()(e, t, fo(fo({}, o), {}, {
                                        platform: a
                                    }))
                                }(I.current, D.current, e).then((function(e) {
                                    var t = fo(fo({}, e), {}, {
                                        isPositioned: !1 !== B.current
                                    });
                                    z.current && !Ba(F.current, t) && (F.current = t, o.flushSync((function() {
                                        w(t)
                                    })))
                                }))
                        }
                    }), [E, a, l, L, B]);
                La((function() {
                    !1 === y && F.current.isPositioned && (F.current.isPositioned = !1, w((function(e) {
                        return fo(fo({}, e), {}, {
                            isPositioned: !1
                        })
                    })))
                }), [y]);
                var z = t.useRef(!1);
                La((function() {
                    return z.current = !0,
                        function() {
                            z.current = !1
                        }
                }), []), La((function() {
                    if (T && (I.current = T), _ && (D.current = _), T && _) {
                        if (U.current) return U.current(T, _, W);
                        W()
                    }
                }), [T, _, W, U, M]);
                var V = t.useMemo((function() {
                        return {
                            reference: I,
                            floating: D,
                            setReference: R,
                            setFloating: j
                        }
                    }), [R, j]),
                    H = t.useMemo((function() {
                        return {
                            reference: T,
                            floating: _
                        }
                    }), [T, _]),
                    K = t.useMemo((function() {
                        var e = {
                            position: l,
                            left: 0,
                            top: 0
                        };
                        if (!H.floating) return e;
                        var t = za(H.floating, g.x),
                            n = za(H.floating, g.y);
                        return v ? fo(fo({}, e), {}, {
                            transform: "translate(" + t + "px, " + n + "px)"
                        }, Wa(H.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: l,
                            left: t,
                            top: n
                        }
                    }), [l, v, H.floating, g.x, g.y]);
                return t.useMemo((function() {
                    return fo(fo({}, g), {}, {
                        update: W,
                        refs: V,
                        elements: H,
                        floatingStyles: K
                    })
                }), [g, W, V, H, K])
            }
            var Ka = function(e, t) {
                    return fo(fo({}, function(e) {
                        return void 0 === e && (e = 0), {
                            name: "offset",
                            options: e,
                            fn: function(t) {
                                return co(regeneratorRuntime.mark((function n() {
                                    var r, o, a, i, l, u, c;
                                    return regeneratorRuntime.wrap((function(n) {
                                        for (;;) switch (n.prev = n.next) {
                                            case 0:
                                                return a = t.x, i = t.y, l = t.placement, u = t.middlewareData, n.next = 6,
                                                    function() {
                                                        var e = co(regeneratorRuntime.mark((function e(t, n) {
                                                            var r, o, a, i, l, u, c, s, d, f, p, m, v, h;
                                                            return regeneratorRuntime.wrap((function(e) {
                                                                for (;;) switch (e.prev = e.next) {
                                                                    case 0:
                                                                        return r = t.placement, o = t.platform, a = t.elements, e.next = 5, null == o.isRTL ? void 0 : o.isRTL(a.floating);
                                                                    case 5:
                                                                        return i = e.sent, l = Oo(r), u = Co(r), c = "y" === Po(r), s = Ko.has(l) ? -1 : 1, d = i && c ? -1 : 1, f = So(n, t), p = "number" == typeof f ? {
                                                                            mainAxis: f,
                                                                            crossAxis: 0,
                                                                            alignmentAxis: null
                                                                        } : {
                                                                            mainAxis: f.mainAxis || 0,
                                                                            crossAxis: f.crossAxis || 0,
                                                                            alignmentAxis: f.alignmentAxis
                                                                        }, m = p.mainAxis, v = p.crossAxis, h = p.alignmentAxis, e.abrupt("return", (u && "number" == typeof h && (v = "end" === u ? -1 * h : h), c ? {
                                                                            x: v * d,
                                                                            y: m * s
                                                                        } : {
                                                                            x: m * s,
                                                                            y: v * d
                                                                        }));
                                                                    case 14:
                                                                    case "end":
                                                                        return e.stop()
                                                                }
                                                            }), e)
                                                        })));
                                                        return function(t, n) {
                                                            return e.apply(this, arguments)
                                                        }
                                                    }()(t, e);
                                            case 6:
                                                return c = n.sent, n.abrupt("return", l === (null == (r = u.offset) ? void 0 : r.placement) && null != (o = u.arrow) && o.alignmentOffset ? {} : {
                                                    x: a + c.x,
                                                    y: i + c.y,
                                                    data: fo(fo({}, c), {}, {
                                                        placement: l
                                                    })
                                                });
                                            case 8:
                                            case "end":
                                                return n.stop()
                                        }
                                    }), n)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Ga = function(e, t) {
                    return fo(fo({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "shift",
                            options: e,
                            fn: function(t) {
                                return co(regeneratorRuntime.mark((function n() {
                                    var r, o, a, i, l, u, c, s, d, f, p, m, v, h, y, b, g, w, x, E, S, O;
                                    return regeneratorRuntime.wrap((function(n) {
                                        for (;;) switch (n.prev = n.next) {
                                            case 0:
                                                return a = t.x, i = t.y, l = t.placement, u = So(e, t), c = u.mainAxis, s = void 0 === c || c, d = u.crossAxis, f = void 0 !== d && d, p = u.limiter, m = void 0 === p ? {
                                                    fn: function(e) {
                                                        return {
                                                            x: e.x,
                                                            y: e.y
                                                        }
                                                    }
                                                } : p, v = ro(u, ["mainAxis", "crossAxis", "limiter"]), h = {
                                                    x: a,
                                                    y: i
                                                }, n.next = 14, Wo(t, v);
                                            case 14:
                                                return y = n.sent, b = Po(Oo(l)), g = ko(b), w = h[g], x = h[b], s && (E = "y" === g ? "bottom" : "right", w = Eo(w + y["y" === g ? "top" : "left"], w, w - y[E])), f && (S = "y" === b ? "bottom" : "right", x = Eo(x + y["y" === b ? "top" : "left"], x, x - y[S])), O = m.fn(fo(fo({}, t), {}, (po(r = {}, g, w), po(r, b, x), r))), n.abrupt("return", fo(fo({}, O), {}, {
                                                    data: {
                                                        x: O.x - a,
                                                        y: O.y - i,
                                                        enabled: (o = {}, po(o, g, s), po(o, b, f), o)
                                                    }
                                                }));
                                            case 22:
                                            case "end":
                                                return n.stop()
                                        }
                                    }), n)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                qa = function(e, t) {
                    return fo(fo({}, function(e) {
                        return void 0 === e && (e = {}), {
                            options: e,
                            fn: function(t) {
                                var n, r = t.x,
                                    o = t.y,
                                    a = t.placement,
                                    i = t.rects,
                                    l = t.middlewareData,
                                    u = So(e, t),
                                    c = u.offset,
                                    s = void 0 === c ? 0 : c,
                                    d = u.mainAxis,
                                    f = void 0 === d || d,
                                    p = u.crossAxis,
                                    m = void 0 === p || p,
                                    v = {
                                        x: r,
                                        y: o
                                    },
                                    h = Po(a),
                                    y = ko(h),
                                    b = v[y],
                                    g = v[h],
                                    w = So(s, t),
                                    x = "number" == typeof w ? {
                                        mainAxis: w,
                                        crossAxis: 0
                                    } : fo({
                                        mainAxis: 0,
                                        crossAxis: 0
                                    }, w);
                                if (f) {
                                    var E = "y" === y ? "height" : "width",
                                        S = i.reference[y] - i.floating[E] + x.mainAxis,
                                        O = i.reference[y] + i.reference[E] - x.mainAxis;
                                    b < S ? b = S : b > O && (b = O)
                                }
                                if (m) {
                                    var C, k, A = "y" === y ? "width" : "height",
                                        N = Ko.has(Oo(a)),
                                        P = i.reference[h] - i.floating[A] + (N && (null == (C = l.offset) ? void 0 : C[h]) || 0) + (N ? 0 : x.crossAxis),
                                        R = i.reference[h] + i.reference[A] + (N ? 0 : (null == (k = l.offset) ? void 0 : k[h]) || 0) - (N ? x.crossAxis : 0);
                                    g < P ? g = P : g > R && (g = R)
                                }
                                return po(n = {}, y, b), po(n, h, g), n
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Xa = function(e, t) {
                    return fo(fo({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "flip",
                            options: e,
                            fn: function(t) {
                                return co(regeneratorRuntime.mark((function n() {
                                    var r, o, a, i, l, u, c, s, d, f, p, m, v, h, y, b, g, w, x, E, S, O, C, k, A, N, P, R, j, T, _, I, D, F, M, U, L, B, W;
                                    return regeneratorRuntime.wrap((function(n) {
                                        for (;;) switch (n.prev = n.next) {
                                            case 0:
                                                if (a = t.placement, i = t.middlewareData, l = t.rects, u = t.initialPlacement, c = t.platform, s = t.elements, d = So(e, t), f = d.mainAxis, p = void 0 === f || f, m = d.crossAxis, v = void 0 === m || m, h = d.fallbackPlacements, y = d.fallbackStrategy, b = void 0 === y ? "bestFit" : y, g = d.fallbackAxisSideDirection, w = void 0 === g ? "none" : g, x = d.flipAlignment, E = void 0 === x || x, S = ro(d, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null == (r = i.arrow) || !r.alignmentOffset) {
                                                    n.next = 3;
                                                    break
                                                }
                                                return n.abrupt("return", {});
                                            case 3:
                                                return O = Oo(a), C = Po(u), k = Oo(u) === u, n.next = 8, null == c.isRTL ? void 0 : c.isRTL(s.floating);
                                            case 8:
                                                return A = n.sent, N = h || (k || !E ? [Mo(u)] : function(e) {
                                                    var t = Mo(e);
                                                    return [jo(e), t, jo(t)]
                                                }(u)), P = "none" !== w, !h && P && N.push.apply(N, ao(Fo(u, E, w, A))), R = [u].concat(ao(N)), n.next = 15, Wo(t, S);
                                            case 15:
                                                if (j = n.sent, T = [], _ = (null == (o = i.flip) ? void 0 : o.overflows) || [], p && T.push(j[O]), v && (I = function(e, t, n) {
                                                        void 0 === n && (n = !1);
                                                        var r = Co(e),
                                                            o = Ro(e),
                                                            a = Ao(o),
                                                            i = "x" === o ? r === (n ? "end" : "start") ? "right" : "left" : "start" === r ? "bottom" : "top";
                                                        return t.reference[a] > t.floating[a] && (i = Mo(i)), [i, Mo(i)]
                                                    }(a, l, A), T.push(j[I[0]], j[I[1]])), _ = [].concat(ao(_), [{
                                                        placement: a,
                                                        overflows: T
                                                    }]), T.every((function(e) {
                                                        return e <= 0
                                                    }))) {
                                                    n.next = 35;
                                                    break
                                                }
                                                if (M = ((null == (D = i.flip) ? void 0 : D.index) || 0) + 1, !(U = R[M])) {
                                                    n.next = 24;
                                                    break
                                                }
                                                if ("alignment" === v && C !== Po(U) && !_.every((function(e) {
                                                        return Po(e.placement) !== C || e.overflows[0] > 0
                                                    }))) {
                                                    n.next = 24;
                                                    break
                                                }
                                                return n.abrupt("return", {
                                                    data: {
                                                        index: M,
                                                        overflows: _
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                });
                                            case 24:
                                                if (L = null == (F = _.filter((function(e) {
                                                        return e.overflows[0] <= 0
                                                    })).sort((function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    }))[0]) ? void 0 : F.placement, L) {
                                                    n.next = 33;
                                                    break
                                                }
                                                n.t0 = b, n.next = "bestFit" === n.t0 ? 29 : "initialPlacement" === n.t0 ? 32 : 33;
                                                break;
                                            case 29:
                                                return W = null == (B = _.filter((function(e) {
                                                    if (P) {
                                                        var t = Po(e.placement);
                                                        return t === C || "y" === t
                                                    }
                                                    return !0
                                                })).map((function(e) {
                                                    return [e.placement, e.overflows.filter((function(e) {
                                                        return e > 0
                                                    })).reduce((function(e, t) {
                                                        return e + t
                                                    }), 0)]
                                                })).sort((function(e, t) {
                                                    return e[1] - t[1]
                                                }))[0]) ? void 0 : B[0], W && (L = W), n.abrupt("break", 33);
                                            case 32:
                                                L = u;
                                            case 33:
                                                if (a === L) {
                                                    n.next = 35;
                                                    break
                                                }
                                                return n.abrupt("return", {
                                                    reset: {
                                                        placement: L
                                                    }
                                                });
                                            case 35:
                                                return n.abrupt("return", {});
                                            case 36:
                                            case "end":
                                                return n.stop()
                                        }
                                    }), n)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                $a = function(e, t) {
                    return fo(fo({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "size",
                            options: e,
                            fn: function(t) {
                                return co(regeneratorRuntime.mark((function n() {
                                    var r, o, a, i, l, u, c, s, d, f, p, m, v, h, y, b, g, w, x, E, S, O, C, k, A, N, P, R, j, T, _;
                                    return regeneratorRuntime.wrap((function(n) {
                                        for (;;) switch (n.prev = n.next) {
                                            case 0:
                                                return a = t.placement, i = t.rects, l = t.platform, u = t.elements, c = So(e, t), s = c.apply, d = void 0 === s ? function() {} : s, f = ro(c, ["apply"]), n.next = 10, Wo(t, f);
                                            case 10:
                                                if (p = n.sent, m = Oo(a), v = Co(a), h = "y" === Po(a), y = i.floating, b = y.width, g = y.height, "top" !== m && "bottom" !== m) {
                                                    n.next = 36;
                                                    break
                                                }
                                                return w = m, n.t0 = v, n.next = 22, null == l.isRTL ? void 0 : l.isRTL(u.floating);
                                            case 22:
                                                if (!n.sent) {
                                                    n.next = 26;
                                                    break
                                                }
                                                n.t1 = "start", n.next = 27;
                                                break;
                                            case 26:
                                                n.t1 = "end";
                                            case 27:
                                                if (n.t2 = n.t1, n.t0 !== n.t2) {
                                                    n.next = 32;
                                                    break
                                                }
                                                n.t3 = "left", n.next = 33;
                                                break;
                                            case 32:
                                                n.t3 = "right";
                                            case 33:
                                                x = n.t3, n.next = 37;
                                                break;
                                            case 36:
                                                x = m, w = "end" === v ? "top" : "bottom";
                                            case 37:
                                                return E = g - p.top - p.bottom, S = b - p.left - p.right, O = vo(g - p[w], E), C = vo(b - p[x], S), k = !t.middlewareData.shift, A = O, N = C, null != (r = t.middlewareData.shift) && r.enabled.x && (N = S), null != (o = t.middlewareData.shift) && o.enabled.y && (A = E), k && !v && (P = ho(p.left, 0), R = ho(p.right, 0), j = ho(p.top, 0), T = ho(p.bottom, 0), h ? N = b - 2 * (0 !== P || 0 !== R ? P + R : ho(p.left, p.right)) : A = g - 2 * (0 !== j || 0 !== T ? j + T : ho(p.top, p.bottom))), n.next = 42, d(fo(fo({}, t), {}, {
                                                    availableWidth: N,
                                                    availableHeight: A
                                                }));
                                            case 42:
                                                return n.next = 44, l.getDimensions(u.floating);
                                            case 44:
                                                return _ = n.sent, n.abrupt("return", b !== _.width || g !== _.height ? {
                                                    reset: {
                                                        rects: !0
                                                    }
                                                } : {});
                                            case 46:
                                            case "end":
                                                return n.stop()
                                        }
                                    }), n)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Ya = function(e, t) {
                    return fo(fo({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "hide",
                            options: e,
                            fn: function(t) {
                                return co(regeneratorRuntime.mark((function n() {
                                    var r, o, a, i, l, u, c;
                                    return regeneratorRuntime.wrap((function(n) {
                                        for (;;) switch (n.prev = n.next) {
                                            case 0:
                                                r = t.rects, o = So(e, t), a = o.strategy, i = void 0 === a ? "referenceHidden" : a, l = ro(o, ["strategy"]), n.t0 = i, n.next = "referenceHidden" === n.t0 ? 4 : "escaped" === n.t0 ? 11 : 18;
                                                break;
                                            case 4:
                                                return n.t1 = Vo, n.next = 7, Wo(t, fo(fo({}, l), {}, {
                                                    elementContext: "reference"
                                                }));
                                            case 7:
                                                return n.t2 = n.sent, n.t3 = r.reference, u = (0, n.t1)(n.t2, n.t3), n.abrupt("return", {
                                                    data: {
                                                        referenceHiddenOffsets: u,
                                                        referenceHidden: Ho(u)
                                                    }
                                                });
                                            case 11:
                                                return n.t4 = Vo, n.next = 14, Wo(t, fo(fo({}, l), {}, {
                                                    altBoundary: !0
                                                }));
                                            case 14:
                                                return n.t5 = n.sent, n.t6 = r.floating, c = (0, n.t4)(n.t5, n.t6), n.abrupt("return", {
                                                    data: {
                                                        escapedOffsets: c,
                                                        escaped: Ho(c)
                                                    }
                                                });
                                            case 18:
                                                return n.abrupt("return", {});
                                            case 19:
                                            case "end":
                                                return n.stop()
                                        }
                                    }), n)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Za = function(e, t) {
                    return fo(fo({}, function(e) {
                        return {
                            name: "arrow",
                            options: e,
                            fn: function(t) {
                                var n, r = "function" == typeof e ? e(t) : e,
                                    o = r.element,
                                    a = r.padding;
                                return o && (n = o, {}.hasOwnProperty.call(n, "current")) ? null != o.current ? Ua({
                                    element: o.current,
                                    padding: a
                                }).fn(t) : {} : o ? Ua({
                                    element: o,
                                    padding: a
                                }).fn(t) : {}
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                };

            function Ja(e) {
                return function(e) {
                    if (Array.isArray(e)) return ti(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || ei(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Qa(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || ei(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ei(e, t) {
                if (e) {
                    if ("string" == typeof e) return ti(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? ti(e, t) : void 0
                }
            }

            function ti(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ni(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function ri(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? ni(Object(n), !0).forEach((function(t) {
                        oi(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : ni(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function oi(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ai(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function ii(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var li = Symbol("radix.slottable");

            function ui(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === li
            }
            var ci = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                    var r = function(e) {
                            var n = function(e) {
                                    var n = t.forwardRef((function(e, n) {
                                        var r = e.children,
                                            o = ai(e, ["children"]);
                                        if (t.isValidElement(r)) {
                                            var a = function(e) {
                                                    var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                i = function(e, t) {
                                                    var n = ri({}, t),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                a = t[r];
                                                            /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                                a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (n[r] = o) : "style" === r ? n[r] = ri(ri({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) r(o);
                                                    return ri(ri({}, e), n)
                                                }(o, r.props);
                                            return r.type !== t.Fragment && (i.ref = n ? function() {
                                                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                return function(e) {
                                                    var n = !1,
                                                        r = t.map((function(t) {
                                                            var r = ii(t, e);
                                                            return n || "function" != typeof r || (n = !0), r
                                                        }));
                                                    if (n) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var n = r[e];
                                                            "function" == typeof n ? n() : ii(t[e], null)
                                                        }
                                                    }
                                                }
                                            }(n, a) : a), t.cloneElement(r, i)
                                        }
                                        return t.Children.count(r) > 1 ? t.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(e, ".SlotClone"), n
                                }(e),
                                r = t.forwardRef((function(e, r) {
                                    var o = e.children,
                                        a = ai(e, ["children"]),
                                        i = t.Children.toArray(o),
                                        l = i.find(ui);
                                    if (l) {
                                        var u = l.props.children,
                                            c = i.map((function(e) {
                                                return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                            }));
                                        return (0, b.jsx)(n, ri(ri({}, a), {}, {
                                            ref: r,
                                            children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                                        }))
                                    }
                                    return (0, b.jsx)(n, ri(ri({}, a), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(n)),
                        o = t.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = ai(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, ri(ri({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), ri(ri({}, e), {}, oi({}, n, o))
                }), {}),
                si = t.forwardRef((function(e, t) {
                    var n = e.children,
                        r = e.width,
                        o = void 0 === r ? 10 : r,
                        a = e.height,
                        i = void 0 === a ? 5 : a,
                        l = ai(e, ["children", "width", "height"]);
                    return (0, b.jsx)(ci.svg, ri(ri({}, l), {}, {
                        ref: t,
                        width: o,
                        height: i,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? n : (0, b.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                }));
            si.displayName = "Arrow";
            var di = si;

            function fi(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function pi() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = fi(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : fi(t[e], null)
                        }
                    }
                }
            }

            function mi() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                return t.useCallback(pi.apply(void 0, n), n)
            }

            function vi() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var e = n.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(n) {
                        var r = e.reduce((function(e, t) {
                            var r = t.useScope,
                                o = t.scopeName;
                            return ri(ri({}, e), r(n)["__scope".concat(o)])
                        }), {});
                        return t.useMemo((function() {
                            return oi({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }
            var hi = Symbol("radix.slottable");

            function yi(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === hi
            }
            var bi = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                    var r = function(e) {
                            var n = function(e) {
                                    var n = t.forwardRef((function(e, n) {
                                        var r = e.children,
                                            o = ai(e, ["children"]);
                                        if (t.isValidElement(r)) {
                                            var a = function(e) {
                                                    var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                i = function(e, t) {
                                                    var n = ri({}, t),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                a = t[r];
                                                            /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                                a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (n[r] = o) : "style" === r ? n[r] = ri(ri({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) r(o);
                                                    return ri(ri({}, e), n)
                                                }(o, r.props);
                                            return r.type !== t.Fragment && (i.ref = n ? pi(n, a) : a), t.cloneElement(r, i)
                                        }
                                        return t.Children.count(r) > 1 ? t.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(e, ".SlotClone"), n
                                }(e),
                                r = t.forwardRef((function(e, r) {
                                    var o = e.children,
                                        a = ai(e, ["children"]),
                                        i = t.Children.toArray(o),
                                        l = i.find(yi);
                                    if (l) {
                                        var u = l.props.children,
                                            c = i.map((function(e) {
                                                return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                            }));
                                        return (0, b.jsx)(n, ri(ri({}, a), {}, {
                                            ref: r,
                                            children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                                        }))
                                    }
                                    return (0, b.jsx)(n, ri(ri({}, a), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(n)),
                        o = t.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = ai(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, ri(ri({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), ri(ri({}, e), {}, oi({}, n, o))
                }), {}),
                gi = null !== globalThis && void 0 !== globalThis && globalThis.document ? t.useLayoutEffect : function() {},
                wi = "Popper",
                xi = function(e) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map((function(e) {
                                return t.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || n;
                                return t.useMemo((function() {
                                    return oi({}, "__scope".concat(e), ri(ri({}, r), {}, oi({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(n, o) {
                        var a = t.createContext(o),
                            i = r.length;
                        r = [].concat(Ja(r), [o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = ai(n, ["scope", "children"]),
                                c = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[i]) || a,
                                s = t.useMemo((function() {
                                    return u
                                }), Object.values(u));
                            return (0, b.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null === (u = l[e]) || void 0 === u ? void 0 : u[i]) || a,
                                s = t.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, vi.apply(void 0, [o].concat(Ja(n)))]
                }(wi),
                Ei = Qa(xi, 2),
                Si = Ei[0],
                Oi = Ei[1],
                Ci = Qa(Si(wi), 2),
                ki = Ci[0],
                Ai = Ci[1],
                Ni = function(e) {
                    var n = e.__scopePopper,
                        r = e.children,
                        o = Qa(t.useState(null), 2),
                        a = o[0],
                        i = o[1];
                    return (0, b.jsx)(ki, {
                        scope: n,
                        anchor: a,
                        onAnchorChange: i,
                        children: r
                    })
                };
            Ni.displayName = wi;
            var Pi = "PopperAnchor",
                Ri = t.forwardRef((function(e, n) {
                    var r = e.__scopePopper,
                        o = e.virtualRef,
                        a = ai(e, ["__scopePopper", "virtualRef"]),
                        i = Ai(Pi, r),
                        l = t.useRef(null),
                        u = mi(n, l);
                    return t.useEffect((function() {
                        i.onAnchorChange((null == o ? void 0 : o.current) || l.current)
                    })), o ? null : (0, b.jsx)(bi.div, ri(ri({}, a), {}, {
                        ref: u
                    }))
                }));
            Ri.displayName = Pi;
            var ji = "PopperContent",
                Ti = Qa(Si(ji), 2),
                _i = Ti[0],
                Ii = Ti[1],
                Di = t.forwardRef((function(e, n) {
                    var r, o, a, i, l, u, c, s, d = e.__scopePopper,
                        f = e.side,
                        p = void 0 === f ? "bottom" : f,
                        m = e.sideOffset,
                        v = void 0 === m ? 0 : m,
                        h = e.align,
                        y = void 0 === h ? "center" : h,
                        g = e.alignOffset,
                        w = void 0 === g ? 0 : g,
                        x = e.arrowPadding,
                        E = void 0 === x ? 0 : x,
                        S = e.avoidCollisions,
                        O = void 0 === S || S,
                        C = e.collisionBoundary,
                        k = void 0 === C ? [] : C,
                        A = e.collisionPadding,
                        N = void 0 === A ? 0 : A,
                        P = e.sticky,
                        R = void 0 === P ? "partial" : P,
                        j = e.hideWhenDetached,
                        T = void 0 !== j && j,
                        _ = e.updatePositionStrategy,
                        I = void 0 === _ ? "optimized" : _,
                        D = e.onPlaced,
                        F = ai(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        M = Ai(ji, d),
                        U = Qa(t.useState(null), 2),
                        L = U[0],
                        B = U[1],
                        W = mi(n, (function(e) {
                            return B(e)
                        })),
                        z = Qa(t.useState(null), 2),
                        V = z[0],
                        H = z[1],
                        K = function(e) {
                            var n = Qa(t.useState(void 0), 2),
                                r = n[0],
                                o = n[1];
                            return gi((function() {
                                if (e) {
                                    o({
                                        width: e.offsetWidth,
                                        height: e.offsetHeight
                                    });
                                    var t = new ResizeObserver((function(t) {
                                        if (Array.isArray(t) && t.length) {
                                            var n, r, a = t[0];
                                            if ("borderBoxSize" in a) {
                                                var i = a.borderBoxSize,
                                                    l = Array.isArray(i) ? i[0] : i;
                                                n = l.inlineSize, r = l.blockSize
                                            } else n = e.offsetWidth, r = e.offsetHeight;
                                            o({
                                                width: n,
                                                height: r
                                            })
                                        }
                                    }));
                                    return t.observe(e, {
                                            box: "border-box"
                                        }),
                                        function() {
                                            return t.unobserve(e)
                                        }
                                }
                                o(void 0)
                            }), [e]), r
                        }(V),
                        G = null !== (r = null == K ? void 0 : K.width) && void 0 !== r ? r : 0,
                        q = null !== (o = null == K ? void 0 : K.height) && void 0 !== o ? o : 0,
                        X = p + ("center" !== y ? "-" + y : ""),
                        $ = "number" == typeof N ? N : ri({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, N),
                        Y = Array.isArray(k) ? k : [k],
                        Z = Y.length > 0,
                        J = {
                            padding: $,
                            boundary: Y.filter(Li),
                            altBoundary: Z
                        },
                        Q = Ha({
                            strategy: "fixed",
                            placement: X,
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return Ma.apply(void 0, t.concat([{
                                    animationFrame: "always" === I
                                }]))
                            },
                            elements: {
                                reference: M.anchor
                            },
                            middleware: [Ka({
                                mainAxis: v + q,
                                alignmentAxis: w
                            }), O && Ga(ri({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === R ? qa() : void 0
                            }, J)), O && Xa(ri({}, J)), $a(ri(ri({}, J), {}, {
                                apply: function(e) {
                                    var t = e.elements,
                                        n = e.rects,
                                        r = e.availableWidth,
                                        o = e.availableHeight,
                                        a = n.reference,
                                        i = a.width,
                                        l = a.height,
                                        u = t.floating.style;
                                    u.setProperty("--radix-popper-available-width", "".concat(r, "px")), u.setProperty("--radix-popper-available-height", "".concat(o, "px")), u.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), u.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), V && Za({
                                element: V,
                                padding: E
                            }), Bi({
                                arrowWidth: G,
                                arrowHeight: q
                            }), T && Ya(ri({
                                strategy: "referenceHidden"
                            }, J))]
                        }),
                        ee = Q.refs,
                        te = Q.floatingStyles,
                        ne = Q.placement,
                        re = Q.isPositioned,
                        oe = Q.middlewareData,
                        ae = Qa(Wi(ne), 2),
                        ie = ae[0],
                        le = ae[1],
                        ue = function(e) {
                            var n = t.useRef(e);
                            return t.useEffect((function() {
                                n.current = e
                            })), t.useMemo((function() {
                                return function() {
                                    for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                                    return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                                }
                            }), [])
                        }(D);
                    gi((function() {
                        re && (null == ue || ue())
                    }), [re, ue]);
                    var ce = null === (a = oe.arrow) || void 0 === a ? void 0 : a.x,
                        se = null === (i = oe.arrow) || void 0 === i ? void 0 : i.y,
                        de = 0 !== (null === (l = oe.arrow) || void 0 === l ? void 0 : l.centerOffset),
                        fe = Qa(t.useState(), 2),
                        pe = fe[0],
                        me = fe[1];
                    return gi((function() {
                        L && me(window.getComputedStyle(L).zIndex)
                    }), [L]), (0, b.jsx)("div", {
                        ref: ee.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: ri(ri({}, te), {}, {
                            transform: re ? te.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: pe,
                            "--radix-popper-transform-origin": [null === (u = oe.transformOrigin) || void 0 === u ? void 0 : u.x, null === (c = oe.transformOrigin) || void 0 === c ? void 0 : c.y].join(" ")
                        }, (null === (s = oe.hide) || void 0 === s ? void 0 : s.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, b.jsx)(_i, {
                            scope: d,
                            placedSide: ie,
                            onArrowChange: H,
                            arrowX: ce,
                            arrowY: se,
                            shouldHideArrow: de,
                            children: (0, b.jsx)(bi.div, ri(ri({
                                "data-side": ie,
                                "data-align": le
                            }, F), {}, {
                                ref: W,
                                style: ri(ri({}, F.style), {}, {
                                    animation: re ? void 0 : "none"
                                })
                            }))
                        })
                    })
                }));
            Di.displayName = ji;
            var Fi = "PopperArrow",
                Mi = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                Ui = t.forwardRef((function(e, t) {
                    var n, r = e.__scopePopper,
                        o = ai(e, ["__scopePopper"]),
                        a = Ii(Fi, r),
                        i = Mi[a.placedSide];
                    return (0, b.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (n = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, oi(n, i, 0), oi(n, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), oi(n, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), oi(n, "visibility", a.shouldHideArrow ? "hidden" : void 0), n),
                        children: (0, b.jsx)(di, ri(ri({}, o), {}, {
                            ref: t,
                            style: ri(ri({}, o.style), {}, {
                                display: "block"
                            })
                        }))
                    })
                }));

            function Li(e) {
                return null !== e
            }
            Ui.displayName = Fi;
            var Bi = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var n, r, o, a, i, l = t.placement,
                            u = t.rects,
                            c = t.middlewareData,
                            s = 0 !== (null === (n = c.arrow) || void 0 === n ? void 0 : n.centerOffset),
                            d = s ? 0 : e.arrowWidth,
                            f = s ? 0 : e.arrowHeight,
                            p = Qa(Wi(l), 2),
                            m = p[0],
                            v = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            h = (null !== (r = null === (o = c.arrow) || void 0 === o ? void 0 : o.x) && void 0 !== r ? r : 0) + d / 2,
                            y = (null !== (a = null === (i = c.arrow) || void 0 === i ? void 0 : i.y) && void 0 !== a ? a : 0) + f / 2,
                            b = "",
                            g = "";
                        return "bottom" === m ? (b = s ? v : "".concat(h, "px"), g = -f + "px") : "top" === m ? (b = s ? v : "".concat(h, "px"), g = "".concat(u.floating.height + f, "px")) : "right" === m ? (b = -f + "px", g = s ? v : "".concat(y, "px")) : "left" === m && (b = "".concat(u.floating.width + f, "px"), g = s ? v : "".concat(y, "px")), {
                            data: {
                                x: b,
                                y: g
                            }
                        }
                    }
                }
            };

            function Wi(e) {
                var t = Qa(e.split("-"), 2),
                    n = t[0],
                    r = t[1];
                return [n, void 0 === r ? "center" : r]
            }
            var zi = Ni,
                Vi = Ri,
                Hi = Di,
                Ki = Ui;

            function Gi(e) {
                return function(e) {
                    if (Array.isArray(e)) return Yi(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || $i(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function qi(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function Xi(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || $i(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function $i(e, t) {
                if (e) {
                    if ("string" == typeof e) return Yi(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? Yi(e, t) : void 0
                }
            }

            function Yi(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Zi(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Ji(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Zi(Object(n), !0).forEach((function(t) {
                        Qi(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : Zi(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function Qi(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function el(e, t) {
                var n = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === n || n;
                return function(n) {
                    if (null != e && e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function tl(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function nl() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = tl(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : tl(t[e], null)
                        }
                    }
                }
            }

            function rl() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                return t.useCallback(nl.apply(void 0, n), n)
            }

            function ol() {
                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var e = n.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(n) {
                        var r = e.reduce((function(e, t) {
                            var r = t.useScope,
                                o = t.scopeName;
                            return Ji(Ji({}, e), r(n)["__scope".concat(o)])
                        }), {});
                        return t.useMemo((function() {
                            return Qi({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }
            var al = null !== globalThis && void 0 !== globalThis && globalThis.document ? t.useLayoutEffect : function() {},
                il = function(e) {
                    var n = e.present,
                        r = e.children,
                        o = function(e) {
                            var n = Xi(t.useState(), 2),
                                r = n[0],
                                o = n[1],
                                a = t.useRef({}),
                                i = t.useRef(e),
                                l = t.useRef("none"),
                                u = function(e, n) {
                                    return t.useReducer((function(e, t) {
                                        var r;
                                        return null !== (r = n[e][t]) && void 0 !== r ? r : e
                                    }), e)
                                }(e ? "mounted" : "unmounted", {
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
                                }),
                                c = Xi(u, 2),
                                s = c[0],
                                d = c[1];
                            return t.useEffect((function() {
                                var e = ll(a.current);
                                l.current = "mounted" === s ? e : "none"
                            }), [s]), al((function() {
                                var t = a.current,
                                    n = i.current;
                                if (n !== e) {
                                    var r = l.current,
                                        o = ll(t);
                                    e ? d("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), i.current = e
                                }
                            }), [e, d]), al((function() {
                                if (r) {
                                    var e, t, n = null !== (e = r.ownerDocument.defaultView) && void 0 !== e ? e : window,
                                        o = function(e) {
                                            var o = ll(a.current).includes(e.animationName);
                                            if (e.target === r && o && (d("ANIMATION_END"), !i.current)) {
                                                var l = r.style.animationFillMode;
                                                r.style.animationFillMode = "forwards", t = n.setTimeout((function() {
                                                    "forwards" === r.style.animationFillMode && (r.style.animationFillMode = l)
                                                }))
                                            }
                                        },
                                        u = function(e) {
                                            e.target === r && (l.current = ll(a.current))
                                        };
                                    return r.addEventListener("animationstart", u), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o),
                                        function() {
                                            n.clearTimeout(t), r.removeEventListener("animationstart", u), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                                        }
                                }
                                d("ANIMATION_END")
                            }), [r, d]), {
                                isPresent: ["mounted", "unmountSuspended"].includes(s),
                                ref: t.useCallback((function(e) {
                                    e && (a.current = getComputedStyle(e)), o(e)
                                }), [])
                            }
                        }(n),
                        a = "function" == typeof r ? r({
                            present: o.isPresent
                        }) : t.Children.only(r),
                        i = rl(o.ref, function(e) {
                            var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                o = r && "isReactWarning" in r && r.isReactWarning;
                            return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                        }(a));
                    return "function" == typeof r || o.isPresent ? t.cloneElement(a, {
                        ref: i
                    }) : null
                };

            function ll(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function ul(e) {
                var n = function(e) {
                        var n = t.forwardRef((function(e, n) {
                            var r = e.children,
                                o = qi(e, ["children"]);
                            if (t.isValidElement(r)) {
                                var a = function(e) {
                                        var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = r && "isReactWarning" in r && r.isReactWarning;
                                        return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    i = function(e, t) {
                                        var n = Ji({}, t),
                                            r = function(r) {
                                                var o = e[r],
                                                    a = t[r];
                                                /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                    a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (n[r] = o) : "style" === r ? n[r] = Ji(Ji({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) r(o);
                                        return Ji(Ji({}, e), n)
                                    }(o, r.props);
                                return r.type !== t.Fragment && (i.ref = n ? nl(n, a) : a), t.cloneElement(r, i)
                            }
                            return t.Children.count(r) > 1 ? t.Children.only(null) : null
                        }));
                        return n.displayName = "".concat(e, ".SlotClone"), n
                    }(e),
                    r = t.forwardRef((function(e, r) {
                        var o = e.children,
                            a = qi(e, ["children"]),
                            i = t.Children.toArray(o),
                            l = i.find(sl);
                        if (l) {
                            var u = l.props.children,
                                c = i.map((function(e) {
                                    return e === l ? t.Children.count(u) > 1 ? t.Children.only(null) : t.isValidElement(u) ? u.props.children : null : e
                                }));
                            return (0, b.jsx)(n, Ji(Ji({}, a), {}, {
                                ref: r,
                                children: t.isValidElement(u) ? t.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, b.jsx)(n, Ji(Ji({}, a), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }
            il.displayName = "Presence";
            var cl = Symbol("radix.slottable");

            function sl(e) {
                return t.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === cl
            }
            var dl = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, n) {
                var r = ul("Primitive.".concat(n)),
                    o = t.forwardRef((function(e, t) {
                        var o = e.asChild,
                            a = qi(e, ["asChild"]),
                            i = o ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, b.jsx)(i, Ji(Ji({}, a), {}, {
                            ref: t
                        }))
                    }));
                return o.displayName = "Primitive.".concat(n), Ji(Ji({}, e), {}, Qi({}, n, o))
            }), {});

            function fl(e) {
                var n = t.useRef(e);
                return t.useEffect((function() {
                    n.current = e
                })), t.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var pl = "Popover",
                ml = function(e) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map((function(e) {
                                return t.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || n;
                                return t.useMemo((function() {
                                    return Qi({}, "__scope".concat(e), Ji(Ji({}, r), {}, Qi({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(n, o) {
                        var a = t.createContext(o),
                            i = r.length;
                        r = [].concat(Gi(r), [o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = qi(n, ["scope", "children"]),
                                c = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[i]) || a,
                                s = t.useMemo((function() {
                                    return u
                                }), Object.values(u));
                            return (0, b.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null === (u = l[e]) || void 0 === u ? void 0 : u[i]) || a,
                                s = t.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, ol.apply(void 0, [o].concat(Gi(n)))]
                }(pl, [Oi]),
                vl = Xi(ml, 2),
                hl = vl[0],
                yl = (vl[1], Oi()),
                bl = Xi(hl(pl), 2),
                gl = bl[0],
                wl = bl[1],
                xl = function(e) {
                    var n = e.__scopePopover,
                        r = e.children,
                        o = e.open,
                        a = e.defaultOpen,
                        i = e.onOpenChange,
                        l = e.modal,
                        u = void 0 !== l && l,
                        c = yl(n),
                        s = t.useRef(null),
                        d = Xi(t.useState(!1), 2),
                        f = d[0],
                        p = d[1],
                        m = function(e) {
                            var n = e.prop,
                                r = e.defaultProp,
                                o = e.onChange,
                                a = void 0 === o ? function() {} : o,
                                i = function(e) {
                                    var n = e.defaultProp,
                                        r = e.onChange,
                                        o = t.useState(n),
                                        a = Xi(o, 1)[0],
                                        i = t.useRef(a),
                                        l = fl(r);
                                    return t.useEffect((function() {
                                        i.current !== a && (l(a), i.current = a)
                                    }), [a, i, l]), o
                                }({
                                    defaultProp: r,
                                    onChange: a
                                }),
                                l = Xi(i, 2),
                                u = l[0],
                                c = l[1],
                                s = void 0 !== n,
                                d = s ? n : u,
                                f = fl(a);
                            return [d, t.useCallback((function(e) {
                                if (s) {
                                    var t = "function" == typeof e ? e(n) : e;
                                    t !== n && f(t)
                                } else c(e)
                            }), [s, n, c, f])]
                        }({
                            prop: o,
                            defaultProp: a,
                            onChange: i
                        }),
                        v = Xi(m, 2),
                        h = v[0],
                        y = void 0 !== h && h,
                        g = v[1];
                    return (0, b.jsx)(zi, Ji(Ji({}, c), {}, {
                        children: (0, b.jsx)(gl, {
                            scope: n,
                            contentId: O(),
                            triggerRef: s,
                            open: y,
                            onOpenChange: g,
                            onOpenToggle: t.useCallback((function() {
                                return g((function(e) {
                                    return !e
                                }))
                            }), [g]),
                            hasCustomAnchor: f,
                            onCustomAnchorAdd: t.useCallback((function() {
                                return p(!0)
                            }), []),
                            onCustomAnchorRemove: t.useCallback((function() {
                                return p(!1)
                            }), []),
                            modal: u,
                            children: r
                        })
                    }))
                };
            xl.displayName = pl;
            var El = "PopoverAnchor",
                Sl = t.forwardRef((function(e, n) {
                    var r = e.__scopePopover,
                        o = qi(e, ["__scopePopover"]),
                        a = wl(El, r),
                        i = yl(r),
                        l = a.onCustomAnchorAdd,
                        u = a.onCustomAnchorRemove;
                    return t.useEffect((function() {
                        return l(),
                            function() {
                                return u()
                            }
                    }), [l, u]), (0, b.jsx)(Vi, Ji(Ji(Ji({}, i), o), {}, {
                        ref: n
                    }))
                }));
            Sl.displayName = El;
            var Ol = "PopoverTrigger",
                Cl = t.forwardRef((function(e, t) {
                    var n = e.__scopePopover,
                        r = qi(e, ["__scopePopover"]),
                        o = wl(Ol, n),
                        a = yl(n),
                        i = rl(t, o.triggerRef),
                        l = (0, b.jsx)(dl.button, Ji(Ji({
                            type: "button",
                            "aria-haspopup": "dialog",
                            "aria-expanded": o.open,
                            "aria-controls": o.contentId,
                            "data-state": Ll(o.open)
                        }, r), {}, {
                            ref: i,
                            onClick: el(e.onClick, o.onOpenToggle)
                        }));
                    return o.hasCustomAnchor ? l : (0, b.jsx)(Vi, Ji(Ji({
                        asChild: !0
                    }, a), {}, {
                        children: l
                    }))
                }));
            Cl.displayName = Ol;
            var kl = "PopoverPortal",
                Al = Xi(hl(kl, {
                    forceMount: void 0
                }), 2),
                Nl = Al[0],
                Pl = Al[1],
                Rl = function(e) {
                    var t = e.__scopePopover,
                        n = e.forceMount,
                        r = e.children,
                        o = e.container,
                        a = wl(kl, t);
                    return (0, b.jsx)(Nl, {
                        scope: t,
                        forceMount: n,
                        children: (0, b.jsx)(il, {
                            present: n || a.open,
                            children: (0, b.jsx)(ve, {
                                asChild: !0,
                                container: o,
                                children: r
                            })
                        })
                    })
                };
            Rl.displayName = kl;
            var jl = "PopoverContent",
                Tl = t.forwardRef((function(e, t) {
                    var n = Pl(jl, e.__scopePopover),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        a = qi(e, ["forceMount"]),
                        i = wl(jl, e.__scopePopover);
                    return (0, b.jsx)(il, {
                        present: o || i.open,
                        children: i.modal ? (0, b.jsx)(Il, Ji(Ji({}, a), {}, {
                            ref: t
                        })) : (0, b.jsx)(Dl, Ji(Ji({}, a), {}, {
                            ref: t
                        }))
                    })
                }));
            Tl.displayName = jl;
            var _l = ul("PopoverContent.RemoveScroll"),
                Il = t.forwardRef((function(e, n) {
                    var r = wl(jl, e.__scopePopover),
                        o = t.useRef(null),
                        a = rl(n, o),
                        i = t.useRef(!1);
                    return t.useEffect((function() {
                        var e = o.current;
                        if (e) return lt(e)
                    }), []), (0, b.jsx)(tt, {
                        as: _l,
                        allowPinchZoom: !0,
                        children: (0, b.jsx)(Fl, Ji(Ji({}, e), {}, {
                            ref: a,
                            trapFocus: r.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: el(e.onCloseAutoFocus, (function(e) {
                                var t;
                                e.preventDefault(), i.current || null === (t = r.triggerRef.current) || void 0 === t || t.focus()
                            })),
                            onPointerDownOutside: el(e.onPointerDownOutside, (function(e) {
                                var t = e.detail.originalEvent,
                                    n = 0 === t.button && !0 === t.ctrlKey,
                                    r = 2 === t.button || n;
                                i.current = r
                            }), {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: el(e.onFocusOutside, (function(e) {
                                return e.preventDefault()
                            }), {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                })),
                Dl = t.forwardRef((function(e, n) {
                    var r = wl(jl, e.__scopePopover),
                        o = t.useRef(!1),
                        a = t.useRef(!1);
                    return (0, b.jsx)(Fl, Ji(Ji({}, e), {}, {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var n, i;
                            null !== (n = e.onCloseAutoFocus) && void 0 !== n && n.call(e, t), t.defaultPrevented || (o.current || null !== (i = r.triggerRef.current) && void 0 !== i && i.focus(), t.preventDefault()), o.current = !1, a.current = !1
                        },
                        onInteractOutside: function(t) {
                            var n, i;
                            null !== (n = e.onInteractOutside) && void 0 !== n && n.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (a.current = !0));
                            var l = t.target;
                            (null === (i = r.triggerRef.current) || void 0 === i ? void 0 : i.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && a.current && t.preventDefault()
                        }
                    }))
                })),
                Fl = t.forwardRef((function(e, t) {
                    var n = e.__scopePopover,
                        r = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = e.disableOutsidePointerEvents,
                        l = e.onEscapeKeyDown,
                        u = e.onPointerDownOutside,
                        c = e.onFocusOutside,
                        s = e.onInteractOutside,
                        d = qi(e, ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"]),
                        f = wl(jl, n),
                        p = yl(n);
                    return ye(), (0, b.jsx)(re, {
                        asChild: !0,
                        loop: !0,
                        trapped: r,
                        onMountAutoFocus: o,
                        onUnmountAutoFocus: a,
                        children: (0, b.jsx)(K, {
                            asChild: !0,
                            disableOutsidePointerEvents: i,
                            onInteractOutside: s,
                            onEscapeKeyDown: l,
                            onPointerDownOutside: u,
                            onFocusOutside: c,
                            onDismiss: function() {
                                return f.onOpenChange(!1)
                            },
                            children: (0, b.jsx)(Hi, Ji(Ji(Ji({
                                "data-state": Ll(f.open),
                                role: "dialog",
                                id: f.contentId
                            }, p), d), {}, {
                                ref: t,
                                style: Ji(Ji({}, d.style), {}, {
                                    "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                                    "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                                    "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                                    "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                                    "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                                })
                            }))
                        })
                    })
                })),
                Ml = "PopoverClose",
                Ul = t.forwardRef((function(e, t) {
                    var n = e.__scopePopover,
                        r = qi(e, ["__scopePopover"]),
                        o = wl(Ml, n);
                    return (0, b.jsx)(dl.button, Ji(Ji({
                        type: "button"
                    }, r), {}, {
                        ref: t,
                        onClick: el(e.onClick, (function() {
                            return o.onOpenChange(!1)
                        }))
                    }))
                }));

            function Ll(e) {
                return e ? "open" : "closed"
            }
            Ul.displayName = Ml, t.forwardRef((function(e, t) {
                var n = e.__scopePopover,
                    r = qi(e, ["__scopePopover"]),
                    o = yl(n);
                return (0, b.jsx)(Ki, Ji(Ji(Ji({}, o), r), {}, {
                    ref: t
                }))
            })).displayName = "PopoverArrow";
            var Bl = xl,
                Wl = Cl,
                zl = Rl,
                Vl = Tl;

            function Hl(e) {
                var n = e.open,
                    r = e.defaultOpen,
                    o = e.onOpenChange,
                    a = e.children;
                return t.createElement(Bl, {
                    open: n,
                    defaultOpen: r,
                    onOpenChange: o
                }, a)
            }

            function Kl(e) {
                var n = e.asChild,
                    r = e.disabled,
                    o = e.className,
                    a = e.children;
                return t.createElement(Wl, {
                    asChild: n,
                    disabled: r,
                    className: o
                }, a)
            }

            function Gl(e) {
                var n = e.side,
                    r = void 0 === n ? "bottom" : n,
                    o = e.align,
                    a = void 0 === o ? "center" : o,
                    i = e.sideOffset,
                    l = void 0 === i ? 4 : i,
                    u = e.className,
                    c = e.children,
                    s = e.ariaLabel;
                return t.createElement(zl, null, t.createElement(Vl, {
                    side: r,
                    align: a,
                    sideOffset: l,
                    "aria-label": s,
                    className: y("foundation-web-portal-zindex", u)
                }, c))
            }

            function ql(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function Xl(e, t) {
                return Xl = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                }, Xl(e, t)
            }

            function $l(e) {
                var t = function() {
                    if ("undefined" == typeof Reflect || !Reflect.construct) return !1;
                    if (Reflect.construct.sham) return !1;
                    if ("function" == typeof Proxy) return !0;
                    try {
                        return Date.prototype.toString.call(Reflect.construct(Date, [], (function() {}))), !0
                    } catch (e) {
                        return !1
                    }
                }();
                return function() {
                    var n, r = Yl(e);
                    if (t) {
                        var o = Yl(this).constructor;
                        n = Reflect.construct(r, arguments, o)
                    } else n = r.apply(this, arguments);
                    return function(e, t) {
                        if (t && ("object" === tu(t) || "function" == typeof t)) return t;
                        return function(e) {
                            if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(e)
                    }(this, n)
                }
            }

            function Yl(e) {
                return Yl = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                }, Yl(e)
            }

            function Zl(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function Jl(e, t, n, r, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function Ql(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var a = e.apply(t, n);

                        function i(e) {
                            Jl(a, r, o, i, l, "next", e)
                        }

                        function l(e) {
                            Jl(a, r, o, i, l, "throw", e)
                        }
                        i(void 0)
                    }))
                }
            }

            function eu(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || ru(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tu(e) {
                return tu = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, tu(e)
            }

            function nu(e) {
                return function(e) {
                    if (Array.isArray(e)) return ou(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || ru(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ru(e, t) {
                if (e) {
                    if ("string" == typeof e) return ou(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? ou(e, t) : void 0
                }
            }

            function ou(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function au(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function iu(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? au(Object(n), !0).forEach((function(t) {
                        lu(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : au(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function lu(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var uu = function(e) {
                    var t = e.runId,
                        n = e.initialEnterTime;
                    return {
                        runId: t,
                        stack: [{
                            nodeId: "root",
                            data: {},
                            context: {},
                            enterTime: n
                        }],
                        navigationState: "idle",
                        submissionState: "idle",
                        openTime: n
                    }
                },
                cu = function(e, t) {
                    var n;
                    switch (t.type) {
                        case "gotoNode":
                            n = iu(iu({}, e), {}, {
                                navigationState: "idle",
                                stack: [].concat(nu(e.stack), [{
                                    nodeId: t.payload.nodeId,
                                    data: {},
                                    context: {},
                                    enterTime: t.payload.enterTime
                                }])
                            });
                            break;
                        case "goBack":
                            n = iu(iu({}, e), {}, {
                                stack: e.stack.slice(0, -1)
                            });
                            break;
                        case "updateDataAndNavigateNext":
                            var r = e.stack[e.stack.length - 1];
                            if (!r) throw new Error("No last stack found");
                            var o = iu(iu({}, r), {}, {
                                data: iu(iu({}, r.data), t.payload.data),
                                context: iu(iu({}, r.context), t.payload.context)
                            });
                            n = iu(iu({}, e), {}, {
                                stack: [].concat(nu(e.stack.slice(0, -1)), [o]),
                                navigationState: "gotoNext"
                            });
                            break;
                        case "startedSubmission":
                            n = iu(iu({}, e), {}, {
                                submissionState: "submitting"
                            });
                            break;
                        case "completedSubmission":
                            n = iu(iu({}, e), {}, {
                                submissionState: "completed"
                            });
                            break;
                        case "submissionFailed":
                            n = iu(iu({}, e), {}, {
                                submissionState: "failed"
                            });
                            break;
                        case "reset":
                            n = uu({
                                runId: t.payload.runId,
                                initialEnterTime: t.payload.initialEnterTime
                            });
                            break;
                        default:
                            throw new Error("Unknown action type: ".concat(t.type))
                    }
                    return n
                },
                su = function() {
                    return Math.random().toString(36).slice(2, 10)
                },
                du = function(e, t, n, r) {
                    var o;
                    if (!n || "string" != typeof n) throw new TypeError("Parameter 'key' must be provided and it should be a string");
                    var a = null !== (o = e[n]) && void 0 !== o ? o : "";
                    return a || console.warn("The translation key '".concat(n, "' not found. Please check for a missing string or a typo.")), void 0 !== r && ("object" !== tu(r) || Array.isArray(r) ? (console.error("Second parameter must be either a plain object when provided"), a = "") : a = a ? t.f(a, r) : ""), a
                },
                fu = "__FN_nvfToKPAOuiV__",
                pu = new RegExp("".concat(fu, "(\\d+)\\|")),
                mu = function(e, t, n) {
                    var r = {},
                        o = {};
                    n.forEach((function(e, t) {
                        if (3 === e.length) {
                            var n = eu(e, 3),
                                a = n[0],
                                i = n[1],
                                l = n[2],
                                u = t.toString(),
                                c = function(e) {
                                    return "".concat(fu).concat(e, "|")
                                }(u),
                                s = function(e) {
                                    return "".concat("__FN_END_nvfToKPAOuiV__").concat(e, "|")
                                }(u);
                            r[a] = c, r[i] = s, o[u] = {
                                start: c,
                                end: s,
                                content: l,
                                used: !1
                            }
                        } else {
                            var d = eu(e, 2),
                                f = d[0],
                                p = d[1];
                            r[f] = p
                        }
                    }));
                    var a = function e(n) {
                        var r = [],
                            a = pu.exec(n);
                        if (!a) return [n];
                        a.index > 0 && r.push(n.slice(0, a.index));
                        var i = a[1] && o[a[1]];
                        if (!i) return console.warn("Unexpected malformed segment", t), [];
                        i.used = !0;
                        var l = n.indexOf(i.end);
                        if (-1 === l) return console.warn("Unexpected malformed segment", t), [];
                        var u = n.slice(a.index + a[0].length, l),
                            c = i.content(e(u));
                        Array.isArray(c) ? r.push.apply(r, nu(c)) : r.push(c);
                        var s = n.slice(l + i.end.length);
                        return s.length > 0 && r.push.apply(r, nu(e(s))), r
                    }(e(t, r)).filter((function(e) {
                        return "" !== e
                    }));
                    return Object.values(o).some((function(e) {
                        return !e.used
                    })) ? (console.warn("Unused segments found", t), []) : a
                },
                vu = function(e, t) {
                    var n = [];
                    return t && Object.entries(t).forEach((function(e) {
                        var t = eu(e, 2),
                            r = t[0],
                            o = t[1];
                        n.push([r, o])
                    })), Object.entries(e).forEach((function(e) {
                        var t = eu(e, 2),
                            r = t[0],
                            o = t[1],
                            a = "".concat(r, "Start"),
                            i = "".concat(r, "End"),
                            l = function(e) {
                                switch (e.type) {
                                    case "link":
                                        var t = e.href,
                                            n = e.openInNewWindow,
                                            r = e.rel,
                                            o = e.className;
                                        return function(e) {
                                            return n ? (0, b.jsx)("a", {
                                                href: t,
                                                target: "_blank",
                                                rel: null != r ? r : "noopener noreferrer",
                                                className: o,
                                                children: e
                                            }) : (0, b.jsx)("a", {
                                                href: t,
                                                rel: r,
                                                className: o,
                                                children: e
                                            })
                                        };
                                    case "strong":
                                        var a = e.className;
                                        return function(e) {
                                            return (0, b.jsx)("strong", {
                                                className: a,
                                                children: e
                                            })
                                        };
                                    default:
                                        throw new Error("Unknown wrapper type: ".concat(e.type))
                                }
                            }(o);
                        n.push([a, i, l])
                    })), n
                },
                hu = (0, t.createContext)(void 0),
                yu = function(e) {
                    var n = e.translations,
                        r = e.intl,
                        o = e.children,
                        a = (0, t.useMemo)((function() {
                            return null != r ? r : new Qn.Intl
                        }), [r]),
                        i = (0, t.useMemo)((function() {
                            return {
                                translate: function(e) {
                                    return function(e, t, n) {
                                        if ("string" == typeof n) return n;
                                        if (!n || !Object.hasOwn(n, "$translate")) return console.warn("translateToStringOnly: Unexpected input.", n), "";
                                        var r = n.$translate,
                                            o = n.params,
                                            a = n.wrappers;
                                        if (!a || 0 === Object.keys(a).length) return du(e, t, r, o);
                                        var i = vu(a, o);
                                        return mu((function(n, r) {
                                            return du(e, t, n, r)
                                        }), r, i)
                                    }(n, a, e)
                                },
                                translateToStringOnly: function(e) {
                                    return function(e, t, n) {
                                        if ("string" == typeof n) return n;
                                        if (!n || !Object.hasOwn(n, "$translate")) return console.warn("translateToStringOnly: Unexpected input.", n), "";
                                        var r = n.$translate,
                                            o = n.params,
                                            a = n.wrappers;
                                        return a && Object.keys(a).length > 0 && console.warn("translateToStringOnly: Wrappers provided for key '".concat(r, "' will be ignored. Use translate() if you need wrapper support.")), du(e, t, r, o)
                                    }(n, a, e)
                                }
                            }
                        }), [n, a]);
                    return (0, b.jsx)(hu.Provider, {
                        value: i,
                        children: o
                    })
                },
                bu = function() {
                    var e = (0, t.useContext)(hu);
                    if (!e) throw new Error("Invalid use of `useArTranslation` hook. Ensure your component has an ancestor wrapped in `ArTranslationProvider`");
                    return e
                },
                gu = (0, t.createContext)(void 0),
                wu = function(e) {
                    var t = e.children,
                        n = e.analytics;
                    return (0, b.jsx)(gu.Provider, {
                        value: n,
                        children: t
                    })
                },
                xu = function() {
                    var e = (0, t.useContext)(gu);
                    if (!e) throw new Error("Invalid use of `useAbuseReportAnalytics` hook. Ensure your component has an ancestor wrapped in `AbuseReportAnalyticsProvider`");
                    return e
                },
                Eu = "".concat(Qn.EnvironmentUrls.apiGatewayUrl, "/user-blocking-api/v1/users"),
                Su = function() {
                    var t = Ql(regeneratorRuntime.mark((function t(n) {
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return t.next = 2, e.httpService.post({
                                        url: "".concat(Eu, "/").concat(n, "/block-user"),
                                        withCredentials: !0
                                    });
                                case 2:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e) {
                        return t.apply(this, arguments)
                    }
                }(),
                Ou = function() {
                    var t = Ql(regeneratorRuntime.mark((function t(n) {
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return t.next = 2, e.httpService.post({
                                        url: "".concat(Eu, "/").concat(n, "/unblock-user"),
                                        withCredentials: !0
                                    });
                                case 2:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e) {
                        return t.apply(this, arguments)
                    }
                }(),
                Cu = function() {
                    var t = Ql(regeneratorRuntime.mark((function t(n) {
                        var r;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return t.next = 2, e.httpService.get({
                                        url: "".concat(Eu, "/").concat(n, "/is-blocked"),
                                        withCredentials: !0
                                    });
                                case 2:
                                    return r = t.sent, t.abrupt("return", r.data);
                                case 4:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e) {
                        return t.apply(this, arguments)
                    }
                }(),
                ku = function(e, t) {
                    return e && "object" === tu(e) && "message" in e && "string" == typeof e.message ? e.message : t
                },
                Au = function(e) {
                    return e.OpenDialog = "OpenDialog", e.EarlyClose = "EarlyClose", e.Close = "Close", e.Submit = "Submit", e.SubmitSuccess = "SubmitSuccess", e.SubmitFail = "SubmitFail", e.BackAction = "BackAction", e.NodeDone = "NodeDone", e.SelectItem = "SelectItem", e.IsUserBlockAvailable = "IsUserBlockAvailable", e.DidBlockUser = "DidBlockUser", e.DidUnblockUser = "DidUnblockUser", e.HelplineShown = "HelplineShown", e.HelplineOpened = "HelplineOpened", e.Error = "Error", e
                }(Au || {}),
                Nu = function(e, t, n) {
                    var r = t.abuse_vector,
                        o = t.path,
                        a = Zl(t, ["abuse_vector", "path"]),
                        i = iu(iu({
                            sub_event_type: e,
                            path: o.join(",")
                        }, a), n);
                    Qn.EventStream ? Qn.EventStream.SendEventWithTarget("DynamicAbuseReportEventV2", r, i, Qn.EventStream.TargetTypes.WWW) : console.error("EventStream is not available")
                },
                Pu = function(t, n, r) {
                    return "API Error:".concat(t, ": ").concat(ku(n, r), ". Code: ").concat(e.httpService.parseErrorCode(n))
                },
                Ru = function(e) {
                    var n = e.onNext,
                        r = e.nextButtonText,
                        o = e.message,
                        a = e.blockToggle,
                        i = e.helpline,
                        l = e.title,
                        u = bu(),
                        c = u.translate,
                        s = u.translateToStringOnly,
                        d = function(e) {
                            var n = eu((0, t.useState)(e ? "loading" : "hidden"), 2),
                                r = n[0],
                                o = n[1],
                                a = eu((0, t.useState)(void 0), 2),
                                i = a[0],
                                l = a[1],
                                u = xu(),
                                c = u.sendEvent,
                                s = u.EventName;
                            return (0, t.useEffect)((function() {
                                null != e && e.userId ? (Cu(e.userId).then((function(e) {
                                    o(e ? "hidden" : "visible"), l(e)
                                })).catch((function(e) {
                                    o("hidden"), c(s.Error, {
                                        error_message: Pu("isBlockedUser", e, "Failed to check if user is blocked")
                                    })
                                })), c(s.IsUserBlockAvailable, {})) : o("hidden")
                            }), [null == e ? void 0 : e.userId]), {
                                isBlocked: i,
                                blockToggleState: r,
                                handleBlockToggleChange: function(t) {
                                    null != e && e.userId && (t ? (Su(e.userId).catch((function(e) {
                                        o("error"), c(s.Error, {
                                            error_message: Pu("blockUser", e, "Failed to block user")
                                        })
                                    })), c(s.DidBlockUser, {})) : (Ou(e.userId).catch((function(e) {
                                        o("error"), c(s.Error, {
                                            error_message: Pu("unblockUser", e, "Failed to unblock user")
                                        })
                                    })), c(s.DidUnblockUser, {})), l(t))
                                }
                            }
                        }(a),
                        f = d.isBlocked,
                        p = d.blockToggleState,
                        m = d.handleBlockToggleChange,
                        v = xu(),
                        h = v.sendEvent,
                        y = v.EventName;
                    return (0, t.useEffect)((function() {
                        i && h(y.HelplineShown, {})
                    }), []), (0, b.jsxs)(t.Fragment, {
                        children: [(0, b.jsxs)($n, {
                            className: "padding-bottom-large fill",
                            children: [(0, b.jsx)(Jn, {
                                children: (0, b.jsx)("h3", {
                                    className: "text-heading-medium margin-y-none padding-bottom-medium",
                                    children: c(l)
                                })
                            }), (0, b.jsx)("div", {
                                className: "text-body-small padding-bottom-medium",
                                children: c(o)
                            }), a && "visible" === p && (0, b.jsx)("div", {
                                className: "flex flex-col gap-small padding-xlarge bg-action-standard radius-medium",
                                children: (0, b.jsx)(Tr, {
                                    label: s(a.label),
                                    isDisabled: void 0 === f,
                                    isChecked: Boolean(f),
                                    onCheckedChange: m,
                                    size: "Medium",
                                    placement: "End",
                                    hint: a.description ? s(a.description) : void 0
                                })
                            }), a && "error" === p && (0, b.jsx)("div", {
                                className: "content-system-alert text-body-small padding-bottom-medium",
                                children: c(a.errorLabel)
                            }), i && "loading" !== p && (0, b.jsxs)(t.Fragment, {
                                children: [(0, b.jsx)("p", {
                                    className: "text-caption-medium margin-none padding-y-medium",
                                    children: c(i.heading)
                                }), (0, b.jsx)(Ur, {
                                    as: "a",
                                    onClick: function() {
                                        h(y.HelplineOpened, {})
                                    },
                                    href: i.href,
                                    target: "_blank",
                                    variant: "Standard",
                                    size: "Medium",
                                    className: "width-full",
                                    children: (0, b.jsxs)("div", {
                                        className: "flex gap-small items-center",
                                        children: [(0, b.jsx)(Br, {
                                            name: "icon-regular-arrow-up-right-from-square",
                                            size: "Small"
                                        }), (0, b.jsx)("span", {
                                            children: c(i.buttonText)
                                        })]
                                    })
                                })]
                            })]
                        }), n && (0, b.jsx)(Zn, {
                            children: (0, b.jsx)(Ur, {
                                onClick: n,
                                className: "width-full",
                                children: c(r)
                            })
                        })]
                    })
                },
                ju = function(e) {
                    return Boolean(e)
                },
                Tu = function(e) {
                    var n = e.onNext,
                        r = e.title,
                        o = e.items,
                        a = e.initialValue,
                        i = e.nextButtonText,
                        l = e.required,
                        u = eu((0, t.useState)(a), 2),
                        c = u[0],
                        s = u[1],
                        d = (0, t.useRef)({}),
                        f = (0, t.useRef)(!1),
                        p = bu(),
                        m = p.translate,
                        v = p.translateToStringOnly,
                        h = xu(),
                        y = h.sendEvent,
                        g = h.EventName,
                        w = (0, t.useMemo)((function() {
                            return o.filter(ju)
                        }), [o]),
                        x = eu((0, t.useState)(null), 2),
                        E = x[0],
                        S = x[1];
                    (0, t.useEffect)((function() {
                        if (E) {
                            var e = function() {
                                f.current = !0
                            };
                            return E.addEventListener("scroll", e),
                                function() {
                                    E.removeEventListener("scroll", e)
                                }
                        }
                    }), [E]);
                    return (0, t.useEffect)((function() {
                        if (c) {
                            var e = d.current[c];
                            e && e.scrollIntoView({
                                behavior: "smooth",
                                block: "nearest"
                            })
                        }
                    }), [c]), (0, b.jsxs)(t.Fragment, {
                        children: [(0, b.jsxs)($n, {
                            ref: function(e) {
                                S(e)
                            },
                            className: "padding-bottom-large fill",
                            children: [(0, b.jsx)(Jn, {
                                children: (0, b.jsx)("h3", {
                                    className: "text-heading-medium margin-y-none padding-bottom-medium",
                                    children: m(r)
                                })
                            }), (0, b.jsx)("div", {
                                className: "flex flex-col gap-medium padding-bottom-xlarge [&>*]:[scroll-margin:var(--padding-small)]",
                                children: w.map((function(e) {
                                    return (0, b.jsx)($r, {
                                        ref: function(t) {
                                            d.current[e.id] = t
                                        },
                                        label: v(e.label),
                                        description: e.description ? v(e.description) : void 0,
                                        layout: "Horizontal",
                                        size: "Medium",
                                        type: "Checkmark",
                                        onSelect: function() {
                                            ! function(e) {
                                                var t = w.findIndex((function(t) {
                                                        return t.id === e.id
                                                    })),
                                                    n = !!E && E.scrollHeight > E.clientHeight,
                                                    r = f.current;
                                                y(g.SelectItem, {
                                                    selected_index: t,
                                                    list_length: w.length,
                                                    has_scroll: n,
                                                    did_scroll: r
                                                }), s(e.id)
                                            }(e)
                                        },
                                        isSelected: c === e.id
                                    }, e.id)
                                }))
                            })]
                        }), n && (void 0 !== c || !l) && (0, b.jsx)(Zn, {
                            children: (0, b.jsx)(Ur, {
                                className: "width-full",
                                onClick: function() {
                                    var e = w.find((function(e) {
                                        return e.id === c
                                    }));
                                    n({
                                        selectionId: c,
                                        selectionItem: e
                                    })
                                },
                                children: m(i)
                            })
                        })]
                    })
                },
                _u = function(e) {
                    var n = e.onNext,
                        r = e.nextButtonText,
                        o = e.paragraph,
                        a = e.title,
                        i = bu().translate;
                    return (0, b.jsxs)(t.Fragment, {
                        children: [(0, b.jsxs)($n, {
                            className: "padding-bottom-large fill",
                            children: [(0, b.jsx)(Jn, {
                                children: (0, b.jsx)("h3", {
                                    className: "text-heading-medium margin-y-none padding-bottom-medium",
                                    children: i(a)
                                })
                            }), (0, b.jsx)("div", {
                                className: "text-body-small padding-bottom-medium",
                                children: i(o)
                            })]
                        }), n && (0, b.jsx)(Zn, {
                            children: (0, b.jsx)(Ur, {
                                onClick: n,
                                className: "width-full",
                                children: i(r)
                            })
                        })]
                    })
                },
                Iu = function(e) {
                    var n = e.onNext,
                        r = e.isSubmitting,
                        o = e.title,
                        a = e.textAreaLabel,
                        i = e.initialValue,
                        l = e.placeholder,
                        u = e.nextButtonText,
                        c = eu((0, t.useState)(null != i ? i : ""), 2),
                        s = c[0],
                        d = c[1],
                        f = bu(),
                        p = f.translate,
                        m = f.translateToStringOnly;
                    return (0, b.jsxs)(t.Fragment, {
                        children: [(0, b.jsxs)($n, {
                            className: "padding-bottom-large fill",
                            children: [(0, b.jsx)(Jn, {
                                children: (0, b.jsx)("h3", {
                                    className: "text-heading-medium margin-top-none margin-bottom-small",
                                    children: p(o)
                                })
                            }), (0, b.jsxs)("div", {
                                className: "flex flex-col gap-xsmall",
                                children: [(0, b.jsx)("div", {
                                    className: "text-body-small",
                                    children: p(a)
                                }), (0, b.jsx)(to, {
                                    rows: 6,
                                    placeholder: m(l),
                                    value: s,
                                    onChange: function(e) {
                                        d(e.target.value)
                                    },
                                    isDisabled: r,
                                    size: "Small"
                                })]
                            })]
                        }), n && (0, b.jsx)(Zn, {
                            children: (0, b.jsx)(Ur, {
                                className: "width-full",
                                onClick: function() {
                                    n(s)
                                },
                                isDisabled: r,
                                isLoading: r,
                                children: p(u)
                            })
                        })]
                    })
                },
                Du = function(e) {
                    var t = e.node,
                        n = e.data,
                        r = Zl(e, ["node", "data"]);
                    switch (t.type) {
                        case "list":
                            var o = n[t.formKey],
                                a = "string" == typeof o ? o : void 0;
                            return (0, b.jsx)(Tu, iu(iu(iu({}, t), r), {}, {
                                initialValue: a,
                                onNext: function(e) {
                                    var n, o = e.selectionId,
                                        a = e.selectionItem,
                                        i = lu({}, t.formKey, o),
                                        l = t.storeSelectionAsContext ? lu({}, t.storeSelectionAsContext, a) : {};
                                    null === (n = r.onNext) || void 0 === n || n.call(r, {
                                        data: i,
                                        context: l
                                    })
                                }
                            }));
                        case "comment":
                            var i = n[t.formKey],
                                l = "string" == typeof i ? i : void 0;
                            return (0, b.jsx)(Iu, iu(iu(iu({}, t), r), {}, {
                                initialValue: l,
                                onNext: function(e) {
                                    var n;
                                    null === (n = r.onNext) || void 0 === n || n.call(r, {
                                        data: lu({}, t.formKey, e)
                                    })
                                }
                            }));
                        case "confirmation":
                            return (0, b.jsx)(Ru, iu(iu({}, t), r));
                        case "paragraph":
                            return (0, b.jsx)(_u, iu(iu({}, t), r));
                        default:
                            throw new Error("Unknown step type: ".concat(t.type))
                    }
                },
                Fu = function e(t, n) {
                    if (Array.isArray(t)) return n(t.map((function(t) {
                        return e(t, n)
                    })));
                    if ("object" === tu(t) && null !== t) {
                        for (var r = {}, o = 0, a = Object.entries(t); o < a.length; o++) {
                            var i = eu(a[o], 2),
                                l = i[0],
                                u = i[1];
                            r[l] = e(u, n)
                        }
                        return n(r)
                    }
                    return n(t)
                },
                Mu = function(e, t) {
                    var n = t.split(".").reduce((function(e, t) {
                        return function(e) {
                            return null !== e && "object" === tu(e)
                        }(e) ? e[t] : void 0
                    }), e);
                    return n
                },
                Uu = {
                    is: function(e) {
                        return "$resource" in e && "string" == typeof e.$resource
                    },
                    resolve: function(e, t) {
                        var n;
                        return null === (n = t.resources[e.$resource]) || void 0 === n ? void 0 : n.value
                    }
                },
                Lu = {
                    is: function(e) {
                        return "$attribute" in e && "string" == typeof e.$attribute
                    },
                    resolve: function(e, t) {
                        return t.attributes[e.$attribute]
                    }
                },
                Bu = {
                    is: function(e) {
                        return "$formData" in e && "string" == typeof e.$formData
                    },
                    resolve: function(e, t) {
                        return t.formData[e.$formData]
                    }
                },
                Wu = {
                    is: function(e) {
                        return "$context" in e && "string" == typeof e.$context
                    },
                    resolve: function(e, t) {
                        var n = t.context;
                        return Mu(n, e.$context)
                    }
                },
                zu = {
                    is: function(e) {
                        return "$switch" in e && Array.isArray(e.$switch)
                    },
                    resolve: function(e) {
                        var t, n, r = function(e, t) {
                            var n;
                            if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                                if (Array.isArray(e) || (n = ru(e)) || t && e && "number" == typeof e.length) {
                                    n && (e = n);
                                    var r = 0,
                                        o = function() {};
                                    return {
                                        s: o,
                                        n: function() {
                                            return r >= e.length ? {
                                                done: !0
                                            } : {
                                                done: !1,
                                                value: e[r++]
                                            }
                                        },
                                        e: function(e) {
                                            throw e
                                        },
                                        f: o
                                    }
                                }
                                throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }
                            var a, i = !0,
                                l = !1;
                            return {
                                s: function() {
                                    n = e[Symbol.iterator]()
                                },
                                n: function() {
                                    var e = n.next();
                                    return i = e.done, e
                                },
                                e: function(e) {
                                    l = !0, a = e
                                },
                                f: function() {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (l) throw a
                                    }
                                }
                            }
                        }(e.$switch);
                        try {
                            for (r.s(); !(t = r.n()).done;) {
                                var o = t.value;
                                if ("string" == typeof o) return o;
                                if ((n = o.condition) || 0 === n) return o.value
                            }
                        } catch (e) {
                            r.e(e)
                        } finally {
                            r.f()
                        }
                    }
                },
                Vu = function(e, t) {
                    return Fu(e, (function(e) {
                        if ("object" === tu(e) && e) {
                            if (Uu.is(e)) return Uu.resolve(e, t);
                            if (Lu.is(e)) return Lu.resolve(e, t);
                            if (Bu.is(e)) return Bu.resolve(e, t);
                            if (Wu.is(e)) return Wu.resolve(e, t);
                            if (zu.is(e)) return zu.resolve(e)
                        }
                        return e
                    }))
                },
                Hu = {
                    url: "".concat(Qn.EnvironmentUrls.apiGatewayUrl, "/abuse-reporting/v1/abuse-report"),
                    withCredentials: !0
                },
                Ku = function() {
                    var t = Ql(regeneratorRuntime.mark((function t(n) {
                        var r;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return t.next = 2, e.httpService.post(Hu, n);
                                case 2:
                                    return r = t.sent, t.abrupt("return", r.data);
                                case 4:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e) {
                        return t.apply(this, arguments)
                    }
                }(),
                Gu = Ku,
                qu = function(e, n) {
                    var r = n.onClose,
                        o = n.open,
                        a = n.abuseVector,
                        i = n.targetId,
                        l = eu((0, t.useReducer)(cu, void 0, (function() {
                            var e = Date.now();
                            return uu({
                                runId: su(),
                                initialEnterTime: e
                            })
                        })), 2),
                        u = l[0],
                        c = l[1],
                        s = (0, t.useMemo)((function() {
                            return function(e) {
                                return e.stack.reduce((function(e, t) {
                                    return iu(iu({}, e), t.context)
                                }), {})
                            }(u)
                        }), [u]),
                        d = (0, t.useMemo)((function() {
                            return function(e) {
                                return e.stack.reduce((function(e, t) {
                                    return iu(iu({}, e), t.data)
                                }), {})
                            }(u)
                        }), [u]),
                        f = (0, t.useMemo)((function() {
                            var t = function(e, t) {
                                var n = Vu(e.resources, iu(iu({}, t), {}, {
                                    context: t.context,
                                    formData: t.formData,
                                    attributes: e.attributes,
                                    resources: {}
                                }));
                                return Vu(e, iu(iu({}, t), {}, {
                                    resources: n,
                                    attributes: e.attributes
                                }))
                            }(e, {
                                context: s,
                                formData: d
                            });
                            return t
                        }), [e, s, d]),
                        p = (0, t.useRef)(!0),
                        m = function(e) {
                            var n = e.state,
                                r = e.abuseVector,
                                o = e.targetId;
                            return {
                                sendEvent: (0, t.useCallback)((function(e, t) {
                                    var a = Date.now(),
                                        i = n.openTime ? a - n.openTime : 0,
                                        l = n.stack.map((function(e) {
                                            return e.nodeId
                                        })),
                                        u = {
                                            run_id: n.runId,
                                            abuse_vector: r,
                                            target_id: o,
                                            total_duration: i,
                                            path: l
                                        };
                                    Nu(e, u, t)
                                }), [r, o, n.stack, n.openTime, n.runId]),
                                EventName: Au
                            }
                        }({
                            state: u,
                            abuseVector: a,
                            targetId: i
                        }),
                        v = m.sendEvent;
                    (0, t.useEffect)((function() {
                        var e = u.runId;
                        if (o && !p.current) {
                            e = su();
                            var t = Date.now();
                            c({
                                type: "reset",
                                payload: {
                                    initialEnterTime: t,
                                    runId: e
                                }
                            })
                        }
                        p.current = !1, o && Nu("OpenDialog", {
                            run_id: e,
                            abuse_vector: a,
                            target_id: i,
                            total_duration: 0,
                            path: []
                        }, {})
                    }), [o]);
                    var h = u.stack[u.stack.length - 1];
                    if (!h) throw new Error("No current page found");
                    var y = f.nodes[h.nodeId];
                    if (!y) throw new Error("No node found for nodeId: ".concat(h.nodeId));
                    var g = function() {
                        r(), "completed" !== u.submissionState && u.openTime ? v("EarlyClose", {}) : v("Close", {})
                    };
                    (0, t.useEffect)((function() {
                        if ("gotoNext" === u.navigationState) {
                            var e = function(e) {
                                    var t = Date.now();
                                    "string" == typeof e ? c({
                                        type: "gotoNode",
                                        payload: {
                                            nodeId: e,
                                            enterTime: t
                                        }
                                    }) : "goto" === e.type ? c({
                                        type: "gotoNode",
                                        payload: {
                                            nodeId: e.nodeId,
                                            enterTime: t
                                        }
                                    }) : "link" === e.type ? (window.open(e.href, e.openInNewWindow ? "_blank" : "_self"), g()) : g()
                                },
                                t = function() {
                                    var e = Ql(regeneratorRuntime.mark((function e() {
                                        var t, n, r;
                                        return regeneratorRuntime.wrap((function(e) {
                                            for (;;) switch (e.prev = e.next) {
                                                case 0:
                                                    return t = f.submission, e.next = 3, Gu(t.data);
                                                case 3:
                                                    return n = e.sent, r = n.reportId, e.abrupt("return", r);
                                                case 6:
                                                case "end":
                                                    return e.stop()
                                            }
                                        }), e)
                                    })));
                                    return function() {
                                        return e.apply(this, arguments)
                                    }
                                }(),
                                n = y.next;
                            if ("string" != typeof n && "submitForm" === n.type) {
                                var r = Date.now();
                                v("Submit", {}), c({
                                    type: "startedSubmission"
                                }), t().then((function(t) {
                                    c({
                                        type: "completedSubmission"
                                    }), v("SubmitSuccess", {
                                        submit_api_duration: Date.now() - r,
                                        report_id: t
                                    }), e(n.onSuccess)
                                })).catch((function(t) {
                                    console.error("Error submitting report", t), c({
                                        type: "submissionFailed"
                                    }), v("SubmitFail", {
                                        submit_api_duration: Date.now() - r
                                    }), n.onFailure && e(n.onFailure)
                                }))
                            } else e(n)
                        }
                    }), [u.navigationState]);
                    var w = u.stack.length > 1 && "completed" !== u.submissionState,
                        x = Boolean(y.next),
                        E = (0, t.useMemo)((function() {
                            return {
                                sendEvent: v,
                                EventName: Au
                            }
                        }), [v]);
                    return {
                        config: f,
                        canGoBack: w,
                        goBack: function() {
                            if (w) {
                                var e = Date.now();
                                c({
                                    type: "goBack"
                                }), v("NodeDone", {
                                    node_id: h.nodeId,
                                    node_type: y.type,
                                    node_duration: e - h.enterTime,
                                    node_exit_reason: "back"
                                })
                            }
                        },
                        isSubmitting: "submitting" === u.submissionState,
                        display: f.display,
                        onClose: function() {
                            v("NodeDone", {
                                node_id: h.nodeId,
                                node_type: y.type,
                                node_duration: Date.now() - h.enterTime,
                                node_exit_reason: "back"
                            }), g()
                        },
                        analytics: E,
                        currentPageElement: (0, b.jsx)(Du, {
                            node: y,
                            onNext: x ? function(e) {
                                var t, n, r = Date.now();
                                c({
                                    type: "updateDataAndNavigateNext",
                                    payload: {
                                        data: null !== (t = null == e ? void 0 : e.data) && void 0 !== t ? t : {},
                                        context: null !== (n = null == e ? void 0 : e.context) && void 0 !== n ? n : {}
                                    }
                                }), v("NodeDone", {
                                    node_id: h.nodeId,
                                    node_type: y.type,
                                    node_duration: r - h.enterTime,
                                    node_exit_reason: "next"
                                })
                            } : void 0,
                            data: d,
                            isSubmitting: "submitting" === u.submissionState
                        }, h.nodeId)
                    }
                },
                Xu = function() {
                    var t = Ql(regeneratorRuntime.mark((function t(n, r, o) {
                        var a, i, l;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return a = new URLSearchParams({
                                        abuseVector: r,
                                        targetId: n,
                                        locale: o,
                                        entryPoint: "web"
                                    }), t.next = 3, e.httpService.get({
                                        url: "".concat(Qn.EnvironmentUrls.apiGatewayUrl, "/abuse-reporting/v1/dynamic-config?").concat(a.toString()),
                                        withCredentials: !0
                                    });
                                case 3:
                                    return i = t.sent, l = i.data, t.abrupt("return", l);
                                case 6:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e, n, r) {
                        return t.apply(this, arguments)
                    }
                }(),
                $u = null,
                Yu = function(e, t, n) {
                    var r = JSON.stringify({
                        targetId: e,
                        abuseVector: t,
                        locale: n
                    });
                    if ($u && $u.key === r) return $u.promise;
                    $u && clearTimeout($u.timeoutId);
                    var o = Xu(e, t, n).then((function(e) {
                            return $u && $u.key === r && ($u.data = e), e
                        })).catch((function(e) {
                            throw $u && (clearTimeout($u.timeoutId), $u = null), e
                        })),
                        a = setTimeout((function() {
                            $u && $u.key === r && ($u = null)
                        }), 6e5);
                    return $u = {
                        key: r,
                        promise: o,
                        timeoutId: a
                    }, o
                };

            function Zu() {
                return (Zu = Ql(regeneratorRuntime.mark((function e(t, n) {
                    var r, o;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                o = 1;
                            case 1:
                                if (!(o <= t)) {
                                    e.next = 16;
                                    break
                                }
                                return e.prev = 2, e.next = 5, n();
                            case 5:
                                return e.abrupt("return", e.sent);
                            case 8:
                                if (e.prev = 8, e.t0 = e.catch(2), r = e.t0, o !== t) {
                                    e.next = 13;
                                    break
                                }
                                throw e.t0;
                            case 13:
                                o += 1, e.next = 1;
                                break;
                            case 16:
                                throw r;
                            case 17:
                            case "end":
                                return e.stop()
                        }
                    }), e, null, [
                        [2, 8]
                    ])
                })))).apply(this, arguments)
            }
            var Ju = function(e) {
                    var n = e.open,
                        r = e.onClose,
                        o = e.onCloseAutoFocus,
                        a = (0, t.useMemo)((function() {
                            var e = new Qn.Intl,
                                t = new Qn.TranslationResourceProvider(e),
                                n = t.mergeTranslationResources.apply(t, nu(["CommonUI.Messages", "CommonUI.Controls"].map((function(e) {
                                    return t.getTranslationResource(e)
                                }))));
                            return {
                                message: n.get("Response.UnexpectedError"),
                                title: n.get("Label.Error"),
                                closeLabel: n.get("Action.Close")
                            }
                        }), []),
                        i = a.message,
                        l = a.title,
                        u = a.closeLabel;
                    return (0, b.jsx)(qn, {
                        open: n,
                        onOpenChange: function(e) {
                            e || r()
                        },
                        children: (0, b.jsxs)(Xn, {
                            centerSheetSize: "Medium",
                            closeLabel: u,
                            largeScreenVariant: "center",
                            onCloseAutoFocus: o,
                            children: [(0, b.jsx)(Yn, {
                                children: l
                            }), (0, b.jsx)($n, {
                                children: (0, b.jsx)(Jn, {
                                    children: (0, b.jsx)("div", {
                                        className: "text-body-medium padding-bottom-large",
                                        children: i
                                    })
                                })
                            })]
                        })
                    })
                },
                Qu = function(e) {
                    var n = e.ariaLabel,
                        r = e.title,
                        o = e.text,
                        a = e.buttonLabel,
                        i = e.defaultOpen,
                        l = void 0 !== i && i,
                        u = eu((0, t.useState)(l), 2),
                        c = u[0],
                        s = u[1];
                    return (0, b.jsxs)(Hl, {
                        open: c,
                        onOpenChange: s,
                        children: [(0, b.jsx)(Kl, {
                            asChild: !0,
                            children: (0, b.jsx)(jn, {
                                icon: "icon-regular-circle-i",
                                size: "Medium",
                                variant: "Utility",
                                ariaLabel: n
                            })
                        }), (0, b.jsxs)(Gl, {
                            side: "bottom",
                            align: "end",
                            ariaLabel: n,
                            className: "bg-inverse-surface-0 radius-medium  padding-bottom-medium padding-top-xsmall shadow-transient-low max-width-[295px]",
                            children: [(0, b.jsxs)("div", {
                                className: "flex items-center justify-between  content-inverse-default padding-left-medium padding-right-xsmall",
                                children: [(0, b.jsx)("div", {
                                    className: "text-title-large padding-none margin-none",
                                    children: r
                                }), (0, b.jsx)(jn, {
                                    className: "[&>*]:content-inverse-default",
                                    variant: "Utility",
                                    size: "Medium",
                                    icon: "icon-regular-x",
                                    ariaLabel: "Close",
                                    onClick: function() {
                                        s(!1)
                                    }
                                })]
                            }), (0, b.jsxs)("div", {
                                className: "padding-x-medium",
                                children: [(0, b.jsx)("div", {
                                    className: "text-body-medium content-inverse-default ",
                                    children: o
                                }), a && (0, b.jsx)("div", {
                                    className: "flex flex-col gap-small padding-top-medium",
                                    children: (0, b.jsx)(Ur, {
                                        size: "Small",
                                        variant: "Emphasis",
                                        onClick: function() {
                                            s(!1)
                                        },
                                        children: a
                                    })
                                })]
                            })]
                        })]
                    })
                },
                ec = function(e) {
                    ! function(e, t) {
                        if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function");
                        e.prototype = Object.create(t && t.prototype, {
                            constructor: {
                                value: e,
                                writable: !0,
                                configurable: !0
                            }
                        }), t && Xl(e, t)
                    }(a, e);
                    var t, n, r, o = $l(a);

                    function a(e) {
                        var t;
                        return function(e, t) {
                            if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
                        }(this, a), (t = o.call(this, e)).state = {}, t
                    }
                    return t = a, r = [{
                        key: "getDerivedStateFromError",
                        value: function(e) {
                            return {
                                error: e
                            }
                        }
                    }], (n = [{
                        key: "componentDidCatch",
                        value: function(e, t) {
                            var n, r;
                            null === (n = (r = this.props).onError) || void 0 === n || n.call(r, e, t.componentStack)
                        }
                    }, {
                        key: "render",
                        value: function() {
                            var e = this.state.error,
                                t = this.props,
                                n = t.children,
                                r = t.renderError;
                            return e ? r(e) : n
                        }
                    }]) && ql(t.prototype, n), r && ql(t, r), a
                }(t.Component),
                tc = function(e) {
                    var t = e.abuseVector,
                        n = e.targetIdStr,
                        r = (new Qn.Intl).getRobloxLocale();
                    Yu(n, t, r).then((function() {})).catch((function() {}))
                },
                nc = function(e) {
                    var t, n = e.open,
                        r = e.onClose,
                        o = e.config,
                        a = e.abuseVector,
                        i = e.targetIdStr,
                        l = e.onCloseAutoFocus,
                        u = qu(o, {
                            onClose: r,
                            open: n,
                            abuseVector: a,
                            targetId: i
                        }),
                        c = u.currentPageElement,
                        s = u.onClose,
                        d = u.config,
                        f = u.canGoBack,
                        p = u.goBack,
                        m = u.isSubmitting,
                        v = u.analytics,
                        h = bu(),
                        y = h.translate,
                        g = h.translateToStringOnly,
                        w = d.display.titleDisclosure;
                    return (0, b.jsx)(wu, {
                        analytics: v,
                        children: (0, b.jsx)(qn, {
                            open: n,
                            onOpenChange: function(e) {
                                e || s()
                            },
                            children: (0, b.jsxs)(Xn, {
                                centerSheetSize: "Medium",
                                closeLabel: g(d.display.closeButtonLabel),
                                largeScreenVariant: "center",
                                mobilePortraitClassName: "height-[90vh]",
                                largeScreenClassName: "height-[50vh] min-height-[500px]",
                                onCloseAutoFocus: l,
                                onOpenAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                children: [(0, b.jsx)(Yn, {
                                    navigation: f ? (0, b.jsx)(jn, {
                                        icon: "icon-filled-chevron-large-left",
                                        size: "Medium",
                                        onClick: p,
                                        ariaLabel: "Back",
                                        variant: "Utility",
                                        isDisabled: m
                                    }) : void 0,
                                    utilities: w ? (0, b.jsx)(Qu, {
                                        ariaLabel: g(null !== (t = w.ariaLabel) && void 0 !== t ? t : "More information"),
                                        title: g(w.tooltipTitle),
                                        text: g(w.tooltipText),
                                        buttonLabel: w.buttonLabel && g(w.buttonLabel),
                                        defaultOpen: w.openByDefault
                                    }) : void 0,
                                    children: y(d.display.title)
                                }), c]
                            })
                        })
                    })
                },
                rc = function(e) {
                    var n = e.abuseVector,
                        r = e.targetIdStr,
                        o = e.open,
                        a = e.onClose,
                        i = e.onCloseAutoFocus,
                        l = eu((0, t.useState)(null), 2),
                        u = l[0],
                        c = l[1],
                        s = eu((0, t.useState)(!1), 2),
                        d = s[0],
                        f = s[1];
                    return (0, t.useEffect)((function() {
                        var e = !0;
                        if (o) {
                            var t = (new Qn.Intl).getRobloxLocale();
                            c(null), f(!1),
                                function(e, t) {
                                    return Zu.apply(this, arguments)
                                }(3, (function() {
                                    return Yu(r, n, t)
                                })).then((function(t) {
                                    e && (c(t), f(!1))
                                })).catch((function(t) {
                                    e && f(!0),
                                        function(e, t) {
                                            var n = t.abuse_vector,
                                                r = t.target_id;
                                            Nu("Error", {
                                                run_id: su(),
                                                abuse_vector: n,
                                                target_id: r,
                                                total_duration: 0,
                                                path: []
                                            }, {
                                                error_message: Pu("config", e, "Failed to fetch config")
                                            })
                                        }(t, {
                                            abuse_vector: n,
                                            target_id: r
                                        })
                                }))
                        }
                        return function() {
                            e = !1
                        }
                    }), [o, n, r]), d ? (0, b.jsx)(Ju, {
                        open: o,
                        onClose: a,
                        onCloseAutoFocus: i
                    }) : u ? (0, b.jsx)(ec, {
                        renderError: function() {
                            return (0, b.jsx)(Ju, {
                                open: o,
                                onClose: a,
                                onCloseAutoFocus: i
                            })
                        },
                        onError: function(e, t) {
                            ! function(e, t, n) {
                                var r = n.abuse_vector,
                                    o = n.target_id,
                                    a = ku(e, "Unknown error"),
                                    i = a.length > 500 ? "".concat(a.slice(0, 500), "...") : a,
                                    l = t.length > 500 ? "".concat(t.slice(0, 500), "...") : t;
                                Nu("Error", {
                                    run_id: su(),
                                    abuse_vector: r,
                                    target_id: o,
                                    total_duration: 0,
                                    path: []
                                }, {
                                    error_message: "Error: ".concat(i, "\nStack: ").concat(l)
                                })
                            }(e, t, {
                                abuse_vector: n,
                                target_id: r
                            })
                        },
                        children: (0, b.jsx)(yu, {
                            translations: u.translations,
                            children: (0, b.jsx)(nc, {
                                open: o,
                                onClose: a,
                                config: u,
                                abuseVector: n,
                                targetIdStr: r,
                                onCloseAutoFocus: i
                            })
                        })
                    }) : null
                },
                oc = Qn.EnvironmentUrls.friendsApi,
                ac = Qn.EnvironmentUrls.premiumFeaturesApi,
                ic = Qn.EnvironmentUrls.usersApi,
                lc = Qn.EnvironmentUrls.gamesApi,
                uc = Qn.EnvironmentUrls.contactsApi,
                cc = (Qn.EnvironmentUrls.accountSettingsApi, Qn.EnvironmentUrls.authApi),
                sc = Qn.EnvironmentUrls.tradesApi,
                dc = Qn.EnvironmentUrls.apiGatewayUrl,
                fc = Qn.EnvironmentUrls.chatApi,
                pc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/friends/count"),
                        withCredentials: !0
                    }
                },
                mc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/followings/count"),
                        withCredentials: !0
                    }
                },
                vc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/followers/count"),
                        withCredentials: !0
                    }
                },
                hc = function(e) {
                    return {
                        url: "".concat(ac, "/v1/users/").concat(e, "/validate-membership"),
                        withCredentials: !0
                    }
                },
                yc = function(e) {
                    return {
                        url: "".concat(ic, "/v1/users/").concat(e),
                        withCredentials: !0
                    }
                },
                bc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/friends/statuses"),
                        withCredentials: !0
                    }
                },
                gc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/my/trusted-friends/").concat(e, "/status"),
                        withCredentials: !0
                    }
                },
                wc = function() {
                    return {
                        url: "".concat(fc, "/v1/metadata"),
                        withCredentials: !0
                    }
                },
                xc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/request-friendship"),
                        withCredentials: !0
                    }
                },
                Ec = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/accept-friend-request"),
                        withCredentials: !0
                    }
                },
                Sc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/unfriend"),
                        withCredentials: !0
                    }
                },
                Oc = function() {
                    return {
                        url: "".concat(oc, "/v1/user/following-exists"),
                        withCredentials: !0
                    }
                },
                Cc = function() {
                    return {
                        url: "".concat(uc, "/v1/user/tag"),
                        withCredentials: !0
                    }
                },
                kc = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/follow"),
                        withCredentials: !0
                    }
                },
                Ac = function(e) {
                    return {
                        url: "".concat(oc, "/v1/users/").concat(e, "/unfollow"),
                        withCredentials: !0
                    }
                },
                Nc = function(e) {
                    return {
                        url: "".concat(lc, "/v2/users/").concat(e, "/games"),
                        withCredentials: !0
                    }
                },
                Pc = function(e) {
                    return {
                        url: "".concat(dc, "/user-blocking-api/v1/users/").concat(e, "/block-user"),
                        withCredentials: !0
                    }
                },
                Rc = function(e) {
                    return {
                        url: "".concat(dc, "/user-blocking-api/v1/users/").concat(e, "/unblock-user"),
                        withCredentials: !0
                    }
                },
                jc = function(e) {
                    return {
                        url: "".concat(dc, "/user-blocking-api/v1/users/").concat(e, "/is-blocked"),
                        withCredentials: !0
                    }
                },
                Tc = function() {
                    return {
                        url: "".concat(dc, "/user-blocking-api/v1/users/batch-check-reciprocal-block"),
                        withCredentials: !0
                    }
                },
                _c = function(e) {
                    return {
                        url: "".concat(cc, "/v2/users/").concat(e, "/impersonate"),
                        withCredentials: !0
                    }
                },
                Ic = function(e) {
                    return {
                        url: "".concat(sc, "/v1/users/").concat(e, "/can-trade-with"),
                        withCredentials: !0
                    }
                },
                Dc = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                Fc = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Mc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(Ac(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Uc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(kc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Lc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(Oc(), {
                                        targetUserIds: [t]
                                    })];
                                case 1:
                                    return [2, n.sent().data.followings[0]]
                            }
                        }))
                    }))
                },
                Bc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(Sc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Wc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(Ec(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                zc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        var n;
                        return Fc(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return n = e.urlService.getQueryParam("friendshipSourceType") || "UserProfile", [4, e.httpService.post(xc(t), {
                                        friendshipOriginSourceType: n
                                    })];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        }))
                    }))
                },
                Vc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(gc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Hc = function(t, n) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, e.httpService.get(bc(t), {
                                        userIds: [n]
                                    })];
                                case 1:
                                    return [2, r.sent().data.data[0]]
                            }
                        }))
                    }))
                },
                Kc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(mc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Gc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(vc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                qc = function(t) {
                    return Dc(void 0, void 0, Promise, (function() {
                        return Fc(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(pc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Xc = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                $c = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Yc = function(t) {
                    return Xc(void 0, void 0, Promise, (function() {
                        return $c(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(hc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Zc = {
                    common: ["Feature.Home", "CommonUI.Features", "Feature.BlockingModal"],
                    feature: "Feature.Profile"
                },
                Jc = RobloxThumbnails,
                Qc = function(e) {
                    var t = e.profileUserId,
                        n = e.presenceUrl,
                        o = e.trustedConnection ? "trusted-connection-avatar-headshot" : "";
                    return r().createElement("div", {
                        className: "avatar avatar-headshot-lg card-plain profile-avatar-image"
                    }, r().createElement("span", {
                        className: "avatar-card-link avatar-image-link"
                    }, r().createElement(Jc.Thumbnail2d, {
                        containerClass: "avatar-card-image profile-avatar-thumb " + o,
                        targetId: t,
                        format: Jc.ThumbnailFormat.webp,
                        type: Jc.ThumbnailTypes.avatarHeadshot,
                        size: Jc.ThumbnailBadgeIconSize.size150
                    })), r().createElement("a", {
                        className: "avatar-status",
                        href: n
                    }, r().createElement(p().PresenceStatusIcon, {
                        className: "profile-avatar-status",
                        userId: t
                    })))
                };
            Qc.defaultProps = {
                presenceUrl: ""
            };
            var es, ts = Qc,
                ns = RobloxBadges;
            ! function(e) {
                e.Friends = "Friends", e.NotFriends = "NotFriends", e.RequestSent = "RequestSent", e.RequestReceived = "RequestReceived"
            }(es || (es = {}));
            var rs, os = es;
            ! function(e) {
                e[e.SET_PROFILE_DATA = 0] = "SET_PROFILE_DATA", e[e.UPDATE_FRIEND_COUNT = 1] = "UPDATE_FRIEND_COUNT", e[e.SET_FRIEND_STATUS = 2] = "SET_FRIEND_STATUS", e[e.SET_NAMES = 3] = "SET_NAMES", e[e.SET_ERROR_MESSAGE = 4] = "SET_ERROR_MESSAGE", e[e.UPDATE_FOLLOWERS_COUNT = 5] = "UPDATE_FOLLOWERS_COUNT", e[e.UPDATE_FOLLOWING = 6] = "UPDATE_FOLLOWING", e[e.SHOW_BLOCK_USER_MODAL = 7] = "SHOW_BLOCK_USER_MODAL", e[e.UPDATE_USER_BLOCK = 8] = "UPDATE_USER_BLOCK", e[e.SHOW_ALIAS_EDIT_MODAL = 9] = "SHOW_ALIAS_EDIT_MODAL", e[e.SHOW_ABUSE_REPORT_DIALOG = 10] = "SHOW_ABUSE_REPORT_DIALOG"
            }(rs || (rs = {}));
            var as, is = function() {
                    return is = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, is.apply(this, arguments)
                },
                ls = function(e, t) {
                    switch (t.type) {
                        case rs.SET_PROFILE_DATA:
                            return is(is({}, e), t.data);
                        case rs.UPDATE_FRIEND_COUNT:
                            return is(is({}, e), {
                                friendCount: e.friendCount + t.amount
                            });
                        case rs.SET_FRIEND_STATUS:
                            return is(is({}, e), {
                                friendStatus: t.status
                            });
                        case rs.SET_NAMES:
                            return is(is({}, e), {
                                names: t.names
                            });
                        case rs.SET_ERROR_MESSAGE:
                            return is(is({}, e), {
                                showUserBlockModal: !1,
                                errorMessage: t.message
                            });
                        case rs.UPDATE_FOLLOWERS_COUNT:
                            return is(is({}, e), {
                                followersCount: e.followersCount + t.amount
                            });
                        case rs.UPDATE_FOLLOWING:
                            return is(is({}, e), {
                                isFollowing: t.following
                            });
                        case rs.SHOW_BLOCK_USER_MODAL:
                            return is(is({}, e), {
                                showUserBlockModal: t.show
                            });
                        case rs.SHOW_ALIAS_EDIT_MODAL:
                            return is(is({}, e), {
                                showAliasEditModal: t.show
                            });
                        case rs.SHOW_ABUSE_REPORT_DIALOG:
                            return is(is({}, e), {
                                showAbuseReportDialog: t.show
                            });
                        case rs.UPDATE_USER_BLOCK:
                            return is(is({}, e), {
                                isBlocked: t.block,
                                friendStatus: os.NotFriends,
                                showUserBlockModal: !1
                            });
                        default:
                            throw new Error
                    }
                },
                us = {
                    names: {
                        combinedName: "",
                        username: "",
                        displayName: "",
                        alias: ""
                    },
                    friendCount: 0,
                    followingsCount: 0,
                    followersCount: 0,
                    hasPremiumMembership: !1,
                    hasVerifiedBadge: !1,
                    friendStatus: "",
                    canChat: !1,
                    errorMessage: null,
                    isFollowed: !1,
                    isFollowing: !1,
                    hasFavorites: !1,
                    showUserBlockModal: !1,
                    showAliasEditModal: !1,
                    showAbuseReportDialog: !1,
                    isBlocked: !1,
                    canTradeWith: !1,
                    policies: {
                        userBlockingApiEnabled: 0
                    },
                    mustNotLinkConnections: !0,
                    trustedConnectionStatus: "",
                    canAccessTCIndicatorViaAmpStatus: !1
                },
                cs = (0, t.createContext)({
                    state: us,
                    dispatch: function() {
                        return !0
                    }
                }),
                ss = function(e) {
                    var n = e.children,
                        o = (0, t.useReducer)(ls, us),
                        a = o[0],
                        i = o[1];
                    return r().createElement(cs.Provider, {
                        value: {
                            state: a,
                            dispatch: i
                        }
                    }, n)
                },
                ds = function() {
                    var e = (0, t.useContext)(cs);
                    if (null === e) throw new Error("ProfileHeaderContext was not provided in the current scope");
                    return e
                },
                fs = function(e) {
                    var t, n = e.profileUserId,
                        o = ds().state;
                    o.hasVerifiedBadge ? t = r().createElement("span", {
                        "data-testid": "verified-badge"
                    }, r().createElement(ns.VerifiedBadgeIconContainer, {
                        overrideImgClass: "profile-verified-badge-icon",
                        size: ns.BadgeSizes.TITLE,
                        titleText: n.toString()
                    })) : o.hasPremiumMembership && (t = r().createElement(i.PremiumIcon, {
                        "data-testid": "premium-badge",
                        className: "profile-header-premium-badge"
                    }));
                    var a;
                    return r().createElement("div", {
                        className: "profile-header-names"
                    }, r().createElement("span", {
                        className: "profile-header-title-container"
                    }, r().createElement(i.Typography, {
                        variant: "h1"
                    }, o.names.combinedName), t), r().createElement(i.Typography, {
                        variant: "body1",
                        color: "secondary",
                        className: "profile-header-username"
                    }, (a = o.names.username) ? "@" + a : ""))
                },
                ps = function(t) {
                    var n = t.label,
                        o = t.count,
                        a = t.profileId,
                        l = t.subPage,
                        u = t.isClickable,
                        c = "/users/" + a + "/friends#!/" + l,
                        s = e.abbreviateNumber.getTruncValue(o, 1e3, e.abbreviateNumber.suffixNames.withoutPlus, 1),
                        d = s.indexOf(".0"); - 1 !== d && (s = s.substring(0, d) + s.substring(d + 2));
                    var f = u ? 0 : -1,
                        p = u ? {} : {
                            pointerEvents: "none",
                            cursor: "default"
                        };
                    return r().createElement("li", null, r().createElement("a", {
                        className: "profile-header-social-count",
                        href: e.urlService.getAbsoluteUrl(c),
                        title: o + " " + n,
                        style: p,
                        tabIndex: f
                    }, r().createElement(i.Typography, {
                        variant: "body1"
                    }, r().createElement("b", null, s), " ", r().createElement("span", {
                        className: "profile-header-social-count-label"
                    }, n))))
                },
                ms = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                vs = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                hs = function(t) {
                    return ms(void 0, void 0, Promise, (function() {
                        return vs(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(yc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                ys = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                bs = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                gs = function(t) {
                    return ys(void 0, void 0, Promise, (function() {
                        return bs(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(Nc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                };
            ! function(e) {
                e.Friends = "friends", e.Followers = "followers", e.Following = "following"
            }(as || (as = {}));
            var ws, xs = as,
                Es = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                Ss = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Os = function() {
                    return Es(void 0, void 0, Promise, (function() {
                        var t;
                        return Ss(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(wc())];
                                case 1:
                                    return [2, {
                                        chatEnabled: null == (t = n.sent().data) ? void 0 : t.isChatUserMessagesEnabled
                                    }]
                            }
                        }))
                    }))
                },
                Cs = (Qn.EnvironmentUrls.apiGatewayUrl, function(e) {
                    var t = e.profileUserId,
                        n = e.state;
                    return "/report-abuse/?" + new URLSearchParams({
                        targetId: t.toString(),
                        abuseVector: "userprofile",
                        custom: JSON.stringify({
                            reminder: {
                                title: n.names.displayName && btoa(encodeURIComponent(n.names.displayName)),
                                message: n.names.username && btoa(encodeURIComponent("@" + n.names.username)),
                                thumbnail: {
                                    containerClass: btoa("radius-circle height-1200 width-1200"),
                                    size: btoa(Jc.ThumbnailAvatarHeadshotSize.size48),
                                    targetId: btoa(t.toString()),
                                    type: btoa(Jc.ThumbnailTypes.avatarHeadshot)
                                }
                            }
                        })
                    }).toString()
                }),
                ks = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                As = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Ns = function(t) {
                    return ks(void 0, void 0, Promise, (function() {
                        return As(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(Pc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Ps = function(t) {
                    return ks(void 0, void 0, Promise, (function() {
                        return As(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(Rc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Rs = function(t) {
                    return ks(void 0, void 0, Promise, (function() {
                        return As(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(jc(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                js = function(t) {
                    return ks(void 0, void 0, Promise, (function() {
                        var n;
                        return As(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return n = parseInt(Qn.CurrentUser.userId, 10), Number.isNaN(n) || !n ? [2, {
                                        users: [{
                                            isBlocked: !1,
                                            isBlockingViewer: !1,
                                            userId: 0
                                        }]
                                    }] : [4, e.httpService.post(Tc(), {
                                        userIds: t,
                                        requesterUserId: n
                                    })];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        }))
                    }))
                };
            ! function(e) {
                e[e.InvalidTarget = 0] = "InvalidTarget", e[e.TargetAlreadyBlocked = 1] = "TargetAlreadyBlocked", e[e.BlockLimitExceeded = 2] = "BlockLimitExceeded", e[e.BlockingDisabled = 3] = "BlockingDisabled", e[e.TargetNotBlocked = 4] = "TargetNotBlocked", e[e.UserUnblockable = 5] = "UserUnblockable", e[e.UserNotLoggedIn = 6] = "UserNotLoggedIn", e[e.Invalid = 7] = "Invalid", e[e.NoAuthenticatedUser = 8] = "NoAuthenticatedUser", e[e.NoBrowserTrackerId = 9] = "NoBrowserTrackerId", e[e.UserIdMismatch = 10] = "UserIdMismatch", e[e.MissingRequesterUserId = 11] = "MissingRequesterUserId", e[e.NotRccRequest = 12] = "NotRccRequest", e[e.UserCannotBlock = 13] = "UserCannotBlock", e[e.ParentManaged = 14] = "ParentManaged", e[e.NotLinked = 15] = "NotLinked", e[e.BlockedOnPlatform = 16] = "BlockedOnPlatform"
            }(ws || (ws = {}));
            var Ts, _s = ws,
                Is = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                Ds = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Fs = function(e, n) {
                    void 0 === n && (n = !0);
                    var r = (0, t.useState)(!0),
                        o = r[0],
                        a = r[1],
                        i = (0, t.useState)(null),
                        l = i[0],
                        u = i[1];
                    return (0, t.useEffect)((function() {
                        (function(e) {
                            return Is(void 0, void 0, Promise, (function() {
                                return Ds(this, (function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return (null === Qn.ExperimentationService || void 0 === Qn.ExperimentationService ? void 0 : Qn.ExperimentationService.getAllValuesForLayer) ? [4, Qn.ExperimentationService.getAllValuesForLayer(e)] : [3, 2];
                                        case 1:
                                            return [2, t.sent()];
                                        case 2:
                                            return [2, {}]
                                    }
                                }))
                            }))
                        })(e).then((function(e) {
                            u(e)
                        })).catch((function() {
                            u(null)
                        })).finally((function() {
                            a(!1)
                        }))
                    }), [e]), (0, t.useEffect)((function() {
                        l && n && (null === Qn.ExperimentationService || void 0 === Qn.ExperimentationService ? void 0 : Qn.ExperimentationService.logLayerExposure) && Qn.ExperimentationService.logLayerExposure(e)
                    }), [n, l, e]), {
                        loading: o,
                        data: l
                    }
                },
                Ms = function() {
                    var e = Fs("Safety.AbuseReportDialog", !1).data;
                    return Boolean(e && !!e.enableARDialog)
                },
                Us = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                Ls = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Bs = function(e) {
                    var n = e.translate,
                        o = e.profileUserId,
                        a = ds(),
                        u = a.state,
                        c = a.dispatch,
                        s = u.names.combinedName || "",
                        f = Ms(),
                        p = function() {
                            c({
                                type: rs.SHOW_BLOCK_USER_MODAL,
                                show: !1
                            })
                        },
                        m = function() {
                            return Us(void 0, void 0, void 0, (function() {
                                var e;
                                return Ls(this, (function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return t.trys.push([0, 2, , 3]), [4, Ns(o)];
                                        case 1:
                                            return t.sent(), c({
                                                type: rs.UPDATE_USER_BLOCK,
                                                block: !0
                                            }), e = [d.UserProfileField.Names.CombinedName, d.UserProfileField.Names.Username, d.UserProfileField.Names.DisplayName, d.UserProfileField.Names.Alias], (0, d.writeQuery)(o, e, {
                                                names: {
                                                    alias: null,
                                                    combinedName: u.names.displayName,
                                                    displayName: u.names.displayName,
                                                    username: u.names.username
                                                }
                                            }), [3, 3];
                                        case 2:
                                            return t.sent(), c({
                                                type: rs.SET_ERROR_MESSAGE,
                                                message: n(l.translationKeys.error.blockFailed)
                                            }), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                }))
                            }))
                        };
                    (0, t.useEffect)((function() {
                        u.showUserBlockModal && f && tc({
                            abuseVector: "user_profile",
                            targetIdStr: o.toString()
                        })
                    }), [u.showUserBlockModal]);
                    var v = l.translationKeys.modal.block,
                        h = l.translationKeys.modal.unblock;
                    return u.showUserBlockModal ? u.isBlocked ? r().createElement(i.Dialog, {
                        open: u.showUserBlockModal,
                        onClose: p
                    }, r().createElement(i.DialogTitle, null, n(h.title, {
                        DisplayName: s
                    })), r().createElement(i.DialogContent, null, r().createElement(i.DialogContentText, null, n(h.body))), r().createElement(i.DialogActions, null, r().createElement(i.Button, {
                        color: "primary",
                        variant: "text",
                        onClick: p
                    }, n(h.cancelButton)), r().createElement(i.Button, {
                        color: "primaryBrand",
                        variant: "contained",
                        onClick: function() {
                            return Us(void 0, void 0, void 0, (function() {
                                var e, t;
                                return Ls(this, (function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return r.trys.push([0, 2, , 3]), [4, Ps(o)];
                                        case 1:
                                            return r.sent(), c({
                                                type: rs.UPDATE_USER_BLOCK,
                                                block: !1
                                            }), [3, 3];
                                        case 2:
                                            switch (e = r.sent(), t = n(l.translationKeys.error.blockRequestFailed), e.data) {
                                                case _s.BlockLimitExceeded:
                                                    t = n(l.translationKeys.error.blockLimitExceeded);
                                                    break;
                                                case _s.TargetAlreadyBlocked:
                                                    t = n(l.translationKeys.error.targetAlreadyBlocked);
                                                    break;
                                                case _s.ParentManaged:
                                                    t = n(l.translationKeys.error.parentManaged);
                                                    break;
                                                case _s.TargetNotBlocked:
                                                    t = n(l.translationKeys.error.targetNotBlocked);
                                                    break;
                                                case _s.BlockedOnPlatform:
                                                    t = n(l.translationKeys.error.blockedOnPlatform)
                                            }
                                            return c({
                                                type: rs.SET_ERROR_MESSAGE,
                                                message: t
                                            }), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                }))
                            }))
                        }
                    }, n(h.unblockButton)))) : r().createElement(i.Dialog, {
                        open: u.showUserBlockModal,
                        onClose: p
                    }, r().createElement(i.DialogTitle, null, n(v.title, {
                        DisplayName: s
                    })), r().createElement(i.DialogContent, null, r().createElement(i.DialogContentText, null, r().createElement("span", {
                        dangerouslySetInnerHTML: {
                            __html: n(v.body)
                        }
                    }))), r().createElement(i.DialogActions, null, r().createElement(i.Button, {
                        color: "destructive",
                        variant: "outlined",
                        onClick: m
                    }, n(v.blockButton)), r().createElement(i.Button, {
                        color: "destructive",
                        variant: "outlined",
                        onClick: function() {
                            return Us(void 0, void 0, void 0, (function() {
                                return Ls(this, (function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, m()];
                                        case 1:
                                            return e.sent(), f ? c({
                                                type: rs.SHOW_ABUSE_REPORT_DIALOG,
                                                show: !0
                                            }) : window.location.href = Cs({
                                                profileUserId: o,
                                                state: u
                                            }), [2]
                                    }
                                }))
                            }))
                        }
                    }, n(v.blockAndReportButton)), r().createElement(i.Button, {
                        color: "primary",
                        variant: "text",
                        onClick: p
                    }, n(v.cancelButton)))) : null
                },
                Ws = ReactStyleGuide,
                zs = n(452),
                Vs = n.n(zs),
                Hs = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                Ks = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Gs = function(t, n) {
                    return Hs(void 0, void 0, Promise, (function() {
                        return Ks(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, e.httpService.post(Cc(), {
                                        targetUserId: t,
                                        userTag: n
                                    })];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        }))
                    }))
                },
                qs = function(e) {
                    var n = e.currName,
                        o = e.currTextCount,
                        a = e.placeHolderText,
                        i = e.errorText,
                        u = e.inputClassNames,
                        c = e.fireMaxLimitAlias,
                        s = e.fireClearedAlias,
                        d = e.setHasErrored,
                        f = (0, t.useState)(n),
                        p = f[0],
                        m = f[1],
                        v = (0, t.useState)(o),
                        h = v[0],
                        y = v[1],
                        b = h + "/" + l.maxCharactersForAlias;
                    return r().createElement("div", {
                        className: u
                    }, r().createElement("input", {
                        className: "form-control input-field",
                        id: "aliasInputBox",
                        onChange: function(e) {
                            var t, n = e.currentTarget.value,
                                r = (t = n, Array.from(t).length);
                            if (r > l.maxCharactersForAlias) {
                                if (h === l.maxCharactersForAlias) return;
                                n = Array.from(n).slice(0, l.maxCharactersForAlias).join(""), r = l.maxCharactersForAlias
                            }
                            m(n), y(r), r === l.maxCharactersForAlias && c(n), 0 === r && s(), d(!1)
                        },
                        value: p,
                        placeholder: a
                    }), r().createElement("div", {
                        className: "clearfix font-caption-body change-alias-feedback-container"
                    }, r().createElement("span", {
                        className: "count-down"
                    }, b), r().createElement("span", {
                        className: "form-control-label"
                    }, i)))
                },
                Xs = function(e) {
                    var n = e.translate,
                        o = e.profileUserId,
                        a = ds(),
                        i = a.state,
                        u = a.dispatch,
                        c = (0, Ws.createModal)(),
                        s = c[0],
                        f = c[1],
                        p = function() {
                            u({
                                type: rs.SHOW_ALIAS_EDIT_MODAL,
                                show: !1
                            })
                        },
                        m = (0, t.useState)(""),
                        v = m[0],
                        h = m[1],
                        y = (0, t.useState)(0),
                        b = y[0],
                        g = y[1],
                        w = (0, t.useState)(!1),
                        x = w[0],
                        E = w[1],
                        S = x ? n(l.translationKeys.invalidAlias) : "",
                        O = n(l.translationKeys.customizeNamePlaceholder),
                        C = n(l.translationKeys.setCustomName) + " ",
                        k = n(l.translationKeys.recognizeFriends),
                        A = n(l.translationKeys.customizeName),
                        N = r().useCallback((function() {
                            Qn.EventStream.SendEventWithTarget(l.eventNames.modalOpen, l.eventCtx.customizeName, {
                                origin: "userProfile",
                                playerId: o.toString()
                            }, Qn.EventStream.TargetTypes.WWW)
                        }), [o]),
                        P = r().useCallback((function() {
                            Qn.EventStream.SendEventWithTarget(l.eventNames.buttonClick, l.eventCtx.customizeName, {
                                btn: l.eventBtns.closeCustomName,
                                playerId: o.toString()
                            }, Qn.EventStream.TargetTypes.WWW)
                        }), [o]),
                        R = r().useCallback((function() {
                            var e;
                            h(i.names.alias || ""), g((e = i.names.alias || "", Array.from(e).length)), E(!1)
                        }), [i.names.alias]),
                        j = r().useCallback((function() {
                            R(), f.close(), P(), setTimeout((function() {
                                document.activeElement.blur()
                            }))
                        }), [f, P, R]),
                        T = r().useCallback((function() {
                            f.open(), N()
                        }), [f, N]),
                        _ = Vs()("form-group", {
                            "form-has-error": x,
                            "form-has-feedback": !0
                        }),
                        I = [d.UserProfileField.Names.CombinedName, d.UserProfileField.Names.Username, d.UserProfileField.Names.DisplayName, d.UserProfileField.Names.Alias],
                        D = function(e) {
                            Gs(o, e).then((function(t) {
                                "Success" === t.status ? ("" === e ? (0, d.writeQuery)(o, I, {
                                    names: {
                                        alias: e,
                                        combinedName: i.names.displayName,
                                        displayName: i.names.displayName,
                                        username: i.names.username
                                    }
                                }) : (0, d.writeQuery)(o, I, {
                                    names: {
                                        alias: e,
                                        combinedName: e,
                                        displayName: i.names.displayName,
                                        username: i.names.username
                                    }
                                }), function(e) {
                                    Qn.EventStream.SendEventWithTarget(l.eventNames.buttonClick, l.eventCtx.customizeName, {
                                        btn: l.eventBtns.saveAlias,
                                        alias: e,
                                        playerId: o.toString()
                                    }, Qn.EventStream.TargetTypes.WWW)
                                }(e), p()) : (! function(e) {
                                    Qn.EventStream.SendEventWithTarget(l.eventNames.customNameInvalidInput, l.eventCtx.customizeName, {
                                        alias: e,
                                        playerId: o.toString()
                                    }, Qn.EventStream.TargetTypes.WWW)
                                }(e), E(!0))
                            }), (function() {
                                E(!0)
                            }))
                        };
                    return (0, t.useEffect)((function() {
                        i.showAliasEditModal ? T() : j()
                    }), [j, T, i.showAliasEditModal]), i.showAliasEditModal ? r().createElement(s, {
                        title: A,
                        body: r().createElement("div", {
                            className: "change-alias-modal"
                        }, r().createElement("div", {
                            className: "text-label"
                        }, r().createElement("span", null, C), r().createElement("span", {
                            className: "change-alias-bolded"
                        }, i.names.displayName)), r().createElement("div", {
                            className: "change-alias-description"
                        }, k), r().createElement(qs, {
                            currName: v,
                            currTextCount: b,
                            placeHolderText: O,
                            errorText: S,
                            inputClassNames: _,
                            fireMaxLimitAlias: function(e) {
                                Qn.EventStream.SendEventWithTarget(l.eventNames.customNameMaxLimit, l.eventCtx.customizeName, {
                                    alias: e,
                                    playerId: o.toString()
                                }, Qn.EventStream.TargetTypes.WWW)
                            },
                            fireClearedAlias: function() {
                                Qn.EventStream.SendEventWithTarget(l.eventNames.customNameClearedInput, l.eventCtx.customizeName, {
                                    playerId: o.toString()
                                }, Qn.EventStream.TargetTypes.WWW)
                            },
                            setHasErrored: E
                        })),
                        actionButtonShow: !0,
                        disableActionButton: x,
                        actionButtonText: n(l.translationKeys.save),
                        neutralButtonText: n(l.translationKeys.cancel),
                        onNeutral: function() {
                            p()
                        },
                        onAction: function() {
                            var e = document.getElementById("aliasInputBox"),
                                t = (null == e ? void 0 : e.value) || "";
                            D(t)
                        }
                    }) : null
                },
                $s = function(e) {
                    var n = e.buttons,
                        o = e.translate,
                        a = e.onDropdownWillOpen,
                        u = (0, t.useState)(null),
                        c = u[0],
                        s = u[1];
                    return r().createElement(r().Fragment, null, r().createElement(i.IconButton, {
                        "aria-label": o(l.translationKeys.buttons.openDropdown),
                        size: "medium",
                        variant: "default",
                        color: "default",
                        className: "profile-header-dropdown",
                        onClick: function(e) {
                            s(e.currentTarget), a && a()
                        }
                    }, r().createElement(i.MoreHorizIcon, {
                        className: "profile-header-more-icon"
                    })), r().createElement(i.Menu, {
                        id: "profile-header-dropdown-menu",
                        variant: "menu",
                        anchorEl: c,
                        open: null != c,
                        onClose: function() {
                            return s(null)
                        }
                    }, n.map((function(e) {
                        var t = e.id,
                            n = e.onClick,
                            a = e.label;
                        return r().createElement(i.MenuItem, {
                            onClick: function() {
                                s(null), n()
                            },
                            key: a,
                            id: t
                        }, r().createElement("span", {
                            className: "profile-header-dropdown-label"
                        }, o(a)))
                    }))))
                },
                Ys = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                Zs = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Js = function(t) {
                    return Ys(void 0, void 0, Promise, (function() {
                        return Zs(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.post(_c(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                Qs = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                ed = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                td = function(e) {
                    var t, n = e.profileUserId,
                        o = e.translate,
                        a = ds(),
                        i = a.state,
                        u = a.dispatch,
                        c = s.authenticatedUser.id,
                        d = n === c,
                        f = -1 !== c,
                        p = Qn.Endpoints.getAbsoluteUrl("/login"),
                        m = Qn.Endpoints.getAbsoluteUrl("/users/" + n + "/inventory/"),
                        v = Qn.Endpoints.getAbsoluteUrl("/users/" + n + "/favorites#!/places"),
                        h = Qn.Endpoints.getAbsoluteUrl("/home"),
                        y = "true" === (null === (t = document.querySelector("div[data-mayimpersonate]")) || void 0 === t ? void 0 : t.getAttribute("data-mayimpersonate")),
                        b = Ms(),
                        g = [{
                            id: "customize-name-button",
                            label: l.translationKeys.customizeName,
                            visible: i.friendStatus === os.Friends,
                            onClick: function() {
                                u({
                                    type: rs.SHOW_ALIAS_EDIT_MODAL,
                                    show: !0
                                })
                            }
                        }, {
                            id: "follow-button",
                            label: l.translationKeys.dropdown.follow,
                            visible: !d && !i.isFollowing && !i.isBlocked,
                            onClick: function() {
                                return Qs(void 0, void 0, void 0, (function() {
                                    return ed(this, (function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, Uc(n)];
                                            case 1:
                                                return e.sent().success && (u({
                                                    type: rs.UPDATE_FOLLOWERS_COUNT,
                                                    amount: 1
                                                }), u({
                                                    type: rs.UPDATE_FOLLOWING,
                                                    following: !0
                                                })), [3, 3];
                                            case 2:
                                                return e.sent(), u({
                                                    type: rs.SET_ERROR_MESSAGE,
                                                    message: o(l.translationKeys.error.followFailed)
                                                }), [3, 3];
                                            case 3:
                                                return [2]
                                        }
                                    }))
                                }))
                            }
                        }, {
                            id: "unfollow-button",
                            label: l.translationKeys.dropdown.unfollow,
                            visible: !d && i.isFollowing && !i.isBlocked,
                            onClick: function() {
                                return Qs(void 0, void 0, void 0, (function() {
                                    return ed(this, (function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return c ? [3, 1] : (window.location.href = p, [3, 4]);
                                            case 1:
                                                return e.trys.push([1, 3, , 4]), [4, Mc(n)];
                                            case 2:
                                                return e.sent(), u({
                                                    type: rs.UPDATE_FOLLOWERS_COUNT,
                                                    amount: -1
                                                }), u({
                                                    type: rs.UPDATE_FOLLOWING,
                                                    following: !1
                                                }), [3, 4];
                                            case 3:
                                                return e.sent(), u({
                                                    type: rs.SET_ERROR_MESSAGE,
                                                    message: o(l.translationKeys.error.unfollowFailed)
                                                }), [3, 4];
                                            case 4:
                                                return [2]
                                        }
                                    }))
                                }))
                            }
                        }, {
                            id: "trade-button",
                            label: l.translationKeys.dropdown.tradeItems,
                            visible: !i.isBlocked && i.canTradeWith,
                            onClick: function() {
                                Qn.EventStream.SendEventWithTarget(l.eventNames.tradeEntryPoint, l.eventCtx.profileMenu, {
                                    partnerId: n.toString()
                                }, Qn.EventStream.TargetTypes.WWW), window.location.href = Qn.Endpoints.getAbsoluteUrl("/users/" + n + "/trade")
                            }
                        }, {
                            id: "block-button",
                            label: i.isBlocked ? l.translationKeys.dropdown.unblockUser : l.translationKeys.dropdown.blockUser,
                            visible: !d && f,
                            onClick: function() {
                                u({
                                    type: rs.SHOW_BLOCK_USER_MODAL,
                                    show: !0
                                })
                            }
                        }, {
                            id: "inventory-button",
                            label: l.translationKeys.dropdown.inventory,
                            visible: 1 !== n,
                            onClick: function() {
                                window.location.href = m
                            }
                        }, {
                            id: "favorites-button",
                            label: l.translationKeys.dropdown.favorites,
                            visible: i.hasFavorites,
                            onClick: function() {
                                window.location.href = v
                            }
                        }, {
                            id: "impersonate-button",
                            label: l.translationKeys.dropdown.impersonateUser,
                            visible: y,
                            onClick: function() {
                                return Qs(void 0, void 0, void 0, (function() {
                                    return ed(this, (function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, Js(n)];
                                            case 1:
                                                return e.sent(), window.location.href = h, [3, 3];
                                            case 2:
                                                return e.sent(), u({
                                                    type: rs.SET_ERROR_MESSAGE,
                                                    message: o(l.translationKeys.error.impersonateUserFailed)
                                                }), [3, 3];
                                            case 3:
                                                return [2]
                                        }
                                    }))
                                }))
                            }
                        }, {
                            id: "report-abuse-button",
                            label: l.translationKeys.dropdown.reportAbuse,
                            visible: !d,
                            onClick: function() {
                                if (b) u({
                                    type: rs.SHOW_ABUSE_REPORT_DIALOG,
                                    show: !0
                                });
                                else {
                                    var e = Cs({
                                        profileUserId: n,
                                        state: i
                                    });
                                    window.location.href = e
                                }
                            }
                        }].filter((function(e) {
                            return e.visible
                        }));
                    return r().createElement($s, {
                        translate: o,
                        buttons: g,
                        onDropdownWillOpen: function() {
                            b && !d && tc({
                                abuseVector: "user_profile",
                                targetIdStr: n.toString()
                            })
                        }
                    })
                },
                nd = function(t) {
                    var n = t.profileUserId,
                        o = t.isMyProfile,
                        a = t.canBeFollowed,
                        u = t.translate,
                        c = t.sendFriendRequest,
                        s = t.acceptFriendRequest,
                        d = t.removeFriend,
                        f = t.startChat,
                        p = t.launchGame,
                        m = ds().state,
                        v = e.urlService.getAbsoluteUrl("/users/" + n + "/friends#!"),
                        h = null;
                    o || (m.friendStatus === os.RequestReceived ? h = r().createElement(i.Button, {
                        id: "friend-button",
                        color: "secondary",
                        size: "medium",
                        variant: "outlined",
                        "data-target-user-id": n,
                        "data-friends-url": v,
                        onClick: s
                    }, u(l.translationKeys.buttons.accept)) : m.friendStatus === os.NotFriends ? h = r().createElement(i.Button, {
                        id: "friend-button",
                        color: "secondary",
                        size: "medium",
                        variant: "outlined",
                        onClick: c,
                        disabled: m.isBlocked
                    }, u(l.translationKeys.buttons.addConnection)) : m.friendStatus === os.RequestSent ? h = r().createElement(i.Button, {
                        id: "friend-button",
                        color: "secondary",
                        size: "medium",
                        variant: "contained",
                        disabled: !0
                    }, u(l.translationKeys.buttons.pending)) : m.friendStatus === os.Friends && (h = r().createElement(i.Button, {
                        id: "unfriend-button",
                        color: "secondary",
                        size: "medium",
                        variant: "outlined",
                        "data-target-user-id": n,
                        onClick: d
                    }, u(l.translationKeys.buttons.removeConnection))));
                    var y = !o && m.canChat && m.friendStatus === os.Friends ? r().createElement(i.Button, {
                            id: "chat-button",
                            color: "secondary",
                            size: "medium",
                            variant: "contained",
                            onClick: f
                        }, u(l.translationKeys.buttons.chat)) : null,
                        b = a && "" !== m.friendStatus ? r().createElement(i.Button, {
                            id: "join-game-button",
                            color: "primaryBrand",
                            size: "medium",
                            variant: "contained",
                            onClick: p
                        }, u(l.translationKeys.buttons.joinGame)) : null;
                    return r().createElement("div", {
                        className: "profile-header-buttons"
                    }, b, y, h, r().createElement(td, {
                        translate: u,
                        profileUserId: n
                    }))
                },
                rd = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                od = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                ad = function(e) {
                    var t = e.id,
                        n = e.profileUserId,
                        o = e.translate,
                        a = ds().dispatch,
                        i = p().usePresence(n, void 0),
                        u = Qn.Endpoints.getAbsoluteUrl("/login"),
                        s = n === t,
                        d = !s && i.userPresenceType === p().PresenceType.Game && null != i.rootPlaceId;
                    return r().createElement(nd, {
                        profileUserId: n,
                        isMyProfile: s,
                        canBeFollowed: d,
                        sendFriendRequest: function() {
                            return rd(void 0, void 0, void 0, (function() {
                                return od(this, (function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t ? [3, 1] : (window.location.href = u, [3, 4]);
                                        case 1:
                                            return e.trys.push([1, 3, , 4]), [4, zc(n)];
                                        case 2:
                                            return !0 === e.sent().success ? (Qn.EventStream.SendEventWithTarget(l.eventNames.playerFriendAdd, l.eventCtx.userProfile, {
                                                uid: t.toString(),
                                                playerId: n.toString()
                                            }, Qn.EventStream.TargetTypes.WWW), a({
                                                type: rs.SET_FRIEND_STATUS,
                                                status: os.RequestSent
                                            })) : a({
                                                type: rs.SET_ERROR_MESSAGE,
                                                message: o(l.translationKeys.error.sendConnectionRequestFailed)
                                            }), [3, 4];
                                        case 3:
                                            return e.sent(), a({
                                                type: rs.SET_ERROR_MESSAGE,
                                                message: o(l.translationKeys.error.sendConnectionRequestFailed)
                                            }), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        acceptFriendRequest: function() {
                            return rd(void 0, void 0, void 0, (function() {
                                return od(this, (function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t ? [3, 1] : (window.location.href = u, [3, 4]);
                                        case 1:
                                            return e.trys.push([1, 3, , 4]), [4, Wc(n)];
                                        case 2:
                                            return e.sent(), Qn.EventStream.SendEventWithTarget(l.eventNames.playerFriendAccept, l.eventCtx.userProfile, {
                                                uid: t.toString(),
                                                playerId: n.toString()
                                            }, Qn.EventStream.TargetTypes.WWW), a({
                                                type: rs.SET_FRIEND_STATUS,
                                                status: os.Friends
                                            }), a({
                                                type: rs.UPDATE_FRIEND_COUNT,
                                                amount: 1
                                            }), [3, 4];
                                        case 3:
                                            return e.sent(), a({
                                                type: rs.SET_ERROR_MESSAGE,
                                                message: o(l.translationKeys.error.acceptFriendRequestFailed)
                                            }), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        removeFriend: function() {
                            return rd(void 0, void 0, void 0, (function() {
                                return od(this, (function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return t ? [3, 1] : (window.location.href = u, [3, 4]);
                                        case 1:
                                            return e.trys.push([1, 3, , 4]), [4, Bc(n)];
                                        case 2:
                                            return e.sent(), a({
                                                type: rs.SET_FRIEND_STATUS,
                                                status: os.NotFriends
                                            }), a({
                                                type: rs.UPDATE_FRIEND_COUNT,
                                                amount: -1
                                            }), [3, 4];
                                        case 3:
                                            return e.sent(), a({
                                                type: rs.SET_ERROR_MESSAGE,
                                                message: o(l.translationKeys.error.removeFriendFailed)
                                            }), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        startChat: function() {
                            c.chatService.startDesktopAndMobileWebChat({
                                userId: n
                            })
                        },
                        launchGame: function() {
                            return rd(void 0, void 0, void 0, (function() {
                                var e;
                                return od(this, (function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return e = i.gameId || "", (0, Qn.DeviceMeta)().isInApp ? ((0, Qn.DeviceMeta)().isDesktop ? Qn.GameLauncher.followPlayerIntoGame(n, e, "JoinUser") : window.location.href = "/games/start?userID=" + n + "&joinAttemptId=" + e + "&joinAttemptOrigin=JoinUser", [3, 5]) : [3, 1];
                                        case 1:
                                            return (0, Qn.DeviceMeta)().isAndroidDevice || (0, Qn.DeviceMeta)().isChromeOs ? (window.location.href = "intent://userId=" + n + "&joinAttemptId=" + e + "&joinAttemptOrigin=JoinUser#Intent;scheme=robloxmobile;package=com.roblox.client;S.browser_fallback_url=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.roblox.client;end", [3, 5]) : [3, 2];
                                        case 2:
                                            return (0, Qn.DeviceMeta)().isIosDevice ? (window.location.href = "robloxmobile://userId=" + n + "&joinAttemptId=" + e + "&joinAttemptOrigin=JoinUser", [3, 5]) : [3, 3];
                                        case 3:
                                            return [4, Qn.ProtocolHandlerClientInterface.followPlayerIntoGame({
                                                userId: n,
                                                joinAttemptId: e,
                                                joinAttemptOrigin: "JoinUser"
                                            })];
                                        case 4:
                                            t.sent(), t.label = 5;
                                        case 5:
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        translate: o
                    })
                },
                id = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                ld = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                ud = function(t) {
                    return id(void 0, void 0, Promise, (function() {
                        return ld(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, e.httpService.get(Ic(t))];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                cd = function(e) {
                    void 0 === e && (e = {
                        baseUrl: ""
                    }), this.configuration = e, this.baseUrl = this.configuration.baseUrl
                },
                sd = function() {
                    function e(e) {
                        void 0 === e && (e = new cd), this.configuration = e, this.baseUrl = e.baseUrl
                    }
                    return e.prototype.sendEvent = function(e) {
                        var t = e.localTime,
                            n = e.target,
                            r = e.eventType,
                            o = e.context,
                            a = e.additionalProperties,
                            i = e.currentUrl,
                            l = e.guestId,
                            u = e.sessionId,
                            c = t.toISOString(),
                            s = new URL("".concat(this.baseUrl, "/pe"));
                        return s.searchParams.append("t", n), s.searchParams.append("evt", r), s.searchParams.append("ctx", o), s.searchParams.append("lt", c), s.searchParams.append("url", i || window.location.href), void 0 !== l && s.searchParams.append("gid", l), void 0 !== u && s.searchParams.append("sid", u), void 0 !== a && Object.keys(a).forEach((function(e) {
                            var t;
                            s.searchParams.append(e, (null !== (t = a[e]) && void 0 !== t ? t : "").toString())
                        })), fetch(s.href, {
                            credentials: "same-origin"
                        })
                    }, e.prototype.sendEventViaImg = function(e, t) {
                        var n = e.localTime,
                            r = e.target,
                            o = e.eventType,
                            a = e.context,
                            i = e.additionalProperties,
                            l = e.currentUrl,
                            u = e.guestId,
                            c = e.sessionId,
                            s = n.toISOString(),
                            d = new URL("".concat(this.baseUrl, "/e.png"));
                        d.searchParams.append("t", r), d.searchParams.append("evt", o), d.searchParams.append("ctx", a), d.searchParams.append("lt", s), d.searchParams.append("url", l || window.location.href), void 0 !== u && d.searchParams.append("gid", u), void 0 !== c && d.searchParams.append("sid", c), void 0 !== i && Object.keys(i).forEach((function(e) {
                            var t;
                            d.searchParams.append(e, (null !== (t = i[e]) && void 0 !== t ? t : "").toString())
                        }));
                        var f = new Image;
                        return f.src = d.href, f.onload = function() {
                            void 0 !== t && t(!0)
                        }, f.onerror = function(e) {
                            void 0 !== t && t(!1), console.error(e)
                        }, f
                    }, e
                }(),
                dd = Qn.EnvironmentUrls.domain;
            ! function(e) {
                e.PAGE_LOAD = "pageLoad", e.BUTTON_CLICK = "buttonClick"
            }(Ts || (Ts = {}));
            var fd = new sd(new cd({
                    baseUrl: "https://ecsv2." + dd + "/www"
                })),
                pd = {
                    sendEvent: function(e, t, n) {
                        var r = {
                            target: "www",
                            localTime: new Date,
                            eventType: e,
                            context: t,
                            additionalProperties: {
                                profileUserId: n
                            }
                        };
                        return fd.sendEventViaImg(r)
                    }
                };
            var md = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                vd = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                hd = function() {
                    return md(void 0, void 0, Promise, (function() {
                        return vd(this, (function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, Qn.Guac.callBehaviour("web-profile-ui")];
                                case 1:
                                    return [2, e.sent().data]
                            }
                        }))
                    }))
                },
                yd = Qn.EnvironmentUrls.apiGatewayUrl,
                bd = (Qn.EnvironmentUrls.friendsApi, Qn.EnvironmentUrls.thumbnailsApi, Qn.EnvironmentUrls.presenceApi, Qn.EnvironmentUrls.gamesApi, Qn.EnvironmentUrls.usersApi, function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(yd, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(t ? "&extraParameters=".concat(t) : "").concat(n ? "&successfulActions=".concat(n) : "")
                    }
                }),
                gd = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null,
                        r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(yd, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(t ? "&extraParameters=".concat(t) : "").concat(n ? "&successfulActions=".concat(n) : "").concat(r ? "&namespace=".concat(encodeURIComponent(r)) : "")
                    }
                };

            function wd(e, t, n, r, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function xd(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var a = e.apply(t, n);

                        function i(e) {
                            wd(a, r, o, i, l, "next", e)
                        }

                        function l(e) {
                            wd(a, r, o, i, l, "throw", e)
                        }
                        i(void 0)
                    }))
                }
            }
            var Ed = function() {
                    var t = xd(regeneratorRuntime.mark((function t(n, r, o) {
                        var a, i, l, u;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return a = r ? btoa(JSON.stringify(r)) : null, i = bd(n, a, o), t.next = 4, e.httpService.get(i);
                                case 4:
                                    return l = t.sent, u = l.data, t.abrupt("return", u);
                                case 7:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e, n, r) {
                        return t.apply(this, arguments)
                    }
                }(),
                Sd = function() {
                    var t = xd(regeneratorRuntime.mark((function t(n, r, o, a) {
                        var i, l, u, c;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return i = r ? btoa(JSON.stringify(r)) : null, l = gd(n, i, o, a), t.next = 4, e.httpService.get(l);
                                case 4:
                                    return u = t.sent, c = u.data, t.abrupt("return", c);
                                case 7:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e, n, r, o) {
                        return t.apply(this, arguments)
                    }
                }();

            function Od(e, t, n, r, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }

            function Cd(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var a = e.apply(t, n);

                        function i(e) {
                            Od(a, r, o, i, l, "next", e)
                        }

                        function l(e) {
                            Od(a, r, o, i, l, "throw", e)
                        }
                        i(void 0)
                    }))
                }
            }
            var kd, Ad = function() {
                    var e = Cd(regeneratorRuntime.mark((function e(t) {
                        var n;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.prev = 0, e.next = 3, Ed("MustHideConnections", [{
                                        name: "vieweeUserId",
                                        type: "UserId",
                                        value: "".concat(t)
                                    }]);
                                case 3:
                                    return n = e.sent, e.abrupt("return", "Granted" === (null == n ? void 0 : n.access));
                                case 7:
                                    e.prev = 7, e.t0 = e.catch(0), console.debug(e.t0);
                                case 10:
                                    return e.abrupt("return", !0);
                                case 11:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [0, 7]
                        ])
                    })));
                    return function(t) {
                        return e.apply(this, arguments)
                    }
                }(),
                Nd = function() {
                    var e = Cd(regeneratorRuntime.mark((function e(t) {
                        var n;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.prev = 0, e.next = 3, js([parseInt(t, 10)]);
                                case 3:
                                    if (!(null != (n = e.sent) && n.users && n.users.length > 0)) {
                                        e.next = 6;
                                        break
                                    }
                                    return e.abrupt("return", n.users[0].isBlockingViewer);
                                case 6:
                                    e.next = 11;
                                    break;
                                case 8:
                                    e.prev = 8, e.t0 = e.catch(0), console.debug(e.t0);
                                case 11:
                                    return e.abrupt("return", !0);
                                case 12:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [0, 8]
                        ])
                    })));
                    return function(t) {
                        return e.apply(this, arguments)
                    }
                }();
            ! function(e) {
                e.Friends = "Friends", e.NotFriends = "NotFriends", e.RequestSent = "RequestSent", e.RequestReceived = "RequestReceived", e.Invalid = "Invalid", e.TrustedFriends = "TrustedFriends", e.RequestIgnored = "RequestIgnored"
            }(kd || (kd = {}));
            var Pd = kd;

            function Rd(e, t, n, r, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(u) : Promise.resolve(u).then(r, o)
            }
            var jd = function() {
                    var e, t = (e = regeneratorRuntime.mark((function e() {
                        var t, n;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.prev = 0, e.next = 3, Sd("TrustedConnectionIndicatorOnUserTileAccess", null, null, "connection_social_identity/TrustedConnectionIndicator");
                                case 3:
                                    return t = e.sent, n = "Granted" === (null == t ? void 0 : t.access), e.abrupt("return", n);
                                case 8:
                                    return e.prev = 8, e.t0 = e.catch(0), console.error(e.t0), e.abrupt("return", !1);
                                case 12:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [0, 8]
                        ])
                    })), function() {
                        var t = this,
                            n = arguments;
                        return new Promise((function(r, o) {
                            var a = e.apply(t, n);

                            function i(e) {
                                Rd(a, r, o, i, l, "next", e)
                            }

                            function l(e) {
                                Rd(a, r, o, i, l, "throw", e)
                            }
                            i(void 0)
                        }))
                    });
                    return function() {
                        return t.apply(this, arguments)
                    }
                }(),
                Td = jd,
                _d = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                u(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                u(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function u(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        u((r = r.apply(e, t || [])).next())
                    }))
                },
                Id = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Dd = function(e) {
                    return Promise.all(e.map((function(e) {
                        return e.then((function(e) {
                            return {
                                status: "fulfilled",
                                value: e
                            }
                        })).catch((function(e) {
                            return {
                                status: "rejected",
                                reason: e,
                                value: null
                            }
                        }))
                    })))
                },
                Fd = function(e, t) {
                    return _d(void 0, void 0, void 0, (function() {
                        return Id(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return t ? [2, !1] : [4, Nd(e)];
                                case 1:
                                    return n.sent() ? [2, !0] : [4, Ad(e)];
                                case 2:
                                    return [2, n.sent()]
                            }
                        }))
                    }))
                },
                Md = function(n) {
                    var o, a, f = n.translate,
                        m = (0, u.useTheme)(),
                        v = ds(),
                        h = v.state,
                        y = v.dispatch,
                        b = s.authenticatedUser.id,
                        g = (o = /\/users\/(\d+)\//g.exec(window.location.pathname)) ? o[1] : null,
                        w = g ? parseInt(g, 10) : b,
                        x = w === b,
                        E = Ms(),
                        S = [d.UserProfileField.Names.CombinedName, d.UserProfileField.Names.Username, d.UserProfileField.Names.DisplayName, d.UserProfileField.Names.Alias],
                        O = (0, d.useUserProfiles)([w], S).data,
                        C = p().usePresence(w, void 0),
                        k = C.userPresenceType === p().PresenceType.Game && C.rootPlaceId ? (a = C.rootPlaceId, e.urlService.getUrlWithQueries(c.entityUrl.game.getReferralPath(), {
                            PlaceId: a,
                            PageType: "Profile",
                            Position: 0
                        })) : void 0,
                        A = null == h.errorMessage ? null : r().createElement("p", {
                            className: "text-error profile-header-error"
                        }, h.errorMessage);
                    return (0, t.useEffect)((function() {
                        pd.sendEvent(Ts.PAGE_LOAD, "profileHeader", w.toString()), _d(void 0, void 0, void 0, (function() {
                            var e, t, n, r, o, a, i, l, u, c, d, f, p, m, v, h, g, E, S, O;
                            return Id(this, (function(C) {
                                switch (C.label) {
                                    case 0:
                                        return e = [qc(w), Kc(w), Gc(w), Yc(w), hs(w), Hc(b, w), Os(), x ? Promise.resolve({
                                            isFollowed: !1,
                                            isFollowing: !1
                                        }) : Lc(w), gs(w), !x && s.authenticatedUser.isAuthenticated ? Rs(w) : Promise.resolve(!1), ud(w), hd(), Fd(w, x), Vc(w), Td()], [4, Dd(e)];
                                    case 1:
                                        return t = C.sent(), n = t[0], r = t[1], o = t[2], a = t[3], i = t[4], l = t[5], u = t[6], c = t[7], d = t[8], f = t[9], p = t[10], m = t[11], v = t[12], h = t[13], g = t[14], E = "fulfilled" !== f.status || f.value, S = !1, O = !1, "fulfilled" === c.status && (S = c.value.isFollowing, O = c.value.isFollowing), y({
                                            type: rs.SET_PROFILE_DATA,
                                            data: {
                                                hasVerifiedBadge: "fulfilled" === i.status && i.value.hasVerifiedBadge,
                                                friendCount: "fulfilled" === n.status ? n.value.count : 0,
                                                followingsCount: "fulfilled" === r.status ? r.value.count : 0,
                                                followersCount: "fulfilled" === o.status ? o.value.count : 0,
                                                hasPremiumMembership: "fulfilled" === a.status && a.value,
                                                friendStatus: "fulfilled" === l.status ? l.value.status : os.NotFriends,
                                                canChat: "fulfilled" === u.status && u.value.chatEnabled,
                                                isFollowed: O,
                                                isFollowing: S,
                                                hasFavorites: "fulfilled" === d.status && d.value.data.length > 0,
                                                isBlocked: E,
                                                canTradeWith: "fulfilled" === p.status && p.value.canTrade,
                                                policies: "fulfilled" === m.status ? m.value : void 0,
                                                mustNotLinkConnections: "fulfilled" !== v.status || v.value,
                                                trustedConnectionStatus: "fulfilled" === h.status ? h.value.status : Pd.NotFriends,
                                                canAccessTCIndicatorViaAmpStatus: "fulfilled" === g.status && g.value
                                            }
                                        }), [2]
                                }
                            }))
                        })).catch((function(e) {
                            throw e
                        }))
                    }), []), (0, t.useEffect)((function() {
                        var e = O ? O[w].names : {};
                        y({
                            type: rs.SET_NAMES,
                            names: e
                        })
                    }), [w, y, O]), r().createElement(i.UIThemeProvider, {
                        theme: m,
                        cssBaselineMode: "disabled"
                    }, r().createElement("div", {
                        className: "profile-header-main"
                    }, r().createElement(ts, {
                        profileUserId: w,
                        presenceUrl: k,
                        trustedConnection: h.canAccessTCIndicatorViaAmpStatus && h.trustedConnectionStatus === Pd.TrustedFriends
                    }), r().createElement("div", {
                        className: "profile-header-details"
                    }, r().createElement(fs, {
                        profileUserId: w
                    }), r().createElement("ul", {
                        className: "profile-header-social-counts"
                    }, r().createElement(ps, {
                        label: 1 === h.friendCount ? f(l.translationKeys.connection) : f(l.translationKeys.connections),
                        count: h.friendCount,
                        profileId: w,
                        subPage: xs.Friends,
                        isClickable: !h.mustNotLinkConnections
                    }), r().createElement(ps, {
                        label: f(l.translationKeys.followers),
                        count: h.followersCount,
                        profileId: w,
                        subPage: xs.Followers,
                        isClickable: !h.mustNotLinkConnections
                    }), r().createElement(ps, {
                        label: f(l.translationKeys.following),
                        count: h.followingsCount,
                        profileId: w,
                        subPage: xs.Following,
                        isClickable: !h.mustNotLinkConnections
                    }))), r().createElement(ad, {
                        id: b,
                        profileUserId: w,
                        translate: f
                    })), A, r().createElement(Bs, {
                        profileUserId: w,
                        translate: f
                    }), r().createElement(Xs, {
                        profileUserId: w,
                        translate: f
                    }), E && r().createElement(rc, {
                        abuseVector: "user_profile",
                        targetIdStr: w.toString(),
                        open: h.showAbuseReportDialog,
                        onClose: function() {
                            y({
                                type: rs.SHOW_ABUSE_REPORT_DIALOG,
                                show: !1
                            }), Rs(w).then((function(e) {
                                y({
                                    type: rs.UPDATE_USER_BLOCK,
                                    block: e
                                })
                            }))
                        }
                    }))
                };
            Md.defaultProps = {
                translate: void 0
            };
            var Ud = (0, u.withTranslations)(Md, Zc);
            (0, e.ready)((function() {
                if (l.profileHeaderContainer()) {
                    var e = (0, i.createCache)();
                    (0, o.render)(r().createElement(i.CacheProvider, {
                        cache: e
                    }, r().createElement(ss, null, r().createElement(Ud, null))), l.profileHeaderContainer())
                }
            }))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/373973b058778a786a1df26b2a8a442c-profileHeader.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ProfileHeader");