;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "23bce802-ee20-7637-038e-b90aa5a0beeb")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 271773, e => {
    "use strict";
    var t = e.i(415858),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function n(e, t, a, n) {
        return new(a || (a = Promise))(function(r, i) {
            function o(e) {
                try {
                    c(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                try {
                    c(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function c(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(o, s)
            }
            c((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var a, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(c) {
                var l = [s, c];
                if (a) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (i = 0)), i;) try {
                    if (a = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    a = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            featureName: e.featureName,
            namespace: e.namespace
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var o = function(e) {
        function o() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            a(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(o, e), o.prototype.accessManagementAPIGetFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), i = {}, [4, this.request({
                                path: "/v1/feature-access",
                                schemaPath: "/v1/feature-access",
                                method: "GET",
                                headers: i,
                                query: n
                            }, a)];
                        case 1:
                            return o = r.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetPairwiseFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureName && (n.featureName = e.featureName), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.targetUserId && (n.targetUserId = e.targetUserId), e.otherUserIds && (n.otherUserIds = e.otherUserIds), i = {}, [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "GET",
                                headers: i,
                                query: n
                            }, a)];
                        case 1:
                            return o = r.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetPairwiseFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetRCCOwnerFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v1/rcc-owner-feature-access",
                                schemaPath: "/v1/rcc-owner-feature-access",
                                method: "GET",
                                headers: i,
                                query: n
                            }, a)];
                        case 1:
                            return o = r.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetRCCOwnerFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCOwnerFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetRCCUserFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureNames && (n.featureNames = e.featureNames), void 0 !== e.userId && (n.userId = e.userId), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), i = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (i["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-access",
                                schemaPath: "/v1/rcc-user-feature-access",
                                method: "GET",
                                headers: i,
                                query: n
                            }, a)];
                        case 1:
                            return o = r.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetRCCUserFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetRCCUserFeatureEvaluationRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, o, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, (o = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (o["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (o["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-evaluation",
                                schemaPath: "/v1/rcc-user-feature-evaluation",
                                method: "POST",
                                headers: o,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(i)
                                    }
                                }(e.accessManagementAPIGetRCCUserFeatureEvaluationRequest)
                            }, a)];
                        case 1:
                            return s = r.sent(), [2, new t.V(s)]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetRCCUserFeatureEvaluation = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureEvaluationRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetUpsellFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.featureName && (n.featureName = e.featureName), void 0 !== e.namespace && (n.namespace = e.namespace), void 0 !== e.extraParameters && (n.extraParameters = e.extraParameters), void 0 !== e.successfulActions && (n.successfulActions = e.successfulActions), i = {}, [4, this.request({
                                path: "/v1/upsell-feature-access",
                                schemaPath: "/v1/upsell-feature-access",
                                method: "GET",
                                headers: i,
                                query: n
                            }, a)];
                        case 1:
                            return o = r.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, o.prototype.accessManagementAPIGetUpsellFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetUpsellFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, o.prototype.accessManagementAPIPostPairwiseFeatureAccessRaw = function(e, a) {
            return n(this, void 0, void 0, function() {
                var n, i, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        featureName: e.featureName,
                                        namespace: e.namespace,
                                        targetUserId: e.targetUserId,
                                        otherUserIds: e.otherUserIds
                                    }
                                }(e.accessManagementAPIPostPairwiseFeatureAccessRequest)
                            }, a)];
                        case 1:
                            return o = r.sent(), [2, new t.V(o)]
                    }
                })
            })
        }, o.prototype.accessManagementAPIPostPairwiseFeatureAccess = function() {
            return n(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIPostPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, o
    }(t._);
    e.s(["f", 0, o])
}, 176555, e => {
    "use strict";
    var t = e.i(328567),
        a = e.i(486213),
        n = e.i(748894),
        r = e.i(357721),
        i = e.i(335020),
        o = e.i(643766),
        s = e.i(637068);
    let c = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        l = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        d = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        u = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        g = (0, o.forwardRef)((e, g) => {
            let {
                children: p,
                className: m,
                style: h,
                isDisabled: f = !1,
                isLoading: v = !1,
                icon: b,
                size: y = "Large",
                variant: x = "Emphasis",
                asChild: U,
                ...P
            } = e, C = (0, i.U)("foundation-web-button", f ? a.f : [t.Y, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", l[y], f ? u[x] : d[x], m), A = {
                textDecoration: "none",
                ...h
            }, w = e => o.default.createElement(o.default.Fragment, null, o.default.createElement(t.v, null), v && o.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, o.default.createElement(n.f, {
                width: c[y],
                height: c[y]
            })), o.default.createElement("span", {
                className: (0, i.U)("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", v && "invisible")
            }, b && o.default.createElement(r.f, {
                name: b,
                size: y
            }), o.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (U) {
                let {
                    as: e,
                    ...t
                } = P, a = o.default.Children.only(p);
                return o.default.createElement(s.M, {
                    ref: g,
                    ...t,
                    className: C,
                    style: A,
                    "aria-disabled": f || void 0
                }, o.default.cloneElement(a, {}, w(a.props.children)))
            }
            if ("a" === P.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = P;
                return o.default.createElement("a", {
                    ref: g,
                    ...a,
                    "aria-disabled": f,
                    href: f ? void 0 : t,
                    className: C,
                    style: A
                }, w(p))
            }
            let {
                as: S,
                ...E
            } = P;
            return o.default.createElement("button", {
                ref: g,
                type: "button",
                ...E,
                disabled: f,
                className: C,
                style: A
            }, w(p))
        });
    e.s(["f", 0, g])
}, 349491, e => {
    "use strict";
    var t = e.i(360641),
        a = e.i(335020),
        n = e.i(643766),
        r = e.i(257872),
        i = e.i(225419);
    let o = (0, n.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        s = () => {
            let e = (0, n.useContext)(o);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        c = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        l = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        d = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        u = e => {
            let {
                open: t,
                onOpenChange: a,
                children: i,
                size: s,
                type: c = "Default",
                isModal: l,
                hasCloseAffordance: d,
                closeLabel: u,
                hasMarginTop: g = !0,
                hasMarginBottom: p = !0,
                hasDescription: m = !1,
                experimentalDisablePointerEventsStylingOnBody: h = !1
            } = e, f = (0, n.useMemo)(() => ({
                size: s,
                isModal: l,
                type: c,
                hasCloseAffordance: d,
                closeLabel: u,
                hasMarginTop: g,
                hasMarginBottom: p,
                hasDescription: m
            }), [s, l, c, d, u, g, p, m]);
            return (0, n.useEffect)(() => {
                h && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [h, t]), n.default.createElement(o.Provider, {
                value: f
            }, n.default.createElement(r.F, {
                open: t,
                onOpenChange: a
            }, i))
        };
    u.displayName = "Dialog";
    let g = e => {
        let {
            children: i,
            className: o,
            style: c,
            overlayClassName: l,
            overlayStyle: d,
            onOpenAutoFocus: u,
            ...g
        } = e, {
            size: p,
            isModal: m,
            hasCloseAffordance: h,
            closeLabel: f,
            hasDescription: v
        } = s(), b = (0, a.U)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", m && "bg-common-backdrop", l), y = (0, a.U)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", o);
        return n.default.createElement(r.z, null, n.default.createElement(r.k, {
            className: b,
            style: d
        }, n.default.createElement(r.c, {
            className: y,
            "data-size": p,
            style: c,
            onOpenAutoFocus: u,
            ...!v && {
                "aria-describedby": void 0
            },
            ...g
        }, h && n.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, n.default.createElement(r.K, {
            asChild: !0
        }, n.default.createElement(t.f, {
            variant: "OverMedia",
            size: p,
            isCircular: !0,
            "aria-label": f
        }))), i)))
    };
    g.displayName = "DialogContent";
    let p = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e, {
            size: o,
            hasMarginTop: u,
            hasMarginBottom: g
        } = s(), p = (0, a.U)(c[o], u && l[o], g && d[o], r);
        return n.default.createElement("div", {
            className: p,
            ...i
        }, t)
    };
    p.displayName = "DialogBody";
    let m = e => {
        let {
            children: t,
            className: a,
            hidden: o,
            ...s
        } = e, c = n.default.createElement(r.Z, {
            className: a,
            ...s
        }, t);
        return o ? n.default.createElement(i.f, null, c) : c
    };
    m.displayName = "DialogTitle";
    let h = e => {
        let {
            children: t,
            className: r,
            ...i
        } = e, {
            size: o
        } = s(), l = (0, a.U)(c[o], d[o], r);
        return n.default.createElement("div", {
            className: l,
            ...i
        }, t)
    };
    h.displayName = "DialogFooter", e.s(["N", 0, u, "K", 0, p, "d", 0, g, "c", 0, h, "F", 0, m])
}, 357721, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766);
    let n = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        r = a.default.forwardRef((e, r) => {
            let {
                name: i,
                size: o = "Medium",
                className: s,
                children: c,
                ...l
            } = e;
            return a.default.createElement("span", {
                ref: r,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.U)("grow-0 shrink-0 basis-auto icon", i, n[o], s),
                ...l
            })
        });
    r.displayName = "Icon", e.s(["f", 0, r])
}, 360641, e => {
    "use strict";
    var t = e.i(328567),
        a = e.i(357721),
        n = e.i(335020),
        r = e.i(643766);
    let i = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        o = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["f", 0, e => {
        let {
            variant: s,
            size: c,
            isCircular: l,
            className: d,
            ...u
        } = e;
        return r.default.createElement("button", {
            type: "button",
            className: (0, n.U)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", t.Y, o[s], i[c], l && "radius-circle", d),
            ...u
        }, r.default.createElement(t.v, null), r.default.createElement(a.f, {
            name: "icon-regular-x",
            size: c
        }))
    }])
}, 328567, e => {
    "use strict";
    var t = e.i(335020),
        a = e.i(643766);
    e.s(["v", 0, e => {
        let {
            className: n
        } = e;
        return a.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, t.U)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
        })
    }, "Y", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 486213, 748894, e => {
    "use strict";
    e.s(["f", 0, "opacity-[0.5]"], 486213);
    var t = e.i(643766);
    e.s(["f", 0, e => {
        let {
            width: a,
            height: n
        } = e;
        return t.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: a,
            height: n,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, t.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    }], 748894)
}, 649499, e => {
    "use strict";
    var t = e.i(277199);
    e.s(["f", () => t.N])
}, 97782, e => {
    "use strict";
    var t = e.i(730530),
        a = e.i(881670);
    let n = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, t.Q)("Heading.Monetization", a.f.Analytics)
        },
        r = {
            path: "/dashboard/analytics",
            pathPattern: /\/dashboard\/analytics/,
            title: (0, t.Q)("Heading.Analytics", a.f.Navigation)
        },
        i = {
            path: "/experiments",
            pathPattern: /\/experiments(?!\/)/,
            title: (0, t.Q)("Heading.Experiments", a.f.Navigation)
        },
        o = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, t.Q)("Label.DeveloperProducts", a.f.Navigation),
            group: n
        },
        s = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, t.Q)("Label.GamePasses", a.f.Navigation),
            group: n
        },
        c = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, t.Q)("Label.ThirdPartyAvatarItemCommissions", a.f.Navigation),
            group: n
        },
        l = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, t.Q)("Heading.ItemAnalytics", a.f.Analytics)
        },
        d = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, t.Q)("Heading.Ads", a.f.Navigation),
            group: n
        },
        u = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, t.Q)("Heading.Subscriptions", a.f.Navigation),
            group: n
        },
        g = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, t.Q)("Heading.MemoryStores", a.f.Navigation)
        },
        p = {
            path: "/analytics/queue-service",
            pathPattern: /\/analytics\/queue-service/,
            title: (0, t.Q)("Heading.QueueService", a.f.Navigation)
        },
        m = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, t.Q)("Heading.DataStores", a.f.Navigation)
        },
        h = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, t.Q)("Heading.HttpService", a.f.Navigation)
        },
        f = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, t.Q)("Heading.MessagingService", a.f.Navigation)
        },
        v = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, t.Q)("Heading.SpeechToText", a.f.Navigation)
        },
        b = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, t.Q)("Heading.TextToSpeech", a.f.Navigation)
        },
        y = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, t.Q)("Heading.VideoService", a.f.Navigation)
        },
        x = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, t.Q)("Heading.CreatorRewards", a.f.Navigation),
            group: n
        },
        U = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, t.Q)("Heading.RobloxPlusDeveloperProgram", a.f.Navigation),
            group: n
        },
        P = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, t.Q)("Heading.Performance", a.f.Navigation)
        },
        C = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, t.Q)("Heading.Crashes", a.f.Analytics)
        },
        A = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, t.Q)("Heading.ErrorReport", a.f.Navigation)
        },
        w = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, t.Q)("Heading.Demographics", a.f.Navigation)
        },
        S = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, t.Q)("Heading.Economy", a.f.Navigation)
        },
        E = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, t.Q)("Heading.Funnels", a.f.Navigation)
        },
        M = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, t.Q)("Heading.Explore", a.f.Navigation)
        },
        k = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, t.Q)("Heading.CustomDashboards", a.f.Navigation)
        },
        z = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, t.Q)("Heading.Retention", a.f.Navigation)
        },
        I = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, t.Q)("Heading.Engagement", a.f.Navigation)
        },
        N = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, t.Q)("Heading.Acquisition", a.f.Navigation),
            group: r
        },
        G = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, t.Q)("Heading.Acquisition", a.f.Navigation),
            group: r
        },
        R = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, t.Q)("Heading.CustomEvents", a.f.Navigation)
        },
        D = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, t.Q)("Heading.Journeys", a.f.Navigation)
        },
        H = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, t.Q)("Heading.JourneyEventsConfigCreate", a.f.Navigation)
        },
        T = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, t.Q)("Heading.JourneyEventsConfigCreate", a.f.Navigation)
        },
        j = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, t.Q)("Heading.Journeys", a.f.Navigation)
        },
        Q = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, t.Q)("Heading.Feedback", a.f.PlayerFeedback)
        },
        F = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, t.Q)("Heading.ConfigsHistory", a.f.Navigation),
            titleOverrideForIAM2: (0, t.Q)("Heading.ConfigHistory", a.f.Navigation)
        },
        O = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, t.Q)("Heading.Configs", a.f.Navigation)
        },
        L = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, t.Q)("Heading.ConfigCreate", a.f.Navigation)
        },
        B = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, t.Q)("Heading.Alerts", a.f.Navigation)
        },
        q = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, t.Q)("Heading.CreateAlert", a.f.ExperienceAlerts)
        },
        _ = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, t.Q)("Heading.ConfigureAlert", a.f.Navigation)
        },
        V = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, t.Q)("Heading.CustomMatchmaking", a.f.Matchmaking)
        },
        X = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, t.Q)("Heading.Commerce", a.f.Navigation),
            group: n
        },
        J = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        K = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        Y = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        W = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, t.Q)("Heading.ExperimentsCreate", a.f.Navigation),
            titleOverrideForIAM2: (0, t.o)("Heading.Experimentation"),
            group: i
        },
        $ = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, t.Q)("Heading.RecommendationService", a.f.Navigation)
        },
        Z = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, t.Q)("Heading.SafetyOverview", a.f.Analytics),
            titleOverrideForIAM2: (0, t.Q)("Heading.Safety", a.f.Navigation)
        },
        ee = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, t.Q)("Heading.Overview", a.f.Navigation)
        },
        et = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, t.Q)("Heading.Thumbnails", a.f.Navigation)
        },
        ea = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, t.Q)("Heading.Notifications", a.f.Navigation)
        },
        en = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, t.Q)("Heading.Subscriptions", a.f.Navigation),
            group: n
        },
        er = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, t.Q)("Heading.GenerativeAI", a.f.Navigation)
        },
        ei = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, t.Q)("Heading.AvatarCreationTokens", a.f.AvatarAnalytics),
            titleOverrideForIAM2: (0, t.Q)("Heading.AvatarCreationTokens", a.f.Navigation),
            group: n
        },
        eo = [G, N, I, z, n, o, s, c, l, d, u, g, p, m, h, f, v, b, y, er, x, U, P, C, A, w, S, E, D, H, T, j, M, k, R, J, K, Y, Q, F, O, L, V, X, Z, ee, r, i, W, $, et, ea, en, q, _, B, ei];
    e.s(["Q3", 0, K, "l9", 0, Y, "g1", 0, _, "PS", 0, q, "rf", 0, B, "ib", 0, r, "xG", 0, J, "gX", 0, w, "kg", 0, ei, "is", 0, U, "DH", 0, X, "nu", 0, F, "m2", 0, O, "aQ", 0, C, "c3", 0, ee, "dX", 0, k, "Np", 0, R, "jc", 0, m, "P_", 0, I, "Pu", 0, A, "th", 0, x, "pr", 0, en, "bw", 0, W, "Ap", 0, i, "Iv", 0, M, "Iw", 0, Q, "p_", 0, er, "jY", 0, h, "Kh", 0, d, "j$", 0, c, "uv", 0, o, "fX", 0, s, "Em", 0, V, "Bt", 0, g, "Vs", 0, f, "du", 0, n, "rJ", 0, ea, "Xe", 0, P, "IQ", 0, p, "pj", 0, $, "vH", 0, S, "Ya", 0, E, "kL", 0, H, "e_", 0, T, "rS", 0, D, "ko", 0, j, "bm", 0, z, "jd", 0, Z, "k7", 0, v, "t", 0, u, "Cu", 0, b, "FO", 0, N, "N$", 0, G, "D2", 0, y, "xL", 0, function(e) {
        return eo.find(t => t.pathPattern.test(e))
    }])
}, 894854, e => {
    "use strict";
    var t = e.i(893949);
    e.s(["f", () => t.U])
}, 726474, e => {
    "use strict";
    var t = e.i(894432),
        a = e.i(307529),
        n = e.i(251622);
    let r = "".concat("https://create.roblox.com", "/store"),
        i = "".concat("https://create.roblox.com", "/docs"),
        o = {
            [t.C.Model]: "models",
            [t.C.Plugin]: "plugins",
            [t.C.Audio]: "audio",
            [t.C.FontFamily]: "fonts",
            [t.C.Decal]: "decals",
            [t.C.MeshPart]: "meshParts",
            [t.C.Video]: "videos",
            [t.C.Animation]: "",
            [t.C.Music]: "",
            [t.C.SoundEffect]: "",
            [t.C.UnknownAudio]: "",
            [t.C.Package]: "",
            [t.C.SharedPackage]: ""
        },
        s = (e, t) => "/dashboard/creations/experiences/".concat(e).concat(t ? "/observability" : "", "/server-management"),
        c = {
            getUrl: (e, t, a) => {
                let n = new URLSearchParams({
                    ...e ? {
                        groupId: e
                    } : {},
                    ...t ? {
                        assetType: t
                    } : {},
                    ...a ? {
                        activeTab: a
                    } : {}
                }).toString();
                return "/dashboard/creations".concat(n.length > 0 ? "?" : "").concat(n)
            },
            getConfigureItemUrl: (e, t) => {
                switch (t) {
                    case n.U.Game:
                        return c.getConfigureExperienceUrl(e);
                    case n.U.Bundle:
                        return c.getConfigureBundlePath(e);
                    case n.U.CatalogAsset:
                        return c.getConfigureAvatarItemsUrl(e);
                    default:
                        throw Error("Unsupported item type ".concat(String(t)))
                }
            },
            getExperienceOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/overview"),
            getConfigureBundlePath: e => "/dashboard/creations/bundle/".concat(e, "/configure"),
            getConfigureExperienceUrl: e => "/dashboard/creations/experiences/".concat(e, "/configure"),
            configureCreatorStoreItemBasePath: "/dashboard/creations/store/",
            getConfigureCreatorStoreItemUrl: e => "".concat(c.configureCreatorStoreItemBasePath).concat(e, "/configure"),
            getConfigureAvatarItemsUrl: e => "/dashboard/creations/catalog/".concat(e, "/configure"),
            getConfigureDeveloperProductUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/developer-products/").concat(t, "/configure"),
            getCreateDeveloperProductUrl: e => "/dashboard/creations/experiences/".concat(e, "/developer-products/create"),
            getConfigurePassUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(t, "/configure"),
            getConfigurePassSalesUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(t, "/sales"),
            getCreatePassUrl: e => "/dashboard/creations/experiences/".concat(e, "/passes/create"),
            getConfigureExperienceSubscriptionUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/").concat(t, "/configure"),
            getCreateExperienceSubscriptionUrl: e => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/create"),
            getUserBansUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans"),
            getAddUsersToBanUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans/add"),
            getAntiCheatUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/anti-cheat"),
            getIssuesAndAppealsUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals"),
            getGameViolationUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals/").concat(encodeURIComponent(t)),
            getAnalyticsOverviewUrl: () => "/dashboard/analytics",
            getAnalyticsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics"),
            getAnalyticsPerformanceUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/performance"),
            getAnalyticsPerformanceClientUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/performance?tab=client"),
            getAnalyticsEngagementUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/engagement"),
            getAnalyticsFunnelsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/funnels"),
            getAnalyticsEconomyUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/economy"),
            getAnalyticAcquisitionUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/acquisition"),
            getAnalyticAcquisitionHomeRecommendationsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/acquisition?tab=homeRecommendations"),
            getAnalyticsConfigsUrl: e => "/dashboard/creations/experiences/".concat(e, "/configs"),
            getAnalyticsConfigsCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/configs/config-create"),
            getAnalyticsErrorsUrls: e => "/dashboard/creations/experiences/".concat(e, "/analytics/errors"),
            getAnalyticsExploreUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/explore"),
            getAnalyticsAgentUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/agent"),
            getAnalyticsJourneysUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys"),
            getAnalyticsJourneysCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/create"),
            getAnalyticsJourneysEditUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/edit?journeyName=").concat(encodeURIComponent(t)),
            getAnalyticsJourneysViewUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/view?filter_JourneyName=").concat(encodeURIComponent(t)),
            getBundleAnalyticsUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/bundle/".concat(e, "/analytics?rangeType=").concat(t)
            },
            getCatalogAnalyticsUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/catalog/".concat(e, "/analytics?rangeType=").concat(t)
            },
            getPlaceThumbnailsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(t, "/thumbnails"),
            getPlaceVideosUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(t, "/videos"),
            getPlaceIconUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(t, "/icon"),
            getExperienceAlertCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts/create"),
            getExperienceAlertConfigureUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/alerts/").concat(t, "/configure"),
            getExperienceAlertsUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts"),
            getExperienceWebhooksUrl: e => "/dashboard/creations/experiences/".concat(e, "/webhooks"),
            getExperimentsUrl: e => "/dashboard/creations/experiences/".concat(e, "/experiments"),
            getUploadUrl: function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : a.f.TShirt;
                return "/dashboard/creations/upload?assetType=".concat(e)
            },
            getDevexUrl: () => "/dashboard/devex",
            getBillingStatementUrl: e => "/dashboard/summary/".concat(e),
            getServiceActivityUrl: () => "/dashboard/billing",
            getMonetizationOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/overview"),
            getMonetizationDeveloperProductsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products"),
            getMonetizationDeveloperProductsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products?tab=Analytics"),
            getMonetizationDeveloperProductsExternalPurchaseSettingsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products/external-purchase-settings"),
            getMonetizationPassesUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/passes"),
            getMonetizationPassesAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/passes?tab=Analytics"),
            getMonetizationAvatarItemsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-items"),
            getMonetizationAvatarItemsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-items?tab=Analytics"),
            getMonetizationSubscriptionsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions"),
            getMonetizationSubscriptionsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions?tab=Analytics"),
            getMonetizationSubscriptionsHistoryTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions?tab=History"),
            getMonetizationCommerceUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/commerce"),
            getMonetizationCommerceCreateProductUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/commerce/create-products"),
            getMonetizationImmersiveAdsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/immersive-ads"),
            getMonetizationImmersiveAdsCreatePlacementUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/immersive-ads/create-placement"),
            getMonetizationCreatorRewardsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/creator-rewards"),
            getMonetizationBountyPayoutsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/roblox-plus"),
            getMonetizationAvatarCreationTokensUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-creation-tokens"),
            getConfigureAvatarCreationTokenUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/avatar-creation-tokens/").concat(t, "/configure"),
            getMonetizationPriceOptimizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/price-optimization"),
            getMonetizationDynamicPriceCheckUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = new URLSearchParams(t).toString();
                return "/dashboard/creations/experiences/".concat(e, "/monetization/price-check").concat(a.length > 0 ? "?".concat(a) : "")
            },
            getManagedPricingUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing").concat(t ? "?tab=".concat(t) : ""),
            getManagedPricingEventDetailsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing/events/").concat(t, "/details"),
            getMonetizationHardCodedPricesUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/hard-coded-prices"),
            getPersonalizedShopsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/monetization/shop").concat(t ? "?tab=".concat(t) : ""),
            getDeveloperProductPurchasesBlockedUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/shop/developer-product-purchases-blocked"),
            getSellerOnboardingUrl: () => "/settings/eligibility/priced-assets",
            getTranslatorPortalUrl: () => "/dashboard/translator-portal",
            getAudioDistributionOnboardingUrl: () => "/settings/eligibility/audio-distribution",
            getCreateGroupUrl: () => "/dashboard/group/create",
            getGroupProfileUrl: e => {
                let t = new URLSearchParams({
                    groupId: e
                }).toString();
                return "/dashboard/group/profile".concat(t.length > 0 ? "?" : "").concat(t)
            },
            getRightsManagerAssetUrl: e => "/dashboard/rights-manager/accounts/contents/asset/".concat(e),
            getCustomMatchmakingDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking"),
            getCustomMatchmakingConfigurationDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Configuration"),
            getCustomMatchmakingAttributesDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Attributes"),
            getCustomMatchmakingAnalyticsDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Analytics"),
            getCustomMatchmakingConfigurationCreationUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-configuration/").concat(t),
            getCustomMatchmakingEditConfigurationUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-configuration/").concat(t),
            getCustomMatchmakingAttributeCreationUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-attribute"),
            getCustomMatchmakingEditServerAttributeUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-server-attribute/").concat(t),
            getCustomMatchmakingEditPlayerAttributeUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-player-attribute/").concat(t),
            getLocalizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/localization"),
            getDataStoresManagerUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/data-stores"),
            getExtendedServicesUnlock: e => "/dashboard/creations/experiences/".concat(e, "/extended-services"),
            getPaymentsUrl: () => "/dashboard/payments",
            getServerManagementUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return s(e, t)
            },
            getServerManagementServersUrl: function(e, t) {
                let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                    n = arguments.length > 3 ? arguments[3] : void 0,
                    r = "".concat(s(e, a), "/").concat(t, "/servers");
                if (!n || 0 === n.length) return r;
                let i = new URLSearchParams;
                return i.set("serverStatus", n.join(",")), "".concat(r, "?").concat(i.toString())
            },
            getServerManagementDetailsUrl: function(e, t, a) {
                let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    r = arguments.length > 4 ? arguments[4] : void 0,
                    i = arguments.length > 5 ? arguments[5] : void 0,
                    o = new URLSearchParams;
                (null != r || null != i) && o.set("logRange", "custom"), null != r && o.set("logStart", String(r)), null != i && o.set("logEnd", String(i));
                let c = o.toString();
                return "".concat(s(e, n), "/").concat(t, "/servers/").concat(a, "/details").concat(c ? "?".concat(c) : "")
            },
            getClientSessionsUrl: (e, t) => {
                let a = "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions");
                return void 0 === t ? a : "".concat(a, "?filter_ExitReason=").concat(encodeURIComponent(t))
            },
            getClientSessionDetailsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions/").concat(t),
            getObservabilityDataCapturesUrl: e => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures"),
            getObservabilityDataCaptureCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures/create"),
            getObservabilityDataCaptureEditUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures/").concat(encodeURIComponent(t), "/edit"),
            getPlayerSupportUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/player-support").concat(t ? "/".concat(t) : "")
        };
    e.s(["creatorStore", 0, {
        getUrl: () => r,
        getAssetUrl: e => "".concat(r, "/asset/").concat(e),
        getSearchUrl: (e, t) => {
            if ("" !== o[e]) return "".concat(r, "/").concat(o[e], "?keyword=").concat(encodeURIComponent(t));
            throw Error("Unsupported search asset type ".concat(e))
        }
    }, "dashboard", 0, c, "developerForum", 0, {
        getBaseUrl: () => "https://devforum.roblox.com",
        getCdnBaseUrl: () => "https://doy2mn9upadnk.cloudfront.net",
        getMediaCdnBaseUrl: () => "//d3vcfwomg2mj2z.cloudfront.net",
        getAnnouncementsPath: () => "/c/updates/announcements/36",
        getPublicSfxAnnouncementPath: () => "/t/public-sound-effects-upload-are-now-available-for-creators/2980704"
    }, "docs", 0, {
        getUrl: () => i,
        getAiDataSharingUrl: () => "".concat(i, "/ai-data-sharing"),
        getBadgesPublishingUrl: () => "".concat(i, "/production/publishing/badges"),
        getExperiencesPublishingUrl: () => "".concat(i, "/production/publishing/publishing-experiences-and-places"),
        getCrossServerChatUrl: () => "".concat(i, "/chat/cross-server-chat"),
        getStrongLanguageUrl: () => "".concat(i, "/projects/configure-games#allow-strong-language"),
        getSellingOnCreatorStoreUrl: () => "".concat(i, "/production/creator-store#distribute-and-sell-assets"),
        getPassesMonetizationUrl: () => "".concat(i, "/production/monetization/game-passes"),
        getDeveloperProductsMonetizationUrl: () => "".concat(i, "/production/monetization/developer-products"),
        getDeveloperProductsExternalPurchaseSettingsMonetizationUrl: () => "".concat(i, "/production/monetization/developer-products#outside-your-experience"),
        getExternalEligibilityReferenceUrl: () => "".concat(i, "/reference/engine/classes/MarketplaceService#ProcessReceipt"),
        getSubscriptionsMonetizationUrl: () => "".concat(i, "/production/monetization/subscriptions"),
        getSubscriptionsMonetizationAnalyticsUrl: () => "".concat(i, "/production/monetization/subscriptions#subscription-analytics"),
        getPriceOptimizationMonetizationUrl: () => "".concat(i, "/production/monetization/price-optimization"),
        getDynamicPriceCheckMonetizationUrl: () => "".concat(i, "/production/monetization/price-optimization#using-the-dynamic-price-check-tool"),
        getRegionalPricingMonetizationUrl: () => "".concat(i, "/production/monetization/regional-pricing"),
        getPriceLevelsApiMonetizationUrl: () => "".concat(i, "/production/monetization/regional-pricing#protect-your-trades-and-gifts"),
        getManagedPricingMonetizationUrl: () => "".concat(i, "/production/monetization/managed-pricing"),
        getPersonalizedShopsMonetizationUrl: () => "".concat(i, "/production/monetization/shop"),
        getImmersiveAdsMonetizationUrl: () => "".concat(i, "/production/monetization/immersive-ads"),
        getRewardedVideoUrl: () => "".concat(i, "/production/promotion/rewarded-video-ads"),
        getKidsAndSelectPublishingUrl: () => "".concat(i, "/production/publishing/kids-and-select"),
        getExperienceDetailsPageRewardedAdsUrl: () => "".concat(i, "/production/monetization/immersive-ads"),
        getCreatorStorePublishingUrl: () => "".concat(i, "/production/creator-store#distribute-and-sell-assets"),
        getDecalReferenceUrl: () => "".concat(i, "/reference/engine/classes/Decal"),
        getIntegrityServiceReferenceUrl: () => "".concat(i, "/reference/engine/classes/IntegrityService"),
        getOpenCloudReferenceUrl: () => "".concat(i, "/reference/cloud"),
        getAudioAssetsUrl: () => "".concat(i, "/building-and-visuals/audio/audio-assets"),
        getAssetsUrl: () => "".concat(i, "/projects/assets"),
        getClassicClothingUrl: () => "".concat(i, "/avatar/accessories/classic-clothing"),
        getEarningOnRobloxUrl: () => "".concat(i, "/production/earning-on-roblox"),
        getSettingUpStudioUrl: () => "".concat(i, "/studio/setup"),
        getStudioUrl: () => "".concat(i, "/studio"),
        getPlatformUrl: () => "".concat(i, "/platform"),
        getAnalyticsUrl: () => "".concat(i, "/production/analytics"),
        getAnalyticsErrorReportUrl: () => "".concat(i, "/production/analytics/error-report"),
        getAnalyticsJourneyEventsUrl: () => "".concat(i, "/production/analytics/journey-events"),
        getUnityGuideUrl: () => "".concat(i, "/unity"),
        getUnrealGuideUrl: () => "".concat(i, "/unreal"),
        getEventsPlatformUrl: () => "".concat(i, "/production/promotion/events-platform"),
        getAvatarItemsUrl: () => "".concat(i, "/avatar"),
        getClassicAccessoriesUrl: () => "".concat(i, "/art/accessories/classic-clothing"),
        getModelsUrl: () => "".concat(i, "/parts/models"),
        getMakeupLooksUrl: () => "".concat(i, "/avatar/makeup-looks"),
        getPluginsReferenceUrl: () => "".concat(i, "/reference/engine/classes/Plugin"),
        getVideoFrameReferenceUrl: () => "".concat(i, "/reference/engine/classes/VideoFrame#Video"),
        getMeshPartReferenceUrl: () => "".concat(i, "/reference/engine/classes/MeshPart"),
        getAnimationReferenceUrl: () => "".concat(i, "/reference/engine/classes/Animation"),
        getLocalizationGuideUrl: () => "".concat(i, "/production/localization"),
        getAssistantUrl: () => "".concat(i, "/assistant"),
        getAnalyticsRetentionGuideUrl: () => "".concat(i, "/production/analytics/retention#improve-day-1-retention"),
        getMonetizationNewUserExperienceGuideUrl: () => "".concat(i, "/production/monetization/improve-new-user-experience"),
        getAnalyticsEngagementGuideUrl: () => "".concat(i, "/production/analytics/engagement#improving-average-session-time"),
        getAnalyticsRetentionD7GuideUrl: () => "".concat(i, "/production/analytics/retention#improve-day-7-retention"),
        getAnalyticsRetentionD30GuideUrl: () => "".concat(i, "/production/analytics/retention#improve-day-30-retention"),
        getAnalyticsMonetizationPayerConversionRateGuideUrl: () => "".concat(i, "/production/analytics/monetization#improving-payer-conversion-rate"),
        getAnalyticsMonetizationARPPUGuideUrl: () => "".concat(i, "/production/analytics/monetization#improving-average-revenue-per-paying-user-arppu"),
        getAnalyticsFilterByMetricsGuideUrl: () => "".concat(i, "/production/analytics/analytics-dashboard#filter-by-metrics"),
        getAnalyticsEventTypesUrl: () => "".concat(i, "/production/analytics/event-types"),
        getDiscoveryUrl: () => "".concat(i, "/discovery"),
        getDiscoveryBestPracticesUrl: () => "".concat(i, "/discovery#best-practices-for-discovery"),
        getDiscoveryRecommendationUrl: () => "".concat(i, "/discovery#how-recommendation-works"),
        getDiscoveryKeySignalsUrl: () => "".concat(i, "/discovery#key-signals"),
        getDiscoveryGetDiscoveredUrl: () => "".concat(i, "/discovery#how-you-can-get-discovered-via-recommendations"),
        getCreatorStoreAssetModerationUrl: () => "".concat(i, "/production/creator-store#asset-requirements"),
        getCreatorStoreAccountRequirementsUrl: () => "".concat(i, "/production/creator-store#account-requirements"),
        getPerformanceOptimizationUrl: () => "".concat(i, "/performance-optimization"),
        getPromotionalThumbnailsUrl: () => "".concat(i, "/production/promotion/promotional-thumbnails"),
        getExperienceGenresUrl: () => "".concat(i, "/production/publishing/experience-genres"),
        getGenreDefinitionsUrl: () => "".concat(i, "/production/publishing/experience-genres#genre-and-subgenre-descriptions"),
        getExperienceGenresAppealUrl: () => "".concat(i, "/production/publishing/experience-genres#genre-accuracy"),
        getMakeExperiencePublicUrl: () => "".concat(i, "/production/publishing/publish-experiences-and-places#make-experience-public"),
        getPublishGamesUrl: () => "".concat(i, "/production/publishing/publish-games-and-places#publish-games"),
        getOwnershipTransferUrl: () => "".concat(i, "/projects/experience-ownership-transfer"),
        getStreamingUrl: () => "".concat(i, "/workspace/streaming"),
        getAnimationTransferUrl: () => "".concat(i, "/projects/transferring-animations"),
        getGameDesignMissionsUrl: () => "".concat(i, "/production/game-design/introduction-to-quest-design"),
        getGameDesignStarterPackUrl: () => "".concat(i, "/production/game-design/starter-pack-design"),
        getGameDesignBundlesUrl: () => "".concat(i, "/production/game-design/monetization-foundations#bundles"),
        getGameDesignSeasonPassUrl: () => "".concat(i, "/production/game-design/season-pass-design"),
        getGameDesignEngagementRewardsUrl: () => "".concat(i, "/production/game-design/analytics-essentials#engagement-metrics\n"),
        getCloudServicesMemoryStoresAPIRequestsUrl: () => "".concat(i, "/cloud-services/memory-stores/observability#api-request-alerts"),
        getCloudServicesMemoryStoresMemoryUsageUrl: () => "".concat(i, "/cloud-services/memory-stores/observability#memory-usage-alerts"),
        getExperimentationUrl: () => "".concat(i, "/production/experiments"),
        getExperimentationBestPracticesUrl: () => "".concat(i, "/production/experiments#best-practices-for-experiments"),
        getExperimentationDailyResultsUrl: () => "".concat(i, "/production/experiments#daily-results"),
        getExperimentationEarlyHarmMetricsUrl: () => "".concat(i, "/production/experiments#early-harm-metrics"),
        getExperimentationEarlyHarmThresholdsUrl: () => "".concat(i, "/production/experiments#early-harm-thresholds"),
        getExperimentationSrmUrl: () => "".concat(i, "/production/experiments#sample-ratio-mismatch"),
        getReleaseNotesUrl: e => "".concat(i, "/release-notes/release-notes-").concat(e),
        getProductIntelligenceApisUrl: () => "".concat(i, "/production/monetization/developer-products#personalize-your-in-experience-store")
    }, "getDataCollectionSettingsUrl", 0, function(e, t) {
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
            n = new URLSearchParams({
                ...e ? {
                    roblox: "true"
                } : {},
                ...t ? {
                    public: "true"
                } : {},
                ...a ? {
                    tab: a
                } : {}
            }).toString();
        return "/settings/data-collection".concat(n.length > 0 ? "?" : "").concat(n)
    }, "getGroupRoleUrl", 0, e => "/dashboard/group/roles/".concat(e), "getRoadmapUrl", 0, () => "/roadmap", "getUrl", 0, () => "/"])
}, 767112, e => {
    "use strict";
    var t = e.i(726474);
    e.s(["f", 0, t])
}, 174528, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(260241),
        r = e.i(805290);
    e.i(349491), e.i(176555);
    var i = e.i(910272),
        o = e.i(271773),
        s = e.i(415858),
        c = e.i(884399);
    let l = new Map,
        d = async (e, t, a) => {
            let n, r, i = (n = "".concat(e, "/access-management"), (r = l.get(n)) || (r = new o.f(new s.x({
                basePath: n,
                credentials: "include",
                enableMrRouter: !0
            })), l.set(n, r)), r);
            try {
                let e = await i.accessManagementAPIGetUpsellFeatureAccessRaw({
                    featureName: t,
                    namespace: a
                });
                return await e.raw.json()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to check feature access: ".concat(e), {
                    cause: t
                })
            }
        }, u = new Map, g = e => {
            let t = u.get(e);
            return t || (t = new c.f(new s.x({
                basePath: e,
                credentials: "include",
                enableMrRouter: !0
            })), u.set(e, t)), t
        }, p = async e => {
            let t = g(e);
            try {
                await t.userSettingsApiSetGlobalPrivacyControl()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to set Global Privacy Control: ".concat(e), {
                    cause: t
                })
            }
        }, m = async e => {
            let t = g(e);
            try {
                return await t.userSettingsApiGet({
                    requestedUserSettings: "allowSellShareData"
                })
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to get user settings: ".concat(e), {
                    cause: t
                })
            }
        }, h = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, f = async e => {
            var t, a;
            if (e && (null == (a = window.evidon) || null == (t = a.notice) ? void 0 : t.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class v {
        updateCookiePreferences(e) {
            this.currentCookiePreferences = {
                ...e
            }
        }
        hasCookiePreferencesChanged() {
            return Array.from(new Set([...Object.keys(this.currentCookiePreferences), ...Object.keys(this.initialCookiePreferences)])).some(e => this.currentCookiePreferences[e] !== this.initialCookiePreferences[e])
        }
        getGpcState() {
            let e = h(),
                t = this.hasCookiePreferencesChanged();
            return {
                isGpcDetected: e,
                initialGpcState: this.initialGpcState,
                hasUserMadeCookieChanges: t,
                scenario: e ? t ? "signal-with-changes" : "signal-honored" : "no-signal"
            }
        }
        initializeEvidon(e) {
            var t;
            let a;
            e && (f(e).catch(e => {
                console.error("Failed to call Evidon API:", e)
            }), this.evidonCleanup = (t = () => {}, a = () => {
                try {
                    var e, a;
                    (null == (a = window.evidon) || null == (e = a.notice) ? void 0 : e.userGpcEnabled) !== void 0 && t(window.evidon.notice.userGpcEnabled)
                } catch (e) {
                    console.error("Failed to extract GPC signal from Evidon event:", e)
                }
            }, window.addEventListener("evidon-consent-change", a), () => {
                window.removeEventListener("evidon-consent-change", a)
            }))
        }
        cleanup() {
            this.evidonCleanup && (this.evidonCleanup(), this.evidonCleanup = null)
        }
        constructor(e = {}) {
            (0, r._)(this, "initialGpcState", void 0), (0, r._)(this, "evidonCleanup", null), (0, r._)(this, "initialCookiePreferences", void 0), (0, r._)(this, "currentCookiePreferences", void 0), this.initialGpcState = h(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var b = e.i(609305),
        y = e.i(41242),
        x = e.i(79187),
        U = e.i(446475),
        P = e.i(47277),
        C = e.i(870999),
        A = e.i(67243),
        w = e.i(814975);
    let S = (0, A.f)()(() => ({
            container: {
                textAlign: "center",
                paddingTop: "20px",
                paddingBottom: "20px",
                width: "100%",
                marginTop: "0",
                marginBottom: "0"
            },
            link: {
                textDecoration: "none",
                display: "inline-flex",
                alignItems: "center",
                cursor: "pointer",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:visited": {
                    color: "inherit"
                }
            },
            icon: {
                marginLeft: "8px",
                verticalAlign: "middle",
                height: "16px",
                width: "auto"
            }
        })),
        E = "Title.GpcDetected",
        M = "Body.GpcDetectedSettingDisabledIneligible",
        k = "Body.GpcDetectedSettingDisabledEligible",
        z = "Body.GpcDetectedSettingEnabledIneligible",
        I = "Body.GpcMissingSettingIneligible",
        N = (0, A.f)()(() => ({
            modalLink: {
                color: "inherit",
                textDecoration: "none",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:focus": {
                    textDecoration: "underline"
                }
            },
            inlineLink: {
                display: "inline-flex",
                alignItems: "center"
            },
            inlineIcon: {
                marginLeft: "8px",
                height: "16px",
                width: "auto",
                verticalAlign: "middle"
            }
        })),
        G = e => {
            var n, r;
            let {
                gpcState: i,
                modalData: o,
                translate: s,
                translateHTML: c,
                handleClose: l,
                privacyPreferencesUrl: d,
                modalLinkClass: u
            } = e, {
                user: g
            } = (0, w.f)(), p = !!g, m = null != (n = null == o ? void 0 : o.isAdsSellShareDataEnabled) && n, h = null != (r = null == o ? void 0 : o.canUserManageAdsSettings) && r, f = (0, a.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = d)
            }, [d]), v = (0, a.useCallback)(e => (0, t.jsx)(U.f, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: u,
                children: e
            }), [u]), x = (0, a.useCallback)(e => (0, t.jsx)(U.f, {
                href: d,
                className: u,
                onClick: f,
                children: e
            }), [d, u, f]), P = (0, a.useMemo)(() => (0, t.jsx)("br", {}), []), C = (0, a.useCallback)((e, n) => {
                let r = (s(e, {
                        link: "",
                        hrefEnd: ""
                    }) || "").replaceAll(/{link}/g, "").replaceAll(/{hrefEnd}/g, ""),
                    i = r.split(/{aTagWithHref}|{aTagEnd}/),
                    o = e => {
                        let n = e.split(/{lineBreak}/);
                        return 1 === n.length ? e : (0, t.jsx)(t.Fragment, {
                            children: n.map((e, r) => {
                                let i = "linebreak-".concat(r, "-").concat(e.substring(0, 10));
                                return (0, t.jsxs)(a.Fragment, {
                                    children: [e, r < n.length - 1 && P]
                                }, i)
                            })
                        })
                    };
                return 3 === i.length ? (0, t.jsxs)(t.Fragment, {
                    children: [o(i[0]), n(i[1]), o(i[2])]
                }) : o(r)
            }, [s, P]);
            return (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(y.K, {
                    children: [(0, t.jsx)(y.F, {
                        className: "text-heading-small",
                        children: i.isGpcDetected ? s(E) || "" : s("Title.NoGpcDetected") || ""
                    }), (0, t.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!p) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: v
                                    }],
                                    t = {
                                        lineBreak: P
                                    };
                                return i.isGpcDetected ? m ? c(z, e, t) : c(M, e, t) : c(I, e, t)
                            }
                            if (!i.isGpcDetected) return h ? C("Body.GpcMissingSettingEligible", x) : c(I, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: P
                            });
                            if (m) return h ? C("Body.GpcDetectedSettingEnabledEligible", x) : c(z, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: P
                            });
                            let e = h ? {
                                tags: [{
                                    opening: "aTagWithHref",
                                    closing: "aTagEnd",
                                    content: x
                                }],
                                args: {
                                    lineBreak: P
                                }
                            } : {
                                tags: [{
                                    opening: "aTagStart",
                                    closing: "aTagEnd",
                                    content: v
                                }],
                                args: {
                                    lineBreak: P
                                }
                            };
                            if ("signal-with-changes" === i.scenario) return h ? C(k, x) : c(M, e.tags, e.args);
                            let t = h ? k : M;
                            return h ? C(t, x) : c(t, e.tags, e.args)
                        })()
                    })]
                }), (0, t.jsx)(y.c, {
                    className: "width-full",
                    children: (0, t.jsx)(b.f, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: l,
                        children: s("Action.Ok") || ""
                    })
                })]
            })
        },
        R = e => {
            let {
                inline: r = !1
            } = e, {
                translate: o,
                translateHTML: s
            } = (0, x.A)(), c = (0, x.z)(), l = (0, n.a)().preferences, u = (0, a.useRef)(null), g = (0, a.useRef)(!1), [h, f] = (0, a.useState)(!1), {
                classes: {
                    container: b
                }
            } = S(), {
                classes: U
            } = N(), A = (0, a.useCallback)(() => {
                if ("u" < typeof document) return {};
                let e = document.cookie.split("; ").find(e => e.startsWith("RBXcb="));
                if (!e) return {};
                let t = e.substring(6),
                    a = t;
                try {
                    a = decodeURIComponent(t)
                } catch (e) {}
                let n = {};
                return a.split("&").forEach(e => {
                    let [t, a] = e.split("=");
                    t && (n[t] = "true" === a)
                }), n
            }, []), [M, k] = (0, a.useState)({
                isGpcDetected: !1,
                initialGpcState: !1,
                hasUserMadeCookieChanges: !1,
                scenario: "no-signal"
            });
            (0, a.useEffect)(() => () => {
                u.current && u.current.cleanup()
            }, []), (0, a.useEffect)(() => {
                if (h && !g.current) {
                    let e = A();
                    u.current = new v(Object.keys(e).length > 0 ? e : l), g.current = !0, k(u.current.getGpcState())
                }
            }, [h, l, A]), (0, a.useEffect)(() => {
                if (u.current) {
                    let e = A(),
                        t = Object.keys(e).length > 0 ? e : l;
                    u.current.updateCookiePreferences(t);
                    let a = u.current.getGpcState();
                    k(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                }
            }, [l, A]), (0, a.useEffect)(() => {
                if (!u.current) return;
                let e = setInterval(() => {
                    if (u.current) {
                        let e = A(),
                            t = Object.keys(e).length > 0 ? e : l;
                        u.current.updateCookiePreferences(t);
                        let a = u.current.getGpcState();
                        k(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [l, A]);
            let {
                user: z
            } = (0, w.f)(), I = !!z, {
                data: R,
                isLoading: D
            } = (e => {
                let {
                    showModal: t,
                    gpcTrackerRef: a,
                    userSettingsApiBaseUrl: n,
                    apiGatewayBaseUrl: r,
                    isAuthenticated: o
                } = e;
                return (0, i.f)({
                    queryKey: ["yourPrivacyChoicesModal", t],
                    queryFn: async () => {
                        var e, t, i;
                        let s = null != (e = null == o ? void 0 : o()) && e,
                            c = null != (t = null == (i = a.current) ? void 0 : i.getGpcState()) ? t : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: l
                            } = c;
                        s && l && await p(n);
                        let u = !1;
                        if (s) try {
                            let {
                                access: e
                            } = await d(r, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            u = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let g = !1;
                        if (s) try {
                            let e = await m(n);
                            g = "Enabled" === e.allowSellShareData
                        } catch (e) {
                            console.error("Failed to get user settings:", e)
                        } else if ("u" > typeof document) {
                            let e = document.cookie.split("; ").find(e => e.trim().startsWith("RBXcb="));
                            if (e) {
                                let t = e.substring(6),
                                    a = t;
                                try {
                                    a = decodeURIComponent(t)
                                } catch (e) {}
                                let n = a.split("&"),
                                    r = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "GoogleAnalytics" === t && "true" === a
                                    }),
                                    i = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "RBXSource" === t && "true" === a
                                    });
                                (r || i) && (g = !0)
                            }
                        } return {
                            isGpcDetected: l,
                            canUserManageAdsSettings: u,
                            isAdsSellShareDataEnabled: g,
                            scenario: c.scenario
                        }
                    },
                    enabled: t,
                    gcTime: 0
                })
            })({
                showModal: h,
                gpcTrackerRef: u,
                userSettingsApiBaseUrl: (0, a.useMemo)(() => "".concat("https://apis.roblox.com", "/user-settings-api"), []),
                apiGatewayBaseUrl: (0, a.useMemo)(() => "https://apis.roblox.com", []),
                isAuthenticated: () => I
            }), H = (0, a.useMemo)(() => c.locale ? (0, x.f)(c.locale) : "en_us", [c.locale]), T = (0, a.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(H);
                return "https://www.roblox.com".concat(e)
            }, [H]), j = (0, a.useCallback)(e => {
                e.preventDefault(), f(!0)
            }, []), Q = (0, a.useCallback)(() => {
                f(!1)
            }, []), F = o("Label.YourPrivacyChoices") || "", O = (0, t.jsx)("button", {
                type: "button",
                onClick: j,
                style: {
                    display: "inline-flex",
                    alignItems: "center",
                    background: "none",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    color: "inherit"
                },
                children: (0, t.jsxs)(P.f, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [F, (0, t.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/dea85e59b76ad172160a6753a6bf9008dac07d11/assets", "/navigation/privacy_icon.png"),
                        alt: "",
                        style: {
                            marginLeft: "8px",
                            height: "16px",
                            width: "auto",
                            verticalAlign: "middle"
                        }
                    })]
                })
            });
            return (0, t.jsxs)(t.Fragment, {
                children: [r ? O : (0, t.jsx)(C.f, {
                    classes: {
                        root: b
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: O
                }), (0, t.jsx)(y.N, {
                    open: h,
                    onOpenChange: Q,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: o("Action.Close"),
                    children: (0, t.jsx)(y.d, {
                        children: D ? (0, t.jsxs)(y.K, {
                            children: [(0, t.jsx)(y.F, {
                                className: "text-heading-small",
                                children: o(E) || ""
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium",
                                children: o("Description.Loading") || ""
                            })]
                        }) : (0, t.jsx)(G, {
                            gpcState: M,
                            modalData: R,
                            translate: o,
                            translateHTML: s,
                            handleClose: Q,
                            privacyPreferencesUrl: T,
                            modalLinkClass: U.modalLink
                        })
                    })
                })]
            })
        };
    e.s(["default", 0, e => {
        let {
            inline: a = !1
        } = e;
        try {
            return (0, t.jsx)(R, {
                inline: a
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 86027, e => {
    "use strict";
    var t = e.i(118413),
        a = e.i(726474);
    let n = async e => a.dashboard.getServerManagementUrl(e, await (0, t.r)({
        universeId: e
    }));
    e.s(["Y", 0, e => e.includes("/observability/server-management"), "E", 0, n])
}]);

//# debugId=23bce802-ee20-7637-038e-b90aa5a0beeb
//# sourceMappingURL=3pu1hiix5tmdy.js.map