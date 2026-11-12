;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3a162d7e-3e33-bd01-48f7-450b46341807")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 357667, e => {
    "use strict";
    var t = e.i(27213),
        i = e.i(94302),
        n = e.i(154570),
        r = e.i(397706),
        a = e.i(335020),
        l = e.i(643766),
        s = e.i(637068);
    let o = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        u = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        f = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        d = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        c = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        p = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        h = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        v = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        k = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        y = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        L = e => {
            let {
                iconName: t,
                node: i,
                size: r
            } = e;
            return null != t ? l.default.createElement(n.f, {
                name: t,
                size: o[r]
            }) : null != i ? l.default.createElement("span", {
                className: (0, a.U)("inline-flex items-center justify-center shrink-0", y[r])
            }, i) : null
        },
        w = (0, l.forwardRef)((e, n) => {
            var o;
            let {
                className: y,
                style: w,
                text: m,
                isDisabled: g = !1,
                size: b = "Medium",
                variant: A = "Standard",
                leadingIconName: R,
                leadingIconNode: C,
                trailingIconName: q,
                trailingIconNode: I,
                ...U
            } = e, T = (0, l.useContext)(r.f), P = null != (o = null == T ? void 0 : T.size) ? o : b, B = g || (null == T ? void 0 : T.isDisabled) || !1, x = null != R || null != C, G = null != q || null != I, S = (0, a.U)(B ? i.f : [t.Y, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", x ? d[P] : f[P], G ? p[P] : c[P], u[P], y), E = l.default.createElement(l.default.Fragment, null, l.default.createElement(t.v, null), l.default.createElement(L, {
                iconName: R,
                node: C,
                size: P
            }), l.default.createElement("span", {
                className: (0, a.U)("padding-y-xsmall text-no-wrap text-truncate-end", x && h[P], G && v[P])
            }, m), l.default.createElement(L, {
                iconName: q,
                node: I,
                size: P
            })), D = {
                textDecoration: "none",
                ...w
            };
            if (U.asChild) {
                let {
                    as: e,
                    asChild: t,
                    children: i,
                    ...r
                } = U, o = l.default.Children.only(i), u = e => {
                    e.preventDefault(), e.stopPropagation()
                };
                return l.default.createElement(s.M, {
                    ref: n,
                    ...r,
                    "aria-disabled": B || void 0,
                    tabIndex: B ? -1 : r.tabIndex,
                    onClickCapture: B ? u : r.onClickCapture,
                    onAuxClickCapture: B ? u : r.onAuxClickCapture,
                    className: (0, a.U)(S, k[A], "content-action-utility"),
                    style: D
                }, l.default.cloneElement(o, {}, E))
            }
            if ("a" === U.as) {
                let {
                    as: e,
                    href: t,
                    ...i
                } = U;
                return l.default.createElement("a", {
                    ref: n,
                    ...i,
                    "aria-disabled": B,
                    href: B ? void 0 : t,
                    className: (0, a.U)(S, k[A], "content-action-utility"),
                    style: D
                }, E)
            }
            let {
                as: K,
                isChecked: M,
                onCheckedChange: j,
                ...O
            } = U;
            return l.default.createElement("button", {
                ref: n,
                type: "button",
                ...O,
                className: (0, a.U)(M ? "bg-inverse-surface-0" : k[A], M ? "content-inverse-emphasis" : "content-action-utility", S),
                style: D,
                "aria-pressed": M,
                disabled: B,
                onClick: null == j ? void 0 : () => j(!M)
            }, E)
        });
    e.s(["f", 0, w])
}, 900496, e => {
    "use strict";
    var t = e.i(230699),
        i = e.i(719392),
        n = class extends t.f {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, i.T)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, i.T)(), super.getOptimisticResult(e)
            }
            fetchNextPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "forward"
                        }
                    }
                })
            }
            fetchPreviousPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "backward"
                        }
                    }
                })
            }
            createResult(e, t) {
                var n, r;
                let {
                    state: a
                } = e, l = super.createResult(e, t), {
                    isFetching: s,
                    isRefetching: o,
                    isError: u,
                    isRefetchError: f
                } = l, d = null == (r = a.fetchMeta) || null == (n = r.fetchMore) ? void 0 : n.direction, c = u && "forward" === d, p = s && "forward" === d, h = u && "backward" === d, v = s && "backward" === d;
                return {
                    ...l,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, i.B)(t, a.data),
                    hasPreviousPage: (0, i.u)(t, a.data),
                    isFetchNextPageError: c,
                    isFetchingNextPage: p,
                    isFetchPreviousPageError: h,
                    isFetchingPreviousPage: v,
                    isRefetchError: f && !c && !h,
                    isRefetching: o && !p && !v
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        r = e.i(154152);
    e.s(["f", 0, function(e, t) {
        return (0, r.f)(e, n, t)
    }], 900496)
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

    function d(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }

    function c(e) {
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

    function v(e) {
        return e
    }

    function k(e, i) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(s),
            totalCount: e.totalCount,
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function y(e, t) {
        return null == e ? e : {
            affiliateLink: f(e.affiliateLink)
        }
    }
    var L = function(e) {
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
                                return d(e)
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
                                return d(e)
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
                                    requirements: e.Requirements.map(v)
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
                                return k(e)
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
                                return k(e)
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
                                return y(e)
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
                                return y(e)
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
                                        creator: c(e.creator),
                                        vanityCode: e.vanityCode,
                                        launchData: e.launchData,
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return d(e)
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
                                        creator: c(e.creator),
                                        fallbackType: e.fallbackType
                                    }
                                }(e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest)
                            }, i)];
                        case 1:
                            return l = a.sent(), [2, new t.H(l, function(e) {
                                return y(e)
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
    }(t._), e.s(["M", 0, L, "y", 0, {
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
    let w = new L((0, e.i(272593).f)("affiliate-links", "bedev2"));
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

//# debugId=3a162d7e-3e33-bd01-48f7-450b46341807
//# sourceMappingURL=1i3xyu0jwop2e.js.map