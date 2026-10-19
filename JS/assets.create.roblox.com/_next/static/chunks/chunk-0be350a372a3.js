;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "64db14b7-88e8-fc96-36b3-39452cfc972b")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 358763, e => {
    "use strict";
    var t = e.i(416340),
        i = e.i(296380);
    let n = () => {};
    e.s(["default", 0, function(e, a) {
        let {
            debounceDelay: r,
            intersectionObserverThreshold: l,
            resetOncePer: s
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, o = (0, t.useRef)(!1), u = (0, t.useCallback)(e => {
            !e || o.current || (o.current = !0, a())
        }, [a]), [d] = (0, i.default)(u, null != r ? r : 250), f = (0, t.useCallback)(e => {
            let [t] = e;
            d(t.isIntersecting)
        }, [d]), c = null != s ? s : "instance";
        (0, t.useMemo)(() => {
            "callback" === c && (o.current = !1)
        }, [a]), (0, t.useEffect)(() => {
            if (!e.current) return n;
            let t = new IntersectionObserver(f, {
                threshold: null != l ? l : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, l, f])
    }])
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let i = (e, i) => {
        let n = (0, t.useRef)(null),
            a = (0, t.useCallback)(() => {
                null !== n.current && (clearTimeout(n.current), n.current = null)
            }, [n]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, r = Array(t), l = 0; l < t; l++) r[l] = arguments[l];
            a(), n.current = window.setTimeout(() => {
                e(...r), n.current = null
            }, i)
        }, [e, i, a]), a, n]
    };
    e.s(["default", 0, i, "useDebouncedFunction", 0, i])
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["useQueryParams", () => t.default])
}, 338653, 540459, e => {
    "use strict";
    var t = e.i(677753),
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

    function a(e, t, i, n) {
        return new(i || (i = Promise))(function(a, r) {
            function l(e) {
                try {
                    o(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    o(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof i ? t : new i(function(e) {
                    e(t)
                })).then(l, s)
            }
            o((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var i, n, a, r = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
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
                for (; l && (l = 0, u[0] && (r = 0)), r;) try {
                    if (i = 1, n && (a = 2 & u[0] ? n.return : u[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, u[1])).done) return a;
                    switch (n = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = r.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < a[1]) {
                                r.label = a[1], a = u;
                                break
                            }
                            if (a && r.label < a[2]) {
                                r.label = a[2], r.ops.push(u);
                                break
                            }
                            a[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    i = a = 0
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
            universe: (0, t.exists)(i, "universe") ? l(i.universe) : void 0,
            referralCode: i.referralCode,
            referralCodeType: i.referralCodeType,
            launchData: (0, t.exists)(i, "launchData") ? i.launchData : void 0,
            creatorKey: (0, t.exists)(i, "creatorKey") ? i.creatorKey : void 0,
            creatorType: (0, t.exists)(i, "creatorType") ? i.creatorType : void 0,
            fallbackType: (0, t.exists)(i, "fallbackType") ? i.fallbackType : void 0
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

    function d(e, i) {
        return null == e ? e : {
            campaignName: e.campaignName,
            linkId: e.linkId,
            linkType: e.linkType,
            createdUtc: new Date(e.createdUtc),
            updatedUtc: new Date(e.updatedUtc),
            universe: (0, t.exists)(e, "universe") ? l(e.universe) : void 0,
            referralCode: e.referralCode,
            referralCodeType: e.referralCodeType,
            launchData: (0, t.exists)(e, "launchData") ? e.launchData : void 0,
            creatorKey: (0, t.exists)(e, "creatorKey") ? e.creatorKey : void 0,
            creatorType: (0, t.exists)(e, "creatorType") ? e.creatorType : void 0,
            fallbackType: (0, t.exists)(e, "fallbackType") ? e.fallbackType : void 0
        }
    }

    function f(e, t) {
        return null == e ? e : {
            affiliateLink: d(e.affiliateLink)
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
            experienceEventId: (0, t.exists)(e, "experienceEventId") ? e.experienceEventId : void 0,
            launchData: (0, t.exists)(e, "launchData") ? e.launchData : void 0
        }
    }

    function m(e, t) {
        return null == e ? e : {
            isEligibleToCreate: e.isEligibleToCreate,
            isAllowedToCreateForAnyExperience: e.isAllowedToCreateForAnyExperience
        }
    }

    function h(e) {
        return e
    }

    function v(e, i) {
        return null == e ? e : {
            affiliateLinks: e.affiliateLinks.map(s),
            totalCount: e.totalCount,
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
        }
    }

    function y(e, t) {
        return null == e ? e : {
            affiliateLink: d(e.affiliateLink)
        }
    }
    var k = function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        return n(i, e), i.prototype.affiliateLinksCreateAffiliateLinkByGroupRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByGroup.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksCreateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksCreateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksCreateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksCreateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksCreateAffiliateLinkByUser.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "POST",
                                headers: a,
                                query: n,
                                body: o(e.affiliateLinksCreateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksCreateAffiliateLinkByUser = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetCreatorMetadataByGroup.");
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links/metadata".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links/metadata",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var i, n, a;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/metadata",
                                schemaPath: "/v1/links/metadata",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return a = r.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetCreatorMetadataByUser = function(e) {
            return a(this, void 0, void 0, function() {
                return r(this, function(t) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksGetEligibilityByGroup.");
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/eligibility".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/eligibility",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetEligibilityByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var i, n, a;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/links/requirements",
                                schemaPath: "/v1/links/requirements",
                                method: "GET",
                                headers: n,
                                query: i
                            }, e)];
                        case 1:
                            return a = r.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    requirements: e.Requirements.map(h)
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetRequirementsByUser = function(e) {
            return a(this, void 0, void 0, function() {
                return r(this, function(t) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling affiliateLinksGetUniverseEligibilityById.");
                            return n = {}, a = {}, [4, this.request({
                                path: "/v1/universes/{universeId}/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universes/{universeId}/eligibility",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    isEligible: e.IsEligible
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksGetUniverseEligibilityById = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksListAffiliateLinksByGroup.");
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), a = {}, [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.pageToken && (n.pageToken = e.pageToken), a = {}, [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksListAffiliateLinksByUser = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling affiliateLinksResolveAffiliateLinkByReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), a = {}, [4, this.request({
                                path: "/v1/links/resolve",
                                schemaPath: "/v1/links/resolve",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType,
                                    universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0,
                                    experienceJoinData: (0, t.exists)(e, "experienceJoinData") ? p(e.experienceJoinData) : void 0,
                                    joinData: (0, t.exists)(e, "joinData") ? p(e.joinData) : void 0,
                                    fallbackType: (0, t.exists)(e, "fallbackType") ? e.fallbackType : void 0,
                                    fallbackId: (0, t.exists)(e, "fallbackId") ? e.fallbackId : void 0
                                }
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksResolveAffiliateLinkByReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.groupId || void 0 === e.groupId) throw new t.RequiredError("groupId", "Required parameter requestParameters.groupId was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByGroup.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/groups/{groupId}/links".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                schemaPath: "/v1/groups/{groupId}/links",
                                method: "PUT",
                                headers: a,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByGroup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.affiliateLinksUpdateAffiliateLinkByUserRequest || void 0 === e.affiliateLinksUpdateAffiliateLinkByUserRequest) throw new t.RequiredError("affiliateLinksUpdateAffiliateLinkByUserRequest", "Required parameter requestParameters.affiliateLinksUpdateAffiliateLinkByUserRequest was null or undefined when calling affiliateLinksUpdateAffiliateLinkByUser.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/links",
                                schemaPath: "/v1/links",
                                method: "PUT",
                                headers: a,
                                query: n,
                                body: u(e.affiliateLinksUpdateAffiliateLinkByUserRequest)
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.affiliateLinksUpdateAffiliateLinkByUser = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
    }(t.BaseAPI);
    (function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.eventsAuthenticatedVisitRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsAuthenticatedVisitRequest || void 0 === e.eventsAuthenticatedVisitRequest) throw new t.RequiredError("eventsAuthenticatedVisitRequest", "Required parameter requestParameters.eventsAuthenticatedVisitRequest was null or undefined when calling eventsAuthenticatedVisit.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/authenticated-visit",
                                schemaPath: "/v1/events/authenticated-visit",
                                method: "POST",
                                headers: a,
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
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.eventsAuthenticatedVisit = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.eventsAuthenticatedVisitRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignupRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventsPostQualifiedSignupRequest || void 0 === e.eventsPostQualifiedSignupRequest) throw new t.RequiredError("eventsPostQualifiedSignupRequest", "Required parameter requestParameters.eventsPostQualifiedSignupRequest was null or undefined when calling eventsPostQualifiedSignup.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/events/qualified-signup",
                                schemaPath: "/v1/events/qualified-signup",
                                method: "POST",
                                headers: a,
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
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.eventsPostQualifiedSignup = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.eventsPostQualifiedSignupRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }
    })(t.BaseAPI),
    function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest || void 0 === e.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest) throw new t.RequiredError("internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest", "Required parameter requestParameters.internalAffiliateLinksCreateAffiliateLinkWithCustomCodeRequest was null or undefined when calling internalAffiliateLinksCreateAffiliateLinkWithCustomCode.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/vanity",
                                schemaPath: "/v1/internal/links/vanity",
                                method: "POST",
                                headers: a,
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
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksCreateAffiliateLinkWithCustomCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksDeleteAffiliateLink.");
                            return n = {}, a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/{linkId}".replace("{".concat("linkId", "}"), encodeURIComponent(String(e.linkId))),
                                schemaPath: "/v1/internal/links/{linkId}",
                                method: "DELETE",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksDeleteAffiliateLink = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksDeleteAffiliateLinkRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCodeRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksGetAffiliateLinkForReferralCode.");
                            return n = {}, void 0 !== e.referralCode && (n.referralCode = e.referralCode), a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/share",
                                schemaPath: "/v1/internal/links/share",
                                method: "GET",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    linkId: e.linkId,
                                    linkType: e.linkType
                                }
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksGetAffiliateLinkForReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.referralCode || void 0 === e.referralCode) throw new t.RequiredError("referralCode", "Required parameter requestParameters.referralCode was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            if (null === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest || void 0 === e.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest) throw new t.RequiredError("internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest", "Required parameter requestParameters.internalAffiliateLinksUpdateAffiliateLinkByReferralCodeRequest was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkByReferralCode.");
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links/referral-code/{referralCode}".replace("{".concat("referralCode", "}"), encodeURIComponent(String(e.referralCode))),
                                schemaPath: "/v1/internal/links/referral-code/{referralCode}",
                                method: "PATCH",
                                headers: a,
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
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkByReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
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
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.linkId || void 0 === e.linkId) throw new t.RequiredError("linkId", "Required parameter requestParameters.linkId was null or undefined when calling internalAffiliateLinksUpdateAffiliateLinkReferralCode.");
                            return n = {}, void 0 !== e.linkId && (n.linkId = e.linkId), a = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/links",
                                schemaPath: "/v1/internal/links",
                                method: "PUT",
                                headers: a,
                                query: n
                            }, i)];
                        case 1:
                            return l = r.sent(), [2, new t.VoidApiResponse(l)]
                    }
                })
            })
        }, i.prototype.internalAffiliateLinksUpdateAffiliateLinkReferralCode = function(e, t) {
            return a(this, void 0, void 0, function() {
                return r(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return [4, this.internalAffiliateLinksUpdateAffiliateLinkReferralCodeRaw(e, t)];
                        case 1:
                            return i.sent(), [2]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function i() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(i, e), i.prototype.privacyTaskWebhookEraseUserDataRaw = function(e, i) {
            return a(this, void 0, void 0, function() {
                var n, a, l;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (a["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/erase-user-data",
                                schemaPath: "/v1/erase-user-data",
                                method: "POST",
                                headers: a,
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
                            return l = r.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return null == e ? e : {
                                    state: (0, t.exists)(e, "state") ? e.state : void 0
                                }
                            })]
                    }
                })
            })
        }, i.prototype.privacyTaskWebhookEraseUserData = function() {
            return a(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(i) {
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
    }(t.BaseAPI), e.s(["AffiliateLinksApi", 0, k, "FallbackType", 0, {
        Invalid: "Invalid",
        Profile: "Profile",
        Home: "Home"
    }, "Requirements", 0, {
        Restricted: "Restricted",
        Email: "Email",
        Id: "Id",
        UserAgreement: "UserAgreement",
        ModerationStatus: "ModerationStatus",
        Payable: "Payable"
    }], 540459);
    let g = new k((0, e.i(272593).createClientConfiguration)("affiliate-links", "bedev2"));
    e.s(["createAffiliateLink", 0, e => g.affiliateLinksCreateAffiliateLinkByUser({
        affiliateLinksCreateAffiliateLinkByUserRequest: e
    }), "createGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return g.affiliateLinksCreateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksCreateAffiliateLinkByUserRequest: i
        })
    }, "editAffiliateLink", 0, e => g.affiliateLinksUpdateAffiliateLinkByUser({
        affiliateLinksUpdateAffiliateLinkByUserRequest: e
    }), "editGroupAffiliateLink", 0, e => {
        let {
            groupId: t,
            ...i
        } = e;
        return g.affiliateLinksUpdateAffiliateLinkByGroup({
            groupId: t,
            affiliateLinksUpdateAffiliateLinkByUserRequest: i
        })
    }, "getAffiliateLinks", 0, e => g.affiliateLinksListAffiliateLinksByUser(e), "getGroupAffiliateLinks", 0, e => g.affiliateLinksListAffiliateLinksByGroup(e), "getGroupCreatorMetadata", 0, e => g.affiliateLinksGetCreatorMetadataByGroup({
        groupId: e
    }), "getGroupEligibility", 0, e => g.affiliateLinksGetEligibilityByGroup({
        groupId: e
    }), "getRequirements", 0, () => g.affiliateLinksGetRequirementsByUser(), "getUniverseEligibility", 0, e => g.affiliateLinksGetUniverseEligibilityById({
        universeId: e
    }), "getUserCreatorMetadata", 0, () => g.affiliateLinksGetCreatorMetadataByUser()], 338653)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        i = e.i(78892),
        n = e.i(723570),
        a = e => {
            var a, l, s;
            let o, u, {
                    present: d,
                    children: f
                } = e,
                c = function(e) {
                    var i, a;
                    let [l, s] = t.useState(), o = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [f, c] = (i = e ? "mounted" : "unmounted", a = {
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
                    }, t.useReducer((e, t) => {
                        let i = a[e][t];
                        return null != i ? i : e
                    }, i));
                    return t.useEffect(() => {
                        let e = r(o.current);
                        d.current = "mounted" === f ? e : "none"
                    }, [f]), (0, n.useLayoutEffect)(() => {
                        let t = o.current,
                            i = u.current;
                        if (i !== e) {
                            let n = d.current,
                                a = r(t);
                            e ? c("MOUNT") : "none" === a || (null == t ? void 0 : t.display) === "none" ? c("UNMOUNT") : i && n !== a ? c("ANIMATION_OUT") : c("UNMOUNT"), u.current = e
                        }
                    }, [e, c]), (0, n.useLayoutEffect)(() => {
                        if (l) {
                            var e;
                            let t, i = null != (e = l.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = r(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === l && n && (c("ANIMATION_END"), !u.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = i.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                a = e => {
                                    e.target === l && (d.current = r(o.current))
                                };
                            return l.addEventListener("animationstart", a), l.addEventListener("animationcancel", n), l.addEventListener("animationend", n), () => {
                                i.clearTimeout(t), l.removeEventListener("animationstart", a), l.removeEventListener("animationcancel", n), l.removeEventListener("animationend", n)
                            }
                        }
                        c("ANIMATION_END")
                    }, [l, c]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(d),
                p = "function" == typeof f ? f({
                    present: c.isPresent
                }) : t.Children.only(f),
                m = (0, i.useComposedRefs)(c.ref, (u = (o = null == (l = Object.getOwnPropertyDescriptor((a = p).props, "ref")) ? void 0 : l.get) && "isReactWarning" in o && o.isReactWarning) ? a.ref : (u = (o = null == (s = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? a.props.ref : a.props.ref || a.ref);
            return "function" == typeof f || c.isPresent ? t.cloneElement(p, {
                ref: m
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    a.displayName = "Presence", e.s(["Presence", 0, a])
}, 904451, e => {
    "use strict";
    var t = e.i(140625),
        i = e.i(408832),
        n = e.i(197649),
        a = e.i(416340),
        r = e.i(78892),
        l = e.i(608652),
        s = e.i(174617),
        o = e.i(199786),
        u = e.i(300792),
        d = e.i(692166),
        f = e.i(169525),
        c = e.i(600317),
        p = e.i(221628),
        m = "Checkbox",
        [h, v] = (0, l.createContextScope)(m),
        [y, k] = h(m);

    function g(e) {
        let {
            __scopeCheckbox: t,
            checked: i,
            children: n,
            defaultChecked: r,
            disabled: l,
            form: s,
            name: u,
            onCheckedChange: d,
            required: f,
            value: c = "on",
            internal_do_not_use_render: h
        } = e, [v, k] = (0, o.useControllableState)({
            prop: i,
            defaultProp: null != r && r,
            onChange: d,
            caller: m
        }), [g, b] = a.useState(null), [w, L] = a.useState(null), R = a.useRef(!1), A = !g || !!s || !!g.closest("form"), x = {
            checked: v,
            disabled: l,
            setChecked: k,
            control: g,
            setControl: b,
            name: u,
            form: s,
            value: c,
            hasConsumerStoppedPropagationRef: R,
            required: f,
            defaultChecked: !I(r) && r,
            isFormControl: A,
            bubbleInput: w,
            setBubbleInput: L
        };
        return (0, p.jsx)(y, {
            scope: t,
            ...x,
            children: "function" == typeof h ? h(x) : n
        })
    }
    var b = "CheckboxTrigger",
        w = a.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                onKeyDown: n,
                onClick: l,
                ...o
            } = e, {
                control: u,
                value: d,
                disabled: f,
                checked: m,
                required: h,
                setControl: v,
                setChecked: y,
                hasConsumerStoppedPropagationRef: g,
                isFormControl: w,
                bubbleInput: L
            } = k(b, i), R = (0, r.useComposedRefs)(t, v), A = a.useRef(m);
            return a.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => y(A.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, y]), (0, p.jsx)(c.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": I(m) ? "mixed" : m,
                "aria-required": h,
                "data-state": q(m),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: d,
                ...o,
                ref: R,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(l, e => {
                    y(e => !!I(e) || !e), L && w && (g.current = e.isPropagationStopped(), g.current || e.stopPropagation())
                })
            })
        });
    w.displayName = b;
    var L = a.forwardRef((e, t) => {
        let {
            __scopeCheckbox: i,
            name: n,
            checked: a,
            defaultChecked: r,
            required: l,
            disabled: s,
            value: o,
            onCheckedChange: u,
            form: d,
            ...f
        } = e;
        return (0, p.jsx)(g, {
            __scopeCheckbox: i,
            checked: a,
            defaultChecked: r,
            disabled: s,
            required: l,
            onCheckedChange: u,
            name: n,
            form: d,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, p.jsxs)(p.Fragment, {
                    children: [(0, p.jsx)(w, {
                        ...f,
                        ref: t,
                        __scopeCheckbox: i
                    }), n && (0, p.jsx)(C, {
                        __scopeCheckbox: i
                    })]
                })
            }
        })
    });
    L.displayName = m;
    var R = "CheckboxIndicator",
        A = a.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                forceMount: n,
                ...a
            } = e, r = k(R, i);
            return (0, p.jsx)(f.Presence, {
                present: n || I(r.checked) || !0 === r.checked,
                children: (0, p.jsx)(c.Primitive.span, {
                    "data-state": q(r.checked),
                    "data-disabled": r.disabled ? "" : void 0,
                    ...a,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    A.displayName = R;
    var x = "CheckboxBubbleInput",
        C = a.forwardRef((e, t) => {
            let {
                __scopeCheckbox: i,
                ...n
            } = e, {
                control: l,
                hasConsumerStoppedPropagationRef: s,
                checked: o,
                defaultChecked: f,
                required: m,
                disabled: h,
                name: v,
                value: y,
                form: g,
                bubbleInput: b,
                setBubbleInput: w
            } = k(x, i), L = (0, r.useComposedRefs)(t, w), R = (0, u.usePrevious)(o), A = (0, d.useSize)(l);
            a.useEffect(() => {
                if (!b) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (R !== o && e) {
                    let i = new Event("click", {
                        bubbles: t
                    });
                    b.indeterminate = I(o), e.call(b, !I(o) && o), b.dispatchEvent(i)
                }
            }, [b, R, o, s]);
            let C = a.useRef(!I(o) && o);
            return (0, p.jsx)(c.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != f ? f : C.current,
                required: m,
                disabled: h,
                name: v,
                value: y,
                form: g,
                ...n,
                tabIndex: -1,
                ref: L,
                style: {
                    ...n.style,
                    ...A,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function I(e) {
        return "indeterminate" === e
    }

    function q(e) {
        return I(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    C.displayName = x;
    let T = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        E = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        U = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        S = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: r,
            className: l,
            isChecked: s,
            isDisabled: o,
            size: u,
            hint: d,
            placement: f,
            onCheckedChange: c,
            id: p,
            ...m
        } = e, h = (0, i.default)(), v = p || h, y = r && a.default.createElement("label", {
            htmlFor: v,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, a.default.createElement("span", {
            className: (0, n.default)(U[u], S[u], "content-emphasis")
        }, r), d && a.default.createElement("span", {
            className: "text-body-medium content-default"
        }, d));
        return a.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", l)
        }, "End" === f && y, a.default.createElement("div", {
            className: (0, n.default)(E[u])
        }, a.default.createElement(L, {
            "data-slot": "checkbox",
            className: (0, n.default)(T[u], t.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: s,
            disabled: o,
            onCheckedChange: c,
            "aria-label": r,
            ...m
        }, a.default.createElement(t.StateLayer, null), a.default.createElement(A, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(T[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === f && y)
    }], 904451)
}, 369114, e => {
    "use strict";
    var t = e.i(75584),
        i = e.i(659332),
        n = e.i(197649),
        a = e.i(416340);
    let r = (0, a.createContext)(null),
        l = e => {
            let t = (0, a.useContext)(r);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        s = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        o = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        u = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        d = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        f = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        c = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        p = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        m = (0, a.forwardRef)((e, t) => {
            let {
                children: i,
                size: l = "Medium",
                variant: s = "Divided",
                className: o,
                ...u
            } = e, d = (0, a.useMemo)(() => ({
                size: l,
                variant: s
            }), [l, s]), f = "Framed" === s;
            return a.default.createElement(r.Provider, {
                value: d
            }, a.default.createElement("div", {
                className: (0, n.default)("width-full bg-surface-100", f && "radius-medium clip stroke-standard stroke-default")
            }, a.default.createElement("table", {
                ref: t,
                className: (0, n.default)("foundation-web-table width-full content-default", o),
                ...u
            }, i)))
        });
    m.displayName = "Table";
    let h = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            ...s
        } = e;
        return l("TableHeader"), a.default.createElement("thead", {
            ref: t,
            className: (0, n.default)("foundation-web-table-header", r),
            ...s
        }, i)
    });
    h.displayName = "TableHeader";
    let v = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            ...s
        } = e;
        return l("TableBody"), a.default.createElement("tbody", {
            ref: t,
            className: (0, n.default)("foundation-web-table-body", r),
            ...s
        }, i)
    });
    v.displayName = "TableBody";
    let y = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            isInteractive: s = !1,
            isHoverable: o = !1,
            isSelected: u = !1,
            isDisabled: d = !1,
            onClick: f,
            onKeyDown: c,
            tabIndex: p,
            role: m,
            ...h
        } = e;
        l("TableRow");
        let v = s ? {
            role: null != m ? m : "row",
            tabIndex: null != p ? p : 0,
            onClick: d ? void 0 : f,
            onKeyDown: e => {
                d || (null == c || c(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == f || f(e)))
            }
        } : {
            role: m,
            tabIndex: p,
            onClick: f,
            onKeyDown: c
        };
        return a.default.createElement("tr", {
            ref: t,
            "aria-selected": s ? u : void 0,
            "aria-disabled": !!s && !!d || void 0,
            "data-selected": u || void 0,
            className: (0, n.default)("foundation-web-table-row", (s || o) && "hover:bg-shift-100", s && !d && "cursor-pointer", s && d && "opacity-disabled pointer-events-none", u && "bg-shift-200", r),
            ...v,
            ...h
        }, i)
    });
    y.displayName = "TableRow";
    let k = (0, a.forwardRef)((e, i) => {
        let {
            children: r,
            className: s,
            sortDirection: f,
            onSort: m,
            align: h = "start",
            sortLabel: v,
            scope: y,
            ...k
        } = e, {
            size: g
        } = l("TableHeaderCell"), b = !!m, w = null != f ? f : "none", L = b && "none" !== w && a.default.createElement(t.Icon, {
            name: "ascending" === w ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), R = a.default.createElement("div", {
            className: (0, n.default)("flex items-center gap-xsmall", d[g], "content-muted", p[h])
        }, "end" === h && L, a.default.createElement("span", {
            className: "text-truncate-end"
        }, r), "end" !== h && L), A = "string" == typeof r ? "Sort by ".concat(r) : void 0;
        return a.default.createElement("th", {
            ref: i,
            scope: null != y ? y : "col",
            "aria-sort": b ? w : void 0,
            className: (0, n.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", u[g], o[g], c[h], "content-muted", s),
            ...k
        }, b ? a.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: m,
            "aria-label": null != v ? v : A
        }, R) : R)
    });
    k.displayName = "TableHeaderCell";
    let g = (0, a.forwardRef)((e, t) => {
        let {
            children: i,
            className: r,
            align: u = "start",
            ...d
        } = e, {
            size: p
        } = l("TableCell");
        return a.default.createElement("td", {
            ref: t,
            className: (0, n.default)("foundation-web-table-cell foundation-web-table-row-divider", s[p], o[p], f[p], c[u], "content-default", r),
            ...d
        }, i)
    });
    g.displayName = "TableCell";
    let b = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        w = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        L = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        R = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        A = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        x = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        C = (0, a.forwardRef)((e, t) => {
            let {
                size: r = "Medium",
                page: l,
                rowsPerPage: s,
                totalRows: o,
                rowsPerPageOptions: u = [10, 25, 50],
                onPageChange: d,
                onRowsPerPageChange: f,
                rowsPerPageLabel: c = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: m = "Previous page",
                nextPageLabel: h = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: y,
                className: k,
                ...g
            } = e, C = Math.max(1, Math.ceil(o / s)), I = 0 === l, q = l >= C - 1, T = 0 === o ? 0 : l * s + 1, E = Math.min((l + 1) * s, o), U = (0, a.useCallback)(e => {
                let t = Number(e.target.value);
                null == f || f(t), d(0)
            }, [f, d]), S = x[r];
            return a.default.createElement("div", {
                ref: t,
                className: (0, n.default)("flex items-center justify-end", b[r], w[r], k),
                ...g
            }, a.default.createElement("div", {
                className: "flex items-center gap-large"
            }, a.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, f && a.default.createElement("div", {
                className: "flex items-center gap-small"
            }, a.default.createElement("span", {
                className: (0, n.default)(L[r], "content-default")
            }, c), a.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, a.default.createElement("select", {
                className: (0, n.default)("foundation-web-table-pagination-select", L[r], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === r ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: s,
                onChange: U,
                "aria-label": c
            }, u.map(e => a.default.createElement("option", {
                key: e,
                value: e
            }, e))))), a.default.createElement("span", {
                className: (0, n.default)(R[r], "content-default")
            }, y ? y(T, E, o) : "".concat(T, "-").concat(E, " of ").concat(o))), a.default.createElement("div", {
                className: (0, n.default)("flex items-center", A[r])
            }, a.default.createElement(i.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: p,
                size: S,
                variant: "Utility",
                isDisabled: I,
                onClick: () => d(0)
            }), a.default.createElement(i.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: m,
                size: S,
                variant: "Utility",
                isDisabled: I,
                onClick: () => d(l - 1)
            }), a.default.createElement(i.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: h,
                size: S,
                variant: "Utility",
                isDisabled: q,
                onClick: () => d(l + 1)
            }), a.default.createElement(i.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: v,
                size: S,
                variant: "Utility",
                isDisabled: q,
                onClick: () => d(C - 1)
            }))))
        });
    C.displayName = "TablePagination", e.s(["Table", 0, m, "TableBody", 0, v, "TableCell", 0, g, "TableHeader", 0, h, "TableHeaderCell", 0, k, "TablePagination", 0, C, "TableRow", 0, y])
}, 395203, e => {
    "use strict";
    var t = e.i(603955),
        i = e.i(75584),
        n = e.i(408832),
        a = e.i(148380),
        r = e.i(750615),
        l = e.i(197649),
        s = e.i(416340);
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
        d = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        f = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        c = {
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
        m = (0, s.forwardRef)((e, m) => {
            let {
                label: h,
                labelTooltip: v,
                leadingIconName: y,
                trailingIconName: k,
                leadingIconNode: g,
                trailingIconNode: b,
                hasError: w,
                error: L,
                helperText: R,
                size: A,
                variant: x = "Standard",
                isRequired: C,
                isDisabled: I,
                className: q,
                style: T,
                inputContainerClassName: E,
                inputContainerClassStyle: U,
                id: S,
                ...B
            } = e, P = (0, n.default)(), N = S || P, G = "".concat(N, "-description"), O = null != A ? A : "Large", M = w || !!L, D = L || R, j = (0, s.useMemo)(() => y ? s.default.createElement(i.Icon, {
                name: y,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : g, [y, g, O]), K = (0, s.useMemo)(() => k ? s.default.createElement(i.Icon, {
                name: k,
                size: O,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : b, [O, k, b]), X = h ? s.default.createElement("label", {
                htmlFor: N,
                className: (0, l.default)(c[O], "content-emphasis")
            }, h, C && s.default.createElement(s.default.Fragment, null, " ", s.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return s.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, l.default)("flex width-full flex-col gap-small ".concat(q), {
                    [t.disabledOpacity]: I
                }),
                style: T
            }, X && (v ? s.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, X, s.default.createElement(a.LabelTooltip, v)) : X), s.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, l.default)("foundation-web-input flex items-center width-full", r.INPUT_STROKE_BY_VARIANT[x], r.INPUT_BACKGROUND_BY_VARIANT[x], E, d[O], f[O], o[O], u[O], M ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: U
            }, j, s.default.createElement("input", {
                type: "text",
                id: N,
                ref: m,
                className: (0, l.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", p[O]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": M,
                "aria-describedby": D ? G : void 0,
                required: C,
                ...B,
                disabled: I
            }), K), D && s.default.createElement("span", {
                id: G,
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": M,
                    "content-default": !M
                })
            }, D))
        });
    m.displayName = "TextInput", e.s(["TextInput", 0, m])
}]);

//# debugId=64db14b7-88e8-fc96-36b3-39452cfc972b
//# sourceMappingURL=0vbhz1u9wjp7j.js.map