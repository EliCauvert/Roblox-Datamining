;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f47c837d-5938-14cc-6854-90ff9865b447")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 884367, e => {
    "use strict";
    var t = e.i(503434),
        i = e.i(746878),
        n = e.i(524586),
        r = e.i(752048),
        a = e.i(464627),
        l = e.i(335020),
        s = e.i(643766);
    let o = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        u = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        f = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        c = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        d = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        p = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        h = (0, s.forwardRef)((e, h) => {
            let {
                label: y,
                labelTooltip: v,
                leadingIconName: k,
                trailingIconName: m,
                leadingIconNode: w,
                trailingIconNode: L,
                hasError: g,
                error: A,
                helperText: b,
                size: R,
                variant: C = "Standard",
                isRequired: q,
                isDisabled: I,
                className: U,
                style: T,
                inputContainerClassName: B,
                inputContainerClassStyle: x,
                id: P,
                ...G
            } = e, S = (0, n.f)(), E = P || S, D = "".concat(E, "-description"), K = null != R ? R : "Large", j = g || !!A, O = A || b, M = (0, s.useMemo)(() => k ? s.default.createElement(i.f, {
                name: k,
                size: K,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : w, [k, w, K]), N = (0, s.useMemo)(() => m ? s.default.createElement(i.f, {
                name: m,
                size: K,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : L, [K, m, L]), H = y ? s.default.createElement("label", {
                htmlFor: E,
                className: (0, l.U)(d[K], "content-emphasis")
            }, y, q && s.default.createElement(s.default.Fragment, null, " ", s.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return s.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, l.U)("flex width-full flex-col gap-small ".concat(U), {
                    [t.f]: I
                }),
                style: T
            }, H && (v ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, H, s.default.createElement(r.f, v)) : H), s.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, l.U)("foundation-web-input flex items-center width-full", a.U[C], a.L[C], B, f[K], c[K], o[K], u[K], j ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: x
            }, M, s.default.createElement("input", {
                type: "text",
                id: E,
                ref: h,
                className: (0, l.U)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", p[K]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": j,
                "aria-describedby": O ? D : void 0,
                required: q,
                ...G,
                disabled: I
            }), N), O && s.default.createElement("span", {
                id: D,
                className: (0, l.U)("text-caption-small", {
                    "content-system-alert": j,
                    "content-default": !j
                })
            }, O))
        });
    h.displayName = "TextInput", e.s(["f", 0, h])
}, 967677, e => {
    "use strict";
    var t = e.i(225226),
        i = e.i(643766),
        n = e.i(231543),
        r = e.i(130933),
        a = e.i(179183),
        l = e.i(433659),
        s = e.i(365434),
        o = e.i(677484),
        u = e.i(785517),
        f = e.i(422166),
        c = e.i(268953);

    function d(e) {
        return (0, l.g)("MuiAlertTitle", e)
    }(0, o.g)("MuiAlertTitle", ["root"]);
    let p = ["className"],
        h = (0, s.s)(f.T, {
            name: "MuiAlertTitle",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e;
            return {
                fontWeight: t.typography.fontWeightMedium,
                marginTop: -2
            }
        }),
        y = i.forwardRef(function(e, t) {
            let i = (0, c.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: n
                } = i,
                r = (0, l._)(i, p),
                o = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, s.a)({
                        root: ["root"]
                    }, d, t)
                })(i);
            return (0, u.jsx)(h, (0, a._)({
                gutterBottom: !0,
                component: "div",
                ownerState: i,
                ref: t,
                className: (0, s.c)(o.root, n)
            }, r))
        });
    var v = (0, n.f)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        k = (0, i.forwardRef)(function(e, n) {
            var a = e.classes,
                l = e.className,
                s = (0, t.a)(e, ["classes", "className"]),
                o = v(void 0, {
                    props: {
                        classes: (0, r.f)(a, l)
                    }
                });
            return i.default.createElement(y, (0, t._)({}, s, {
                classes: o.classes,
                ref: n
            }))
        });
    e.s(["f", 0, k], 967677)
}, 944213, e => {
    "use strict";
    var t = e.i(537567);
    e.s(["f", () => t.N])
}, 956642, e => {
    "use strict";
    var t = e.i(869702);
    e.s(["f", () => t.kA])
}, 358763, e => {
    "use strict";
    var t = e.i(643766),
        i = e.i(296380);
    let n = () => {};
    e.s(["f", 0, function(e, r) {
        let {
            debounceDelay: a,
            intersectionObserverThreshold: l,
            resetOncePer: s
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, o = (0, t.useRef)(!1), u = (0, t.useCallback)(e => {
            !e || o.current || (o.current = !0, r())
        }, [r]), [f] = (0, i.U)(u, null != a ? a : 250), c = (0, t.useCallback)(e => {
            let [t] = e;
            f(t.isIntersecting)
        }, [f]), d = null != s ? s : "instance";
        (0, t.useMemo)(() => {
            "callback" === d && (o.current = !1)
        }, [r]), (0, t.useEffect)(() => {
            if (!e.current) return n;
            let t = new IntersectionObserver(c, {
                threshold: null != l ? l : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, l, c])
    }])
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["f", () => t.U])
}, 296380, e => {
    "use strict";
    var t = e.i(643766);
    let i = (e, i) => {
        let n = (0, t.useRef)(null),
            r = (0, t.useCallback)(() => {
                null !== n.current && (clearTimeout(n.current), n.current = null)
            }, [n]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, a = Array(t), l = 0; l < t; l++) a[l] = arguments[l];
            r(), n.current = window.setTimeout(() => {
                e(...a), n.current = null
            }, i)
        }, [e, i, r]), r, n]
    };
    e.s(["U", 0, i, "D", 0, i])
}, 198528, e => {
    "use strict";
    var t = e.i(643766),
        i = e.i(341260);
    e.s(["U", 0, (e, n) => {
        let r = (0, i.useRouter)(),
            a = r.query;
        return [(0, t.useMemo)(() => {
            let t = null != a ? a : {},
                i = {};
            for (let n of e) i[n] = t[n];
            return i
        }, [e, a]), (0, t.useCallback)(function(t) {
            var i;
            let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                l = null != (i = r.query) ? i : {},
                s = {
                    ...l
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let i = t[e];
                null == i ? delete s[e] : Array.isArray(i) ? s[e] = i.map(e => e.toString()) : s[e] = i.toString()
            }), Array.from(new Set([...Object.keys(l), ...Object.keys(s)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let i = Array.isArray(e) ? e : [e],
                    n = Array.isArray(t) ? t : [t];
                return i.length === n.length && i.every((e, t) => e === n[t])
            })(l[e], s[e])) || (a.skipHistory ? r.replace({
                pathname: r.pathname,
                query: s
            }) : r.push({
                pathname: r.pathname,
                query: s
            }, void 0, n))
        }, [r, e, n])]
    }, "j", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        return "" === t || null == t ? void 0 : t
    }])
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["f", () => t.U])
}, 338653, 441879, e => {
    "use strict";
    var t = e.i(415858),
        i = function(e, t) {
            return (i = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        i(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function r(e, t, i, n) {
        return new(i || (i = Promise))(function(r, a) {
            function l(e) {
                try {
                    o(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function s(e) {
                try {
                    o(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(l, s)
            }
            o((n = n.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var i, n, r, a = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return l.next = s(0), l.throw = s(1), l.return = s(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
            return this
        }), l;

        function s(s) {
            return function(o) {
                var u = [s, o];
                if (i) throw TypeError("Generator is already executing.");
                for (; l && (l = 0, u[0] && (a = 0)), a;) try {
                    if (i = 1, n && (r = 2 & u[0] ? n.return : u[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, u[1])).done) return r;
                    switch (n = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return a.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = a.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                a.label = u[1];
                                break
                            }
                            if (6 === u[0] && a.label < r[1]) {
                                a.label = r[1], r = u;
                                break
                            }
                            if (r && a.label < r[2]) {
                                a.label = r[2], a.ops.push(u);
                                break
                            }
                            r[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    u = t.call(e, a)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    i = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, t) {
        return null == e ? e : {
            universeId: e.universeId,
            universeName: e.universeName,
            rootPlaceId: e.rootPlaceId
        }
    }

    function s(e) {
        var i;
        return null == (i = e) ? i : {
            campaignName: i.campaignName,
            linkId: i.linkId,
            linkType: i.linkType,
            createdUtc: new Date(i.createdUtc),
            updatedUtc: new Date(i.updatedUtc),
            universe: (0, t.u)(i, "universe") ? l(i.universe) : void 0,
            referralCode: i.referralCode,
            referralCodeType: i.referralCodeType,
            launchData: (0, t.u)(i, "launchData") ? i.launchData : void 0,
            creatorKey: (0, t.u)(i, "creatorKey") ? i.creatorKey : void 0,
            creatorType: (0, t.u)(i, "creatorType") ? i.creatorType : void 0,
            fallbackType: (0, t.u)(i, "fallbackType") ? i.fallbackType : void 0
        }
    }

    function o(e) {
        if (void 0 !== e) return null === e ? null : {
            universeId: e.universeId,
            campaignName: e.campaignName,
            launchData: e.launchData,
            fallbackType: e.fallbackType
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            linkId: e.linkId,
            universeId: e.universeId,
            launchData: e.launchData,
            newOwnerId: e.newOwnerId,
            newOwnerType: e.newOwnerType,
            fallbackType: e.fallbackType
        }
    }

    function f(e, i) {
        return null == e ? e : {
            campaignName: e.campaignName,
            linkId: e.linkId,
            linkType: e.linkType,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            universe: (0, t.u)(e, "universe") ? l(e.universe) : void 0,
            referralCode: e.referralCode,
            referralCodeType: e.referralCodeType,
            launchData: (0, t.u)(e, "launchData") ? e.launchData : void 0,
            creatorKey: (0, t.u)(e, "creatorKey") ? e.creatorKey : void 0,
            creatorType: (0, t.u)(e, "creatorType") ? e.creatorType : void 0,
            fallbackType: (0, t.u)(e, "fallbackType") ? e.fallbackType : void 0
        }
    }

    function c(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorId: e.creatorId,
            creatorType: e.creatorType
        }
    }

    function p(e, i) {
        return null == e ? e : {
            experienceEventId: (0, t.u)(e, "experienceEventId") ? e.experienceEventId : void 0,
            launchData: (0, t.u)(e, "launchData") ? e.launchData : void 0
        }
    }

    function h(e, t) {
        return null == e ? e : {
            isEligibleToCreate: e.isEligibleToCreate,
            isAllowedToCreateForAnyExperience: e.isAllowedToCreateForAnyExperience
        }
    }

    function y(e) {
        return e
    }

    function v(e, i) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(s),
            totalCount: e.totalCount,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function k(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }
    var m = function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        return n(i, e), i.prototype.affiliateLinksCreateAffiliateLinkByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.w("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByUserRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.w("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByUser.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByUser = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksCreateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetCreatorMetadataByGroup.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links/metadata".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksGetCreatorMetadataByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByUserRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var i, n, r;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/metadata",
                                schemaPath: "/v1/links/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return r = a.sent(), [2, new t.H(r, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByUser = function(e) {
            return r(this, void 0, void 0, function() {
                return a(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.affiliateLinksGetCreatorMetadataByUserRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetEligibilityByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetEligibilityByGroup.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/eligibility",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetEligibilityByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksGetEligibilityByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetRequirementsByUserRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var i, n, r;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/requirements",
                                schemaPath: "/v1/links/requirements",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return r = a.sent(), [2, new t.H(r, function(e) {
                                return null == e ? e : {
                                    requirements: e.Requirements.map(y)
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetRequirementsByUser = function(e) {
            return r(this, void 0, void 0, function() {
                return a(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.affiliateLinksGetRequirementsByUserRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetUniverseEligibilityByIdRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling affiliateLinksGetUniverseEligibilityById.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/eligibility",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetUniverseEligibilityById = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksGetUniverseEligibilityByIdRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksListAffiliateLinksByGroup.");
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByUserRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByUser = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksListAffiliateLinksByUserRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksResolveAffiliateLinkByReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.w("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling affiliateLinksResolveAffiliateLinkByReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), r = {}, [4, this.request({
                                path: "/v1/links/resolve",
                                schemaPath: "/v1/links/resolve",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType,
                                    universeId: (0, t.u)(e, "universeId") ? e.universeId : void 0,
                                    experienceJoinData: (0, t.u)(e, "experienceJoinData") ? p(e.experienceJoinData) : void 0,
                                    joinData: (0, t.u)(e, "joinData") ? p(e.joinData) : void 0,
                                    fallbackType: (0, t.u)(e, "fallbackType") ? e.fallbackType : void 0,
                                    fallbackId: (0, t.u)(e, "fallbackId") ? e.fallbackId : void 0
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksResolveAffiliateLinkByReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksResolveAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByGroupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.w("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "PUT",
                                headers: r,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return k(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByGroup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByGroupRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByUserRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.w("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByUser.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "PUT",
                                headers: r,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return k(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByUser = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.affiliateLinksUpdateAffiliateLinkByUserRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i
    }(t._);
    (function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.eventsAuthenticatedVisitRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.eventsAuthenticatedVisitRequest || void 0 === e.eventsAuthenticatedVisitRequest) throw new t.w("eventsAuthenticatedVisitRequest", "Required parameter requestParameters.eventsAuthenticatedVisitRequest was null or undefined when calling eventsAuthenticatedVisit.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/authenticated-visit",
                                schemaPath: "/v1/events/authenticated-visit",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType,
                                        userDidLogIn: e.userDidLogIn
                                    }
                                }(e.eventsAuthenticatedVisitRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.V(l)]
                    }
                })
            })
        }, i.prototype.eventsAuthenticatedVisit = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.eventsAuthenticatedVisitRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignupRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.eventsPostQualifiedSignupRequest || void 0 === e.eventsPostQualifiedSignupRequest) throw new t.w("eventsPostQualifiedSignupRequest", "Required parameter requestParameters.eventsPostQualifiedSignupRequest was null or undefined when calling eventsPostQualifiedSignup.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/qualified-signup",
                                schemaPath: "/v1/events/qualified-signup",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        linkId: e.linkId,
                                        referralUrl: e.referralUrl,
                                        linkType: e.linkType
                                    }
                                }(e.eventsPostQualifiedSignupRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.V(l)]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignup = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.eventsPostQualifiedSignupRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }
    })(t._),
    function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest || void 0 === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest) throw new t.w("internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest", "Required parameter requestParameters.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest was null or undefined when calling internalAffiliateLinksCreateAffiliateLinkWithCustomCode.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/vanity",
                                schemaPath: "/v1/internal/links/vanity",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        campaignName: e.campaignName,
                                        creator: d(e.creator),
                                        vanityCode: e.vanityCode,
                                        launchData: e.launchData,
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return c(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksDeleteAffiliateLinkRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.w("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksDeleteAffiliateLink.");
                            return n = {}, r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/{linkId}".replace("{".concat("linkId", "}"), encodeURIComponent(String(e.linkId))),
                                schemaPath: "/v1/internal/links/{linkId}",
                                method: "DELETE",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.V(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksDeleteAffiliateLink = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksDeleteAffiliateLinkRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.w("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksGetAffiliateLinkForReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/share",
                                schemaPath: "/v1/internal/links/share",
                                method: "GET",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType
                                }
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.w("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            if (null === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest || void 0 === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest) throw new t.w("internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest", "Required parameter requestParameters.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/referral-code/{referralCode}".replace("{".concat("referralCode", "}"), encodeURIComponent(String(e.referralCode))),
                                schemaPath: "/v1/internal/links/referral-code/{referralCode}",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        launchData: e.launchData,
                                        creator: d(e.creator),
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return k(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.w("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkReferralCode.");
                            return n = {}, void 0 !== e.linkId && (n.linkId = e.linkId), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links",
                                schemaPath: "/v1/internal/links",
                                method: "PUT",
                                headers: r,
                                query: n
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.V(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCode = function(e, t) {
            return r(this, void 0, void 0, function() {
                return a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }
    }(t._),
    function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.privacyTaskWebhookEraseUserDataRaw = function(e, i) {
            return r(this, void 0, void 0, function() {
                var n, r, l;
                return a(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/erase-user-data",
                                schemaPath: "/v1/erase-user-data",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        privacyTaskId: e.privacyTaskId,
                                        userKey: e.userKey,
                                        userId: e.userId
                                    }
                                }(e.privacyTaskWebhookEraseUserDataRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return null == e ? e : {
                                    state: (0, t.u)(e, "state") ? e.state : void 0
                                }
                            })]
                    }
                })
            })
        }, i.prototype.privacyTaskWebhookEraseUserData = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), a(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.privacyTaskWebhookEraseUserDataRaw(e, t)];
                        case 1:
                            return [4, i.sent().value()];
                        case 2:
                            return [2, i.sent()]
                    }
                })
            })
        }
    }(t._), e.s(["M", 0, m, "y", 0, {
        Invalid: "Invalid",
        Profile: "Profile",
        Home: "Home"
    }, "q", 0, {
        Restricted: "Restricted",
        Email: "Email",
        Id: "Id",
        UserAgreement: "UserAgreement",
        ModerationStatus: "ModerationStatus",
        Payable: "Payable"
    }], 441879);
    let w = new m((0, e.i(272593).f)("affiliate-links", "bedev2"));
    e.s(["Q", 0, e => w.affiliateLinksCreateAffiliateLinkByUser({
        affiliateLinksCreateAffiliateLinkByUserRequest: e
    }), "V", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return w.affiliateLinksCreateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksCreateAffiliateLinkByUserRequest: i
        })
    }, "x", 0, e => w.affiliateLinksUpdateAffiliateLinkByUser({
        affiliateLinksUpdateAffiliateLinkByUserRequest: e
    }), "P", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return w.affiliateLinksUpdateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksUpdateAffiliateLinkByUserRequest: i
        })
    }, "p", 0, e => w.affiliateLinksListAffiliateLinksByUser(e), "q", 0, e => w.affiliateLinksListAffiliateLinksByGroup(e), "R", 0, e => w.affiliateLinksGetCreatorMetadataByGroup({
        groupId: e
    }), "Y", 0, e => w.affiliateLinksGetEligibilityByGroup({
        groupId: e
    }), "L", 0, () => w.affiliateLinksGetRequirementsByUser(), "y", 0, e => w.affiliateLinksGetUniverseEligibilityById({
        universeId: e
    }), "e", 0, () => w.affiliateLinksGetCreatorMetadataByUser()], 338653)
}]);

//# debugId=f47c837d-5938-14cc-6854-90ff9865b447
//# sourceMappingURL=1ptsp_acph619.js.map